#pragma language glsl3
// TRM 5UA_100_heat_follow 扩散光环 —— 程序化版本(纯色,三阶段)
// 参考:asset/game_scene/characters/TRM/texture/_IMG/move_VFX/5UA_100_heat_follow_ease_arua
//
// 结构:
//   · 纯色:输出 vec4(tint, alpha),没有内部纹理;分形噪波只用来决定形状(alpha)
//   · 形状 = 外径圆盘 ∩ 内径圆洞,两条边都被同一个分形噪波 N 扭曲:
//       val_outer = (outer_radius - r) * shape + N     (> 0 = 在外径里面)
//       val_inner = (r - inner_radius) * shape + N     (> 0 = 在内洞外面)
//     inner_radius 为负时洞还没破开(N 最低处都够不到圆心),变大后从中心往外吃掉光环
//   · 从内向外运动:噪波坐标按 2 倍一周期不停放大(features 从圆心往外跑),
//     两层相差半个周期交叉淡入淡出,接缝处换种子,所以可以无限循环;
//     混合后按权重归一化,噪波强度不随时间起伏
//   · domain warp 以 churn_speed 缓慢翻滚,轮廓一直在变形
//   · 阶段(ease_in / loop / ease_out)、半径、不透明度都由 Lua 每 tick 算好送进来,
//     不透明度走 love.graphics.setColor 的 alpha
//
// 坐标约定:shader 画在 1x1 白图上,Lua 把它拉伸成以光环中心为中心、半边长 area_half 的正方形,
//   texture_coords 0..1 对应 -area_half .. area_half,y 向下为正。
//   长度类参数以 unit 世界单位为 1.0(原序列帧一帧的半边 = 1.0)。
// 时间单位:tick(60 tick = 1 秒),只增不跳。
// 参数在 left.lua / right.lua 的 config_game_scene_LP / RP["5UA_100_heat_follow_arua"]["shader"] 里。

// ---------------- 每帧由 Lua 送进来 ----------------
extern float time;              // 连续时间(tick)
extern vec2 noise_offset;       // 每次释放随机的噪波偏移
extern float outer_radius;      // 当前外径
extern float inner_radius;      // 当前内径(负 = 还没有洞)

// ---------------- 绘制范围 ----------------
extern float area_half;         // 绘制正方形的半边长(要盖住最大外径 + 噪波扩出去的部分)

// ---------------- 运动 ----------------
extern float flow_speed;        // 从内向外运动的速度(半径 1.0 处每 tick 走多远)
extern float churn_speed;       // 轮廓翻滚速度(每 tick)

// ---------------- domain warp ----------------
extern float warp_scale;        // warp 噪波频率
extern float warp_octaves;      // warp 噪波复杂度(层数 1-8,可以是小数)
extern float warp_strength;     // warp 强度:越大轮廓越卷

// ---------------- 形状噪波 ----------------
extern float noise_scale;       // 细节噪波频率:越大碎片越细
extern float noise_octaves;     // 细节噪波复杂度(层数 1-8,可以是小数)
extern float noise_roughness;   // 细节噪波每层衰减:越大边缘越毛糙
extern float noise_contrast;    // 细节噪波强度:越大边缘外的碎块越多
extern float edge_distort;      // 大块轮廓起伏幅度(半径单位)
extern float edge_scale;        // 大块轮廓噪波频率
extern float edge_octaves;      // 大块轮廓噪波复杂度
extern float edge_roughness;    // 大块轮廓噪波每层衰减

// ---------------- alpha ----------------
extern float shape;             // 边缘陡度:越大噪波相对越弱、轮廓越接近圆
extern float edge_softness;     // 边缘过渡宽度:越大越软(>0)

// ---------------- 颜色 ----------------
extern vec3 tint;               // 纯色(RGB 0-1)

const float LN2 = 0.6931472;

// 格点哈希(整数运算):输入是整数格点坐标(value_noise 里 floor 的结果 + 0 / 1),输出 0..1
// 旧版用浮点 fract 链(fract(p * 0.1031) ...),对输入的最后几位非常敏感;GPU 编译器会把
// hash12(i + vec2(0.0, 1.0)) 重排成 fract(i * 0.1031 + 0.1031) 之类的形式,同一个格点在相邻两个格子里
// 算出不同的值,噪波沿格线断开 → 粒子里出现一像素宽、沿格线的水平 / 垂直直线(有概率出现)。
// 整数运算对同一个格点永远得到同一个结果,不受编译器重排影响。
float hash12(vec2 p) {
    uvec2 q = uvec2(ivec2(floor(p + 0.5)));
    uint h = q.x * 1597334677u ^ q.y * 3812015801u;
    h ^= h >> 16u;
    h *= 2246822519u;
    h ^= h >> 13u;
    h *= 3266489917u;
    h ^= h >> 16u;
    return float(h >> 8u) * (1.0 / 16777216.0);
}

float value_noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    vec2 u = f * f * (3.0 - 2.0 * f);
    float a = hash12(i);
    float b = hash12(i + vec2(1.0, 0.0));
    float c = hash12(i + vec2(0.0, 1.0));
    float d = hash12(i + vec2(1.0, 1.0));
    return a + (b - a) * u.x + (c - a) * u.y + (a - b - c + d) * u.x * u.y;
}

// octaves 最多 8 层,小数部分让最后一层按比例加入
float fbm(vec2 p, float octaves, float gain) {
    float v = 0.0;
    float a = 0.5;
    float total = 0.0;
    mat2 m = mat2(1.6, -1.2, 1.2, 1.6);
    for (int i = 0; i < 8; i++) {
        float w = clamp(octaves - float(i), 0.0, 1.0);
        if (w <= 0.0) break;
        v += a * w * value_noise(p);
        total += a * w;
        p = m * p + vec2(17.3, 9.1);
        a *= gain;
    }
    return v / max(total, 1.0e-4);
}

// 一层往外放大的分形噪波(中心化,均值约 0);weight = 这一层的交叉淡入淡出权重
float layer_noise(vec2 p, float cycles, float shift, out float weight) {
    float c = cycles + shift;
    float cycle = floor(c);
    float ph = c - cycle;
    weight = 1.0 - abs(ph * 2.0 - 1.0);
    // 每个周期换一个种子(权重为 0 的时候换,看不出接缝)
    vec2 seed = noise_offset + vec2(fract(cycle * 0.1371), fract(cycle * 0.2917)) * 173.0
              + shift * vec2(31.7, 57.3);
    // 放大:同一个噪波特征的位置 = q * 2^ph,随时间往外跑
    vec2 q = p * exp2(-ph);
    float churn = churn_speed * time;
    vec2 warp = vec2(
        fbm(q * warp_scale + seed + vec2(0.0, churn), warp_octaves, 0.5),
        fbm(q * warp_scale + seed + vec2(5.2 - churn, 1.3), warp_octaves, 0.5)
    ) - 0.5;
    vec2 wq = warp * warp_strength;
    float n = fbm(q * noise_scale + seed + wq, noise_octaves, noise_roughness) - 0.5;
    float e = fbm(q * edge_scale + seed * 1.3 + vec2(50.0, 20.0) + wq, edge_octaves, edge_roughness) - 0.5;
    return n * noise_contrast + e * 2.0 * edge_distort * shape;
}

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    vec2 p = (texture_coords * 2.0 - 1.0) * area_half;
    float r = length(p);

    // ---- 两层往外放大的噪波交叉淡入淡出,按权重归一化 ----
    float cycles = time * flow_speed / LN2;
    float w1;
    float w2;
    float n1 = layer_noise(p, cycles, 0.0, w1);
    float n2 = layer_noise(p, cycles, 0.5, w2);
    float n = (n1 * w1 + n2 * w2) / sqrt(w1 * w1 + w2 * w2);

    // ---- 外径圆盘 ∩ 内径圆洞 ----
    float val_outer = (outer_radius - r) * shape + n;
    float val_inner = (r - inner_radius) * shape + n;
    float alpha = clamp(val_outer / edge_softness + 0.5, 0.0, 1.0)
                * clamp(val_inner / edge_softness + 0.5, 0.0, 1.0);
    // 绘制范围边上压到 0,不露出正方形的边
    alpha *= 1.0 - smoothstep(0.85, 1.0, r / area_half);
    if (alpha <= 0.002) {
        return vec4(0.0);
    }
    return vec4(tint, alpha) * color;
}

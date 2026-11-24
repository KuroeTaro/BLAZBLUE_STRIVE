#pragma language glsl3
// TRM 6SP_P 诅咒光环(curse aura)—— 程序化版本
// 参考:asset/game_scene/characters/TRM/texture/_IMG/projectile/6SP_P_curse_arua_example(带 alpha 的序列帧)
//
// 结构:
//   · 一个「上飘坐标系」:内容坐标 = 世界坐标 + 上飘偏移(content_follow 控制跟随比例),
//     形状噪波和边缘噪波都在这个坐标系里采样 → 纹理跟着往上飘
//   · 粒子:Lua 按发射频率在受击方位置附近出生,出生点固定在世界里,只往上飘
//     粒子只决定「哪里有东西」,形状由噪波决定:
//       val = 形状噪波 + 中心偏向 - 生命周期阈值 - 边缘切除
//     边缘距离被边缘噪波扭曲,所以轮廓不是圆形
//   · per_particle_noise = 1 时每个粒子用自己的种子偏移噪波,重叠的粒子图案各不相同
//   · 多个粒子按出生顺序逐个 over 叠加(后出生的在上面),每个粒子的形状 / 边缘 / 亮度纹理各自独立
//   · 颜色 = tint * 亮度噪波;亮度噪波只平移不变形,以 lum_speed 稳定往上移动
//     输出 vec4(tint * 亮度, alpha),用 alpha 混合画
//
// 坐标约定:shader 画在 1x1 白图上,Lua 把它拉伸成所有粒子的包围盒,
//   texture_coords 0..1 对应 area_origin .. area_origin + area_size(世界坐标),y 向下为正。
//   长度类参数以 unit 世界单位为 1.0(原序列帧一帧 800x800,半径 = 1.0)。
// 粒子数据:不用 uniform 数组(有长度上限),而是放在一张 rgba32f 数据贴图里,
//   宽 = 容量(Lua 按需扩容),第 0 行 = x, y, birth, seed;第 1 行 = size_mul, -, -, -。
//   循环次数 = particle_count,没有编译期上限。
// 所有参数都在 _VFX.lua 的 VFX_CONFIG_GAME_SCENE_CHAR_TRM_6SP_P_ARUA 里。

extern float unit;              // 长度单位(世界单位),由 config 的 shader.unit 送进来

// ---------------- 每帧由 Lua 送进来 ----------------
extern float time;                       // 连续时间,单位:序列帧,只增不跳
extern vec2 area_origin;                 // 包围盒左上角(世界坐标)
extern vec2 area_size;                   // 包围盒尺寸(世界单位)
extern vec2 noise_offset;                // 每次释放随机的噪波偏移
extern float particle_count;             // 本帧活着的粒子数
extern Image particle_data;              // 粒子数据贴图(rgba32f,nearest)
extern float particle_data_width;        // 数据贴图宽度(= 容量)

// ---------------- 粒子 ----------------
extern float life;              // 寿命(序列帧)
extern float rise;              // 一生上飘多远
extern float size_start;        // 出生时半径
extern float size_end;          // 死亡时半径
extern float shape;             // 越靠粒子中心越容易显示

// ---------------- 内容运动 ----------------
extern float content_follow;    // 纹理跟着上飘的比例(1 = 和粒子同速,0 = 固定在世界里)

// ---------------- 形状噪波(决定 alpha) ----------------
extern float noise_scale;       // 频率:越大碎片越细
extern float noise_octaves;     // 复杂度(层数 1-8,可以是小数)
extern float noise_roughness;   // 每层衰减:越大边缘越毛糙
extern float noise_contrast;    // 对比度
extern float noise_brightness;  // 亮度偏移:越大实心面积越多
extern float per_particle_noise;// 1 = 每个粒子一张独立噪波,0 = 所有粒子共用一张

// ---------------- 粒子边缘 ----------------
extern float edge_distort;      // 边缘扭曲幅度(相对粒子半径,0 = 纯圆)
extern float edge_scale;        // 边缘噪波频率
extern float edge_octaves;      // 边缘噪波复杂度
extern float edge_roughness;    // 边缘噪波每层衰减
extern float edge_cut;          // 外圈切除强度:越大外圈越干净
extern float edge_start;        // 从粒子半径的多少开始切除

// ---------------- 生命周期 ----------------
extern float th_born;           // 出生时阈值(高 = 几乎看不见)
extern float th_full;           // 完全显现时的阈值(越小越实)
extern float th_dead;           // 死亡时阈值
extern float appear;            // 生命前多少比例用来显现
extern float dissolve;          // 从生命的多少比例开始消散
extern float particle_fade_in;  // 单个粒子出生淡入(占寿命比例,>0)
extern float particle_fade_out; // 单个粒子死亡淡出(占寿命比例,>0)
extern float particle_opacity;  // 单个粒子本身的不透明度(0-1)

// ---------------- alpha 软硬 / 烟丝 ----------------
extern float edge_softness;     // 实心块边缘宽度:越大越软(>0)
extern float haze_strength;     // 半透明烟丝的不透明度
extern float haze_width;        // 烟丝比实心块多扩出去多少(>0)

// ---------------- 整体 ----------------
extern vec3 tint;               // 颜色(乘在亮度噪波上)

// ---------------- 调试 ----------------
extern float debug_view;        // 1 = 不画噪波:每个粒子画成自己颜色的半透明圆 + 圆周线,看切线是不是某个粒子的边

// ---------------- 亮度噪波(稳定向上移动,决定颜色深浅) ----------------
extern float lum_speed;         // 向上移动速度(每序列帧多少,400 世界单位 = 1.0)
extern float lum_scale;         // 频率(每 400 世界单位几个周期):越大明暗变化越碎
extern float lum_octaves;       // 复杂度(层数 1-8,可以是小数)
extern float lum_roughness;     // 每层衰减:越大细节越多
extern float lum_contrast;      // 对比度:越大明暗分得越开
extern float lum_min;           // 最暗处亮度
extern float lum_max;           // 最亮处亮度
extern float lum_gamma;         // 亮度曲线:1 = 线性,>1 中间调变暗(最亮 / 最暗不变),<1 中间调变亮

// 调试用:0..1 -> 色相
vec3 debug_hue(float k) {
    return clamp(abs(fract(k + vec3(0.0, 2.0 / 3.0, 1.0 / 3.0)) * 6.0 - 3.0) - 1.0, 0.0, 1.0);
}

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

// 形状噪波(alpha)
float shape_noise(vec2 p) {
    return (fbm(p, noise_octaves, noise_roughness) - 0.5) * noise_contrast + noise_brightness;
}

// 边缘噪波 -> 边缘距离偏移
float edge_noise(vec2 p) {
    return edge_distort * (fbm(p, edge_octaves, edge_roughness) - 0.5) * 2.0;
}

// 亮度噪波 -> 亮度
float lum_noise(vec2 p) {
    float n = clamp((fbm(p, lum_octaves, lum_roughness) - 0.5) * lum_contrast + 0.5, 0.0, 1.0);
    n = pow(n, max(lum_gamma, 1.0e-3));
    return mix(lum_min, lum_max, n);
}

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    vec2 world = area_origin + texture_coords * area_size;

    // ---- 上飘坐标系:纹理跟着往上飘 ----
    float rise_speed = rise / life;                        // 每序列帧上飘多少(400 单位制)
    vec2 c = world / unit + vec2(0.0, rise_speed * time * content_follow);
    vec2 shape_p = c * noise_scale + noise_offset;
    vec2 edge_p = c * edge_scale + noise_offset * 1.3 + vec2(50.0, 20.0);
    // 亮度噪波:只平移、不变形,以 lum_speed 稳定往上移动
    vec2 lum_p = (world / unit + vec2(0.0, lum_speed * time)) * lum_scale + noise_offset * 0.7 + vec2(40.0, 20.0);

    // per_particle_noise = 0:所有粒子共用一张噪波,每个像素只算一次
    // per_particle_noise = 1:每个粒子按自己的种子偏移采样,各自一张噪波(在循环里算)
    bool per_particle = per_particle_noise > 0.5;
    float shared_na = 0.0;
    float shared_edge = 0.0;
    float shared_lum = 0.0;
    if (!per_particle) {
        shared_na = shape_noise(shape_p);
        shared_edge = edge_noise(edge_p);
        shared_lum = lum_noise(lum_p);
    }
    float col = 0.0;   // 预乘后的亮度
    vec3 debug_rgb = vec3(0.0);   // 调试:预乘后的颜色

    // ---- 粒子:决定哪里有东西 ----
    float alpha = 0.0;
    bool debug = debug_view > 0.5;
    int count = int(particle_count + 0.5);
    for (int i = 0; i < count; i++) {
        // count 对所有像素都一样,读贴图时控制流是一致的
        float u = (float(i) + 0.5) / particle_data_width;
        vec4 pa = Texel(particle_data, vec2(u, 0.25));
        vec4 pb = Texel(particle_data, vec2(u, 0.75));
        float age = (time - pa.z) / life;
        if (age < 0.0 || age >= 1.0) continue;

        vec2 center = pa.xy + vec2(0.0, -rise * unit * age);
        float size = mix(size_start, size_end, 1.0 - (1.0 - age) * (1.0 - age)) * pb.x * unit;
        float raw_d = length(world - center) / size;
        if (raw_d >= 1.0) continue;

        if (debug) {
            // 半透明填充 + 圆周线,颜色按种子分(相邻出生的粒子颜色不同)
            float da = max(0.2, smoothstep(0.955, 0.985, raw_d));
            col = col * (1.0 - da) + 1.0 * da;
            alpha = alpha * (1.0 - da) + da;
            debug_rgb = debug_rgb * (1.0 - da) + debug_hue(fract(pa.w * 0.618)) * da;
            continue;
        }

        float na = shared_na;
        float edge_offset = shared_edge;
        vec2 po = vec2(0.0);
        if (per_particle) {
            // 种子 -> 每个粒子自己的噪波偏移;仍在上飘坐标系里采样,和粒子之间保持相对运动
            po = vec2(fract(pa.w * 0.1371), fract(pa.w * 0.2917)) * 173.0;
            na = shape_noise(shape_p + po);
            edge_offset = edge_noise(edge_p + po.yx);
        }
        float d = raw_d + edge_offset;

        float th = th_born - (th_born - th_full) * smoothstep(0.0, appear, age)
                 + (th_dead - th_full) * smoothstep(dissolve, 1.0, age);
        float val = na + (1.0 - d) * shape - th - edge_cut * smoothstep(edge_start, 1.0, d);

        float solid = clamp(val / edge_softness + 0.5, 0.0, 1.0);
        float g = clamp((val + haze_width) / haze_width, 0.0, 1.0);
        float a = max(solid, g * g * haze_strength);

        float fade = smoothstep(0.0, particle_fade_in, age)
                   * (1.0 - smoothstep(1.0 - particle_fade_out, 1.0, age));
        a *= fade * smoothstep(1.0, 0.9, raw_d) * particle_opacity;
        if (a <= 0.001) continue;

        // 每个粒子自己的亮度纹理(per_particle_noise = 1 时按种子偏移,各不相同)
        float plum = per_particle ? lum_noise(lum_p + po.yx * 0.61) : shared_lum;

        // 逐个粒子做 over 叠加:后出生的盖在先出生的上面,
        // 每个粒子保留自己的纹理,重叠处能看出是两个不同的粒子
        col = col * (1.0 - a) + plum * a;
        alpha = alpha * (1.0 - a) + a;
    }
    if (alpha <= 0.002) {
        return vec4(0.0);
    }
    if (debug) {
        return vec4(debug_rgb / alpha, alpha) * color;
    }
    float lum = col / alpha;

    return vec4(tint * lum, alpha) * color;
}

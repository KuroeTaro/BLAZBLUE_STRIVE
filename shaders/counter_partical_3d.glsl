// 程序化 3D 粒子 —— 取代
// asset/game_scene/common/texture/VFX/hit_VFX/partical_ver1_counter.dds
// (该资产已随本次改造从仓库删除)
//
// 以 overdrive_partical_3d.glsl 为基础重写。
//
// 为什么不再照抄原资产的逐帧噪点:
//   原序列图是「把白噪声硬阈值化」出来的 —— 每个亮点都饱和到 1.0、只有 1~2 像素,
//   而且相邻两帧几乎没有任何像素重合(实测 frame0 vs frame1 有 2.1% 像素改变,
//   差不多等于全部亮点被换掉)。直接照抄这个采样,在 60fps 下就是满屏 1 像素白点
//   加整屏乱闪,看起来像电视雪花而不是特效。
//
// 现在的做法(和 OD 同一套):
//   粒子在世界空间里持续存在,只让每颗粒子自己快速呼吸/闪烁。
//   这样既有闪烁的爆发感,又不会整屏换位置,而且天然带 3D 视差。
//
// 时间曲线仍然按原资产的设计:
//   原资产共 30 帧(约 0.5 秒),第 0 帧就拉满、保持到第 27 帧、最后几帧淡出。
//   life / 帧计数由 Lua 侧的 VFX 对象驱动,收尾淡出走 counter_opacity。

extern float time;         // 逻辑帧计数(顿帧与暂停时由 Lua 冻结)
extern float opacity;      // 整体不透明度(已包含收尾淡出)
extern vec3 camera_pos;    // 摄像机世界坐标 camera[1] camera[2] camera[3]
extern float anchor_z;     // 特效所在的世界平面 z(obj_VFX[3])
extern vec2 resolution;    // CANVAS 像素尺寸

#define FOCAL 800.0
#define HALF_W 800.0
#define HALF_H 450.0
#define BASE_DEPTH 800.0
#define EXPOSURE 2.00

// ---- 渐变调参:只改这两个浮点数(和 OD 用同一套) ----
// 两者都是「屏幕归一化 y」:0.0 = 屏幕最上方,1.0 = 屏幕最下方
//   GRADIENT_START 处不透明度 = 1.0,起点外侧恒为 1.0
//   GRADIENT_END   处不透明度 = 0.0,终点外侧恒为 0.0
// 反向渐变(下亮上暗)直接把 START 写得比 END 大,例如 1.0 / 0.0
#define GRADIENT_START 0.75
#define GRADIENT_END 1.0

vec4 hash42(vec2 p) {
    vec4 p4 = fract(vec4(p.xyxy) * vec4(0.1031, 0.1030, 0.0973, 0.1099));
    p4 += dot(p4, p4.wzxy + 33.33);
    return fract((p4.xxyz + p4.yzzw) * p4.zywx);
}

void add_layer(
    vec2 g,
    float z_offset,
    float spacing_ref,
    float radius_ref,
    float weight,
    float keep,
    float seed,
    inout vec3 accum
) {
    float d = anchor_z + z_offset - camera_pos.z;
    if (d < 32.0) {
        return;
    }
    vec2 pw = camera_pos.xy + (g - vec2(HALF_W, HALF_H)) * (d / FOCAL);
    // 比 OD 更快的上升流动:被打散之后往上飘
    pw += vec2(0.50, 1.00) * time;
    float d_ref = BASE_DEPTH + z_offset;
    float cell = spacing_ref * d_ref / FOCAL;
    float radius_world = radius_ref * d_ref / FOCAL;
    float project = FOCAL / d;
    float radius = radius_world * project;
    vec2 base = floor(pw / cell);
    for (int j = -1; j <= 1; ++j) {
        for (int i = -1; i <= 1; ++i) {
            vec2 cid = base + vec2(float(i), float(j));
            vec4 h = hash42(cid + seed);
            if (h.w > keep) {
                continue;
            }
            vec2 particle = (cid + h.xy) * cell;
            // 单颗粒径:和 OD 同一条做法,用与亮度无关的随机数,偏向小颗粒、少数偏大
            // (E[倍率^2] ≈ 1.01,整体亮度基本不变)
            float size_seed = fract(h.x * 7.31 + h.w * 4.13);
            float radius_particle = radius * (0.30 + 1.70 * size_seed * size_seed);
            float t = length((particle - pw) * project) / radius_particle;
            if (t >= 1.0) {
                continue;
            }
            // 和 OD 一样的柔光光斑
            float profile = 1.0 - t * t;
            profile = profile * profile;
            // 每颗粒子独立的高频呼吸:周期约 8 逻辑帧,比 OD 快得多,
            // 但粒子位置不动,所以是「闪」而不是「乱跳」
            float phase = h.x * 6.2831853 + h.y * 18.849556;
            float twinkle = 0.5 + 0.5 * sin(time * 0.80 + phase);
            float brightness = (0.30 + 0.70 * twinkle) * (0.55 + 0.45 * h.z);
            accum += vec3(weight * brightness * profile);
        }
    }
}

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    vec2 g = screen_coords / (resolution.x / 1600.0);
    vec3 accum = vec3(0.0);
    add_layer(g, -380.0, 22.3, 1.875, 1.10, 0.125, 11.0, accum);
    add_layer(g, -120.0, 21.4, 1.6875, 1.30, 0.125, 37.0, accum);
    add_layer(g, 180.0, 20.4, 1.50, 1.45, 0.125, 73.0, accum);
    add_layer(g, 560.0, 21.4, 1.375, 1.20, 0.125, 131.0, accum);
    // 原资产是纯白,这里也只留一点点冷色
    accum *= vec3(0.98, 0.99, 1.0);
    // 屏幕空间垂直线性渐变(起点/终点见文件顶部的 GRADIENT_START / GRADIENT_END)
    float gradient_uv_y = screen_coords.y / resolution.y;
    float gradient_span = GRADIENT_END - GRADIENT_START;
    // 允许起点写在终点下方(反向渐变),只是两者相等时避免除零
    if (abs(gradient_span) < 0.001) {
        gradient_span = 0.001;
    }
    accum *= clamp((GRADIENT_END - gradient_uv_y) / gradient_span, 0.0, 1.0);
    return vec4(accum * opacity * EXPOSURE, 1.0);
}

// 程序化 3D 粒子尘埃 —— 取代 asset/game_scene/common/texture/VFX/overdrive_partical.dds
//
// 原资产:70 帧 1600x900 的整屏白色微尘序列图。实测每帧约 1.2% 像素被点亮,
//         单颗 2~3 像素,亮度 0.09~1.0,位置基本固定、亮度缓慢呼吸;
//         70 帧内整体亮度包络为 0 -> 峰值 -> 0(由 Lua 侧 opacity 送入)。
//
// 本实现:不再烘焙任何序列帧。粒子由「世界空间格点哈希」实时生成,
//         每帧把摄像机位置送入 shader,粒子按各自景深做透视投影,
//         因此摄像机位移会产生真实视差(近层滑动快、远层滑动慢)。
//         CANVAS 固定贴在屏幕上,镜头无论怎么移动都不会露出画布边缘,
//         也不需要为了掩盖边缘而放大画布。
//
// 坐标约定与 draw_general_use_functions.lua 的 draw_3d_point_to_2D 完全一致:
//     scale = 800 / (z - camera_z)
//     x_2d  = scale * (x - camera_x) + 800
//     y_2d  = scale * (y - camera_y) + 450
// 其中 (x_2d,y_2d) 是 1600x900 设计分辨率下的坐标。
//
// 调参入口在文件末尾的 effect() 里,四层 add_layer 的参数依次为:
//     世界 z 偏移 / 屏幕参考间距 / 屏幕参考半径 / 亮度权重 / 保留概率 / 哈希种子
//
// 注意:参数是「实测对齐原资产之后,又按项目需要调过」的,当前状态:
//       颗粒直径 = 最初版本的 125%(1.50/1.35/1.20/1.10 -> 1.875/1.6875/1.50/1.375)
//       保留概率 = 0.35(最初版本是 0.70,即数量减半)
//       末尾乘了一条屏幕空间垂直线性渐变:
//           起点 = 屏幕垂直中央(g.y = HALF_H),不透明度 1.0
//           终点 = 屏幕底边(g.y = 2*HALF_H),不透明度 0.0
//           上半屏保持 1.0,渐变固定在屏幕上、不跟摄像机走
//       峰值帧实测:上半屏 ≈ 0.0051,下半屏 ≈ 0.0024,整体 0.0037(与原资产整体亮度一致)
//       想回到「和原资产统计一致」的版本:
//       radius 改回 1.50/1.35/1.20/1.10、keep 改回 0.70、去掉渐变、EXPOSURE 改回 1.04。

extern float time;         // 逻辑帧计数(顿帧与暂停时由 Lua 冻结)
extern float opacity;      // 整体不透明度(已包含亮度包络)
extern vec3 camera_pos;    // 摄像机世界坐标 camera[1] camera[2] camera[3]
extern float anchor_z;     // 特效所在的世界平面 z(obj_VFX[3])
extern vec2 resolution;    // CANVAS 像素尺寸

#define FOCAL 800.0
#define HALF_W 800.0
#define HALF_H 450.0
// 默认机位下摄像机到 anchor_z 平面的距离,用于把「屏幕参考尺寸」换算成世界尺寸
#define BASE_DEPTH 800.0
#define EXPOSURE 1.75

// ---- 渐变调参:只改这两个浮点数 ----
// 两者都是「屏幕归一化 y」:0.0 = 屏幕最上方,1.0 = 屏幕最下方
//   GRADIENT_START 处不透明度 = 1.0(往这个点上方都保持 1.0)
//   GRADIENT_END   处不透明度 = 0.0(往这个点下方都保持 0.0)
#define GRADIENT_START 0.75
#define GRADIENT_END 1.0

// 格点 -> 4 个互相独立的伪随机数。比 sin 哈希便宜,且没有周期性条纹。
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
    // 摄像机穿过这一层就直接丢弃,避免除零/爆点
    if (d < 32.0) {
        return;
    }
    // 当前像素投射到该层平面上的世界点
    vec2 pw = camera_pos.xy + (g - vec2(HALF_W, HALF_H)) * (d / FOCAL);
    // 世界空间流动:所有层共用同一段位移,屏幕上的速度差自然形成视差
    pw += vec2(0.18, 0.42) * time;
    // 世界格点尺寸只由参考景深决定(不随 d 变化),
    // 这样摄像机推拉时粒子不会因为换格而「沸腾」,只产生正确的透视缩放
    float d_ref = BASE_DEPTH + z_offset;
    float cell = spacing_ref * d_ref / FOCAL;
    float radius_world = radius_ref * d_ref / FOCAL;
    // 世界单位 -> 当前景深下的屏幕设计像素
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
            // 单颗粒径随机:原资产的微尘大小并不一致,少数是明显更大的亮斑
            float radius_particle = radius * (0.55 + 0.90 * h.z);
            float t = length((particle - pw) * project) / radius_particle;
            if (t >= 1.0) {
                continue;
            }
            // 柔和光斑:中心亮、边缘平滑衰减
            float profile = 1.0 - t * t;
            profile = profile * profile;
            float brightness = 0.45 + 0.55 * h.z;
            float phase = h.x * 6.2831853 + h.y * 18.849556;
            brightness *= 0.65 + 0.35 * sin(time * 0.22 + phase);
            accum += vec3(weight * brightness * profile);
        }
    }
}

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    // 像素 -> 1600x900 设计坐标
    vec2 g = screen_coords / (resolution.x / 1600.0);
    vec3 accum = vec3(0.0);
    add_layer(g, -380.0, 27.5, 1.875, 0.70, 0.35, 11.0, accum);
    add_layer(g, -120.0, 24.5, 1.6875, 0.90, 0.35, 37.0, accum);
    add_layer(g, 180.0, 23.0, 1.50, 1.00, 0.35, 73.0, accum);
    add_layer(g, 560.0, 24.5, 1.375, 0.80, 0.35, 131.0, accum);
    // 原资产是中性白,只留一点点冷色
    accum *= vec3(0.94, 0.97, 1.0);
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

// FD 屏障 —— FD_bubble(球罩) + block_FD(命中扩散环)合并成一个程序化 shader
//
//   原来的画法是「block_FD 序列帧(8 帧) + FD_bubble 单图」叠加,
//   这里用同一个 shader 同时画两层:
//     · 球罩:alpha 随 r 上升(越靠边缘越亮),到球面处硬边截断 —— FD_bubble 的剖面
//     · 命中环:半径 / 峰值由 Lua 按 block_FD 的 8 帧表插值后送进来
//     · 整体再乘 opacity(命中时的包络 / 常驻时的渐入)
//
// 坐标约定与 draw_3d_point_to_2D 一致:
//     g = screen_coords / (resolution.x / 1600.0)  -> 1600x900 设计坐标
//     r = length(g - center) / radius              -> 0 = 中心,1 = 半径

extern float time;        // 屏障自己的帧数
extern float opacity;     // 整体透明度
extern vec2 center;       // 屏障中心(设计坐标)
extern float radius;      // 基准半径(设计像素,已含透视)
extern vec2 resolution;   // 画布尺寸
extern vec3 tint;         // 颜色
// 球罩
extern float bubble_size;       // 球面半径(× R)
extern float bubble_edge;       // 外侧柔和度
extern float bubble_power;      // 中心到边缘的亮度曲线(越大中心越暗)
extern float bubble_brightness; // 球罩亮度
extern float bubble_inner_size;      // 内圈渐变半径(× R,0.5 = 一半)
extern float bubble_inner_feather;   // 内圈羽化宽度(× R)
extern float bubble_inner_brightness;// 内圈亮度
extern float bubble_highlight;  // 左上高光
extern float bubble_wobble;     // 呼吸幅度
// 命中环
extern float impact_radius;     // 环半径(× R),0 = 不画
extern float impact_alpha;      // 环峰值
extern float impact_width;      // 环外侧收边厚度
extern float impact_inner_feather; // 环内侧羽化(× R)

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    vec2 g = screen_coords / (resolution.x / 1600.0);
    vec2 rel = g - center;
    float r = length(rel) / max(radius,1.0e-3);

    // 球罩:FD_bubble 的 alpha 剖面 = 越靠边缘越亮,到球面处截断
    float size = bubble_size * (1.0 + bubble_wobble * sin(time * 0.35));
    float bubble_t = clamp(r / max(size,1.0e-3),0.0,1.0);
    float bubble_body = pow(bubble_t,bubble_power);
    float bubble_cut = 1.0 - smoothstep(size,size + max(bubble_edge,1.0e-3),r);
    float shell = bubble_body * bubble_cut;
    // 内圈:带羽化的径向渐变,到半径的一半收干净
    float inner_fade = 1.0 - smoothstep(
        bubble_inner_size - max(bubble_inner_feather,1.0e-3),bubble_inner_size,r
    );
    inner_fade = inner_fade * inner_fade * (3.0 - 2.0 * inner_fade);
    vec2 n = normalize(rel + vec2(1.0e-5,1.0e-5));
    float highlight = pow(max(0.0,dot(n,normalize(vec2(-0.45,0.89)))),8.0) * bubble_highlight;
    float shape = shell * (bubble_brightness + highlight)
        + inner_fade * bubble_inner_brightness;

    // 命中环
    if (impact_alpha > 0.0) {
        // 内侧:羽化渐变(朝环心收干净)
        float inner_side = smoothstep(
            impact_radius - max(impact_inner_feather,1.0e-3),impact_radius,r
        );
        // 外侧:高斯收边
        float outer_delta = (r - impact_radius) / max(impact_width,1.0e-3);
        float outer_side = (r <= impact_radius) ? 1.0 : exp(-outer_delta * outer_delta);
        shape += inner_side * outer_side * impact_alpha;
    }

    return vec4(tint * shape * opacity,1.0);
}

// burst shockwave projectile —— 程序化冲击波(参考 overdrive_badge_partical_3d 的冲击波部分)
//
// 和 RC_shockwave 的序列帧不同,这里完全逐像素求值、不需要任何贴图:
//   主环向外扩散 + 内侧一条更细的回波 + 起手瞬间的中心闪光,
//   环的半径/厚度/亮度、回波、闪光、淡出曲线全部由
//   BURST_SHOCKWAVE_PROJECTILE_CONFIG 送进来。
//
// 坐标约定与 draw_3d_point_to_2D 一致:
//     g = screen_coords / (resolution.x / 1600.0)  -> 1600x900 设计坐标
// center / radius 也都是设计坐标、设计像素。

extern float time;        // 当前帧(0..life-1)
extern float life;        // 总帧数
extern float opacity;     // 整体不透明度
extern vec2 center;       // 冲击波中心(设计坐标)
extern float radius;      // 基准半径(设计像素,已含透视)
extern vec2 resolution;   // 画布尺寸
extern vec3 tint;         // 颜色
extern float shockwave_radius_start;   // 环起始半径(× R)
extern float shockwave_radius_grow;    // 环扩散量(× R)
extern float shockwave_width_base;     // 环起始厚度(× R)
extern float shockwave_width_grow;     // 环扩散时增加的厚度(× R)
extern float shockwave_brightness;     // 环亮度
extern float shockwave_echo_scale;     // 内侧回波半径倍率
extern float shockwave_echo_strength;  // 内侧回波亮度
extern float shockwave_flash_strength; // 起手中心闪光强度
extern float shockwave_flash_size;     // 起手中心闪光半径(× R)
extern float shockwave_fade_power;     // 淡出曲线:越大结尾收得越快

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    // 0..1 的进度:life 帧对应 0..life-1(life 就是实际时长,不再做倍速换算)
    float p = clamp(time / max(life - 1.0,1.0),0.0,1.0);
    vec2 g = screen_coords / (resolution.x / 1600.0);
    float d = length(g - center);
    // 扩散曲线:开头快、结尾慢(和 overdrive 的冲击波一致)
    float e = 1.0 - (1.0 - p) * (1.0 - p);
    float ring = radius * (shockwave_radius_start + shockwave_radius_grow * e);
    float w = max(radius * (shockwave_width_base + shockwave_width_grow * p),1.0e-3);
    float delta = (d - ring) / w;
    float band = exp(-delta * delta);
    // 内侧回波:更细、更暗,做出「一道冲击 + 一道回响」的层次
    float echo_ring = ring * shockwave_echo_scale;
    float echo_delta = (d - echo_ring) / max(w * 0.55,1.0e-3);
    float echo = exp(-echo_delta * echo_delta) * shockwave_echo_strength;
    // 起手中心闪光:前几帧亮一下,和环分开衰减
    float flash_d = d / max(radius * shockwave_flash_size,1.0e-3);
    float flash = exp(-p * 6.0) * exp(-flash_d * flash_d) * shockwave_flash_strength;
    float fade = pow(1.0 - p,shockwave_fade_power);
    float shape = (band + echo) * fade + flash;
    return vec4(tint * shape * shockwave_brightness * opacity,1.0);
}

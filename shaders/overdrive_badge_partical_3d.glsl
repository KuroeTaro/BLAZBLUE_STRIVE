// overdrive badge —— 冲击波 / 中心闪光 / 蓄力光(全屏程序化)
//
// 粒子本身已经改成「顶点着色器生成 1200 条拖尾」的 mesh 方案
// (shaders/overdrive_badge_particle.glsl),这里只保留需要逐像素求值的
// 冲击波环、爆发中心闪光与收束末端的蓄力光,开销很低。
//
// 坐标约定与 draw_3d_point_to_2D 一致:
//     g = screen_coords / (resolution.x / 1600.0)  -> 1600x900 设计坐标
// center / radius 也都是设计坐标、设计像素。

extern float time;        // 当前帧(0..69),顿帧与暂停时由 Lua 冻结
extern float opacity;     // 整体不透明度
extern vec2 center;       // 徽章中心(设计坐标)
extern float radius;      // 徽章基准半径(设计像素,已含透视)
extern vec2 resolution;   // 画布尺寸
extern float shockwave_radius_start;  // 环起始半径(× R)
extern float shockwave_radius_grow;   // 环扩散量(× R)
extern float shockwave_width_base;    // 环起始厚度(× R)
extern float shockwave_width_grow;    // 环扩散时增加的厚度(× R)
extern float shockwave_brightness;    // 环亮度

#define BURST_START 28.0
#define SHOCKWAVE_END 26.0

// 冲击波:主环向外扩散,内侧拖一条更细的回波
// 环的厚度/半径/亮度由 OVERDRIVE_BADGE_PARTICAL_CONFIG 控制
void add_shockwave(vec2 g, float frame, inout vec3 accum) {
    float t = frame - BURST_START;
    if (t < 0.0 || t > SHOCKWAVE_END) {
        return;
    }
    float p = t / SHOCKWAVE_END;
    float d = length(g - center);
    float e = 1.0 - (1.0 - p) * (1.0 - p);
    float ring = radius * (shockwave_radius_start + shockwave_radius_grow * e);
    float w = radius * (shockwave_width_base + shockwave_width_grow * p);
    float delta = (d - ring) / w;
    float band = exp(-delta * delta);
    float echo_ring = ring * 0.78;
    float echo_delta = (d - echo_ring) / (w * 0.55);
    float echo = exp(-echo_delta * echo_delta) * 0.38;
    float fade = pow(1.0 - p,2.20);
    accum += vec3((band + echo) * fade * shockwave_brightness);
}

// 爆发瞬间的中心闪光
void add_burst_flash(vec2 g, float frame, inout vec3 accum) {
    float t = frame - BURST_START;
    if (t < 0.0) {
        return;
    }
    float d = length(g - center);
    float flash = exp(-t * 0.85) * exp(-pow(d / (radius * 0.36),2.0));
    accum += vec3(flash * 0.45);
}

// 收束末端的中心蓄力光:给「突然放大」一个前置的对比
void add_charge_glow(vec2 g, float frame, inout vec3 accum) {
    float charge = smoothstep(20.0,28.0,frame);
    if (charge <= 0.0) {
        return;
    }
    float d = length(g - center) / (radius * 0.55);
    accum += vec3(exp(-d * d) * charge * 0.22);
}

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    // 像素 -> 1600x900 设计坐标
    vec2 g = screen_coords / (resolution.x / 1600.0);
    vec3 accum = vec3(0.0);
    add_burst_flash(g,time,accum);
    float d_center = length(g - center);
    if (d_center < radius * 4.20) {
        add_shockwave(g,time,accum);
    }
    if (time <= 29.0) {
        add_charge_glow(g,time,accum);
    }
    // 冷白偏青,和徽章的白银色调一致
    accum *= vec3(0.90,0.96,1.00);
    return vec4(accum * opacity,1.0);
}
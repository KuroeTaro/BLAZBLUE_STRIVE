// overdrive badge —— 向内收束充能波 / 冲击波 / 中心闪光 / 蓄力光(全屏程序化)
//
// 粒子本身已经改成「顶点着色器生成 1200 条拖尾」的 mesh 方案
// (shaders/overdrive_badge_particle.glsl),这里只保留需要逐像素求值的
// 冲击波环、爆发中心闪光与收束末端的蓄力光,开销很低。
//
// 收缩段(粒子向中心飞行,0..28 帧)额外压三条「往中心收起」的充能波:
// 从画面外圈一圈圈往中心砸,越收越细越亮,最后一条正好在爆发帧撞进中心。
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
extern float charge_brightness;       // 充能波亮度
extern float charge_radius_start;     // 充能波起始半径(× R),从画面外圈开始收
extern float charge_radius_end;       // 充能波撞进中心的半径(× R)
extern float charge_width_start;      // 充能波起始厚度(× R)
extern float charge_width_end;        // 充能波收起时的厚度(× R)
extern float charge_softness;         // 充能波边缘柔和度:1.0 = 默认,越大越糊

#define BURST_START 28.0
#define SHOCKWAVE_END 26.0

// 三条充能波的起跑时间 / 寿命:越接近爆发,起跑间隔与寿命一起收紧,
// 于是往中心收的波一次比一次快,最后一条正好在 BURST_START 撞进中心。
#define CHARGE_RING_A_START 1.0
#define CHARGE_RING_A_LIFE 16.0
#define CHARGE_RING_B_START 9.0
#define CHARGE_RING_B_LIFE 13.0
#define CHARGE_RING_C_START 17.0
#define CHARGE_RING_C_LIFE 11.0

// 单条往中心收束的充能波:u = 0 从最外圈出发,u = 1 砸进中心。
// 半径先慢后快(pow 2.30),厚度同步变细、亮度同步变高;
// 剖面 = 芯 + 羽化光晕 + 外侧单边尾迹,方向感靠尾迹,边缘靠光晕羽化。
void add_charge_ring(float d, float u, float width_mul, inout vec3 accum) {
    if (u <= 0.0 || u > 1.0) {
        return;
    }
    float e = pow(u,2.30);
    float ring = radius * mix(charge_radius_start,charge_radius_end,e);
    float w = radius * mix(charge_width_start,charge_width_end,e) * width_mul;
    // 一道冲击波拆成三层:清晰的芯 + 一大圈羽化光晕 + 外侧单边衰减的尾迹。
    // 羽化全靠 bloom,所以外缘不会出现生硬的分界,芯也还在,不会糊成一团。
    float delta = (d - ring) / w;
    float core_w = 0.55 * charge_softness;
    float bloom_w = 2.40 * charge_softness;
    float core = exp(-delta * delta / (core_w * core_w));
    float bloom = exp(-delta * delta / (bloom_w * bloom_w));
    float wake = (d > ring) ? exp(-(d - ring) / (w * 3.60)) : 0.0;
    // 已经被扫过的那一片留一层很淡的余辉(从中心一路柔到环上,不留边界)
    float inner = 1.0 - smoothstep(0.0,ring,d);
    float bright = smoothstep(0.0,0.10,u) * mix(0.25,0.95,pow(u,1.30));
    bright += pow(u,14.0) * 0.70;
    float shape = core * 0.62 + bloom * 0.55 + wake * 0.30 + inner * 0.06;
    accum += vec3(shape * bright * charge_brightness);
}

// 三条波错开起跑,保证收缩段每一帧都至少有一条在往中心收
void add_charge_shockwave(float d, float frame, inout vec3 accum) {
    if (frame > BURST_START) {
        return;
    }
    // 外圈不做硬裁剪:最后一段用 smoothstep 羽化掉,否则会看到一圈生硬的分界
    float outer = radius * (charge_radius_start + charge_width_start * 3.0);
    float fade = 1.0 - smoothstep(outer * 0.85,outer,d);
    if (fade <= 0.0) {
        return;
    }
    vec3 wave = vec3(0.0);
    add_charge_ring(d,(frame - CHARGE_RING_A_START) / CHARGE_RING_A_LIFE,1.00,wave);
    add_charge_ring(d,(frame - CHARGE_RING_B_START) / CHARGE_RING_B_LIFE,0.82,wave);
    add_charge_ring(d,(frame - CHARGE_RING_C_START) / CHARGE_RING_C_LIFE,0.66,wave);
    accum += wave * fade;
}

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
    add_charge_shockwave(d_center,time,accum);
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
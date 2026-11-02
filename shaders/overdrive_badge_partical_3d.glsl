// overdrive badge —— 向内收束充能波 / 冲击波 / 中心闪光 / 蓄力光(全屏程序化)
//
// 粒子本身已经改成「顶点着色器生成 1200 条拖尾」的 mesh 方案
// (shaders/overdrive_badge_particle.glsl),这里只保留需要逐像素求值的
// 冲击波环、爆发中心闪光与收束末端的蓄力光,开销很低。
//
// 收缩段(粒子向中心飞行,0..28 帧)额外压若干条「往中心收起」的充能波:
// 从画面外圈一圈圈往中心砸,越收越细越亮,最后一条正好在爆发帧撞进中心。
// 条数由 charge_count 控制,飞行快慢由 charge_speed 控制;所有波的起跑时间
// 按条数均分铺开,保证最后一条仍然在 BURST_START 撞进中心(节奏不会散)。
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
extern float charge_count;            // 充能波个数(同时往里收的波有几条),取整
extern float charge_speed;            // 充能波飞行速度倍率:1.0 = 基准,越大飞得越快
extern float charge_softness;         // 充能波整体模糊程度:越大整条波越虚,越小越锐利

#define BURST_START 28.0
#define SHOCKWAVE_END 26.0
// 波数上限:循环写成常量上界,超出部分的圈直接跳过,老驱动也能编过
#define CHARGE_RING_MAX 12
// 速度 = 1.0 时,一条波从最外圈飞到中心需要的帧数
#define CHARGE_BASE_LIFE 16.0
// 第一条波最早也从这一帧起跑(太早的话外圈还没铺开)
#define CHARGE_FIRST_START 1.0
// 模糊核宽度 = 波宽 w × CHARGE_BLUR_SCALE × charge_softness:
//   1.0 = 基准模糊,数值延续旧版「边缘柔和度」的手感(1.75 依旧是一条能看清的环)
#define CHARGE_BLUR_SCALE 0.55
// 模糊增益:把峰值抬回旧版光晕剖面接近的亮度(配合下面的 1/sigma 能量守恒)
#define CHARGE_BLUR_GAIN 0.90
// 峰值上限:太锐的时候别直接顶到全白
#define CHARGE_BLUR_AMP_MAX 2.50

// 单条往中心收束的充能波:u = 0 从最外圈出发,u = 1 砸进中心。
// 半径先慢后快(pow 2.30),厚度同步变细、亮度同步变高。
// 剖面不再拆成「清晰的芯 + 一大圈羽化光晕」,而是把整条波(主体 + 外侧尾迹)
// 统一按 charge_softness 做一次高斯模糊:只有单峰,没有光晕那种第二层鼓包;
// 模糊半径变大时峰值按 1/sigma 下降,所以总光量基本守恒,不会越糊越亮。
void add_charge_ring(float d, float u, float width_mul, inout vec3 accum) {
    if (u <= 0.0 || u > 1.0) {
        return;
    }
    float e = pow(u,2.30);
    // max(...,1e-3):半径 / 厚度调到 0 时不产生除零
    float ring = max(radius * mix(charge_radius_start,charge_radius_end,e),1.0e-3);
    float w = max(radius * mix(charge_width_start,charge_width_end,e) * width_mul,1.0e-3);
    float delta = (d - ring) / w;
    // 整体模糊半径(以波宽 w 为单位)
    float sigma = clamp(charge_softness * CHARGE_BLUR_SCALE,0.20,4.40);
    // 主体:单个高斯,就是整条波被糊开之后的剖面
    float body = exp(-(delta * delta) / (2.0 * sigma * sigma));
    // 外侧单边尾迹:同一个模糊核把「环内 / 环外」的硬边也抹平了,
    // 所以过渡宽度跟着 sigma 走,不再用 d > ring 的硬判断切一刀
    float side = smoothstep(-1.5 * sigma,0.0,delta);
    float wake = exp(-max(delta,0.0) * 0.2778) * side;
    // 已经被扫过的那一片留一层很淡的余辉(从中心一路柔到环上,不留边界)
    float inner = 1.0 - smoothstep(0.0,ring,d);
    float bright = smoothstep(0.0,0.10,u) * mix(0.25,0.95,pow(u,1.30));
    bright += pow(u,14.0) * 0.70;
    // 1/sigma:模糊把光摊开,峰值随之下降(能量守恒),乘固定增益补回观感亮度
    float amp = min(CHARGE_BLUR_GAIN / sigma,CHARGE_BLUR_AMP_MAX);
    float shape = (body + wake * 0.30 + inner * 0.06) * amp;
    accum += vec3(shape * bright * charge_brightness);
}

// 按 charge_count 条波错开起跑:起跑时间从第一帧均匀铺到「爆发帧 - 寿命」,
// 每条波的飞行寿命相同(速度一致),于是越靠后的波越晚出发、也越细一点。
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
    // 条数取整并夹在 [1,CHARGE_RING_MAX];速度为 0 时按最慢处理,避免除零
    int count = int(clamp(floor(charge_count + 0.5),1.0,float(CHARGE_RING_MAX)));
    // 速度越快寿命越短;寿命最长也只会顶到爆发帧,否则最后一条来不及撞进中心
    float life = min(CHARGE_BASE_LIFE / clamp(charge_speed,0.05,8.0),BURST_START);
    // 最后一条正好在 BURST_START 撞进中心
    float last_start = BURST_START - life;
    float first_start = min(CHARGE_FIRST_START,last_start);
    float span = last_start - first_start;
    vec3 wave = vec3(0.0);
    for (int i = 0; i < CHARGE_RING_MAX; i = i + 1) {
        if (i < count) {
            // t = 0 是第一条(最外圈最早起跑),t = 1 是最后一条(撞进爆发帧)
            float t = (count > 1) ? float(i) / float(count - 1) : 1.0;
            float start = first_start + span * t;
            // 越靠后的波越细,收束的层次感更好(1.00 -> 0.66)
            float width_mul = mix(1.00,0.66,t);
            add_charge_ring(d,(frame - start) / life,width_mul,wave);
        }
    }
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

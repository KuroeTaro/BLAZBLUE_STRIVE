// overdrive badge —— 拖尾粒子的顶点着色器生成方案(600 颗)
//
// 每个粒子是一个 quad(mesh 里预生成 600 个),位置/尺寸/拖尾全部在
// 顶点着色器里按 Index + 当前帧算出来,片元着色器只负责画「圆头 + 条状拖尾」。
// 这样 600 颗粒子也只是一次 draw call,CPU 侧零开销。
//
// 顶点数据直接复用 LOVE 的默认顶点格式(不自定义 attribute,11.x / 12.0 行为一致):
//     VertexPosition.xy : quad 的四个角 (0/1, 0/1)
//     VertexTexCoord.x  : 粒子编号(0..N-1)
// 位置仍然在下面按 Index + 当前帧实时算出来。
//
// 两个阶段:
//     phase = 0 收缩段(1..28 帧):从随机半径/随机角度螺旋向内聚集
//     phase = 1 爆发段(28 帧起):从随机内半径向外炸开
//
// 尺寸 / 转速 / 拖尾长度 / 收束范围都由 _overdrive_badge_partical_config.lua 的
// OVERDRIVE_BADGE_PARTICAL_CONFIG 通过 uniform 控制,这里不再写死。

extern float time;
extern float opacity;
extern vec2 center;
extern float radius;
extern float scale_anim;
extern float phase;       // 0 = converge, 1 = burst
extern float size_scale;        // 粒子大小倍率
extern float spin_scale;        // 旋转速度倍率(基准 0.55 rad)
extern float trail_scale;       // 拖尾长度倍率(1.0 = 当前长度)
extern float start_radius_min;  // 收缩段起始半径下限(× R)
extern float start_radius_max;  // 收缩段起始半径上限(× R)
extern float target_radius_ratio; // 收缩段终点(× R)

#define PI 3.14159265358979
#define TAU 6.28318530717959
#define BURST_START 28.0

varying vec2 v_local;     // (沿拖尾方向, 垂直方向),单位:设计像素
varying vec3 v_params;    // (核心半径, 拖尾长度, 亮度)

vec4 hash42(vec2 p) {
    vec4 p4 = fract(vec4(p.xyxy) * vec4(0.1031,0.1030,0.0973,0.1099));
    p4 += dot(p4,p4.wzxy + 33.33);
    return fract((p4.xxyz + p4.yzzw) * p4.zywx);
}

#ifdef VERTEX
vec4 position(mat4 transform_projection, vec4 vertex_position) {
    vec2 corner = VertexPosition.xy;
    float index = VertexTexCoord.x;
    vec4 h = hash42(vec2(index * 12.9898 + 78.233 * (phase + 2.0),index * 39.3467 + 11.135));
    vec4 h2 = hash42(vec2(index * 71.13 + 3.7,index * 19.7 + 5.3));
    float head_angle = 0.0;
    float head_radius = 0.0;
    float tail_radius = 0.0;
    float tail_angle = 0.0;
    float w = 0.0;
    float bright = 0.0;
    bool visible = true;
    if (phase < 0.5) {
        // ---- 收缩段 ----
        float delay = h.z * 19.0;
        float life = 9.0 + 8.0 * h.w;
        float p = (time - 1.0 - delay) / life;
        if (p <= 0.0 || p >= 1.0) {
            visible = false;
        } else {
            // 收束终点就是中心(留 2% 半径避免奇点)
            float target_radius = radius * scale_anim * target_radius_ratio;
            float e = pow(p,1.55);
            // 起始半径压低到 0.60R ~ 1.40R,粒子从更靠近中心的位置出发
            float r_start = radius * mix(start_radius_min,start_radius_max,pow(h.y,0.85));
            head_radius = mix(r_start,target_radius,e);
            float e_tail = max(e - 0.170 * size_scale * trail_scale,0.0);
            tail_radius = mix(r_start,target_radius,e_tail);
            head_angle = h.x * TAU + (1.0 - e) * 0.55 * spin_scale;
            tail_angle = h.x * TAU + (1.0 - e_tail) * 0.55 * spin_scale;
            w = radius * (0.008 + 0.011 * h.w) * size_scale;
            // 到达中心时仍然保留亮度,让「收束成点」看得见
            float fade = smoothstep(0.0,0.10,p) * (1.0 - 0.35 * p);
            bright = fade * (0.50 + 0.45 * h.z);
        }
    } else {
        // ---- 爆发段 ----
        float t = time - BURST_START;
        float delay = h.w * 4.0;
        float life = 12.0 + 8.0 * h.y;
        float p = (t - delay) / life;
        if (p <= 0.0 || p >= 1.0) {
            visible = false;
        } else {
            float e = 1.0 - (1.0 - p) * (1.0 - p);
            float r_birth = radius * (0.25 + 0.50 * h2.x);
            float reach = r_birth + radius * (0.65 + 1.10 * h.z) * e;
            float p_tail = max(p - 0.120 * size_scale * trail_scale,0.0);
            float e_tail = 1.0 - (1.0 - p_tail) * (1.0 - p_tail);
            float reach_tail = r_birth + radius * (0.65 + 1.10 * h.z) * e_tail;
            head_radius = reach;
            tail_radius = reach_tail;
            head_angle = h.x * TAU + 0.35;
            tail_angle = head_angle;
            w = radius * (0.012 + 0.016 * h2.y) * (1.0 - 0.20 * p) * size_scale;
            float fade = smoothstep(0.0,0.14,p) * pow(1.0 - p,1.30);
            bright = fade * 1.10;
        }
    }
    if (!visible || bright <= 0.001) {
        // 退化成一个点,不产生任何片元
        v_local = vec2(0.0,0.0);
        v_params = vec3(0.0);
        return transform_projection * vec4(center,0.0,1.0);
    }
    vec2 head = center + vec2(cos(head_angle),sin(head_angle)) * head_radius;
    vec2 tail = center + vec2(cos(tail_angle),sin(tail_angle)) * tail_radius;
    vec2 delta = head - tail;
    float len = length(delta);
    vec2 dir = (len > 0.0001) ? delta / len : vec2(1.0,0.0);
    vec2 nrm = vec2(-dir.y,dir.x);
    float pad = w * 3.2;
    float total_len = len + pad * 2.0;
    float along = corner.x * total_len - pad;
    float across = corner.y * (pad * 2.0) - pad;
    vec2 pos = tail + dir * along + nrm * across;
    v_local = vec2(along,across);
    v_params = vec3(w,len,bright);
    return transform_projection * vec4(pos,0.0,1.0);
}

#else
vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    float w = v_params.x;
    float len = v_params.y;
    float bright = v_params.z;
    if (bright <= 0.0) {
        return vec4(0.0,0.0,0.0,0.0);
    }
    // 到「头 -> 尾」线段的距离(两端是圆头)
    float d;
    if (v_local.x < 0.0) {
        d = length(v_local);
    } else if (v_local.x > len) {
        d = length(vec2(v_local.x - len,v_local.y));
    } else {
        d = abs(v_local.y);
    }
    float core = smoothstep(w,0.0,d) * 1.6;
    float glow = smoothstep(w * 3.0,0.0,d) * 0.30;
    float along = clamp(1.0 - v_local.x / max(len,0.0001),0.0,1.0);
    float taper = 1.0 - 0.80 * along;
    return vec4(vec3((core + glow) * taper * bright * opacity),1.0);
}
#endif
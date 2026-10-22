extern vec2 chain_start;
extern vec2 chain_dir;
extern float fade_length;

// 链子起始端的线性淡出：按屏幕空间里沿链方向的距离做 alpha 渐变
vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    vec4 tex_color = Texel(tex, texture_coords) * color;
    float distance_along = dot(screen_coords - chain_start, chain_dir);
    float fade = clamp(distance_along / fade_length, 0.0, 1.0);
    tex_color.a *= fade;
    return tex_color;
}

extern float contrast;
extern float brightness;

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    vec4 texColor = Texel(tex, texture_coords);
    texColor.rgb += brightness;
    texColor.rgb = (texColor.rgb - 0.5) * contrast + 0.5;
    return texColor * color;
}
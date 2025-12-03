extern float contrast;  // 外部变量：对比度
extern float brightness; // 外部变量：亮度

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
    // 获取当前像素的颜色值
    vec4 texColor = Texel(texture, texture_coords);

    // 调整亮度
    texColor.rgb += brightness;

    // 调整对比度
    texColor.rgb = (texColor.rgb - 0.5) * contrast + 0.5;

    // 返回处理后的颜色值
    return texColor * color;
}
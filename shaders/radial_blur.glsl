extern vec2 start_coods; // 模糊中心 (像素坐标)
extern vec2 input_screen_coords; // 屏幕分辨率

const int nsamples = 16; // 大幅减少采样次数

// 生成伪随机噪声
float rand(vec2 co) {
    return fract(sin(dot(co.xy ,vec2(12.9898, 78.233))) * 43758.5453);
}

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    vec2 center = start_coods / input_screen_coords;
    vec2 uv = texture_coords;
    vec2 dir = uv - center;
    
    // 引入随机偏移，消除采样次数减少带来的阶梯感（Banding）
    float offset = rand(uv);
    
    vec4 final_color = vec4(0.0);
    float blur_width = 0.5;
    float blur_start = 0.75;
    
    for (int i = 0; i < nsamples; i++) {
        // 使用 (float(i) + offset) 让采样点随机化
        float scale = blur_start + (float(i) + offset) * (blur_width / float(nsamples));
        final_color += Texel(tex, dir * scale + center);
    }
    
    return (final_color / float(nsamples)) * color;
}

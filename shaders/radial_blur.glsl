extern vec2 start_coods;
extern vec2 input_screen_coords;
const int nsamples = 150;
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords){
    screen_coords = input_screen_coords;
    vec2 center = start_coods.xy / screen_coords.xy;
    float blurStart = 0.5;
    float blurWidth = 0.5;

    vec2 uv = texture_coords.xy;
    uv -= center;
    float precompute = blurWidth * (1.0 / float(nsamples - 1));

    vec4 finalColor = vec4(0.0);
    for (int i = 0; i < nsamples; i++){
        float scale = blurStart + (float(i) * precompute);
        finalColor += Texel(texture, uv * scale + center);
    }
    finalColor /= float(nsamples);
    return finalColor;
}
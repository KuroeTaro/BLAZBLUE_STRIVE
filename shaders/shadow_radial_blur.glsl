extern vec2 start_coods;
extern vec2 input_screen_coords;
extern float blur_start;     //0.5 
extern float blur_width;     //0.1
const int nsamples = 50;
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords){
    screen_coords = input_screen_coords;
    vec2 center = start_coods.xy / screen_coords.xy;

    vec2 uv = texture_coords.xy;
    uv -= center;
    float precompute = blur_width * (1.0 / float(nsamples - 1));

    vec4 finalColor = vec4(0.0);
    for (int i = 0; i < nsamples; i++){
        float scale = blur_start + (float(i) * precompute);
        finalColor += Texel(texture, uv * scale + center);
    }
    finalColor /= float(nsamples);
    return finalColor;
}
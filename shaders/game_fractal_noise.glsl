extern float time;
extern float input_x;

float hash(float x){
    return mod(sin(cos(x * 12.13) * 19.123) * 17.321,1.0);
}
float noise(vec2 p){
    vec2 pm = mod(p,1.0);
    vec2 pd = p - pm;
    float v0 = hash(pd.x + pd.y * 41.0);
    float v1 = hash(pd.x + 1.0 + pd.y * 41.0);
    float v2 = hash(pd.x + pd.y * 41.0 + 41.0);
    float v3 = hash(pd.x + pd.y * 41.0 + 42.0);
    v0 = mix(v0,v1,smoothstep(0.0,1.0,pm.x));
    v2 = mix(v2,v3,smoothstep(0.0,1.0,pm.x));
    return mix(v0,v2,smoothstep(0.0,1.0,pm.y));
}
vec4 effect(vec4 color,Image tex,vec2 texture_coords,vec2 screen_coords){
    vec2 uv = screen_coords.xy / 900;
    uv *= 0.5;
    float v = 0.0;
    // t = 1..11:原来是 i = 0..11、t = mod(1 + i,12),最后一圈 t = 0 时权重 (1 - t/12)*(t/12) = 0,
    // 算了等于没算,这里直接少跑那一圈(结果不变,展开后的代码少一份)
    for (float t = 1.0; t < 12.0; t += 1.0){
        float e = exp2(t);
        v += noise(uv * e + vec2(input_x,time*0.5)) * (1.0 - (t / 12.0)) * (t / 12.0);
    }
    v = ((v - 1) * 2 + 0.2 < 0) ? 0 : (((v - 1) * 2 + 0.2 > 1) ? 1 : (v - 1) * 2 + 0.2);
    v = v +0.2;
    v = mix(0.5,v,0.45);
    return vec4(v,v,v,1.0);
}
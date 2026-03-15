extern float time;
extern float opacity;

float random(vec2 st) {
    return fract(sin(dot(st.xy,vec2(12.9898,78.233))) * 43758.5453123);
}
bool isPointInCircle(vec2 point,vec2 center,float radius,float aspectRatio){
    vec2 pointAdjusted = vec2(point.x * aspectRatio,point.y);
    vec2 centerAdjusted = vec2(center.x * aspectRatio,center.y);
    return length(pointAdjusted - centerAdjusted) < radius;
}
vec4 effect(vec4 color,Image tex,vec2 texture_coords,vec2 screen_coords){
    vec2 uv = screen_coords / vec2(1600,900);
    float aspectRatio = 1600.0 / 900.0;
    int numParticles = 300;
    for (int i = 0; i < numParticles; ++i) {
        vec2 randomSeed = vec2(float(i) * 12.9898 + 78.233,float(i) * 57.0 + 93.0);
        vec2 initialPosition = vec2(random(randomSeed),random(randomSeed + 1.0));
        vec2 velocity = vec2(random(randomSeed + 2.0) - 0.5,random(randomSeed + 3.0) - 0.5) * 0.1;
        vec2 particlePosition = initialPosition + velocity * time;
        particlePosition = mod(particlePosition,vec2(1.0));
        float randomRadius = 0.0005 + 0.001 * random(randomSeed + 4.0);
        if (isPointInCircle(uv,particlePosition,randomRadius,aspectRatio)) {
            return vec4(opacity);
        }
    }
    return vec4(0.0);
}
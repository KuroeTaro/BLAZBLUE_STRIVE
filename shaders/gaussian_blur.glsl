extern number Directions;  // 方向数量 (默认 16)
extern number Quality;     // 采样质量 (默认 3)
extern number Size;        // 模糊半径
extern vec2 resolution;    // 纹理分辨率

const float Pi = 6.28318530718; // Pi * 2

vec4 effect(vec4 color, Image texture, vec2 texCoords, vec2 screenCoords) {
    vec4 sum = Texel(texture, texCoords);
    vec2 Radius = Size / resolution;
    
    for (float d = 0.0; d < Pi; d += Pi / Directions) {
        for (float i = 1.0 / Quality; i <= 1.0; i += 1.0 / Quality) {
            vec2 offset = vec2(cos(d), sin(d)) * Radius * i;
            sum += Texel(texture, texCoords + offset);
        }
    }

    sum /= (Quality * Directions - 15.0);
    return sum;
}

extern number Directions;
extern number Quality;
extern number Size;
extern vec2 resolution;

const float Pi = 6.28318530718; // Pi * 2

vec4 effect(vec4 color,Image tex,vec2 texture_coords,vec2 screen_coords){
    vec4 sum = Texel(tex,texture_coords);
    vec2 Radius = Size / resolution;
    for (float d = 0.0; d < Pi; d += Pi / Directions) {
        for (float i = 1.0 / Quality; i <= 1.0; i += 1.0 / Quality) {
            vec2 offset = vec2(cos(d),sin(d)) * Radius * i;
            sum += Texel(tex,texture_coords + offset);
        }
    }
    sum /= (Quality * Directions - 15.0);
    return sum;
}

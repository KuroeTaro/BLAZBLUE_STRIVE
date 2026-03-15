extern number radius;
extern number alpha;

vec4 effect(vec4 color,Image tex,vec2 texture_coords,vec2 screen_coords){
    vec4 sum = vec4(0.0);
    number count = 0.0;

    for (int x = -1; x <= 1; x++) {
        for (int y = -1; y <= 1; y++) {
            vec2 offset = vec2(x,y) * radius;
            sum += Texel(tex,texture_coords + offset);
            count += 1.0;
        }
    }

    sum /= count;
    sum.a *= alpha;
    return sum * color;
}
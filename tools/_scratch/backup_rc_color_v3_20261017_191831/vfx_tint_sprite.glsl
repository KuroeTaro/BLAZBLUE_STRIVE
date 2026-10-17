// 染色精灵的通用绘制 —— RC 的 partical / blast / shockwave 用
//
// 为什么不用 setColor 直接染白色贴图:
//   那几个贴图都是「白色 + 很硬的亮核」,用 add 混合时亮核一端上来就被裁到 1.0,
//   之后继续叠加的只有 G/B,于是红会往粉白跑(看起来「饱和度低」)。
//
// 这里的做法把「染色」和「亮度」拆开:
//   coverage = pow(贴图alpha * 顶点alpha, contrast) * brightness,再 clamp 到 0..1
//   rgb = tint * coverage
// 因为 coverage 永远 <= 1,输出永远不会超过 tint 本身,所以再怎么调亮也不会被推成白色,
// 颜色始终是纯的。
//
// contrast < 1 = 压低对比:抬中间调、把光晕摊开(0 和 1 两端不变,不会凭空多出一块矩形)
// brightness    = 覆盖度倍率,也就是整体亮度
//
// 输出是 premultiplied 形式(tint*a, a),
// 所以调用方要用 setBlendMode("add"/"alpha","premultiplied")

extern vec3 tint;
extern float brightness;
extern float contrast;

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords) {
    float coverage = Texel(tex,texture_coords).a * color.a;
    coverage = pow(coverage,contrast) * brightness;
    coverage = clamp(coverage,0.0,1.0);
    return vec4(tint * coverage,coverage);
}

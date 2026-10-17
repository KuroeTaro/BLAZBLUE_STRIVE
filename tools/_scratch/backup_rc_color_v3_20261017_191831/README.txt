备份时间: 20261017_191831
内容: 染色精灵改用 shader 的版本(亮度 x2 + 对比度 0.60)

旋钮:
- RC_partical : _VFX.lua 里 local brightness = 2.00 / local contrast = 0.60
- RC_blast    : _VFX.lua 里另一组同样的两个数
- RC_shockwave: _projectile.lua 顶部 VFX_RC_SHOCKWAVE_BRIGHTNESS / VFX_RC_SHOCKWAVE_CONTRAST

原理(shaders/vfx_tint_sprite.glsl):
  coverage = clamp(pow(贴图alpha * 顶点alpha, contrast) * brightness, 0, 1)
  rgb      = tint * coverage
  coverage 永远 <=1,输出不超过 tint 本身,所以调亮不会把颜色推成白色。
  contrast < 1 会把低 alpha 的区域抬起来(0.1 -> 0.5),等于把光晕摊开 = 降低对比。

v1 = 只染色(亮度 1.0 原始), v2 = 颜色 x1.40。

[更新] 这个方案已回滚,仓库里删掉了 shaders/vfx_tint_sprite.glsl。
本目录的 vfx_tint_sprite.glsl.txt 是同名 shader 的源码副本(注释里写了恢复步骤)。
如果不想再走 shader 方案,这个目录可以整个删掉。

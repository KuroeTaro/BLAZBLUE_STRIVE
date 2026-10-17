备份时间: 20261017_185404
内容: RC 三件套(partical / blast / shockwave)刚上好颜色、尚未调亮时的版本
- _VFX.lua        : RC_partical / RC_blast(含 opacity, blast_scale, color 参数)
- _anim.lua       : 四个 RC 的调用点(颜色 + 缩放 + 透明度)
- _projectile.lua : 四个 RC_shockwave 各自的 shockwave_color

当时的配色:
  red    {1.00,0.28,0.22}
  blue   {0.35,0.65,1.00}
  purple {0.78,0.40,1.00}
  yellow {1.00,0.88,0.30}

回滚方式: 把这三个文件拷回去即可。

备份时间: 20261017_185457
内容: RC 三件套配色 + 整体亮度 x1.40 的版本(v2)

亮度旋钮(每个只改一个数):
- RC_partical   -> scenes/game_scene/_common/_VFX.lua  里 local brightness = 1.40
- RC_blast      -> 同上(它后面那个 local brightness = 1.40)
- RC_shockwave  -> scenes/game_scene/_common/_projectile.lua 顶部 local VFX_RC_SHOCKWAVE_BRIGHTNESS = 1.40

配色(未乘系数):
  red    {1.00,0.28,0.22}
  blue   {0.35,0.65,1.00}
  purple {0.78,0.40,1.00}
  yellow {1.00,0.88,0.30}

v1(未调亮)在同级 backup_rc_color_v1_* 目录。

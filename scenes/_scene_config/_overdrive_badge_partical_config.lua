-- overdrive_badge_partical 的参数接口
-- 只改这个文件就能调整套爆霸徽章粒子/冲击波,不用动 shader 和逻辑。
-- 这些值每帧作为 uniform 送进:
--     shaders/overdrive_badge_particle.glsl      粒子(尺寸/转速/拖尾/收束范围)
--     shaders/overdrive_badge_partical_3d.glsl   冲击波(半径/厚度/亮度)
-- 改完重开游戏生效;particle_count 变化时会自动重建粒子的顶点 mesh。
OVERDRIVE_BADGE_PARTICAL_CONFIG =
{
    -- 粒子数量(两个阶段共用同一张 mesh,收缩段/爆发段各用这么多颗)
    particle_count = 300,
    -- 粒子大小倍率:1.0 = 最初 120 颗那版,0.2 = 现在的 1/5
    size_scale = 0.20,
    -- 旋转速度倍率:1.0 = 最初 0.55 rad,0.4 = 现在的 0.22 rad
    spin_scale = 0.0,
    -- 拖尾长度倍率:1.0 = 现在,2.0 = 现在的两倍
    trail_scale = 5.75,
    -- 收缩段起始半径(× 徽章半径 R):在 [min,max] 之间随机
    converge_start_min = 1.75,
    converge_start_max = 6.25,
    -- 收缩段终点(× R):0.02 表示收束到中心附近,0 = 正中心
    converge_target = 0.425,
    -- 冲击波环的起始半径 / 扩散到多远(× R)
    shockwave_radius_start = 0.5,
    shockwave_radius_grow = 3.75,
    -- 冲击波环的厚度(× R):从 base 随扩散线性长到 grow
    shockwave_width_base = 0.15,
    shockwave_width_grow = 0.240,
    -- 冲击波整体亮度
    shockwave_brightness = 0.85,
}

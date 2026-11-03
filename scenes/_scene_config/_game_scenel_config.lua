-- game_scene
-- collision
COLLIDE_TICK = 16
-- game_speed
GAME_SPEED_APPLY_FIELD_NAME_TABLE = {
	"0","game_speed","game_speed_subframe",
	"game_speed_abnormal_realtime_countdown",
	"game_speed_force_0_countdown","game_speed_force_1_countdown"
}
-- train_mode
TRAINING_MODE_CONFIG = {}
TRAINING_MODE_CONFIG["announcer"] = false
-- network
NETWORK_MATCH_SIDE = "L"
NETWORK_OTHER_SIDE = "R"
ROLLBACK_INPUT_TABLE = {}
ROLLBACK_INPUT_STATE_TABLE = {}
ROLLBACK_GAME_CACHE_TABLE = {}
-- draw & HUD
ROUND_COUNTER = 1
ROUND_FT = 2
ROUND_TIMER = {9,9,6,0} -- 99s and 60f
WIN_MARK = {}
WIN_MARK["L"] = 0
WIN_MARK["R"] = 0
MATCH_POINT = {}
MATCH_POINT["L"] = 0
MATCH_POINT["R"] = 0
CHARACTER_VISUAL_FRONT = "L"
-- collision
COLLSION_CONER_IN_STATE = {
    ["block"] = true,
    ["hurt"] = true,
    ["throw_hurt_success"] = true,
    ["throw_tested"] = true,
    ["throw_teching"] = true,
    ["hurtstop"] = true,
    ["blockstop"] = true,
    ["wallstick"] = true,
    ["wallbreak_hurt"] = true,
    ["knockdown"] = true,
    ["knockdown_recovery"] = true,
    ["knockdown_recovery_wallstick"] = true,
    ["knockout"] = true
}
-- overdrive
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
    converge_start_min = 3.75,
    converge_start_max = 6.25,
    -- 收缩段终点(× R):0.02 表示收束到中心附近,0 = 正中心
    converge_target = 0.425,
    -- 收缩段「往中心收束的充能波」:从外圈一层层往中心砸
    charge_brightness = 0.275,
    -- 充能波起始半径(× R)、撞进中心的半径(× R)
    charge_radius_start = 2.65,
    charge_radius_end = 0.05,
    -- 充能波厚度(× R):从 start 收到 end
    charge_width_start = 0.475,
    charge_width_end = 0.025,
    -- 充能波个数:同一段时间里往中心收的波有几条(取整,1..12)
    --   条数越多越密、整体越亮;起跑时间按条数均分,最后一条始终在爆发帧撞进中心
    charge_count = 2,
    -- 充能波飞行速度倍率:1.0 = 基准,越大飞得越快(单条寿命更短、起跑更晚)
    charge_speed = 1.0,
    -- 充能波整体模糊程度:越大整条波越虚(峰值降低、覆盖面变宽),越小越锐利
    charge_softness = 1.75,
    -- 冲击波环的起始半径 / 扩散到多远(× R)
    shockwave_radius_start = 0.5,
    shockwave_radius_grow = 3.75,
    -- 冲击波环的厚度(× R):从 base 随扩散线性长到 grow
    shockwave_width_base = 0.15,
    shockwave_width_grow = 0.240,
    -- 冲击波整体亮度
    shockwave_brightness = 0.85,
}
-- burst shockwave 飞行道具:程序化冲击波(insert_projectile_game_scene_char_common_burst_shockwave)
-- 全部由 shaders/burst_shockwave_projectile_3d.glsl 逐像素求值,不需要序列帧贴图。
-- R = 基准半径(设计像素,已含透视),半径 / 厚度都是 × 倍率。
BURST_SHOCKWAVE_PROJECTILE_CONFIG =
{
    -- 生命(帧):固定 11 帧(原 32 帧的扩散时长按 3 倍速压缩 → 10 帧走完 + 1 帧收尾)
    --   本体活到视觉放完为止,所以这份时长就是画面实际长度,不再有空转帧
    life = 24,
    -- 基准半径(设计像素):下面的 × 倍率都乘它
    radius = 350,
    -- 主环:起始半径(× R)、到结尾扩散到多远(× R)
    --   1.55 左右正好在「快出画」时淡完,再大就有一半life浪费在画面外
    radius_start = 0.75,
    radius_grow = 1.25,
    -- 主环厚度(× R):从 base 随扩散线性长到 grow
    width_base = 0.09,
    width_grow = 0.22,
    -- 整体亮度
    brightness = 1.00,
    -- 内侧回波:半径倍率 + 亮度倍率(0 = 不要回波)
    echo_scale = 0.78,
    echo_strength = 0,
    -- 起手中心闪光:强度 + 大小(× R),0 = 不要闪光
    flash_strength = 0.55,
    flash_size = 0.42,
    -- 淡出曲线:越大结尾收得越快
    fade_power = 2.75,
    -- 颜色:白色
    color = {1.00,1.00,1.00},
}
-- FD 屏障:把 FD_bubble(球罩)+ block_FD(8 帧命中环)合并成一个 shader
-- 半径 / 环位置都是 × 基准半径(R = 设计像素,已含透视)
FD_BLOCK_VFX_CONFIG =
{
    -- FD_bubble / block_FD 贴图都是 600x600,半径 300
    base_radius = 300,
    -- 球罩(照 FD_bubble 的 alpha 剖面:边缘最亮 0.43,往中心按 r^2.2 掉,球面处截断)
    bubble_size = 0.92,
    bubble_edge = 0.16,
    bubble_power = 2.20,
    bubble_brightness = 0.43,
    bubble_highlight = 0.0,
    bubble_wobble = 0.010,
    -- 内圈:一圈带羽化的径向渐变,从中心亮起,渐变到半径的一半就收干净
    bubble_inner_size = 0.50,
    bubble_inner_feather = 0.42,
    bubble_inner_brightness = 0.20,
    -- 命中环:循环动画(渐入 -> 放大 -> 渐出 -> 回到原始大小重新渐入)
    impact_loop_frame = 48,
    impact_radius_start = 0.45,
    impact_radius_end = 1.00,
    impact_peak = 0.85,
    impact_fade_in = 0.22,
    impact_fade_out = 0.55,
    impact_width = 0.030,
    impact_opacity = 0.500, -- 命中环单独的透明度(球罩用 opacity)
    impact_inner_feather = 0.30,
    -- 常驻(active_FD_block)屏障:渐入帧数 + 稳定后的透明度
    fade_in = 8,
    stance_opacity = 0.90,
    -- 颜色
    color = {1.00,1.00,1.00},
}
OVERDRIVE_BADGE_ANIM =
{
    -- 缩放:1.000 -> 0.790(收缩)-> 1.000(放大)-> 1.110(淡出时继续放大)
    scale =
    {
        [0] = {1.000,1},
        [1] = {1.000,4},
        [4] = {0.920,8},
        [8] = {0.860,13},
        [13] = {0.830,18},
        [18] = {0.800,25},
        [25] = {0.790,28},
        [28] = {0.790,29},
        [29] = {0.800,33},
        [33] = {0.900,38},
        [38] = {1.000,57},
        [57] = {1.000,60},
        [60] = {1.020,63},
        [63] = {1.040,66},
        [66] = {1.080,69},
        [69] = {1.110,69},
        ["prop"] = "scale_anim",
        ["length"] = 69,
        ["loop"] = false,
        ["fix_type"] = true
    },
    -- 亮度(0-1):淡入 -> 0.478 -> 爆发瞬间跳到 0.662 -> 1.000 -> 结尾淡出
    alpha =
    {
        [0] = {0.000,1},
        [1] = {0.105,4},
        [4] = {0.246,8},
        [8] = {0.344,13},
        [13] = {0.403,18},
        [18] = {0.448,25},
        [25] = {0.471,28},
        [28] = {0.478,29},
        [29] = {0.662,31},
        [31] = {0.863,33},
        [33] = {0.940,38},
        [38] = {1.000,57},
        [57] = {1.000,59},
        [59] = {0.926,61},
        [61] = {0.746,63},
        [63] = {0.525,65},
        [65] = {0.294,67},
        [67] = {0.116,69},
        [69] = {0.013,69},
        ["prop"] = 4,
        ["length"] = 69,
        ["loop"] = false,
        ["fix_type"] = true
    }
}
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
    -- 冲击波环的起始半径 / 扩散到多远(× R)
    shockwave_radius_start = 0.5,
    shockwave_radius_grow = 3.75,
    -- 冲击波环的厚度(× R):从 base 随扩散线性长到 grow
    shockwave_width_base = 0.15,
    shockwave_width_grow = 0.240,
    -- 冲击波整体亮度
    shockwave_brightness = 0.85,
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
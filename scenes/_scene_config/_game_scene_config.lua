-- character_select_scene / game_scene 的公共配置
-- character_select_scene & game_scene
GAME_MODE = 0 -- 0.训练模式 1.本地多人 2.在线多人
CHAR_SELECT_LR = {}
CHAR_SELECT_LR["L"] = 4
CHAR_SELECT_LR["R"] = 5
CONTROL_METHOD = {}
CONTROL_METHOD["L"] = 1
CONTROL_METHOD["R"] = 1
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

-- game_scene:进入这些状态时把角色的碰撞角点也纳入
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
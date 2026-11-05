-- 地面 FD 防御动画 / FD_block_state_cache / block 出口 自检
--   H:/_love/_11.5/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/fd_block_anim_check
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/fd_block_anim_check"
local lines = {}
local function log(s) lines[#lines + 1] = tostring(s) end
local function flush()
    local f = io.open(DIR .. "/result.txt", "w")
    if f then f:write(table.concat(lines, "\n")); f:close() end
end
function love.errorhandler(msg)
    local f = io.open(DIR .. "/result.txt", "w")
    if f then f:write(table.concat(lines, "\n")); f:write("\nERROR: "..tostring(msg).."\n"); f:write(debug.traceback("",2)); f:close() end
    love.event.quit(1)
    os.exit(1)
    return function() os.exit(1) end
end

local fails, checks = 0, 0
local function check(cond, msg)
    checks = checks + 1
    if cond then log("  ok   " .. msg) else fails = fails + 1; log("  FAIL " .. msg) end
end

local pressed = {}
local function install_stubs()
    test_input_sys_press = function(v) return pressed[v] == true end
    test_input_sys_press_or_hold = function(v) return pressed[v] == true end
    collision_test_char_on_ground = function() return false end
    insert_VFX_game_scene_char_FD_block = function() return end
    insert_VFX_game_scene_stage_smoke_horizontal_shot = function() return end
    play_obj_audio = function() end
    stop_obj_audio = function() end
    INPUT_SYS_COMMAND_TABLE = {
        "up","down","left","right",
        "P","S","H","K",
        "SP","Launcher","back","start",
        "RC","dash","burst","UA",
        "correction_up","correction_down",
        "correction_left","correction_right"
    }
    INPUT_SYS_CURRENT_COMMAND_STATE = {["L"] = {},["R"] = {}}
    obj_stage_game_scene_main = {["camera_active_application_table"] = {}}
    obj_stage_game_scene_camera = {}
    -- 让 from_block 只走我们关心的分支
    state_gate_game_scene_char_LP_common_to_burst_overdrive = function() return nil end
    state_gate_game_scene_char_RP_common_to_burst_overdrive = function() return nil end
    state_gate_game_scene_char_LP_common_to_burst_RC_yellow = function() return nil end
    state_gate_game_scene_char_RP_common_to_burst_RC_yellow = function() return nil end
    state_gate_game_scene_char_LP_common_ground_to_dash_move_HH = function() return nil end
    state_gate_game_scene_char_RP_common_ground_to_dash_move_HH = function() return nil end
    state_gate_game_scene_char_LP_from_5_stand_idle = function() return nil end
    state_gate_game_scene_char_RP_from_5_stand_idle = function() return nil end
    state_machine_char_game_scene_char_LP_input_sys_cache = function() end
    state_machine_char_game_scene_char_RP_input_sys_cache = function() end
    load_game_scene_anim_char_TRM_5_stand_idle = function()
        return {["prop_f"] = "f",["anim_length"] = 1}
    end
    load_game_scene_anim_char_TRM_1_2_3_crouch = function()
        return {["prop_f"] = "f",["anim_length"] = 1}
    end
    load_game_scene_anim_char_TRM_7_8_9_jump_air = function()
        return {["prop_f"] = "f",["anim_length"] = 1}
    end
end

local function new_hit(t)
    local c = {
        ["player_side"] = "L", [5] = 1, ["x"] = 100, ["y"] = 0,
        ["velocity"] = {0,0}, ["collision_move_available"] = {1,1},
        ["friction"] = 1, ["gravity"] = 2.5,
        ["hit_damage"] = 300.0, ["hit_damage_correction_factor"] = 0.9,
        ["hit_hurt_blockstop_countdown"] = 12,
        ["hit_heat_gain"] = 5.0, ["hurt_heat_gain"] = 2.0,
        ["hit_wallbreak_damage"] = 20.0,
        ["blocked_heat_gain"] = 8.0, ["block_heat_gain"] = 2.0,
        ["block_risk_gauge_gain"] = 25.0, ["FD_block_heat_drain"] = 5.0,
        ["heat_gauge"] = {0.0,200.0}, ["heat_penalty"] = 1,
        ["positive_bonus_heat_gain_buff"] = 1,
        ["positive_bonus_hit_damage_buff"] = 1,
        ["overdrive_gauge"] = {600.0,600.0},
        ["hurt_block_VFX_insert_function"] = function() end,
    }
    for k,v in pairs(t or {}) do c[k] = v end
    return c
end

local function new_hurt(t)
    local c = {
        ["player_side"] = "L", [5] = 1, ["x"] = 0, ["y"] = 0,
        ["height"] = "stand", ["direction_input"] = 4,
        ["velocity"] = {0,0}, ["velocity_cache"] = {0,0},
        ["friction"] = 1, ["gravity"] = 2.5,
        ["horizontal_velocity_correction"] = 1,
        ["gravity_correction"] = 1, ["damage_correction"] = 1,
        ["collision_move_available"] = {1,1},
        ["health_gauge"] = {12000,12000,12000},
        ["ability_gauge"] = {600.0,600.0},
        ["heat_gauge"] = {100.0,200.0},
        ["overdrive_gauge"] = {600.0,600.0,"off"},
        ["risk_gauge"] = {0.0,300.0}, ["wallstick_gauge"] = {0.0,200.0},
        ["heat_penalty"] = 1,
        ["positive_bonus_heat_gain_buff"] = 1,
        ["positive_bonus_hit_damage_buff"] = 1,
        ["positive_bonus_hurt_damage_buff"] = 1,
        ["input_sys_cache"] = {}, ["input_sys_state"] = "none",
        ["state"] = "5_stand_idle", ["state_cache"] = "none",
        ["physics_lock"] = false, ["hurt_state"] = "idle",
        ["f"] = -1, ["FCT"] = {0,0,0,0,0,0,0,0},
        ["LCT"] = {0,0,0,0,0,0,0,0}, ["LCD"] = {0,0,0,0,0,0,0,0},
        [8] = 0, ["character_animation"] = nil,
        ["3d_pos_x"] = 0, ["3d_pos_y"] = 0,
        ["hurtstop_wiggle_x"] = 0, ["hurtstop_wiggle_y"] = 0,
        ["pushbox"] = {0,-185,120,370}, ["hurtbox_table"] = {},
        ["hitbox_table"] = {}, ["collision_ground_height_offset"] = 0,
        ["hit_hurt_blockstop_countdown"] = 0, ["last_hitstop_frame"] = 0,
        ["VFX_hit_front_table"] = {}, ["VFX_hit_back_table"] = {},
        ["FD_block_state_cache"] = false,
    }
    for k,v in pairs(t or {}) do c[k] = v end
    return c
end

local function build_block_animations(hit,hurt)
    hit["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv0(
        hit,hurt,"4_stand_block_mid","stand","5_stand_idle",
        37.5,5,1.00,0,2.5,1.00,
        nil,nil,nil,nil,function() end
    )
    hit["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv0(
        hit,hurt,"1_crouch_block","crouch","1_2_3_crouch",
        37.5,5,1.00,0,2.5,1.00,
        nil,nil,nil,nil,function() end
    )
    hit["air_block_animation"] = {["prop_f"] = "f",["anim_length"] = 1}
end

function love.load()
    for _, rel in ipairs({
        "/scenes/game_scene/characters/TRM/left.lua",
        "/scenes/game_scene/characters/TRM/right.lua",
        "/update_general_use_functions/animator.lua",
        "/scenes/game_scene/_common/_anim.lua",
        "/scenes/_scene_config/_game_scenel_config.lua",
        "/scenes/game_scene/_common/common_functions.lua",
    }) do
        local chunk, err = loadfile(REPO .. rel)
        if not chunk then log("load FAIL " .. rel .. " " .. tostring(err)); flush(); love.event.quit(1); return end
        local ok, e = pcall(chunk)
        if not ok then log("run FAIL " .. rel .. " " .. tostring(e)); flush(); love.event.quit(1); return end
    end
    install_stubs()
    load_game_scene_box_anchor_data_LP()
    load_game_scene_box_anchor_data_RP()

    local input_L = {["correction_left"] = "correction_left",["correction_right"] = "correction_right"}
    local input_R = {["correction_left"] = "correction_left",["correction_right"] = "correction_right"}
    INPUT_SYS_CURRENT_COMMAND_STATE["L"] = input_L
    INPUT_SYS_CURRENT_COMMAND_STATE["R"] = input_R
    local opp = {["state"] = "5_stand_idle", ["x"] = 100, [5] = -1}

    log("[FD 动画构造器]")
    local o = new_hurt({["player_side"] = "L"})
    local src = {["prop_f"] = "f",["anim_length"] = 12}
    local hits = {0,0,0}
    src[0] = function() hits[1] = hits[1] + 1 end
    src[5] = function() hits[2] = hits[2] + 1 end
    src[12] = function() hits[3] = hits[3] + 1 end
    local fd = load_game_scene_anim_char_common_0_ground_FD_block(o,src)
    check(fd["anim_length"] == 12, "anim_length 与普通版本一致")
    check(fd["prop_f"] == "f", "prop_f 与普通版本一致")
    init_character_anim_with(o,fd)
    check(hits[1] == 1, "原动画第 0 帧逻辑仍然执行")
    check(o[8] == 2, "第 0 帧视觉帧 = 2")
    local seq = {o[8]}
    for i = 1,12 do
        character_animator(o,fd)
        seq[#seq + 1] = o[8]
    end
    local compact = {}
    for i = 1,#seq do
        if compact[#compact] ~= seq[i] then compact[#compact + 1] = seq[i] end
    end
    check(table.concat(compact,",") == "2,3,4,2", "视觉帧 2/3/4 每 4F 循环(" .. table.concat(compact,",") .. ")")
    check(hits[2] == 1 and hits[3] == 1, "原动画第 5/12 帧逻辑仍然执行")

    log("")
    log("[缓存 / hurt 防御部分]")
    local hit = new_hit()
    local hurt = new_hurt({["state"] = "blockstop"})
    build_block_animations(hit,hurt)
    pressed = {["correction_left"] = true}
    common_game_scene_strike_hurt_function_common_block(
        hit,hurt,obj_stage_game_scene_main,obj_stage_game_scene_camera
    )
    check(hurt["FD_block_state_cache"] == true, "地面 + FD:FD_block_state_cache = true")
    check(hurt["FD_block_height_cache"] == "stand", "记录 FD 防御高度 = stand")
    check(hit["stand_FD_block_animation"] ~= nil, "创建了 stand_FD_block_animation")
    check(hurt["character_animation"] == hit["stand_FD_block_animation"],
        "站姿 FD 防御使用 stand_FD_block_animation")
    check(hurt["sprite_sheet"] == "4_stand_block_mid", "普通防御的 sprite_sheet/逻辑被复用")
    check(hurt[8] == 2, "FD 防御第 0 帧视觉帧 = 2")
    local seq2 = {hurt[8]}
    for i = 1,8 do
        character_animator(hurt,hurt["character_animation"])
        seq2[#seq2 + 1] = hurt[8]
    end
    check(seq2[5] == 3 and seq2[9] == 4, "FD 防御动画序列 2 -> 3 -> 4(" ..
        table.concat(seq2,",") .. ")")

    -- hurt -> block 出口 全链路
    hurt["f"] = 99
    local r_int = state_gate_game_scene_char_LP_from_block(input_L,{},hurt,opp)
    check(r_int == true and hurt["state"] == "active_FD_block" and hurt["f"] == 8,
        "hurt 设好 cache -> block 出口直接进 active_FD_block 并跳过 8f")

    -- 同一动作再次触发:缓存复用
    local first_fd = hit["stand_FD_block_animation"]
    common_game_scene_strike_hurt_function_common_block(
        hit,hurt,obj_stage_game_scene_main,obj_stage_game_scene_camera
    )
    check(hit["stand_FD_block_animation"] == first_fd, "同一防御动画的 FD 版本会复用缓存")

    -- 无 FD:保持原逻辑
    pressed = {}
    local hit2 = new_hit()
    local hurt2 = new_hurt({["state"] = "blockstop"})
    build_block_animations(hit2,hurt2)
    common_game_scene_strike_hurt_function_common_block(
        hit2,hurt2,obj_stage_game_scene_main,obj_stage_game_scene_camera
    )
    check(hurt2["FD_block_state_cache"] == false, "无 FD:FD_block_state_cache = false")
    check(hurt2["character_animation"] == hit2["stand_block_animation"],
        "无 FD:使用普通 stand_block_animation")
    check(hit2["stand_FD_block_animation"] == nil, "无 FD:不会创建 FD 版本")

    -- 蹲姿 FD
    pressed = {["correction_left"] = true}
    local hit3 = new_hit()
    local hurt3 = new_hurt({["state"] = "blockstop",["direction_input"] = 1,["height"] = "crouch"})
    build_block_animations(hit3,hurt3)
    common_game_scene_strike_hurt_function_common_block(
        hit3,hurt3,obj_stage_game_scene_main,obj_stage_game_scene_camera
    )
    check(hurt3["FD_block_state_cache"] == true, "蹲姿 FD:cache = true")
    check(hurt3["FD_block_height_cache"] == "crouch", "蹲姿 FD:高度 = crouch")
    check(hurt3["character_animation"] == hit3["crouch_FD_block_animation"],
        "蹲姿 FD:使用 crouch_FD_block_animation")
    check(hurt3[8] == 2 and hurt3["sprite_sheet"] == "1_crouch_block",
        "蹲姿 FD:第 0 帧视觉帧 = 2")

    -- 空中 FD:不算地面,不用 FD 版本
    pressed = {["correction_left"] = true}
    local hit4 = new_hit()
    local hurt4 = new_hurt({["height"] = "air",["direction_input"] = 4})
    build_block_animations(hit4,hurt4)
    common_game_scene_strike_hurt_function_common_block(
        hit4,hurt4,obj_stage_game_scene_main,obj_stage_game_scene_camera
    )
    check(hurt4["FD_block_state_cache"] == false, "空中 FD:cache = false")
    check(hurt4["character_animation"] == hit4["air_block_animation"],
        "空中 FD:使用普通 air_block_animation")

    log("")
    log("[block 出口]")
    local function make_block_hurt(height,dir,cache_height)
        local h = new_hurt({
            ["state"] = "block",["state_cache"] = "block",
            ["height"] = height,["direction_input"] = dir,
            ["sprite_sheet"] = (height == "crouch") and "1_crouch_block" or "4_stand_block_mid",
            ["FD_block_state_cache"] = true,
            ["FD_block_height_cache"] = cache_height,
            ["character_animation"] = {["prop_f"] = "f",["anim_length"] = 10},
            ["f"] = 99,
        })
        return h
    end

    -- 1) 继续 FD + 高度不变:进 active_FD_block,跳过前 8f
    pressed = {["correction_left"] = true}
    local h1 = make_block_hurt("stand",4,"stand")
    local r1 = state_gate_game_scene_char_LP_from_block(input_L,{},h1,opp)
    check(r1 == true and h1["state"] == "active_FD_block",
        "继续 FD + 高度不变:进入 active_FD_block")
    check(h1["f"] == 8, "跳过前 8f:f = 8(实际 " .. tostring(h1["f"]) .. ")")
    check(h1[8] == 2, "跳过前 8f:视觉帧 = 2(实际 " .. tostring(h1[8]) .. ")")
    check(h1["sprite_sheet"] == "4_stand_block_high",
        "进入 active_FD_block 使用 4_stand_block_high")
    check(math.abs(h1["heat_gauge"][1] - 99.0) < 1.0e-6,
        "第 0 帧与第 8 帧的逻辑都执行(heat 100 -> 99)")

    -- 2) 继续 FD + 高度变化:不跳过,从第 0 帧播
    pressed = {["correction_left"] = true}
    local h2 = make_block_hurt("crouch",1,"stand")
    local r2 = state_gate_game_scene_char_LP_from_block(input_L,{},h2,opp)
    check(r2 == true and h2["state"] == "active_FD_block",
        "继续 FD + 高度变化:进入 active_FD_block")
    check(h2["f"] == 0, "高度变化:不从 8f 开始(f = " .. tostring(h2["f"]) .. ")")
    check(h2["height"] == "crouch" and h2["sprite_sheet"] == "1_crouch_block",
        "高度变化:切到蹲姿 1_crouch_block")
    check(h2[8] == 0, "高度变化:第 0 帧视觉帧 = 0")

    -- 3) 没有继续 FD:进 active_FD_block_to_idle
    pressed = {}
    local h3 = make_block_hurt("stand",4,"stand")
    local r3 = state_gate_game_scene_char_LP_from_block(input_L,{},h3,opp)
    check(r3 == true and h3["state"] == "active_FD_block_to_idle",
        "没有继续 FD:进入 active_FD_block_to_idle")
    check(h3["character_animation"]["anim_length"] == 10, "收招动画 10 帧")

    -- 4) cache 为 false:保持原逻辑(回中立)
    pressed = {["correction_left"] = true}
    local h4 = make_block_hurt("stand",4,"stand")
    h4["FD_block_state_cache"] = false
    local r4 = state_gate_game_scene_char_LP_from_block(input_L,{},h4,opp)
    check(r4 == nil and h4["state"] == "5_stand_idle",
        "cache = false:保持原逻辑回 5_stand_idle")

    -- 5) RP 镜像
    pressed = {["correction_left"] = true}
    local h5 = make_block_hurt("stand",4,"stand")
    h5["player_side"] = "R"
    local r5 = state_gate_game_scene_char_RP_from_block(input_R,{},h5,opp)
    check(r5 == true and h5["state"] == "active_FD_block" and h5["f"] == 8,
        "RP 镜像:继续 FD 同样跳过 8f 进入 active_FD_block")

    log("")
    log(string.format("checks=%d fails=%d", checks, fails))
    log(fails == 0 and "RESULT: OK" or "RESULT: FAIL")
    flush()
    love.event.quit(fails == 0 and 0 or 1)
end
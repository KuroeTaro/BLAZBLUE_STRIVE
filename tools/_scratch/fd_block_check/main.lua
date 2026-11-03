-- active_FD_block 行为自检
--   H:/_love/_11.5/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/fd_block_check
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/fd_block_check"
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
local function eq(a, b)
    if type(a) ~= "table" or type(b) ~= "table" then return a == b end
    if #a ~= #b then return false end
    for i = 1, #b do if not eq(a[i], b[i]) then return false end end
    return true
end

local pressed = {}
local called = {}
local function install_stubs()
    test_input_sys_press = function(v) return pressed[v] == true end
    test_input_sys_press_or_hold = function(v) return pressed[v] == true end
    collision_test_char_on_ground = function() return false end
    -- FD 屏障:用仓库里真实的 insert,只把渲染 / shader 桩掉
    common_game_scene_get_VFX_spawn_anchor = function()
        return {
            ["FD_block_spawn_anchor_pos"] = {
                ["stand"] = {-300,-540},
                ["crouch"] = {-300,-420},
                ["air"] = {-300,-440}
            }
        }
    end
    image_VFX_game_scene_FD_bubble = {["stub"] = true}
    draw_3d_image = function() end
    INPUT_SYS_CURRENT_COMMAND_STATE = {["L"] = {},["R"] = {}}
    -- 取消门:默认不触发,测试里按需改成返回 true
    cancel_test = { overdrive = false, RC_blue = false }
    state_gate_game_scene_char_LP_common_to_burst_overdrive = function()
        return cancel_test.overdrive or nil
    end
    state_gate_game_scene_char_LP_common_to_burst_RC_blue = function()
        return cancel_test.RC_blue or nil
    end
    state_gate_game_scene_char_RP_common_to_burst_overdrive = function()
        return cancel_test.overdrive or nil
    end
    state_gate_game_scene_char_RP_common_to_burst_RC_blue = function()
        return cancel_test.RC_blue or nil
    end
    common_game_scene_get_input_sys_cache_state_machine = function() return function() end end
    state_machine_char_game_scene_char_LP_input_sys_cache = function() end
    state_machine_game_scene_char_RP_input_sys_cache = function() end
    -- 中立动画只要是个能跑的壳就行(真实动画文件依赖一堆全局)
    local function stub_anim()
        return {["prop_f"] = "f",["anim_length"] = 1}
    end
    load_game_scene_anim_char_TRM_5_stand_idle = function() return stub_anim() end
    load_game_scene_anim_char_TRM_1_2_3_crouch = function() return stub_anim() end
    load_game_scene_anim_char_TRM_7_8_9_jump_air = function() return stub_anim() end
    for _, side in ipairs({ "LP", "RP" }) do
        called[side] = {}
        _G["state_gate_game_scene_char_" .. side .. "_common_ground_to_dash_move_HH"] =
            function() called[side].ground = true; return nil end
        _G["state_gate_game_scene_char_" .. side .. "_common_air_to_dash_move_HH"] =
            function() called[side].air = true; return nil end
        _G["state_gate_game_scene_char_" .. side .. "_from_5_stand_idle"] =
            function() called[side].stand = true; return nil end
        _G["state_gate_game_scene_char_" .. side .. "_from_1_2_3_crouch"] =
            function() called[side].crouch = true; return nil end
        _G["state_gate_game_scene_char_" .. side .. "_from_7_8_9_jump_air"] =
            function() called[side].jump = true; return nil end
    end
end

local function new_char(t)
    local c = {
        ["state"] = "5_stand_idle",
        ["height"] = "stand",
        ["direction_input"] = 5,
        ["player_side"] = "L",
        ["velocity"] = {1,2},
        ["velocity_cache"] = {1,2},
        ["character_animation"] = "anim_old",
        ["hitbox_table"] = {},
        ["pushbox"] = {0,-185,120,370},
        ["hurtbox_table"] = {},
        ["x"] = 0,["y"] = 0,
        ["VFX_hit_front_table"] = {},
        ["VFX_hit_back_table"] = {},
        ["anchor_pos"] = {0,0},
        ["idle_cancel"] = false,
        ["heat_gauge"] = {200.0,200.0},
        ["overdrive_gauge"] = {600.0,600.0,"off"},
        [5] = 1,[6] = 1,[8] = 0,
    }
    for k, v in pairs(t or {}) do c[k] = v end
    return c
end

function love.load()
    for _, rel in ipairs({
        "/scenes/game_scene/characters/TRM/left.lua",
        "/scenes/game_scene/characters/TRM/right.lua",
        "/update_general_use_functions/animator.lua",
        "/scenes/game_scene/_common/_anim.lua",
        "/scenes/_scene_config/_game_scenel_config.lua",
        "/scenes/game_scene/_common/common_functions.lua",
        "/scenes/game_scene/_common/_VFX.lua",
    }) do
        local chunk, err = loadfile(REPO .. rel)
        if not chunk then log("load FAIL " .. rel .. " " .. tostring(err)); flush(); love.event.quit(1); return end
        local ok, e = pcall(chunk)
        if not ok then log("run FAIL " .. rel .. " " .. tostring(e)); flush(); love.event.quit(1); return end
    end
    install_stubs()
    load_game_scene_box_anchor_data_LP()
    load_game_scene_box_anchor_data_RP()

    -- 真机里 self_side_input[键名] 拿到的是该键当前状态,再由 test_input_sys_* 判定
    local input = {["correction_left"] = "correction_left", ["correction_right"] = "correction_right"}
    local opp_input = {}
    local opp = { ["state"] = "5_stand_idle", ["x"] = 100, [5] = -1 }

    log("[common_to_active_FD_block]")
    -- 1) 后方向 + FD 键 -> 站姿 FD
    pressed = { ["correction_left"] = true }
    local c = new_char({ ["direction_input"] = 4 })
    local r = state_gate_game_scene_char_LP_common_to_active_FD_block(input, opp_input, c, opp)
    check(r == true, "后 + correction_left -> 返回 true")
    check(c["state"] == "active_FD_block", "state -> active_FD_block")
    check(c["sprite_sheet"] == "4_stand_block_high", "站姿用 4_stand_block_high")
    check(eq(c["pushbox"], {0,-185,120,370}), "站姿 pushbox = stand_pushbox")
    check(eq(c["hurtbox_table"], {{0,-220,210,440},{0,-455,120,30}}), "站姿 hurtbox = stand_hurtbox")
    check(eq(c["anchor_pos"], {150,510}), "站姿 anchor = {150,510}")
    check(c["height"] == "stand" and c["collision_ground_height_offset"] == 0, "height/ground offset 正确")
    -- 2) correction_right 也认
    pressed = { ["correction_right"] = true }
    c = new_char({ ["direction_input"] = 4 })
    check(state_gate_game_scene_char_LP_common_to_active_FD_block(input, opp_input, c, opp) == true
        and c["state"] == "active_FD_block", "后 + correction_right 也能进")
    -- 3) 只按 FD 键、不按防御方向 -> 不进
    c = new_char({ ["direction_input"] = 5 })
    check(state_gate_game_scene_char_LP_common_to_active_FD_block(input, opp_input, c, opp) == nil
        and c["state"] == "5_stand_idle", "中立方向 + FD 不进")
    -- 4) 只按后、不按 FD -> 不进
    pressed = {}
    c = new_char({ ["direction_input"] = 4 })
    check(state_gate_game_scene_char_LP_common_to_active_FD_block(input, opp_input, c, opp) == nil,
        "只按后不按 FD 不进")
    -- 5) 蹲防
    pressed = { ["correction_left"] = true }
    c = new_char({ ["direction_input"] = 1 })
    state_gate_game_scene_char_LP_common_to_active_FD_block(input, opp_input, c, opp)
    check(c["sprite_sheet"] == "1_crouch_block" and c["height"] == "crouch",
        "蹲防 -> 1_crouch_block / crouch")
    check(eq(c["pushbox"], {0,-142.5,120,285}), "蹲姿 pushbox = crouch_pushbox")
    -- 6) 空中
    c = new_char({ ["direction_input"] = 4, ["height"] = "air" })
    state_gate_game_scene_char_LP_common_to_active_FD_block(input, opp_input, c, opp)
    check(c["sprite_sheet"] == "1_4_7_air_block" and c["height"] == "air",
        "空中 FD -> 1_4_7_air_block / air")
    check(c["collision_ground_height_offset"] == 185, "空中 ground offset = 185")

    log("")
    log("[from_active_FD_block]")
    -- 1) 一直按着:保持状态
    pressed = { ["correction_left"] = true }
    c = new_char({ ["state"] = "active_FD_block", ["direction_input"] = 4,
        ["sprite_sheet"] = "4_stand_block_high" })
    local ret = state_gate_game_scene_char_LP_from_active_FD_block(input, opp_input, c, opp)
    check(ret == nil and c["state"] == "active_FD_block", "按着不放:留在 active_FD_block")
    -- 2) 站 -> 蹲(方向变化)切姿态
    called["LP"].stand = false
    c["direction_input"] = 1
    state_gate_game_scene_char_LP_from_active_FD_block(input, opp_input, c, opp)
    check(c["sprite_sheet"] == "1_crouch_block" and c["state"] == "active_FD_block",
        "方向改成蹲:切 1_crouch_block,仍在 active_FD_block")
    -- 3) 松开 FD:回 idle
    pressed = {}
    c = new_char({ ["state"] = "active_FD_block", ["direction_input"] = 4,
        ["sprite_sheet"] = "4_stand_block_high" })
    ret = state_gate_game_scene_char_LP_from_active_FD_block(input, opp_input, c, opp)
    check(ret == true, "松开 FD -> 返回 true")
    check(c["state"] == "5_stand_idle" and type(c["character_animation"]) == "table",
        "松开 FD -> 回 5_stand_idle")
    check(called["LP"].stand, "回中立后走了 from_5_stand_idle 的门")
    -- 4) 蹲姿松开 -> 1_2_3_crouch
    called["LP"].crouch = false
    c = new_char({ ["state"] = "active_FD_block", ["height"] = "crouch",
        ["direction_input"] = 1, ["sprite_sheet"] = "1_crouch_block" })
    state_gate_game_scene_char_LP_from_active_FD_block(input, opp_input, c, opp)
    check(c["state"] == "1_2_3_crouch" and called["LP"].crouch, "蹲姿松开 -> 1_2_3_crouch")
    -- 5) 空中松开 -> 7_8_9_jump_air
    called["LP"].jump = false
    c = new_char({ ["state"] = "active_FD_block", ["height"] = "air",
        ["direction_input"] = 4, ["sprite_sheet"] = "1_4_7_air_block" })
    state_gate_game_scene_char_LP_from_active_FD_block(input, opp_input, c, opp)
    check(c["state"] == "7_8_9_jump_air" and called["LP"].jump, "空中松开 -> 7_8_9_jump_air")
    -- 6) 只松开防御方向(还按着 FD)也回中立
    pressed = { ["correction_left"] = true }
    c = new_char({ ["state"] = "active_FD_block", ["direction_input"] = 5,
        ["sprite_sheet"] = "4_stand_block_high" })
    state_gate_game_scene_char_LP_from_active_FD_block(input, opp_input, c, opp)
    check(c["state"] == "5_stand_idle", "松开防御方向(仍按 FD)-> 回中立")

    log("")
    log("[RP 镜像]")
    pressed = { ["correction_left"] = true }
    c = new_char({ ["direction_input"] = 4 })
    local rp = state_gate_game_scene_char_RP_common_to_active_FD_block(input, opp_input, c, opp)
    check(rp == true and c["state"] == "active_FD_block", "RP 也能进 active_FD_block")
    pressed = {}
    state_gate_game_scene_char_RP_from_active_FD_block(input, opp_input, c, opp)
    check(c["state"] == "5_stand_idle", "RP 松开回中立")

    log("")
    log("[帧序列 / 速度重力 / 资源 / 屏障 / 取消]")
    -- 1) 帧序列:0 1 2 3 4 之后 2 3 4 循环
    local c2 = new_char({ ["velocity"] = {0,0} })
    local anim2 = load_game_scene_anim_char_common_active_FD_block(c2, "4_stand_block_high", "stand")
    init_character_anim_with(c2, anim2)
    local seq = { c2[8] }
    for i = 1, 30 do
        character_animator(c2, anim2)
        seq[#seq + 1] = c2[8]
    end
    local compact = {}
    for i = 1, #seq do
        if compact[#compact] ~= seq[i] then compact[#compact + 1] = seq[i] end
    end
    local expect = { 0,1,2,3,4,2,3,4 }
    local seq_ok = #compact >= #expect
    for i = 1, #expect do if compact[i] ~= expect[i] then seq_ok = false end end
    check(seq_ok, "帧序列 0,1,2,3,4 -> 2,3,4 循环(" .. table.concat(compact, ",") .. ")")

    -- 2) 地面:阻力 7
    c2 = new_char({ ["velocity"] = {5,-3} })
    init_character_anim_with(c2,
        load_game_scene_anim_char_common_active_FD_block(c2, "4_stand_block_high", "stand"))
    check(c2["friction"] == 7, "地面进入:friction = 7")
    check(c2["gravity"] == 2.5, "地面进入:gravity = 2.5")
    -- 3) 空中:保留速度,重力 2.75
    c2 = new_char({ ["velocity"] = {5,-3} })
    init_character_anim_with(c2,
        load_game_scene_anim_char_common_active_FD_block(c2, "1_4_7_air_block", "air"))
    check(c2["velocity"][1] == 5 and c2["velocity"][2] == -3, "空中进入:保留原有速度")
    check(c2["gravity"] == 2.75, "空中进入:gravity = 2.75")
    check(c2["friction"] == 1, "空中进入:friction = 1")

    -- 4) 进入时插屏障 + 每帧扣 heat
    pressed = { ["correction_left"] = true }
    local c3 = new_char({ ["direction_input"] = 4, ["heat_gauge"] = {200.0,200.0} })
    state_gate_game_scene_char_LP_common_to_active_FD_block(input, opp_input, c3, opp)
    check(#c3["VFX_hit_front_table"] == 1
        and c3["VFX_hit_front_table"][1]["type"] == "FD_block", "进入时插了屏障特效")
    local vfx3 = c3["VFX_hit_front_table"][1]
    for i = 1, 3 do
        vfx3["update"]()
        state_gate_game_scene_char_LP_from_active_FD_block(input, opp_input, c3, opp)
    end
    check(vfx3["release"] ~= true, "按住期间屏障没有进入渐出")
    check(vfx3[4] > 0, "屏障渐入中 opacity = " .. string.format("%.2f", vfx3[4]))

    -- 5) 松开:VFX 自己检测到输入松开 -> release -> 渐出 -> life 0
    pressed = {}
    state_gate_game_scene_char_LP_from_active_FD_block(input, opp_input, c3, opp)
    check(c3["state"] == "5_stand_idle", "松开 FD:回 5_stand_idle")
    vfx3["update"]()
    check(vfx3["release"] == true, "松开 FD:VFX 自己进入渐出(不需要外部收)")
    for i = 1, 8 do vfx3["update"]() end
    check(vfx3["life"] <= 0 and vfx3[4] == 0, "渐出结束:life 耗尽")

    -- 7) 取消成 BRC / Overdrive(取消后 VFX 在下一帧自己 release)
    for _, key in ipairs({ "RC_blue", "overdrive" }) do
        cancel_test.RC_blue = false; cancel_test.overdrive = false
        cancel_test[key] = true
        pressed = { ["correction_left"] = true }
        local c6 = new_char({ ["state"] = "active_FD_block", ["direction_input"] = 4,
            ["sprite_sheet"] = "4_stand_block_high" })
        local r6 = state_gate_game_scene_char_LP_from_active_FD_block(input, opp_input, c6, opp)
        check(r6 == true, "FD 可以取消成 " .. key)
    end
    cancel_test.RC_blue = false; cancel_test.overdrive = false

    -- 8) 站蹲切换会重新初始化动画(帧回到 0)
    pressed = { ["correction_left"] = true }
    local c7 = new_char({ ["state"] = "active_FD_block", ["direction_input"] = 4,
        ["sprite_sheet"] = "4_stand_block_high", ["heat_gauge"] = {200.0,200.0} })
    c7["character_animation"] =
        load_game_scene_anim_char_common_active_FD_block(c7, "4_stand_block_high", "stand")
    init_character_anim_with(c7, c7["character_animation"])
    local anim7 = c7["character_animation"]
    for i = 1, 6 do character_animator(c7, anim7) end
    local before = c7[8]
    c7["direction_input"] = 1
    state_gate_game_scene_char_LP_from_active_FD_block(input, opp_input, c7, opp)
    check(c7["sprite_sheet"] == "1_crouch_block", "站 -> 蹲:换成 1_crouch_block")
    check(before ~= 0 and c7[8] == 0,
        "切换时动画重新初始化(帧 " .. tostring(before) .. " -> " .. tostring(c7[8]) .. ")")

    log("")
    log("[屏障 VFX:渐入 / 渐出 / 输入轮询]")
    -- 渐入
    pressed = { ["correction_left"] = true }
    local vc = new_char({ ["state"] = "active_FD_block" })
    local vfx = insert_VFX_game_scene_char_active_FD_block(vc, input)
    check(vfx[4] == 0, "刚插入 opacity = 0")
    for i = 1, 4 do vfx["update"]() end
    check(math.abs(vfx[4] - 0.5) < 0.13,
        "渐入一半 opacity ≈ " .. string.format("%.2f", vfx[4]))
    for i = 1, 8 do vfx["update"]() end
    check(vfx[4] == 1.0, "渐入结束 opacity = 1")
    check(vfx["type"] == "FD_block", "VFX 类型 = FD_block")
    -- 输入轮询:松开 correction_right / left 都认
    pressed = { ["correction_right"] = true }
    vfx["update"]()
    check(vfx["release"] ~= true, "只有 correction_right 按住时保持")
    pressed = {}
    vfx["update"]()
    check(vfx["release"] == true, "松开 correction 键 -> 自己进入渐出")
    -- 角色离开状态也收
    pressed = { ["correction_left"] = true }
    local vc2 = new_char({ ["state"] = "active_FD_block" })
    local vfx2 = insert_VFX_game_scene_char_active_FD_block(vc2, input)
    vc2["state"] = "block"
    vfx2["update"]()
    check(vfx2["release"] == true, "离开 active_FD_block -> 自己进入渐出")
    -- 同类只留最新
    vc2["state"] = "active_FD_block"
    insert_VFX_game_scene_char_active_FD_block(vc2, input)
    check(#vc2["VFX_hit_front_table"] == 1, "重复插入同类屏障只保留最新一层")

    log(string.format("checks=%d fails=%d", checks, fails))
    log(fails == 0 and "RESULT: OK" or "RESULT: FAIL")
    flush()
    love.event.quit(fails == 0 and 0 or 1)
end

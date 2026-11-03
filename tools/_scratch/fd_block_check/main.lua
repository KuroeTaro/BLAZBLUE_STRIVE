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
    draw_VFX_game_scene_char_FD_block = function() end
    shader_game_scene_fd_block_3d = {}
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

    -- 4) 进入时插屏障
    pressed = { ["correction_left"] = true }
    local c3 = new_char({ ["direction_input"] = 4 })
    state_gate_game_scene_char_LP_common_to_active_FD_block(input, opp_input, c3, opp)
    check(#c3["VFX_hit_front_table"] == 1
        and c3["VFX_hit_front_table"][1]["type"] == "FD_block", "进入时插了常驻屏障")
    local vfx3 = c3["VFX_hit_front_table"][1]
    for j = 1, 8 do vfx3["update"]() end
    check(vfx3["opacity"] > 0.8 and vfx3["opacity"] <= FD_BLOCK_VFX_CONFIG.stance_opacity,
        "渐入结束 opacity ≈ " .. string.format("%.2f", vfx3["opacity"]))
    check(vfx3["life"] > 0, "常驻屏障不会自己到期")

    -- 5) 松手:直接清除(没有渐出)
    pressed = {}
    state_gate_game_scene_char_LP_from_active_FD_block(input, opp_input, c3, opp)
    check(c3["state"] == "5_stand_idle", "松开 FD:回 5_stand_idle")
    vfx3["update"]()
    check(vfx3["life"] == 0, "松开 FD:屏障直接清除(life = 0),不做渐出")

    -- 6) 取消成 BRC / Overdrive
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

    -- 7) 站蹲切换会重新初始化动画(帧回到 0)
    pressed = { ["correction_left"] = true }
    local c7 = new_char({ ["state"] = "active_FD_block", ["direction_input"] = 4,
        ["sprite_sheet"] = "4_stand_block_high" })
    c7["character_animation"] =
        load_game_scene_anim_char_common_active_FD_block(c7, "4_stand_block_high", "stand")
    init_character_anim_with(c7, c7["character_animation"])
    local anim7 = c7["character_animation"]
    for j = 1, 6 do character_animator(c7, anim7) end
    local before = c7[8]
    c7["direction_input"] = 1
    state_gate_game_scene_char_LP_from_active_FD_block(input, opp_input, c7, opp)
    check(c7["sprite_sheet"] == "1_crouch_block", "站 -> 蹲:换成 1_crouch_block")
    check(before ~= 0 and c7[8] == 0,
        "切换时动画重新初始化(帧 " .. tostring(before) .. " -> " .. tostring(c7[8]) .. ")")

    log("")
    log("[屏障 VFX:循环环 / 渐入 / 状态清理 / 挡刀重置]")
    local config = FD_BLOCK_VFX_CONFIG
    pressed = { ["correction_left"] = true }
    local vc = new_char({ ["state"] = "active_FD_block" })
    local vfx = insert_VFX_game_scene_char_FD_block(vc)
    check(vfx ~= nil and vfx["type"] == "FD_block", "插入屏障")
    check(math.abs(vfx["impact_radius"] - config.impact_radius_start) < 1.0e-6
        and vfx["impact_alpha"] == 0.0, "环从最小半径 / 0 亮度开始")
    check(vfx["opacity"] == 0, "刚插入 opacity = 0")
    for j = 1, config.fade_in do vfx["update"]() end
    check(math.abs(vfx["opacity"] - config.stance_opacity) < 1.0e-6, "渐入结束 opacity 正确")
    local life_before = vfx["life"]
    for j = 1, 12 do vfx["update"]() end
    check(vfx["life"] == life_before, "update 里不递减 life(" .. life_before .. ")")
    -- 循环
    local cycle = config.impact_loop_frame
    vfx["frame_age"] = 0
    local r_at, a_at = {}, {}
    for j = 1, cycle - 1 do
        vfx["update"]()
        if j % math.floor(cycle/6) == 0 or j == cycle - 1 then
            r_at[#r_at + 1] = vfx["impact_radius"]
            a_at[#a_at + 1] = vfx["impact_alpha"]
        end
    end
    local grown = true
    for k = 2, #r_at do if r_at[k] < r_at[k-1] then grown = false end end
    check(grown, "环在一个循环内持续放大(" .. string.format("%.2f", r_at[1]) ..
        " -> " .. string.format("%.2f", r_at[#r_at]) .. ")")
    check(a_at[2] > a_at[1] and a_at[#a_at] < a_at[2],
        "环先渐入再渐出(峰值 " .. string.format("%.2f", a_at[2]) ..
        ", 末尾 " .. string.format("%.2f", a_at[#a_at]) .. ")")
    -- 挡刀:复用同一层 + 帧数清零
    vc["state"] = "blockstop"
    vfx["frame_age"] = 30
    local again = insert_VFX_game_scene_char_FD_block(vc)
    check(again == vfx, "挡住攻击时复用同一个屏障对象")
    check(again["frame_age"] == 0, "挡住攻击时环的帧数清零重播")

    -- 统一清除规则
    for _, st in ipairs({ "active_FD_block", "block", "blockstop", "block_stand" }) do
        local vk = new_char({ ["state"] = st })
        local vfxk = insert_VFX_game_scene_char_FD_block(vk)
        vfxk["update"]()
        check(vfxk["life"] > 0, "状态 " .. st .. " 时保留")
    end
    for _, st in ipairs({ "5_stand_idle", "hurt_stand", "7_8_9_jump_air", "FD_block_to_idle" }) do
        local vk = new_char({ ["state"] = st })
        local vfxk = insert_VFX_game_scene_char_FD_block(vk)
        vfxk["update"]()
        check(vfxk["life"] == 0, "状态 " .. st .. " 时清除")
    end
    local vc4 = new_char({ ["state"] = "active_FD_block" })
    insert_VFX_game_scene_char_FD_block(vc4)
    insert_VFX_game_scene_char_FD_block(vc4)
    check(#vc4["VFX_hit_front_table"] == 1, "同一个角色只保留一层屏障")

    log("")
    log("[block -> FD_block_to_idle 出口]")
    -- FD 挡:block 结束走 FD_block_to_idle
    pressed = { ["correction_left"] = true }
    local cb = new_char({ ["state"] = "block", ["height"] = "stand", ["direction_input"] = 4,
        ["sprite_sheet"] = "4_stand_block_high",
        ["character_animation"] = {["prop_f"] = "f",["anim_length"] = 1}, ["f"] = 5 })
    cb["FD_block"] = true
    local rb = state_gate_game_scene_char_LP_from_block(input, opp_input, cb, opp)
    check(rb == true and cb["state"] == "FD_block_to_idle",
        "FD 挡结束 -> 出口是 FD_block_to_idle")
    check(cb["character_animation"]["anim_length"] == 8, "收招动画 8 帧")
    -- 收招结束,还按着 FD -> 回 active_FD_block 并跳到循环段
    cb["f"] = 99
    local rg = state_gate_game_scene_char_LP_from_FD_block_to_idle(input, opp_input, cb, opp)
    check(rg == true and cb["state"] == "active_FD_block", "收招结束还按着 FD -> 回 active_FD_block")
    check(cb["f"] == cb["character_animation"]["loop_frame"] - 1,
        "动画直接跳到循环段(f = " .. tostring(cb["f"]) .. ")")
    -- 收招结束,没按 FD -> 回 idle
    pressed = {}
    local cb2 = new_char({ ["state"] = "FD_block_to_idle", ["height"] = "stand",
        ["character_animation"] = {["prop_f"] = "f",["anim_length"] = 1}, ["f"] = 5 })
    state_gate_game_scene_char_LP_from_FD_block_to_idle(input, opp_input, cb2, opp)
    check(cb2["state"] == "5_stand_idle", "收招结束没按 FD -> 回 5_stand_idle")
    -- 非 FD 挡:还是走原来的 idle
    pressed = { ["correction_left"] = true }
    local cb3 = new_char({ ["state"] = "block", ["height"] = "stand", ["direction_input"] = 4,
        ["sprite_sheet"] = "4_stand_block_high",
        ["character_animation"] = {["prop_f"] = "f",["anim_length"] = 1}, ["f"] = 5 })
    state_gate_game_scene_char_LP_from_block(input, opp_input, cb3, opp)
    check(cb3["state"] == "5_stand_idle", "普通 block 结束 -> 回 5_stand_idle")

    log("")
    log("[block 动画的 loop_frame / FD 截断]")
    local fake_anim = { ["prop_f"] = "f", ["anim_length"] = 19, ["loop_frame"] = 16 }
    local cbf = new_char({ ["state"] = "block", ["character_animation"] = fake_anim })
    common_game_scene_char_apply_FD_block_animation(cbf, true)
    check(cbf["character_animation"]["anim_length"] == 16, "FD 挡:动画截到 loop_frame(19 -> 16)")
    check(cbf["FD_block"] == true, "FD 挡:记下 FD_block 标记")
    check(fake_anim["anim_length"] == 19, "改了副本,没有污染原动画表")
    common_game_scene_char_apply_FD_block_animation(cbf, false)
    check(cbf["FD_block"] == false, "非 FD 挡:标记清掉")
    local function countIn(path,pattern)
        local f = io.open(path,"rb")
        if not f then return -1 end
        local text = f:read("*a"); f:close()
        local n = 0
        for _ in text:gmatch(pattern) do n = n + 1 end
        return n
    end
    local anim_hits = countIn(REPO .. "/scenes/game_scene/_common/_anim.lua",'res%["loop_frame"%]')
    local projectile_hits = countIn(REPO .. "/scenes/game_scene/_common/_projectile.lua",'res%["loop_frame"%]')
    check(anim_hits >= 7, "_anim.lua 的 loop_frame 标记数 = " .. anim_hits)
    check(projectile_hits >= 6, "_projectile.lua 的 loop_frame 标记数 = " .. projectile_hits)

    log(string.format("checks=%d fails=%d", checks, fails))
    log(fails == 0 and "RESULT: OK" or "RESULT: FAIL")
    flush()
    love.event.quit(fails == 0 and 0 or 1)
end

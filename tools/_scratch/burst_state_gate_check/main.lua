-- burst(霸)两个 state_gate 的行为自检(纯逻辑,动画/输入全部用桩)
--   H:/_love/_11.5/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/burst_state_gate_check
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/burst_state_gate_check"

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
    return function() love.event.quit(1) end
end

local fails, checks = 0, 0
local function check(cond, msg)
    checks = checks + 1
    if cond then log("  ok   " .. msg) else fails = fails + 1; log("  FAIL " .. msg) end
end

-- 输入桩
local pressed = {}
local function install_stubs()
    test_input_sys_press = function(v) return pressed[v] == true end
    test_input_sys_press_or_hold = function(v) return pressed[v] == true end
    init_character_anim_with = function() end
    init_character_anim_without = function() end
    character_animator = function() end
    update_SFX_VOLUME = function() end
    load_game_scene_anim_char_common_burst_burst = function() return "anim_burst" end
    load_game_scene_anim_char_TRM_5_stand_idle = function() return "anim_idle" end
    load_game_scene_anim_char_TRM_7_8_9_jump_air = function() return "anim_jump" end
    character_function_game_scene_TRM_overdrive_state_character_uncommon_init = function() end
    common_game_scene_get_input_sys_cache_state_machine = function() return function() end end
    get_character_anim_end_state = function() return false end
    collision_test_char_on_ground = function() return false end
    common_game_scene_get_character_facing_currect = function() return true end
    state_machine_char_game_scene_char_LP_input_sys_cache = function() end
    state_machine_char_game_scene_char_RP_input_sys_cache = function() end
    -- 这两个门:记录是否被调用,默认不转
    local called = {}
    for _, side in ipairs({ "LP", "RP" }) do
        local c = { ground = false, stand = false, air = false }
        called[side] = c
        _G["state_gate_game_scene_char_" .. side .. "_common_ground_to_dash_move_HH"] =
            function() c.ground = true; return nil end
        _G["state_gate_game_scene_char_" .. side .. "_from_5_stand_idle"] =
            function() c.stand = true; return nil end
        _G["state_gate_game_scene_char_" .. side .. "_common_air_to_dash_move_HH"] =
            function() c.air = true; return nil end
        _G["state_gate_game_scene_char_" .. side .. "_from_7_8_9_jump_air"] =
            function() return nil end
    end
    return called
end

local function new_char(t)
    local c = {
        ["state"] = "hurt",
        ["height"] = "stand",
        ["physics_lock"] = true,
        ["velocity"] = {3,4},
        ["velocity_cache"] = {3,4},
        ["character_animation"] = "anim_old",
        ["idle_cancel"] = false,
        ["player_side"] = "L",
        ["overdrive_gauge"] = {100,100},
        ["heat_gauge"] = {0,100},
        ["risk_gauge"] = {0,100},
        ["collision_move_available"] = {1,1},
        ["state_cache"] = "5_stand_idle",
        [5] = 1,
    }
    for k, v in pairs(t or {}) do c[k] = v end
    return c
end

local function run(name, fn)
    log("")
    log("[" .. name .. "]")
    local ok, err = pcall(fn)
    if not ok then fails = fails + 1; log("  FAIL error: " .. tostring(err)) end
end

function love.load()
    for _, rel in ipairs({
        "/scenes/game_scene/characters/TRM/left.lua",
        "/scenes/game_scene/characters/TRM/right.lua"
    }) do
        local chunk, err = loadfile(REPO .. rel)
        if not chunk then log("load " .. rel .. " FAIL " .. tostring(err)); flush(); love.event.quit(1); return end
        local ok, run_err = pcall(chunk)
        if not ok then log("dofile " .. rel .. " FAIL " .. tostring(run_err)); flush(); love.event.quit(1); return end
    end
    local called = install_stubs()

    local input = { ["burst"] = "burst" }
    local opp_input = {}
    local opp = { ["state"] = "hurt" }

    run("from_hurt 里的 burst 触发", function()
        local to_gate = state_gate_game_scene_char_LP_from_hurt
        -- 1) 没按 burst:不进 burst_burst(继续走 hurt 的 until_land / 动画结束逻辑)
        pressed = {}
        local c = new_char({ ["state"] = "hurt" })
        check(to_gate(input, opp_input, c, opp) == nil and c["state"] == "hurt",
            "未按 burst: 不进 burst_burst")
        -- 2) 按下 burst:直接进 burst_burst
        pressed = { ["burst"] = true }
        local c2 = new_char({ ["state"] = "hurt" })
        to_gate(input, opp_input, c2, opp)
        check(c2["state"] == "burst_burst", "hurt + burst -> state = burst_burst")
        check(c2["character_animation"] == "anim_burst", "换上 burst_burst 动画")
        -- 3) 空中 hurt 同样能出
        local c3 = new_char({ ["state"] = "hurt", ["height"] = "air" })
        to_gate(input, opp_input, c3, opp)
        check(c3["state"] == "burst_burst", "air hurt + burst -> burst_burst")
    end)

    run("from_burst_burst", function()
        _G.get_character_anim_end_state = function() return false end
        -- 1) 还没 idle_cancel、动画也没结束:不出
        local c = new_char({ ["state"] = "burst_burst", ["idle_cancel"] = false })
        local r = state_gate_game_scene_char_LP_from_burst_burst(input, opp_input, c, opp)
        check(r == nil and c["state"] == "burst_burst", "未 idle_cancel 不出")
        -- 2) idle_cancel:走 5_stand_idle 那套门(门本身不转就保持 burst_burst)
        called["LP"].stand = false; called["LP"].ground = false
        c = new_char({ ["state"] = "burst_burst", ["idle_cancel"] = true })
        state_gate_game_scene_char_LP_from_burst_burst(input, opp_input, c, opp)
        check(called["LP"].ground, "idle_cancel: 调用了 common_ground_to_dash_move_HH")
        check(called["LP"].stand, "idle_cancel: 调用了 from_5_stand_idle")
        check(c["state"] == "burst_burst", "idle_cancel: 门没转就留在 burst_burst")
        -- 3) 动画播完:兜底回 5_stand_idle
        _G.get_character_anim_end_state = function() return true end
        c = new_char({ ["state"] = "burst_burst", ["idle_cancel"] = false })
        r = state_gate_game_scene_char_LP_from_burst_burst(input, opp_input, c, opp)
        check(r == true and c["state"] == "5_stand_idle", "动画播完 -> 5_stand_idle")
    end)

    run("RP 镜像(冒烟)", function()
        local to_gate = _G["state_gate_game_scene_char_RP_from_hurt"]
        local from_gate = _G["state_gate_game_scene_char_RP_from_burst_burst"]
        check(type(to_gate) == "function" and type(from_gate) == "function", "两个 RP 门都存在")
        _G.get_character_anim_end_state = function() return false end
        _G.collision_test_char_on_ground = function() return false end
        pressed = { ["burst"] = true }
        local c = new_char({ ["state"] = "hurt" })
        to_gate(input, opp_input, c, opp)
        check(c["state"] == "burst_burst", "RP hurt + burst -> burst_burst")
        c = new_char({ ["state"] = "burst_burst", ["idle_cancel"] = false })
        check(from_gate(input, opp_input, c, opp) == nil, "RP 未 idle_cancel 不出")
        called["RP"].stand = false; called["RP"].ground = false
        c = new_char({ ["state"] = "burst_burst", ["idle_cancel"] = true })
        from_gate(input, opp_input, c, opp)
        check(called["RP"].stand and called["RP"].ground, "RP 走了 5_stand_idle 那套门")
        _G.get_character_anim_end_state = function() return true end
        c = new_char({ ["state"] = "burst_burst", ["idle_cancel"] = false })
        check(from_gate(input, opp_input, c, opp) == true and c["state"] == "5_stand_idle",
            "RP 动画播完 -> 5_stand_idle")
    end)

    log("")
    log(string.format("checks=%d fails=%d", checks, fails))
    log(fails == 0 and "RESULT: OK" or "RESULT: FAIL")
    flush()
    love.event.quit(fails == 0 and 0 or 1)
end

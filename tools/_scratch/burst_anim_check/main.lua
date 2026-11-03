-- burst_burst 动画冒烟:把 0..70 帧全跑一遍,确认没有未定义全局导致的崩溃
--   H:/_love/_11.5/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/burst_anim_check
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/burst_anim_check"
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

-- 宽松表:任意下标都能取到宽松表(给 pushbox/hurtbox/anchor 这种嵌套配置用)
local function deep()
    return setmetatable({}, {__index = function(t, k)
        local v = deep(); rawset(t, k, v); return v
    end})
end

local function install_stubs()
    obj_stage_game_scene_camera = {0,-365,-800,["state"]="active",["enclose_position_offset"]={0,0,0}}
    obj_stage_game_scene_main = {["camera_active_application_table"]={}}
    common_game_scene_get_pushbox = function() return deep() end
    common_game_scene_get_hurtbox = function() return deep() end
    common_game_scene_get_anchor = function() return deep() end
    common_game_scene_get_VFX_spawn_anchor = function() return deep() end
    common_game_scene_get_SFX_move = function() return deep() end
    common_game_scene_get_SFX_stage_interactive = function() return deep() end
    common_game_scene_get_input_sys_cache_init = function() return function() end end
    common_game_scene_get_input_sys_cache_state_machine = function() return function() end end
    common_game_scene_overdrive_load_camera_shake_anim = function() return {prop="camera_shake_x"}, {prop="camera_shake_y"} end
    common_game_scene_nil_load_camera_enclose_anim = function() return {prop="camera_enclosing"} end
    -- 前 40 次判定「还在空中」,之后判定落地:把 50..58 的滞空循环和 59 之后的落地分支都跑到
    local ground_checks = 0
    collision_test_char_on_ground = function()
        ground_checks = ground_checks + 1
        return ground_checks > 10
    end
    insert_VFX_game_scene_stage_smoke_land_blow = function() end
    insert_VFX_game_scene_char_burst_front = function() end
    insert_VFX_game_scene_char_burst_back = function() end
    play_obj_audio = function() end
    init_point_linear_anim_without = function() end
    init_frame_anim_without = function() end
end

local function new_char()
    return {
        ["player_side"]="L",["height"]="stand",["y"]=0,["x"]=0,["f"]=-1,
        ["velocity"]={0,0},["velocity_cache"]={0,0},["friction"]=1,["gravity"]=2.5,
        ["overdrive_gauge"]={0,100},["heat_gauge"]={0,100},
        ["LCT"]={},["LCD"]={},
        [5]=1,[6]=1,[8]=0,
        ["state"]="burst_burst",["idle_cancel"]=false,
        ["sprite_sheet"]="",["anchor_pos"]={0,0},["pushbox"]={0,0,0,0},
        ["hurtbox_table"]={},["hitbox_table"]={},["strike_inv"]=false,
        ["collision_ground_height_offset"]=0,["enclose_position_offset"]={0,0,0},
        ["camera_active_application_table"]={},
    }
end

function love.load()
    local ok, err = pcall(function()
        assert(loadfile(REPO .. "/update_general_use_functions/animator.lua"))()
        assert(loadfile(REPO .. "/scenes/game_scene/_common/_anim.lua"))()
    end)
    if not ok then log("load FAIL " .. tostring(err)); flush(); love.event.quit(1); return end
    install_stubs()

    local ch = new_char()
    local opp = new_char()
    opp["player_side"] = "R"
    local anim = load_game_scene_anim_char_common_burst_burst(ch, opp, function() end)
    init_character_anim_with(ch, anim)
    ch["state"] = "burst_burst"

    local fails = 0
    local idle_cancel_frame = nil
    for f = 0, 119 do
        local ok2, e = pcall(character_animator, ch, anim)
        if not ok2 then
            fails = fails + 1
            log(string.format("  f%02d CRASH: %s", f, tostring(e)))
            break
        end
        if ch["idle_cancel"] and idle_cancel_frame == nil then idle_cancel_frame = f end
    end
    log("anim_length = " .. tostring(anim["anim_length"]))
    local keys = {}
    for k, v in pairs(anim) do if type(v) == "function" then keys[#keys + 1] = k end end
    table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
    local fk = {}
    for _, k in ipairs(keys) do fk[#fk + 1] = tostring(k) end
    log("有回调的帧: " .. table.concat(fk, ","))
    log("anim[64] = " .. tostring(anim[64]))
    log("最终 idle_cancel = " .. tostring(ch["idle_cancel"]) .. " , f = " .. tostring(ch["f"]))
    log("idle_cancel 首次为 true 的帧: " .. tostring(idle_cancel_frame))
    log("碰撞检测: " .. tostring(type(ground_checks)))
    log(fails == 0 and "RESULT: OK" or "RESULT: FAIL")
    flush()
    love.event.quit(fails == 0 and 0 or 1)
end

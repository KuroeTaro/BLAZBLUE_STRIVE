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
    -- 用仓库里真实的 box / anchor 数据(不再用宽松表),缺 key 会直接报错
    common_game_scene_get_pushbox = function(side)
        return side == "L" and obj_pushboxs_data_game_scene_char_LP or obj_pushboxs_data_game_scene_char_RP
    end
    common_game_scene_get_hurtbox = function(side)
        return side == "L" and obj_hurtboxs_data_game_scene_char_LP or obj_hurtboxs_data_game_scene_char_RP
    end
    common_game_scene_get_anchor = function(side)
        return side == "L" and obj_anchor_data_game_scene_char_LP or obj_anchor_data_game_scene_char_RP
    end
    common_game_scene_get_VFX_spawn_anchor = function(side)
        return side == "L" and obj_VFX_spawn_anchor_data_game_scene_char_LP or obj_VFX_spawn_anchor_data_game_scene_char_RP
    end
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
    insert_projectile_game_scene_char_common_burst_shockwave = function() end
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
        assert(loadfile(REPO .. "/scenes/game_scene/characters/TRM/left.lua"))()
        assert(loadfile(REPO .. "/scenes/game_scene/characters/TRM/right.lua"))()
        assert(loadfile(REPO .. "/scenes/game_scene/_common/_anim.lua"))()
        load_game_scene_box_anchor_data_LP()
        load_game_scene_box_anchor_data_RP()
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
    local eq
    eq = function(a, b)
        if type(a) ~= "table" or type(b) ~= "table" then return a == b end
        if #a ~= #b then return false end
        for i = 1, #b do if not eq(a[i], b[i]) then return false end end
        return true
    end
    local checked_key = false
    local checked_land = false
    for f = 0, 119 do
        local ok2, e = pcall(character_animator, ch, anim)
        if not ok2 then
            fails = fails + 1
            log(string.format("  f%02d CRASH: %s", f, tostring(e)))
            break
        end
        if ch["idle_cancel"] and idle_cancel_frame == nil then idle_cancel_frame = f end
        -- burst_to_8_jump:对应 8_jump 的动画数据
        if not checked_key and ch["sprite_sheet"] == "8_jump" then
            checked_key = true
            if not eq(ch["pushbox"], {0,-100,120,200}) then
                fails = fails + 1; log("  8_jump pushbox 不对: " .. tostring(ch["pushbox"][1]) .. "," .. tostring(ch["pushbox"][2]) .. "," .. tostring(ch["pushbox"][3]) .. "," .. tostring(ch["pushbox"][4]))
            else log("  burst_to_8_jump pushbox = {0,-100,120,200} ok") end
            if not eq(ch["anchor_pos"], {350,430}) then
                fails = fails + 1; log("  8_jump anchor 不对")
            else log("  burst_to_8_jump anchor = {350,430} ok") end
            if not eq(ch["hurtbox_table"], {{0,-180,200,380}}) then
                fails = fails + 1; log("  8_jump hurtbox 不对")
            else log("  burst_to_8_jump hurtbox = {{0,-180,200,380}} ok") end
        end
        -- burst_to_stand_idle:对应 7_8_9_jump_air_to_stand_idle 的动画数据
        if not checked_land and ch["sprite_sheet"] == "7_8_9_jump_air_to_stand_idle" then
            checked_land = true
            if not eq(ch["pushbox"], {0,-185,120,370}) then
                fails = fails + 1; log("  to_stand_idle pushbox 不对")
            else log("  burst_to_stand_idle pushbox = {0,-185,120,370} ok") end
            if not eq(ch["anchor_pos"], {325,480}) then
                fails = fails + 1; log("  to_stand_idle anchor 不对")
            else log("  burst_to_stand_idle anchor = {325,480} ok") end
            if not eq(ch["hurtbox_table"], {{0,-190,180,380}}) then
                fails = fails + 1; log("  to_stand_idle hurtbox 不对")
            else log("  burst_to_stand_idle hurtbox = {{0,-190,180,380}} ok") end
        end
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

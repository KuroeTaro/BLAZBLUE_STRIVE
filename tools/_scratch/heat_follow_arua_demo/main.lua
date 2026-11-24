-- 5UA_100_heat_follow 扩散光环 shader 演示(白底,三阶段)
--   双击 bin/heat_arua_demo.exe
--   或 H:/_love/_12.0/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/heat_follow_arua_demo
-- 直接加载仓库里真实的 left.lua(config)/ TRM _VFX.lua(insert 函数)/ shader,
-- 和游戏里同一套 update / draw;改完仓库文件按 R 热重载
--
-- 按键:
--   Space      暂停 / 继续
--   Left/Right 暂停时逐 tick(Shift = 10 tick)
--   Up/Down    播放速度 x2 / x0.5
--   O          立刻进 ease_out(模拟招式中途结束)
--   H          模拟角色 hitstop(按住)
--   R          热重载 config + _VFX.lua + shader,重新播放
--   N          重新播放(新的噪波种子)
--   G          辅助线(外径 / 内径基准圆)
--   L          循环播放开 / 关
--   Esc        退出
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local TICK = 1/60

local function read_file(path)
    local f = io.open(path,"rb")
    if not f then return nil end
    local s = f:read("*a")
    f:close()
    return s
end

-- 仓库里的 "shaders/..." 相对路径改成从仓库读源码(演示程序的源目录不是仓库)
local real_newShader = love.graphics.newShader
love.graphics.newShader = function(a,...)
    if type(a) == "string" and a:match("%.glsl$") then
        local src = read_file(REPO .. "/" .. a)
        assert(src,"cannot read " .. a)
        return real_newShader(src,...)
    end
    return real_newShader(a,...)
end

local font
local error_text
local obj_char
local obj_VFX
local state = {
    paused = false,
    speed = 1,
    loop = true,
    guide = false,
    accumulator = 0,
    wait = 0,
    total_tick = 0
}

local function spawn()
    obj_char["VFX_common_back_table"] = {}
    insert_VFX_game_scene_char_TRM_5UA_100_heat_follow_arua(obj_char)
    obj_VFX = obj_char["VFX_common_back_table"][1]
    state.total_tick = 0
    state.wait = 0
end

local function reload()
    error_text = nil
    local ok,err = pcall(function()
        dofile(REPO .. "/draw_general_use_functions.lua")
        dofile(REPO .. "/scenes/game_scene/_common/common_functions.lua")
        dofile(REPO .. "/scenes/game_scene/characters/TRM/left.lua")
        dofile(REPO .. "/scenes/game_scene/characters/TRM/_VFX.lua")
        load_game_scene_config_char_LP()
        shader_game_scene_LP = {}
        order_load_game_scene_char_LP_shader(4)
        order_load_game_scene_char_LP_shader(5)
    end)
    if not ok then
        error_text = tostring(err)
        obj_VFX = nil
        return
    end
    spawn()
end

function love.load()
    font = love.graphics.newFont(14)
    -- 相机拉远一倍:1 世界单位 = 0.5 像素(unit 400 -> 半径 1.0 = 200 像素),光环中心在屏幕中心
    obj_stage_game_scene_camera = {0,-215,-1600}
    obj_char = {
        ["player_side"] = "L",["x"] = 0,["y"] = 0,[3] = 0,[5] = 1,[6] = 1,
        ["state"] = "idle",
        ["VFX_common_back_table"] = {}
    }
    reload()
end

local function step_tick()
    if not obj_VFX then return end
    obj_char["state"] = love.keyboard.isDown("h") and "hitstop" or "idle"
    if obj_VFX["life"] <= 0 then
        return
    end
    obj_VFX["update"]()
    if obj_char["state"] ~= "hitstop" then
        state.total_tick = state.total_tick + 1
    end
end

function love.update(dt)
    if not obj_VFX or state.paused then return end
    if obj_VFX["life"] <= 0 then
        if state.loop then
            state.wait = state.wait + dt
            if state.wait >= 0.4 then spawn() end
        end
        return
    end
    state.accumulator = state.accumulator + dt*state.speed
    while state.accumulator >= TICK do
        state.accumulator = state.accumulator - TICK
        step_tick()
    end
end

function love.draw()
    local W,H = love.graphics.getDimensions()
    love.graphics.clear(1,1,1,1)
    if obj_VFX and obj_VFX["life"] > 0 then
        obj_VFX["draw"]()
    end
    local config = config_game_scene_LP and config_game_scene_LP["5UA_100_heat_follow_arua"]
    if state.guide and obj_VFX and config then
        local center = draw_3d_point_to_2D(obj_stage_game_scene_camera,{obj_VFX[1],obj_VFX[2],obj_VFX[3]})
        local px = draw_resolution_correction(800)/(obj_VFX[3] - obj_stage_game_scene_camera[3])*config["unit"]
        love.graphics.setLineWidth(1)
        love.graphics.setColor(1,0.2,0.2,0.8)
        love.graphics.circle("line",center[1],center[2],obj_VFX["outer_radius"]*px,128)
        if obj_VFX["inner_radius"] > 0 then
            love.graphics.setColor(0.2,0.4,1,0.8)
            love.graphics.circle("line",center[1],center[2],obj_VFX["inner_radius"]*px,128)
        end
        love.graphics.setColor(0.6,0.6,0.6,0.6)
        local half = config["shader"]["area_half"]*px
        love.graphics.rectangle("line",center[1] - half,center[2] - half,half*2,half*2)
    end
    -- HUD
    love.graphics.setFont(font)
    love.graphics.setColor(0.2,0.2,0.2,1)
    if obj_VFX then
        local total = config["ease_in_length"] + config["loop_length"] + config["ease_out_length"]
        love.graphics.print(string.format(
            "phase %-8s  phase tick %3d   total tick %3d / %d   outer %.3f  inner %.3f  opacity %.3f",
            obj_VFX["state"],obj_VFX["state_tick"],state.total_tick,total,
            obj_VFX["outer_radius"],obj_VFX["inner_radius"],obj_VFX[4]),16,16)
        love.graphics.print(string.format("speed x%.3g   %s%s%s   fps %d",
            state.speed,state.paused and "PAUSED" or "playing",state.loop and "  loop" or "",
            love.keyboard.isDown("h") and "  HITSTOP" or "",love.timer.getFPS()),16,36)
        -- 时间轴(三段)
        local bx,by,bw = 16,60,W - 32
        local a = config["ease_in_length"]/total
        local b = config["loop_length"]/total
        love.graphics.setColor(0.85,0.85,0.85,1)
        love.graphics.rectangle("fill",bx,by,bw,6)
        love.graphics.setColor(0.55,0.55,0.55,1)
        love.graphics.rectangle("fill",bx + bw*a - 1,by - 3,2,12)
        love.graphics.rectangle("fill",bx + bw*(a + b) - 1,by - 3,2,12)
        love.graphics.setColor(0.1,0.1,0.1,1)
        love.graphics.rectangle("fill",bx,by,bw*math.min(state.total_tick/total,1),6)
    end
    love.graphics.setColor(0.35,0.35,0.35,1)
    love.graphics.print("Space pause | Left/Right step (Shift x10) | Up/Down speed | O ease_out now | H hold = hitstop | R reload | N replay | G guide | L loop | Esc quit",16,H - 30)
    if error_text then
        love.graphics.setColor(0.8,0,0,1)
        love.graphics.printf(error_text,16,90,W - 32,"left")
    end
    love.graphics.setColor(1,1,1,1)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "space" then
        state.paused = not state.paused
    elseif key == "right" then
        state.paused = true
        local n = (love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift")) and 10 or 1
        for i = 1,n do step_tick() end
    elseif key == "left" then
        -- 往回:从头重放到目标 tick(噪波种子不变)
        state.paused = true
        if not obj_VFX then return end
        local n = (love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift")) and 10 or 1
        local target = math.max(state.total_tick - n,0)
        local offset = obj_VFX["noise_offset"]
        spawn()
        obj_VFX["noise_offset"] = offset
        for i = 1,target do step_tick() end
    elseif key == "up" then
        state.speed = math.min(state.speed*2,8)
    elseif key == "down" then
        state.speed = math.max(state.speed*0.5,0.0625)
    elseif key == "o" then
        if obj_VFX then obj_VFX["start_ease_out"]() end
    elseif key == "r" then
        reload()
    elseif key == "n" then
        if obj_VFX then spawn() end
    elseif key == "g" then
        state.guide = not state.guide
    elseif key == "l" then
        state.loop = not state.loop
    end
end

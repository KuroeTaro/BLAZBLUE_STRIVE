-- 5UA_100_heat_follow 扩散光环 shader 实机验证(LÖVE 12,三阶段)
--   双击 bin/heat_arua_probe.exe
--   或 H:/_love/_12.0/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/heat_follow_arua_probe
--   * 加载仓库里真实的 left.lua / right.lua / TRM _VFX.lua / common_functions.lua
--   * 跑真实的 load_game_scene_config_char_LP / RP 和 order_load_game_scene_char_LP / RP_shader 1..5
--   * 角色在 idle(和 lovebird 里手动调用一样),调用真实的 insert 函数,逐 tick update / draw
--   * 指定 tick 导出 PNG(白底,600x600,1 世界单位 = 0.5 像素),逐 tick 记录阶段 / 半径 / 不透明度 / 覆盖率
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/heat_follow_arua_probe"
local W,H = 1600,900
local lines = {}
local function log(s) lines[#lines + 1] = tostring(s) end
local function flush()
    local f = io.open(DIR .. "/result.txt","w")
    if f then f:write(table.concat(lines,"\n")); f:close() end
end
function love.errorhandler(msg)
    local f = io.open(DIR .. "/result.txt","w")
    if f then
        f:write(table.concat(lines,"\n"))
        f:write("\nERROR: " .. tostring(msg) .. "\n")
        f:write(debug.traceback("",2))
        f:close()
    end
    os.exit(1)
end
local function read_file(path)
    local f = io.open(path,"rb")
    if not f then return nil end
    local s = f:read("*a"); f:close(); return s
end
local function save_png(data,name)
    local fd = data:encode("png")
    local f = io.open(DIR .. "/shots/" .. name .. ".png","wb")
    if f then f:write(fd:getString()); f:close() end
end
local function readback(canvas)
    if love.graphics.readbackTexture then
        return love.graphics.readbackTexture(canvas)
    end
    return canvas:newImageData()
end
local real_newShader = love.graphics.newShader
love.graphics.newShader = function(a,...)
    if type(a) == "string" and a:match("%.glsl$") then
        local src = read_file(REPO .. "/" .. a)
        assert(src,"cannot read " .. a)
        return real_newShader(src,...)
    end
    return real_newShader(a,...)
end
local fails = 0
local function check(ok,msg)
    if not ok then fails = fails + 1; log("  !! " .. msg) else log("  ok " .. msg) end
end

function love.load()
    log("love version: " .. table.concat({love.getVersion()},"."))
    log("renderer: " .. table.concat({love.graphics.getRendererInfo()}," | "))
    for _,rel in ipairs({
        "draw_general_use_functions.lua",
        "scenes/game_scene/_common/common_functions.lua",
        "scenes/game_scene/characters/TRM/left.lua",
        "scenes/game_scene/characters/TRM/right.lua",
        "scenes/game_scene/characters/TRM/_character_function.lua",
        "scenes/game_scene/characters/TRM/_VFX.lua"
    }) do
        local ok,err = pcall(dofile,REPO .. "/" .. rel)
        log(string.format("load %-58s %s %s",rel,ok and "OK" or "FAIL",ok and "" or tostring(err)))
        if not ok then fails = fails + 1 end
    end
    load_game_scene_config_char_LP()
    load_game_scene_config_char_RP()
    for _,S in ipairs({"LP","RP"}) do
        for i = 1,5 do
            local t0 = love.timer.getTime()
            local ok,err = pcall(_G["order_load_game_scene_char_" .. S .. "_shader"],i)
            log(string.format("order_load %s shader [%d] %s %.1fms %s",S,i,ok and "OK" or "FAIL",
                (love.timer.getTime() - t0)*1000,ok and "" or tostring(err)))
            if not ok then fails = fails + 1 end
        end
    end
    local shader = shader_game_scene_LP["5UA_100_heat_follow_arua_pool"]["slots"][1]["shader"]
    local config = config_game_scene_LP["5UA_100_heat_follow_arua"]
    local warn = shader:getWarnings()
    if warn and warn ~= "" then log("shader warnings: " .. warn) end
    local missing = {}
    for name in pairs(config["shader"]) do
        if not shader:hasUniform(name) then missing[#missing + 1] = name end
    end
    for _,name in ipairs({"time","noise_offset","outer_radius","inner_radius"}) do
        if not shader:hasUniform(name) then missing[#missing + 1] = name end
    end
    check(#missing == 0,"uniform missing: " .. (#missing == 0 and "none" or table.concat(missing,",")))
    check(config_game_scene_LP["5UA_100_heat_follow_arua_quad_image"] ~= config_game_scene_LP["6SP_P_arua_quad_image"],
        "own quad image (not 6SP_P)")
    check(config_game_scene_LP["5UA_100_heat_follow_arua_RNG"] ~= config_game_scene_LP["6SP_P_arua_RNG"],
        "own RNG (not 6SP_P)")

    obj_stage_game_scene_camera = {0,-215,-1600}
    local obj_char = {
        ["player_side"] = "L",["x"] = 0,["y"] = 0,[3] = 0,[5] = 1,[6] = 1,
        ["state"] = "idle",
        ["VFX_common_front_table"] = {},["VFX_common_back_table"] = {}
    }
    insert_VFX_game_scene_char_TRM_5UA_100_heat_follow_arua(obj_char)
    local back = obj_char["VFX_common_back_table"]
    check(#back == 1,"inserted into VFX_common_back_table")
    local obj_VFX = back[1]
    check(obj_VFX[4] == 0,"opacity before first update = 0 (got " .. obj_VFX[4] .. ")")

    local cv = love.graphics.newCanvas(W,H)
    local crop = 600
    local cx,cy = 800 - crop/2,450 - crop/2
    local total = config["ease_in_length"] + config["loop_length"] + config["ease_out_length"]
    local shots = {}
    for _,t in ipairs({1,3,6,9,12,30,60,90,120,144,148,152,156,160,164,167}) do shots[t] = true end
    local tick = 0
    local loop_cover_min,loop_cover_max = 1,0
    local prev_state = obj_VFX["state"]
    while obj_VFX["life"] > 0 do
        obj_VFX["update"]()
        tick = tick + 1
        if obj_VFX["state"] ~= prev_state then
            log(string.format("tick %3d: %s -> %s",tick,prev_state,obj_VFX["state"]))
            prev_state = obj_VFX["state"]
        end
        if obj_VFX["life"] <= 0 then break end
        love.graphics.push("all")
        love.graphics.setCanvas(cv)
        love.graphics.clear(0,0,0,0)
        obj_VFX["draw"]()
        love.graphics.pop()
        local data = readback(cv)
        local out = love.image.newImageData(crop,crop)
        out:paste(data,0,0,cx,cy,crop,crop)
        -- 覆盖率(形状 alpha,除掉阶段不透明度)/ 圆心是否实心
        local cover,n,center_a = 0,0,0
        for y = 0,crop - 1,4 do
            for x = 0,crop - 1,4 do
                local _,_,_,al = out:getPixel(x,y)
                if al > 0.05*obj_VFX[4] and obj_VFX[4] > 0 then cover = cover + 1 end
                n = n + 1
            end
        end
        for y = crop/2 - 20,crop/2 + 20,4 do
            for x = crop/2 - 20,crop/2 + 20,4 do
                local _,_,_,al = out:getPixel(x,y)
                center_a = center_a + al
            end
        end
        center_a = center_a/121
        if obj_VFX["state"] == "loop" then
            loop_cover_min = math.min(loop_cover_min,cover/n)
            loop_cover_max = math.max(loop_cover_max,cover/n)
        end
        if shots[tick] or tick % 12 == 0 then
            log(string.format("tick %3d %-8s outer %.3f inner %6.3f opacity %.3f cover %.3f center_alpha %.3f",
                tick,obj_VFX["state"],obj_VFX["outer_radius"],obj_VFX["inner_radius"],obj_VFX[4],cover/n,center_a))
        end
        if shots[tick] then
            -- 叠在白底上导出
            local white = love.image.newImageData(crop,crop)
            white:mapPixel(function(x,y)
                local r,g,b,a = out:getPixel(x,y)
                return r*a + (1 - a),g*a + (1 - a),b*a + (1 - a),1
            end)
            save_png(white,string.format("t%03d",tick))
        end
    end
    check(tick == total,"life ends at tick " .. tick .. " (config total " .. total .. ")")
    log(string.format("loop cover min %.3f max %.3f",loop_cover_min,loop_cover_max))

    -- hitstop 暂停 / 提前 ease_out
    insert_VFX_game_scene_char_TRM_5UA_100_heat_follow_arua(obj_char)
    local v2 = back[#back]
    for i = 1,20 do v2["update"]() end
    obj_char["state"] = "hitstop"
    local t_before = v2["shader_time"]
    v2["update"]()
    check(v2["shader_time"] == t_before,"hitstop pauses")
    obj_char["state"] = "idle"
    v2["start_ease_out"]()
    local n_tick = 0
    while v2["life"] > 0 do v2["update"](); n_tick = n_tick + 1 end
    check(n_tick == config["ease_out_length"],"start_ease_out() -> life ends after " .. n_tick .. " ticks")

    -- 耗时:原尺寸(相机 z = -800,1 世界单位 = 1 像素)
    obj_stage_game_scene_camera = {0,-215,-800}
    insert_VFX_game_scene_char_TRM_5UA_100_heat_follow_arua(obj_char)
    local v3 = back[#back]
    for i = 1,40 do v3["update"]() end
    local N = 60
    love.graphics.push("all"); love.graphics.setCanvas(cv); v3["draw"](); love.graphics.pop(); readback(cv)
    local t0 = love.timer.getTime()
    love.graphics.push("all")
    love.graphics.setCanvas(cv)
    for i = 1,N do v3["draw"]() end
    love.graphics.pop()
    readback(cv)
    log(string.format("cost @1600x900 (1 unit = 1px): %.3f ms / draw (avg of %d)",(love.timer.getTime() - t0)/N*1000,N))

    log(fails == 0 and "RESULT: OK" or ("RESULT: FAIL x" .. fails))
    flush()
    os.exit(0)
end

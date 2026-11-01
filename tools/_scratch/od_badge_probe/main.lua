-- 实机验证 & 调参:overdrive badge 的冲击波 / 向内收束充能波
--   加载仓库里真实的 draw_general_use_functions.lua + draw_functions.lua + shader + config,
--   按帧渲染 1600x900 导出 PNG + 联系表。
--   H:/_love/_11.5/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/od_badge_probe
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/od_badge_probe"
local W, H = 1600, 900

local lines = {}
local function log(s) lines[#lines + 1] = s end
local function flush()
    local f = io.open(DIR .. "/result.txt", "w")
    if f then f:write(table.concat(lines, "\n")); f:close() end
end

function love.errorhandler(msg)
    local f = io.open(DIR .. "/result.txt", "w")
    if f then
        f:write(table.concat(lines, "\n"))
        f:write("\nERROR: " .. tostring(msg) .. "\n")
        f:write(debug.traceback("", 2))
        f:close()
    end
    love.event.quit(1)
    return function() love.event.quit(1) end
end

local function readFile(path)
    local f = io.open(path, "rb")
    if not f then return nil end
    local s = f:read("*a"); f:close(); return s
end

local function savePng(data, name)
    local fd = data:encode("png")
    local f = io.open(DIR .. "/shots/" .. name .. ".png", "wb")
    if f then f:write(fd:getString()); f:close() end
end

-- 与 _VFX.lua / OVERDRIVE_BADGE_ANIM 一致的近似包络(只用于观察)
local ALPHA = { 0.000, 0.105, 0.246, 0.344, 0.403, 0.448, 0.471, 0.478,
                0.662, 0.863, 0.940, 1.000, 1.000, 0.926, 0.116, 0.013 }
local AKEYS = { 0, 1, 4, 8, 13, 18, 25, 28, 29, 31, 33, 38, 57, 59, 67, 69 }
local SCALE = { 1.000, 1.000, 0.920, 0.860, 0.830, 0.800, 0.790, 0.790,
                0.800, 0.900, 1.000, 1.000, 1.020, 1.040, 1.080, 1.110 }
local SKEYS = { 0, 1, 4, 8, 13, 18, 25, 28, 29, 33, 38, 57, 60, 66, 69, 69 }

local function sample(keys, values, frame)
    if frame >= keys[#keys] then return values[#values] end
    for i = 2, #keys do
        local k, pk = keys[i], keys[i - 1]
        if frame <= k then
            local t = (frame - pk) / math.max(k - pk, 1e-6)
            return values[i - 1] + (values[i] - values[i - 1]) * t
        end
    end
    return values[1]
end

local shots_all = {}

local function runCase(name, char_x, badge, shock, particle, cv, frames)
    local obj_VFX = { char_x, -345, 0, 1, 1, 1, 0, 0 }
    local center = draw_3d_point_to_2D(obj_stage_game_scene_camera, obj_VFX)
    log(string.format("[%s] char_x=%.0f -> badge center=(%.1f,%.1f)", name, char_x, center[1], center[2]))
    local shots = {}
    for _, f in ipairs(frames) do
        local opacity = sample(AKEYS, ALPHA, f)
        obj_VFX[4] = opacity
        obj_VFX["scale_anim"] = sample(SKEYS, SCALE, f)
        love.graphics.setCanvas(cv)
        love.graphics.clear(0.035, 0.045, 0.070, 1)
        if badge then
            love.graphics.setColor(0.72, 0.74, 0.78, 1)
            love.graphics.draw(badge, center[1] - 500, center[2] - 500)
            love.graphics.setColor(1, 1, 1, 1)
        end
        local ok, err = pcall(draw_VFX_game_scene_overdrive_badge_partical,
            obj_VFX, shock, particle, f, opacity)
        love.graphics.setCanvas()
        if not ok then log("  draw f" .. f .. " FAIL: " .. tostring(err)) end
        local data = cv:newImageData()
        savePng(data, string.format("%s_f%02d", name, f))
        shots[#shots + 1] = { f = f, data = data }
    end
    return shots
end

local function montage(shots, file, cols)
    local cellW, cellH = W / 3, H / 3
    local rows = math.ceil(#shots / cols)
    local mcv = love.graphics.newCanvas(math.floor(cols * cellW), math.floor(rows * cellH))
    love.graphics.setCanvas(mcv)
    love.graphics.clear(0, 0, 0, 1)
    for i, s in ipairs(shots) do
        local col, row = (i - 1) % cols, math.floor((i - 1) / cols)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(love.graphics.newImage(s.data), col * cellW, row * cellH, 0, 1 / 3, 1 / 3)
        love.graphics.print("f" .. s.f, col * cellW + 6, row * cellH + 4)
    end
    love.graphics.setCanvas()
    savePng(mcv:newImageData(), file)
end

function love.load()
    log("love " .. tostring(love.getVersion()))
    for _, rel in ipairs({ "draw_general_use_functions.lua",
                           "scenes/_scene_config/_game_scenel_config.lua",
                           "scenes/game_scene/_common/draw_functions.lua" }) do
        local ok, err = pcall(loadfile(REPO .. "/" .. rel))
        log(string.format("load %-46s %s %s", rel, ok and "OK" or "FAIL", ok and "" or tostring(err)))
    end
    DRAW_VFX_PARTICAL_3D_CANVAS = love.graphics.newCanvas(W, H)
    obj_stage_game_scene_camera = { 0, -365, -800 }

    local cfg = OVERDRIVE_BADGE_PARTICAL_CONFIG
    log(string.format("cfg charge: brightness=%s r_start=%s r_end=%s w_start=%s w_end=%s soft=%s",
        tostring(cfg.charge_brightness), tostring(cfg.charge_radius_start),
        tostring(cfg.charge_radius_end), tostring(cfg.charge_width_start),
        tostring(cfg.charge_width_end), tostring(cfg.charge_softness)))

    local shock = love.graphics.newShader(readFile(REPO .. "/shaders/overdrive_badge_partical_3d.glsl"))
    local particle = love.graphics.newShader(readFile(REPO .. "/shaders/overdrive_badge_particle.glsl"))
    local badge
    local okb, errb = pcall(function()
        local bytes = readFile(REPO .. "/asset/game_scene/characters/TRM/texture/overdrive_badge/TRM_overdrive_badge_static.png")
        local fdata = love.filesystem.newFileData(bytes, "badge.png")
        local idata = love.image.newImageData(fdata)
        return love.graphics.newImage(idata)
    end)
    if okb then badge = errb else log("badge FAIL " .. tostring(errb)) end

    local cv = love.graphics.newCanvas(W, H)
    local frames = { 0, 3, 6, 9, 11, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 30, 32 }
    local a = runCase("left", 300, badge, shock, particle, cv, frames)
    local b = runCase("mid", 0, badge, shock, particle, cv, frames)
    montage(a, "contact_left", 5)
    montage(b, "contact_mid", 5)

    -- 定量检查:只画全屏冲击波 shader(不画粒子/徽章),
    -- 沿 32 条射线取径向亮度峰值,看「亮环半径」是否逐帧往中心收。
    local obj_VFX = { 0, -345, 0, 1, 1, 1, 0, 0 }
    local center = draw_3d_point_to_2D(obj_stage_game_scene_camera, obj_VFX)
    log("")
    log("径向亮度峰值(只留冲击波 shader,中心 " .. string.format("%.0f,%.0f", center[1], center[2]) .. "):")
    for f = 0, 30 do
        obj_VFX[4] = sample(AKEYS, ALPHA, f)
        obj_VFX["scale_anim"] = sample(SKEYS, SCALE, f)
        love.graphics.setCanvas(cv)
        love.graphics.clear(0, 0, 0, 1)
        local rc = 500
        shock:send("time", f)
        shock:send("opacity", obj_VFX[4])
        shock:send("center", center)
        shock:send("radius", rc)
        shock:send("resolution", { W, H })
        shock:send("shockwave_radius_start", cfg.shockwave_radius_start)
        shock:send("shockwave_radius_grow", cfg.shockwave_radius_grow)
        shock:send("shockwave_width_base", cfg.shockwave_width_base)
        shock:send("shockwave_width_grow", cfg.shockwave_width_grow)
        shock:send("shockwave_brightness", cfg.shockwave_brightness)
        shock:send("charge_brightness", cfg.charge_brightness)
        shock:send("charge_radius_start", cfg.charge_radius_start)
        shock:send("charge_radius_end", cfg.charge_radius_end)
        shock:send("charge_width_start", cfg.charge_width_start)
        shock:send("charge_width_end", cfg.charge_width_end)
        shock:send("charge_softness", cfg.charge_softness)
        love.graphics.setBlendMode("add")
        love.graphics.setShader(shock)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.rectangle("fill", 0, 0, W, H)
        love.graphics.setShader()
        love.graphics.setBlendMode("alpha")
        love.graphics.setCanvas()
        local data = cv:newImageData()
        local best_r, best_v = 0, 0
        for r = 40, 900, 2 do
            local sum, n = 0, 0
            for k = 0, 31 do
                local ang = k * math.pi / 16
                local x = math.floor(center[1] + math.cos(ang) * r)
                local y = math.floor(center[2] + math.sin(ang) * r)
                if x >= 0 and x < W and y >= 0 and y < H then
                    local cr, cg, cb = data:getPixel(x, y)
                    sum = sum + (cr + cg + cb) / 3
                    n = n + 1
                end
            end
            if n > 0 then
                local v = sum / n
                if v > best_v then best_v, best_r = v, r end
            end
        end
        log(string.format("  f%02d  peak_r=%.3fR  亮度=%.3f", f, best_r / 500, best_v))
    end
    log("done")
    flush()
    love.event.quit()
end

function love.draw() end

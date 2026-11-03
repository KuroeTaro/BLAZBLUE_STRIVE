-- burst shockwave 飞行道具:实机渲染 + 数值检查
--   H:/_love/_11.5/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/burst_shockwave_probe
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/burst_shockwave_probe"
local W, H = 1600, 900

local lines = {}
local function log(s) lines[#lines + 1] = tostring(s) end
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

local shader
local cv
local fails = 0
local function bad(msg) fails = fails + 1; log("  !! " .. tostring(msg)) end

function love.load()
    for _, rel in ipairs({
        "update_general_use_functions/animator.lua",
        "scenes/_scene_config/_game_scenel_config.lua",
        "draw_general_use_functions.lua",
        "scenes/game_scene/_common/draw_functions.lua",
        "scenes/game_scene/_common/_projectile.lua"
    }) do
        local ok, err = pcall(dofile, REPO .. "/" .. rel)
        log(string.format("load %-52s %s %s", rel, ok and "OK" or "FAIL", ok and "" or tostring(err)))
        if not ok then bad("load " .. rel) end
    end
    local ok, err = pcall(function()
        shader = love.graphics.newShader(readFile(REPO .. "/shaders/burst_shockwave_projectile_3d.glsl"))
    end)
    log("shader compile: " .. (ok and "OK" or ("FAIL " .. tostring(err))))
    if not ok then bad("shader compile"); flush(); love.event.quit(1); return end

    local config = BURST_SHOCKWAVE_PROJECTILE_CONFIG
    log(string.format(
        "config: life=%s radius=%s r_start=%s r_grow=%s w_base=%s w_grow=%s bright=%s",
        tostring(config.life), tostring(config.radius), tostring(config.radius_start),
        tostring(config.radius_grow), tostring(config.width_base), tostring(config.width_grow),
        tostring(config.brightness)
    ))
    obj_stage_game_scene_camera = {0, -365, -800}
    cv = love.graphics.newCanvas(W, H)

    -- 1) 逐帧渲染,看环是否往外扩、亮度是否收
    local frames = {}
    for f = 0, config.life - 1, 2 do frames[#frames + 1] = f end
    local shots = {}
    log("")
    log("逐帧径向亮度峰值(只画 shader):")
    local obj_projectile = {0, -345, 0, 1, 1, 1, 0, 0}
    for _, f in ipairs(frames) do
        local center = draw_3d_point_to_2D(obj_stage_game_scene_camera, obj_projectile)
        love.graphics.setCanvas(cv)
        love.graphics.clear(0.02, 0.02, 0.03, 1)
        draw_projectile_game_scene_burst_shockwave(shader, obj_projectile, f, 1.0)
        love.graphics.setCanvas()
        local data = cv:newImageData()
        savePng(data, string.format("f%02d", f))
        shots[#shots + 1] = { f = f, data = data }
        -- 沿 64 条射线取径向亮度峰值
        local best_r, best_v = 0, 0
        for r = 20, 900, 2 do
            local sum, n = 0, 0
            for k = 0, 63 do
                local ang = k * math.pi / 32
                local x = math.floor(center[1] + math.cos(ang) * r)
                local y = math.floor(center[2] + math.sin(ang) * r)
                if x >= 0 and x < W and y >= 0 and y < H then
                    local cr, cg, cb = data:getPixel(x, y)
                    sum = sum + (cr + cg + cb) / 3
                    n = n + 1
                end
            end
            if n > 0 and sum / n > best_v then best_v, best_r = sum / n, r end
        end
        log(string.format("  f%02d  peak_r=%.0fpx (%.2fR)  亮度=%.3f", f, best_r, best_r / 500, best_v))
    end

    -- 2) 联系表
    local cols = 5
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
    savePng(mcv:newImageData(), "contact")

    -- 3) 不同位置 / 不同透明度:确认透视与 opacity 生效
    local cases = {
        { name = "left", x = -600, y = -100, op = 1.0 },
        { name = "right", x = 600, y = -100, op = 1.0 },
        { name = "half_op", x = 0, y = -345, op = 0.5 }
    }
    for _, c in ipairs(cases) do
        local obj = {c.x, c.y, 0, 1, 1, 1, 0, 0}
        local f = 4 -- speed=3 后 13 帧已经放完了
        love.graphics.setCanvas(cv)
        love.graphics.clear(0.02, 0.02, 0.03, 1)
        draw_projectile_game_scene_burst_shockwave(shader, obj, f, c.op)
        love.graphics.setCanvas()
        savePng(cv:newImageData(), "case_" .. c.name)
        log(string.format("case %-8s f%d done", c.name, f))
    end

    -- 4) 攻击判定:按真实 tick 顺序模拟(先判定 enemy_interact,再 projectile update,最后角色 update 生成)
    log("")
    log("攻击判定逐帧(判定发生在 animator 之前):")
    local obj_proj = {0,-345,0,1,1,1,0,0}
    obj_proj["hitbox_table"] = {}          -- 生成时(0f 之前)是关的
    local proj_anim = load_game_scene_anim_projectile_burst_shockwave(obj_proj)
    init_character_anim_without(obj_proj, proj_anim)
    local alive_frames = {}
    for tick = 1, 16 do
        -- 1) 这一 tick 的判定看到的状态
        local f_seen = obj_proj[8]
        local alive = obj_proj["hitbox_table"] ~= nil and #obj_proj["hitbox_table"] > 0
        if alive then alive_frames[#alive_frames + 1] = f_seen end
        -- 2) 之后才推进动画
        character_animator(obj_proj, proj_anim)
        log(string.format("  tick %02d: 判定时 f=%s hitbox=%s -> 推进后 f=%s",
            tick, tostring(f_seen), tostring(alive), tostring(obj_proj[8])))
    end
    log("  有判定的帧: " .. table.concat(alive_frames, ","))
    local ok2 = #alive_frames == 1 and alive_frames[1] == 2
    log("  期望只有 2f 有判定: " .. (ok2 and "OK" or "FAIL"))
    if not ok2 then
        fails = fails + 1
    end

    log("")
    log(fails == 0 and "RESULT: OK" or ("RESULT: FAIL (" .. fails .. ")"))
    flush()
    love.event.quit(fails == 0 and 0 or 1)
end

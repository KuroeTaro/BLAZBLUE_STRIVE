-- 参数扫描:overdrive 充能波的 条数 / 速度 / 整体模糊
--   H:/_love/_11.5/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/od_badge_sweep
--   想跑「新旧对照」时,先在同目录生成旧版 shader(没有则自动跳过该段):
--     git show HEAD:shaders/overdrive_badge_partical_3d.glsl > tools/_scratch/od_badge_sweep/old_shader.glsl
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/od_badge_sweep"
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

local shader
local cv
local CENTER = { W / 2, H / 2 + 60 }
local RADIUS = 500

local function drawFrame(cfg, frame, sh)
    sh = sh or shader
    love.graphics.setCanvas(cv)
    love.graphics.clear(0.02, 0.02, 0.03, 1)
    sh:send("time", frame)
    sh:send("opacity", 1.0)
    sh:send("center", CENTER)
    sh:send("radius", RADIUS)
    sh:send("resolution", { W, H })
    sh:send("shockwave_radius_start", 0.5)
    sh:send("shockwave_radius_grow", 3.75)
    sh:send("shockwave_width_base", 0.15)
    sh:send("shockwave_width_grow", 0.24)
    sh:send("shockwave_brightness", 0.0) -- 只看充能波
    sh:send("charge_brightness", cfg.brightness)
    sh:send("charge_radius_start", cfg.r_start)
    sh:send("charge_radius_end", cfg.r_end)
    sh:send("charge_width_start", cfg.w_start)
    sh:send("charge_width_end", cfg.w_end)
    if sh == shader then
        sh:send("charge_count", cfg.count)
        sh:send("charge_speed", cfg.speed)
    end
    sh:send("charge_softness", cfg.soft)
    love.graphics.setBlendMode("add")
    love.graphics.setShader(sh)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", 0, 0, W, H)
    love.graphics.setShader()
    love.graphics.setBlendMode("alpha")
    love.graphics.setCanvas()
end

-- 沿 64 条射线取径向亮度峰值,看「亮环半径」随帧变化
local function peakRadius(frame)
    local data = cv:newImageData()
    local best_r, best_v = 0, 0
    for r = 20, 900, 2 do
        local sum, n = 0, 0
        for k = 0, 63 do
            local ang = k * math.pi / 32
            local x = math.floor(CENTER[1] + math.cos(ang) * r)
            local y = math.floor(CENTER[2] + math.sin(ang) * r)
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
    return best_r / RADIUS, best_v
end

local function save(name)
    local d = cv:newImageData()
    local fd = d:encode("png")
    local f = io.open(DIR .. "/shots/" .. name .. ".png", "wb")
    if f then f:write(fd:getString()); f:close() end
    return d
end

local function montage(data_list, file, cols, labels)
    local cellW, cellH = W / 3, H / 3
    local rows = math.ceil(#data_list / cols)
    local mcv = love.graphics.newCanvas(math.floor(cols * cellW), math.floor(rows * cellH))
    love.graphics.setCanvas(mcv)
    love.graphics.clear(0, 0, 0, 1)
    for i, d in ipairs(data_list) do
        local col, row = (i - 1) % cols, math.floor((i - 1) / cols)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(love.graphics.newImage(d), col * cellW, row * cellH, 0, 1 / 3, 1 / 3)
        if labels and labels[i] then
            love.graphics.print(labels[i], col * cellW + 6, row * cellH + 4)
        end
    end
    love.graphics.setCanvas()
    local fd = mcv:newImageData():encode("png")
    local f = io.open(DIR .. "/shots/" .. file .. ".png", "wb")
    if f then f:write(fd:getString()); f:close() end
end

local BASE = {
    brightness = 0.275, r_start = 2.65, r_end = 0.05,
    w_start = 0.475, w_end = 0.025, count = 3, speed = 1.0, soft = 1.75
}

local function caseCfg(t)
    local c = {}
    for k, v in pairs(BASE) do c[k] = v end
    for k, v in pairs(t) do c[k] = v end
    return c
end

function love.load()
    log("love " .. tostring(love.getVersion()))
    local ok, err = pcall(function()
        shader = love.graphics.newShader(readFile(REPO .. "/shaders/overdrive_badge_partical_3d.glsl"))
    end)
    log("compile: " .. (ok and "OK" or ("FAIL " .. tostring(err))))
    if not ok then flush(); love.event.quit(1); return end
    cv = love.graphics.newCanvas(W, H)

    -- 1) 条数 / 速度对所有帧的影响:看亮环半径序列
    local combos = {
        { "count1_speed1", { count = 1 } },
        { "count3_speed1", {} },
        { "count6_speed1", { count = 6 } },
        { "count3_speed0.5", { speed = 0.5 } },
        { "count3_speed2", { speed = 2.0 } },
    }
    for _, c in ipairs(combos) do
        local cfg = caseCfg(c[2])
        log("")
        log(string.format("[%s] count=%s speed=%s soft=%s", c[1], cfg.count, cfg.speed, cfg.soft))
        local row = {}
        for f = 0, 28, 2 do
            drawFrame(cfg, f)
            local r, v = peakRadius(f)
            row[#row + 1] = string.format("f%02d r=%.2fR b=%.3f", f, r, v)
        end
        log("  " .. table.concat(row, " | "))
    end

    -- 2) 同一帧看不同条数 / 每秒 / 模糊的观感(联系表)
    local frames = { 4, 8, 12, 16, 20, 24 }
    local list, labels = {}, {}
    for _, c in ipairs(combos) do
        local cfg = caseCfg(c[2])
        for _, f in ipairs(frames) do
            drawFrame(cfg, f)
            list[#list + 1] = save(string.format("sweep_%s_f%02d", c[1], f))
            labels[#labels + 1] = string.format("%s f%d", c[1], f)
        end
    end
    montage(list, "contact_count_speed", 6, labels)

    local softs = { 0.4, 0.8, 1.2, 1.75, 2.5, 3.5 }
    local list2, labels2 = {}, {}
    for _, s in ipairs(softs) do
        local cfg = caseCfg({ soft = s })
        for _, f in ipairs({ 12, 20 }) do
            drawFrame(cfg, f)
            list2[#list2 + 1] = save(string.format("soft_%s_f%02d", tostring(s):gsub("%.", "_"), f))
            labels2[#labels2 + 1] = string.format("soft=%s f%d", s, f)
        end
    end
    montage(list2, "contact_softness", 4, labels2)

    -- 3) 能量守恒粗查:同一条波在 softness 变化时的整体积分亮度
    log("")
    log("softness 扫描(仅充能波,f=12 / f=20):")
    for _, s in ipairs(softs) do
        local cfg = caseCfg({ soft = s })
        local out = {}
        for _, f in ipairs({ 12, 20 }) do
            drawFrame(cfg, f)
            local data = cv:newImageData()
            local sum = 0
            for y = 0, H - 1, 4 do
                for x = 0, W - 1, 4 do
                    local cr, cg, cb = data:getPixel(x, y)
                    sum = sum + (cr + cg + cb) / 3
                end
            end
            out[#out + 1] = string.format("f%02d sum=%8.1f", f, sum * 16)
        end
        log(string.format("  soft=%4s  %s", tostring(s), table.concat(out, "  ")))
    end

    -- 3.5) 边界值:条数 0 / 小数 / 超上限,速度 0 / 极快 —— 不能崩、不能出 NaN
    log("")
    log("边界值:")
    local edges = {
        { "count0", { count = 0 } },
        { "count0.4", { count = 0.4 } },
        { "count2.6", { count = 2.6 } },
        { "count13", { count = 13 } },
        { "count40", { count = 40 } },
        { "speed0", { speed = 0.0 } },
        { "speed0.01", { speed = 0.01 } },
        { "speed8", { speed = 8.0 } },
        { "speed100", { speed = 100.0 } },
        { "soft0", { soft = 0.0 } },
        { "soft99", { soft = 99.0 } },
    }
    for _, c in ipairs(edges) do
        local cfg = caseCfg(c[2])
        local out = {}
        for _, f in ipairs({ 0, 8, 16, 24, 28 }) do
            local ok, err = pcall(drawFrame, cfg, f, shader)
            if not ok then
                out[#out + 1] = "f" .. f .. " ERR " .. tostring(err)
            else
                local r, v = peakRadius(f)
                out[#out + 1] = string.format("f%02d b=%.3f", f, v)
            end
        end
        log(string.format("  %-10s %s", c[1], table.concat(out, " | ")))
    end

    -- 4) 与旧版(光晕剖面)对照:同一帧、同一套数值
    local oldPath = DIR .. "/old_shader.glsl"
    local oldSrc = readFile(oldPath)
    if oldSrc then
        local oks, oldShader = pcall(love.graphics.newShader, oldSrc)
        log("")
        log("old shader compile: " .. (oks and "OK" or ("FAIL " .. tostring(oldShader))))
        if oks then
            local list3, labels3 = {}, {}
            for _, f in ipairs({ 8, 12, 16, 20, 24 }) do
                drawFrame(BASE, f, oldShader)
                list3[#list3 + 1] = save("old_f" .. f)
                labels3[#labels3 + 1] = "old soft=1.75 f" .. f
                drawFrame(BASE, f, shader)
                list3[#list3 + 1] = save("new_f" .. f)
                labels3[#labels3 + 1] = "new soft=1.75 f" .. f
            end
            montage(list3, "contact_old_vs_new", 4, labels3)
        end
    end

    log("done")
    flush()
    love.event.quit()
end

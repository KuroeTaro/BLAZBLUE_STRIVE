-- 实机验证 & 调参:
--   * 加载仓库里真实的 draw_functions.lua
--   * 用仓库里真实的 .glsl 编译 shader
--   * 调用真实的 draw_VFX_game_scene_partical_3d_canvas()
--   * 指定帧渲染 1600x900,导出 PNG,并统计亮度 / 点亮率 / 逐帧变化率
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local OUT_PATH = os.getenv("DSH_SHADER_TEST_OUT") or (REPO .. "/tools/_scratch/love_probe/result.txt")
local SHOT_DIR = os.getenv("DSH_SHADER_SHOT_DIR") or (REPO .. "/tools/_scratch/love_probe/shots")

local lines = {}
local function log(s) lines[#lines + 1] = s end
local function flush()
    local f = io.open(OUT_PATH, "w")
    if f then f:write(table.concat(lines, "\n")); f:close() end
end

local function readFile(path)
    local f = io.open(path, "rb")
    if not f then return nil end
    local s = f:read("*a")
    f:close()
    return s
end

local function savePng(data, name)
    local fd = data:encode("png")
    local f = io.open(SHOT_DIR .. "/" .. name .. ".png", "wb")
    if f then
        f:write(fd:getString())
        f:close()
    end
end

local function stats(data)
    local sum, lit, n = 0, 0, 0
    local top, bot, tn, bn = 0, 0, 0, 0
    for y = 0, 899, 2 do
        for x = 0, 1599, 2 do
            local r, g, b = data:getPixel(x, y)
            local m = math.max(r, g, b)
            sum = sum + m
            if m > 0.08 then lit = lit + 1 end
            n = n + 1
            -- 渐变检查:上/下半屏各自的平均亮度
            if y < 450 then
                top = top + m; tn = tn + 1
            else
                bot = bot + m; bn = bn + 1
            end
        end
    end
    return sum / n, lit / n * 100, top / tn, bot / bn
end

-- 两帧之间「改变了多少」——原 counter 资产实测是 2.1%
local function frameDelta(a, b)
    local changed, n = 0, 0
    for y = 0, 899, 2 do
        for x = 0, 1599, 2 do
            local r1, g1, b1 = a:getPixel(x, y)
            local r2, g2, b2 = b:getPixel(x, y)
            local d = math.max(math.abs(r1 - r2), math.abs(g1 - g2), math.abs(b1 - b2))
            if d > 0.05 then changed = changed + 1 end
            n = n + 1
        end
    end
    return changed / n * 100
end

function love.load()
    log("love version: " .. tostring(love.getVersion()))
    log("renderer: " .. tostring(love.graphics.getRendererInfo()))

    -- 真的把 draw_functions.lua 加载进来
    local chunk, err = loadfile(REPO .. "/scenes/game_scene/_common/draw_functions.lua")
    if not chunk then
        log("LOAD FAIL : " .. tostring(err)); flush(); love.event.quit(); return
    end
    local ok, run_err = pcall(chunk)
    if not ok then
        log("LOAD FAIL : " .. tostring(run_err)); flush(); love.event.quit(); return
    end
    log("LOAD OK     draw_functions.lua")

    DRAW_VFX_PARTICAL_3D_CANVAS = love.graphics.newCanvas(1600, 900)
    obj_stage_game_scene_camera = { 0, -365, -800 }
    local obj_VFX = { 0, 0, 0, 1, 1, 1, 0, 0 }

    local jobs = {
        {
            name = "od", file = "overdrive_partical_3d.glsl",
            envelope = draw_VFX_game_scene_partical_3d_overdrive_opacity,
            frames = { 0, 10, 20, 40, 60 }, delta = { 40, 41 },
        },
        {
            name = "counter", file = "counter_partical_3d.glsl",
            envelope = draw_VFX_game_scene_partical_3d_counter_opacity,
            frames = { 0, 6, 12, 24, 35 }, delta = { 12, 13 },
        },
    }

    for _, job in ipairs(jobs) do
        local src = readFile(REPO .. "/shaders/" .. job.file)
        local sok, shader = pcall(love.graphics.newShader, src)
        if not sok then
            log("SHADER FAIL " .. job.name .. " : " .. tostring(shader))
        else
            log("SHADER OK   " .. job.name)
            for _, f in ipairs(job.frames) do
                local op = job.envelope(f)
                draw_VFX_game_scene_partical_3d_canvas(obj_VFX, shader, f, op)
                local data = DRAW_VFX_PARTICAL_3D_CANVAS:newImageData()
                local mean, lit, top, bot = stats(data)
                savePng(data, job.name .. "_f" .. f)
                log(string.format("  %-8s f%-3d opacity=%.2f mean=%.4f lit%%=%.2f  上半=%.4f 下半=%.4f",
                    job.name, f, op, mean, lit, top, bot))
            end
            -- 逐帧变化率(衡量闪烁强度)
            local fa, fb = job.delta[1], job.delta[2]
            draw_VFX_game_scene_partical_3d_canvas(obj_VFX, shader, fa, job.envelope(fa))
            local da = DRAW_VFX_PARTICAL_3D_CANVAS:newImageData()
            draw_VFX_game_scene_partical_3d_canvas(obj_VFX, shader, fb, job.envelope(fb))
            local db = DRAW_VFX_PARTICAL_3D_CANVAS:newImageData()
            log(string.format("  %-8s frame-to-frame changed%%=%.2f  (原资产 counter = 2.1)",
                job.name, frameDelta(da, db)))
        end
    end

    -- 渐变扫描:同一份 counter shader,只换 GRADIENT_START / GRADIENT_END,
    -- 用来确定「起点/终点」这两个数到底填多少
    local baseSrc = readFile(REPO .. "/shaders/counter_partical_3d.glsl")
    log("")
    log("counter 渐变扫描 (frame 12, opacity=1)  START=1.0处满值 / END=0.0处消失:")
    for _, gv in ipairs({
        { "0.5", "1.0" }, { "0.0", "1.0" }, { "0.3", "0.9" },
        { "0.65", "1.1" }, { "1.0", "0.0" },
    }) do
        local s = baseSrc:gsub("(#define GRADIENT_START%s+)[%d%.]+", "%1" .. gv[1], 1)
        s = s:gsub("(#define GRADIENT_END%s+)[%d%.]+", "%1" .. gv[2], 1)
        local sok, shader = pcall(love.graphics.newShader, s)
        if sok then
            draw_VFX_game_scene_partical_3d_canvas(obj_VFX, shader, 12, 1.0)
            local data = DRAW_VFX_PARTICAL_3D_CANVAS:newImageData()
            local mean, lit, top, bot = stats(data)
            local tag = gv[1] .. "_" .. gv[2]
            savePng(data, "grad_" .. tag:gsub("%.", "_"))
            log(string.format("  START=%-5s END=%-5s mean=%.4f   上半=%.4f 下半=%.4f",
                gv[1], gv[2], mean, top, bot))
        else
            log("  gradient " .. gv[1] .. "/" .. gv[2] .. " SHADER FAIL " .. tostring(shader))
        end
    end

    -- ---- 黑幕 overlay 重构后的行为验证 ----
    log("")
    for _, rel in ipairs({
        "update_general_use_functions/animator.lua",
        "draw_general_use_functions.lua",
        "scenes/game_scene/_common/_VFX.lua",
    }) do
        local c, e = loadfile(REPO .. "/" .. rel)
        if not c then
            log("SYNTAX FAIL " .. rel .. " : " .. tostring(e))
        else
            local ok, runerr = pcall(c)
            log((ok and "SYNTAX OK   " or "RUN FAIL    ") .. rel
                .. (ok and "" or (" : " .. tostring(runerr))))
        end
    end
    if type(insert_VFX_game_scene_char_overdrive_black_overlay) == "function" then
        local fake_char = {
            overdrive_gauge = { 1, 2, "on" },
            VFX_black_overlay_table = {},
        }
        insert_VFX_game_scene_char_overdrive_black_overlay(fake_char)
        local ov = fake_char["VFX_black_overlay_table"][1]
        local seq = {}
        for f = 0, 40 do
            if f == 36 then fake_char["overdrive_gauge"][3] = "off" end
            ov["update"]()
            if f <= 4 or f % 5 == 0 or f >= 35 then
                seq[#seq + 1] = string.format("f%d=%.3f", f, ov[4])
            end
        end
        log("  black_overlay opacity: " .. table.concat(seq, " "))
        log(string.format("  after 40 frames: life=%d state=%s", ov["life"], tostring(ov["state"])))
        -- 真的画一次,确认 draw_solid 能跑
        local dok, derr = pcall(ov["draw"])
        log("  draw: " .. (dok and "OK" or ("FAIL " .. tostring(derr))))
    else
        log("  black_overlay function not found")
    end

    flush()
    love.event.quit()
end

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

-- 出错时把已经跑过的日志和错误信息写出来,然后立刻退出
-- (不能只 return 一个空函数,那样窗口会一直停在错误画面,外面 -Wait 会挂死)
function love.errorhandler(msg)
    local f = io.open(OUT_PATH, "w")
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

    -- ---- RC black overlay(峰值 0.825)----
    if type(insert_VFX_game_scene_char_RC_black_overlay) == "function" then
        local rc_char = { VFX_black_overlay_table = {} }
        insert_VFX_game_scene_char_RC_black_overlay(rc_char)
        local rcov = rc_char["VFX_black_overlay_table"][1]
        local rcseq = {}
        for f = 0, 96 do
            rcov["update"]()
            if f == 0 or f == 10 or f == 20 or f == 21 or f == 60 or f == 85 or f == 90 or f == 94 then
                rcseq[#rcseq + 1] = string.format("f%d=%.3f", f, rcov[4])
            end
        end
        log("  RC_black_overlay opacity: " .. table.concat(rcseq, " "))
        local rdok, rderr = pcall(rcov["draw"])
        log("  RC_black_overlay draw: " .. (rdok and "OK" or ("FAIL " .. tostring(rderr))))
    end

    -- 只编译不执行的文件
    for _, rel in ipairs({ "scenes/game_scene/_common/init.lua" }) do
        local cc, ee = loadfile(REPO .. "/" .. rel)
        log("COMPILE " .. (cc and "OK   " or "FAIL ") .. rel .. (cc and "" or (" : " .. tostring(ee))))
    end

    -- ---- RC blast:帧步进 / 中心对齐 / 绘制 ----
    log("")
    for _, rel in ipairs({
        "update_general_use_functions/animator.lua",
        "draw_general_use_functions.lua",
        "scenes/game_scene/_common/_VFX.lua",
        "scenes/game_scene/_common/_anim.lua",
        "scenes/game_scene/_common/_projectile.lua",
        "scenes/game_scene/_common/common_functions.lua",
        "scenes/game_scene/_common/main_blocks.lua",
        "scenes/game_scene/_common/load_function.lua",
        "threads/game_scene/VFX_overdrive_heat.lua",
    }) do
        local c, e = loadfile(REPO .. "/" .. rel)
        if not c then
            log("SYNTAX FAIL " .. rel .. " : " .. tostring(e))
        else
            local okr, errr = pcall(c)
            log((okr and "SYNTAX OK   " or "RUN FAIL    ") .. rel
                .. (okr and "" or (" : " .. tostring(rerr or errr))))
        end
    end
    if type(insert_VFX_game_scene_char_RC_blast) == "function" then
        -- 造一个假的 sprite sheet(4x4 图,15 个相同 quad),只为跑通绘制路径
        local dummy = love.graphics.newImage(love.image.newImageData(4, 4))
        local sb = love.graphics.newSpriteBatch(dummy, 8, "dynamic", { "position", "color" })
        local sheet = { sprite_batch = sb, frames = {} }
        for i = 0, 14 do
            sheet.frames[tostring(i)] = { 0, 0, 4, 4, 4, 4 }
        end
        image_sprite_sheet_VFX_game_scene_RC_blast = sheet
        obj_stage_game_scene_camera = { 0, -365, -800 }

        -- 与 _anim.lua 里四个 RC 的实际调用保持一致(第 4 项 = 叠几层,红是 2)
        local configs = {
            { "red",    2,    { 1.00, 0.28, 0.22 }, 2 },
            { "blue",   2,    { 0.35, 0.65, 1.00 }, 1 },
            { "purple", 1.25, { 0.78, 0.40, 1.00 }, 1 },
            { "yellow", 1.25, { 1.00, 0.88, 0.30 }, 1 },
        }
        for _, cfg in ipairs(configs) do
            local name, scale, col = cfg[1], cfg[2], cfg[3]
            local fc = {
                x = 300, y = -120, [3] = 0, [5] = 1, [6] = 1, [7] = 0,
                height = "stand", VFX_common_back_table = {},
            }
            insert_VFX_game_scene_char_RC_blast(fc, 1, scale, col)
            local v = fc["VFX_common_back_table"][1]
            local sx, sy, yo = fc[5], fc[6], 880
            local bcx = fc["x"]
            local bcy = (fc["y"] - sy * yo) + sy * 600
            local half = 500 * (v[5] / sx)
            local cx, cy = v[1] + sx * half, v[2] + sy * half
            local dok, derr = pcall(v["draw"])
            log(string.format("  %-6s alpha=%.2f scale=%d size=%4.0f  centre=(%.1f,%.1f) badge=(%.1f,%.1f) %s  draw:%s",
                name, v[4], scale, half * 2, cx, cy, bcx, bcy,
                (math.abs(bcx - cx) < 0.01 and math.abs(bcy - cy) < 0.01) and "OK" or "MISMATCH",
                dok and "OK" or tostring(derr)))
            if name == "red" then
                -- 顺便验一次帧步进(2f 一帧、life 30)
                local seq, life_end = {}, 0
                for f = 0, 33 do
                    v["update"]()
                    if f % 2 == 0 or f == 32 then seq[#seq + 1] = tostring(v[8]) end
                    life_end = v["life"]
                end
                log("    frames @0,2,4,...: " .. table.concat(seq, ","))
                log(string.format("    after 34 updates: life=%d", life_end))
            end
        end

        -- RC_partical 的颜色:用纯白 dummy 图 add 到黑画布,读最亮像素即得实际 tint
        -- 先把染色 shader 编译好(直接读源码,绕过 love.filesystem 沙箱)
        local id = love.image.newImageData(8, 8)
        for y = 0, 7 do
            for x = 0, 7 do id:setPixel(x, y, 1, 1, 1, 1) end
        end
        local wimg = love.graphics.newImage(id)
        local wsb = love.graphics.newSpriteBatch(wimg, 8, "dynamic", { "position", "color" })
        local wsheet = { sprite_batch = wsb, frames = {} }
        for i = 0, 14 do wsheet.frames[tostring(i)] = { 0, 0, 8, 8, 8, 8 } end
        image_sprite_sheet_VFX_game_scene_RC_partical = wsheet
        local cv = love.graphics.newCanvas(1600, 900)
        for _, cfg in ipairs(configs) do
            love.graphics.setCanvas(cv)
            love.graphics.clear(0, 0, 0, 1)
            -- RC_partical 的贴图是 600x600,左上角在 (x-600, y-y_offset);
            -- 这里 dummy 只有 8x8,所以把角色挪到能让它落在画面里的位置
            local fc = {
                x = 300, y = 400, [3] = 0, [5] = 1, [6] = 1, [7] = 0,
                height = "stand", VFX_common_back_table = {},
            }
            insert_VFX_game_scene_char_RC_partical(fc, cfg[3])

            fc["VFX_common_back_table"][1]["draw"]()
            love.graphics.setCanvas()
            local d = cv:newImageData()
            local ppt = draw_3d_point_to_2D(obj_stage_game_scene_camera, fc["VFX_common_back_table"][1])
            local best, br, bg, bb = -1, 0, 0, 0
            for yy = ppt[2] - 10, ppt[2] + 40 do
                for xx = ppt[1] - 10, ppt[1] + 40 do
                    local r, g, b = d:getPixel(xx, yy)
                    local m = r + g + b
                    if m > best then best = m; br, bg, bb = r, g, b end
                end
            end
            if cfg[1] == "red" then
                local v0 = fc["VFX_common_back_table"][1]
                log(string.format("    [debug] obj[1]=%.1f obj[2]=%.1f obj[5]=%.1f obj[8]=%d batch_count=%d frames0=%s",
                    v0[1], v0[2], v0[5], v0[8], wsb:getCount(), tostring(wsheet.frames["0"][3])))
                savePng(d, "partical_debug")
            end
            -- 单层:渲染值就是 tint 本身
            local er, eg, eb = cfg[3][1], cfg[3][2], cfg[3][3]
            log(string.format("  partical %-6s 期望=(%.2f,%.2f,%.2f) 渲染=(%.2f,%.2f,%.2f) %s",
                cfg[1], er, eg, eb, br, bg, bb,
                (math.abs(br - er) < 0.02 and math.abs(bg - eg) < 0.02
                    and math.abs(bb - eb) < 0.02) and "OK" or "MISMATCH"))
        end


        -- RC badge 两个版本
        image_sprite_sheet_VFX_game_scene_RC_red_badge = wsheet
        local function badge_char()
            return {
                x = 300, y = 400, [3] = 0, [5] = 1, [6] = 1, [7] = 0,
                height = "stand",
                VFX_hit_front_table = {},
                VFX_common_front_table = {},
            }
        end
        -- 版本 1:满速 / 100% / 纯白
        local c1 = badge_char()
        insert_VFX_game_scene_char_RC_badge(c1, image_sprite_sheet_VFX_game_scene_RC_red_badge)
        local v1 = c1["VFX_hit_front_table"][1]
        local seq1 = {}
        for f = 0, 14 do
            v1["update"]()
            seq1[#seq1 + 1] = tostring(v1[8])
        end
        log("  badge v1 帧序列: " .. table.concat(seq1, ","))
        love.graphics.setCanvas(cv)
        love.graphics.clear(0, 0, 0, 1)
        v1["draw"]()
        love.graphics.setCanvas()
        local d1 = cv:newImageData()
        local best1, q1, q2, q3 = -1, 0, 0, 0
        local pt1 = draw_3d_point_to_2D(obj_stage_game_scene_camera, v1)
        for yy1 = pt1[2] - 10, pt1[2] + 40 do
            for xx1 = pt1[1] - 10, pt1[1] + 40 do
                local r, g, b = d1:getPixel(xx1, yy1)
                local m = r + g + b
                if m > best1 then best1 = m; q1, q2, q3 = r, g, b end
            end
        end
        log(string.format("  badge v1 颜色=(%.2f,%.2f,%.2f) 缩放=%.2f 中心=(%.1f,%.1f)",
            q1, q2, q3, v1[5] / c1[5], v1[1] + 600 * v1[5], v1[2] + 600 * v1[6]))
        -- 版本 2:半速 / 75% / 带颜色
        local c2 = badge_char()
        insert_VFX_game_scene_char_RC_badge_blast(c2, image_sprite_sheet_VFX_game_scene_RC_red_badge, { 1.00, 0.60, 0.57 })
        local v2 = c2["VFX_common_front_table"][1]
        local seq2, life2 = {}, 0
        for f = 0, 29 do
            v2["update"]()
            if f < 6 or f >= 26 then seq2[#seq2 + 1] = tostring(v2[8]) end
            life2 = v2["life"]
        end
        log("  badge v2 帧序列(前6+后5, 共 30 次 update): " .. table.concat(seq2, ","))
        log(string.format("  badge v2 30 次 update 后 life=%d", life2))
        love.graphics.setCanvas(cv)
        love.graphics.clear(0, 0, 0, 1)
        v2["draw"]()
        love.graphics.setCanvas()
        local d2 = cv:newImageData()
        local best4, w1, w2, w3 = -1, 0, 0, 0
        local pt2 = draw_3d_point_to_2D(obj_stage_game_scene_camera, v2)
        for yy2b = pt2[2] - 10, pt2[2] + 40 do
            for xx2b = pt2[1] - 10, pt2[1] + 40 do
                local r, g, b = d2:getPixel(xx2b, yy2b)
                local m = r + g + b
                if m > best4 then best4 = m; w1, w2, w3 = r, g, b end
            end
        end
        local cx1, cy1 = v1[1] + 600 * v1[5], v1[2] + 600 * v1[6]
        local cx2, cy2 = v2[1] + 600 * v2[5], v2[2] + 600 * v2[6]
        log(string.format("  badge v2 颜色=(%.2f,%.2f,%.2f) 期望=(1.00,0.60,0.57) %s",
            w1, w2, w3,
            (math.abs(w1 - 1.00) < 0.02 and math.abs(w2 - 0.60) < 0.02
                and math.abs(w3 - 0.57) < 0.02) and "OK" or "MISMATCH"))
        log(string.format("  badge v2 缩放=%.2f  中心=(%.1f,%.1f) v1中心=(%.1f,%.1f) %s",
            v2[5] / c2[5], cx2, cy2, cx1, cy1,
            (math.abs(cx2 - cx1) < 0.01 and math.abs(cy2 - cy1) < 0.01) and "OK 重合" or "MISMATCH"))

        -- 空中 + 左右翻转再验一次
        local fake2 = {
            x = -450, y = -600, [3] = 0, [5] = -1, [6] = 1, [7] = 0,
            height = "air", VFX_common_back_table = {},
        }
        insert_VFX_game_scene_char_RC_blast(fake2, 1, 1.25, { 0.35, 0.65, 1.00 })
        local b2 = fake2["VFX_common_back_table"][1]
        local half2 = 500 * (b2[5] / fake2[5])
        local bcx2 = fake2["x"]
        local bcy2 = (fake2["y"] - fake2[6] * 750) + fake2[6] * 600
        log(string.format("  air(flip) badge=(%.1f,%.1f) blast=(%.1f,%.1f) %s",
            bcx2, bcy2, b2[1] + fake2[5] * half2, b2[2] + fake2[6] * half2,
            (math.abs(bcx2 - (b2[1] + fake2[5] * half2)) < 0.01
                and math.abs(bcy2 - (b2[2] + fake2[6] * half2)) < 0.01)
            and "OK" or "MISMATCH"))
    else
        log("  insert_VFX_game_scene_char_RC_blast not found")
    end

    -- ---- Positive Bonus ----
    if type(common_game_scene_apply_positive_bonus) == "function" then
        INPUT_SYS_CURRENT_COMMAND_STATE = { L = {}, R = {} }
        local function mk_char(side)
            return {
                player_side = side,
                hit_damage = 100, damage_correction = 1,
                hit_damage_correction_factor = 1, hit_wallbreak_damage = 0,
                hit_heat_gain = 10, hurt_heat_gain = 5,
                blocked_heat_gain = 3, block_heat_gain = 2,
                heat_penalty = 1, heat_gauge = { 0, 200 },
                overdrive_gauge = { 0, 600 }, health_gauge = { 1000, 1000 },
                risk_gauge = { 0, 100 }, wallstick_gauge = { 0, 100 },
                positive_bonus = false,
                positive_bonus_heat_gain_buff = 1,
                positive_bonus_hit_damage_buff = 1,
                positive_bonus_hurt_damage_buff = 1,
            }
        end
        local a, b = mk_char("L"), mk_char("R")
        common_game_scene_char_apply_damage(a, b, "hurt", false)
        log(string.format("  PB 未开启 : 伤害=%.2f  攻方heat=%.2f  守方heat=%.2f",
            1000 - b["health_gauge"][1], a["heat_gauge"][1], b["heat_gauge"][1]))

        local c, d = mk_char("L"), mk_char("R")
        common_game_scene_apply_positive_bonus(c)
        common_game_scene_apply_positive_bonus(d)
        log(string.format("  PB 开启   : countdown=%d heatbuff=%.2f hitbuff=%.2f hurtbuff=%.2f",
            c["positive_bonus_countdown"],
            c["positive_bonus_heat_gain_buff"],
            c["positive_bonus_hit_damage_buff"],
            c["positive_bonus_hurt_damage_buff"]))
        common_game_scene_char_apply_damage(c, d, "hurt", false)
        log(string.format("  PB 开启   : 伤害=%.2f  攻方heat=%.2f  守方heat=%.2f",
            1000 - d["health_gauge"][1], c["heat_gauge"][1], d["heat_gauge"][1]))
        log(string.format("  每秒自动增长: tension=%.2f/200 (%.1f%%)  burst=%.2f/600 (%.1f%%)",
            0.28 * 60, 0.28 * 60 / 200 * 100, 0.48 * 60, 0.48 * 60 / 600 * 100))

        -- 积极状态清除 ability_penalty / heat_penalty
        local e = mk_char("L")
        e["ability_penalty"] = 0.35
        e["ability_penalty_countdown"] = 120
        e["heat_penalty"] = 0.20
        e["heat_penalty_countdown"] = 60
        log(string.format("  PB 前惩罚 : ability=%.2f/%d  heat=%.2f/%d",
            e["ability_penalty"], e["ability_penalty_countdown"],
            e["heat_penalty"], e["heat_penalty_countdown"]))
        common_game_scene_apply_positive_bonus(e)
        log(string.format("  PB 后惩罚 : ability=%.2f/%d  heat=%.2f/%d  (期望 1.00/0  1.00/0) %s",
            e["ability_penalty"], e["ability_penalty_countdown"],
            e["heat_penalty"], e["heat_penalty_countdown"],
            (e["ability_penalty"] == 1 and e["ability_penalty_countdown"] == 0
                and e["heat_penalty"] == 1 and e["heat_penalty_countdown"] == 0)
            and "OK" or "MISMATCH"))

        -- 碎墙额外伤害(当前公式:6% 血量上限,保底 3%)
        local w1 = mk_char("R")
        w1["damage_correction"] = 1
        w1["positive_bonus_hurt_damage_buff"] = 1
        w1["health_gauge"] = { 12000, 12000 }
        common_game_scene_apply_wallbreak_damage(w1)
        log(string.format("  碎墙伤害 满血: 12000 -> %.2f  扣了 %.2f (%.3f%%)  %s",
            w1["health_gauge"][1], 12000 - w1["health_gauge"][1],
            (12000 - w1["health_gauge"][1]) / 12000 * 100,
            (math.abs((12000 - w1["health_gauge"][1]) - 12000 * 0.06) < 0.01) and "OK" or "MISMATCH"))
        local w2 = mk_char("R")
        w2["health_gauge"] = { 500, 12000 }
        common_game_scene_apply_wallbreak_damage(w2)
        log(string.format("  碎墙伤害 残血 500: -> %.2f  %s",
            w2["health_gauge"][1], (w2["health_gauge"][1] == 0) and "OK 不会变负" or "MISMATCH"))
    else
        log("  common_game_scene_apply_positive_bonus not found")
    end

    -- ---- round timer state machine(off / on,状态由外部驱动)----
    if type(update_game_scene_HUD_timer) == "function" then
        obj_HUD_game_scene_timer = { 780, 85, nil, 1, 1, 1, 0, 0 }
        ROUND_TIMER = { 9, 9, 5, 9 }
        local function show(tag)
            return string.format("  timer[%-16s] 显示=%d%d 帧=%d%d state=%s",
                tag, ROUND_TIMER[1], ROUND_TIMER[2], ROUND_TIMER[3], ROUND_TIMER[4],
                obj_HUD_game_scene_timer["state"])
        end
        local function tick(n)
            for i = 1,(n or 1) do update_game_scene_HUD_timer(obj_HUD_game_scene_timer) end
        end
        common_game_scene_HUD_timer_reset()
        log(show("reset"))
        obj_HUD_game_scene_timer["state"] = "on"
        tick(1);  log(show("1帧"))
        tick(59); log(show("60帧 应掉1秒"))
        tick(60); log(show("120帧 应再掉1秒"))
        -- 跨十位:90 秒 -> 89
        ROUND_TIMER = { 9, 0, 5, 9 }
        tick(60); log(show("90秒跑60帧"))
        -- off 时完全不动
        obj_HUD_game_scene_timer["state"] = "off"
        local snap = table.concat(ROUND_TIMER,",")
        tick(300)
        log(string.format("  timer[off 300帧     ] %s (应不变) %s",
            table.concat(ROUND_TIMER,","),
            (table.concat(ROUND_TIMER,",") == snap) and "OK" or "MISMATCH"))
        -- 时间到停在 00 00(不内部改 state)
        ROUND_TIMER = { 0, 0, 0, 1 }
        obj_HUD_game_scene_timer["state"] = "on"
        tick(2)
        log(show("倒数到 0"))
        -- 碎墙:外部 off -> on
        obj_HUD_game_scene_timer["state"] = "off"
        log(string.format("  碎墙开始 set_state(off): state=%s", obj_HUD_game_scene_timer["state"]))
        obj_HUD_game_scene_timer["state"] = "on"
        log(string.format("  碎墙结束 set_state(on) : state=%s", obj_HUD_game_scene_timer["state"]))
    end

    -- ---- win marks:add_one 线性 + 绘制半透明余格 ----
    if type(update_game_scene_win_marks) == "function" then
        WIN_MARK = { L = 0, R = 0 }
        local obj = { side = "L", state = "add_one", target = 1 }
        local frames = 0
        while obj["state"] == "add_one" and frames < 100 do
            update_game_scene_win_marks(obj)
            frames = frames + 1
        end
        log(string.format("  win_marks add_one: %d 帧 value=%.2f state=%s target=%s",
            frames, WIN_MARK["L"], obj["state"], tostring(obj["target"])))
        obj["state"] = "add_one"; obj["target"] = 2; frames = 0
        while obj["state"] == "add_one" and frames < 100 do
            update_game_scene_win_marks(obj); frames = frames + 1
        end
        log(string.format("  win_marks 第二次 add_one: %d 帧 value=%.2f (期望 2.00)", frames, WIN_MARK["L"]))
        -- 动画途中重复触发不应多算
        WIN_MARK["R"] = 0
        local objR = { side = "R", state = "add_one", target = 1 }
        for i = 1,10 do update_game_scene_win_marks(objR) end
        local mid = WIN_MARK["R"]
        objR["state"] = "add_one"
        for i = 1,20 do update_game_scene_win_marks(objR) end
        log(string.format("  win_marks 重复触发: 中途=%.2f 最终=%.2f (期望 1.00)", mid, WIN_MARK["R"]))
    end
    if type(draw_game_scene_add_to_sprite_batch_round_win_marks) == "function" then
        local wimg = love.graphics.newImage(love.image.newImageData(4,4))
        local wsb = love.graphics.newSpriteBatch(wimg,32,"dynamic",{"position","color"})
        local wsheet = { sprite_batch = wsb, frames = { HUD_win_mark = {0,0,10,10,4,4} } }
        local wobj = {750,115,nil,1,1,1,0,0}
        local cases = { {0,"0 个"}, {0.5,"半格"}, {1.0,"1 格"}, {1.5,"1 格+半"}, {2.75,"2 格+0.75"}, {3.0,"3 格"} }
        for _, cs in ipairs(cases) do
            wsb:clear()
            draw_game_scene_add_to_sprite_batch_round_win_marks(wobj,wsheet,"HUD_win_mark",cs[1])
            log(string.format("  win_marks 绘制 value=%.2f (%-8s) -> sprite 数=%d", cs[1], cs[2], wsb:getCount()))
        end
    end

    -- ---- match point:先到 ROUND_FT-1 的一方点亮 + ease_in ----
    if type(update_game_scene_match_point) == "function" then
        ROUND_FT = 2
        WIN_MARK = { L = 1, R = 0 }
        MATCH_POINT = { L = 0, R = 0 }
        anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1 = {
            [0] = {0,10}, [10] = {1,10},
            prop = 4, length = 10, loop = false, fix_type = true
        }
        local function mk_mp(x,sx,side)
            local o = { x, 85, nil, 0, sx, 1, 0, 0 }
            o[1] = x; o[2] = 85; o[3] = 0; o[4] = 0; o[5] = sx
            o[6] = 1; o[7] = 0; o[8] = 0
            o["side"] = side
            o["state"] = "off"
            return o
        end
        local lp = mk_mp(717,1,"L")
        local rp = mk_mp(883,-1,"R")
        local samples = {}
        for f = 1,14 do
            update_game_scene_match_point(lp)
            update_game_scene_match_point(rp)
            if f <= 12 then samples[#samples+1] = string.format("%.2f", lp[4]) end
        end
        log("  match_point LP 透明度(每帧): " .. table.concat(samples, " "))
        log(string.format("  match_point LP: state=%s opacity=%.2f MATCH_POINT=%s (期望 on/1.00/1)",
            lp["state"], lp[4], tostring(MATCH_POINT["L"])))
        log(string.format("  match_point RP: state=%s opacity=%.2f MATCH_POINT=%s (期望 off/0.00/0)",
            rp["state"], rp[4], tostring(MATCH_POINT["R"])))
        -- 双方都到 match point
        WIN_MARK["R"] = 1
        for f = 1,14 do update_game_scene_match_point(rp) end
        log(string.format("  match_point 双方: LP=%s RP=%s (期望 on/on)",
            lp["state"], rp["state"]))
    end

    -- ---- overdrive text:off / ease_in / ready / ease_out ----
    if type(update_game_scene_HUD_overdrive_text) == "function" then
        anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1 = {
            [0] = {0,10}, [10] = {1,10}, prop = 4, length = 10, loop = false, fix_type = true
        }
        anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0 = {
            [0] = {1,10}, [10] = {0,10}, prop = 4, length = 10, loop = false, fix_type = true
        }
        local char = { overdrive_gauge = { 600, 600, "off" } }
        local text = { 205, 102, nil, 0, 1, 1, 0, 0, state = "off" }
        text["FCT"] = {0,0,0,0,0,0,0,0}
        text["LCT"] = {0,0,0,0,0,0,0,0}
        text["LCD"] = {0,0,0,0,0,0,0,0}
        local function tick(n)
            for i = 1,(n or 1) do update_game_scene_HUD_overdrive_text(char,text) end
        end
        local function show(tag)
            return string.format("  overdrive_text[%-14s] state=%-8s opacity=%.2f",
                tag, text["state"], text[4])
        end
        -- 槽满:off -> ease_in
        tick(1);  log(show("满槽 第1帧"))
        tick(4);  log(show("满槽 第5帧"))
        tick(6);  log(show("满槽 第11帧"))
        -- 保持 ready
        tick(30); log(show("保持 30帧"))
        -- 槽不满:ready -> ease_out
        char["overdrive_gauge"][1] = 500
        tick(1);  log(show("掉槽 第1帧"))
        tick(4);  log(show("掉槽 第5帧"))
        tick(6);  log(show("掉槽 第11帧"))
        -- 再满一次
        char["overdrive_gauge"][1] = 600
        tick(12); log(show("再满 12帧"))
        log(string.format("  期望序列: off -> ease_in(0→1) -> ready -> ease_out(1→0) -> off"))
    end

    -- ---- overdrive timer / brightness 拆分 ----
    if type(update_game_scene_HUD_overdrive_timer) == "function"
    and type(update_game_scene_HUD_overdrive_brightness) == "function" then
        anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1 = {
            [0] = {0,10}, [10] = {1,10}, prop = 4, length = 10, loop = false, fix_type = true
        }
        anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0 = {
            [0] = {1,10}, [10] = {0,10}, prop = 4, length = 10, loop = false, fix_type = true
        }
        anim_char_point_linear_game_scene_overdrive_brightness_ease_in = {
            [0] = {0,32}, [32] = {0.2,32}, prop = "brightness", length = 32, loop = false, fix_type = false
        }
        anim_char_point_linear_game_scene_overdrive_brightness_ease_out = {
            [0] = {0.2,10}, [10] = {0,10}, prop = "brightness", length = 10, loop = false, fix_type = false
        }
        local char = {
            overdrive_gauge = { 600, 600, "off" },
            brightness = -0.05,
            brightness_const = -0.05,
            brightness_overdrive_const = 0.15,
            overdrive_brightness_state = "default"
        }
        char["FCT"] = {0,0,0,0,0,0,0,0}
        char["LCT"] = {0,0,0,0,0,0,0,0}
        char["LCD"] = {0,0,0,0,0,0,0,0}
        local timer = { 0, 0, 0, 0, 1, 1, 0, 0, state = "default" }
        timer["FCT"] = {0,0,0,0,0,0,0,0}
        timer["LCT"] = {0,0,0,0,0,0,0,0}
        timer["LCD"] = {0,0,0,0,0,0,0,0}
        local function tick(n)
            for i = 1,(n or 1) do
                update_game_scene_HUD_overdrive_timer(char,timer)
                update_game_scene_HUD_overdrive_brightness(char)
            end
        end
        local function show(tag)
            return string.format("  overdrive[%-10s] timer=%-8s op=%.2f | brightness=%-8s value=%+.3f",
                tag, timer["state"], timer[4], char["overdrive_brightness_state"], char["brightness"])
        end
        char["overdrive_gauge"][3] = "on"
        tick(1);  log(show("on 第1帧"))
        tick(11); log(show("on 第12帧"))
        tick(22); log(show("on 第34帧"))
        char["overdrive_gauge"][3] = "off"
        tick(1);  log(show("off 第1帧"))
        tick(11); log(show("off 第12帧"))
        tick(24); log(show("off 第36帧"))
    end

    flush()
    love.event.quit()
end

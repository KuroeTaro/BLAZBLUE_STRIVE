-- FD 屏障 shader 实机渲染(FD_bubble 球罩 + block_FD 命中环)
--   H:/_love/_11.5/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/fd_block_probe
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/fd_block_probe"
local W, H = 1600, 900
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
    os.exit(1)
    return function() os.exit(1) end
end
local function readFile(path)
    local f = io.open(path, "rb")
    if not f then return nil end
    local s = f:read("*a"); f:close(); return s
end
local function savePng(data,name)
    local fd = data:encode("png")
    local f = io.open(DIR .. "/shots/" .. name .. ".png", "wb")
    if f then f:write(fd:getString()); f:close() end
end

local shader, cv
local fails = 0
function love.load()
    for _, rel in ipairs({
        "scenes/_scene_config/_game_scenel_config.lua",
        "draw_general_use_functions.lua",
        "scenes/game_scene/_common/draw_functions.lua",
        "scenes/game_scene/_common/_VFX.lua"
    }) do
        local ok, err = pcall(dofile, REPO .. "/" .. rel)
        log(string.format("load %-52s %s %s", rel, ok and "OK" or "FAIL", ok and "" or tostring(err)))
        if not ok then fails = fails + 1 end
    end
    local ok, err = pcall(function()
        shader = love.graphics.newShader(readFile(REPO .. "/shaders/fd_block_3d.glsl"))
    end)
    log("shader compile: " .. (ok and "OK" or ("FAIL " .. tostring(err))))
    if not ok then flush(); love.event.quit(1); return end

    obj_stage_game_scene_camera = {0,-365,-800}
    cv = love.graphics.newCanvas(W, H)
    INPUT_SYS_CURRENT_COMMAND_STATE = {["L"] = {},["R"] = {}}
    common_game_scene_get_VFX_spawn_anchor = function()
        return {["FD_block_spawn_anchor_pos"] = {
            ["stand"] = {-300,-540},["crouch"] = {-300,-420},["air"] = {-300,-440}}}
    end
    pressed = {}
    test_input_sys_press_or_hold = function(v) return pressed[v] == true end

    local function new_char()
        return {["player_side"] = "L",["x"] = 0,["y"] = 0,[3] = 0,[5] = 1,[6] = 1,
            ["height"] = "stand",["state"] = "active_FD_block",
            ["VFX_hit_front_table"] = {},["VFX_hit_back_table"] = {}}
    end
    local function render(obj_VFX,name)
        love.graphics.setCanvas(cv)
        love.graphics.clear(0.02,0.02,0.03,1)
        draw_VFX_game_scene_char_FD_block(shader,obj_VFX,obj_VFX["opacity"])
        -- 参考线:角色脚底(绿)与屏障应有的圆心(红)
        love.graphics.setColor(0.1,0.5,0.1,1)
        love.graphics.line(0,815,W,815)
        love.graphics.setColor(0.8,0.1,0.1,1)
        love.graphics.circle("line",800,575,6)
        love.graphics.line(700,575,900,575)
        love.graphics.line(800,475,800,675)
        love.graphics.setColor(1,1,1,1)
        love.graphics.setCanvas()
        local data = cv:newImageData()
        savePng(data,name)
        return data
    end

    local shots, labels = {}, {}
    -- 1) 常驻球罩:渐入
    pressed = {["correction_left"] = true}
    local stance = new_char()
    local stance_vfx = insert_VFX_game_scene_char_FD_block(stance)
    for i = 1, 15 do
        stance_vfx["update"]()
        if i == 1 or i == 4 or i == 8 or i == 15 then
            shots[#shots + 1] = render(stance_vfx,"stance_" .. i)
            labels[#labels + 1] = "stance f" .. i .. " op=" .. string.format("%.2f", stance_vfx["opacity"])
        end
    end
    -- 2) 挡到攻击:0..34 帧
    local block = new_char()
    block["state"] = "block"
    local block_vfx = insert_VFX_game_scene_char_FD_block(block)
    for i = 1, 35 do
        block_vfx["update"]()
        if (i - 1) % 4 == 0 then
            shots[#shots + 1] = render(block_vfx,"block_" .. (i - 1))
            labels[#labels + 1] = string.format("block f%d r=%.2f a=%.2f op=%.2f",
                i - 1, block_vfx["impact_radius"], block_vfx["impact_alpha"], block_vfx["opacity"])
        end
    end
    -- 3) 挡刀:把已有屏障的帧数清零
    local combo = new_char()
    local combo_vfx = insert_VFX_game_scene_char_FD_block(combo)
    for i = 1, 20 do combo_vfx["update"]() end
    local age_before = combo_vfx["frame_age"] or 0
    local reset_vfx = insert_VFX_game_scene_char_FD_block(combo)
    log(string.format("挡刀重置: 同一对象=%s age %d -> %d, impact_alpha=%.2f",
        tostring(reset_vfx == combo_vfx), age_before, reset_vfx["frame_age"] or 0, reset_vfx["impact_alpha"] or 0))
    -- 4) 离开 active_FD_block / block 状态:直接清除
    stance["state"] = "5_stand_idle"
    stance_vfx["update"]()
    log("离开 FD 后 state = " .. tostring(stance_vfx["state"]) .. "(应为 ease_out)")
    local fade = {}
    for i = 1, FD_BLOCK_VFX_CONFIG.ease_out_frame do
        stance_vfx["update"]()
        fade[#fade + 1] = string.format("%.2f", stance_vfx["opacity"])
    end
    log("淡出序列 = " .. table.concat(fade, " -> ") ..
        "  life = " .. tostring(stance_vfx["life"]))

    -- 4) 原贴图 vs shader 对照:同一帧各画一次
    local function loadPng(path)
        local f = io.open(path,"rb")
        if not f then return nil end
        local bytes = f:read("*a"); f:close()
        local ok, img = pcall(love.graphics.newImage, love.filesystem.newFileData(bytes,"x.png"))
        if ok then return img end
        return nil
    end
    local VFXDIR = REPO .. "/asset/game_scene/common/texture/VFX/hit_VFX/"
    local bubble_img = loadPng(VFXDIR .. "FD_bubble.png")
    local block_img = loadPng(VFXDIR .. "block_FD.png")
    log("原贴图加载: bubble=" .. tostring(bubble_img ~= nil) .. " block=" .. tostring(block_img ~= nil))
    if bubble_img and block_img then
        local qw = block_img:getWidth()/8
        local quads = {}
        for k = 0,7 do
            quads[k] = love.graphics.newQuad(k*qw,0,qw,block_img:getHeight(),block_img:getDimensions())
        end
        local config = FD_BLOCK_VFX_CONFIG
        local frame_time = {0,12,14,17,20,23,27,31} -- 原 block_FD 贴图的 8 帧时间
        local function frameAt(age)
            local idx = 1
            for k = 1,#frame_time do
                if age >= frame_time[k] then idx = k end
            end
            return idx - 1
        end
        local function render_original(age,opacity,name)
            local k = frameAt(age)
            local coords = draw_3d_point_to_2D(obj_stage_game_scene_camera,{(-300),(-540),0,1,1,1,0,0})
            love.graphics.setCanvas(cv)
            love.graphics.clear(0.02,0.02,0.03,1)
            love.graphics.setBlendMode("add")
            love.graphics.setColor(1,1,1,opacity)
            -- 原贴图是按左上角对齐锚点画的(和游戏里 draw_3d_image 一致)
            love.graphics.draw(bubble_img,coords[1],coords[2])
            love.graphics.draw(block_img,quads[k],coords[1],coords[2])
            love.graphics.setBlendMode("alpha")
            love.graphics.setColor(1,1,1,1)
            love.graphics.setCanvas()
            local data = cv:newImageData()
            savePng(data,name)
            return data
        end
        -- 重新跑一遍 block VFX,取出同一帧做对照
        local cmp = {}
        local cmp_labels = {}
        local block_b = new_char(); block_b["state"] = "block"
        local vfx_b = insert_VFX_game_scene_char_FD_block(block_b)
        local wanted = {1,13,21,32}
        for i = 1, 35 do
            vfx_b["update"]()
            for _, age in ipairs(wanted) do
                if i - 1 == age then
                    cmp[#cmp + 1] = render_original(age,vfx_b["opacity"],"cmp_orig_" .. age)
                    cmp_labels[#cmp_labels + 1] = "原贴图 f" .. age
                    cmp[#cmp + 1] = render(vfx_b,"cmp_shader_" .. age)
                    cmp_labels[#cmp_labels + 1] = "shader f" .. age
                end
            end
        end
        local ccols = 4
        local cellW2, cellH2 = W/3, H/3
        local rows2 = math.ceil(#cmp/ccols)
        local mcv2 = love.graphics.newCanvas(math.floor(ccols*cellW2), math.floor(rows2*cellH2))
        love.graphics.setCanvas(mcv2)
        love.graphics.clear(0,0,0,1)
        for i, d in ipairs(cmp) do
            local col, row = (i-1)%ccols, math.floor((i-1)/ccols)
            love.graphics.setColor(1,1,1,1)
            love.graphics.draw(love.graphics.newImage(d), col*cellW2, row*cellH2, 0, 1/3, 1/3)
            love.graphics.print(cmp_labels[i] or "", col*cellW2 + 6, row*cellH2 + 4)
        end
        love.graphics.setCanvas()
        savePng(mcv2:newImageData(),"compare")
        log("对照图帧数 = " .. #cmp)
    end

    local cols = 5
    local cellW, cellH = W/3, H/3
    local rows = math.ceil(#shots/cols)
    local mcv = love.graphics.newCanvas(math.floor(cols*cellW), math.floor(rows*cellH))
    love.graphics.setCanvas(mcv)
    love.graphics.clear(0,0,0,1)
    for i, d in ipairs(shots) do
        local col, row = (i-1)%cols, math.floor((i-1)/cols)
        love.graphics.setColor(1,1,1,1)
        love.graphics.draw(love.graphics.newImage(d), col*cellW, row*cellH, 0, 1/3, 1/3)
        love.graphics.print(labels[i] or "", col*cellW + 6, row*cellH + 4)
    end
    love.graphics.setCanvas()
    savePng(mcv:newImageData(),"contact")

    log("")
    log("frames=" .. #shots)
    log(fails == 0 and "RESULT: OK" or ("RESULT: FAIL (" .. fails .. ")"))
    flush()
    love.event.quit(fails == 0 and 0 or 1)
end

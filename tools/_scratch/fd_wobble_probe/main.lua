-- FD 屏障 bubble_wobble 修复后验证
--   H:/_love/_11.5/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/fd_wobble_probe
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/fd_wobble_probe"
local W, H = 1600, 900
local lines = {}
local function log(s) lines[#lines + 1] = tostring(s) end
local function flush()
    local f = io.open(DIR .. "/result.txt", "w")
    if f then f:write(table.concat(lines, "\n")); f:close() end
end
function love.errorhandler(msg)
    local f = io.open(DIR .. "/result.txt", "w")
    if f then f:write(table.concat(lines, "\n")); f:write("\nERROR: " .. tostring(msg) .. "\n"); f:write(debug.traceback("", 2)); f:close() end
    love.event.quit(1); os.exit(1)
end
local function readFile(path)
    local f = io.open(path, "rb"); if not f then return nil end
    local s = f:read("*a"); f:close(); return s
end
local function savePng(data, name)
    local fd = data:encode("png")
    local f = io.open(DIR .. "/shots/" .. name .. ".png", "wb")
    if f then f:write(fd:getString()); f:close() end
end

local shader, cv
function love.load()
    for _, rel in ipairs({
        "scenes/_scene_config/_game_scenel_config.lua",
        "draw_general_use_functions.lua",
        "scenes/game_scene/_common/draw_functions.lua",
        "scenes/game_scene/_common/_VFX.lua"
    }) do
        local ok, err = pcall(dofile, REPO .. "/" .. rel)
        log(string.format("load %-50s %s %s", rel, ok and "OK" or "FAIL", ok and "" or tostring(err)))
    end
    shader = love.graphics.newShader(readFile(REPO .. "/shaders/fd_block_3d.glsl"))
    cv = love.graphics.newCanvas(W, H)
    obj_stage_game_scene_camera = {0, -365, -800}
    INPUT_SYS_CURRENT_COMMAND_STATE = {["L"] = {}, ["R"] = {}}
    common_game_scene_get_VFX_spawn_anchor = function()
        return {["FD_block_spawn_anchor_pos"] = {
            ["stand"] = {-300, -540}, ["crouch"] = {-300, -420}, ["air"] = {-300, -440}}}
    end
    test_input_sys_press_or_hold = function() return false end

    local config = FD_BLOCK_VFX_CONFIG
    local char = {["player_side"] = "L", ["x"] = 0, ["y"] = 0, [3] = 0, [5] = 1, [6] = 1,
        ["height"] = "stand", ["state"] = "active_FD_block",
        ["VFX_hit_front_table"] = {}, ["VFX_hit_back_table"] = {}}
    local vfx = insert_VFX_game_scene_char_FD_block(char)
    local radius = config.base_radius * (draw_resolution_correction(800) / (vfx[3] - obj_stage_game_scene_camera[3]))
    local coords = draw_3d_point_to_2D(obj_stage_game_scene_camera, vfx)
    local cx, cy = math.floor(coords[1] + 0.5), math.floor(coords[2] + 0.5)

    vfx["opacity"] = 1.0
    vfx["impact_alpha"] = 0.0

    local function render(name)
        love.graphics.setCanvas(cv)
        love.graphics.clear(0, 0, 0, 1)
        draw_VFX_game_scene_char_FD_block(shader, vfx, 1.0)
        love.graphics.setCanvas()
        local d = cv:newImageData()
        if name then savePng(d, name) end
        local edge = -1
        for x = cx, math.min(W - 1, cx + 600) do
            local r, g, b = d:getPixel(x, cy)
            if (r + g + b) / 3 > 2 / 255 then edge = x end
        end
        return d, edge
    end

    -- 走真实路径:只改 frame_age,不再手动塞 age
    local edges, imgs = {}, {}
    for f = 0, 35, 1 do
        vfx["frame_age"] = f
        local d, e = render(nil)
        edges[f] = e
        imgs[f] = d
        if f == 0 or f == 4 or f == 13 then
            local dd = imgs[f]
            savePng(dd, string.format("frame_%02d", f))
        end
    end

    local minE, maxE = edges[0], edges[0]
    for f = 1, 35 do
        if edges[f] < minE then minE = edges[f] end
        if edges[f] > maxE then maxE = edges[f] end
    end
    local seq = {}
    for f = 0, 35, 3 do seq[#seq + 1] = tostring(edges[f]) end
    log("frame_age 0..35 右边缘 x 采样(每 3 帧): " .. table.concat(seq, " "))
    log(string.format("边缘 x 范围 = %d .. %d, 摆幅 = %d px; 理论摆幅 = %.1f px (2*wobble*size*R)",
        minE, maxE, maxE - minE,
        2 * config.bubble_wobble * config.bubble_size * radius))
    log("RESULT: " .. ((maxE - minE) >= 3 and "wobble 已生效" or "wobble 仍然静止"))
    flush()
    love.event.quit(0)
end

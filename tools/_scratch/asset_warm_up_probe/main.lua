-- 验证 load_scene 的 asset_warm_up:贴图 / 序列帧图集 / canvas / shader 各预热一次
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/asset_warm_up_probe"
local lines = {}
local function log(s) lines[#lines + 1] = tostring(s) end
local function flush()
    local f = io.open(DIR .. "/result.txt", "w")
    if f then f:write(table.concat(lines, "\n")); f:close() end
end
function love.errorhandler(msg)
    local f = io.open(DIR .. "/result.txt", "w")
    if f then f:write(table.concat(lines, "\n")); f:write("\nERROR: "..tostring(msg).."\n"); f:close() end
    love.event.quit(1)
    os.exit(1)
    return function() os.exit(1) end
end
local function readFile(path)
    local f = io.open(path, "rb")
    if not f then return nil end
    local s = f:read("*a"); f:close(); return s
end

function love.load()
    local ok_init, err_init = pcall(dofile, REPO .. "/scenes/load_scene/init.lua")
    log("dofile scenes/load_scene/init.lua: " .. (ok_init and "OK" or ("FAIL " .. tostring(err_init))))
    if not ok_init then flush(); love.event.quit(1); return end

    local fails = 0
    -- 注入资产
    image_test_sprite = love.graphics.newImage(love.image.newImageData(4,4))
    local png_bytes = readFile(REPO .. "/asset/game_scene/common/texture/VFX/hit_VFX/FD_bubble.png")
    local texture = love.graphics.newImage(love.filesystem.newFileData(png_bytes,"x.png"))
    image_test_atlas = { ["sprite_batch"] = love.graphics.newSpriteBatch(texture,4) }
    CANVAS_test = love.graphics.newCanvas(16,16)
    shader_game_scene_test_a = love.graphics.newShader(readFile(REPO .. "/shaders/fd_block_3d.glsl"))
    shader_game_scene_test_b = love.graphics.newShader(readFile(REPO .. "/shaders/gaussian_blur.glsl"))
    shader_game_scene_LP = {
        ["drive_sys_chain_fade"] = love.graphics.newShader(
            readFile(REPO .. "/shaders/characters/TRM/drive_sys_chain_fade.glsl")
        )
    }

    local start = love.timer.getTime()
    local texture_count, shader_count = preset_load_scene_asset_warm_up()
    local ms = (love.timer.getTime() - start)*1000
    log(string.format("preset_load_scene_asset_warm_up(): 贴图/图集 %d 个、shader %d 个,耗时 %.2f ms",
        texture_count, shader_count, ms))
    log("暖机后 canvas / shader 已还原: " ..
        tostring(love.graphics.getCanvas() == nil) .. " / " ..
        tostring(love.graphics.getShader() == nil))
    if texture_count < 3 then fails = fails + 1 end
    if shader_count < 3 then fails = fails + 1 end
    if love.graphics.getCanvas() ~= nil or love.graphics.getShader() ~= nil then fails = fails + 1 end

    -- 再跑一次应该更快(缓存命中)
    local again = love.timer.getTime()
    preset_load_scene_asset_warm_up()
    log(string.format("第二次 preset_load_scene_asset_warm_up(): %.2f ms(缓存命中)", (love.timer.getTime() - again)*1000))

    log("")
    log(fails == 0 and "RESULT: OK" or ("RESULT: FAIL (" .. fails .. ")"))
    flush()
    love.event.quit(fails == 0 and 0 or 1)
end

-- 验证 load_scene 的 set_load_scene_asset_warm_up:
--   按命名规律找资产(shader* / image* / *CANVAS),贴图 / 图集 / canvas / shader 各预热一次
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
    local function check(cond,name)
        if cond then log("  ok   " .. name)
        else log("  FAIL " .. name); fails = fails + 1 end
    end

    -- 符合命名规律的资产
    local png = readFile(REPO .. "/asset/game_scene/common/texture/VFX/hit_VFX/FD_bubble.png")
    local texture = love.graphics.newImage(love.filesystem.newFileData(png,"x.png"))
    image_test_sprite = love.graphics.newImage(love.image.newImageData(4,4))
    image_test_atlas = { ["sprite_batch"] = love.graphics.newSpriteBatch(texture,4) }
    image_test_atlas_table = { ["a"] = { ["sprite_batch"] = love.graphics.newSpriteBatch(texture,4) } }
    image_sprite_batch_test = love.graphics.newSpriteBatch(texture,4)
    CANVAS_test = love.graphics.newCanvas(16,16)
    DRAW_TEST_CANVAS = love.graphics.newCanvas(16,16)
    shader_test_a = love.graphics.newShader(readFile(REPO .. "/shaders/fd_block_3d.glsl"))
    shader_game_scene_LP = {
        ["drive_sys_chain_fade"] = love.graphics.newShader(
            readFile(REPO .. "/shaders/characters/TRM/drive_sys_chain_fade.glsl")
        )
    }
    -- 干扰项:名字不符合规律,应该被跳过
    noise_texture = love.graphics.newImage(love.image.newImageData(4,4))
    noise_table = { ["sprite_batch"] = love.graphics.newSpriteBatch(texture,4) }

    local start = love.timer.getTime()
    local texture_count, shader_count = set_load_scene_asset_warm_up()
    local ms = (love.timer.getTime() - start)*1000
    log(string.format("set_load_scene_asset_warm_up(): 贴图/图集/canvas %d 个、shader %d 个,耗时 %.2f ms",
        texture_count, shader_count, ms))
    -- 期望:image_test_sprite / image_test_atlas / image_test_atlas_table /
    --       image_sprite_batch_test / CANVAS_test / DRAW_TEST_CANVAS / 暖机用的 canvas 本身? (不算)
    check(texture_count == 6, "image* + *CANVAS 命中 6 个(实际 " .. texture_count .. ")")
    check(shader_count == 2, "shader* 命中 2 个(实际 " .. shader_count .. ")")
    check(love.graphics.getCanvas() == nil and love.graphics.getShader() == nil,
        "暖机后 canvas / shader 已还原")

    log("")
    log(fails == 0 and "RESULT: OK" or ("RESULT: FAIL (" .. fails .. ")"))
    flush()
    love.event.quit(fails == 0 and 0 or 1)
end

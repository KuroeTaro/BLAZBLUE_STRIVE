-- 加载顺序自检:用仓库里真实的 thread 脚本 + order_load 函数跑一遍
--   (dds/音频用桩替代,只验证「通道号 ↔ ASSET_DATA 下标 ↔ 贴图 key ↔ 顺序表」是否自洽)
--   H:/_love/_11.5/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/load_order_check
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/load_order_check"

local lines = {}
local function log(s) lines[#lines + 1] = tostring(s) end
local function flush()
    local f = io.open(DIR .. "/result.txt", "w")
    if f then f:write(table.concat(lines, "\n")); f:close() end
end

local fail = 0
local function bad(msg) fail = fail + 1; log("  !! " .. tostring(msg)) end

----------------------------------------------------------------------
-- 1) 语法
----------------------------------------------------------------------
local FILES = {
    "scenes/game_scene/_common/load_function.lua",
    "scenes/game_scene/_common/init.lua",
    "scenes/game_scene/_common/draw_functions.lua",
    "scenes/game_scene/_common/_projectile.lua",
    "scenes/game_scene/_common/_projectile.lua",
    "scenes/game_scene/characters/TRM/left.lua",
    "scenes/game_scene/characters/TRM/right.lua",
    "scenes/game_scene/stage/alpha.lua",
    "threads/game_scene/common.lua",
    "threads/game_scene/UI_act.lua",
    "threads/game_scene/UI_HUD.lua",
    "threads/game_scene/UI_lets_dance.lua",
    "threads/game_scene/projectile.lua",
    "threads/game_scene/VFX_HUD.lua",
    "threads/game_scene/VFX_move.lua",
    "threads/game_scene/VFX_overdrive_heat.lua",
    "threads/game_scene/characters/TRM_left_audio.lua",
    "threads/game_scene/characters/TRM_left_texture.lua",
    "threads/game_scene/characters/TRM_right_audio.lua",
    "threads/game_scene/characters/TRM_right_texture.lua",
    "threads/game_scene/stage/alpha_audio.lua",
    "threads/game_scene/stage/alpha.lua"
}

local function syntax_check()
    log("== 1. 语法编译 ==")
    for _, rel in ipairs(FILES) do
        local chunk, err = loadfile(REPO .. "/" .. rel)
        if chunk then
            log(string.format("  OK   %s", rel))
        else
            bad(string.format("语法错误 %s -> %s", rel, tostring(err)))
        end
    end
end

----------------------------------------------------------------------
-- 2) 真实 thread 脚本 -> ASSET_DATA(通道号由脚本自己 push)
----------------------------------------------------------------------
local captured = {}
local pushed_order = {}

local stub_image = {
    newCompressedData = function(p) return { path = p } end,
    newImageData = function(p, w, h) return { path = p } end
}
local stub_sound = { newSoundData = function(p) return { path = p } end }

local real_require = require
_G.require = function(name)
    if name == "love.image" then return stub_image end
    if name == "love.sound" then return stub_sound end
    if name == "love.filesystem" then return {} end
    return real_require(name)
end

local real_getChannel = love.thread and love.thread.getChannel
love.thread = love.thread or {}
love.thread.getChannel = function(name)
    local n = tonumber(tostring(name):match("thread_data_(%d+)"))
    return {
        push = function(self, data)
            captured[n] = data
            pushed_order[#pushed_order + 1] = n
            return true
        end
    }
end

local THREAD_FILES = {
    "threads/game_scene/common.lua",
    "threads/game_scene/UI_act.lua",
    "threads/game_scene/UI_HUD.lua",
    "threads/game_scene/UI_lets_dance.lua",
    "threads/game_scene/projectile.lua",
    "threads/game_scene/VFX_HUD.lua",
    "threads/game_scene/VFX_move.lua",
    "threads/game_scene/VFX_overdrive_heat.lua",
    "threads/game_scene/characters/TRM_left_audio.lua",
    "threads/game_scene/characters/TRM_left_texture.lua",
    "threads/game_scene/characters/TRM_right_audio.lua",
    "threads/game_scene/characters/TRM_right_texture.lua",
    "threads/game_scene/stage/alpha_audio.lua",
    "threads/game_scene/stage/alpha.lua"
}

local function build_asset_data()
    log("== 2. 线程脚本 push 的通道号 ==")
    for i, rel in ipairs(THREAD_FILES) do
        local chunk, err = loadfile(REPO .. "/" .. rel)
        if not chunk then bad("loadfile " .. rel .. " -> " .. tostring(err)) else
            local ok, e = pcall(chunk)
            if not ok then bad("执行 " .. rel .. " -> " .. tostring(e)) end
        end
        if captured[i] == nil then
            bad(string.format("%s 没有 push 到 thread_data_%d", rel, i))
        else
            local count = 0
            for _ in pairs(captured[i]) do count = count + 1 end
            log(string.format("  [%2d] %-50s channel=%s  keys=%d", i, rel, tostring(pushed_order[i]), count))
        end
    end
    log("  push 顺序: " .. table.concat(pushed_order, ","))
end

----------------------------------------------------------------------
-- 3) 用桩跑真实的 order_load 函数
----------------------------------------------------------------------
local json_checked = 0
local function stub_sprite_sheet_load(json_path, image)
    assert(image ~= nil, "image 为 nil (ASSET_DATA key 不匹配)")
    assert(type(json_path) == "string", "json 路径不是字符串")
    local f = io.open(REPO .. "/" .. json_path, "rb")
    assert(f, "找不到 json: " .. json_path)
    f:close()
    json_checked = json_checked + 1
    return { sheet = json_path }
end

local called_globals = {}

local function install_stubs()
    love.graphics = love.graphics or {}
    local real_newImage = love.graphics.newImage
    love.graphics.newImage = function(a, b, c)
        assert(a ~= nil, "love.graphics.newImage(nil) -> ASSET_DATA[?][\"key\"] 不存在")
        return { image = a }
    end
    love.graphics.newImageData = function(a, b, c) return stub_image.newImageData(a, b, c) end
    -- 贴图类构造器全部桩掉(它们只接受真正的 Texture,和本次改动无关)
    love.graphics.newSpriteBatch = function()
        return {
            clear = function() end, set = function() end, add = function() end,
            setColor = function() end, draw = function() end
        }
    end
    love.graphics.newCanvas = function() return {} end
    love.graphics.newMesh = function() return {} end
    love.graphics.newQuad = function() return {} end
    love.graphics.newShader = function() return {} end
    love.graphics.newFont = function() return {} end
    love.audio = love.audio or {}
    love.audio.newSource = function(a, b) assert(a ~= nil, "newSource(nil)"); return { source = true } end

    _G.common_sprite_sheet_load = stub_sprite_sheet_load
    _G.requested_shaders = {}
    _G.load_game_scene_common_shader = function(i)
        _G.requested_shaders[#_G.requested_shaders + 1] = i
    end
    _G.update_SFX_VOLUME = function() end
    _G.update_BGM_VOLUME = function() end
    -- 其余未定义全局:返回 no-op 函数(只影响初始化类调用,不影响贴图 key 检查)
    setmetatable(_G, {
        __index = function(t, k)
            if type(k) == "string" and not k:match("^_") then
                called_globals[k] = (called_globals[k] or 0) + 1
                return function() return nil end
            end
            return nil
        end
    })
end

local function run_orders()
    log("== 3. 顺序执行 order_load_game_scene_* ==")
    local total = 0
    for i, name in ipairs(ORDER_LOAD_TABLE) do
        local size = ORDER_SIZE_TABLE[i]
        local label = ORDER_NAMES[i] or ("order#" .. i)
        for order = 1, size do
            local ok, err = pcall(ORDER_LOAD_TABLE[i], order)
            total = total + 1
            if not ok then
                bad(string.format("%s(%d) -> %s", label, order, tostring(err)))
            end
        end
        log(string.format("  [%2d] %-32s size=%d done", i, ORDER_NAMES[i] or "?", size))
    end
    log(string.format("  共执行 %d 个 load step,校验 json %d 个", total, json_checked))
end

local function read_text(path)
    local f = io.open(path, "rb")
    if not f then return nil end
    local s = f:read("*a"); f:close(); return s
end

local function derive_tables_from_load_function()
    log("== 2.5 从 load_game_scene_prep 解析顺序表 ==")
    local src = read_text(REPO .. "/scenes/game_scene/_common/load_function.lua")
    assert(src, "读不到 load_function.lua")
    local block = src:match("ORDER_LOAD_TABLE = %{(.-)%}")
    assert(block, "找不到 ORDER_LOAD_TABLE")
    ORDER_LOAD_TABLE = {}
    ORDER_NAMES = {}
    for n in block:gmatch("(order_load_game_scene_[%w_]+)") do
        ORDER_LOAD_TABLE[#ORDER_LOAD_TABLE + 1] = _G[n]
        ORDER_NAMES[#ORDER_NAMES + 1] = n
    end
    local size_block = src:match("ORDER_SIZE_TABLE = %{([^%}]*)}")
    ORDER_SIZE_TABLE = {}
    for n in size_block:gmatch("(%d+)") do
        ORDER_SIZE_TABLE[#ORDER_SIZE_TABLE + 1] = tonumber(n)
    end
    local thread_amount = tonumber(src:match("THREAD_AMOUNT = (%d+)"))
    local loading_amount = tonumber(src:match("LOADING_FUNCTION_AMOUNT = (%d+)"))
    log(string.format("  ORDER_LOAD_TABLE=%d  ORDER_SIZE_TABLE=%d  THREAD_AMOUNT=%s  LOADING_FUNCTION_AMOUNT=%s",
        #ORDER_LOAD_TABLE, #ORDER_SIZE_TABLE, tostring(thread_amount), tostring(loading_amount)))
    if #ORDER_LOAD_TABLE ~= #ORDER_SIZE_TABLE then bad("ORDER_LOAD_TABLE 与 ORDER_SIZE_TABLE 长度不一致") end
    if #ORDER_LOAD_TABLE ~= #THREAD_FILES then
        bad(string.format("ORDER_LOAD_TABLE(%d) 与线程表(%d) 长度不一致", #ORDER_LOAD_TABLE, #THREAD_FILES))
    end
    if thread_amount ~= #THREAD_FILES then bad("THREAD_AMOUNT 与线程表长度不一致") end
    if loading_amount ~= #THREAD_FILES then bad("LOADING_FUNCTION_AMOUNT 与线程表长度不一致") end
    for i, f in ipairs(ORDER_LOAD_TABLE) do
        if type(f) ~= "function" then bad("ORDER_LOAD_TABLE[" .. i .. "] 不是函数(未定义?): " .. tostring(ORDER_NAMES[i])) end
        log(string.format("  [%2d] %-46s size=%s", i, ORDER_NAMES[i], tostring(ORDER_SIZE_TABLE[i])))
    end
end

function love.load()
    syntax_check()
    install_stubs()
    -- 依赖:thread_load 与 load_function 只定义函数,不执行
    assert(loadfile(REPO .. "/update_general_use_functions/thread_load.lua"))()
    assert(loadfile(REPO .. "/scenes/game_scene/_common/load_function.lua"))()
    assert(loadfile(REPO .. "/scenes/game_scene/characters/TRM/left.lua"))()
    assert(loadfile(REPO .. "/scenes/game_scene/characters/TRM/right.lua"))()
    assert(loadfile(REPO .. "/scenes/game_scene/stage/alpha.lua"))()

    build_asset_data()
    ASSET_DATA = captured
    -- 直接读真实的 load_game_scene_prep 里的两张表,避免自检表漂移
    derive_tables_from_load_function()
    run_orders()

    log("== 3.5 shader 加载顺序 ==")
    local shader_set = {}
    for _, i in ipairs(_G.requested_shaders) do shader_set[i] = true end
    local missing = {}
    for i = 1,9 do if not shader_set[i] then missing[#missing + 1] = i end end
    log("  请求的 shader: " .. table.concat(_G.requested_shaders, ","))
    if #missing > 0 then bad("有 shader 没被排进加载顺序: " .. table.concat(missing, ",")) end

    log("== 4. 关键变量 ==")
    log("  image_sprite_sheet_projectile_game_scene_RC_shockwave = " ..
        tostring(image_sprite_sheet_projectile_game_scene_RC_shockwave ~= nil))
    if image_sprite_sheet_projectile_game_scene_RC_shockwave == nil then bad("新变量没有被赋值") end
    if rawget(_G, "image_sprite_sheet_VFX_game_scene_RC_shockwave") ~= nil then bad("旧变量名仍然被赋值") end

    local gk = {}
    for k, v in pairs(called_globals) do gk[#gk + 1] = k end
    table.sort(gk)
    log("  未定义全局(已 no-op): " .. table.concat(gk, ","))

    log("")
    log(fail == 0 and "RESULT: OK" or ("RESULT: FAIL (" .. fail .. " 处)"))
    flush()
    love.event.quit(fail == 0 and 0 or 1)
end

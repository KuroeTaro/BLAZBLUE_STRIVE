-- 5UA 美术资产管线自检:thread 裸 key / texture/attack 路径 / [30] 组 / char 表
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/trm_5ua_probe"
local lines = {}
local function log(s) lines[#lines + 1] = tostring(s) end
local fail = 0
local function bad(msg) fail = fail + 1; log("  !! " .. tostring(msg)) end

local NAMES = {
    "5UA_startup",
    "5UA_50_heat_follow",
    "5UA_100_heat_follow_0",
    "5UA_100_heat_follow_1",
    "5UA_100_heat_follow_2",
    "5UA_100_heat_follow_3",
    "5UA_100_heat_follow_4"
}

-- 1) thread 脚本 -> ASSET_DATA
local captured = {}
local real_require = require
_G.require = function(name)
    if name == "love.image" then
        return {
            newCompressedData = function(p) return { path = p } end,
            newImageData = function(p, w, h) return { path = p } end
        }
    end
    if name == "love.sound" then return { newSoundData = function(p) return { path = p } end } end
    if name == "love.filesystem" then return {} end
    return real_require(name)
end
love.thread = love.thread or {}
love.thread.getChannel = function(name)
    local n = tonumber(tostring(name):match("thread_data_(%d+)"))
    return { push = function(self, data) captured[n] = data; return true end }
end
for _, file in ipairs({ "TRM_left_texture.lua", "TRM_right_texture.lua" }) do
    assert(loadfile(REPO .. "/threads/game_scene/characters/" .. file))()
end
for _, side in ipairs({ { "L", 10 }, { "R", 12 } }) do
    local data = captured[side[2]]
    if data == nil then bad(side[1] .. " texture thread 没有 push") end
    local hit = 0
    for _, n in ipairs(NAMES) do
        local v = data[n]
        if v == nil then
            bad(side[1] .. " 缺 thread key " .. n)
        else
            hit = hit + 1
            if not v.path:find("/texture/attack/", 1, true) then
                bad(n .. " 路径不在 texture/attack: " .. v.path)
            end
            local f = io.open(REPO .. "/" .. v.path, "rb")
            if not f then bad("缺贴图 " .. v.path) else f:close() end
        end
        if data[n .. "_UA"] ~= nil then bad("还有 _UA 后缀的 key: " .. n .. "_UA") end
    end
    log(string.format("  %s thread keys: %d/%d 命中(裸名)", side[1], hit, #NAMES))
end

-- 2) 两侧 order_load 跑满,查 char 表
love.graphics = love.graphics or {}
love.graphics.newImage = function(a, b, c)
    assert(a ~= nil, "love.graphics.newImage(nil) -> ASSET_DATA key 不存在")
    return { image = a }
end
local json_count = 0
_G.common_sprite_sheet_load = function(json_path, image)
    assert(image ~= nil, "image 为 nil: " .. tostring(json_path))
    local f = io.open(REPO .. "/" .. json_path, "rb")
    assert(f, "找不到 json: " .. json_path)
    f:close()
    json_count = json_count + 1
    return { sheet = json_path }
end
ASSET_DATA = { [10] = captured[10], [12] = captured[12] }
assert(loadfile(REPO .. "/scenes/game_scene/characters/TRM/left.lua"))()
assert(loadfile(REPO .. "/scenes/game_scene/characters/TRM/right.lua"))()

for _, side in ipairs({ { "LP", 39 }, { "RP", 39 } }) do
    local fn = _G["order_load_game_scene_char_" .. side[1] .. "_frames"]
    for order = 1, side[2] do
        local ok, err = pcall(fn, order)
        if not ok then bad(string.format("%s frames order %d -> %s", side[1], order, tostring(err))) end
    end
    local char_tbl = _G["image_sprite_sheet_table_char_game_scene_" .. side[1]]
    local UA_tbl = _G["image_sprite_sheet_table_UA_game_scene_" .. side[1]]
    local hit = 0
    for _, n in ipairs(NAMES) do
        local sheet = char_tbl[n]
        if sheet == nil then
            bad(side[1] .. " char 表缺 " .. n)
        else
            hit = hit + 1
            if not sheet.sheet:find("/texture/attack/", 1, true) then
                bad(n .. " 加载的 json 不在 texture/attack: " .. sheet.sheet)
            end
        end
        if char_tbl[n .. "_UA"] ~= nil then bad(side[1] .. " char 表还有 " .. n .. "_UA") end
    end
    if UA_tbl ~= nil then bad(side[1] .. " image_sprite_sheet_table_UA_game_scene 还存在，应已彻底清掉") end
    log(string.format("  %s frames 1..%d 执行完, json=%d, char 表 5UA=%d/%d", side[1], side[2], json_count, hit, #NAMES))
end

-- 3) _anim.lua 里的 sprite_sheet 必须是不带后缀的裸名, 且在 char 表里
local f = assert(io.open(REPO .. "/scenes/game_scene/characters/TRM/_anim.lua", "rb"))
local anim_text = f:read("*a"); f:close()
local used = {}
for name in anim_text:gmatch('%["sprite_sheet"%] = "([^"]+)"') do
    if name:match("^5UA_") then used[name] = true end
end
local used_n = 0
for name in pairs(used) do
    used_n = used_n + 1
    if name:match("_UA$") then bad("anim 的 sprite_sheet 还带 _UA 后缀: " .. name) end
    for _, side in ipairs({ "LP", "RP" }) do
        local char_tbl = _G["image_sprite_sheet_table_char_game_scene_" .. side]
        if char_tbl[name] == nil then bad(side .. " char 表缺 anim 引用的 " .. name) end
    end
    log("  anim 引用 " .. name .. " -> char 表已加载")
end
if used_n == 0 then bad("_anim.lua 里没找到 5UA 的 sprite_sheet 引用") end

log("")
log(fail == 0 and "RESULT: OK" or ("RESULT: FAIL (" .. fail .. " 处)"))
local out = assert(io.open(DIR .. "/result.txt", "w"))
out:write(table.concat(lines, "\n")); out:close()
love.event.quit(fail == 0 and 0 or 1)

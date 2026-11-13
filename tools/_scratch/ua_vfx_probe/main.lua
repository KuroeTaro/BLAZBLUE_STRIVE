-- UA_VFX 贴图管线自检:thread 推的 key ↔ load_function 取的 key ↔ json 帧
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/ua_vfx_probe"
local lines = {}
local function log(s) lines[#lines + 1] = tostring(s) end
local fail = 0
local function bad(msg) fail = fail + 1; log("  !! " .. tostring(msg)) end

-- 1) 用桩跑 thread 脚本,拿到 channel 8 的 key 集合
local captured = {}
local real_require = require
_G.require = function(name)
    if name == "love.image" then
        return {
            newCompressedData = function(p) return { path = p } end,
            newImageData = function(p, w, h) return { path = p, w = w, h = h } end
        }
    end
    return real_require(name)
end
love.thread = love.thread or {}
love.thread.getChannel = function(name)
    local n = tonumber(tostring(name):match("thread_data_(%d+)"))
    return { push = function(self, data) captured[n] = data; return true end }
end
assert(loadfile(REPO .. "/threads/game_scene/VFX_burst_overdrive_RC_UA.lua"))()

local asset = captured[8]
if asset == nil then bad("VFX_burst_overdrive_RC_UA.lua 没有 push 到 thread_data_8") end
local ua_keys = {}
for k, v in pairs(asset) do
    if k:match("^UA_") then
        ua_keys[#ua_keys + 1] = k
        log(string.format("  thread key %-22s -> %s", k, v.path))
    end
end
table.sort(ua_keys)
if table.concat(ua_keys, ",") ~= "UA_back_sprite_batch,UA_front_sprite_batch" then
    bad("UA key 不对: " .. table.concat(ua_keys, ","))
end
for _, k in ipairs(ua_keys) do
    if not asset[k].path:match("%.dds$") then bad(k .. " 不是 dds") end
end

-- 2) 用桩跑 order_load_game_scene_VFX_burst_overdrive_RC_UA
love.graphics = love.graphics or {}
love.graphics.newImage = function(a, b, c)
    assert(a ~= nil, "love.graphics.newImage(nil) -> ASSET_DATA[8] 少了 key")
    return { image = a }
end
love.graphics.newSpriteBatch = function() return { clear = function() end, add = function() end, draw = function() end } end
love.graphics.newMesh = function() return {} end
_G.common_particle_mesh_new = function(n) return { n = n } end
_G.OVERDRIVE_BADGE_PARTICAL_CONFIG = { particle_count = 8 }
local json_seen = {}
_G.common_sprite_sheet_load = function(json_path, image)
    assert(image ~= nil, "image 为 nil (ASSET_DATA key 不匹配): " .. tostring(json_path))
    local f = io.open(REPO .. "/" .. json_path, "rb")
    assert(f, "找不到 json: " .. json_path)
    f:close()
    json_seen[#json_seen + 1] = json_path
    return { sheet = json_path }
end
ASSET_DATA = { [8] = asset }
assert(loadfile(REPO .. "/scenes/game_scene/_common/load_function.lua"))()
order_load_game_scene_VFX_burst_overdrive_RC_UA(1)
order_load_game_scene_VFX_burst_overdrive_RC_UA(2)
order_load_game_scene_VFX_burst_overdrive_RC_UA(3)
log("  order 3 加载的 json: " .. table.concat(json_seen, " "))
for _, name in ipairs({ "image_sprite_sheet_VFX_game_scene_UA_back", "image_sprite_sheet_VFX_game_scene_UA_front" }) do
    local v = rawget(_G, name)
    log(string.format("  %-52s = %s", name, v and v.sheet or "nil"))
    if v == nil then bad(name .. " 没有被赋值") end
end
if rawget(_G, "image_sprite_sheet_VFX_game_scene_UA_common") ~= nil then bad("旧变量 UA_common 仍然被赋值") end

-- 3) json 帧(key 是 "0.png",走 loader 的兜底归一)
local json = real_require("dkjson")
package.path = REPO .. "/?.lua;" .. package.path
json = dofile(REPO .. "/dkjson.lua")
for _, sheet in ipairs({ "UA_back", "UA_front" }) do
    local f = assert(io.open(REPO .. "/asset/game_scene/common/texture/VFX/" .. sheet .. ".json", "rb"))
    local text = f:read("*a"); f:close()
    local data = json.decode(text)
    local frames = {}
    for name, frame in pairs(data.frames) do
        local frame_key = tonumber(name) or tonumber(tostring(name):match("^(%d+)%.[%a]+$"))
        frames[frame_key or name] = frame
    end
    local count, missing = 0, {}
    for i = 0, 19 do
        if frames[i] == nil then missing[#missing + 1] = i else count = count + 1 end
    end
    log(string.format("  %s.json 帧=%d 归一后 0..19 miss=%s meta.image=%s size=%dx%d", sheet, count, table.concat(missing, ","), tostring(data.meta.image), data.meta.size.w, data.meta.size.h))
    if #missing > 0 then bad(sheet .. ".json 归一后缺帧 " .. table.concat(missing, ",")) end
end

log("")
log(fail == 0 and "RESULT: OK" or ("RESULT: FAIL (" .. fail .. " 处)"))
local out = assert(io.open(DIR .. "/result.txt", "w"))
out:write(table.concat(lines, "\n")); out:close()
love.event.quit(fail == 0 and 0 or 1)

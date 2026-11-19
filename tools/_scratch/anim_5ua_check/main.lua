-- 5UA_startup 动画表校验:语法 + res 键 + 逐帧 obj[8] 走查
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/anim_5ua_check"
local lines = {}
local fail = 0
local function log(s) lines[#lines + 1] = tostring(s) end
local function bad(s) fail = fail + 1; log("  !! " .. tostring(s)) end

-- 未定义的全局一律 no-op(可链式调用),只为让动画构造过程跑完
setmetatable(_G, {
    __index = function(t, k)
        if type(k) == "string" and not k:match("^_") then
            return function() return function() end end
        end
    end
})

local chunk, err = loadfile(REPO .. "/scenes/game_scene/characters/TRM/_anim.lua")
if not chunk then
    bad("_anim.lua 语法错误: " .. tostring(err))
else
    log("  _anim.lua loadfile OK")
    chunk()
    local obj = { player_side = "L" }
    local res = load_game_scene_anim_char_TRM_5UA_startup(obj, {}, nil, nil)
    if type(res) ~= "table" then
        bad("动画函数没有返回 table")
    else
        local keys = {}
        for k in pairs(res) do
            if type(k) == "number" then keys[#keys + 1] = k end
        end
        table.sort(keys)
        log("  res 数值键 " .. #keys .. " 个: " .. table.concat(keys, ","))
        if #keys ~= 32 then bad("期望 32 个数值键(含 res[0]/res[152]),实际 " .. #keys) end

        local expect = {
            {3,1},{6,2},{17,3},{24,4},{30,1},{35,3},{40,5},{44,6},{49,7},{58,8},
            {63,9},{67,10},{71,11},{75,9},{79,10},{83,11},{87,9},{91,10},{95,11},
            {99,9},{103,10},{107,11},{111,9},{115,10},{119,11},{123,12},{129,13},
            {137,14},{145,15},{151,15}
        }
        local covered, missing = {}, {}
        for _, pair in ipairs(expect) do
            local frame, sprite = pair[1], pair[2]
            if res[frame] == nil then
                bad("缺 res[" .. frame .. "]")
            else
                obj[8] = -1
                res[frame]()
                if obj[8] ~= sprite then
                    bad(string.format("res[%d] -> %d,期望 %d", frame, obj[8], sprite))
                end
                covered[obj[8]] = true
            end
        end
        -- 模拟 animator:逐帧触发,统计实际用到的序列图帧
        local used = {}
        for f = 0, res["anim_length"] do
            if res[f] then
                res[f]()
                used[obj[8]] = true
            end
        end
        local used_n, miss = 0, {}
        for i = 0, 15 do
            if used[i] then used_n = used_n + 1 else miss[#miss + 1] = i end
        end
        log("  逐帧走查: 用到序列图帧 " .. used_n .. "/16, 未用到: " .. (table.concat(miss, ",") == "" and "无" or table.concat(miss, ",")))
        if used_n ~= 16 then bad("有序列图帧没被用到,检查 keyframe 表") end
    end
end

log("")
log(fail == 0 and "RESULT: OK" or ("RESULT: FAIL (" .. fail .. " 处)"))
local out = assert(io.open(DIR .. "/result.txt", "w"))
out:write(table.concat(lines, "\n")); out:close()
love.event.quit(fail == 0 and 0 or 1)

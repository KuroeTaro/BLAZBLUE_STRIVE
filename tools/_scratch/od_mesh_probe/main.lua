-- 验证通用粒子 mesh 工厂 common_particle_mesh_new:数量换算、usage 参数、下限保护、创建开销
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/od_mesh_probe"
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

function love.load()
    local fails = 0
    local function check(cond,name)
        if cond then log("  ok   " .. name) else log("  FAIL " .. name); fails = fails + 1 end
    end
    for _, rel in ipairs({
        "scenes/_scene_config/_game_scenel_config.lua",
        "update_general_use_functions/common.lua"
    }) do
        local ok, err = pcall(dofile, REPO .. "/" .. rel)
        log(string.format("load %-52s %s %s", rel, ok and "OK" or "FAIL", ok and "" or tostring(err)))
        if not ok then fails = fails + 1 end
    end
    local count = OVERDRIVE_BADGE_PARTICAL_CONFIG.particle_count
    log("particle_count = " .. tostring(count))

    local t1 = love.timer.getTime()
    local mesh = common_particle_mesh_new(count)
    log(string.format("建 %d 颗粒子耗时 %.3f ms", count, (love.timer.getTime() - t1)*1000))
    check(mesh ~= nil and type(mesh) == "userdata", "mesh 创建成功")
    check(mesh:getVertexCount() == count*6,
        "顶点数 = particle_count*6(" .. tostring(mesh:getVertexCount()) .. ")")
    check(common_particle_mesh_new(count) ~= mesh, "每次调用返回新 mesh(缓存交给调用方)")
    check(common_particle_mesh_new(3):getVertexCount() == 18, "3 颗粒子 -> 18 顶点")
    check(common_particle_mesh_new(2,"dynamic"):getVertexCount() == 12, "usage=dynamic 可用")
    check(common_particle_mesh_new(0):getVertexCount() == 6, "particle_count<1 被夹到 1 颗")
    local ok_bad = pcall(common_particle_mesh_new,"x")
    check(not ok_bad, "非数字 particle_count 报错")

    local t2 = love.timer.getTime()
    for i = 1,10 do common_particle_mesh_new(count) end
    log(string.format("连续建 10 次耗时 %.3f ms", (love.timer.getTime() - t2)*1000))

    log("")
    log(fails == 0 and "RESULT: OK" or ("RESULT: FAIL (" .. fails .. ")"))
    flush()
    love.event.quit(fails == 0 and 0 or 1)
end

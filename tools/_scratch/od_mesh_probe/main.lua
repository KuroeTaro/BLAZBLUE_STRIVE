-- 验证 overdrive badge 粒子 mesh 只创建一次(之前是函数内 local 缓存 -> 每帧重建)
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
        "draw_general_use_functions.lua",
        "scenes/game_scene/_common/draw_functions.lua"
    }) do
        local ok, err = pcall(dofile, REPO .. "/" .. rel)
        log(string.format("load %-52s %s %s", rel, ok and "OK" or "FAIL", ok and "" or tostring(err)))
        if not ok then fails = fails + 1 end
    end
    local config = OVERDRIVE_BADGE_PARTICAL_CONFIG
    log("particle_count = " .. tostring(config.particle_count))

    local t1 = love.timer.getTime()
    local mesh1 = common_game_scene_get_overdrive_badge_particle_mesh()
    local ms1 = (love.timer.getTime() - t1)*1000
    local t2 = love.timer.getTime()
    local mesh2 = common_game_scene_get_overdrive_badge_particle_mesh()
    local ms2 = (love.timer.getTime() - t2)*1000
    log(string.format("第一次 %.3f ms / 第二次 %.4f ms", ms1, ms2))
    check(mesh1 ~= nil and type(mesh1) == "userdata", "mesh 创建成功")
    check(mesh1 == mesh2, "第二次返回同一个 mesh(缓存生效)")
    check(mesh2:getVertexCount() == config.particle_count*6,
        "顶点数 = particle_count*6(" .. tostring(mesh2:getVertexCount()) .. ")")

    local before = mesh2
    local stable = true
    local t3 = love.timer.getTime()
    for i = 1,60 do
        if common_game_scene_get_overdrive_badge_particle_mesh() ~= before then stable = false end
    end
    log(string.format("60 次调用耗时 %.3f ms", (love.timer.getTime() - t3)*1000))
    check(stable, "60 帧里没有重建 mesh")

    log("")
    log(fails == 0 and "RESULT: OK" or ("RESULT: FAIL (" .. fails .. ")"))
    flush()
    love.event.quit(fails == 0 and 0 or 1)
end

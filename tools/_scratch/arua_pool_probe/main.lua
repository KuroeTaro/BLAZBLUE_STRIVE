-- VFX 资源池验证(6SP_P_arua 粒子数据贴图池 / 5UA_100_heat_follow_arua shader 池)
--   H:/_love/_12.0/lovec.exe H:/_love/BLAZBLUE_STRIVE/tools/_scratch/arua_pool_probe
-- 1) 池逻辑(纯 Lua):领取 / 寿命耗尽释放 / 表被换掉释放 / 用完抢最旧
-- 2) 加载:两侧池大小 = config 里声明的数,每个槽位的资源各不相同
-- 3) 同一帧画两个光环(和游戏一样直接画到屏幕),和两帧里分开画的结果比较:
--      6SP_P:add 混合画在黑底上 → 同一帧 = A + B;共用贴图(旧做法)/ 独占贴图(新做法)各测一次
--      5UA :黑色 alpha 混合画在白底上 → 同一帧 = A * B
-- 4) 同一个 shader 同一帧里多次 send uniform 再画,是否按顺序(决定 5UA 是否真的需要 shader 池)
local REPO = "H:/_love/BLAZBLUE_STRIVE"
local DIR = REPO .. "/tools/_scratch/arua_pool_probe"
local W,H = 1600,900
local lines = {}
local function log(s) lines[#lines + 1] = tostring(s) end
local function flush()
    local f = io.open(DIR .. "/result.txt","w")
    if f then f:write(table.concat(lines,"\n")); f:close() end
end
function love.errorhandler(msg)
    local f = io.open(DIR .. "/result.txt","w")
    if f then
        f:write(table.concat(lines,"\n"))
        f:write("\nERROR: " .. tostring(msg) .. "\n")
        f:write(debug.traceback("",2))
        f:close()
    end
    os.exit(1)
end
local function read_file(path)
    local f = io.open(path,"rb")
    if not f then return nil end
    local s = f:read("*a"); f:close(); return s
end
local real_newShader = love.graphics.newShader
love.graphics.newShader = function(a,...)
    if type(a) == "string" and a:match("%.glsl$") then
        local src = read_file(REPO .. "/" .. a)
        assert(src,"cannot read " .. a)
        return real_newShader(src,...)
    end
    return real_newShader(a,...)
end
-- 池打印进日志
local real_print = print
print = function(...)
    local t = {}
    for i = 1,select("#",...) do t[#t + 1] = tostring(select(i,...)) end
    log("    print: " .. table.concat(t," "))
    real_print(...)
end
local fails = 0
local function check(ok,msg)
    if ok then log("  ok   " .. msg) else fails = fails + 1; log("  FAIL " .. msg) end
end

-- ---------------- 1) 池逻辑 ----------------
local function test_pool_logic()
    log("== pool logic ==")
    local pool = character_function_game_scene_TRM_VFX_pool_new("test")
    pool["slots"] = {{["id"] = 1},{["id"] = 2}}
    local char = {["T"] = {}}
    local function new_vfx(name) return {["name"] = name,["life"] = 10} end
    local A,B,C,D,E = new_vfx("A"),new_vfx("B"),new_vfx("C"),new_vfx("D"),new_vfx("E")
    local sA = character_function_game_scene_TRM_VFX_pool_acquire(pool,A,char,"T"); table.insert(char["T"],A)
    local sB = character_function_game_scene_TRM_VFX_pool_acquire(pool,B,char,"T"); table.insert(char["T"],B)
    check(sA ~= sB,"A / B get different slots")
    check(pool["peak"] == 2,"peak = 2")
    local sC = character_function_game_scene_TRM_VFX_pool_acquire(pool,C,char,"T"); table.insert(char["T"],C)
    check(sC == sA and A["life"] == 0 and sA["owner"] == C,"full -> C steals the oldest (A), A.life = 0")
    table.remove(char["T"],1)  -- A 被 update 循环移除
    B["life"] = 0
    local sD = character_function_game_scene_TRM_VFX_pool_acquire(pool,D,char,"T"); table.insert(char["T"],D)
    check(sD == sB and C["life"] == 10,"B dead -> D reuses B's slot, C untouched")
    char["T"] = {}  -- 回合重置:表整个换掉
    local sE = character_function_game_scene_TRM_VFX_pool_acquire(pool,E,char,"T")
    check(sE ~= nil and C["life"] == 10 and D["life"] == 10,"table replaced -> slots free again, nobody stolen")
end

-- ---------------- 屏幕比较 ----------------
local function compare(sab,sa,sb,mode)
    local n,maxd = 0,0
    for y = 0,H - 1,2 do
        for x = 0,W - 1,2 do
            local r1,g1,b1 = sab:getPixel(x,y)
            local r2,g2,b2 = sa:getPixel(x,y)
            local r3,g3,b3 = sb:getPixel(x,y)
            local er,eg,eb
            if mode == "add" then
                er,eg,eb = math.min(1,r2 + r3),math.min(1,g2 + g3),math.min(1,b2 + b3)
            else
                er,eg,eb = r2*r3,g2*g3,b2*b3
            end
            local d = math.max(math.abs(r1 - er),math.abs(g1 - eg),math.abs(b1 - eb))
            if d > 4/255 then n = n + 1 end
            if d > maxd then maxd = d end
        end
    end
    return n,maxd
end
local function save_png(data,name)
    local fd = data:encode("png")
    local f = io.open(DIR .. "/shots/" .. name .. ".png","wb")
    if f then f:write(fd:getString()); f:close() end
end

local hit_LP,hurt_A,hurt_B,vA,vB
local char5,v5A,v5B
local pooled_image_A,pooled_image_B
local frame = 0
local shots = {}
local uniform_shader,quad
local steps

function love.load()
    log("love version: " .. table.concat({love.getVersion()},"."))
    log("renderer: " .. table.concat({love.graphics.getRendererInfo()}," | "))
    for _,rel in ipairs({
        "draw_general_use_functions.lua",
        "scenes/game_scene/_common/common_functions.lua",
        "scenes/game_scene/characters/TRM/left.lua",
        "scenes/game_scene/characters/TRM/right.lua",
        "scenes/game_scene/characters/TRM/_character_function.lua",
        "scenes/game_scene/characters/TRM/_VFX.lua"
    }) do
        local ok,err = pcall(dofile,REPO .. "/" .. rel)
        log(string.format("load %-58s %s %s",rel,ok and "OK" or "FAIL",ok and "" or tostring(err)))
        if not ok then fails = fails + 1 end
    end
    test_pool_logic()

    -- ---------------- 2) 加载 ----------------
    log("== load ==")
    load_game_scene_config_char_LP()
    load_game_scene_config_char_RP()
    for _,S in ipairs({"LP","RP"}) do
        for i = 1,5 do
            local ok,err = pcall(_G["order_load_game_scene_char_" .. S .. "_shader"],i)
            if not ok then fails = fails + 1; log("  FAIL order_load " .. S .. " [" .. i .. "] " .. tostring(err)) end
        end
        local cfg = _G["config_game_scene_" .. S]
        local sh = _G["shader_game_scene_" .. S]
        local p6 = cfg["6SP_P_arua_particle_image_pool"]["slots"]
        local p5 = sh["5UA_100_heat_follow_arua_pool"]["slots"]
        check(#p6 == cfg["6SP_P_arua_particle_image_pool_size"],
            S .. " 6SP_P image pool " .. #p6 .. " = size " .. cfg["6SP_P_arua_particle_image_pool_size"])
        check(#p5 == cfg["5UA_100_heat_follow_arua_shader_pool_size"],
            S .. " 5UA shader pool " .. #p5 .. " = size " .. cfg["5UA_100_heat_follow_arua_shader_pool_size"])
        local distinct = true
        for i = 1,#p6 do for j = i + 1,#p6 do if p6[i]["image"] == p6[j]["image"] then distinct = false end end end
        for i = 1,#p5 do for j = i + 1,#p5 do if p5[i]["shader"] == p5[j]["shader"] then distinct = false end end end
        check(distinct,S .. " every slot has its own image / shader")
        local missing = {}
        for i = 1,#p5 do
            for name in pairs(cfg["5UA_100_heat_follow_arua"]["shader"]) do
                if not p5[i]["shader"]:hasUniform(name) then missing[#missing + 1] = i .. ":" .. name end
            end
        end
        check(#missing == 0,S .. " 5UA uniforms present in every pooled shader " .. table.concat(missing,","))
    end

    -- ---------------- 3) 场景 ----------------
    obj_stage_game_scene_camera = {0,-365,-800}
    audio_SFX_game_scene_move_SFX_LP = {}
    audio_SFX_game_scene_move_SFX_RP = {}
    play_obj_audio = function() end
    hit_LP = {["player_side"] = "L",["state"] = "idle",["shot_sys_curse"] = true,["shot_sys_curse_ban_state"] = {}}
    local function new_hurt(x)
        return {["player_side"] = "R",["x"] = x,["y"] = 0,[3] = 0,[5] = -1,[6] = 1,
            ["height"] = "stand",["state"] = "idle",["VFX_status_back_table"] = {}}
    end
    -- 两个受击方左右分开,两个光环的包围盒不一样(和"旧光环 end 阶段 + 新光环"同理,差别更明显)
    hurt_A = new_hurt(-380)
    hurt_B = new_hurt(380)
    insert_VFX_game_scene_char_TRM_6SP_P_arua(hit_LP,hurt_A)
    vA = hurt_A["VFX_status_back_table"][1]
    for i = 1,10 do vA["update"]() end
    insert_VFX_game_scene_char_TRM_6SP_P_arua(hit_LP,hurt_B)
    vB = hurt_B["VFX_status_back_table"][1]
    for i = 1,30 do vA["update"](); vB["update"]() end
    check(vA["particle_image"] ~= vB["particle_image"],"two 6SP_P auras got different particle images")
    log(string.format("  6SP_P particles A %d  B %d",#vA["particles"],#vB["particles"]))
    pooled_image_A = {vA["particle_image_data"],vA["particle_image"]}
    pooled_image_B = {vB["particle_image_data"],vB["particle_image"]}

    char5 = {["player_side"] = "L",["x"] = -380,["y"] = 0,[3] = 0,[5] = 1,[6] = 1,["state"] = "idle",
        ["VFX_common_back_table"] = {}}
    insert_VFX_game_scene_char_TRM_5UA_100_heat_follow_arua(char5)
    v5A = char5["VFX_common_back_table"][1]
    for i = 1,60 do v5A["update"]() end
    -- 第二个 5UA 跟另一个角色(位置不同),处在 ease_in
    local char5b = {["player_side"] = "L",["x"] = 380,["y"] = 0,[3] = 0,[5] = 1,[6] = 1,["state"] = "idle",
        ["VFX_common_back_table"] = {}}
    insert_VFX_game_scene_char_TRM_5UA_100_heat_follow_arua(char5b)
    v5B = char5b["VFX_common_back_table"][1]
    for i = 1,6 do v5A["update"](); v5B["update"]() end
    check(v5A["shader_slot"] ~= v5B["shader_slot"],"two 5UA auras got different shaders")

    -- ---------------- 4) uniform 顺序 ----------------
    uniform_shader = love.graphics.newShader([[
        extern float v;
        vec4 effect(vec4 color, Image tex, vec2 tc, vec2 sc) { return vec4(v, 0.0, 0.0, 1.0); }
    ]])
    local q = love.image.newImageData(1,1)
    q:setPixel(0,0,1,1,1,1)
    quad = love.graphics.newImage(q)

    -- 每一帧画什么 / 截图后做什么
    local function draw6(list)
        love.graphics.clear(0,0,0,1)
        for _,v in ipairs(list) do v["draw"]() end
    end
    local function draw5(list)
        love.graphics.clear(1,1,1,1)
        for _,v in ipairs(list) do v["draw"]() end
    end
    local function use_shared(on)
        -- 旧做法:B 用 A 的那张贴图
        if on then
            vB["particle_image_data"],vB["particle_image"] = pooled_image_A[1],pooled_image_A[2]
        else
            vB["particle_image_data"],vB["particle_image"] = pooled_image_B[1],pooled_image_B[2]
        end
    end
    steps = {
        {"6_pool_AB",function() use_shared(false); draw6({vA,vB}) end},
        {"6_pool_A",function() draw6({vA}) end},
        {"6_pool_B",function() draw6({vB}) end},
        {"6_shared_AB",function() use_shared(true); draw6({vA,vB}) end},
        {"6_shared_A",function() draw6({vA}) end},
        {"6_shared_B",function() draw6({vB}) end},
        {"5_AB",function() draw5({v5A,v5B}) end},
        {"5_A",function() draw5({v5A}) end},
        {"5_B",function() draw5({v5B}) end},
        {"uniform",function()
            love.graphics.clear(0,0,0,1)
            for i = 1,6 do
                uniform_shader:send("v",i/7)
                love.graphics.setShader(uniform_shader)
                love.graphics.draw(quad,(i - 1)*40,0,0,40,40)
                love.graphics.setShader()
            end
        end}
    }
end

local function finish()
    log("== same frame vs separate frames ==")
    local n,maxd = compare(shots["6_pool_AB"],shots["6_pool_A"],shots["6_pool_B"],"add")
    check(n == 0,string.format("6SP_P pooled images: mismatched px %d (max diff %.3f)",n,maxd))
    local n2,maxd2 = compare(shots["6_shared_AB"],shots["6_shared_A"],shots["6_shared_B"],"add")
    log(string.format("  info 6SP_P shared image (old way): mismatched px %d (max diff %.3f) %s",n2,maxd2,
        n2 > 0 and "<- the old bug reproduced" or "(not reproduced in this frame)"))
    if n2 > 0 then save_png(shots["6_shared_AB"],"6SP_P_shared_same_frame") end
    save_png(shots["6_pool_AB"],"6SP_P_pooled_same_frame")
    local n3,maxd3 = compare(shots["5_AB"],shots["5_A"],shots["5_B"],"mul")
    check(n3 == 0,string.format("5UA pooled shaders: mismatched px %d (max diff %.3f)",n3,maxd3))
    save_png(shots["5_AB"],"5UA_pooled_same_frame")
    local d = shots["uniform"]
    local ok,got = true,{}
    for i = 1,6 do
        local r = d:getPixel((i - 1)*40 + 20,20)
        got[i] = string.format("%.2f",r)
        if math.abs(r - i/7) > 0.02 then ok = false end
    end
    log("  info uniform send between draws (same shader): " .. table.concat(got," ") ..
        (ok and "  -> IN ORDER (5UA would also be fine with one shared shader)" or "  -> NOT IN ORDER (5UA needs the shader pool)"))
    log(fails == 0 and "RESULT: OK" or ("RESULT: FAIL x" .. fails))
    flush()
    love.event.quit()
end

local step = 0
local pending = false
function love.draw()
    frame = frame + 1
    if frame < 3 or pending then
        love.graphics.clear(0,0,0,1)
        return
    end
    step = step + 1
    local s = steps[step]
    if not s then
        finish()
        return
    end
    s[2]()
    pending = true
    love.graphics.captureScreenshot(function(image_data)
        shots[s[1]] = image_data
        pending = false
    end)
end

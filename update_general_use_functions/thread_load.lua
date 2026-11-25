-- 线程加载
--   · 线程对象在第一次调用时一次建好:newThread 要读文件,放在任何线程开始读盘之前,
--     否则后面每个 newThread 都要排在前面线程的大文件读取后面(旧版进 game_scene 时那一帧卡 5 秒)
--   · 同时在读盘的线程最多 THREAD_MAX_RUNNING 个,按下标顺序依次开:
--     十几个线程同时读大文件时磁盘来回寻道,总吞吐反而更低,主线程偶尔读个小文件也会被排到很后面
--   · THREAD_NO_LIMIT_TABLE[i] = true:第 i 个线程不占读盘名额,第一帧就开(音频解码 / 只读几个文本这种
--     主要吃 CPU、读盘很少的线程;否则 5 秒的音频解码会占着一个名额,后面的贴图线程排着等)
--   · REQUIRE_QUEUE 不为空时先做 require(每帧一项,见 advance_require_functions.lua),做完才开线程:
--     require 是主线程读盘,和线程一起读的话每一项都要排在线程的大文件后面
--   · ORDER_LOAD_TABLE 里是函数名字符串,执行时从 _G 取(prep 的时候模块还没 require)
--   · 主线程要用的文本(json / glsl)尽量不在主线程读盘,用 common_read_text 从 FILE_TEXT_CACHE 取:
--       json:贴图线程读贴图时顺手读同名 .json(threads/thread_common.lua),放在 ASSET_DATA[i]["__text"],
--             这里取到 ASSET_DATA[i] 时收进 FILE_TEXT_CACHE
--       glsl:各场景 shader 那一项也配一个只读文本的线程(例如 threads/game_scene/shader.lua),
--             同样放在 ASSET_DATA[i]["__text"];shader 的 order_load 要等这个线程读完才执行
--       (旧版用一个线程预读整个目录、读完之前所有 order_load 都等着,目录大时用了 17 秒,已去掉)
THREAD_MAX_RUNNING = 2
THREAD_OBJECT_TABLE = {}
THREAD_START_TIME = {}
THREAD_NO_LIMIT_TABLE = {}
FILE_TEXT_CACHE = {}
function run_table_order_load()
    -- require_queue:每帧一项,做完之前不开线程、不执行 order_load
    if #REQUIRE_QUEUE > 0 then
        local step_time = love.timer.getTime()
        DEBUG_REQUIRE_QUEUE_STEP = true
        local step_name = require_queue_step()
        DEBUG_REQUIRE_QUEUE_STEP = false
        step_time = love.timer.getTime() - step_time
        if DEBUG_ORDER_LOAD_TIMING then
            DEBUG_ORDER_LOAD_LAST_STEP = string.format("require_queue %s %.2fms",step_name,step_time*1000)
            DEBUG_ORDER_LOAD_LAST_STEP_FRAME = DEBUG_UPDATE_COUNT
            if step_time > DEBUG_ORDER_LOAD_TIMING_THRESHOLD then
                print("[require_queue] " .. string.format("%-62s %.2fms",step_name,step_time*1000))
            end
        end
        return
    end
    local now = love.timer.getTime()
    -- create_threads
    for i = 1,THREAD_AMOUNT do
        local path = THREAD_TABLE[i]
        if path == nil then
            break
        end
        if path ~= false and THREAD_OBJECT_TABLE[i] == nil then
            THREAD_OBJECT_TABLE[i] = love.thread.newThread(path)
        end
    end
    local running = 0
    -- pop_thread_data
    for i = 1,THREAD_AMOUNT do
        if THREAD_OBJECT_TABLE[i] ~= nil and THREAD_ONCE_TABLE[i] and ASSET_DATA[i] == nil then
            ASSET_DATA[i] = love.thread.getChannel("thread_data_"..i..""):pop()
            if ASSET_DATA[i] == nil then
                -- 线程里报错不会自己冒出来,只会永远不推数据(加载画面一直卡着):在主线程把错误抛出来
                -- (例如改了 DDS 没重新跑 tools/dds_compress.py,.dds.z 不存在)
                local thread_error = THREAD_OBJECT_TABLE[i]:getError()
                if thread_error ~= nil then
                    error(THREAD_TABLE[i] .. ": " .. thread_error)
                end
                if not THREAD_NO_LIMIT_TABLE[i] then
                    running = running + 1
                end
            else
                -- 线程顺手读的文本(json / glsl)
                local text_table = ASSET_DATA[i]["__text"]
                if text_table ~= nil then
                    for path,text in pairs(text_table) do
                        FILE_TEXT_CACHE[path] = text
                    end
                    ASSET_DATA[i]["__text"] = nil
                end
                if DEBUG_ORDER_LOAD_TIMING then
                    print(string.format("[thread] %2d %-56s %.2fs",i,THREAD_TABLE[i],now - THREAD_START_TIME[i]))
                end
            end
        end
    end
    -- false = 没有线程(只在主线程加载,例如纯计算的数据):不等线程数据,直接当作已就绪
    for i = 1,THREAD_AMOUNT do
        if ASSET_DATA[i] == nil and THREAD_TABLE[i] == false then
            ASSET_DATA[i] = {}
            THREAD_ONCE_TABLE[i] = true
        end
    end
    -- start_threads(按下标顺序,最多 THREAD_MAX_RUNNING 个同时读盘;THREAD_NO_LIMIT_TABLE 里的不占名额)
    for i = 1,THREAD_AMOUNT do
        if THREAD_OBJECT_TABLE[i] ~= nil and not THREAD_ONCE_TABLE[i] then
            local no_limit = THREAD_NO_LIMIT_TABLE[i]
            if no_limit or running < THREAD_MAX_RUNNING then
                THREAD_OBJECT_TABLE[i]:start()
                THREAD_ONCE_TABLE[i] = true
                THREAD_START_TIME[i] = now
                if not no_limit then
                    running = running + 1
                end
            end
        end
    end
    -- 暖机队列:每帧做一项,做完才执行下一步 order_load(见 warm_up.lua)
    if #WARM_UP_QUEUE > 0 then
        local step_time = love.timer.getTime()
        local step_name = warm_up_queue_step()
        step_time = love.timer.getTime() - step_time
        if DEBUG_ORDER_LOAD_TIMING then
            DEBUG_ORDER_LOAD_LAST_STEP = string.format("warm_up %s %.2fms",step_name,step_time*1000)
            DEBUG_ORDER_LOAD_LAST_STEP_FRAME = DEBUG_UPDATE_COUNT
            if step_time > DEBUG_ORDER_LOAD_TIMING_THRESHOLD then
                print("[warm_up] " .. string.format("%-62s %.2fms",step_name,step_time*1000))
            end
        end
        return
    end
    -- load_asset_data_to_variables
    local i = 1
    while (i<=THREAD_AMOUNT)
    do
        if ASSET_DATA[i] ~= nil 
        and (not LOAD_ONCE_TABLE[i])
        then
            -- 计时包住这一步本身(旧的计时在 break 之后才结束,真正执行了的那一步反而量不到)
            -- 这一步新建的纹理 / shader 登记进暖机队列,从下一帧开始暖机(不算在这一步的耗时里,见 warm_up.lua)
            local load_order = CURRENT_ORDER_TABLE[i]
            local step_time = love.timer.getTime()
            warm_up_record_begin(ORDER_LOAD_TABLE[i] .. "[" .. load_order .. "]")
            _G[ORDER_LOAD_TABLE[i]](load_order)
            warm_up_record_end()
            step_time = love.timer.getTime() - step_time
            if DEBUG_ORDER_LOAD_TIMING then
                debug_order_load_timing_record(i,load_order,step_time)
            end
            CURRENT_ORDER_TABLE[i] = CURRENT_ORDER_TABLE[i] + 1
            if CURRENT_ORDER_TABLE[i] > ORDER_SIZE_TABLE[i] then
                CURRENT_ORDER_TABLE[i] = 0
                LOAD_ONCE_TABLE[i] = true
                LOADING_FUNCTION_AMOUNT = LOADING_FUNCTION_AMOUNT - 1
                if DEBUG_ORDER_LOAD_TIMING and LOADING_FUNCTION_AMOUNT == 0 then
                    debug_order_load_timing_summary()
                end
            end
            -- 每帧只执行一个switch
            break
        end
        i = i + 1
    end
end
-- 读文本:线程读过的直接取(见上面的 __text),没读过的照常在主线程读盘,并打印出来方便补到线程里
function common_read_text(path)
    local text = FILE_TEXT_CACHE[path]
    if text == nil then
        if DEBUG_ORDER_LOAD_TIMING then
            print("[text] 没有预读,主线程读盘: " .. path)
        end
        text = love.filesystem.read(path)
    end
    return text
end
-- ---------------- 加载计时(调试用) ----------------
-- require 计时:main.lua 在 DEBUG_ORDER_LOAD_TIMING 打开时把全局 require 换成这个,超过阈值的模块打印出来:
--     [require] scenes.game_scene.characters.TRM.left            85.20ms
-- 嵌套 require 时外层的时间包含里层;require 队列里的那一项由 run_table_order_load 打印,这里不重复打印
function debug_wrap_require()
    local original_require = require
    require = function(name)
        local module = package.loaded[name]
        if module ~= nil then
            return module
        end
        local start_time = love.timer.getTime()
        module = original_require(name)
        local spend_time = love.timer.getTime() - start_time
        if spend_time > DEBUG_ORDER_LOAD_TIMING_THRESHOLD and not DEBUG_REQUIRE_QUEUE_STEP then
            print(string.format("[require] %-56s %.2fms",name,spend_time*1000))
        end
        return module
    end
end
-- 每一步 order_load 的 CPU 耗时超过 DEBUG_ORDER_LOAD_TIMING_THRESHOLD 就打印一行:
--     [order_load] order_load_game_scene_shader[11] 23.40ms
-- 全部加载完再按总耗时从大到小打印每个 order_load 函数。
-- 驱动可能把一部分工作(编译 / 链接 / 贴图上传)拖到 love.graphics.present 才做,这里量不到,
-- 由 main.lua 的帧耗时打印来抓:加载中那里会带上最近执行的一步。
DEBUG_ORDER_LOAD_TIMING = true
DEBUG_ORDER_LOAD_TIMING_THRESHOLD = 0.004 -- 秒,超过才打印
DEBUG_ORDER_LOAD_LAST_STEP = ""           -- 最近执行的一步,例如 "order_load_game_scene_shader[11] 23.40ms"
DEBUG_ORDER_LOAD_LAST_STEP_FRAME = -1     -- 执行那一步时的 DEBUG_UPDATE_COUNT
-- love.update 的次数(main.lua 里加);不用 FRAMES_DRAWN,它会被 game_duration.lua 定期清零
DEBUG_UPDATE_COUNT = 0
DEBUG_ORDER_LOAD_TOTAL = {}               -- 每个 order_load 函数的累计耗时(下标和 ORDER_LOAD_TABLE 一致)
DEBUG_REQUIRE_QUEUE_STEP = false          -- 正在做 require 队列的一项(debug_wrap_require 不重复打印)
-- 纹理 / shader -> 建它的那一步 order_load(例如 "order_load_game_scene_char_LP_frames[37]"),给慢绘制打印用
DEBUG_RESOURCE_ORIGIN = setmetatable({},{__mode = "k"})
-- 慢调用探针:把 DEBUG_SLOW_CALL_FUNCTION_TABLE 里的全局函数包一层计时(require 队列每 require 完一个模块补包一次),
-- 单次调用超过阈值就打印,带调用深度:
--     [call] 深度 2   23.10ms  character_function_game_scene_TRM_shot_sys_at_the_ready_aim_r_calculation
-- 内层先打印、外层后打印,外层的时间包含内层
DEBUG_SLOW_CALL_THRESHOLD = 0.002 -- 秒
DEBUG_SLOW_CALL_FUNCTION_TABLE = {
    -- 5H / 4SP_S_H 第一次用时卡顿的那条路径
    "character_function_game_scene_TRM_shot_sys_at_the_ready_shot_init",
    "character_function_game_scene_TRM_shot_sys_at_the_steady_shot_init",
    "load_game_scene_anim_char_TRM_5H",
    "load_game_scene_anim_char_TRM_4SP_S_H",
    "load_game_scene_anim_char_TRM_5H_shot_sys_at_the_ready_shot",
    "load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_shot",
    "load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_shot",
    "character_function_game_scene_TRM_shot_sys_at_the_ready_aim_r_calculation",
    "character_function_game_scene_TRM_shot_sys_at_the_ready_oroboros_pos_update",
    "insert_projectile_game_scene_char_TRM_4SP_S_H_at_the_steady_shot",
    "insert_VFX_game_scene_char_TRM_oroboros_blast",
    "insert_VFX_game_scene_char_TRM_4SP_S_H_at_the_steady_projectile_hit_blast",
    "init_character_anim_with",
    "init_character_anim_without",
    "play_obj_audio",
    -- 6SP_P 诅咒光环:释放时在 update 里建 VFX 并给 shader 送 uniform(Shader:send),之后每帧发射粒子
    "insert_VFX_game_scene_char_TRM_6SP_P_arua",
    "character_function_game_scene_TRM_6SP_P_arua_reset_particles",
    "character_function_game_scene_TRM_6SP_P_arua_update_particles",
    "character_function_game_scene_TRM_6SP_P_arua_draw"
}
local debug_slow_call_wrapped = setmetatable({},{__mode = "k"})
local debug_slow_call_depth = 0
function debug_wrap_slow_call_functions()
    for i = 1,#DEBUG_SLOW_CALL_FUNCTION_TABLE do
        local name = DEBUG_SLOW_CALL_FUNCTION_TABLE[i]
        local original = _G[name]
        if type(original) == "function" and not debug_slow_call_wrapped[original] then
            local wrapper = function(...)
                debug_slow_call_depth = debug_slow_call_depth + 1
                local depth = debug_slow_call_depth
                local start_time = love.timer.getTime()
                local result_1,result_2,result_3,result_4 = original(...)
                local spend_time = love.timer.getTime() - start_time
                debug_slow_call_depth = depth - 1
                if spend_time > DEBUG_SLOW_CALL_THRESHOLD then
                    print(string.format(
                        "[call] 深度 %d %8.2fms  %s",
                        depth,spend_time*1000,name
                    ))
                end
                return result_1,result_2,result_3,result_4
            end
            debug_slow_call_wrapped[wrapper] = true
            _G[name] = wrapper
        end
    end
end
-- 慢绘制探针:main.lua 在 DEBUG_ORDER_LOAD_TIMING 打开时调用,把 love.graphics.draw / rectangle 包一层,
-- 单次调用超过阈值就打印当时的绘制状态,用来找「第一次用某个招式卡一下」到底卡在哪个资源上:
--     [draw] 35.20ms SpriteBatch 4096x2048 纹理:order_load_game_scene_char_LP_frames[37] shader:默认 blend:add 目标:屏幕
-- 驱动的延迟工作(编译 shader 变体 / 让纹理常驻显存)一般在 draw call 提交时发生,会算进这一次调用;
-- 如果打印的是 0 张、而 [frame] 的 present 很大,说明工作被拖到了 present
function debug_wrap_draw()
    local original_draw = love.graphics.draw
    local original_rectangle = love.graphics.rectangle
    local function describe(texture,spend_time,kind)
        local shader = love.graphics.getShader()
        local blend_mode = love.graphics.getBlendMode()
        local texture_text = "无"
        if texture ~= nil then
            local width,height = texture:getDimensions()
            texture_text = string.format(
                "%dx%d 纹理:%s",width,height,DEBUG_RESOURCE_ORIGIN[texture] or "加载流程外建的"
            )
        end
        local shader_text = "默认"
        if shader ~= nil then
            shader_text = DEBUG_RESOURCE_ORIGIN[shader] or "加载流程外建的"
        end
        print(string.format(
            "[draw] %.2fms %s %s shader:%s blend:%s 目标:%s",
            spend_time*1000,kind,texture_text,shader_text,blend_mode,
            love.graphics.getCanvas() == nil and "屏幕" or "canvas"
        ))
    end
    love.graphics.draw = function(drawable,...)
        local start_time = love.timer.getTime()
        original_draw(drawable,...)
        local spend_time = love.timer.getTime() - start_time
        if spend_time > DEBUG_ORDER_LOAD_TIMING_THRESHOLD then
            local texture = drawable
            if drawable:typeOf("SpriteBatch") or drawable:typeOf("Mesh") or drawable:typeOf("ParticleSystem") then
                texture = drawable:getTexture()
            end
            describe(texture,spend_time,drawable:type())
        end
    end
    love.graphics.rectangle = function(...)
        local start_time = love.timer.getTime()
        original_rectangle(...)
        local spend_time = love.timer.getTime() - start_time
        if spend_time > DEBUG_ORDER_LOAD_TIMING_THRESHOLD then
            describe(nil,spend_time,"rectangle")
        end
    end
end
function debug_order_load_timing_record(i,load_order,step_time)
    local name = ORDER_LOAD_TABLE[i]
    DEBUG_ORDER_LOAD_LAST_STEP = string.format("%s[%d] %.2fms",name,load_order,step_time*1000)
    DEBUG_ORDER_LOAD_LAST_STEP_FRAME = DEBUG_UPDATE_COUNT
    DEBUG_ORDER_LOAD_TOTAL[i] = (DEBUG_ORDER_LOAD_TOTAL[i] or 0) + step_time
    if step_time > DEBUG_ORDER_LOAD_TIMING_THRESHOLD then
        print("[order_load] " .. DEBUG_ORDER_LOAD_LAST_STEP)
    end
end
function debug_order_load_timing_summary()
    local index_table = {}
    local all_time = 0
    for i = 1,THREAD_AMOUNT do
        if DEBUG_ORDER_LOAD_TOTAL[i] then
            index_table[#index_table + 1] = i
            all_time = all_time + DEBUG_ORDER_LOAD_TOTAL[i]
        end
    end
    table.sort(index_table,function(a,b)
        return DEBUG_ORDER_LOAD_TOTAL[a] > DEBUG_ORDER_LOAD_TOTAL[b]
    end)
    print(string.format("[order_load] 全部加载完成,order_load 合计 %.2fms",all_time*1000))
    for k = 1,#index_table do
        local i = index_table[k]
        print(string.format(
            "[order_load]   %-48s %8.2fms  %d 步",
            ORDER_LOAD_TABLE[i],DEBUG_ORDER_LOAD_TOTAL[i]*1000,ORDER_SIZE_TABLE[i]
        ))
    end
    DEBUG_ORDER_LOAD_TOTAL = {}
end
function init_order_load_table()
    THREAD_TABLE = {}
    THREAD_AMOUNT = 0
    THREAD_ONCE_TABLE = {}
    ASSET_DATA = {}
    ORDER_LOAD_TABLE = {}
    CURRENT_ORDER_TABLE = {}
    ORDER_SIZE_TABLE = {}
	LOAD_ONCE_TABLE = {}
    LOADING_FUNCTION_AMOUNT = 0
    THREAD_OBJECT_TABLE = {}
    THREAD_START_TIME = {}
    THREAD_NO_LIMIT_TABLE = {}
    FILE_TEXT_CACHE = {}
    WARM_UP_QUEUE = {}
	NEXT_UPDATE_BLOCK = nil
	NEXT_DRAW_BLOCK = nil
    NEXT_PRESET = nil
end
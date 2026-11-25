-- 暖机
-- 很多东西「建好」之后,真正的工作要等到第一次用到才做,不提前做一次的话就卡在第一次用到的那一帧:
--   · C 函数:代码页第一次执行时才从磁盘读进内存(冷文件缓存下要读盘)         -> init_warm_up
--   · 纹理 / shader:上传 / 编译 / 链接被驱动拖到第一次绘制                   -> 加载流程里的暖机队列
-- 加载流程(update_general_use_functions/thread_load.lua 的 run_table_order_load)里:
--   每一步 order_load 前后调 warm_up_record_begin / warm_up_record_end,
--   暖机队列 WARM_UP_QUEUE 不空时每帧调一次 warm_up_queue_step,空了才执行下一步 order_load
-- ---------------- 启动时的暖机 ----------------
-- C 函数暖机:平时很少走到的 C 函数,第一次调用时它所在的代码页(在 lua51.dll / C 运行库 / love.dll 里)
-- 才从磁盘读进内存。文件缓存是冷的(清过 standby list / working set、或刚开机)时,
-- 这一次读盘会卡在对局里。实测:全项目只有 TRM 射击系统的 aim_r_calculation 调 math.atan2,
-- 5H / 4SP_S_H 第一次用时卡 20ms 左右,文件缓存是热的就不卡。
-- 启动时把项目里用到的数学函数都先调一次,让读盘发生在这里
-- (love.math 没有三角函数 / sqrt,而且它在 love.dll 里同样是用到才读盘,换过去解决不了)
-- main.lua 的 love.load 开头调用;以后发现别的 C 函数第一次用时卡,加在这里
function init_warm_up()
    local warm_up_value = 0
    warm_up_value = warm_up_value + math.sin(0.5) + math.cos(0.5) + math.atan(0.5) + math.atan2(1,1)
    warm_up_value = warm_up_value + math.sqrt(2) + math.floor(1.5) + math.ceil(1.5) + math.abs(-1)
    warm_up_value = warm_up_value + math.min(1,2) + math.max(1,2)
    -- ^ 运算符走 C 运行库的 pow(例如 aim_process 里的 velocity^2)
    warm_up_value = warm_up_value + 2^0.5
    -- 随机数:不调 math.random / love.math.random(会消耗全局随机序列,项目里没有 randomseed),
    -- 用一个临时的生成器走一遍同一段代码
    warm_up_value = warm_up_value + love.math.newRandomGenerator(1):random()
    -- 带小数的数字转字符串 / 字符串转数字也走 C 运行库
    warm_up_value = warm_up_value + tonumber(string.format("%.3f",warm_up_value))
    return warm_up_value
end
-- ---------------- 加载流程里的暖机(纹理和 shader 同一套流程) ----------------
-- 只调 newImage / newShader 时,很多驱动会把真正的上传 / 编译 / 链接拖到第一次绘制,
-- 不暖机的话第一次在游戏里用到才卡。统一的做法:
--   1. order_load 的一步里只「建」资源,建的时候登记进暖机队列 WARM_UP_QUEUE
--        纹理:照常 love.graphics.newImage / newCanvas(序列帧图集走 common_sprite_sheet_load,里面也是 newImage)
--              这一步执行期间这两个函数被临时包一层,新建的纹理自动登记
--        shader:用 common_shader_new(source,blend_mode,drawable_kind,prepare) 建,同时登记游戏里的画法
--   2. 之后每帧做队列里的一项,队列空了才执行下一步 order_load(建和暖机错开一帧,一帧只做一件重活)
--        纹理:这一步建的全部纹理合成一项,每张缩成 8x8 往 8x8 canvas 上画一次(整张都被采样到)
--        shader:每个 shader 一项,按登记的画法先画进 8x8 canvas,再对屏幕用 alpha 0 画一次
--              (驱动可能按绘制目标格式、混合模式、顶点格式再编译一次,所以按游戏里的画法画;
--               在 update 里跑,love.draw 开头会 clear,画面上看不到)
--   common_shader_new 的参数:
--     blend_mode:游戏里画这个 shader 用的混合模式
--     drawable_kind:游戏里画的图元
--       "rectangle"   全屏程序化(love.graphics.rectangle)
--       "texture"     画贴图 / canvas
--       "sprite_batch" 画 SpriteBatch
--       "mesh"        画粒子 mesh(顶点着色器,common_particle_mesh_new)
--     prepare:可选,画之前调一次 prepare(shader),例如送真实的数据贴图;
--              普通 uniform 的数值不影响编译(没 send 的 extern 是 0,Image 是 LOVE 的默认贴图),一般不用传
WARM_UP_QUEUE = {}
local warm_up_step_name = ""
local warm_up_texture_list = nil
local warm_up_shader_list = nil
local warm_up_new_image = nil
local warm_up_new_canvas = nil
local warm_up_target_canvas = nil   -- 暖机画到这张 8x8 canvas 上
local warm_up_source_canvas = nil   -- "texture" / "sprite_batch" 画的贴图
local warm_up_sprite_batch = nil
local warm_up_mesh = nil
local function warm_up_record_image(...)
    local texture = warm_up_new_image(...)
    warm_up_texture_list[#warm_up_texture_list + 1] = texture
    if DEBUG_ORDER_LOAD_TIMING then
        DEBUG_RESOURCE_ORIGIN[texture] = warm_up_step_name
    end
    return texture
end
local function warm_up_record_canvas(...)
    local texture = warm_up_new_canvas(...)
    warm_up_texture_list[#warm_up_texture_list + 1] = texture
    if DEBUG_ORDER_LOAD_TIMING then
        DEBUG_RESOURCE_ORIGIN[texture] = warm_up_step_name
    end
    return texture
end
local function warm_up_draw(drawable_kind)
    if drawable_kind == "rectangle" then
        love.graphics.rectangle("fill",0,0,8,8)
    elseif drawable_kind == "texture" then
        love.graphics.draw(warm_up_source_canvas,0,0)
    elseif drawable_kind == "sprite_batch" then
        love.graphics.draw(warm_up_sprite_batch)
    elseif drawable_kind == "mesh" then
        love.graphics.draw(warm_up_mesh)
    end
end
-- order_load 的一步开始:之后 newImage / newCanvas 新建的纹理都登记下来
function warm_up_record_begin(step_name)
    warm_up_step_name = step_name
    warm_up_texture_list = {}
    warm_up_shader_list = {}
    warm_up_new_image = love.graphics.newImage
    warm_up_new_canvas = love.graphics.newCanvas
    love.graphics.newImage = warm_up_record_image
    love.graphics.newCanvas = warm_up_record_canvas
end
-- order_load 的一步结束:换回原来的函数,这一步登记的东西排进暖机队列(纹理一项,shader 各一项)
function warm_up_record_end()
    love.graphics.newImage = warm_up_new_image
    love.graphics.newCanvas = warm_up_new_canvas
    if #warm_up_texture_list > 0 then
        WARM_UP_QUEUE[#WARM_UP_QUEUE + 1] = {"texture",warm_up_step_name,warm_up_texture_list}
    end
    for k = 1,#warm_up_shader_list do
        WARM_UP_QUEUE[#WARM_UP_QUEUE + 1] = warm_up_shader_list[k]
    end
    warm_up_texture_list = nil
    warm_up_shader_list = nil
end
-- 做暖机队列里的第一项,返回这一项的说明(给加载计时打印用)
function warm_up_queue_step()
    if warm_up_target_canvas == nil then
        warm_up_target_canvas = love.graphics.newCanvas(8,8)
        warm_up_source_canvas = love.graphics.newCanvas(8,8)
        warm_up_sprite_batch = love.graphics.newSpriteBatch(warm_up_source_canvas,1)
        warm_up_sprite_batch:add(0,0)
        warm_up_mesh = common_particle_mesh_new(1)
    end
    local item = table.remove(WARM_UP_QUEUE,1)
    love.graphics.push("all")
    if item[1] == "texture" then
        local texture_list = item[3]
        love.graphics.setCanvas(warm_up_target_canvas)
        love.graphics.setShader()
        love.graphics.setBlendMode("replace")
        love.graphics.setColor(1,1,1,1)
        for k = 1,#texture_list do
            local texture = texture_list[k]
            local width,height = texture:getDimensions()
            love.graphics.draw(texture,0,0,0,8/width,8/height)
        end
        love.graphics.pop()
        return string.format("%s texture %d",item[2],#texture_list)
    end
    local shader = item[3]
    local drawable_kind = item[5]
    local prepare = item[6]
    if prepare ~= nil then
        prepare(shader)
    end
    love.graphics.setShader(shader)
    love.graphics.setBlendMode(item[4])
    -- 8x8 canvas
    love.graphics.setCanvas(warm_up_target_canvas)
    love.graphics.setColor(1,1,1,1)
    warm_up_draw(drawable_kind)
    -- 屏幕(和游戏里同一个绘制目标)
    love.graphics.setCanvas()
    love.graphics.setColor(1,1,1,0)
    warm_up_draw(drawable_kind)
    love.graphics.pop()
    return string.format("%s shader %s",item[2],drawable_kind)
end

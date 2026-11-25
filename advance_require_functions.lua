function require_all_in_folder(folder)
    -- 获取文件夹内的所有文件和子文件夹
    local files = love.filesystem.getDirectoryItems(folder)
    for i = 1,#files do
        local file = files[i]
        local filePath = folder .. "/" .. file
        -- 检查是否是文件
        if love.filesystem.getInfo(filePath,"file") then
            -- 检查扩展名是否是 .lua
            if file:sub(-4) == ".lua" then
                -- 动态加载文件，去掉 .lua 扩展名
                local moduleName = filePath:gsub("%.lua$",""):gsub("/",".")
                require(moduleName)
            end
        elseif love.filesystem.getInfo(filePath,"directory") then
            -- 如果是子文件夹，递归加载
            require_all_in_folder(filePath)
        end
    end
end
-- 卸载场景:清掉 package.loaded 里这个前缀的模块,
-- 再把这个场景的 load_function / init 排进 require 队列(下次切到这个场景时 prep 要用)
-- 所有场景出口都是「先调下一个场景的 prep,再 unload 当前场景」,unload 之后不会再用到它的函数,
-- 所以不用当场重新 require,放进队列在加载画面里分帧做
function unrequire_prefix(prefix)
    for name,_ in pairs(package.loaded) do
        if name:sub(1,#prefix) == prefix then
            package.loaded[name] = nil
        end
    end
    for i = 1,#INIT_LOAD_FUNCTION_MODULE_TABLE do
        local name = INIT_LOAD_FUNCTION_MODULE_TABLE[i]
        if name:sub(1,#prefix) == prefix then
            require_queue_push_module(name)
        end
    end
end
-- 各场景的 load_function / init:启动时全部 require,之后一直常驻(prep 在 load_function 里)
INIT_LOAD_FUNCTION_MODULE_TABLE = {
    "scenes.disclaimer_and_logos_scene.load_function",
    "scenes.disclaimer_and_logos_scene.init",
    "scenes.start_scene.load_function",
    "scenes.start_scene.init",
    "scenes.char_select_scene.load_function",
    "scenes.char_select_scene.init",
    "scenes.game_scene._common.load_function",
    "scenes.game_scene._common.init"
}
function require_all_init_load_function()
    for i = 1,#INIT_LOAD_FUNCTION_MODULE_TABLE do
        require(INIT_LOAD_FUNCTION_MODULE_TABLE[i])
    end
end
-- ---------------- require 队列(分帧 require) ----------------
-- 场景的 prep 不直接 require,只把要 require 的东西排进队列;
-- 加载画面里 run_table_order_load 每帧只做一项,队列空了才开线程、执行 order_load
-- (这块移动硬盘上每打开一个文件固定 20ms 以上,game_scene 一次 require 14 个文件曾经卡了 561ms)
-- 每一项:
--   {"folder",目录}:列出目录(和 require_all_in_folder 一样按 getDirectoryItems 的顺序),子项插到队列最前面
--   {"path",路径}:   getInfo 看是文件还是目录;.lua 文件就 require,目录就展开
--   {"module",模块名}:直接 require
-- prep 里的 ORDER_LOAD_TABLE / NEXT_* 因此都写函数名字符串,用到的时候再从 _G 取(那时模块已经 require 完了)
REQUIRE_QUEUE = {}
function require_queue_push_folder(folder)
    REQUIRE_QUEUE[#REQUIRE_QUEUE + 1] = {"folder",folder}
end
function require_queue_push_module(name)
    REQUIRE_QUEUE[#REQUIRE_QUEUE + 1] = {"module",name}
end
local function require_queue_expand_folder(folder)
    local item_table = love.filesystem.getDirectoryItems(folder)
    for i = #item_table,1,-1 do
        table.insert(REQUIRE_QUEUE,1,{"path",folder .. "/" .. item_table[i]})
    end
end
-- 做队列里的第一项,返回这一项的说明(给加载计时打印用)
function require_queue_step()
    local item = table.remove(REQUIRE_QUEUE,1)
    local kind = item[1]
    local value = item[2]
    if kind == "folder" then
        require_queue_expand_folder(value)
    elseif kind == "path" then
        local info = love.filesystem.getInfo(value)
        if info.type == "directory" then
            require_queue_expand_folder(value)
        elseif info.type == "file" and value:sub(-4) == ".lua" then
            require((value:gsub("%.lua$",""):gsub("/",".")))
        end
    else
        require(value)
    end
    return kind .. " " .. value
end
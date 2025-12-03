-- thread_table 线程table正常放
-- thread_amount 从1开始数有多少就是多少
-- thread_once_table thread_amount量的false
-- ASSET_DATA = {}
-- load_functions_table 每个thread对应一个 load function
-- CURRENT_ORDER_TABLE 全是 1
-- order_size_table 对应 每个具体的 load_function的 order最大值
function load_disclaimer_logos_scene_prep()
    load_disclaimer_and_logos_scene_require()
    
    THREAD_TABLE = {"threads/disclaimer_and_logos_scene/disclaimer_and_logos_scene_thread_1_general.lua"}
    THREAD_AMOUNT = 1   -- 线程数目
    THREAD_ONCE_TABLE = {false} -- 如果有两个线程 = {false，false} 三个 = {false，false，false} 以此类推
    ASSET_DATA = {}   -- 保持为nil
    ORDER_LOAD_TABLE = {order_load_disclaimer_and_logo_scene_1_general}    -- load function table
    CURRENT_ORDER_TABLE = {1}  -- 如果有两个线程 = {1，1} 三个 = {1，1，1} 以此类推
    ORDER_SIZE_TABLE = {1}  -- 每个load function的最大值
    LOAD_ONCE_TABLE = {false}   -- 如果有两个线程 = {false，false} 三个 = {false，false，false} 以此类推
    LOADING_FUNCTION_AMOUNT = 1 -- 和线程数相同

	NEXT_UPDATE_BLOCK = update_disclaimer_and_logos_scene_main
	NEXT_DRAW_BLOCK = draw_disclaimer_and_logos_scene_main
    NEXT_PRESET = preset_disclaimer_and_logos_scene
end

-- 分步骤将素材加载
function order_load_disclaimer_and_logo_scene_1_general(load_order)
    local switch = 
    {
        [1] = function()
            load_disclaimer_and_logos_scene_obj()
            load_disclaimer_and_logos_scene_anim()
            
            -- image_table以0开头 因为AE的帧数是以0开头设计的
            image_table_UI_disclaimer_and_logos_scene_singular = {}
            image_table_UI_disclaimer_and_logos_scene_singular[0] = love.graphics.newImage(ASSET_DATA[1][1])
            image_table_UI_disclaimer_and_logos_scene_singular[1] = love.graphics.newImage(ASSET_DATA[1][2])
            image_table_UI_disclaimer_and_logos_scene_singular[2] = love.graphics.newImage(ASSET_DATA[1][3])
        end,
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end

-- require
function load_disclaimer_and_logos_scene_require()
    require_all_in_folder("scenes_logic/disclaimer_and_logos_scene")
    -- require("scenes_logic/disclaimer_and_logos_scene/draw_functions")
    -- require("scenes_logic/disclaimer_and_logos_scene/init")
    -- require("scenes_logic/disclaimer_and_logos_scene/load_function")
    -- require("scenes_logic/disclaimer_and_logos_scene/main_blocks")
    -- require("scenes_logic/disclaimer_and_logos_scene/state_machine")
    -- require("scenes_logic/disclaimer_and_logos_scene/sub_blocks")
end
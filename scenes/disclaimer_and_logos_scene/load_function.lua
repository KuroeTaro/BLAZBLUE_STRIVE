function load_disclaimer_logos_scene_prep()
    load_disclaimer_and_logos_scene_require()
    THREAD_TABLE = {"threads/disclaimer_and_logos_scene/disclaimer_and_logos_scene_thread_1_general.lua"}
    THREAD_AMOUNT = 1 -- 线程数目
    THREAD_ONCE_TABLE = {false} -- 如果有两个线程 = {false，false} 三个 = {false，false，false} 以此类推
    ASSET_DATA = {} -- 保持为nil
    -- 函数名字符串:执行时再从 _G 取(prep 的时候这个场景的模块还在 require 队列里)
    ORDER_LOAD_TABLE = {"order_load_disclaimer_and_logo_scene_1_general"} -- load_function_table
    CURRENT_ORDER_TABLE = {1} -- 如果有两个线程 = {1，1} 三个 = {1，1，1} 以此类推
    ORDER_SIZE_TABLE = {1} -- 每个load function的最大值
    LOAD_ONCE_TABLE = {false} -- 如果有两个线程 = {false，false} 三个 = {false，false，false} 以此类推
    LOADING_FUNCTION_AMOUNT = 1 -- 和线程数相同
	NEXT_UPDATE_BLOCK = "update_disclaimer_and_logos_scene_main"
	NEXT_DRAW_BLOCK = "draw_disclaimer_and_logos_scene_main"
    NEXT_PRESET = "preset_disclaimer_and_logos_scene"
end
function load_disclaimer_and_logos_scene_require()
    require_queue_push_folder("scenes/disclaimer_and_logos_scene")
end
function order_load_disclaimer_and_logo_scene_1_general(load_order)
    local switch =
    {
        [1] = function()
            load_disclaimer_and_logos_scene_obj()
            load_disclaimer_and_logos_scene_anim()
            -- image_table以0开头 因为AE的帧数是以0开头设计的
            image_table_UI_disclaimer_and_logos_scene_singular = {}
            image_table_UI_disclaimer_and_logos_scene_singular[0] = warm_up_record_image(ASSET_DATA[1][1])
            image_table_UI_disclaimer_and_logos_scene_singular[1] = warm_up_record_image(ASSET_DATA[1][2])
            image_table_UI_disclaimer_and_logos_scene_singular[2] = warm_up_record_image(ASSET_DATA[1][3])
        end
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end
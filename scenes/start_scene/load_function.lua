function load_start_scene_prep()
    load_start_select_scene_require()
    THREAD_TABLE = {
        "threads/start_scene/start_scene_thread_1_main_UI.lua",
        "threads/start_scene/start_scene_thread_2_main_UI_BG.lua",
        "threads/start_scene/start_scene_thread_3_sub_UI.lua",
        "threads/start_scene/start_scene_thread_4_audio.lua"
    }
    THREAD_AMOUNT = 4 -- 线程数目
    THREAD_ONCE_TABLE = {false,false,false,false} -- 如果有两个线程 = {false，false} 三个 = {false，false，false} 以此类推
    ASSET_DATA = {} -- 保持为nil
    -- 函数名字符串:执行时再从 _G 取(prep 的时候这个场景的模块还在 require 队列里)
    ORDER_LOAD_TABLE = {
        "order_load_start_scene_main_UI",
        "order_load_start_scene_main_UI_BG",
        "order_load_start_scene_sub_UI",
        "order_load_start_scene_audio"
    } -- load_function_table
    CURRENT_ORDER_TABLE = {1,1,1,1} -- 如果有两个线程 = {1，1} 三个 = {1，1，1} 以此类推
    ORDER_SIZE_TABLE = {2,1,1,1} -- 每个load function的最大值
    LOAD_ONCE_TABLE = {false,false,false,false} -- 如果有两个线程 = {false，false} 三个 = {false，false，false} 以此类推
    LOADING_FUNCTION_AMOUNT = 4 -- 和线程数相同
	NEXT_UPDATE_BLOCK = "update_start_scene_ease_in"
	NEXT_DRAW_BLOCK = "draw_start_scene_main"
    NEXT_PRESET = "preset_start_scene"
end
function load_start_select_scene_require()
    require_queue_push_folder("scenes/start_scene")
end
function order_load_start_scene_main_UI(load_order)
    local switch =
    {
        [1] = function()
            -- image_table以0开头 因为AE的帧数是以0开头设计的
            -- global_use_shape_image
            image_UI_start_scene_global_dabo_trig = warm_up_record_image(ASSET_DATA[1][1])
            image_UI_start_scene_global_type_in_mark = warm_up_record_image(ASSET_DATA[1][2])
            -- up_console_text_image
            -- single_person
            image_table_UI_start_scene_up_console_text = {}
            image_table_UI_start_scene_up_console_text[0] = warm_up_record_image(ASSET_DATA[1][3])
            -- two_player
            image_table_UI_start_scene_up_console_text[1] = warm_up_record_image(ASSET_DATA[1][4])
            -- adjustment_interface
            image_table_UI_start_scene_up_console_text[2] = warm_up_record_image(ASSET_DATA[1][5])
            -- game_duretion
            image_table_UI_start_scene_up_console_text[3] = warm_up_record_image(ASSET_DATA[1][6])
            -- close_this_game
            image_table_UI_start_scene_up_console_text[4] = warm_up_record_image(ASSET_DATA[1][7])
            -- update_controller
            image_table_UI_start_scene_up_console_text[5] = warm_up_record_image(ASSET_DATA[1][8])
            -- down_console_text_image
            -- training_mode
            image_table_UI_start_scene_down_console_text = {}
            image_table_UI_start_scene_down_console_text[0] = warm_up_record_image(ASSET_DATA[1][9])
            -- second_controller
            image_table_UI_start_scene_down_console_text[1] = warm_up_record_image(ASSET_DATA[1][10])
            -- some_configuration
            image_table_UI_start_scene_down_console_text[2] = warm_up_record_image(ASSET_DATA[1][11])
            -- time_management
            image_table_UI_start_scene_down_console_text[3] = warm_up_record_image(ASSET_DATA[1][12])
            -- return_to_OS
            image_table_UI_start_scene_down_console_text[4] = warm_up_record_image(ASSET_DATA[1][13])
            -- 2P_mode_available
            image_table_UI_start_scene_down_console_text[5] = warm_up_record_image(ASSET_DATA[1][14])
            -- only_one_controller
            image_table_UI_start_scene_down_console_text[6] = warm_up_record_image(ASSET_DATA[1][15])
            -- two_or_more_controller
            image_table_UI_start_scene_down_console_text[7] = warm_up_record_image(ASSET_DATA[1][16])
            -- option_text_image
            -- training
            image_table_UI_start_scene_option_text = {}
            image_table_UI_start_scene_option_text[0] = warm_up_record_image(ASSET_DATA[1][17])
            -- 2P_matching
            image_table_UI_start_scene_option_text[1] = warm_up_record_image(ASSET_DATA[1][18])
            -- config
            image_table_UI_start_scene_option_text[2] = warm_up_record_image(ASSET_DATA[1][19])
            -- record
            image_table_UI_start_scene_option_text[3] = warm_up_record_image(ASSET_DATA[1][20])
            -- exit_to_OS
            image_table_UI_start_scene_option_text[4] = warm_up_record_image(ASSET_DATA[1][21])
            -- option_breath_tag
            image_UI_start_scene_breath_tag = warm_up_record_image(ASSET_DATA[1][22])
            -- main_logo
            image_UI_start_scene_main_logo = warm_up_record_image(ASSET_DATA[1][23])
            image_UI_start_scene_press_any_key = warm_up_record_image(ASSET_DATA[1][24])
        end,
        [2] = function()
            load_start_scene_obj()
            load_start_scene_anim()
        end
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end
function order_load_start_scene_main_UI_BG(load_order)
    local switch =
    {
        [1] = function()
            image_table_UI_start_scene_BG_loop = {}
            for i = 0,49 do
                image_table_UI_start_scene_BG_loop[i] = warm_up_record_image(ASSET_DATA[2][i + 1])
            end
            image_UI_start_scene_shutter = warm_up_record_image(ASSET_DATA[2][51])
        end
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end
function order_load_start_scene_sub_UI(load_order)
    local switch =
    {
        [1] = function()
            -- resolution_text_in_config_resolution_sub_UI_only
            image_table_UI_start_scene_resolution_text = {}
            -- 1280_x_720
            image_table_UI_start_scene_resolution_text[0] = warm_up_record_image(ASSET_DATA[3][1])
            -- 1600_x_900
            image_table_UI_start_scene_resolution_text[1] = warm_up_record_image(ASSET_DATA[3][2])
            -- 1920_x_1080
            image_table_UI_start_scene_resolution_text[2] = warm_up_record_image(ASSET_DATA[3][3])
            -- 2560_x_1440
            image_table_UI_start_scene_resolution_text[3] = warm_up_record_image(ASSET_DATA[3][4])
            -- 3840_x_2160
            image_table_UI_start_scene_resolution_text[4] = warm_up_record_image(ASSET_DATA[3][5])
            -- select_res_text
            image_UI_start_scene_select_res_text = warm_up_record_image(ASSET_DATA[3][6])
            -- audio_text_in_config_audio_sub_UI_only
            image_UI_start_scene_config_audio_bar = warm_up_record_image(ASSET_DATA[3][7])
            image_UI_start_scene_config_audio_text = warm_up_record_image(ASSET_DATA[3][8])
            -- controller_text_in_config_controller_sub_UI_only
            image_UI_start_scene_controller_indi_text = warm_up_record_image(ASSET_DATA[3][9])
            -- global_config_menu_sub_UI_text
            image_UI_start_scene_config_menu_text = warm_up_record_image(ASSET_DATA[3][10])
            -- global_config_menu_sub_UI_shape
            image_UI_start_scene_bar_mark = warm_up_record_image(ASSET_DATA[3][11])
            -- record_text_in_config_record_sub_UI_only
            image_UI_start_scene_game_duration_text = warm_up_record_image(ASSET_DATA[3][12])
            image_table_UI_start_scene_game_duration_number = {}
            for i = 13,22 do
                image_table_UI_start_scene_game_duration_number[i - 13] = warm_up_record_image(ASSET_DATA[3][i])
            end
            image_UI_start_scene_time_indi_barcode = warm_up_record_image(ASSET_DATA[3][23])
        end
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end
function order_load_start_scene_audio(load_order)
    local switch =
    {
        [1] = function()
            load_start_scene_audio()
        end
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end

-- thread_table 线程table正常放
-- thread_amount 从1开始数有多少就是多少
-- thread_once_table thread_amount量的false
-- ASSET_DATA = {}
-- load_functions_table 每个thread对应一个 load function
-- CURRENT_ORDER_TABLE 全是 1
-- order_size_table 对应 每个具体的 load_function的 order最大值
function load_start_scene_prep()
    load_start_select_scene_require()
    THREAD_TABLE = {
        "threads/start_scene/start_scene_thread_1_main_UI.lua",
        "threads/start_scene/start_scene_thread_2_main_UI_BG.lua",
        "threads/start_scene/start_scene_thread_3_sub_UI.lua",
    }
    THREAD_AMOUNT = 3   -- 线程数目
    THREAD_ONCE_TABLE = {false,false,false} -- 如果有两个线程 = {false，false} 三个 = {false，false，false} 以此类推
    ASSET_DATA = {}   -- 保持为nil
    ORDER_LOAD_TABLE = {
        order_load_start_scene_main_UI,
        order_load_start_scene_main_UI_BG,
        order_load_start_scene_sub_UI,
    }    -- load function table
    CURRENT_ORDER_TABLE = {1,1,1}  -- 如果有两个线程 = {1，1} 三个 = {1，1，1} 以此类推
    ORDER_SIZE_TABLE = {2,1,1}  -- 每个load function的最大值
    LOAD_ONCE_TABLE = {false,false,false}   -- 如果有两个线程 = {false，false} 三个 = {false，false，false} 以此类推
    LOADING_FUNCTION_AMOUNT = 3 -- 和线程数相同

	NEXT_UPDATE_BLOCK = update_start_scene_ease_in
	NEXT_DRAW_BLOCK = draw_start_scene_main
    NEXT_PRESET = preset_start_scene
end

-- 分步骤将素材加载
function order_load_start_scene_main_UI(load_order)
    local switch = 
    {
        [1] = function()
            -- image_table以0开头 因为AE的帧数是以0开头设计的

            -- global use shape image
            image_UI_start_scene_global_dabo_trig = love.graphics.newImage(ASSET_DATA[1][1])
            image_UI_start_scene_global_type_in_mark = love.graphics.newImage(ASSET_DATA[1][2])

            -- up console text image
            -- single_person
            image_table_UI_start_scene_up_console_text = {}
            image_table_UI_start_scene_up_console_text[0] = love.graphics.newImage(ASSET_DATA[1][3])
            -- two_player
            image_table_UI_start_scene_up_console_text[1] = love.graphics.newImage(ASSET_DATA[1][4])
            -- adjustment_interface
            image_table_UI_start_scene_up_console_text[2] = love.graphics.newImage(ASSET_DATA[1][5])
            -- game_duretion
            image_table_UI_start_scene_up_console_text[3] = love.graphics.newImage(ASSET_DATA[1][6])
            -- close_this_game
            image_table_UI_start_scene_up_console_text[4] = love.graphics.newImage(ASSET_DATA[1][7])
            -- update_controller
            image_table_UI_start_scene_up_console_text[5] = love.graphics.newImage(ASSET_DATA[1][8])


            -- down console text image
            -- training_mode
            image_table_UI_start_scene_down_console_text = {}
            image_table_UI_start_scene_down_console_text[0] = love.graphics.newImage(ASSET_DATA[1][9])
            -- second_controller
            image_table_UI_start_scene_down_console_text[1] = love.graphics.newImage(ASSET_DATA[1][10])
            -- some_configuration
            image_table_UI_start_scene_down_console_text[2] = love.graphics.newImage(ASSET_DATA[1][11])
            -- time_management
            image_table_UI_start_scene_down_console_text[3] = love.graphics.newImage(ASSET_DATA[1][12])
            -- return_to_OS
            image_table_UI_start_scene_down_console_text[4] = love.graphics.newImage(ASSET_DATA[1][13])
            -- 2P_mode_available
            image_table_UI_start_scene_down_console_text[5] = love.graphics.newImage(ASSET_DATA[1][14])
            -- only_one_controller
            image_table_UI_start_scene_down_console_text[6] = love.graphics.newImage(ASSET_DATA[1][15])
            -- two_or_more_controller
            image_table_UI_start_scene_down_console_text[7] = love.graphics.newImage(ASSET_DATA[1][16])


            -- option text image
            -- training
            image_table_UI_start_scene_option_text = {}
            image_table_UI_start_scene_option_text[0] = love.graphics.newImage(ASSET_DATA[1][17])
            -- 2P_matching
            image_table_UI_start_scene_option_text[1] = love.graphics.newImage(ASSET_DATA[1][18])
            -- config
            image_table_UI_start_scene_option_text[2] = love.graphics.newImage(ASSET_DATA[1][19])
            -- record
            image_table_UI_start_scene_option_text[3] = love.graphics.newImage(ASSET_DATA[1][20])
            -- exit_to_OS
            image_table_UI_start_scene_option_text[4] = love.graphics.newImage(ASSET_DATA[1][21])


            -- option breath tag
            image_UI_start_scene_breath_tag = love.graphics.newImage(ASSET_DATA[1][22])


            -- main logo
            image_UI_start_scene_main_logo = love.graphics.newImage(ASSET_DATA[1][23])
            image_UI_start_scene_press_any_key = love.graphics.newImage(ASSET_DATA[1][24])

        end,
        [2] = function()
            load_start_scene_obj()
            load_start_scene_anim()
            load_start_scene_audio()
        end,
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
                image_table_UI_start_scene_BG_loop[i] = love.graphics.newImage(ASSET_DATA[2][i+1])
            end
            image_UI_start_scene_shutter = love.graphics.newImage(ASSET_DATA[2][51])
        end,
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end
function order_load_start_scene_sub_UI(load_order)
    local switch = 
    {
        [1] = function()

            -- resolution text in config resolution sub UI only
            image_table_UI_start_scene_resolution_text = {}
            -- 1280_x_720
            image_table_UI_start_scene_resolution_text[0] = love.graphics.newImage(ASSET_DATA[3][1])
            -- 1600_x_900
            image_table_UI_start_scene_resolution_text[1] = love.graphics.newImage(ASSET_DATA[3][2])
            -- 1920_x_1080
            image_table_UI_start_scene_resolution_text[2] = love.graphics.newImage(ASSET_DATA[3][3])
            -- 2560_x_1440
            image_table_UI_start_scene_resolution_text[3] = love.graphics.newImage(ASSET_DATA[3][4])
            -- 3840_x_2160
            image_table_UI_start_scene_resolution_text[4] = love.graphics.newImage(ASSET_DATA[3][5])
            -- select_res_text
            image_UI_start_scene_select_res_text = love.graphics.newImage(ASSET_DATA[3][6])


            -- audio text in config audio sub UI only
            image_UI_start_scene_config_audio_bar = love.graphics.newImage(ASSET_DATA[3][7])
            image_UI_start_scene_config_audio_text = love.graphics.newImage(ASSET_DATA[3][8])


            -- controller text in config controller sub UI only
            image_UI_start_scene_controller_indi_text = love.graphics.newImage(ASSET_DATA[3][9])


            -- global config menu sub UI text
            image_UI_start_scene_config_menu_text = love.graphics.newImage(ASSET_DATA[3][10])


            -- global config menu sub UI shape
            image_UI_start_scene_bar_mark = love.graphics.newImage(ASSET_DATA[3][11])


            -- record text in config record sub UI only
            image_UI_start_scene_game_duration_text = love.graphics.newImage(ASSET_DATA[3][12])
            image_table_UI_start_scene_game_duration_number = {}
            for i = 13,22 do
                image_table_UI_start_scene_game_duration_number[i-13] = love.graphics.newImage(ASSET_DATA[3][i])
            end
            image_UI_start_scene_time_indi_barcode = love.graphics.newImage(ASSET_DATA[3][23])

        end,
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end

-- require
function load_start_select_scene_require()
    require_all_in_folder("scenes_logic/start_scene")
    -- require("scenes_logic/start_scene/common_functions")
    -- require("scenes_logic/start_scene/draw_functions")
    -- require("scenes_logic/start_scene/init")
    -- require("scenes_logic/start_scene/load_function")
    -- require("scenes_logic/start_scene/main_blocks")
    -- require("scenes_logic/start_scene/state_machine")
    -- require("scenes_logic/start_scene/sub_blocks")
end
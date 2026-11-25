function load_char_select_scene_prep()
    load_char_select_scene_require()
    THREAD_TABLE = {
        "threads/char_select_scene/char_select_thread_1_char.lua",
        "threads/char_select_scene/char_select_thread_2_start_0_110f.lua",
        "threads/char_select_scene/char_select_thread_3_movie_cover.lua",
        "threads/char_select_scene/char_select_thread_4_audio_shader.lua"
    }
    THREAD_AMOUNT = 4 -- 线程数目
    THREAD_ONCE_TABLE = {false,false,false,false} -- 如果有两个线程 = {false，false} 三个 = {false，false，false} 以此类推
    ASSET_DATA = {} -- 保持为nil
    -- 函数名字符串:执行时再从 _G 取(prep 的时候这个场景的模块还在 require 队列里)
    ORDER_LOAD_TABLE = {
        "order_load_char_select_scene_UI_char",
        "order_load_char_select_scene_UI_start_0_110f",
        "order_load_char_select_scene_UI_movie_cover",
        "order_load_char_select_scene_audio_shader"
    } -- load_function_table
    CURRENT_ORDER_TABLE = {1,1,1,1} -- 如果有两个线程 = {1，1} 三个 = {1，1，1} 以此类推
    ORDER_SIZE_TABLE = {2,1,1,3} -- 每个load function的最大值
    LOAD_ONCE_TABLE = {false,false,false,false} -- 如果有两个线程 = {false，false} 三个 = {false，false，false} 以此类推
    LOADING_FUNCTION_AMOUNT = 4 -- 和线程数相同
	NEXT_UPDATE_BLOCK = "update_char_select_scene_ease_in_0f_36f"
	NEXT_DRAW_BLOCK = "draw_char_select_scene_ease_in_0f_36f"
    NEXT_PRESET = "preset_char_select_scene"
end
function load_char_select_scene_require()
    require_queue_push_folder("scenes/char_select_scene")
end
function order_load_char_select_scene_UI_char(load_order)
    local switch =
    {
        [1] = function()
            -- global_use_shape_image
            image_UI_char_select_scene_bar_mark = love.graphics.newImage(ASSET_DATA[1][1])
            image_UI_char_select_scene_char_select_left_alpha = love.graphics.newImage(ASSET_DATA[1][2])
            image_UI_char_select_scene_char_select_right_alpha = love.graphics.newImage(ASSET_DATA[1][3])
            image_UI_char_select_scene_control_method_L = love.graphics.newImage(ASSET_DATA[1][4])
            image_UI_char_select_scene_control_method_R = love.graphics.newImage(ASSET_DATA[1][5])
            image_UI_char_select_scene_ring = love.graphics.newImage(ASSET_DATA[1][6])
                -- char_icon_alpha_image_name
            image_table_UI_char_select_scene_char_icon_alpha = {}
            for i = 1,8 do
                image_table_UI_char_select_scene_char_icon_alpha[i] =
                love.graphics.newImage(ASSET_DATA[1]["char_icon_alpha"][i])
            end
            image_table_UI_char_select_scene_char_select_char = {}
            for i = 1,8 do
                image_table_UI_char_select_scene_char_select_char[i] =
                love.graphics.newImage(ASSET_DATA[1]["char_select_char"][i])
            end
            image_table_UI_char_select_scene_char_select_char_txt = {}
            for i = 1,8 do
                image_table_UI_char_select_scene_char_select_char_txt[i] =
                love.graphics.newImage(ASSET_DATA[1]["char_select_char_txt"][i])
            end
            image_table_UI_char_select_scene_number = {}
            for i = 1,10 do
                image_table_UI_char_select_scene_number[i - 1] = love.graphics.newImage(ASSET_DATA[1]["number"][i - 1])
            end
        end,
        [2] = function()
            load_char_select_scene_obj()
            load_char_select_scene_anim()
        end
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end
function order_load_char_select_scene_UI_start_0_110f(load_order)
    local switch =
    {
        [1] = function()
            image_sprite_sheet_UI_char_select_scene_start_0_110f =
            common_sprite_sheet_load(
                "asset/char_select_scene/texture/scene_start_0_110f.json",
                love.graphics.newImage(ASSET_DATA[2]["scene_start_0_110f"])
            )
        end
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end
function order_load_char_select_scene_UI_movie_cover(load_order)
    local switch =
    {
        [1] = function()
            image_sprite_sheet_UI_char_select_scene_movie_cover =
            common_sprite_sheet_load(
                "asset/char_select_scene/texture/movie_cover.json",love.graphics.newImage(ASSET_DATA[3]["movie_cover"])
            )
        end
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end
-- audio / shader:static SFX 的 SoundData 和 shader 源码由
-- threads/char_select_scene/char_select_thread_4_audio_shader.lua 在线程里读好
-- shader 每一步建一个,暖机由加载流程排到下一帧(load_char_select_scene_shader(i) 见 init.lua)
function order_load_char_select_scene_audio_shader(load_order)
    local switch =
    {
        [1] = function()
            load_char_select_scene_audio()
        end,
        [2] = function()
            load_char_select_scene_shader(1)
        end,
        [3] = function()
            load_char_select_scene_shader(2)
        end
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end

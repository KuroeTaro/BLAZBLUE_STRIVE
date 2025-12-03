-- thread_table 线程table正常放
-- thread_amount 从1开始数有多少就是多少
-- thread_once_table thread_amount量的false
-- ASSET_DATA = {}
-- load_functions_table 每个thread对应一个 load function
-- CURRENT_ORDER_TABLE 全是 1
-- order_size_table 对应 每个具体的 load_function的 order最大值
function load_game_scene_prep()
    local char_id_to_name = {
        "PLT",
        "AZR",
        "SSN",
        "TRM",
        "RGN",
        "SRK",
        "KGR",
        "TGR"
    }
    local LP_name = char_id_to_name[CHAR_SELECT_LR["L"]]
    local RP_name = char_id_to_name[CHAR_SELECT_LR["R"]]
    local stage_name = "alpha"
    local thread_LP_name = LP_name .. "_left"
    local thread_RP_name = RP_name .. "_right"
    local thread_stage_name = stage_name
    load_game_scene_require(LP_name,RP_name,stage_name)
    THREAD_TABLE = load_game_scene_thread_table(thread_LP_name,thread_RP_name,thread_stage_name)
    THREAD_AMOUNT = 8   -- 线程数目
    THREAD_ONCE_TABLE = {false,false,false,false,false,false,false,false} -- 如果有两个线程 = {false，false} 三个 = {false，false，false} 以此类推
    ASSET_DATA = {}   -- 保持为nil
    ORDER_LOAD_TABLE = {
        order_load_game_scene_common,
        order_load_game_scene_char_LP_frames,
        order_load_game_scene_char_RP_frames,
        order_load_game_scene_stage,
        order_load_game_scene_act,
        order_load_game_scene_HUD,
        order_load_game_scene_lets_dance,
        order_load_game_scene_VFX
    }    -- load function table
    CURRENT_ORDER_TABLE = {1,1,1,1,1,1,1,1}  -- 如果有两个线程 = {1，1} 三个 = {1，1，1} 以此类推
    ORDER_SIZE_TABLE = {2,10,10,11,12,13,14,18}  -- 每个load function的最大值
    LOAD_ONCE_TABLE = {false,false,false,false,false,false,false,false}   -- 如果有两个线程 = {false，false} 三个 = {false，false，false} 以此类推
    LOADING_FUNCTION_AMOUNT = 8 -- 和线程数相同

    -- GAME_MODE = 0
    -- TRAINING_MODE_CONFIG["announcer"] = true
    -- 训练模式
    if GAME_MODE == 0 then
        NEXT_UPDATE_BLOCK = update_game_scene_main_training
        NEXT_DRAW_BLOCK = draw_game_scene_main
        NEXT_PRESET = preset_game_scene_training
    -- 本地多人模式
    elseif GAME_MODE == 1 then
        NEXT_UPDATE_BLOCK = update_game_scene_main_local_match
        NEXT_DRAW_BLOCK = draw_game_scene_main
        NEXT_PRESET = preset_game_scene_match
    -- 线上多人模式
    elseif GAME_MODE == 2 then
        NEXT_UPDATE_BLOCK = update_game_scene_main_online_match
        NEXT_DRAW_BLOCK = draw_game_scene_synchronizing
        NEXT_PRESET = preset_game_scene_match
    end
end

function order_load_game_scene_common(load_order)
    local switch = 
    {
        [1] = function()
            load_game_scene_common_obj()
            load_game_scene_box_anchor_data()
            load_game_scene_common_anim()
            load_game_scene_common_audio()
            load_game_scene_common_shader()
            load_game_scene_audio_char_LP()
            load_game_scene_audio_char_RP()
            load_game_scene_shader_char_LP()
            load_game_scene_shader_char_RP()
        end,
        [2] = function()
            image_sprite_sheet_UI_game_scene_movie_cover = 
            sprite_sheet_load(
                "asset/game_scene/common/movie_cover.json",
                love.graphics.newImage(ASSET_DATA[1]["movie_cover_sprite_batch"])
            )
        end,
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
    
end
function order_load_game_scene_act(load_order)
    local switch = 
    {   
        [1] = function()end,
        [2] = function()end,
        [3] = function()end,
        [4] = function()end,
        [5] = function()end,
        [6] = function()end,
        [7] = function()end,
        [8] = function()end,
        [9] = function()end,
        [10] = function()end,
        [11] = function()end,
        [12] = function()
            image_sprite_sheet_announcer_game_scene_act_common = 
            sprite_sheet_load(
                "asset/game_scene/common/act_common.json",
                love.graphics.newImage(ASSET_DATA[5]["act_common_sprite_batch"])
            )

            image_sprite_sheet_table_announcer_game_scene_act_number = {}
            image_sprite_sheet_table_announcer_game_scene_act_number[1] = 
            sprite_sheet_load(
                "asset/game_scene/common/act_1.json",
                love.graphics.newImage(ASSET_DATA[5]["act_1_sprite_batch"])
            )
            image_sprite_sheet_table_announcer_game_scene_act_number[2] = 
            sprite_sheet_load(
                "asset/game_scene/common/act_2.json",
                love.graphics.newImage(ASSET_DATA[5]["act_2_sprite_batch"])
            )
            image_sprite_sheet_table_announcer_game_scene_act_number[3] = 
            sprite_sheet_load(
                "asset/game_scene/common/act_3.json",
                love.graphics.newImage(ASSET_DATA[5]["act_3_sprite_batch"])
            )

        end,
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end
function order_load_game_scene_HUD(load_order)
    local switch = 
    {
        [1] = function()end,
        [2] = function()end,
        [3] = function()end,
        [4] = function()end,
        [5] = function()end,
        [6] = function()end,
        [7] = function()end,
        [8] = function()end,
        [9] = function()end,
        [10] = function()end,
        [11] = function()end,
        [12] = function()end,
        [13] = function()
            image_HUD_game_scene_background_gauge = love.graphics.newImage(ASSET_DATA[6]["HUD_background_gauge"])
            
            image_sprite_sheet_HUD_game_scene_common = 
            sprite_sheet_load(
                "asset/game_scene/common/HUD/HUD_common.json",
                love.graphics.newImage(ASSET_DATA[6]["HUD_common_sprite_batch"])
            )

            image_sprite_sheet_announcer_game_scene_HUD_ease_in = 
            sprite_sheet_load(
                "asset/game_scene/common/HUD/HUD_ease_in.json",
                love.graphics.newImage(ASSET_DATA[6]["HUD_ease_in_sprite_batch"])
            )

        end,
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end
function order_load_game_scene_lets_dance(load_order)
    local switch = 
    {
        [1] = function()end,
        [2] = function()end,
        [3] = function()end,
        [4] = function()end,
        [5] = function()end,
        [6] = function()end,
        [7] = function()end,
        [8] = function()end,
        [9] = function()end,
        [10] = function()end,
        [11] = function()end,
        [12] = function()end,
        [13] = function()end,
        [14] = function()
            image_sprite_sheet_announcer_game_scene_lets_dance = 
            sprite_sheet_load(
                "asset/game_scene/common/lets_dance.json",
                love.graphics.newImage(ASSET_DATA[7]["lets_dance_sprite_batch"])
            )

        end,
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end
function order_load_game_scene_VFX(load_order)
    local switch = 
    {
        [1] = function()end,
        [2] = function()end,
        [3] = function()end,
        [4] = function()end,
        [5] = function()end,
        [6] = function()end,
        [7] = function()end,
        [8] = function()end,
        [9] = function()end,
        [10] = function()end,
        [11] = function()end,
        [12] = function()end,
        [13] = function()end,
        [14] = function()end,
        [15] = function()
            -- hit normal
            image_sprite_sheet_VFX_game_scene_air_blow = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/air_blow.json",
                love.graphics.newImage(ASSET_DATA[8]["air_blow_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_blast_ver0 = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/blast_ver0.json",
                love.graphics.newImage(ASSET_DATA[8]["blast_ver0_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_blast_ver0_counter = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/blast_ver0_counter.json",
                love.graphics.newImage(ASSET_DATA[8]["blast_ver0_counter_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_blast_ver1 = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/blast_ver1.json",
                love.graphics.newImage(ASSET_DATA[8]["blast_ver1_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_block_FD = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/block_FD.json",
                love.graphics.newImage(ASSET_DATA[8]["block_FD_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_block_ver0 = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/block_ver0.json",
                love.graphics.newImage(ASSET_DATA[8]["block_ver0_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_block_ver1 = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/block_ver1.json",
                love.graphics.newImage(ASSET_DATA[8]["block_ver1_sprite_batch"])
            )
            image_VFX_game_scene_counter_glow = love.graphics.newImage(ASSET_DATA[8]["counter_glow"])
            image_VFX_game_scene_FD_bubble = love.graphics.newImage(ASSET_DATA[8]["FD_bubble"])
            image_sprite_sheet_VFX_game_scene_partical_ver1_counter = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/partical_ver1_counter.json",
                love.graphics.newImage(ASSET_DATA[8]["partical_ver1_counter_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_slash_ver0 = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/slash_ver0.json",
                love.graphics.newImage(ASSET_DATA[8]["slash_ver0_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_slash_ver0_counter = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/slash_ver0_counter.json",
                love.graphics.newImage(ASSET_DATA[8]["slash_ver0_counter_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_slash_ver1 = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/slash_ver1.json",
                love.graphics.newImage(ASSET_DATA[8]["slash_ver1_sprite_batch"])
            )
        end,
        [16] = function()
            -- hit special
            image_sprite_sheet_VFX_game_scene_lighting_black_0 = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/special/lighting_black_0.json",
                love.graphics.newImage(ASSET_DATA[8]["lighting_black_0_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_lighting_black_1 = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/special/lighting_black_1.json",
                love.graphics.newImage(ASSET_DATA[8]["lighting_black_1_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_lighting_white_0 = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/special/lighting_white_0.json",
                love.graphics.newImage(ASSET_DATA[8]["lighting_white_0_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_lighting_white_1 = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/special/lighting_white_1.json",
                love.graphics.newImage(ASSET_DATA[8]["lighting_white_1_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_radial_black = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/special/radial_black.json",
                love.graphics.newImage(ASSET_DATA[8]["radial_black_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_radial_white = 
            sprite_sheet_load(
                "asset/game_scene/VFX/hit_VFX/special/radial_white.json",
                love.graphics.newImage(ASSET_DATA[8]["radial_white_sprite_batch"])
            )
        end,
        [17] = function()
            -- stage_VFX
                -- shockwave
            image_sprite_sheet_VFX_game_scene_shockwave = 
            sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/shockwave.json",
                love.graphics.newImage(ASSET_DATA[8]["shockwave"])
            )
                -- smoke
            image_sprite_sheet_VFX_game_scene_smoke_dash_burst = 
            sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/smoke/dash_burst.json",
                love.graphics.newImage(ASSET_DATA[8]["smoke_dash_burst"])
            )
            image_sprite_sheet_VFX_game_scene_smoke_horizontal_shot = 
            sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/smoke/horizontal_shot.json",
                love.graphics.newImage(ASSET_DATA[8]["smoke_horizontal_shot"])
            )
            image_sprite_sheet_VFX_game_scene_smoke_land_blow = 
            sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/smoke/land_blow.json",
                love.graphics.newImage(ASSET_DATA[8]["smoke_land_blow"])
            )
            image_sprite_sheet_VFX_game_scene_smoke_vertical_shot = 
            sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/smoke/vertical_shot.json",
                love.graphics.newImage(ASSET_DATA[8]["smoke_vertical_shot"])
            )
                -- spark
            image_sprite_sheet_VFX_game_scene_spark_dcc_burst = 
            sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/spark/dcc_burst.json",
                love.graphics.newImage(ASSET_DATA[8]["spark_dcc_burst"])
            )
                -- wallbreak
            image_sprite_sheet_VFX_game_scene_wallbreak = 
            sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/wallbreak.json",
                love.graphics.newImage(ASSET_DATA[8]["wallbreak"])
            )
        end,
        [18]  = function()
            -- overdrive
            image_sprite_sheet_VFX_game_scene_overdrive_airflow = 
            sprite_sheet_load(
                "asset/game_scene/VFX/overdrive_airflow.json",
                love.graphics.newImage(ASSET_DATA[8]["overdrive_airflow_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_overdrive_partical = 
            sprite_sheet_load(
                "asset/game_scene/VFX/overdrive_partical.json",
                love.graphics.newImage(ASSET_DATA[8]["overdrive_partical_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_UA_common = 
            sprite_sheet_load(
                "asset/game_scene/VFX/UA_common.json",
                love.graphics.newImage(ASSET_DATA[8]["UA_common_sprite_batch"])
            )

            -- burst
            image_sprite_sheet_VFX_game_scene_burst_back = 
            sprite_sheet_load(
                "asset/game_scene/VFX/burst_VFX/burst_back.json",
                love.graphics.newImage(ASSET_DATA[8]["burst_back_sprite_batch"])
            )
            image_sprite_sheet_VFX_game_scene_burst_front = 
            sprite_sheet_load(
                "asset/game_scene/VFX/burst_VFX/burst_front.json",
                love.graphics.newImage(ASSET_DATA[8]["burst_front_sprite_batch"])
            )
            image_VFX_game_scene_burst_ring = love.graphics.newImage(ASSET_DATA[8]["burst_ring"])

            -- HUD_VFX
            image_VFX_game_scene_HUD_punish = love.graphics.newImage(ASSET_DATA[8]["HUD_punish"])
                -- counter
            image_VFX_game_scene_HUD_counter_ver0_2 = love.graphics.newImage(ASSET_DATA[8]["HUD_counter_ver0_2"])
            image_VFX_game_scene_HUD_counter_ver3 = love.graphics.newImage(ASSET_DATA[8]["HUD_counter_ver3"])
                -- positive_bonus
            image_VFX_game_scene_HUD_positive_bouns_LP = love.graphics.newImage(ASSET_DATA[8]["HUD_positive_bouns_LP"])
            image_VFX_game_scene_HUD_positive_bouns_RP = love.graphics.newImage(ASSET_DATA[8]["HUD_positive_bouns_RP"])
        end,
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end

function load_game_scene_require(LP_name,RP_name,stage_name)
    require_all_in_folder("scenes_logic/game_scene/_common")
    require("scenes_logic/game_scene/characters/" .. LP_name .. "/left")
    require("scenes_logic/game_scene/characters/" .. RP_name .. "/right")
    require("scenes_logic/game_scene/characters/" .. LP_name .. "/_anim")
    require("scenes_logic/game_scene/characters/" .. RP_name .. "/_anim")
    require("scenes_logic/game_scene/characters/" .. LP_name .. "/_projectile")
    require("scenes_logic/game_scene/characters/" .. RP_name .. "/_projectile")
    require("scenes_logic/game_scene/characters/" .. LP_name .. "/_VFX")
    require("scenes_logic/game_scene/characters/" .. RP_name .. "/_VFX")
    require("scenes_logic/game_scene/stage/" .. stage_name)
end

function load_game_scene_thread_table(LP_name,RP_name,stage_name)
    local res_table = {}
    table.insert(
        res_table,
        "threads/game_scene/_common.lua"
    )
    table.insert(
        res_table,
        "threads/game_scene/characters/" .. LP_name .. ".lua"
    )
    table.insert(
        res_table,
        "threads/game_scene/characters/" .. RP_name .. ".lua"
    )
    table.insert(
        res_table,
        "threads/game_scene/stage/" .. stage_name .. ".lua"
    )
    table.insert(
        res_table,
        "threads/game_scene/act.lua"
    )
    table.insert(
        res_table,
        "threads/game_scene/HUD.lua"
    )
    table.insert(
        res_table,
        "threads/game_scene/lets_dance.lua"
    )
    table.insert(
        res_table,
        "threads/game_scene/VFX.lua"
    )
    return res_table
end
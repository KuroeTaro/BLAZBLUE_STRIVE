-- LP -> RP
-- ASSET_DATA[2] -> ASSET_DATA[3]
-- "L" -> "R"
-- obj_char_game_scene_char_LP = {0, 0, 0, 1, 1, 1, 0, 0} -> obj_char_game_scene_char_RP = {0, 0, 0, 1, -1, 1, 0, 0}
-- obj_char_game_scene_char_LP["x"] = -320 -> obj_char_game_scene_char_RP["x"] = 320

function load_game_scene_obj_char_LP()
    -- x y z opacity sx sy r f
    obj_char_game_scene_char_LP = {0, 0, 0, 1, 1, 1, 0, 0} -- obj[1-8]都为图形上的数据 obj[8]为图形上的帧数
    obj_char_game_scene_char_LP["x"] = -320
    obj_char_game_scene_char_LP["y"] = 365
    obj_char_game_scene_char_LP["f"] = -1 -- obj["f"] 逻辑上的帧数
    obj_char_game_scene_char_LP["FCT"] = {0,0,0,0,0,0,0,0}
    obj_char_game_scene_char_LP["LCT"] = {0,0,0,0,0,0,0,0}
    obj_char_game_scene_char_LP["LCD"] = {0,0,0,0,0,0,0,0}

    -- state
    obj_char_game_scene_char_LP["player_side"] = "L"
    obj_char_game_scene_char_LP["type"] = "character"
    obj_char_game_scene_char_LP["state"] = "before_ease_in"
    obj_char_game_scene_char_LP["state_cache"] = "none"
    obj_char_game_scene_char_LP["sprite_sheet_state"] = "5_stand_idle"
    obj_char_game_scene_char_LP["height_state"] = "stand" -- stand crouch air OTG
    obj_char_game_scene_char_LP["hit_type_state"] = "none" -- none strike throw burst projectile
    obj_char_game_scene_char_LP["hit_guard_type_state"] = "none" -- none all low high
    obj_char_game_scene_char_LP["hurt_state"] = "idle" -- idle unblock punish counter GP parry
    obj_char_game_scene_char_LP["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
    obj_char_game_scene_char_LP["move_state"] = "none" -- none startup active recovery

        -- input
    obj_char_game_scene_char_LP["direction_input"] = 0
    obj_char_game_scene_char_LP["direction_input_cache"] = 0
    obj_char_game_scene_char_LP["SP_intput_dealy_countdown"] = 0
    obj_char_game_scene_char_LP["startup_frame"] = 0
    obj_char_game_scene_char_LP["active_frame"] = 0
    obj_char_game_scene_char_LP["recovery_frame"] = 0
    obj_char_game_scene_char_LP["frame_adv"] = 0
    obj_char_game_scene_char_LP["last_hitstop_frame"] = 0

    obj_char_game_scene_char_LP["input_sys_state"] = "none" -- none save load
    obj_char_game_scene_char_LP["input_sys_cache"] = {}
    init_input_sys_cache(obj_char_game_scene_char_LP)

        -- hit_hurt_block_animation
    obj_char_game_scene_char_LP["hit_damage"] = 0
    obj_char_game_scene_char_LP["hit_heat_gain"] = 0
    obj_char_game_scene_char_LP["hit_wallbreak_damage"] = 0
    obj_char_game_scene_char_LP["hurt_heat_gain"] = 0
    obj_char_game_scene_char_LP["blocked_heat_gain"] = 0
    obj_char_game_scene_char_LP["block_heat_gain"] = 0
    obj_char_game_scene_char_LP["block_risk_gauge_gain"] = 0
    obj_char_game_scene_char_LP["FD_block_heat_drain"] = 0
    obj_char_game_scene_char_LP["stand_hurt_animation"] = nil
    obj_char_game_scene_char_LP["stand_block_animation"] = nil
    obj_char_game_scene_char_LP["crouch_hurt_animation"] = nil
    obj_char_game_scene_char_LP["crouch_block_animation"] = nil
    obj_char_game_scene_char_LP["air_hurt_animation"] = nil
    obj_char_game_scene_char_LP["air_block_animation"] = nil
    obj_char_game_scene_char_LP["OTG_hurt_animation"] = nil

    obj_char_game_scene_char_LP["self_wallbounce_hurt_animation"] = nil
    obj_char_game_scene_char_LP["self_groundbounce_hurt_animation"] = nil

    obj_char_game_scene_char_LP["self_knockdown_animation"] = nil
    obj_char_game_scene_char_LP["self_knockdown_recovery_animation"] = nil

    obj_char_game_scene_char_LP["current_animation"] = nil
    obj_char_game_scene_char_LP["current_animation_length"] = 0

    obj_char_game_scene_char_LP["hit_cancel"] = false -- 取消链
    obj_char_game_scene_char_LP["idle_cancel"] = false -- 取消链

    obj_char_game_scene_char_LP["strike_active"] = false -- 防止在同一动作的active多次触发
    obj_char_game_scene_char_LP["throw_active"] = false -- 防止在同一动作的active多次触发

    obj_char_game_scene_char_LP["strike_inv"] = false
    obj_char_game_scene_char_LP["strike_inv_countdown"] = 0
    obj_char_game_scene_char_LP["throw_inv"] = false
    obj_char_game_scene_char_LP["throw_inv_countdown"] = 0
    obj_char_game_scene_char_LP["projectile_inv"] = false
    obj_char_game_scene_char_LP["projectile_inv_countdown"] = 0
    obj_char_game_scene_char_LP["burst_inv"] = false
    obj_char_game_scene_char_LP["burst_inv_countdown"] = 0

    obj_char_game_scene_char_LP["hit_function"] = function() end
    obj_char_game_scene_char_LP["hurt_function"] = function() end
    obj_char_game_scene_char_LP["parry_function"] = function() end
    obj_char_game_scene_char_LP["hit_counter_ver_function"] = function() end

        -- oroboros
    obj_char_game_scene_char_LP["oroboros_state"] = "idle"
    obj_char_game_scene_char_LP["oroboros_anchor_pos"] = {168,210}
    obj_char_game_scene_char_LP["oroboros_animation"] = nil
    obj_char_game_scene_char_LP["oroboros_8"] = 0 -- obj[oroboros_8]匕首图形上的帧数
    obj_char_game_scene_char_LP["oroboros_f"] = 0 -- obj[oroboros_8]匕首逻辑上的帧数

    -- state_number
    obj_char_game_scene_char_LP["velocity"] = {0,0}
    obj_char_game_scene_char_LP["velocity_debug"] = {0,0}
    obj_char_game_scene_char_LP["velocity_cache"] = {0,0}
    obj_char_game_scene_char_LP["gravity"] = 2.5
    obj_char_game_scene_char_LP["friction"] = 1 -- 包括地面移动和空中dash的水平阻力
    
    obj_char_game_scene_char_LP["health_gauge"] = {12000, 12000, 12000, "fade_off"}
    obj_char_game_scene_char_LP["heat_gauge"] = {0.0, 200.0} -- 0.0 - 200.0
    obj_char_game_scene_char_LP["ability_gauge"] = {600.0, 600.0} -- 0.0 - 600.0
    obj_char_game_scene_char_LP["overdrive_gauge"] = {600.0, 600.0, "off"} -- 0.0 - 600.0
    obj_char_game_scene_char_LP["overdrive_timer"] = {0,0,0,0} -- 0f 00:00 
    obj_char_game_scene_char_LP["overdrive_drain_speed"] = 24
    obj_char_game_scene_char_LP["overdrive_disabling"] = false
    obj_char_game_scene_char_LP["overdrive_disabling_countdown"] = 0
    obj_char_game_scene_char_LP["risk_gauge"] = {0.0, 300.0}-- 0.0 - 300.0
    obj_char_game_scene_char_LP["wallbreak_gauge"] = {0.0, 300.0, false}-- 0.0 - 300.0

    obj_char_game_scene_char_LP["heat_penalty"] = false
    obj_char_game_scene_char_LP["heat_penalty_countdown"] = 0
    obj_char_game_scene_char_LP["ability_recover_pause"] = false
    obj_char_game_scene_char_LP["ability_recover_pause_countdown"] = 0
    obj_char_game_scene_char_LP["positive_bonus"] = false
    obj_char_game_scene_char_LP["positive_bonus_countdown"] = 0

    obj_char_game_scene_char_LP["horizontal_velocity_correction"] = 1
    obj_char_game_scene_char_LP["gravity_correction"] = 1
    obj_char_game_scene_char_LP["damage_correction"] = 1

    obj_char_game_scene_char_LP["air_move"] = {}
    obj_char_game_scene_char_LP["air_move"]["jump"] = {1,1}
    obj_char_game_scene_char_LP["air_move"]["air_dash"] = {1,1}

    -- game_speed
    obj_char_game_scene_char_LP["game_speed"] = 1
    obj_char_game_scene_char_LP["game_speed_subframe"] = 1
    obj_char_game_scene_char_LP["game_speed_abnormal_realtime_countdown"] = 0 -- 只能是game_speed的倍数
    obj_char_game_scene_char_LP["hit_hurt_blockstop_countdown"] = 0
    obj_char_game_scene_char_LP["hit_hurt_block_slowdown_countdown"] = 0

    -- collide
    obj_char_game_scene_char_LP["pushbox"] = {0, -185, 121.5, 370}
    obj_char_game_scene_char_LP["hitbox_table"] = {}
    obj_char_game_scene_char_LP["hurtbox_table"] = {{0, -215, 170, 430},{0, -455, 100, 50}}
    obj_char_game_scene_char_LP["collision_move_available"] = {1,1}
    obj_char_game_scene_char_LP["collision_test_ground_height_offset"] = 0 -- 用于检测和地面碰撞的

    -- sub_obj
    obj_char_game_scene_char_LP["projectile_table"] = {}
    obj_char_game_scene_char_LP["VFX_HUD_table"] = {}
    obj_char_game_scene_char_LP["VFX_front_table"] = {}
    obj_char_game_scene_char_LP["VFX_back_table"] = {}
    obj_char_game_scene_char_LP["black_overlay_table"] = {}

    obj_char_game_scene_char_LP["hit_VFX_insert_function"] = nil
    obj_char_game_scene_char_LP["hit_VFX_insert_function_argument"] = nil
    obj_char_game_scene_char_LP["hit_SFX"] = nil
    obj_char_game_scene_char_LP["counter_VFX_insert_function"] = nil
    obj_char_game_scene_char_LP["counter_VFX_insert_function_argument"] = nil
    obj_char_game_scene_char_LP["counter_SFX"] = nil
    obj_char_game_scene_char_LP["block_VFX_insert_function"] = nil
    obj_char_game_scene_char_LP["block_SFX"] = nil

    -- special
    obj_char_game_scene_char_LP["oroboros_bite_pos"] = {0,0}
    obj_char_game_scene_char_LP["oroboros_aim_pos"] = {0,0}
    
    -- draw_correction
    obj_char_game_scene_char_LP[8] = 0
    obj_char_game_scene_char_LP["anchor_pos"] = {215,510}
    obj_char_game_scene_char_LP["contrast"] = 1
    obj_char_game_scene_char_LP["brightness"] = 0
    obj_char_game_scene_char_LP["brightness_const"] = 0
    obj_char_game_scene_char_LP["brightness_overdrive_const"] = 0
    obj_char_game_scene_char_LP["hurtstop_wiggle_x"] = 0
    obj_char_game_scene_char_LP["hurtstop_wiggle_y"] = 0
    obj_char_game_scene_char_LP["hurtstop_wiggle_x_animation"] = nil
    obj_char_game_scene_char_LP["hurtstop_wiggle_y_animation"] = nil

    -- smoke spawn pos
        -- attack button(not need to record in obj_char)
        -- move button(not need to record in obj_char)
            -- jump
            -- jump land
            -- dash
            -- dash stop
            -- any special move
        -- stand_block
        -- crouch_block
        -- stand_hurt_high/mid/low
        -- crouch_hurt
        -- launched/semi_launched_high/mid/low
        -- launched_land/semi_launched_land_high/mid/low
        -- no need
            -- air_hurt_high/mid/low
            -- air_launched/semi_launched_high/mid/low
            -- air_launched_land/semi_launched_land_high/mid/low

    obj_char_game_scene_char_LP["camera_x_shake_anim"] = nil
    obj_char_game_scene_char_LP["camera_y_shake_anim"] = nil
    obj_char_game_scene_char_LP["camera_enclosing_anim"] = nil
end
function order_load_game_scene_char_LP_frames(load_order)
    local PLAYER_ASSET_DATA = ASSET_DATA[2]
    local switch = 
    {
        [1] = function()
            -- UNIVERSAL 1 2 3
            image_sprite_sheet_table_char_game_scene_LP = {}

            local load_name_table = {
                "0_crouch_hurt",
                "0_general_hurt_falled_knockout",
                "0_general_hurt_hard_knockdown_down",
                "0_general_hurt_hard_knockdown_head_down",
                "0_general_hurt_hard_knockdown_up",
                "0_general_hurt_hard_knockdown_wallstick_ground",
                "0_general_hurt_hard_recovery_down",
                "0_general_hurt_hard_recovery_up",
                "0_general_hurt_hard_recovery_wallstick_ground",
                "0_general_hurt_lanuched_float",
                "0_general_hurt_lanuched_groundbounce",
                "0_general_hurt_lanuched_high",
                "0_general_hurt_lanuched_low",
                "0_general_hurt_lanuched_mid_hori_heavy",
                "0_general_hurt_lanuched_mid_up",
                "0_general_hurt_lanuched_rolling",
                "0_general_hurt_lanuched_rotate",
                "0_general_hurt_lanuched_wallbounce"
            }
            for i, v in ipairs(load_name_table) do
                image_sprite_sheet_table_char_game_scene_LP[v] = 
                sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/UNIVERSAL/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v])
                )
            end 
        end,
        [2] = function()
            local load_name_table = {
                "0_general_hurt_semi_lanuched_mid",
                "0_general_hurt_semi_lanuched_rotate",
                "0_general_hurt_soft_knockdown_wallstick_air",
                "0_general_hurt_soft_recovery_ground",
                "0_general_hurt_soft_recovery_wallstick_air",
                "0_stand_hurt_high",
                "0_stand_hurt_low",
                "0_stand_hurt_mid",
                "1_2_3_crouch",
                "1_2_3_crouch_to_stand_idle",
                "1_2_3_crouch_turn",
                "1_4_7_air_block",
                "1_4_7_air_block_guard_crash",
                "1_crouch_block",
                "1_crouch_block_guard_crash",
                "4_stand_block_guard_crash",
                "4_stand_block_high",
                "4_stand_block_mid"
            }
            for i, v in ipairs(load_name_table) do
                image_sprite_sheet_table_char_game_scene_LP[v] = 
                sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/UNIVERSAL/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v])
                )
            end 
        end,
        [3] = function()
            local load_name_table = {
                "4_walk",
                "4_walk_to_stand_idle",
                "4dash_air_backdash",
                "4dash_backdash",
                "5_stand_idle",
                "5_stand_dash_skid",
                "5_stand_turn",
                "6_walk",
                "6_walk_to_stand_idle",
                "6dash_air_dash",
                "6dash_dash",
                "7_8_9[Launcher]_follow_jump",
                "7_8_9_jump_air_to_stand_idle",
                "7_8_9_pre_jump",
                "7_jump",
                "8_jump",
                "9_jump"
            }
            for i, v in ipairs(load_name_table) do
                image_sprite_sheet_table_char_game_scene_LP[v] = 
                sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/UNIVERSAL/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v])
                )
            end 
        end,
        [4] = function()
            -- ATTACK 4 5 6
            local load_name_table = {
                "burst_overdrive_rc",
                "5P",
                "cS",
                "2Launcher",
            }
            for i, v in ipairs(load_name_table) do
                image_sprite_sheet_table_char_game_scene_LP[v] = 
                sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/ATTACK/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v])
                )
            end 
        end,
        [5] = function()
            local load_name_table = {
            }
            for i, v in ipairs(load_name_table) do
                image_sprite_sheet_table_char_game_scene_LP[v] = 
                sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/ATTACK/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v])
                )
            end 
        end,
        [6] = function()
            local load_name_table = {
            }
            for i, v in ipairs(load_name_table) do
                image_sprite_sheet_table_char_game_scene_LP[v] = 
                sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/ATTACK/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v])
                )
            end 
        end,
        [7] = function()
            -- whiff_VFX 7 8 9
            image_sprite_sheet_VFX_game_scene_LP = {}

            local load_name_table = {
                "5P",
                "cS",
                -- 2Launcher
            }
            for i, v in ipairs(load_name_table) do
                image_sprite_sheet_VFX_game_scene_LP[v.."_whiff_VFX"] = 
                sprite_sheet_load(
                    "asset/game_scene/VFX/whiff_VFX/TRM/".."TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v.."_whiff_VFX"])
                )
            end 
        end,
        [8] = function()
            local load_name_table = {
            }
            for i, v in ipairs(load_name_table) do
                image_sprite_sheet_VFX_game_scene_LP[v.."_whiff_VFX"] = 
                sprite_sheet_load(
                    "asset/game_scene/VFX/whiff_VFX/TRM/"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v.."_whiff_VFX"])
                )
            end 
        end,
        [9] = function()
            local load_name_table = {
            }
            for i, v in ipairs(load_name_table) do
                image_sprite_sheet_VFX_game_scene_LP[v.."_whiff_VFX"] = 
                sprite_sheet_load(
                    "asset/game_scene/VFX/whiff_VFX/TRM/"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v.."_whiff_VFX"])
                )
            end 
        end,
        [10] = function()
            -- special
            image_sprite_sheet_VFX_game_scene_LP_overdrive_badge = 
            sprite_sheet_load(
                "asset/game_scene/VFX/overdrive_badge/TRM_overdrive_badge.json",
                love.graphics.newImage(PLAYER_ASSET_DATA["overdrive_badge"])
            )
        end,
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end
function load_game_scene_anim_char_LP()
    local obj_char = obj_char_game_scene_char_LP
    obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
    init_character_anim_with(obj_char,obj_char["current_animation"])
end
function load_game_scene_box_anchor_data_LP()
    local stand_pushbox = {0, -185, 121.5, 370}
    local crouch_pushbox = {0, -142.5, 121.5, 285}
    local air_pushbox = {0, -100, 121.5, 200}
    local OTG_pushbox = {0, -65, 121.5, 130}

    local stand_hurtbox = {{0, -220, 210, 440},{0, -465, 120, 50}}
    local crouch_hurtbox = {{0, -155, 220, 310}}
    local air_hurtbox = {{0, -140, 220, 320}}
    local OTG_hurtbox = {{0, -75, 475, 150}}

    obj_hurtboxs_data_game_scene_char_LP = {}
    obj_pushboxs_data_game_scene_char_LP = {}
    obj_anchor_data_game_scene_char_LP = {}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP = {}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"] = {}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"] = {}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"] = {}

    -- obj_hurtboxs_data_game_scene_char_LP["__"] = {}
    -- obj_hurtboxs_data_game_scene_char_LP["__"][0] = {{__, __, __, __}}
    -- obj_pushboxs_data_game_scene_char_LP["__"] = {}
    -- obj_pushboxs_data_game_scene_char_LP["__"][0] = 
    -- obj_anchor_data_game_scene_char_LP["__"] = {__, __}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][0] = stand_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][1] = crouch_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][10] = OTG_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][0] = {{0, -215, 206, 430}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][1] = {{0, -195, 220, 390}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][2] = {{0, -186, 230, 372}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][3] = {{0, -181, 240, 362}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][4] = {{0, -180, 245, 360}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][7] = {{0, -178, 256, 356}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][8] = {{0, -170, 324, 340}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][9] = {{0, -150, 362, 300}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][10] = OTG_hurtbox
    obj_anchor_data_game_scene_char_LP["0_general_hurt_falled_knockout"] = {330, 456}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["0_general_hurt_falled_knockout"] = {-370,-150}

    obj_pushboxs_data_game_scene_char_LP["0_stand_hurt_high"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_stand_hurt_high"][0] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_high"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_high"][0] = {stand_hurtbox[1],{0, -465, 120, 50}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_high"][1] = {{0, -215, 220, 430},{0, -450, 120, 40}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_high"][2] = {{0, -210, 240, 420}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_high"][3] = {{0, -200, 250, 400}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_high"][4] = {{0, -190, 260, 380}}
    obj_anchor_data_game_scene_char_LP["0_stand_hurt_high"] = {208, 495}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["0_stand_hurt_high"] = {600,-195}

    obj_pushboxs_data_game_scene_char_LP["0_stand_hurt_low"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_stand_hurt_low"][0] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_low"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_low"][0] = {stand_hurtbox[1],{27, -465, 120, 50}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_low"][1] = {{0, -215, 220, 430},{44, -450, 120, 40}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_low"][2] = {{0, -210, 240, 420}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_low"][3] = {{0, -200, 250, 400}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_low"][4] = {{0, -190, 260, 380}}
    obj_anchor_data_game_scene_char_LP["0_stand_hurt_low"] = {249, 495}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["0_stand_hurt_low"] = {600,-195}

    obj_pushboxs_data_game_scene_char_LP["0_stand_hurt_mid"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_stand_hurt_mid"][0] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_mid"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_mid"][0] = {stand_hurtbox[1],{27, -465, 120, 50}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_mid"][1] = {{0, -215, 220, 430},{44, -440, 120, 20}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_mid"][2] = {{0, -210, 240, 420}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_mid"][3] = {{0, -200, 250, 400}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_mid"][4] = {{0, -190, 260, 380}}
    obj_anchor_data_game_scene_char_LP["0_stand_hurt_mid"] = {205, 475}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["0_stand_hurt_mid"] = {600,-195}

    obj_pushboxs_data_game_scene_char_LP["0_crouch_hurt"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_crouch_hurt"][0] = crouch_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_crouch_hurt"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_crouch_hurt"][0] = crouch_hurtbox
    obj_hurtboxs_data_game_scene_char_LP["0_crouch_hurt"][1] = {{0, -157.5, 230, 307.5}}
    obj_hurtboxs_data_game_scene_char_LP["0_crouch_hurt"][2] = {{0, -155, 240, 305}}
    obj_hurtboxs_data_game_scene_char_LP["0_crouch_hurt"][3] = {{0, -152.5, 250, 302.5}}
    obj_hurtboxs_data_game_scene_char_LP["0_crouch_hurt"][4] = {{0, -150, 260, 300}}
    obj_anchor_data_game_scene_char_LP["0_crouch_hurt"] = {297, 420}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["0_crouch_hurt"] = {600,-195}

    obj_pushboxs_data_game_scene_char_LP["4_stand_block_guard_crash"] = {}
    obj_pushboxs_data_game_scene_char_LP["4_stand_block_guard_crash"][0] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["4_stand_block_guard_crash"] = {}
    obj_hurtboxs_data_game_scene_char_LP["4_stand_block_guard_crash"][0] = stand_hurtbox
    obj_anchor_data_game_scene_char_LP["4_stand_block_guard_crash"] = {223, 510}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["4_stand_block_guard_crash"] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["4_stand_block_guard_crash"] = {-305,-495}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["4_stand_block_guard_crash"] = {-430,-595}

    obj_pushboxs_data_game_scene_char_LP["4_stand_block_high"] = {}
    obj_pushboxs_data_game_scene_char_LP["4_stand_block_high"][0] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["4_stand_block_high"] = {}
    obj_hurtboxs_data_game_scene_char_LP["4_stand_block_high"][0] = stand_hurtbox
    obj_anchor_data_game_scene_char_LP["4_stand_block_high"] = {150, 510}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["4_stand_block_high"] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["4_stand_block_high"] = {-305,-545}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["4_stand_block_high"] = {-430,-645}

    obj_pushboxs_data_game_scene_char_LP["4_stand_block_mid"] = {}
    obj_pushboxs_data_game_scene_char_LP["4_stand_block_mid"][0] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["4_stand_block_mid"] = {}
    obj_hurtboxs_data_game_scene_char_LP["4_stand_block_mid"][0] = stand_hurtbox
    obj_anchor_data_game_scene_char_LP["4_stand_block_mid"] = {175, 510}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["4_stand_block_mid"] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["4_stand_block_mid"] = {-305,-440}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["4_stand_block_mid"] = {-430,-540}

    obj_pushboxs_data_game_scene_char_LP["1_crouch_block"] = {}
    obj_pushboxs_data_game_scene_char_LP["1_crouch_block"][0] = crouch_pushbox
    obj_hurtboxs_data_game_scene_char_LP["1_crouch_block"] = {}
    obj_hurtboxs_data_game_scene_char_LP["1_crouch_block"][0] = crouch_hurtbox
    obj_anchor_data_game_scene_char_LP["1_crouch_block"] = {295, 275}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["1_crouch_block"] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["1_crouch_block"] = {-305,-375}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["1_crouch_block"] = {-430,-475}

    obj_pushboxs_data_game_scene_char_LP["1_crouch_block_guard_crash"] = {}
    obj_pushboxs_data_game_scene_char_LP["1_crouch_block_guard_crash"][0] = crouch_pushbox
    obj_hurtboxs_data_game_scene_char_LP["1_crouch_block_guard_crash"] = {}
    obj_hurtboxs_data_game_scene_char_LP["1_crouch_block_guard_crash"][0] = crouch_hurtbox
    obj_anchor_data_game_scene_char_LP["1_crouch_block_guard_crash"] = {340, 297}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["1_crouch_block_guard_crash"] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["1_crouch_block_guard_crash"] = {-305,-375}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["1_crouch_block_guard_crash"] = {-430,-475}

    obj_pushboxs_data_game_scene_char_LP["1_4_7_air_block"] = {}
    obj_pushboxs_data_game_scene_char_LP["1_4_7_air_block"][0] = air_pushbox
    obj_pushboxs_data_game_scene_char_LP["1_4_7_air_block"][6] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block"] = {}
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block"][0] = air_hurtbox
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block"][6] = {{0,-190,220,380}}
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block"][7] = {{0,-195,205,390}}
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block"][8] = {{0,-200,200,400}}
    obj_anchor_data_game_scene_char_LP["1_4_7_air_block"] = {340, 410}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["1_4_7_air_block"] = {-355,-160}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["1_4_7_air_block"] = {-255,-365}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["1_4_7_air_block"] = {-380,-465}

    obj_pushboxs_data_game_scene_char_LP["1_4_7_air_block_guard_crash"] = {}
    obj_pushboxs_data_game_scene_char_LP["1_4_7_air_block_guard_crash"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block_guard_crash"] = {}
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block_guard_crash"][0] = air_hurtbox
    obj_anchor_data_game_scene_char_LP["1_4_7_air_block_guard_crash"] = {370, 310}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["1_4_7_air_block_guard_crash"] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["1_4_7_air_block_guard_crash"] = {-255,-390}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["1_4_7_air_block_guard_crash"] = {-380,-490}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_knockdown_wallstick_air"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_knockdown_wallstick_air"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_soft_knockdown_wallstick_air"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_soft_knockdown_wallstick_air"][0] = {{0, -120, 240, 350}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_soft_knockdown_wallstick_air"] = {295, 355}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"][0] = air_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"][2] = OTG_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"][0] = {{0, -132, 376, 264}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"][2] = {{0, -105, 430, 210}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"][6] = OTG_hurtbox
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"] = {320, 330}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["0_general_hurt_hard_knockdown_down"] = {-367,-165}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"][0] = air_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"][2] = OTG_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"][0] = {{0, -155, 280, 310}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"][2] = {{0, -105, 430, 210}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"][6] = OTG_hurtbox
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"] = {321, 335}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["0_general_hurt_hard_knockdown_head_down"] = {-357,-168}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"][0] = air_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"][2] = OTG_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"][0] = {{0, -132, 376, 264}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"][2] = {{0, -105, 430, 210}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"][6] = OTG_hurtbox
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"] = {240, 285}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["0_general_hurt_hard_knockdown_up"] = {-390,-154}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"][0] = air_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"][3] = crouch_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"][4] = OTG_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"][0] = {{0, -120, 240, 350}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"][3] = {{0, -150, 170, 300}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"][4] = {{0, -112.5, 220, 225}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"] = {295, 355}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["0_general_hurt_hard_knockdown_wallstick_ground"] = {-343,-128}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_down"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_down"][0] = crouch_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_down"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_down"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_recovery_down"] = {323, 509}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_up"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_up"][0] = crouch_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_up"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_up"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_recovery_up"] = {248, 535}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_wallstick_ground"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_wallstick_ground"][0] = crouch_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_wallstick_ground"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_wallstick_ground"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_recovery_wallstick_ground"] = {248, 535}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"][0] = OTG_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"][4] = crouch_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"][5] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"] = {305, 690}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["0_general_hurt_soft_recovery_ground"] = {}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["0_general_hurt_soft_recovery_ground"][0] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["smoke_spawn_anchor_pos"]["0_general_hurt_soft_recovery_ground"][1] = {-335,-160}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_wallstick_air"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_wallstick_air"][0] = nil
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_wallstick_air"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_wallstick_air"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_soft_recovery_wallstick_air"] = {340, 410}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_float"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_float"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_float"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_float"][0] = {{0, -60, 320, 420}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_float"][1] = {{0, -60, 280, 360}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_float"][3] = {{0, -60, 300, 330}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_float"][5] = {{0, -60, 310, 300}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_float"][7] = {{0, -60, 350, 290}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_float"][9] = {{0, -60, 410, 280}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_float"][11] = {{0, -60, 410, 300}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_lanuched_float"] = {269, 275}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_groundbounce"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_groundbounce"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_groundbounce"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_groundbounce"][0] = {{0, -75, 440, 300}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_groundbounce"][2] = {{0, -80, 470, 290}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_groundbounce"][3] = {{0, -130, 430, 290}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_groundbounce"][4] = {{0, -135, 400, 290}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_lanuched_groundbounce"] = {270, 290}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_high"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_high"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_high"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_high"][0] = {{0, -60, 320, 420}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_high"][1] = {{0, -60, 400, 330}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_high"][3] = {{0, -60, 426, 310}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_high"][5] = {{0, -75, 440, 300}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_high"][7] = {{0, -80, 470, 290}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_high"][8] = {{0, -130, 430, 290}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_high"][9] = {{0, -135, 400, 290}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_lanuched_high"] = {270, 290}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_low"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_low"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_low"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_low"][0] = {{0, -96, 330, 360}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_low"][1] = {{0, -107, 375, 320}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_low"][2] = {{0, -110, 460, 220}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_lanuched_low"] = {300, 330}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_hori_heavy"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_hori_heavy"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_hori_heavy"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_hori_heavy"][0] = {{0, -106, 260, 350}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_hori_heavy"][1] = {{0, -100, 355, 261}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_lanuched_mid_hori_heavy"] = {186, 286}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_up"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_up"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_up"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_up"][0] = {{-12, -215, 320, 420}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_up"][1] = {{-12, -255, 240, 500}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_up"][3] = {{-12, -230, 280, 460}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_up"][4] = {{-12, -205, 340, 420}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_up"][5] = {{-12, -195, 340, 400}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_up"][6] = {{-12, -220, 335, 350}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_mid_up"][7] = {{-12, -265, 240, 550}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_lanuched_mid_up"] = {282, 550}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_rolling"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_rolling"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_rolling"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_rolling"][0] = {{0, -50, 370, 380}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_lanuched_rolling"] = {215, 265}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_rotate"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_rotate"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_rotate"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_rotate"][0] = {{0, -74, 400, 390}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_lanuched_rotate"] = {225, 290}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_wallbounce"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_lanuched_wallbounce"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_wallbounce"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_wallbounce"][0] = {{0, -68, 270, 350}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_wallbounce"][1] = {{0, -68, 250, 480}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_wallbounce"][2] = {{0, -68, 330, 450}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_lanuched_wallbounce"][3] = {{0, -68, 374, 380}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_lanuched_wallbounce"] = {233, 317}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_mid"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_mid"][0] = air_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_mid"][4] = crouch_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_mid"][6] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_mid"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_mid"][0] = {{0, -145, 285, 450}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_mid"][1] = {{0, -100, 285, 390}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_mid"][3] = {{0, -190, 270, 380}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_mid"][4] = {{0, -182.5, 250, 365}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_mid"][6] = {{0, -175, 255, 350}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_mid"][7] = {{0, -205, 215, 410}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_semi_lanuched_mid"] = {275, 515}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_rotate"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_rotate"][0] = stand_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_rotate"][12] = OTG_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_rotate"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_rotate"][0] = {{0, -225, 220, 450}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_rotate"][1] = {{0, -240, 220, 480}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_rotate"][2] = {{0, -252.5, 220, 505}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_rotate"][10] = {{0, -230, 270, 460}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_rotate"][11] = {{0, -190, 350, 380}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_lanuched_rotate"][12] = {{0, -150, 380, 300}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_semi_lanuched_rotate"] = {255, 525}
end
function load_game_scene_audio_char_LP()
    audio_SFX_game_scene_LP = {}
    audio_SFX_game_scene_LP["5P"] = {1}
    audio_SFX_game_scene_LP["5P"]["LCT"] = {0}
    audio_SFX_game_scene_LP["5P"]["LCD"] = {0}
    audio_SFX_game_scene_LP["5P"]["audio"] = love.audio.newSource("asset/char_select_scene/audio/SFX_confirm_1.mp3","static")

    update_SFX_VOLUME(audio_SFX_game_scene_LP["5P"])
end
function load_game_scene_shader_char_LP()
    -- no shader for now
end

-- 更新和状态机
function update_game_scene_char_LP()
    state_machine_char_game_scene_char_LP()
    state_machine_char_game_scene_char_LP_oroboros()
end
function state_machine_char_game_scene_char_LP()
    -- 拉后最高优先级 然后是拉下 然后是拉前 然后是跳
    -- 然后是方向组合拳脚 普通拳脚 从轻到重
    -- 然后是必杀
    -- 然后是超必杀
    -- 最后是od和霸
    -- SP + 拉后 = 拉盾
    -- INPUT_SYS_COMMAND_TABLE = {
    --     "up","down","left","right",
    --     "P","S","HS","K",
    --     "SP","Launcher","back","start",
    --     "RC","dash","burst","UA"
    -- }

    -- sp + Launcher 普通投

    local input = INPUT_SYS_CURRENT_COMMAND_STATE["L"]
    local obj_char = obj_char_game_scene_char_LP
    local switch = {
        ["before_ease_in"] = function()
            character_animator(obj_char,obj_char["current_animation"])
        end,

        ["active_FD_block"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_active_FD_block(input,obj_char)
        end,
        ["active_FD_block_to_idle"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_active_FD_block_to_idle(input,obj_char)
        end,
        ["block"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_block(input,obj_char)
        end,
        ["hurt"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_hurt(input,obj_char)
        end,

        ["hitstop"] = function()
            common_update_game_scene_char_hitstop_countdown(obj_char)
            state_machine_char_game_scene_char_LP_input_sys_cache()
            state_gate_game_scene_char_LP_from_hitstop(input,obj_char)
        end,
        ["hurtstop"] = function()
            common_update_game_scene_char_blockstop_hurtstop_countdown(obj_char)
            state_machine_char_game_scene_char_LP_input_sys_cache()
            state_gate_game_scene_char_LP_from_hurtstop(input,obj_char)
        end,
        ["blockstop"] = function()
            common_update_game_scene_char_blockstop_hurtstop_countdown(obj_char)
            state_machine_char_game_scene_char_LP_input_sys_cache()
            state_gate_game_scene_char_LP_from_blockstop(input,obj_char)
        end,

        ["wallbreak_transporting_entering"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_wallbreak_transporting_entering(input,obj_char)
        end,
        ["wallbreak_transporting_exiting"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_wallbreak_transporting_exiting(input,obj_char)
        end,

        ["knockdown"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_knockdown(input,obj_char)
        end,
        ["knockdown_recovery"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_knockdown_recovery(input,obj_char)
        end,

        ["knockout"] = function()
            character_animator(obj_char,obj_char["current_animation"])
        end,

        ["1_2_3_crouch"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_1_2_3_crouch(input,obj_char)
        end,
        ["1_2_3_crouch_turn"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_1_2_3_crouch_turn(input,obj_char)
        end,
        ["1_2_3_crouch_to_stand_idle"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_1_2_3_crouch_to_stand_idle(input,obj_char)
        end,
        ["5_stand_idle"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char)
        end,
        ["5_stand_turn"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        end,
        ["5_stand_dash_skid"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_5_stand_dash_skid(input,obj_char)
        end,
        ["4_walk"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4_walk(input,obj_char)
        end,
        ["4_walk_to_stand_idle"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4_walk_to_stand_idle(input,obj_char)
        end,
        ["6_walk"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_6_walk(input,obj_char)
        end,
        ["6_walk_to_stand_idle"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_6_walk_to_stand_idle(input,obj_char)
        end,

        ["7_8_9_jump_air_to_stand_idle"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char)
        end,
        ["7_8_9_jump_air"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char)
        end,
        ["7_8_9_pre_jump"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_7_8_9_pre_jump(input,obj_char)
        end,
        
        ["4dash_backdash"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4dash_backdash(input,obj_char)
        end,
        ["4dash_air_backdash"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4dash_air_backdash(input,obj_char)
        end,
        ["6dash_dash"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_6dash_dash(input,obj_char)
        end,
        ["6dash_air_dash"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_6dash_air_dash(input,obj_char)
        end,
        ["6dash_dash_cancel"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_6dash_dash_cancel(input,obj_char)
        end,
        
        ["RC_blue_rc"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_RC_blue_rc(input,obj_char)
        end,
        ["RC_purple_rc"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_RC_purple_rc(input,obj_char)
        end,
        ["RC_red_rc"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_RC_red_rc(input,obj_char)
        end,
        ["RC_yellow_rc"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_RC_yellow_rc(input,obj_char)
        end,

        ["burst_overdrive"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_burst_overdrive(input,obj_char)
        end,
        ["burst_burst"] = function()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_burst_burst(input,obj_char)
        end,

        ["2P"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_2P(input,obj_char)
        end,
        ["6P"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_6P(input,obj_char)
        end,
        ["5P"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_5P(input,obj_char)
        end,
        ["2K"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_2K(input,obj_char)
        end,
        ["6K"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_6K(input,obj_char)
        end,
        ["5K"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_5K(input,obj_char)
        end,
        ["2S"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_2S(input,obj_char)
        end,
        ["6S"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_6S(input,obj_char)
        end,
        ["cS"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_cS(input,obj_char)
        end,
        ["fS"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_fS(input,obj_char)
        end,
        ["2Launcher"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_2Launcher(input,obj_char)
        end,
        ["46Launcher"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_46Launcher(input,obj_char)
        end,
        ["5Launcher"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_5Launcher(input,obj_char)
        end,
        ["5Launcher_hold"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_5Launcher_hold(input,obj_char)
        end,

        ["jP"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_jP(input,obj_char)
        end,
        ["jK"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_jK(input,obj_char)
        end,
        ["j2K"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_j2K(input,obj_char)
        end,
        ["jS"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_jS(input,obj_char)
        end,
        ["j2S"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_j2S(input,obj_char)
        end,
        ["j46Launcher"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_j46Launcher(input,obj_char)
        end,
        ["j5Launcher"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_j5Launcher(input,obj_char)
        end,

        ["4sp_P"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4sp_P(input,obj_char)
        end,
        ["6sp_P"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_6sp_P(input,obj_char)
        end,
        ["4sp_K"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4sp_K(input,obj_char)
        end,
        ["6sp_K"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_6sp_K(input,obj_char)
        end,
        ["4sp_S"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4sp_S(input,obj_char)
        end,
        ["4sp_S_4dash"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4sp_S_4dash(input,obj_char)
        end,
        ["4sp_S_6dash"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4sp_S_6dash(input,obj_char)
        end,
        ["4sp_S_S"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4sp_S_S(input,obj_char)
        end,
        ["4sp_S_H"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4sp_S_H(input,obj_char)
        end,
        ["4sp_S_2Launcher"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4sp_S_2Launcher(input,obj_char)
        end,
        ["4sp_S_6Launcher"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4sp_S_6Launcher(input,obj_char)
        end,
        ["4sp_S_5Launcher"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4sp_S_5Launcher(input,obj_char)
        end,
        ["6sp_S"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_6sp_S(input,obj_char)
        end,
        ["sp_H"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_sp_H(input,obj_char)
        end,
        ["sp_H_P"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_sp_H_P(input,obj_char)
        end,
        ["sp_H_K"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_sp_H_K(input,obj_char)
        end,
        ["sp_H_S"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_sp_H_S(input,obj_char)
        end,
        ["sp_H_H"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_sp_H_H(input,obj_char)
        end,

        ["jsp_S"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_jsp_S(input,obj_char)
        end,
        ["jsp_H"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_jsp_H(input,obj_char)
        end,
        ["jsp_H_P"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_jsp_H_P(input,obj_char)
        end,
        ["jsp_H_K"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_jsp_H_K(input,obj_char)
        end,
        ["jsp_H_S"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_jsp_H_S(input,obj_char)
        end,
        ["jsp_H_H"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_jsp_H_H(input,obj_char)
        end,

        ["4UA"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4UA(input,obj_char)
        end,
        ["6UA"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_6UA(input,obj_char)
        end,
        ["5UA"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_5UA(input,obj_char)
        end,
        ["4sp_S_5UA"] = function()
            state_machine_char_game_scene_char_LP_input_sys_cache()
            character_animator(obj_char,obj_char["current_animation"])
            state_gate_game_scene_char_LP_from_4sp_S_5UA(input,obj_char)
        end,
    }
    update_game_scene_char_LP_uncommon_countdown()
    local this_function = switch[obj_char["state"]]
    if this_function then this_function() end
end
function state_machine_char_game_scene_char_LP_oroboros()
    local obj = obj_char_game_scene_char_LP
    local switch = {
        ["idle"] = function()
            obj["hurt_state"] = obj["hurt_state_target"]
        end,
        ["ready"] = function()

        end,
        ["steady"] = function()

        end,
    }
    local this_function = switch[obj["oroboros_state"]]
    if this_function then this_function() end
end
function state_machine_char_game_scene_char_LP_input_sys_cache()
    local obj_char = obj_char_game_scene_char_LP
    local input = INPUT_SYS_CURRENT_COMMAND_STATE["L"]
    local switch = {
        ["none"] = function()
        end,
        ["save"] = function()
            if input["up"] == "Pressing" then
                obj_char["input_sys_cache"]["up"] = true
                obj_char["input_sys_cache"]["down"] = false
            elseif input["down"] == "Pressing" then
                obj_char["input_sys_cache"]["up"] = false
                obj_char["input_sys_cache"]["down"] = true
            end
            if input["left"] == "Pressing" then
                obj_char["input_sys_cache"]["left"] = true
                obj_char["input_sys_cache"]["right"] = false
            elseif input["right"] == "Pressing" then
                obj_char["input_sys_cache"]["left"] = false
                obj_char["input_sys_cache"]["right"] = true
            end
            if input["P"] == "Pressing" then
                obj_char["input_sys_cache"]["P"] = true
                obj_char["input_sys_cache"]["S"] = false
                obj_char["input_sys_cache"]["K"] = false
                obj_char["input_sys_cache"]["HS"] = false
                obj_char["input_sys_cache"]["Launcher"] = false
            elseif input["S"] == "Pressing" then
                obj_char["input_sys_cache"]["P"] = false
                obj_char["input_sys_cache"]["S"] = true
                obj_char["input_sys_cache"]["K"] = false
                obj_char["input_sys_cache"]["HS"] = false
                obj_char["input_sys_cache"]["Launcher"] = false
            elseif input["K"] == "Pressing" then
                obj_char["input_sys_cache"]["P"] = false
                obj_char["input_sys_cache"]["S"] = false
                obj_char["input_sys_cache"]["K"] = true
                obj_char["input_sys_cache"]["HS"] = false
                obj_char["input_sys_cache"]["Launcher"] = false
            elseif input["HS"] == "Pressing" then
                obj_char["input_sys_cache"]["P"] = false
                obj_char["input_sys_cache"]["S"] = false
                obj_char["input_sys_cache"]["K"] = false
                obj_char["input_sys_cache"]["HS"] = true
                obj_char["input_sys_cache"]["Launcher"] = false
            elseif input["Launcher"] == "Pressing" then
                obj_char["input_sys_cache"]["P"] = false
                obj_char["input_sys_cache"]["S"] = false
                obj_char["input_sys_cache"]["K"] = false
                obj_char["input_sys_cache"]["HS"] = false
                obj_char["input_sys_cache"]["Launcher"] = true
            end
            if input["RC"] == "Pressing" then
                obj_char["input_sys_cache"]["RC"] = true
            end
            if input["burst"] == "Pressing" then
                obj_char["input_sys_cache"]["burst"] = true
            end
            if input["dash"] == "Pressing" then
                obj_char["input_sys_cache"]["dash"] = true
            end
            if input["UA"] == "Pressing" then
                obj_char["input_sys_cache"]["UA"] = true
            end
            if input["correction_up"] == "Pressing" then
                obj_char["input_sys_cache"]["correction_up"] = true
                obj_char["input_sys_cache"]["correction_down"] = false
            elseif input["correction_down"] == "Pressing" then
                obj_char["input_sys_cache"]["correction_up"] = false
                obj_char["input_sys_cache"]["correction_down"] = true
            end
            if input["correction_left"] == "Pressing" then
                obj_char["input_sys_cache"]["correction_left"] = true
                obj_char["input_sys_cache"]["correction_right"] = false
            elseif input["correction_right"] == "Pressing" then
                obj_char["input_sys_cache"]["correction_left"] = false
                obj_char["input_sys_cache"]["correction_right"] = true
            end
        end,
        ["load"] = function()
            for i=1,20 do
                if obj_char["input_sys_cache"][INPUT_SYS_COMMAND_TABLE[i]] then
                    input[INPUT_SYS_COMMAND_TABLE[i]] = "Pressing"
                end
            end
            obj_char["input_sys_state"] = "none"
            init_input_sys_cache(obj_char)
        end,
    }
    local this_function = switch[obj_char["input_sys_state"]]
    if this_function then this_function() end
end

-- 状态机连接门
function state_gate_game_scene_char_LP_common_ground_idle_to_move(input,obj_char)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    -- _burst_overdrive
    if test_input_sys_press(input["burst"]) and obj_char["overdrive_gauge"][1] == obj_char["overdrive_gauge"][2] then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        if obj_char["hit_cancel"] then
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_burst_overdrive_ground(obj_char,70-3)
        elseif obj_char["state"] == "block_stop" then
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_burst_overdrive_ground(obj_char,70-23)
        else
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_burst_overdrive_ground(obj_char,70-13)
        end
        init_character_anim_with(obj_char,obj_char["current_animation"])
        common_game_scene_overdrive_load_camera_anim(obj_char)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        obj_char["state"] = "burst_overdrive"
        return true
    end
    -- _RC_blue_rc
    -- _active_FD_block
    -- _4UA
    -- _6UA
    -- _5UA
    -- _4sp_P
    -- _6sp_P
    -- _4sp_K
    -- _6sp_K
    -- _4sp_S
    -- _6sp_S
    -- _sp_H
    -- _2P
    -- _6P
    -- _5P
    if test_input_sys_press(input["P"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5P(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5P"
        return true
    end
    -- _2K
    -- _6K
    -- _5K
    -- _2S
    -- _6S
    -- _cS
    if test_input_sys_press(input["S"]) 
    and math.abs(obj_char["x"]-obj_char_other_side["x"]) + obj_char["velocity"][1] * 0.9
    * ((obj_char["x"]-obj_char_other_side["x"]) / math.abs(obj_char["x"]-obj_char_other_side["x"])) 
    * 10 < 395.0 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_cS(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "cS"
        return true
    end
    -- _fS
    -- _2Launcher
    if test_input_sys_press(input["Launcher"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_2Launcher(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "2Launcher"
        return true
    end
    -- _46Launcher
    -- _5Launcher
    -- _4dash_backdash
    if obj_char["direction_input"] == 4 and test_input_sys_press(input["dash"]) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_4dash_backdash(input,obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "4dash_backdash"
        return true
    end
    -- _6dash_dash
    if (obj_char["direction_input"] == 5 or obj_char["direction_input"] == 6) 
    and test_input_sys_press(input["dash"]) 
    and obj_char["state"] ~= "6dash_dash" then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_6dash_dash(input,obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6dash_dash"
        return true
    end
    return false
end
function state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char)
end
function state_gate_game_scene_char_LP_common_air_idle_to_move(input,obj_char)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    -- _burst_overdrive
    -- _RC_blue_rc
    -- _active_FD_block
    -- _jsp_S
    -- _jsp_H
    -- _jP
    -- _jK
    -- _j2K
    -- _jS
    -- _j2S
    -- _j46Launcher
    -- _j5Launcher
    -- _4dash_air_backdash
    if obj_char["y"] < 120 and (obj_char["direction_input"] == 4 or obj_char["direction_input"] == 1)
    and test_input_sys_press_or_hold(input["dash"]) and obj_char["air_move"]["air_dash"][1] > 0 then
        obj_char["air_move"]["jump"][1] = 0
        obj_char["air_move"]["air_dash"][1] = math.max(math.min(obj_char["air_move"]["air_dash"][1]-1,obj_char["air_move"]["air_dash"][2]),0)
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_4dash_air_backdash(input,obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "4dash_air_backdash"
        return true
    end
    -- _6dash_air_dash
    if (not common_game_scene_check_crouch_direction(obj_char)) and obj_char["y"] < 120
    and test_input_sys_press(input["dash"]) and obj_char["air_move"]["air_dash"][1] > 0 then
        obj_char["air_move"]["jump"][1] = 0
        obj_char["air_move"]["air_dash"][1] = math.max(math.min(obj_char["air_move"]["air_dash"][1]-1,obj_char["air_move"]["air_dash"][2]),0)
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_6dash_air_dash(input,obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6dash_air_dash"
        return true
    end
    return false
end
function state_gate_game_scene_char_LP_common_air_to_special_move(input,obj_char)
end
function state_gate_game_scene_char_LP_common_ground_idle_to_move_hold_ver(input,obj_char)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    -- _burst_overdrive
    if test_input_sys_press_or_hold(input["burst"]) and obj_char["overdrive_gauge"][1] == obj_char["overdrive_gauge"][2] then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        if obj_char["hit_cancel"] then
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_burst_overdrive_ground(obj_char,70-3)
        elseif obj_char["state"] == "block_stop" then
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_burst_overdrive_ground(obj_char,70-23)
        else
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_burst_overdrive_ground(obj_char,70-13)
        end
        init_character_anim_with(obj_char,obj_char["current_animation"])
        common_game_scene_overdrive_load_camera_anim(obj_char)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        obj_char["state"] = "burst_overdrive"
        return true
    end
    -- _RC_blue_rc
    -- _active_FD_block
    -- _4UA
    -- _6UA
    -- _5UA
    -- _4sp_P
    -- _6sp_P
    -- _4sp_K
    -- _6sp_K
    -- _4sp_S
    -- _6sp_S
    -- _sp_H
    -- _2P
    -- _6P
    -- _5P
    if test_input_sys_press_or_hold(input["P"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5P(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5P"
        return true
    end
    -- _2K
    -- _6K
    -- _5K
    -- _2S
    -- _6S
    -- _cS
    if test_input_sys_press_or_hold(input["S"]) 
    and math.abs(obj_char["x"]-obj_char_other_side["x"]) + obj_char["velocity"][1]
    * ((obj_char["x"]-obj_char_other_side["x"]) / math.abs(obj_char["x"]-obj_char_other_side["x"])) 
    * 10 < 300.0 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_cS(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "cS"
        return true
    end
    -- _fS
    -- _2Launcher
    if test_input_sys_press_or_hold(input["Launcher"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_2Launcher(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "2Launcher"
        return true
    end
    -- _46Launcher
    -- _5Launcher
    -- _4dash_backdash
    if obj_char["direction_input"] == 4 and test_input_sys_press_or_hold(input["dash"]) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_4dash_backdash(input,obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "4dash_backdash"
        return true
    end
    -- _6dash_dash
    if (obj_char["direction_input"] == 5 or obj_char["direction_input"] == 6) 
    and test_input_sys_press_or_hold(input["dash"]) 
    and obj_char["state"] ~= "6dash_dash" then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_6dash_dash(input,obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6dash_dash"
        return true
    end
    return false
end

function state_gate_game_scene_char_LP_from_active_FD_block(input,obj_char)
end
function state_gate_game_scene_char_LP_from_block(input,obj_char)
    if not common_game_scene_get_character_animation_end(obj_char) then
        return
    end
    -- _5_stand_idle
    if obj_char["height_state"] == "stand" then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)   
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_idle"
        state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char)
        return
    end
    -- _1_2_3_crouch
    if obj_char["height_state"] == "crouch" then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch"
        obj_char["f"] = 4
        character_animator(obj_char,obj_char["current_animation"])
        return
    end
end
function state_gate_game_scene_char_LP_from_hurt(input,obj_char)
    if obj_char["height_state"] == "air" then
        if (obj_char["collision_move_available"][1] == 0 or obj_char["collision_move_available"][2] == 0) 
        and obj_char["self_wallbounce_hurt_animation"] ~= nil then
            obj_char["current_animation"] = obj_char["self_wallbounce_hurt_animation"]
            init_character_anim_with(obj_char,obj_char["current_animation"])
        elseif test_char_on_ground(obj_char) and obj_char["self_groundbounce_hurt_animation"] ~= nil then
            obj_char["current_animation"] = obj_char["self_groundbounce_hurt_animation"]
            init_character_anim_with(obj_char,obj_char["current_animation"])
        elseif test_char_on_ground(obj_char) then
            obj_char["y"] = 365
            obj_char["state"] = obj_char["state_cache"]
            if obj_char["state"] == "knockdown" then
                obj_char["current_animation"] = obj_char["self_knockdown_animation"] 
                init_character_anim_with(obj_char,obj_char["current_animation"])
            elseif obj_char["state"] == "knockdown_recovery" then
                obj_char["current_animation"] = obj_char["self_knockdown_recovery_animation"] 
                init_character_anim_with(obj_char,obj_char["current_animation"])
            end
        end
        return
    end
    if common_game_scene_get_character_animation_end(obj_char) then
        if obj_char["height_state"] == "stand" then
            -- _5_stand_idle
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)   
            init_character_anim_with(obj_char,obj_char["current_animation"])
            obj_char["state"] = "5_stand_idle"
            state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char)
        elseif obj_char["height_state"] == "crouch" then
            -- _1_2_3_crouch
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
            init_character_anim_with(obj_char,obj_char["current_animation"])
            obj_char["state"] = "1_2_3_crouch"
            obj_char["f"] = 4
            character_animator(obj_char,obj_char["current_animation"])
        elseif obj_char["height_state"] == "OTG" then
            assert("此受伤动画为OTG状态中结束了")
        end
        return
    end
end

function state_gate_game_scene_char_LP_from_hitstop(input,obj_char)
    -- _[any_sp_hit_state_saved_in_state_cache]
    if obj_char["hit_hurt_blockstop_countdown"] <= 0 then
        obj_char["state"] = obj_char["state_cache"]
        obj_char["velocity"] = obj_char["velocity_cache"]
        return
    end
end
function state_gate_game_scene_char_LP_from_blockstop(input,obj_char)
    -- _block
    if obj_char["hit_hurt_blockstop_countdown"] <= 0 then
        obj_char["state"] = obj_char["state_cache"]
        obj_char["velocity"] = obj_char["velocity_cache"]
        return
    end
end
function state_gate_game_scene_char_LP_from_hurtstop(input,obj_char)
    -- _hurtstop
    if obj_char["hit_hurt_blockstop_countdown"] <= 0 then
        obj_char["state"] = obj_char["state_cache"]
        obj_char["velocity"] = obj_char["velocity_cache"]
        return
    end
end

function state_gate_game_scene_char_LP_from_wallbreak_transporting_entering(input,obj_char)
end
function state_gate_game_scene_char_LP_from_wallbreak_transporting_exiting(input,obj_char)
end

function state_gate_game_scene_char_LP_from_knockdown(input,obj_char)
    -- _knockdown_recover
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = obj_char["self_knockdown_recovery_animation"]
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "knockdown_recovery"
        return true
    end
end
function state_gate_game_scene_char_LP_from_knockdown_recovery(input,obj_char)
    -- _5_stand_idle
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end

function state_gate_game_scene_char_LP_from_1_2_3_crouch(input,obj_char)
    -- _1_2_3_crouch_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch_turn"
        common_update_game_scene_input_direction(obj_char)
        state_gate_game_scene_char_LP_from_1_2_3_crouch_turn(input,obj_char)
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_idle_to_move(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache"] = obj_char["direction_input"]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- _1_2_3_crouch_to_stand_idle
    if obj_char["direction_input"] == 5 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch_to_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_1_2_3_crouch_turn(input,obj_char)
    -- _init_if_changed_again
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        common_update_game_scene_input_direction(obj_char)
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_idle_to_move(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache"] = obj_char["direction_input"]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- _1_2_3_crouch_to_stand_idle
    if obj_char["direction_input"] == 5 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch_to_stand_idle"
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch"
        obj_char["f"] = 4
        character_animator(obj_char,obj_char["current_animation"])
        return true
    end
end
function state_gate_game_scene_char_LP_from_1_2_3_crouch_to_stand_idle(input,obj_char)
    -- _5_stand_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_turn"
        state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        common_update_game_scene_input_direction(obj_char)
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_idle_to_move(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache"] = obj_char["direction_input"]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- _5_stand_idle
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char)
    -- _5_stand_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_turn"
        state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        common_update_game_scene_input_direction(obj_char)
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_idle_to_move(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache"] = obj_char["direction_input"]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
end
function state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
    -- _init_if_changed_again
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        common_update_game_scene_input_direction(obj_char)
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_idle_to_move(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache"] = obj_char["direction_input"]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- _5_stand_idle
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_5_stand_dash_skid(input,obj_char)
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_idle_to_move(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache"] = obj_char["direction_input"]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _5_stand_idle
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_4_walk(input,obj_char)
    -- _5_stand_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_turn"
        common_update_game_scene_input_direction(obj_char)
        state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_idle_to_move(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache"] = obj_char["direction_input"]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- _4_walk_to_stand_idle
    if obj_char["direction_input"] == 5 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_4_walk_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "4_walk_to_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_4_walk_to_stand_idle(input,obj_char)
    -- _5_stand_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_turn"
        common_update_game_scene_input_direction(obj_char)
        state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_idle_to_move(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache"] = obj_char["direction_input"]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- _5_stand_idle
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_idle"
        obj_char["f"] = 20
        character_animator(obj_char,obj_char["current_animation"])
        return true
    end
end
function state_gate_game_scene_char_LP_from_6_walk(input,obj_char)
    -- _5_stand_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_turn"
        common_update_game_scene_input_direction(obj_char)
        state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_idle_to_move(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache"] = obj_char["direction_input"]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk_to_stand_idle
    if obj_char["direction_input"] == 5 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_6_walk_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6_walk_to_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_6_walk_to_stand_idle(input,obj_char)
    -- _5_stand_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_turn"
        common_update_game_scene_input_direction(obj_char)
        state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_idle_to_move(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache"] = obj_char["direction_input"]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- _5_stand_idle
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end

function state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char)
    -- _RC_blue_rc
    if test_input_sys_press(input["RC"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
            common_update_game_scene_input_direction(obj_char)
        end
        if test_input_sys_press(input["dash"]) then
            obj_char["velocity"] = {5.0*obj_char[5], 0}
        elseif test_input_sys_press(input["up"]) then
            obj_char["velocity"] = {0, -5.0}
        elseif test_input_sys_press(input["left"]) then
            obj_char["velocity"] = {-5.0, 0}
        elseif test_input_sys_press(input["right"]) then
            obj_char["velocity"] = {5.0, 0}
        end
        obj_char["current_animation"] = load_game_scene_anim_char_common_RC_blue_rc(obj_char)
        obj_char["state"] = "RC_blue_rc"
        init_character_anim_with(obj_char,obj_char["current_animation"])
        return true
    end
    -- _common_ground_idle_to_move
    if obj_char["idle_cancel"] then
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
            init_character_anim_with(obj_char,obj_char["current_animation"])
            common_update_game_scene_input_direction(obj_char)
        end
        if state_gate_game_scene_char_LP_common_ground_idle_to_move_hold_ver(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char)
    -- _7_8_9_jump_air_to_stand_idle
    if test_char_on_ground(obj_char) and obj_char["velocity"][2] > 0.0 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_jump_air_to_stand_idle"
        return true
    end
    -- _RC_blue_rc
    if test_input_sys_press(input["RC"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
            common_update_game_scene_input_direction(obj_char)
        end
        if test_input_sys_press(input["dash"]) then
            obj_char["velocity"] = {5.0*obj_char[5], 0}
        elseif test_input_sys_press(input["up"]) then
            obj_char["velocity"] = {0, -5.0}
        elseif test_input_sys_press(input["left"]) then
            obj_char["velocity"] = {-5.0, 0}
        elseif test_input_sys_press(input["right"]) then
            obj_char["velocity"] = {5.0, 0}
        end
        obj_char["current_animation"] = load_game_scene_anim_char_common_RC_blue_rc(obj_char)
        obj_char["state"] = "RC_blue_rc"
        init_character_anim_with(obj_char,obj_char["current_animation"])
        return true
    end
    -- _common_air_idle_to_move
    if obj_char["idle_cancel"] then
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        if state_gate_game_scene_char_LP_common_air_idle_to_move(input,obj_char) then
            return true
        end
    end
    -- _7_8_9_jump_air(second_air_jump)
    if obj_char["air_move"]["jump"][1] > 0 and test_input_sys_press(input["up"]) and obj_char["idle_cancel"] then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        common_update_game_scene_input_direction(obj_char)
        -- air_move
        obj_char["air_move"]["jump"][1] = math.max(math.min(obj_char["air_move"]["jump"][1]-1,obj_char["air_move"]["jump"][2]),0)
        obj_char["air_move"]["air_dash"][1] = 0
        -- velocity_cache
        if obj_char["direction_input"] == 7 then
            obj_char["velocity_cache"][1] = obj_char["velocity_cache"][1]*0.1 - obj_char[5]*11.5
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"7_jump",{202,568},nil,-45.0)
        elseif obj_char["direction_input"] == 8 then
            obj_char["velocity_cache"][1] = obj_char["velocity_cache"][1]*0.25
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,585},0,-45.0)
        elseif obj_char["direction_input"] == 9 then
            obj_char["velocity_cache"][1] = obj_char["velocity_cache"][1]*0.1 + obj_char[5]*11.5
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"9_jump",{300,500},nil,-45.0)
        end
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_jump_air"
        return true
    end
end
function state_gate_game_scene_char_LP_from_7_8_9_pre_jump(input,obj_char)
    -- _RC_blue_rc
    if test_input_sys_press(input["RC"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
            common_update_game_scene_input_direction(obj_char)
        end
        if test_input_sys_press(input["dash"]) then
            obj_char["velocity"] = {5.0*obj_char[5], 0}
        elseif test_input_sys_press(input["up"]) then
            obj_char["velocity"] = {0, -5.0}
        elseif test_input_sys_press(input["left"]) then
            obj_char["velocity"] = {-5.0, 0}
        elseif test_input_sys_press(input["right"]) then
            obj_char["velocity"] = {5.0, 0}
        end
        obj_char["current_animation"] = load_game_scene_anim_char_common_RC_blue_rc(obj_char)
        obj_char["state"] = "RC_blue_rc"
        init_character_anim_with(obj_char,obj_char["current_animation"])
        return true
    end
    -- _7_8_9_jump_air
    if common_game_scene_get_character_animation_end(obj_char) then
        -- velocity_cache
        local multiplyer = 1
        if test_input_sys_press_or_hold(input["SP"]) then
            multiplyer = 1.15
            obj_char["air_move"]["jump"][1] = math.max(math.min(obj_char["air_move"]["jump"][1]-1,obj_char["air_move"]["jump"][2]),0)
        end
        if obj_char["direction_input_cache"] == 7 then
            if (obj_char[5]*obj_char["velocity_cache"][1] < 0) then
                obj_char["velocity_cache"][1] = obj_char["velocity_cache"][1]*0.6 - obj_char[5]*2.75
                obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"7_jump",{202,568},nil,-55.0*multiplyer)
            else
                obj_char["velocity_cache"][1] = obj_char["velocity_cache"][1]*0.6 - obj_char[5]*2.75
                obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,585},nil,-55.0*multiplyer)
            end
        elseif obj_char["direction_input_cache"] == 8 then
            obj_char["velocity_cache"][1] = obj_char["velocity_cache"][1]*0.25
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,585},nil,-55.0*multiplyer)
        elseif obj_char["direction_input_cache"] == 9 then
            obj_char["velocity_cache"][1] = obj_char["velocity_cache"][1]*0.6 + obj_char[5]*2.75
            obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"9_jump",{300,500},nil,-55.0*multiplyer)
        end
        obj_char["velocity_cache"][1] = obj_char["velocity_cache"][1]*multiplyer
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["y"] = 225
        obj_char["state"] = "7_8_9_jump_air"
        obj_char["velocity"][1] = obj_char["velocity_cache"][1]
        state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char)
        return true
    end
end

function state_gate_game_scene_char_LP_from_4dash_backdash(input,obj_char)
    -- _RC_blue_rc
    if test_input_sys_press(input["RC"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
            common_update_game_scene_input_direction(obj_char)
        end
        if test_input_sys_press(input["dash"]) then
            obj_char["velocity"] = {5.0*obj_char[5], 0}
        elseif test_input_sys_press(input["up"]) then
            obj_char["velocity"] = {0, -5.0}
        elseif test_input_sys_press(input["left"]) then
            obj_char["velocity"] = {-5.0, 0}
        elseif test_input_sys_press(input["right"]) then
            obj_char["velocity"] = {5.0, 0}
        end
        obj_char["current_animation"] = load_game_scene_anim_char_common_RC_blue_rc(obj_char)
        obj_char["state"] = "RC_blue_rc"
        init_character_anim_with(obj_char,obj_char["current_animation"])
        return true
    end
    -- _common_ground_idle_to_move
    if obj_char["idle_cancel"] then
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_idle"
        state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char)
        return true
    end
end
function state_gate_game_scene_char_LP_from_4dash_air_backdash(input,obj_char)
    -- _7_8_9_jump_air_to_stand_idle
    if test_char_on_ground(obj_char) and obj_char["velocity"][2] > 0.0 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_jump_air_to_stand_idle"
        state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char)
        return true
    end
    -- _RC_blue_rc
    if test_input_sys_press(input["RC"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
            common_update_game_scene_input_direction(obj_char)
        end
        if test_input_sys_press(input["dash"]) then
            obj_char["velocity"] = {5.0*obj_char[5], 0}
        elseif test_input_sys_press(input["up"]) then
            obj_char["velocity"] = {0, -5.0}
        elseif test_input_sys_press(input["left"]) then
            obj_char["velocity"] = {-5.0, 0}
        elseif test_input_sys_press(input["right"]) then
            obj_char["velocity"] = {5.0, 0}
        end
        obj_char["current_animation"] = load_game_scene_anim_char_common_RC_blue_rc(obj_char)
        obj_char["state"] = "RC_blue_rc"
        init_character_anim_with(obj_char,obj_char["current_animation"])
        return true
    end
    -- _common_air_idle_to_move
    if obj_char["idle_cancel"] then
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
            return true
        end
    end
    -- _7_8_9_jump_air
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"7_jump",{202,568},-9.0*obj_char[5],nil)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_jump_air"
        obj_char["f"] = 24
        character_animator(obj_char,obj_char["current_animation"])
        state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char)
        return true
    end
end
function state_gate_game_scene_char_LP_from_6dash_dash(input,obj_char)
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_idle_to_move(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache"] = obj_char["direction_input"]
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        state_gate_game_scene_char_LP_from_7_8_9_pre_jump(input,obj_char)
        return true
    end
    -- _5_stand_dash_skid
    if not test_input_sys_press_or_hold(input["dash"]) or obj_char["direction_input"] == 4 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_dash_skid(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_dash_skid"
        state_gate_game_scene_char_LP_from_5_stand_dash_skid(input,obj_char)
        return true
    end
end
function state_gate_game_scene_char_LP_from_6dash_air_dash(input,obj_char)
    -- _7_8_9_jump_air_to_stand_idle
    if test_char_on_ground(obj_char) and obj_char["velocity"][2] > 0.0 then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_jump_air_to_stand_idle"
        state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char)
        return true
    end
    -- _RC_blue_rc
    if test_input_sys_press(input["RC"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
            common_update_game_scene_input_direction(obj_char)
        end
        if test_input_sys_press(input["dash"]) then
            obj_char["velocity"] = {5.0*obj_char[5], 0}
        elseif test_input_sys_press(input["up"]) then
            obj_char["velocity"] = {0, -5.0}
        elseif test_input_sys_press(input["left"]) then
            obj_char["velocity"] = {-5.0, 0}
        elseif test_input_sys_press(input["right"]) then
            obj_char["velocity"] = {5.0, 0}
        end
        obj_char["current_animation"] = load_game_scene_anim_char_common_RC_blue_rc(obj_char)
        obj_char["state"] = "RC_blue_rc"
        init_character_anim_with(obj_char,obj_char["current_animation"])
        return true
    end
    -- _common_air_idle_to_move
    if obj_char["idle_cancel"] then
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
            return true
        end
    end
    -- _7_8_9_jump_air
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"9_jump",{300,500},18.0*obj_char[5],nil)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "7_8_9_jump_air"
        obj_char["f"] = 24
        character_animator(obj_char,obj_char["current_animation"])
        state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char)
        return true
    end
end
function state_gate_game_scene_char_LP_from_6dash_dash_cancel(input,obj_char)
    -- common_ground_to_special_move
    if obj_char["idle_cancel"] then
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
    end
    -- _5_stand_dash_skid
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_dash_skid(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_dash_skid"
        state_gate_game_scene_char_LP_from_5_stand_dash_skid(input,obj_char)
        return true
    end
end

function state_gate_game_scene_char_LP_from_RC_blue_rc(input,obj_char)
end
function state_gate_game_scene_char_LP_from_RC_purple_rc(input,obj_char)
end
function state_gate_game_scene_char_LP_from_RC_red_rc(input,obj_char)
end
function state_gate_game_scene_char_LP_from_RC_yellow_rc(input,obj_char)
end

function state_gate_game_scene_char_LP_from_burst_overdrive(input,obj_char)
end
function state_gate_game_scene_char_LP_from_burst_burst(input,obj_char)
end

function state_gate_game_scene_char_LP_from_2P(input,obj_char)
end
function state_gate_game_scene_char_LP_from_6P(input,obj_char)
end
function state_gate_game_scene_char_LP_from_5P(input,obj_char)
end
function state_gate_game_scene_char_LP_from_2K(input,obj_char)
end
function state_gate_game_scene_char_LP_from_6K(input,obj_char)
end
function state_gate_game_scene_char_LP_from_5K(input,obj_char)
end
function state_gate_game_scene_char_LP_from_2S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_6S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_cS(input,obj_char)
    -- hit_cancel
    if obj_char["hit_cancel"] then

    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_idle_to_move_hold_ver(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_fS(input,obj_char)
end
function state_gate_game_scene_char_LP_from_2Launcher(input,obj_char)
    -- hit_cancel
    if obj_char["hit_cancel"] then

    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_idle_to_move_hold_ver(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_1_2_3_crouch(input,obj_char) then
            return true
        end
    end
    -- _1_2_3_crouch
    if common_game_scene_get_character_animation_end(obj_char) then
        obj_char["current_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["current_animation"])
        obj_char["state"] = "1_2_3_crouch"
        obj_char["f"] = 4
        character_animator(obj_char,obj_char["current_animation"])
        return true
    end
end
function state_gate_game_scene_char_LP_from_46Launcher(input,obj_char)
end
function state_gate_game_scene_char_LP_from_5Launcher(input,obj_char)
end
function state_gate_game_scene_char_LP_from_5Launcher_hold(input,obj_char)
end

function state_gate_game_scene_char_LP_from_jP(input,obj_char)
end
function state_gate_game_scene_char_LP_from_jK(input,obj_char)
end
function state_gate_game_scene_char_LP_from_j2K(input,obj_char)
end
function state_gate_game_scene_char_LP_from_jS(input,obj_char)
end
function state_gate_game_scene_char_LP_from_j2S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_j46Launcher(input,obj_char)
end
function state_gate_game_scene_char_LP_from_j5Launcher(input,obj_char)
end

function state_gate_game_scene_char_LP_from_4sp_P(input,obj_char)
end
function state_gate_game_scene_char_LP_from_6sp_P(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4sp_K(input,obj_char)
end
function state_gate_game_scene_char_LP_from_6sp_K(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4sp_S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4sp_S_4dash(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4sp_S_6dash(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4sp_S_S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4sp_S_H(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4sp_S_2Launcher(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4sp_S_6Launcher(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4sp_S_5Launcher(input,obj_char)
end
function state_gate_game_scene_char_LP_from_6sp_S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_sp_H(input,obj_char)
end
function state_gate_game_scene_char_LP_from_sp_H_P(input,obj_char)
end
function state_gate_game_scene_char_LP_from_sp_H_K(input,obj_char)
end
function state_gate_game_scene_char_LP_from_sp_H_S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_sp_H_H(input,obj_char)
end

function state_gate_game_scene_char_LP_from_jsp_S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_jsp_H(input,obj_char)
end
function state_gate_game_scene_char_LP_from_jsp_H_P(input,obj_char)
end
function state_gate_game_scene_char_LP_from_jsp_H_K(input,obj_char)
end
function state_gate_game_scene_char_LP_from_jsp_H_S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_jsp_H_H(input,obj_char)
end

function state_gate_game_scene_char_LP_from_4UA(input,obj_char)
end
function state_gate_game_scene_char_LP_from_6UA(input,obj_char)
end
function state_gate_game_scene_char_LP_from_5UA(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4sp_S_5UA(input,obj_char)
end

-- draw
function draw_game_scene_char_LP_logic_graphic_pos_sync()
    local obj = obj_char_game_scene_char_LP
    obj[1] = obj["x"]+(obj["hurtstop_wiggle_x"]*(math.random()-0.5)*2)-obj[5]*obj["anchor_pos"][1]
    obj[2] = obj["y"]+(obj["hurtstop_wiggle_y"]*(math.random()-0.5)*2)-obj[6]*obj["anchor_pos"][2]
end
function draw_game_scene_char_LP()
    local obj = obj_char_game_scene_char_LP
    local camera = obj_stage_game_scene_camera
    local image_sprite_sheet = image_sprite_sheet_table_char_game_scene_LP[obj["sprite_sheet_state"]]

    local x = obj[1]
    local y = obj[2]
    local z = obj[3]
    local opacity = obj[4]
    local sx = obj[5]
    local sy = obj[6]
    local r = obj[7]
    local f = obj[8]

    local shader = shader_game_scene_brightness_contrast
    shader:send("contrast", obj["contrast"])
    shader:send("brightness", obj["brightness"])
    love.graphics.setShader(shader)

    local oroboros_state = obj["oroboros_state"]

    if oroboros_state == "on" then
        local oroboros_8 = obj["oroboros_8"]
    
        local oroboros = {
            x+sx*obj["oroboros_anchor_pos"][1], 
            y+sy*obj["oroboros_anchor_pos"][2], 
            z, 
            opacity, 
            sx, 
            sy, 
            r, 
            oroboros_8
        }

        -- local oroboros_image_table = image_table_char_game_scene_LP_oroboros[obj["state"]]
        -- draw_3d_image_table(camera,oroboros,oroboros_image_table)
        local oroboros_image_table = image_UI_load_scene_loading_text
        draw_3d_image(camera,oroboros,oroboros_image_table)

    end

    -- draw_3d_image_table(camera,obj,character_image_table)
    image_sprite_sheet["sprite_batch"]:clear()
    draw_3d_image_sprite_batch(camera,obj,image_sprite_sheet,tostring(f))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    love.graphics.setShader()
end
function draw_game_scene_char_LP_shadow()
    local obj = obj_char_game_scene_char_LP
    local camera = obj_stage_game_scene_camera
    local light_obj = obj_stage_game_scene_glow

    local light_x = light_obj["glow_3d_pos"][1]
    local light_y = light_obj["glow_3d_pos"][2]
    local light_z = light_obj["glow_3d_pos"][3]

    local camera_x = camera[1]
    local camera_y = camera[2]
    local camera_z = camera[3]

    local scale = draw_resolution_correction(800)/(light_z-camera_z)

    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    local cood_res = {
        scale * (light_x - camera_x) + draw_resolution_correction(800),
        scale * (light_y - camera_y) + draw_resolution_correction(450)
    }
    local dx_light_char_2d = math.abs((light_x - camera_x))

    love.graphics.setCanvas(DRAW_CHARACTER_CANVAS)
    love.graphics.clear(0,0,0,0)
    draw_game_scene_char_LP()

    local center_blur_start = 0.5
    local side_blur_start = 0.85
    local blur_start = side_blur_start - ((width-dx_light_char_2d)/width*(side_blur_start-center_blur_start))
    local blur_width = (1.0 - blur_start)*0.85

    love.graphics.setCanvas(DRAW_SHADOW_CANVAS)
    love.graphics.clear(0,0,0,0)
    love.graphics.setShader(shader_game_scene_shadow_radial_blur)
    shader_game_scene_shadow_radial_blur:send("start_coods", cood_res)
    shader_game_scene_shadow_radial_blur:send("input_screen_coords", {width, height})
    shader_game_scene_shadow_radial_blur:send("blur_start", blur_start)
    shader_game_scene_shadow_radial_blur:send("blur_width", blur_width)
    love.graphics.draw(DRAW_CHARACTER_CANVAS, 0, 0)
    love.graphics.setShader()
    love.graphics.setCanvas()

    -- local opacity = math.max(0,(obj["y"] - 345)/20)*0.5
    love.graphics.setColor(0,0,0,0.5)
    love.graphics.draw(DRAW_SHADOW_CANVAS)
    love.graphics.setColor(1,1,1,1)
end
function draw_game_scene_char_LP_hurtbox()
    if not DEBUG_HITBOX_SHOWS then
        return
    end

    local obj_char = obj_char_game_scene_char_LP
    local camera = obj_stage_game_scene_camera

    -- hurt box
    local color = DEBUG_BOX_COLOR_BLUE
    for i=1,#obj_char["hurtbox_table"] do
        local current_hurtbox = obj_char["hurtbox_table"][i]
        local draw_box = {
            obj_char["x"] + (current_hurtbox[1] - current_hurtbox[3]/2)*obj_char[5],
            obj_char["y"] + current_hurtbox[2] - current_hurtbox[4]/2,
            obj_char[3],obj_char[5],1
        }
        draw_box["w"] = current_hurtbox[3]
        draw_box["h"] = current_hurtbox[4]
        draw_3d_color_box(camera,draw_box,color)
    end
end
function draw_game_scene_char_LP_hitbox()
    if not DEBUG_HITBOX_SHOWS then
        return
    end

    local obj_char = obj_char_game_scene_char_LP
    local camera = obj_stage_game_scene_camera

    -- hit box
    local color = DEBUG_BOX_COLOR_RED
    for i=1,#obj_char["hitbox_table"] do
        local current_hitbox = obj_char["hitbox_table"][i]
        local draw_box = {
            obj_char["x"] + (current_hitbox[1] - current_hitbox[3]/2)*obj_char[5],
            obj_char["y"] + current_hitbox[2] - current_hitbox[4]/2,
            obj_char[3],obj_char[5],1
        }
        draw_box["w"] = current_hitbox[3]
        draw_box["h"] = current_hitbox[4]
        draw_3d_color_box(camera,draw_box,color)
    end
end
function draw_game_scene_char_LP_pushbox()
    if not DEBUG_HITBOX_SHOWS then
        return
    end

    local obj_char = obj_char_game_scene_char_LP
    local camera = obj_stage_game_scene_camera

    -- push box
    local color = DEBUG_BOX_COLOR_YELLOW
    local pushbox = {
        obj_char["x"] + (obj_char["pushbox"][1] - obj_char["pushbox"][3]/2)*obj_char[5],
        obj_char["y"] + obj_char["pushbox"][2] - obj_char["pushbox"][4]/2,
        obj_char[3],obj_char[5],1
    }
    pushbox["w"] = obj_char["pushbox"][3]
    pushbox["h"] = obj_char["pushbox"][4]
    draw_3d_color_box(camera,pushbox,color)
end

-- projectile
function update_game_scene_char_LP_projectile()
    for i = #obj_char_game_scene_char_LP["projectile_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["projectile_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["projectile_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
end
function draw_game_scene_char_LP_projectile()
    for i = #obj_char_game_scene_char_LP["projectile_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["projectile_table"][i]
        object["draw"](object)
    end
end

-- VFX
function update_game_scene_char_LP_VFX()
    for i = #obj_char_game_scene_char_LP["VFX_HUD_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_HUD_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["VFX_HUD_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
    for i = #obj_char_game_scene_char_LP["VFX_front_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_front_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["VFX_front_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
    for i = #obj_char_game_scene_char_LP["VFX_back_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_back_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["VFX_back_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
end
function draw_game_scene_char_LP_VFX_HUD()
    for i = #obj_char_game_scene_char_LP["VFX_HUD_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_HUD_table"][i]
        object["draw"](object)
    end
end
function draw_game_scene_char_LP_VFX_front()
    for i = #obj_char_game_scene_char_LP["VFX_front_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_front_table"][i]
        object["draw"](object)
    end
end
function draw_game_scene_char_LP_VFX_back()
    for i = #obj_char_game_scene_char_LP["VFX_back_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_back_table"][i]
        object["draw"](object)
    end
end
function update_game_scene_char_LP_black_overlay()
    for i = #obj_char_game_scene_char_LP["black_overlay_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["black_overlay_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["black_overlay_table"], i) -- 寿命耗尽，从列表中移除
        end
    end
end
function draw_game_scene_char_LP_black_overlay()
    for i = #obj_char_game_scene_char_LP["black_overlay_table"], 1, -1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["black_overlay_table"][i]
        object["draw"](object)
    end
end

-- countdown
function update_game_scene_char_LP_overdrive_countdown()
    local obj_char = obj_char_game_scene_char_LP
    if obj_char["state"] ~= "burst_overdrive" and 
    obj_char["overdrive_timer"][1] + obj_char["overdrive_timer"][2] +
    obj_char["overdrive_timer"][3] + obj_char["overdrive_timer"][4] >= 1
    then
        if obj_char["overdrive_timer"][4] == 0 and obj_char["overdrive_timer"][3] ~= 0 then 
            obj_char["overdrive_timer"][3] = obj_char["overdrive_timer"][3] - 1
            obj_char["overdrive_timer"][4] = 9
        elseif obj_char["overdrive_timer"][4] > 0 then
            obj_char["overdrive_timer"][4] = obj_char["overdrive_timer"][4] - 1
        end
        if obj_char["overdrive_timer"][3] == 0 and obj_char["overdrive_timer"][2] ~= 0 then 
            obj_char["overdrive_timer"][2] = obj_char["overdrive_timer"][2] - 1
            obj_char["overdrive_timer"][3] = 5
        end
        if obj_char["overdrive_timer"][2] < 0 and obj_char["overdrive_timer"][1] ~= 0 then 
            obj_char["overdrive_timer"][1] = obj_char["overdrive_timer"][1] - 1
            obj_char["overdrive_timer"][2] = 9
        end
    elseif obj_char["state"] ~= "burst_overdrive" and 
    obj_char["overdrive_timer"][1] + obj_char["overdrive_timer"][2] +
    obj_char["overdrive_timer"][3] + obj_char["overdrive_timer"][4] < 1
    then
        obj_char["overdrive_gauge"][3] = "off"
        obj_char["overdrive_timer"] = {0,0,0,0}
    end
end
function update_game_scene_char_LP_inv_state_countdown()
    local obj_char = obj_char_game_scene_char_LP
    if obj_char["strike_inv_countdown"] > 0 then
        obj_char["strike_inv_countdown"] = obj_char["strike_inv_countdown"] - 1
    else
        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
    end
    if obj_char["throw_inv_countdown"] > 0 then
        obj_char["throw_inv_countdown"] = obj_char["throw_inv_countdown"] - 1
    else
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
    end
    if obj_char["projectile_inv_countdown"] > 0 then
        obj_char["projectile_inv_countdown"] = obj_char["projectile_inv_countdown"] - 1
    else
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
    end
    if obj_char["burst_inv_countdown"] > 0 then
        obj_char["burst_inv_countdown"] = obj_char["burst_inv_countdown"] - 1
    else
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
    end
end
function update_game_scene_char_LP_uncommon_countdown()
    update_game_scene_char_LP_overdrive_countdown()
    update_game_scene_char_LP_inv_state_countdown()
end
-- LP -> RP
-- ASSET_DATA[2] -> ASSET_DATA[3]
-- "L" -> "R"
-- obj_char_game_scene_char_LP = {0,0,0,1,1,1,0,0} -> obj_char_game_scene_char_RP = {0,0,0,1,-1,1,0,0}
-- obj_char_game_scene_char_LP["x"] = -320 -> obj_char_game_scene_char_RP["x"] = 320

function load_game_scene_obj_char_LP()
    -- x y z opacity sx sy r f
    obj_char_game_scene_char_LP = {0,0,0,1,1,1,0,0} -- obj[1-8]都为图形上的数据 obj[8]为图形上的帧数
    obj_char_game_scene_char_LP["basic_prop_cache"] = {0,0,0,1,1,1,0,0}
    obj_char_game_scene_char_LP["x"] = -320
    obj_char_game_scene_char_LP["y"] = 0
    obj_char_game_scene_char_LP["f"] = -1 -- obj["f"] 逻辑上的帧数
    obj_char_game_scene_char_LP["FCT"] = {0,0,0,0,0,0,0,0}
    obj_char_game_scene_char_LP["LCT"] = {0,0,0,0,0,0,0,0}
    obj_char_game_scene_char_LP["LCD"] = {0,0,0,0,0,0,0,0}

    -- state
    obj_char_game_scene_char_LP["player_side"] = "L"
    obj_char_game_scene_char_LP["character_mode"] = "Dr.Due.Dasher" -- "Dr.Due.Dasher" "Roman.Raid.Radio"
    obj_char_game_scene_char_LP["type"] = "character"
    obj_char_game_scene_char_LP["default_throw_distance"] = 0

    obj_char_game_scene_char_LP["state"] = "before_ease_in"
    obj_char_game_scene_char_LP["state_cache"] = "none"
    obj_char_game_scene_char_LP["sprite_sheet_state"] = "5_stand_idle"
    obj_char_game_scene_char_LP["height_state"] = "stand" -- stand crouch air OTG wallstick
    obj_char_game_scene_char_LP["air_gatling_state"] = false
    obj_char_game_scene_char_LP["hit_type_state"] = "none" -- none strike throw burst projectile
    obj_char_game_scene_char_LP["hit_guard_type_state"] = "none" -- none all low mid high
    obj_char_game_scene_char_LP["hurt_state"] = "idle" -- idle unblock punish counter GP parry
    obj_char_game_scene_char_LP["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
    obj_char_game_scene_char_LP["move_state"] = "none" -- none startup active recovery
    obj_char_game_scene_char_LP["last_move_state"] = "none" -- none startup active recovery
    obj_char_game_scene_char_LP["hurt_block_at_current_frame"] = false

    -- input
    obj_char_game_scene_char_LP["direction_input"] = 5
    obj_char_game_scene_char_LP["direction_input_cache_hit_jump_cancel"] = 5
    obj_char_game_scene_char_LP["startup_frame"] = 0
    obj_char_game_scene_char_LP["active_frame"] = 0
    obj_char_game_scene_char_LP["recovery_frame"] = 0
    obj_char_game_scene_char_LP["frame_adv"] = 0
    obj_char_game_scene_char_LP["last_hitstop_frame"] = 0

    obj_char_game_scene_char_LP["input_sys_state"] = "none" -- none save load
    obj_char_game_scene_char_LP["input_sys_cache"] = {}
    obj_char_game_scene_char_LP["input_sys_state_negative_edge"] = "none"
    obj_char_game_scene_char_LP["input_sys_cache_negative_edge"] = {}
    obj_char_game_scene_char_LP["input_sys_cache_hit_jump_cancel"] = {}
    init_input_sys_cache_LP(obj_char_game_scene_char_LP)
    init_input_sys_cache_negative_edge_LP(obj_char_game_scene_char_LP)

        -- hit_hurt_block_animation
    obj_char_game_scene_char_LP["hit_damage"] = 0
    obj_char_game_scene_char_LP["hit_damage_correction_factor"] = 1
    obj_char_game_scene_char_LP["hit_heat_gain"] = 0
    obj_char_game_scene_char_LP["hit_wallbreak_damage"] = 0
    obj_char_game_scene_char_LP["hurt_heat_gain"] = 0
    obj_char_game_scene_char_LP["blocked_heat_gain"] = 0
    obj_char_game_scene_char_LP["block_heat_gain"] = 0
    obj_char_game_scene_char_LP["block_risk_gauge_gain"] = 0
    obj_char_game_scene_char_LP["FD_block_heat_drain"] = 0

    obj_char_game_scene_char_LP["wallhurt_wallstick_on_side"] = 0
    obj_char_game_scene_char_LP["wallhurt_wallstickable"] = false
    obj_char_game_scene_char_LP["wallhurt_wallbreakable_with_wallstick"] = false
    obj_char_game_scene_char_LP["wallhurt_wallbreakable_without_wallstick"] = false
    obj_char_game_scene_char_LP["wallhurt_wallbreak_adv"] = false
    
    obj_char_game_scene_char_LP["init_animation_load_function"] = load_game_scene_anim_char_TRM_5_stand_idle

    obj_char_game_scene_char_LP["stand_hurt_animation"] = nil
    obj_char_game_scene_char_LP["stand_block_animation"] = nil
    obj_char_game_scene_char_LP["crouch_hurt_animation"] = nil
    obj_char_game_scene_char_LP["crouch_block_animation"] = nil
    obj_char_game_scene_char_LP["air_hurt_animation"] = nil
    obj_char_game_scene_char_LP["air_block_animation"] = nil
    obj_char_game_scene_char_LP["OTG_hurt_animation"] = nil
    obj_char_game_scene_char_LP["wallstick_hurt_animation"] = nil
    obj_char_game_scene_char_LP["throw_success_animation"] = nil
    obj_char_game_scene_char_LP["throw_hurt_success_animation"] = nil
    obj_char_game_scene_char_LP["throw_hurt_PRC_animation"] = nil

    obj_char_game_scene_char_LP["self_wallbounce_hurt_animation"] = nil
    obj_char_game_scene_char_LP["self_groundbounce_hurt_animation"] = nil

    obj_char_game_scene_char_LP["self_knockdown_animation"] = nil
    obj_char_game_scene_char_LP["self_knockdown_recovery_animation"] = nil

    obj_char_game_scene_char_LP["character_animation"] = nil

    obj_char_game_scene_char_LP["hit_cancel"] = false
    obj_char_game_scene_char_LP["idle_cancel"] = false

    obj_char_game_scene_char_LP["strike_active"] = false -- 防止在同一动作的active多次触发
    obj_char_game_scene_char_LP["throw_active"] = false -- 防止在同一动作的active多次触发

    obj_char_game_scene_char_LP["strike_inv"] = false
    obj_char_game_scene_char_LP["strike_inv_countdown"] = 0
    obj_char_game_scene_char_LP["throw_inv"] = false
    obj_char_game_scene_char_LP["throw_inv_countdown"] = 0
    obj_char_game_scene_char_LP["projectile_inv"] = false
    obj_char_game_scene_char_LP["projectile_inv_countdown"] = 0

    obj_char_game_scene_char_LP["hit_function"] = function() end
    obj_char_game_scene_char_LP["hurt_function"] = function() end
    obj_char_game_scene_char_LP["parry_function"] = function() end
    obj_char_game_scene_char_LP["hit_counter_ver_function"] = function() end

    obj_char_game_scene_char_LP["health_gauge_update_function"] = function() end
    obj_char_game_scene_char_LP["overdrive_gauge_update_function"] = function() end
    obj_char_game_scene_char_LP["ability_gauge_update_function"] = function() end
    obj_char_game_scene_char_LP["risk_gauge_update_function"] = function() end
    obj_char_game_scene_char_LP["wallstick_gauge_update_function"] = function() end

    -- state_number
    obj_char_game_scene_char_LP["velocity"] = {0,0}
    obj_char_game_scene_char_LP["velocity_debug"] = {0,0}
    obj_char_game_scene_char_LP["velocity_cache"] = {0,0}
    obj_char_game_scene_char_LP["friction"] = 1
    obj_char_game_scene_char_LP["gravity"] = 2.5
    obj_char_game_scene_char_LP["physics_lock"] = false
    
    obj_char_game_scene_char_LP["health_gauge"] = {12000,12000,12000,"fade_off"}
    obj_char_game_scene_char_LP["heat_gauge"] = {0.0,200.0} -- 0.0 - 200.0
    obj_char_game_scene_char_LP["ability_gauge"] = {600.0,600.0} -- 0.0 - 600.0
    obj_char_game_scene_char_LP["overdrive_gauge"] = {600.0,600.0,"off"} -- 0.0 - 600.0
    obj_char_game_scene_char_LP["overdrive_timer"] = {0,0,0,0} -- 0f 00:00 
    obj_char_game_scene_char_LP["risk_gauge"] = {0.0,300.0} -- 0.0 - 300.0
    obj_char_game_scene_char_LP["wallstick_gauge"] = {0.0,200.0} -- 0.0 - 200.0

    obj_char_game_scene_char_LP["heat_penalty"] = 1
    obj_char_game_scene_char_LP["heat_penalty_countdown"] = 0
    obj_char_game_scene_char_LP["ability_penalty"] = 1
    obj_char_game_scene_char_LP["ability_penalty_countdown"] = 0
    obj_char_game_scene_char_LP["positive_bonus"] = false
    obj_char_game_scene_char_LP["positive_bonus_heat_gain_buff"] = 1
    obj_char_game_scene_char_LP["positive_bonus_hit_damage_buff"] = 1
    obj_char_game_scene_char_LP["positive_bonus_hurt_damage_buff"] = 1
    obj_char_game_scene_char_LP["positive_bonus_countdown"] = 0

    obj_char_game_scene_char_LP["gauge_update_ban_states"] = {
        ["throw_success"] = true,
        ["throw_hurt_success"] = true,
        ["throw_testing"] = true,
        ["throw_tested"] = true,
        ["throw_teching"] = true,
        ["throw_teched"] = true,
        ["hitstop"] = true,
        ["hurtstop"] = true,
        ["blockstop"] = true,
        ["wallstick"] = true,
        ["wallbreak_hit"] = true,
        ["wallbreak_hurt"] = true,
        ["5Launcher_hold_hit_entering"] = true,
        ["5Launcher_hold_hit_exiting"] = true,
        ["5Launcher_hold_hurt_entering"] = true,
        ["5Launcher_hold_hurt_exiting"] = true,
        ["before_ease_in"] = true
    }

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
    obj_char_game_scene_char_LP["game_speed_force_0_countdown"] = 0 -- 只能是game_speed的倍数
    obj_char_game_scene_char_LP["game_speed_force_1_countdown"] = 0
    obj_char_game_scene_char_LP["game_speed_application"] = {0,1,1,0,0,0}
    
    obj_char_game_scene_char_LP["hit_hurt_blockstop_countdown"] = 0
    obj_char_game_scene_char_LP["hit_hurt_block_slowdown_countdown"] = 0

    -- collide
    obj_char_game_scene_char_LP["pushbox"] = {0,-185,120,370}
    obj_char_game_scene_char_LP["pushbox_other_side_char_active"] = true
    obj_char_game_scene_char_LP["hitbox_table"] = {}
    obj_char_game_scene_char_LP["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
    obj_char_game_scene_char_LP["collision_move_available"] = {1,1}
    obj_char_game_scene_char_LP["collision_move_available_cache"] = {1,1}
    obj_char_game_scene_char_LP["collision_ground_height_offset"] = 0 -- 用于检测和地面碰撞的

    -- sub_obj_table
    obj_char_game_scene_char_LP["projectile_table"] = {}
    obj_char_game_scene_char_LP["projectile_rc_table"] = {}
    obj_char_game_scene_char_LP["VFX_HUD_table"] = {}
    obj_char_game_scene_char_LP["VFX_front_table"] = {}
    obj_char_game_scene_char_LP["VFX_back_table"] = {}
    obj_char_game_scene_char_LP["VFX_hit_front_table"] = {}
    obj_char_game_scene_char_LP["VFX_hit_back_table"] = {}
    obj_char_game_scene_char_LP["VFX_black_overlay_table"] = {}
    -- sub_hit_hurt_function
    obj_char_game_scene_char_LP["hit_VFX_dynamic_spawn_pos"] = {}
    obj_char_game_scene_char_LP["hit_VFX_insert_function"] = nil
    obj_char_game_scene_char_LP["hit_VFX_insert_function_argument"] = nil
    obj_char_game_scene_char_LP["hit_SFX"] = nil
    obj_char_game_scene_char_LP["hit_counter_VFX_insert_function"] = nil
    obj_char_game_scene_char_LP["hit_counter_VFX_insert_function_argument"] = nil
    obj_char_game_scene_char_LP["hit_counter_SFX"] = nil
    obj_char_game_scene_char_LP["hit_block_VFX_insert_function"] = nil
    obj_char_game_scene_char_LP["hit_block_VFX_insert_function_argument"] = nil
    obj_char_game_scene_char_LP["hit_block_SFX"] = nil
    obj_char_game_scene_char_LP["hurt_block_VFX_insert_function"] = nil
    obj_char_game_scene_char_LP["hurt_block_SFX"] = nil
    
    -- 5H_shot_sys
    obj_char_game_scene_char_LP["shot_sys_state"] = "off"
    obj_char_game_scene_char_LP["shot_sys_f"] = 0
    obj_char_game_scene_char_LP["shot_sys_curse"] = false
    obj_char_game_scene_char_LP["shot_sys_curse_countdown"] = 0
    obj_char_game_scene_char_LP["shot_sys_fire_cancel"] = false
    obj_char_game_scene_char_LP["shot_sys_idle_cancel"] = false
    obj_char_game_scene_char_LP["shot_sys_aim_process"] = {0,0,420,450,false} -- 当前值 当前速度 瞄准命中最低值 瞄准命中最高保存值 上一帧是否高于瞄准命中最低数值
    obj_char_game_scene_char_LP["shot_sys_animation"] = nil
    obj_char_game_scene_char_LP["shot_sys_camera_shake_table"] = {}
    obj_char_game_scene_char_LP["shot_sys_at_the_ready_force_off_state"] = {
        ["before_ease_in"] = true,
        ["active_FD_block"] = true,
        ["block"] = true,
        ["hurt"] = true,
        ["throw_success"] = true,
        ["throw_hurt_success"] = true,
        ["throw_testing"] = true,
        ["throw_tested"] = true,
        ["hurtstop"] = true,
        ["blockstop"] = true,
        ["wallbreak_hit"] = true,
        ["wallbreak_hurt"] = true,
        ["knockdown"] = true,
        ["knockdown_recovery"] = true,
        ["knockout"] = true,
        ["burst_RC_blue"] = true,
        ["burst_RC_purple"] = true,
        ["burst_RC_red"] = true,
        ["burst_RC_yellow"] = true,
        ["burst_overdrive"] = true,
        ["burst_burst"] = true,
        ["4_6Launcher"] = true,
        ["j4_6Launcher"] = true,
        ["4SP_P"] = true,
        ["4SP_S"] = true,
        ["4SP_S_4dash"] = true,
        ["4SP_S_6dash"] = true,
        ["4SP_S_S"] = true,
        ["4SP_S_H"] = true,
        ["4SP_S_2Launcher"] = true,
        ["4SP_S_6Launcher"] = true,
        ["4SP_S_5Launcher"] = true,
        ["SP_H"] = true,
        ["jSP_H"] = true,
        ["4UA"] = true,
        ["6UA"] = true,
        ["5UA"] = true,
        ["4SP_S_5UA"] = true
    }
    obj_char_game_scene_char_LP["6SP_S_shot_sys_pass_state"] = {
        ["at_the_ready_ease_out"] = true,
        ["steady_aim_ease_out"] = true,
        ["off"] = true
    }
    -- 5H_shot_sys_oroboros
    obj_char_game_scene_char_LP["shot_sys_oroboros_state"] = "off"
    obj_char_game_scene_char_LP["shot_sys_oroboros_f"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_aim_r"] = 0.42
    obj_char_game_scene_char_LP["shot_sys_oroboros_animation_table"] = {}
    -- 5H_shot_sys_oroboros_sub_obj
    obj_char_game_scene_char_LP["shot_sys_oroboros_front"] = {0,0,0,0,1,1,0,0}
    obj_char_game_scene_char_LP["shot_sys_oroboros_front"]["f_8"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_front"]["f_4"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_front"]["sprite_sheet_state"] = "5H_oroboros_loop_front"
    obj_char_game_scene_char_LP["shot_sys_oroboros_mid"] = {0,0,0,0,1,1,0,0}
    obj_char_game_scene_char_LP["shot_sys_oroboros_mid"]["f_8"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_mid"]["sprite_sheet_state"] = "5H_oroboros_loop_mid"
    obj_char_game_scene_char_LP["shot_sys_oroboros_back"] = {0,0,0,0,1,1,0,0}
    obj_char_game_scene_char_LP["shot_sys_oroboros_back"]["f_8"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_back"]["f_4"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_back"]["sprite_sheet_state"] = "5H_oroboros_loop_back"
    -- 5H_shot_sys_oroboros_sub_obj_update_value
    obj_char_game_scene_char_LP["shot_sys_oroboros_offset_amount"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_anchor_pos"] = {-110,-455}
    obj_char_game_scene_char_LP["shot_sys_oroboros_ease_current"] = {
        obj_char_game_scene_char_LP["x"] + obj_char_game_scene_char_LP[5] * obj_char_game_scene_char_LP["shot_sys_oroboros_anchor_pos"][1],
        obj_char_game_scene_char_LP["y"] + obj_char_game_scene_char_LP[6] * obj_char_game_scene_char_LP["shot_sys_oroboros_anchor_pos"][2],
        obj_char_game_scene_char_LP[5],
        obj_char_game_scene_char_LP[6]
    }
    obj_char_game_scene_char_LP["shot_sys_oroboros_ease_target"] = {
        obj_char_game_scene_char_LP["x"] + obj_char_game_scene_char_LP[5] * obj_char_game_scene_char_LP["shot_sys_oroboros_anchor_pos"][1],
        obj_char_game_scene_char_LP["y"] + obj_char_game_scene_char_LP[6] * obj_char_game_scene_char_LP["shot_sys_oroboros_anchor_pos"][2],
        obj_char_game_scene_char_LP[5],
        obj_char_game_scene_char_LP[6]
    }
    -- 5H_shot_sys_reticle
    obj_char_game_scene_char_LP["shot_sys_reticle_state"] = "off"
    obj_char_game_scene_char_LP["shot_sys_reticle"] = {0,0,0,0,1,1,0,0}
    obj_char_game_scene_char_LP["shot_sys_reticle_f"] = 0
    obj_char_game_scene_char_LP["shot_sys_reticle_f_4"] = 0
    obj_char_game_scene_char_LP["shot_sys_reticle_f_8"] = 0
    obj_char_game_scene_char_LP["shot_sys_reticle_animation_table"] = {}
    obj_char_game_scene_char_LP["shot_sys_reticle_stage_pos_current"] = {0,0}
    obj_char_game_scene_char_LP["shot_sys_reticle_stage_pos_target"] = {0,0}
    obj_char_game_scene_char_LP["shot_sys_reticle_sprite_sheet_state"] = "5H_reticle_unlocked"
    
    -- draw_correction
    obj_char_game_scene_char_LP["anchor_pos"] = {215,510}
    obj_char_game_scene_char_LP["contrast"] = 1
    obj_char_game_scene_char_LP["brightness"] = 0
    obj_char_game_scene_char_LP["brightness_const"] = 0
    obj_char_game_scene_char_LP["brightness_overdrive_const"] = 0
    obj_char_game_scene_char_LP["shadow_opacity"] = 0.5
    obj_char_game_scene_char_LP["hurtstop_wiggle_x"] = 0
    obj_char_game_scene_char_LP["hurtstop_wiggle_y"] = 0
    obj_char_game_scene_char_LP["hurtstop_wiggle_current_x"] = 0
    obj_char_game_scene_char_LP["hurtstop_wiggle_current_y"] = 0
    obj_char_game_scene_char_LP["hurtstop_wiggle_x_animation"] = nil
    obj_char_game_scene_char_LP["hurtstop_wiggle_y_animation"] = nil

    -- camera
    obj_char_game_scene_char_LP["camera_x_shake_anim"] = nil
    obj_char_game_scene_char_LP["camera_y_shake_anim"] = nil
    obj_char_game_scene_char_LP["camera_enclosing_anim"] = nil
    obj_char_game_scene_char_LP["enclose_position_offset"] = {0,0,0}
end
function order_load_game_scene_char_LP_frames(load_order)
    local PLAYER_ASSET_DATA = ASSET_DATA[2]
    local switch = 
    {
        [15] = function()
            -- UNIVERSAL 1 2 3
            image_sprite_sheet_table_char_game_scene_LP = {}
            local load_name_table = {
                "0_air_Launcher_teched",
                "0_air_Launcher_teching",
                "0_crouch_hurt",
                "0_general_hurt_falled_knockout",
                "0_general_hurt_hard_knockdown_down",
                "0_general_hurt_hard_knockdown_head_down",
                "0_general_hurt_hard_knockdown_up",
                "0_general_hurt_hard_knockdown_wallstick_ground",
                "0_general_hurt_hard_recovery_down",
                "0_general_hurt_hard_recovery_up",
                "0_general_hurt_hard_recovery_wallstick_ground",
                "0_general_hurt_launched_float",
                "0_general_hurt_launched_groundbounce",
                "0_general_hurt_launched_high",
                "0_general_hurt_launched_low",
                "0_general_hurt_launched_mid_hori_heavy",
                "0_general_hurt_launched_mid_up",
                "0_general_hurt_launched_rolling",
                "0_general_hurt_launched_rotate",
                "0_general_hurt_launched_wallbounce"
            }
            for i,v in ipairs(load_name_table) do
                image_sprite_sheet_table_char_game_scene_LP[v] = 
                common_sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/UNIVERSAL/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v])
                )
            end 
        end,
        [16] = function()
            local load_name_table = {
                "0_general_hurt_semi_launched_mid",
                "0_general_hurt_semi_launched_rotate",
                "0_general_hurt_soft_knockdown_wallstick_air",
                "0_general_hurt_soft_recovery_ground",
                "0_general_hurt_soft_recovery_wallstick_air",
                "0_ground_Launcher_teched",
                "0_ground_Launcher_teching",
                "0_stand_hurt_high",
                "0_stand_hurt_low",
                "0_stand_hurt_mid",
                "0_wallbreak_hit",
                "0_wallbreak_hurt_adv",
                "0_wallbreak_hurt_non_adv",
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
            for i,v in ipairs(load_name_table) do
                image_sprite_sheet_table_char_game_scene_LP[v] = 
                common_sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/UNIVERSAL/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v])
                )
            end 
        end,
        [17] = function()
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
            for i,v in ipairs(load_name_table) do
                image_sprite_sheet_table_char_game_scene_LP[v] = 
                common_sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/UNIVERSAL/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v])
                )
            end 
        end,
        [18] = function()
            -- ATTACK 4 5 6
            local load_name_table = {
                "burst_overdrive_ground",
                "burst_overdrive_rc_air",
                "burst_rc_ground",
                "2P",
                "6P",
                "5P",
                "2K",
                "6K",
                "5K",
                "2S",
                "6S",
                "cS",
                "fS",
                "5H",
                "5H_oroboros_ease_in_mid",
                "5H_oroboros_ease_out_mid",
                "5H_oroboros_loop_back",
                "5H_oroboros_loop_front",
                "5H_oroboros_loop_mid",
                "5H_oroboros_shot",
                "5H_reticle_ease_out",
                "5H_reticle_locked",
                "5H_reticle_locking",
                "5H_reticle_shot",
                "5H_reticle_unlocked",
                "5H_reticle_unlocking",
                "2Launcher",
                "4_6Launcher",
                "4_6Launcher_success",
                "5Launcher",
                "jP",
                "jK",
                "j2K",
                "jS",
                "j5Launcher",
                "j4_6Launcher",
                "j4_6Launcher_success"
            }
            for i,v in ipairs(load_name_table) do
                image_sprite_sheet_table_char_game_scene_LP[v] = 
                common_sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/ATTACK/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v])
                )
            end 
        end,
        [19] = function()
            local load_name_table = {
                "4SP_P",
                "6SP_S"
            }
            for i,v in ipairs(load_name_table) do
                image_sprite_sheet_table_char_game_scene_LP[v] = 
                common_sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/ATTACK/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v])
                )
            end 
        end,
        [20] = function()
            local load_name_table = {
            }
            for i,v in ipairs(load_name_table) do
                image_sprite_sheet_table_char_game_scene_LP[v] = 
                common_sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/ATTACK/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v])
                )
            end 
        end,
        [21] = function()
            -- whiff_VFX 7 8
            image_sprite_sheet_VFX_game_scene_LP = {}
            local load_name_table = {
                "2P",
                "6P",
                "5P",
                -- "2K",
                -- "6K",
                -- "5K",
                "2S",
                "6S",
                "cS",
                -- "fS",
                "5H_shot_oroboros_blast",
                "5H_switch",
                -- "2Launcher"
                -- "4_6Launcher",
                -- "4_6Launcher_success",
                "5Launcher",
                "5Launcher_glow",
                -- "jP",
                -- "jK",
                "jS",
                "6SP_S"
            }
            for i,v in ipairs(load_name_table) do
                image_sprite_sheet_VFX_game_scene_LP[v.."_whiff_VFX"] = 
                common_sprite_sheet_load(
                    "asset/game_scene/VFX/whiff_VFX/TRM/".."TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v.."_whiff_VFX"])
                )
            end 
        end,
        [22] = function()
            local load_name_table = {
            }
            for i,v in ipairs(load_name_table) do
                image_sprite_sheet_VFX_game_scene_LP[v.."_whiff_VFX"] = 
                common_sprite_sheet_load(
                    "asset/game_scene/VFX/whiff_VFX/TRM/"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v.."_whiff_VFX"])
                )
            end 
        end,
        [23] = function()
            -- projectile 9
            image_sprite_sheet_projectile_game_scene_LP = {}
            local load_name_table = {
                "5H",
                "5H_miss",
            }
            for i,v in ipairs(load_name_table) do
                image_sprite_sheet_projectile_game_scene_LP[v.."_projectile"] = 
                common_sprite_sheet_load(
                    "asset/game_scene/characters/TRM/_character/PROJECTILE/TRM_"..v..".json",
                    love.graphics.newImage(PLAYER_ASSET_DATA[v.."_projectile"])
                )
            end 
        end,
        [24] = function()
            -- special
            image_sprite_sheet_VFX_game_scene_LP_overdrive_badge = 
            common_sprite_sheet_load(
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
    obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
    init_character_anim_with(obj_char,obj_char["character_animation"])

    -- 加载角色会使用的线性动画和帧动画
end
function load_game_scene_box_anchor_data_LP()
    local stand_pushbox = {0,-185,120,370}
    local crouch_pushbox = {0,-142.5,120,285}
    local air_pushbox = {0,-100,120,200}
    local OTG_pushbox = {0,-65,120,130}

    local stand_hurtbox = {{0,-220,210,440},{0,-455,120,30}}
    local crouch_hurtbox = {{0,-155,220,310}}
    local air_hurtbox = {{0,-140,220,320}}
    local OTG_hurtbox = {{0,-75,475,150}}

    obj_hurtboxs_data_game_scene_char_LP = {}
    obj_pushboxs_data_game_scene_char_LP = {}
    obj_anchor_data_game_scene_char_LP = {}
    
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP = {}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"] = {}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"] = {}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"] = {}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["wallstick_spawn_anchor_pos"] = {}

    -- obj_hurtboxs_data_game_scene_char_LP["__"] = {}
    -- obj_hurtboxs_data_game_scene_char_LP["__"][0] = {{__,__,__,__}}
    -- obj_pushboxs_data_game_scene_char_LP["__"] = {}
    -- obj_pushboxs_data_game_scene_char_LP["__"][0] = 
    -- obj_anchor_data_game_scene_char_LP["__"] = {__,__}

    obj_anchor_data_game_scene_char_LP["0_air_Launcher_teched"] = {370,310}
    obj_anchor_data_game_scene_char_LP["0_air_Launcher_teching"] = {275,360}

    obj_pushboxs_data_game_scene_char_LP["0_crouch_hurt"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_crouch_hurt"][0] = crouch_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_crouch_hurt"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_crouch_hurt"][0] = crouch_hurtbox
    obj_hurtboxs_data_game_scene_char_LP["0_crouch_hurt"][1] = {{0,-157.5,230,307.5}}
    obj_hurtboxs_data_game_scene_char_LP["0_crouch_hurt"][2] = {{0,-155,240,305}}
    obj_hurtboxs_data_game_scene_char_LP["0_crouch_hurt"][3] = {{0,-152.5,250,302.5}}
    obj_hurtboxs_data_game_scene_char_LP["0_crouch_hurt"][4] = {{0,-150,260,300}}
    obj_anchor_data_game_scene_char_LP["0_crouch_hurt"] = {297,420}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_crouch_hurt"] = {600,-195}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][0] = stand_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][1] = crouch_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][10] = OTG_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][0] = {{0,-215,206,430}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][1] = {{0,-195,220,390}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][2] = {{0,-186,230,372}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][3] = {{0,-181,240,362}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][4] = {{0,-180,245,360}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][7] = {{0,-178,256,356}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][8] = {{0,-170,324,340}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][9] = {{0,-150,362,300}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_falled_knockout"][10] = OTG_hurtbox
    obj_anchor_data_game_scene_char_LP["0_general_hurt_falled_knockout"] = {330,456}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_general_hurt_falled_knockout"] = {-370,-150}

    obj_pushboxs_data_game_scene_char_LP["0_stand_hurt_high"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_stand_hurt_high"][0] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_high"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_high"][0] = {stand_hurtbox[1],{0,-455,120,30}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_high"][1] = {{0,-215,220,430},{0,-440,120,20}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_high"][2] = {{0,-210,240,420}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_high"][3] = {{0,-200,250,400}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_high"][4] = {{0,-190,260,380}}
    obj_anchor_data_game_scene_char_LP["0_stand_hurt_high"] = {208,495}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_stand_hurt_high"] = {600,-195}

    obj_pushboxs_data_game_scene_char_LP["0_stand_hurt_low"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_stand_hurt_low"][0] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_low"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_low"][0] = {stand_hurtbox[1]}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_low"][1] = {{0,-215,220,430}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_low"][2] = {{0,-210,240,420}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_low"][3] = {{0,-200,250,400}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_low"][4] = {{0,-190,260,380}}
    obj_anchor_data_game_scene_char_LP["0_stand_hurt_low"] = {249,495}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_stand_hurt_low"] = {600,-195}

    obj_pushboxs_data_game_scene_char_LP["0_stand_hurt_mid"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_stand_hurt_mid"][0] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_mid"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_mid"][0] = {stand_hurtbox[1]}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_mid"][1] = {{0,-215,220,430}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_mid"][2] = {{0,-210,240,420}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_mid"][3] = {{0,-200,250,400}}
    obj_hurtboxs_data_game_scene_char_LP["0_stand_hurt_mid"][4] = {{0,-190,260,380}}
    obj_anchor_data_game_scene_char_LP["0_stand_hurt_mid"] = {205,475}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_stand_hurt_mid"] = {600,-195}

    obj_pushboxs_data_game_scene_char_LP["0_wallbreak_hit"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_wallbreak_hit"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_wallbreak_hit"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_wallbreak_hit"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_wallbreak_hit"] = {280,510}

    obj_pushboxs_data_game_scene_char_LP["0_wallbreak_hurt_adv"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_wallbreak_hurt_adv"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_wallbreak_hurt_adv"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_wallbreak_hurt_adv"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_wallbreak_hurt_adv"] = {280,275}

    obj_pushboxs_data_game_scene_char_LP["0_wallbreak_hurt_non_adv"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_wallbreak_hurt_non_adv"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_wallbreak_hurt_non_adv"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_wallbreak_hurt_non_adv"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_wallbreak_hurt_non_adv"] = {270,575}

    obj_pushboxs_data_game_scene_char_LP["4_stand_block_guard_crash"] = {}
    obj_pushboxs_data_game_scene_char_LP["4_stand_block_guard_crash"][0] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["4_stand_block_guard_crash"] = {}
    obj_hurtboxs_data_game_scene_char_LP["4_stand_block_guard_crash"][0] = stand_hurtbox
    obj_anchor_data_game_scene_char_LP["4_stand_block_guard_crash"] = {223,510}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["4_stand_block_guard_crash"] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["4_stand_block_guard_crash"] = {-430,-595}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["4_stand_block_guard_crash"] = {-430,-595}

    obj_pushboxs_data_game_scene_char_LP["4_stand_block_high"] = {}
    obj_pushboxs_data_game_scene_char_LP["4_stand_block_high"][0] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["4_stand_block_high"] = {}
    obj_hurtboxs_data_game_scene_char_LP["4_stand_block_high"][0] = stand_hurtbox
    obj_anchor_data_game_scene_char_LP["4_stand_block_high"] = {150,510}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["4_stand_block_high"] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["4_stand_block_high"] = {-430,-645}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["4_stand_block_high"] = {-430,-645}

    obj_pushboxs_data_game_scene_char_LP["4_stand_block_mid"] = {}
    obj_pushboxs_data_game_scene_char_LP["4_stand_block_mid"][0] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["4_stand_block_mid"] = {}
    obj_hurtboxs_data_game_scene_char_LP["4_stand_block_mid"][0] = stand_hurtbox
    obj_anchor_data_game_scene_char_LP["4_stand_block_mid"] = {175,510}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["4_stand_block_mid"] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["4_stand_block_mid"] = {-430,-440}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["4_stand_block_mid"] = {-430,-440}

    obj_pushboxs_data_game_scene_char_LP["1_crouch_block"] = {}
    obj_pushboxs_data_game_scene_char_LP["1_crouch_block"][0] = crouch_pushbox
    obj_hurtboxs_data_game_scene_char_LP["1_crouch_block"] = {}
    obj_hurtboxs_data_game_scene_char_LP["1_crouch_block"][0] = crouch_hurtbox
    obj_anchor_data_game_scene_char_LP["1_crouch_block"] = {295,275}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["1_crouch_block"] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["1_crouch_block"] = {-430,-475}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["1_crouch_block"] = {-430,-475}

    obj_pushboxs_data_game_scene_char_LP["1_crouch_block_guard_crash"] = {}
    obj_pushboxs_data_game_scene_char_LP["1_crouch_block_guard_crash"][0] = crouch_pushbox
    obj_hurtboxs_data_game_scene_char_LP["1_crouch_block_guard_crash"] = {}
    obj_hurtboxs_data_game_scene_char_LP["1_crouch_block_guard_crash"][0] = crouch_hurtbox
    obj_anchor_data_game_scene_char_LP["1_crouch_block_guard_crash"] = {340,297}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["1_crouch_block_guard_crash"] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["1_crouch_block_guard_crash"] = {-430,-475}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["1_crouch_block_guard_crash"] = {-430,-475}

    obj_pushboxs_data_game_scene_char_LP["1_4_7_air_block"] = {}
    obj_pushboxs_data_game_scene_char_LP["1_4_7_air_block"][0] = air_pushbox
    obj_pushboxs_data_game_scene_char_LP["1_4_7_air_block"][6] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block"] = {}
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block"][0] = air_hurtbox
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block"][6] = {{0,-190,220,380}}
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block"][7] = {{0,-195,205,390}}
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block"][8] = {{0,-200,200,400}}
    obj_anchor_data_game_scene_char_LP["1_4_7_air_block"] = {340,410}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["1_4_7_air_block"] = {-355,-160}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["1_4_7_air_block"] = {-420,-465}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["1_4_7_air_block"] = {-420,-465}

    obj_pushboxs_data_game_scene_char_LP["1_4_7_air_block_guard_crash"] = {}
    obj_pushboxs_data_game_scene_char_LP["1_4_7_air_block_guard_crash"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block_guard_crash"] = {}
    obj_hurtboxs_data_game_scene_char_LP["1_4_7_air_block_guard_crash"][0] = air_hurtbox
    obj_anchor_data_game_scene_char_LP["1_4_7_air_block_guard_crash"] = {370,310}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["1_4_7_air_block_guard_crash"] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver0_spawn_anchor_pos"]["1_4_7_air_block_guard_crash"] = {-420,-490}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["block_ver1_spawn_anchor_pos"]["1_4_7_air_block_guard_crash"] = {-420,-490}

    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["FD_block_spawn_anchor_pos"] = {}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["FD_block_spawn_anchor_pos"]["stand"] = {-300,-540}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["FD_block_spawn_anchor_pos"]["crouch"] = {-300,-420}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["FD_block_spawn_anchor_pos"]["air"] = {-300,-440}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_knockdown_wallstick_air"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_knockdown_wallstick_air"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_soft_knockdown_wallstick_air"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_soft_knockdown_wallstick_air"][0] = {{0,-120,240,400}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_soft_knockdown_wallstick_air"] = {210,345}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"][0] = air_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"][2] = OTG_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"][0] = {{0,-132,376,264}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"][2] = {{0,-105,430,210}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"][6] = OTG_hurtbox
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_knockdown_down"] = {320,330}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_general_hurt_hard_knockdown_down"] = {-367,-165}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"][0] = air_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"][2] = OTG_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"][0] = {{0,-155,280,310}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"][2] = {{0,-105,430,210}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"][6] = OTG_hurtbox
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_knockdown_head_down"] = {321,335}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_general_hurt_hard_knockdown_head_down"] = {-357,-168}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"][0] = air_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"][2] = OTG_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"][0] = {{0,-132,376,264}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"][2] = {{0,-105,430,210}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"][6] = OTG_hurtbox
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_knockdown_up"] = {240,285}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_general_hurt_hard_knockdown_up"] = {-390,-154}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"][0] = air_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"][3] = crouch_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"][4] = OTG_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"][0] = {{0,-120,240,400}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"][3] = {{0,-150,170,300}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"][4] = {{0,-112.5,220,225}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_knockdown_wallstick_ground"] = {315,355}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_general_hurt_hard_knockdown_wallstick_ground"] = {-343,-128}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_down"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_down"][0] = crouch_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_down"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_down"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_recovery_down"] = {323,509}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_up"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_up"][0] = crouch_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_up"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_up"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_recovery_up"] = {248,535}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_wallstick_ground"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_wallstick_ground"][0] = crouch_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_wallstick_ground"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_hard_recovery_wallstick_ground"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_hard_recovery_wallstick_ground"] = {248,535}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"][0] = OTG_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"][4] = crouch_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"][5] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_soft_recovery_ground"] = {305,575}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_general_hurt_soft_recovery_ground"] = {}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_general_hurt_soft_recovery_ground"][0] = {600,-195}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_general_hurt_soft_recovery_ground"][1] = {-335,-160}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_wallstick_air"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_wallstick_air"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_wallstick_air"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_soft_recovery_wallstick_air"][0] = {}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_soft_recovery_wallstick_air"] = {320,430}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_float"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_float"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_float"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_float"][0] = {{0,-60,320,420}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_float"][1] = {{0,-60,280,360}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_float"][3] = {{0,-60,300,330}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_float"][5] = {{0,-60,310,300}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_float"][7] = {{0,-60,350,290}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_float"][9] = {{0,-60,410,280}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_float"][11] = {{0,-60,410,300}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_launched_float"] = {269,275}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_groundbounce"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_groundbounce"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_groundbounce"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_groundbounce"][0] = {{0,-75,440,300}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_groundbounce"][2] = {{0,-80,470,290}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_groundbounce"][3] = {{0,-130,430,290}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_groundbounce"][4] = {{0,-135,400,290}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_launched_groundbounce"] = {270,290}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_high"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_high"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_high"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_high"][0] = {{0,-60,320,420}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_high"][1] = {{0,-60,400,330}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_high"][3] = {{0,-60,426,310}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_high"][5] = {{0,-75,440,300}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_high"][7] = {{0,-80,470,290}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_high"][8] = {{0,-130,430,290}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_high"][9] = {{0,-135,400,290}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_launched_high"] = {270,290}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_low"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_low"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_low"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_low"][0] = {{0,-96,330,360}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_low"][1] = {{0,-107,375,320}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_low"][2] = {{0,-110,460,220}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_launched_low"] = {300,330}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_hori_heavy"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_hori_heavy"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_hori_heavy"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_hori_heavy"][0] = {{0,-106,260,350}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_hori_heavy"][1] = {{0,-100,355,261}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_launched_mid_hori_heavy"] = {186,286}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_up"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_up"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_up"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_up"][0] = {{-12,-215,320,420}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_up"][1] = {{-12,-255,240,500}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_up"][3] = {{-12,-230,280,460}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_up"][4] = {{-12,-205,340,420}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_up"][5] = {{-12,-195,340,400}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_up"][6] = {{-12,-220,335,350}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_mid_up"][7] = {{-12,-265,240,550}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_launched_mid_up"] = {282,550}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_rolling"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_rolling"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_rolling"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_rolling"][0] = {{0,-50,370,380}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_launched_rolling"] = {215,265}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_rotate"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_rotate"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_rotate"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_rotate"][0] = {{0,-74,400,390}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_launched_rotate"] = {225,290}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_wallbounce"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_launched_wallbounce"][0] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_wallbounce"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_wallbounce"][0] = {{0,-68,270,350}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_wallbounce"][1] = {{0,-68,250,480}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_wallbounce"][2] = {{0,-68,330,450}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_launched_wallbounce"][3] = {{0,-68,374,380}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_launched_wallbounce"] = {233,317}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_mid"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_mid"][0] = air_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_mid"][3] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_mid"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_mid"][0] = {{0,-145,285,450}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_mid"][1] = {{0,-148,270,360}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_mid"][3] = {{0,-187.5,290,375}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_mid"][4] = {{0,-190,210,380}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_mid"][5] = {{0,-207.5,190,415}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_mid"][6] = {{0,-215,170,430},{0,-445,100,30}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_semi_launched_mid"] = {265,510}

    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_rotate"] = {}
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_rotate"][0] = stand_pushbox
    obj_pushboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_rotate"][12] = OTG_pushbox
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_rotate"] = {}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_rotate"][0] = {{0,-225,220,450}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_rotate"][1] = {{0,-240,220,480}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_rotate"][2] = {{0,-252.5,220,505}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_rotate"][10] = {{0,-230,270,460}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_rotate"][11] = {{0,-190,350,380}}
    obj_hurtboxs_data_game_scene_char_LP["0_general_hurt_semi_launched_rotate"][12] = {{0,-150,380,300}}
    obj_anchor_data_game_scene_char_LP["0_general_hurt_semi_launched_rotate"] = {255,525}

    obj_anchor_data_game_scene_char_LP["0_ground_Launcher_teching"] = {205,400}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_ground_Launcher_teching"] = {-750,-190}
    obj_anchor_data_game_scene_char_LP["0_ground_Launcher_teched"] = {223,510}
    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["stage_VFX_spawn_anchor_pos"]["0_ground_Launcher_teched"] = {-850,-195}

    obj_anchor_data_game_scene_char_LP["air_thrown_tested"] = {340,430}
    obj_anchor_data_game_scene_char_LP["ground_thrown_tested"] = {150,530}

    obj_pushboxs_data_game_scene_char_LP["RC"] = {}
    obj_hurtboxs_data_game_scene_char_LP["RC"] = {}
    obj_anchor_data_game_scene_char_LP["RC"] = {}
    
    obj_pushboxs_data_game_scene_char_LP["RC"]["stand"] = stand_pushbox
    obj_hurtboxs_data_game_scene_char_LP["RC"]["stand"] = {{0,-250,230,500}}
    obj_anchor_data_game_scene_char_LP["RC"]["stand"] = {300,615}

    obj_pushboxs_data_game_scene_char_LP["RC"]["air"] = air_pushbox
    obj_hurtboxs_data_game_scene_char_LP["RC"]["air"] = {{0,-120,230,500}}
    obj_anchor_data_game_scene_char_LP["RC"]["air"] = {330,485}

    obj_VFX_spawn_anchor_pos_data_game_scene_char_LP["wallstick_spawn_anchor_pos"] = {
        ["stand"] = 865,
        ["crouch"] = 765,
        ["air"] = 715,
        ["OTG"] = 775,
    }
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
function load_game_scene_wallbreak_start_init_LP()
    local stand_pushbox = {0,-185,120,370}
    local crouch_pushbox = {0,-142.5,120,285}
    local air_pushbox = {0,-100,120,200}
    local OTG_pushbox = {0,-65,120,130}
    -- init_char
    obj_char_game_scene_char_LP["strike_inv"] = false
    obj_char_game_scene_char_LP["strike_inv_countdown"] = 0
    obj_char_game_scene_char_LP["throw_inv"] = false
    obj_char_game_scene_char_LP["throw_inv_countdown"] = 0
    obj_char_game_scene_char_LP["projectile_inv"] = false
    obj_char_game_scene_char_LP["projectile_inv_countdown"] = 0

    obj_char_game_scene_char_LP["velocity"] = {0,0}
    obj_char_game_scene_char_LP["velocity_debug"] = {0,0}
    obj_char_game_scene_char_LP["velocity_cache"] = {0,0}
    obj_char_game_scene_char_LP["friction"] = 1
    obj_char_game_scene_char_LP["gravity"] = 2.5
    obj_char_game_scene_char_LP["physics_lock"] = true

    obj_char_game_scene_char_LP["game_speed"] = 1
    obj_char_game_scene_char_LP["game_speed_subframe"] = 1
    obj_char_game_scene_char_LP["game_speed_abnormal_realtime_countdown"] = 0 -- 只能是game_speed的倍数
    obj_char_game_scene_char_LP["game_speed_force_0_countdown"] = 0 -- 只能是game_speed的倍数
    obj_char_game_scene_char_LP["game_speed_force_1_countdown"] = 0
    obj_char_game_scene_char_LP["game_speed_application"] = {0,1,1,0,0,0}
    
    obj_char_game_scene_char_LP["hit_hurt_blockstop_countdown"] = 0
    obj_char_game_scene_char_LP["hit_hurt_block_slowdown_countdown"] = 0

    obj_char_game_scene_char_LP["pushbox_other_side_char_active"] = false
    obj_char_game_scene_char_LP["hitbox_table"] = {}
    obj_char_game_scene_char_LP["hurtbox_table"] = {}
end
function load_game_scene_wallbreak_mid_init_LP()
    if not common_game_scene_get_character_facing_currect(obj_char_game_scene_char_LP) then
        obj_char_game_scene_char_LP[5] = -obj_char_game_scene_char_LP[5]
    end
    obj_char_game_scene_char_LP["projectile_table"] = {}
    obj_char_game_scene_char_LP["VFX_front_table"] = {}
    obj_char_game_scene_char_LP["VFX_back_table"] = {}
    obj_char_game_scene_char_LP["VFX_hit_front_table"] = {}
    obj_char_game_scene_char_LP["VFX_hit_back_table"] = {}

    obj_char_game_scene_char_LP["shot_sys_state"] = "off"
    obj_char_game_scene_char_LP["shot_sys_f"] = 0

    obj_char_game_scene_char_LP["shot_sys_oroboros_state"] = "off"
    obj_char_game_scene_char_LP["shot_sys_oroboros_f"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_aim_r"] = 0.42
    obj_char_game_scene_char_LP["shot_sys_oroboros_animation_table"] = {}

    obj_char_game_scene_char_LP["shot_sys_oroboros_front"] = {0,0,0,0,1,1,0,0}
    obj_char_game_scene_char_LP["shot_sys_oroboros_front"]["f_8"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_front"]["f_4"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_front"]["sprite_sheet_state"] = "5H_oroboros_loop_front"
    obj_char_game_scene_char_LP["shot_sys_oroboros_mid"] = {0,0,0,0,1,1,0,0}
    obj_char_game_scene_char_LP["shot_sys_oroboros_mid"]["f_8"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_mid"]["sprite_sheet_state"] = "5H_oroboros_loop_mid"
    obj_char_game_scene_char_LP["shot_sys_oroboros_back"] = {0,0,0,0,1,1,0,0}
    obj_char_game_scene_char_LP["shot_sys_oroboros_back"]["f_8"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_back"]["f_4"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_back"]["sprite_sheet_state"] = "5H_oroboros_loop_back"

    obj_char_game_scene_char_LP["shot_sys_reticle_state"] = "off"
    obj_char_game_scene_char_LP["shot_sys_reticle"] = {0,0,0,0,1,1,0,0}
    obj_char_game_scene_char_LP["shot_sys_reticle_f"] = 0
    obj_char_game_scene_char_LP["shot_sys_reticle_f_4"] = 0
    obj_char_game_scene_char_LP["shot_sys_reticle_f_8"] = 0
    obj_char_game_scene_char_LP["shot_sys_reticle_animation_table"] = {}
    obj_char_game_scene_char_LP["shot_sys_reticle_stage_pos_current"] = {0,0}
    obj_char_game_scene_char_LP["shot_sys_reticle_stage_pos_target"] = {0,0}
    obj_char_game_scene_char_LP["shot_sys_reticle_sprite_sheet_state"] = "5H_reticle_unlocked"
end
function load_game_scene_wallbreak_end_init_LP()
    -- x y z opacity sx sy r f
    obj_char_game_scene_char_LP["basic_prop_cache"] = {0,0,0,1,1,1,0,0}
    -- state
    obj_char_game_scene_char_LP["state_cache"] = "none"
    obj_char_game_scene_char_LP["hit_type_state"] = "none" -- none strike throw burst projectile
    obj_char_game_scene_char_LP["hit_guard_type_state"] = "none" -- none all low mid high
    obj_char_game_scene_char_LP["hurt_state"] = "idle" -- idle unblock punish counter GP parry
    obj_char_game_scene_char_LP["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
    obj_char_game_scene_char_LP["move_state"] = "none" -- none startup active recovery
    obj_char_game_scene_char_LP["last_move_state"] = "none" -- none startup active recovery
    obj_char_game_scene_char_LP["hurt_block_at_current_frame"] = false

    -- input
    obj_char_game_scene_char_LP["direction_input"] = 5
    obj_char_game_scene_char_LP["direction_input_cache_hit_jump_cancel"] = 5
    obj_char_game_scene_char_LP["startup_frame"] = 0
    obj_char_game_scene_char_LP["active_frame"] = 0
    obj_char_game_scene_char_LP["recovery_frame"] = 0
    obj_char_game_scene_char_LP["frame_adv"] = 0
    obj_char_game_scene_char_LP["last_hitstop_frame"] = 0

        -- hit_hurt_block_animation
    obj_char_game_scene_char_LP["hit_damage"] = 0
    obj_char_game_scene_char_LP["hit_damage_correction_factor"] = 1
    obj_char_game_scene_char_LP["hit_heat_gain"] = 0
    obj_char_game_scene_char_LP["hit_wallbreak_damage"] = 0
    obj_char_game_scene_char_LP["hurt_heat_gain"] = 0
    obj_char_game_scene_char_LP["blocked_heat_gain"] = 0
    obj_char_game_scene_char_LP["block_heat_gain"] = 0
    obj_char_game_scene_char_LP["block_risk_gauge_gain"] = 0
    obj_char_game_scene_char_LP["FD_block_heat_drain"] = 0

    obj_char_game_scene_char_LP["wallhurt_wallstick_on_side"] = 0
    obj_char_game_scene_char_LP["wallhurt_wallstickable"] = false
    obj_char_game_scene_char_LP["wallhurt_wallbreakable_with_wallstick"] = false
    obj_char_game_scene_char_LP["wallhurt_wallbreakable_without_wallstick"] = false
    obj_char_game_scene_char_LP["wallhurt_wallbreak_adv"] = false

    obj_char_game_scene_char_LP["hit_cancel"] = false
    obj_char_game_scene_char_LP["idle_cancel"] = false

    obj_char_game_scene_char_LP["strike_active"] = false -- 防止在同一动作的active多次触发
    obj_char_game_scene_char_LP["throw_active"] = false -- 防止在同一动作的active多次触发

    obj_char_game_scene_char_LP["strike_inv"] = false
    obj_char_game_scene_char_LP["strike_inv_countdown"] = 0
    obj_char_game_scene_char_LP["throw_inv"] = false
    obj_char_game_scene_char_LP["throw_inv_countdown"] = 0
    obj_char_game_scene_char_LP["projectile_inv"] = false
    obj_char_game_scene_char_LP["projectile_inv_countdown"] = 0

    -- state_number
    obj_char_game_scene_char_LP["velocity"] = {0,0}
    obj_char_game_scene_char_LP["velocity_debug"] = {0,0}
    obj_char_game_scene_char_LP["velocity_cache"] = {0,0}
    obj_char_game_scene_char_LP["friction"] = 1
    obj_char_game_scene_char_LP["gravity"] = 2.5
    obj_char_game_scene_char_LP["physics_lock"] = false

    obj_char_game_scene_char_LP["wallstick_gauge"] = {0.0,200.0} -- 0.0 - 200.0


    obj_char_game_scene_char_LP["heat_penalty"] = 1
    obj_char_game_scene_char_LP["heat_penalty_countdown"] = 0
    obj_char_game_scene_char_LP["ability_penalty"] = 1
    obj_char_game_scene_char_LP["ability_penalty_countdown"] = 0
    obj_char_game_scene_char_LP["positive_bonus"] = false
    obj_char_game_scene_char_LP["positive_bonus_heat_gain_buff"] = 1
    obj_char_game_scene_char_LP["positive_bonus_hit_damage_buff"] = 1
    obj_char_game_scene_char_LP["positive_bonus_hurt_damage_buff"] = 1
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
    obj_char_game_scene_char_LP["game_speed_force_0_countdown"] = 0 -- 只能是game_speed的倍数
    obj_char_game_scene_char_LP["game_speed_force_1_countdown"] = 0
    obj_char_game_scene_char_LP["game_speed_application"] = {0,1,1,0,0,0}
    
    obj_char_game_scene_char_LP["hit_hurt_blockstop_countdown"] = 0
    obj_char_game_scene_char_LP["hit_hurt_block_slowdown_countdown"] = 0

    -- collide
    obj_char_game_scene_char_LP["collision_move_available"] = {1,1}
    obj_char_game_scene_char_LP["collision_move_available_cache"] = {1,1}
    obj_char_game_scene_char_LP["collision_ground_height_offset"] = 0 -- 用于检测和地面碰撞的

    -- sub_obj_table
    obj_char_game_scene_char_LP["projectile_table"] = {}
    obj_char_game_scene_char_LP["VFX_HUD_table"] = {}
    obj_char_game_scene_char_LP["VFX_front_table"] = {}
    obj_char_game_scene_char_LP["VFX_back_table"] = {}
    obj_char_game_scene_char_LP["VFX_hit_front_table"] = {}
    obj_char_game_scene_char_LP["VFX_hit_back_table"] = {}
    
    -- 5H_shot_sys
    obj_char_game_scene_char_LP["shot_sys_state"] = "off"
    obj_char_game_scene_char_LP["shot_sys_f"] = 0
    obj_char_game_scene_char_LP["shot_sys_fire_cancel"] = false
    obj_char_game_scene_char_LP["shot_sys_idle_cancel"] = false
    obj_char_game_scene_char_LP["shot_sys_aim_process"] = {0,0,420,450,false} -- 当前值 当前速度 瞄准命中最低值 瞄准命中最高保存值 上一帧是否高于瞄准命中最低数值
    obj_char_game_scene_char_LP["shot_sys_animation"] = nil
    obj_char_game_scene_char_LP["shot_sys_camera_shake_table"] = {}

    -- 5H_shot_sys_oroboros
    obj_char_game_scene_char_LP["shot_sys_oroboros_state"] = "off"
    obj_char_game_scene_char_LP["shot_sys_oroboros_f"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_aim_r"] = 0.42
    obj_char_game_scene_char_LP["shot_sys_oroboros_animation_table"] = {}
    -- 5H_shot_sys_oroboros_sub_obj
    obj_char_game_scene_char_LP["shot_sys_oroboros_front"] = {0,0,0,0,1,1,0,0}
    obj_char_game_scene_char_LP["shot_sys_oroboros_front"]["f_8"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_front"]["f_4"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_front"]["sprite_sheet_state"] = "5H_oroboros_loop_front"
    obj_char_game_scene_char_LP["shot_sys_oroboros_mid"] = {0,0,0,0,1,1,0,0}
    obj_char_game_scene_char_LP["shot_sys_oroboros_mid"]["f_8"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_mid"]["sprite_sheet_state"] = "5H_oroboros_loop_mid"
    obj_char_game_scene_char_LP["shot_sys_oroboros_back"] = {0,0,0,0,1,1,0,0}
    obj_char_game_scene_char_LP["shot_sys_oroboros_back"]["f_8"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_back"]["f_4"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_back"]["sprite_sheet_state"] = "5H_oroboros_loop_back"
    -- 5H_shot_sys_oroboros_sub_obj_update_value
    obj_char_game_scene_char_LP["shot_sys_oroboros_offset_amount"] = 0
    obj_char_game_scene_char_LP["shot_sys_oroboros_anchor_pos"] = {-110,-455}
    obj_char_game_scene_char_LP["shot_sys_oroboros_ease_current"] = {
        obj_char_game_scene_char_LP["x"] + obj_char_game_scene_char_LP[5] * obj_char_game_scene_char_LP["shot_sys_oroboros_anchor_pos"][1],
        obj_char_game_scene_char_LP["y"] + obj_char_game_scene_char_LP[6] * obj_char_game_scene_char_LP["shot_sys_oroboros_anchor_pos"][2],
        obj_char_game_scene_char_LP[5],
        obj_char_game_scene_char_LP[6]
    }
    obj_char_game_scene_char_LP["shot_sys_oroboros_ease_target"] = {
        obj_char_game_scene_char_LP["x"] + obj_char_game_scene_char_LP[5] * obj_char_game_scene_char_LP["shot_sys_oroboros_anchor_pos"][1],
        obj_char_game_scene_char_LP["y"] + obj_char_game_scene_char_LP[6] * obj_char_game_scene_char_LP["shot_sys_oroboros_anchor_pos"][2],
        obj_char_game_scene_char_LP[5],
        obj_char_game_scene_char_LP[6]
    }
    -- 5H_shot_sys_reticle
    obj_char_game_scene_char_LP["shot_sys_reticle_state"] = "off"
    obj_char_game_scene_char_LP["shot_sys_reticle"] = {0,0,0,0,1,1,0,0}
    obj_char_game_scene_char_LP["shot_sys_reticle_f"] = 0
    obj_char_game_scene_char_LP["shot_sys_reticle_f_4"] = 0
    obj_char_game_scene_char_LP["shot_sys_reticle_f_8"] = 0
    obj_char_game_scene_char_LP["shot_sys_reticle_animation_table"] = {}
    obj_char_game_scene_char_LP["shot_sys_reticle_stage_pos_current"] = {0,0}
    obj_char_game_scene_char_LP["shot_sys_reticle_stage_pos_target"] = {0,0}
    obj_char_game_scene_char_LP["shot_sys_reticle_sprite_sheet_state"] = "5H_reticle_unlocked"
end

-- 更新和状态机
function update_game_scene_char_LP()
    state_machine_char_game_scene_char_LP()
end
function update_game_scene_char_LP_attachment()
    state_machine_char_game_scene_char_LP_shot_sys()
    state_machine_char_game_scene_char_LP_shot_sys_reticle()
    state_machine_char_game_scene_char_LP_shot_sys_oroboros()
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
    --     "P","S","H","K",
    --     "SP","Launcher","back","start",
    --     "RC","dash","burst","UA"
    -- }

    -- sp + Launcher 普通投

    local input = INPUT_SYS_CURRENT_COMMAND_STATE["L"]
    local obj_char = obj_char_game_scene_char_LP
    local obj_char_other_side = common_game_scene_change_character("L")
    local game_speed_cache = obj_char["game_speed"]
    local game_speed_subframe_cache = obj_char["game_speed_subframe"]
    local run_at_current_frame = false

    if obj_char["game_speed_force_1_countdown"] > 0 then
        game_speed_cache = 1
    end
    if obj_char["game_speed_force_0_countdown"] > 0 then
        game_speed_cache = 0
    end
    run_at_current_frame = (game_speed_subframe_cache > game_speed_cache and game_speed_cache ~= 0) or (game_speed_cache == 1)

    local switch = {
        ["before_ease_in"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
        end,

        ["active_FD_block"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_active_FD_block(input,obj_char)
        end,
        ["active_FD_block_to_idle"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_active_FD_block_to_idle(input,obj_char)
        end,
        ["block"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_block(input,obj_char)
        end,
        ["hurt"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_hurt(input,obj_char)
        end,
        ["throw_success"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_throw_success(input,obj_char)
        end,
        ["throw_hurt_success"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_throw_hurt_success(input,obj_char)
        end,
        ["throw_testing"] = function()
            state_gate_game_scene_char_LP_from_throw_testing(input,obj_char)
        end,
        ["throw_tested"] = function()
            state_gate_game_scene_char_LP_from_throw_tested(input,obj_char)
        end,
        ["throw_teching"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_throw_tech(input,obj_char)
        end,
        ["throw_teched"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_throw_tech(input,obj_char)
        end,

        ["hitstop"] = function()
            common_update_game_scene_char_hitstop_countdown(obj_char)
            state_gate_game_scene_char_LP_from_hitstop(input,obj_char)
        end,
        ["hurtstop"] = function()
            common_update_game_scene_char_blockstop_hurtstop_countdown(obj_char)
            state_gate_game_scene_char_LP_from_hurtstop(input,obj_char)
        end,
        ["blockstop"] = function()
            if run_at_current_frame then
                common_update_game_scene_char_blockstop_hurtstop_countdown(obj_char)
            end
            state_gate_game_scene_char_LP_from_blockstop(input,obj_char)
        end,

        ["wallstick"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_wallstick(input,obj_char)
        end,
        ["wallbreak_hurt"] = function()
        end,
        ["wallbreak_hit"] = function()
        end,

        ["knockdown"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_knockdown(input,obj_char)
        end,
        ["knockdown_recovery"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_knockdown_recovery(input,obj_char)
        end,
        ["knockdown_recovery_wallstick"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_knockdown_recovery_wallstick(input,obj_char)
        end,
        ["knockout"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
        end,

        ["1_2_3_crouch"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_1_2_3_crouch(input,obj_char)
        end,
        ["1_2_3_crouch_turn"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_1_2_3_crouch_turn(input,obj_char)
        end,
        ["1_2_3_crouch_to_stand_idle"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_1_2_3_crouch_to_stand_idle(input,obj_char)
        end,
        ["5_stand_idle"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char)
            state_gate_game_scene_char_LP_to_5H(input,obj_char)
        end,
        ["5_stand_turn"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        end,
        ["5_stand_dash_skid"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_5_stand_dash_skid(input,obj_char)
        end,
        ["4_walk"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4_walk(input,obj_char)
        end,
        ["4_walk_to_stand_idle"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4_walk_to_stand_idle(input,obj_char)
        end,
        ["6_walk"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_6_walk(input,obj_char)
        end,
        ["6_walk_to_stand_idle"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_6_walk_to_stand_idle(input,obj_char)
        end,

        ["7_8_9_jump_air_to_stand_idle"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char)
        end,
        ["7_8_9_jump_air"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char)
        end,
        ["7_8_9_pre_jump"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_7_8_9_pre_jump(input,obj_char)
        end,
        
        ["4dash_backdash"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4dash_backdash(input,obj_char)
        end,
        ["4dash_air_backdash"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4dash_air_backdash(input,obj_char)
        end,
        ["6dash_dash"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_6dash_dash(input,obj_char)
        end,
        ["6dash_air_dash"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_6dash_air_dash(input,obj_char)
        end,
        ["6dash_dash_cancel"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_6dash_dash_cancel(input,obj_char)
        end,
        
        ["burst_RC_red"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_burst_RC_red(input,obj_char)
        end,
        ["burst_RC_blue"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_burst_RC_blue(input,obj_char)
        end,
        ["burst_RC_purple"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_burst_RC_purple(input,obj_char)
        end,
        ["burst_RC_yellow"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_burst_RC_yellow(input,obj_char)
        end,

        ["burst_overdrive"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_burst_overdrive(input,obj_char)
        end,
        ["burst_burst"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_burst_burst(input,obj_char)
        end,

        ["2P"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_2P(input,obj_char)
        end,
        ["6P"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_6P(input,obj_char)
        end,
        ["5P"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_5P(input,obj_char)
        end,
        ["2K"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_2K(input,obj_char)
        end,
        ["6K"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_6K(input,obj_char)
        end,
        ["5K"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_5K(input,obj_char)
        end,
        ["2S"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_2S(input,obj_char)
        end,
        ["6S"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_6S(input,obj_char)
        end,
        ["cS"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_cS(input,obj_char)
        end,
        ["fS"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_fS(input,obj_char)
        end,
        ["5H"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_5H(input,obj_char)
        end,
        ["2Launcher"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_2Launcher(input,obj_char)
        end,
        ["4_6Launcher"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4_6Launcher(input,obj_char)
        end,
        ["5Launcher"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_5Launcher(input,obj_char)
        end,
        ["5Launcher_hold"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_5Launcher_hold(input,obj_char)
        end,

        ["jP"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_jP(input,obj_char)
        end,
        ["jK"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_jK(input,obj_char)
        end,
        ["j2K"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_j2K(input,obj_char)
        end,
        ["jS"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_jS(input,obj_char)
        end,
        ["j2S"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_j2S(input,obj_char)
        end,
        ["j4_6Launcher"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_j4_6Launcher(input,obj_char)
        end,
        ["j5Launcher"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_j5Launcher(input,obj_char)
        end,

        ["4SP_P"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4SP_P(input,obj_char)
        end,
        ["6SP_P"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_6SP_P(input,obj_char)
        end,
        ["4SP_K"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4SP_K(input,obj_char)
        end,
        ["6SP_K"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_6SP_K(input,obj_char)
        end,
        ["4SP_S"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4SP_S(input,obj_char)
        end,
        ["4SP_S_4dash"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4SP_S_4dash(input,obj_char)
        end,
        ["4SP_S_6dash"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4SP_S_6dash(input,obj_char)
        end,
        ["4SP_S_S"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4SP_S_S(input,obj_char)
        end,
        ["4SP_S_H"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4SP_S_H(input,obj_char)
        end,
        ["4SP_S_2Launcher"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4SP_S_2Launcher(input,obj_char)
        end,
        ["4SP_S_6Launcher"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4SP_S_6Launcher(input,obj_char)
        end,
        ["4SP_S_5Launcher"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4SP_S_5Launcher(input,obj_char)
        end,
        ["6SP_S"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_6SP_S(input,obj_char)
        end,
        ["SP_H"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_SP_H(input,obj_char)
        end,
        ["SP_H_P"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_SP_H_P(input,obj_char)
        end,
        ["SP_H_K"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_SP_H_K(input,obj_char)
        end,
        ["SP_H_S"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_SP_H_S(input,obj_char)
        end,
        ["SP_H_H"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_SP_H_H(input,obj_char)
        end,

        ["jSP_S"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_jSP_S(input,obj_char)
        end,
        ["jSP_H"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_jSP_H(input,obj_char)
        end,
        ["jSP_H_P"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_jSP_H_P(input,obj_char)
        end,
        ["jSP_H_K"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_jSP_H_K(input,obj_char)
        end,
        ["jSP_H_S"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_jSP_H_S(input,obj_char)
        end,
        ["jSP_H_H"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_jSP_H_H(input,obj_char)
        end,

        ["4UA"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4UA(input,obj_char)
        end,
        ["6UA"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_6UA(input,obj_char)
        end,
        ["5UA"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_5UA(input,obj_char)
        end,
        ["4SP_S_5UA"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["character_animation"])
            end
            state_gate_game_scene_char_LP_from_4SP_S_5UA(input,obj_char)
        end,
    }
    if run_at_current_frame then
        update_game_scene_char_LP_uncommon()
    end
    local this_function = switch[obj_char["state"]]
    if this_function then this_function() end
end
function state_machine_char_game_scene_char_LP_shot_sys()
    local input = INPUT_SYS_CURRENT_COMMAND_STATE["L"]
    local obj_char = obj_char_game_scene_char_LP
    local game_speed_cache = obj_char["game_speed"]
    local game_speed_subframe_cache = obj_char["game_speed_subframe"]
    local test_input_idle_to_ease_out = 
    (test_input_sys_press(input["H"]) and common_game_scene_check_crouch_direction(obj_char)) or obj_char["ability_gauge"][1] <= 0 
    local test_input_shot_to_ease_out = 
    (test_input_sys_press(input["H"]) and common_game_scene_check_crouch_direction(obj_char)) or
    (test_input_sys_release(input["H"]) and common_game_scene_check_crouch_direction(obj_char)) or obj_char["ability_gauge"][1] <= 0 
    local test_shot_sys_ban_state = obj_char["shot_sys_at_the_ready_force_off_state"][obj_char["state"]]
    local run_at_current_frame = (game_speed_subframe_cache > game_speed_cache and game_speed_cache ~= 0) or (game_speed_cache == 1)
    -- state_machine
    local switch = {
        ["off"] = function()
            if run_at_current_frame then
                character_function_game_scene_TRM_shot_sys_off_update(obj_char)
            end
            -- ease_in
            if test_input_sys_press(input["H"]) and (not test_shot_sys_ban_state) and obj_char["ability_gauge"][1] > 0 then
                character_function_game_scene_TRM_shot_sys_at_the_ready_ease_in_init(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready_ease_in"
                return
            end
        end,
        ["at_the_ready_ease_in"] = function()
            if run_at_current_frame then
                character_function_game_scene_TRM_shot_sys_at_the_ready_ease_in_update(obj_char)
            end
            if (obj_char["shot_sys_idle_cancel"] and test_input_idle_to_ease_out) or test_shot_sys_ban_state then
                character_function_game_scene_TRM_shot_sys_at_the_ready_ease_out_init(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready_ease_out"
                return
            end
            if test_input_sys_release(input["H"]) and obj_char["state"] == "hitstop" then
                -- input_sys_cache
                obj_char["input_sys_state_negative_edge"] = "save" -- none save load
                common_game_scene_get_input_sys_cache_negative_edge_init(obj_char["player_side"])(obj_char)
                obj_char["input_sys_cache_negative_edge"]["H"] = true
            end
            if obj_char["shot_sys_fire_cancel"] and test_input_sys_release(input["H"]) 
            and obj_char["state"] ~= "hitstop" and obj_char["ability_gauge"][1] > 0 then
                obj_char["input_sys_cache_negative_edge"]["H"] = false
                character_function_game_scene_TRM_shot_sys_at_the_ready_shot_init(obj_char)
                character_function_game_scene_TRM_shot_sys_ability_gauge_use(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready_shot"
                return
            end
            if get_character_anim_end_state(obj_char,obj_char["shot_sys_animation"])  then
                character_function_game_scene_TRM_shot_sys_at_the_ready_init(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready"
                return
            end
        end,
        ["at_the_ready_ease_out"] = function()
            if run_at_current_frame then
                character_function_game_scene_TRM_shot_sys_at_the_ready_ease_out_update(obj_char)
            end
            if test_input_sys_press(input["H"]) and (not test_shot_sys_ban_state) then
                character_function_game_scene_TRM_shot_sys_at_the_ready_ease_in_init(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready_ease_in"
                return
            end
            if get_character_anim_end_state(obj_char,obj_char["shot_sys_animation"]) then
                character_function_game_scene_TRM_shot_sys_off_init(obj_char)
                obj_char["shot_sys_state"] = "off"
                return
            end
        end,
        ["at_the_ready"] = function()
            if run_at_current_frame then
                character_function_game_scene_TRM_shot_sys_at_the_ready_update(obj_char)
            end
            if test_input_idle_to_ease_out or test_shot_sys_ban_state then
                obj_char["input_sys_cache_negative_edge"]["H"] = false
                character_function_game_scene_TRM_shot_sys_at_the_ready_ease_out_init(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready_ease_out"
                return
            end
            if test_input_sys_release(input["H"]) and obj_char["state"] == "hitstop" then
                obj_char["input_sys_cache_negative_edge"]["H"] = true
            end
            if obj_char["shot_sys_fire_cancel"] and test_input_sys_release(input["H"]) 
            and obj_char["state"] ~= "hitstop" and obj_char["ability_gauge"][1] > 0 then
                obj_char["input_sys_cache_negative_edge"]["H"] = false
                character_function_game_scene_TRM_shot_sys_at_the_ready_shot_init(obj_char)
                character_function_game_scene_TRM_shot_sys_ability_gauge_use(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready_shot"
                return
            end
        end,
        ["at_the_ready_shot"] = function()
            if run_at_current_frame then
                character_function_game_scene_TRM_shot_sys_at_the_ready_shot_update(obj_char)
            end
            if (obj_char["shot_sys_idle_cancel"] and test_input_shot_to_ease_out) or test_shot_sys_ban_state then
                character_function_game_scene_TRM_shot_sys_at_the_ready_ease_out_init(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready_ease_out"
                return
            end
            if obj_char["shot_sys_fire_cancel"] and test_input_sys_release(input["H"]) 
            and obj_char["state"] ~= "hitstop" and obj_char["ability_gauge"][1] > 0 then
                obj_char["input_sys_cache_negative_edge"]["H"] = false
                character_function_game_scene_TRM_shot_sys_at_the_ready_shot_init(obj_char)
                character_function_game_scene_TRM_shot_sys_ability_gauge_use(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready_shot"
                return
            end
            if get_character_anim_end_state(obj_char,obj_char["shot_sys_animation"]) then
                character_function_game_scene_TRM_shot_sys_at_the_ready_init(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready"
                return
            end
        end,
        ["steady_aim_ease_in"] = function()
            obj_char["hurt_state"] = "counter"
            character_function_game_scene_TRM_shot_sys_reticle_steady_aim_update(obj_char)
        end,
        ["steady_aim_ease_out"] = function()
            obj_char["hurt_state"] = "counter"
            character_function_game_scene_TRM_shot_sys_reticle_steady_aim_update(obj_char)
        end,
        ["steady_aim"] = function()
            obj_char["hurt_state"] = "counter"
            character_function_game_scene_TRM_shot_sys_reticle_steady_aim_update(obj_char)
        end,
        ["steady_aim_shot"] = function()
            character_function_game_scene_TRM_shot_sys_at_the_ready_shot_update(obj_char)
            if (obj_char["shot_sys_idle_cancel"] and test_input_shot_to_ease_out) or test_shot_sys_ban_state then
                character_function_game_scene_TRM_shot_sys_at_the_ready_ease_out_init(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready_ease_out"
                return
            end
            if test_input_sys_release(input["H"]) and obj_char["state"] == "hitstop" then
                obj_char["input_sys_cache_negative_edge"]["H"] = true
            end
            if obj_char["shot_sys_fire_cancel"] and test_input_sys_release(input["H"]) and obj_char["state"] ~= "hitstop" then
                obj_char["input_sys_cache_negative_edge"]["H"] = false
                character_function_game_scene_TRM_shot_sys_at_the_ready_shot_init(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready_shot"
                return
            end
            if get_character_anim_end_state(obj_char,obj_char["shot_sys_animation"]) then
                character_function_game_scene_TRM_shot_sys_at_the_ready_init(obj_char)
                obj_char["shot_sys_state"] = "at_the_ready"
                return
            end
        end,
    }
    local this_function = switch[obj_char["shot_sys_state"]]
    if this_function then this_function() end
end
function state_machine_char_game_scene_char_LP_shot_sys_oroboros()
    local obj_char = obj_char_game_scene_char_LP
    local game_speed_cache = obj_char["game_speed"]
    local game_speed_subframe_cache = obj_char["game_speed_subframe"]
    local run_at_current_frame = (game_speed_subframe_cache > game_speed_cache and game_speed_cache ~= 0) or (game_speed_cache == 1)
    local switch = {
        ["off"] = function()
        end,
        ["ease_in"] = function()
            if run_at_current_frame then
                character_animator(obj_char["shot_sys_oroboros_front"],obj_char["shot_sys_oroboros_animation_table"][1])
                character_animator(obj_char["shot_sys_oroboros_front"],obj_char["shot_sys_oroboros_animation_table"][2])
                character_animator(obj_char["shot_sys_oroboros_mid"],obj_char["shot_sys_oroboros_animation_table"][3])
                character_animator(obj_char["shot_sys_oroboros_back"],obj_char["shot_sys_oroboros_animation_table"][4])
                character_animator(obj_char["shot_sys_oroboros_back"],obj_char["shot_sys_oroboros_animation_table"][5])
                character_function_game_scene_TRM_shot_sys_oroboros_pos_update(obj_char)
            end
            if get_character_anim_end_state(obj_char["shot_sys_oroboros_mid"],obj_char["shot_sys_oroboros_animation_table"][3]) then
                obj_char["shot_sys_oroboros_front"][4] = 1
                obj_char["shot_sys_oroboros_back"][4] = 1
                obj_char["shot_sys_oroboros_animation_table"][3] = load_game_scene_anim_char_TRM_5H_oroboros_mid_loop(obj_char["shot_sys_oroboros_mid"])
                init_character_anim_with(obj_char["shot_sys_oroboros_mid"],obj_char["shot_sys_oroboros_animation_table"][3])
                character_function_game_scene_TRM_shot_sys_oroboros_pos_update(obj_char)
                obj_char["shot_sys_oroboros_state"] = "at_the_ready_or_steady_aim"
                return
            end
        end,
        ["at_the_ready_or_steady_aim"] = function()
            if run_at_current_frame then
                character_animator(obj_char["shot_sys_oroboros_front"],obj_char["shot_sys_oroboros_animation_table"][2])
                character_animator(obj_char["shot_sys_oroboros_mid"],obj_char["shot_sys_oroboros_animation_table"][3])
                character_animator(obj_char["shot_sys_oroboros_back"],obj_char["shot_sys_oroboros_animation_table"][5])
                character_function_game_scene_TRM_shot_sys_oroboros_pos_update(obj_char)
            end
        end,
        ["ease_out"] = function()
            if run_at_current_frame then
                character_animator(obj_char["shot_sys_oroboros_front"],obj_char["shot_sys_oroboros_animation_table"][1])
                character_animator(obj_char["shot_sys_oroboros_front"],obj_char["shot_sys_oroboros_animation_table"][2])
                character_animator(obj_char["shot_sys_oroboros_mid"],obj_char["shot_sys_oroboros_animation_table"][3])
                character_animator(obj_char["shot_sys_oroboros_back"],obj_char["shot_sys_oroboros_animation_table"][4])
                character_animator(obj_char["shot_sys_oroboros_back"],obj_char["shot_sys_oroboros_animation_table"][5])
                character_function_game_scene_TRM_shot_sys_oroboros_pos_update(obj_char)
            end
            if get_character_anim_end_state(obj_char["shot_sys_oroboros_mid"],obj_char["shot_sys_oroboros_animation_table"][3]) then
                obj_char["shot_sys_oroboros_front"] = {0,0,0,0,1,1,0,0}
                obj_char["shot_sys_oroboros_front"]["f_8"] = 0
                obj_char["shot_sys_oroboros_front"]["f_4"] = 0
                obj_char["shot_sys_oroboros_front"]["sprite_sheet_state"] = "5H_oroboros_loop_front"
                obj_char["shot_sys_oroboros_mid"] = {0,0,0,0,1,1,0,0}
                obj_char["shot_sys_oroboros_mid"]["f_8"] = 0
                obj_char["shot_sys_oroboros_mid"]["sprite_sheet_state"] = "5H_oroboros_loop_mid"
                obj_char["shot_sys_oroboros_back"] = {0,0,0,0,1,1,0,0}
                obj_char["shot_sys_oroboros_back"]["f_8"] = 0
                obj_char["shot_sys_oroboros_back"]["f_4"] = 0
                obj_char["shot_sys_oroboros_back"]["sprite_sheet_state"] = "5H_oroboros_loop_back"
                obj_char["shot_sys_oroboros_state"] = "off"
                return
            end
        end,
        ["shot"] = function()
            if run_at_current_frame then
                character_animator(obj_char["shot_sys_oroboros_front"],obj_char["shot_sys_oroboros_animation_table"][1])
                character_animator(obj_char["shot_sys_oroboros_front"],obj_char["shot_sys_oroboros_animation_table"][2])
                character_animator(obj_char["shot_sys_oroboros_back"],obj_char["shot_sys_oroboros_animation_table"][4])
                character_animator(obj_char["shot_sys_oroboros_back"],obj_char["shot_sys_oroboros_animation_table"][5])
                character_animator(obj_char,obj_char["shot_sys_oroboros_animation_table"][6])
                character_function_game_scene_TRM_shot_sys_oroboros_pos_update(obj_char)
            end
            if get_character_anim_end_state(obj_char,obj_char["shot_sys_oroboros_animation_table"][6]) then
                obj_char["shot_sys_oroboros_aim_r"] = 0.42
                obj_char["shot_sys_oroboros_offset_amount"] = 0
                obj_char["shot_sys_oroboros_animation_table"][3] = load_game_scene_anim_char_TRM_5H_oroboros_mid_loop(obj_char["shot_sys_oroboros_mid"])
                init_character_anim_with(obj_char["shot_sys_oroboros_mid"],obj_char["shot_sys_oroboros_animation_table"][3])
                character_function_game_scene_TRM_shot_sys_oroboros_pos_update(obj_char)
                obj_char["shot_sys_oroboros_state"] = "at_the_ready_or_steady_aim"
                return
            end
        end,
    }
    local this_function = switch[obj_char["shot_sys_oroboros_state"]]
    if this_function then this_function() end
end
function state_machine_char_game_scene_char_LP_shot_sys_reticle()
    -- ease_in
    -- at_the_ready_aim_locking
    -- at_the_ready_aim_locked
    -- at_the_ready_aim_unlocking
    -- staedy_aim
    -- ease_out
    -- shot
    local obj_char = obj_char_game_scene_char_LP
    local game_speed_cache = obj_char["game_speed"]
    local game_speed_subframe_cache = obj_char["game_speed_subframe"]
    local run_at_current_frame = (game_speed_subframe_cache > game_speed_cache and game_speed_cache ~= 0) or (game_speed_cache == 1)
    local switch = {
        ["off"] = function()
        end,
        ["at_the_ready_ease_in"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["shot_sys_reticle_animation_table"][1])
                character_function_game_scene_TRM_shot_sys_reticle_pos_update_ease_in(obj_char)
            end
            if obj_char["shot_sys_aim_process"][1] >= obj_char["shot_sys_aim_process"][3] then
                obj_char["shot_sys_reticle_animation_table"][2] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_locking_and_unlocking(obj_char,"5H_reticle_locking")
                init_character_anim_with(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
                obj_char["shot_sys_reticle_state"] = "at_the_ready_locking"
                return
            end
            if get_character_anim_end_state(obj_char,obj_char["shot_sys_reticle_animation_table"][1]) then
                obj_char["shot_sys_reticle"][8] = 0
                obj_char["shot_sys_reticle_sprite_sheet_state"] = "5H_reticle_unlocked"
                obj_char["shot_sys_reticle_state"] = "at_the_ready_unlocked"
                return
            end
        end,
        ["at_the_ready_locking"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["shot_sys_reticle_animation_table"][1])
                character_animator(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
                character_function_game_scene_TRM_shot_sys_reticle_pos_update_at_the_ready(obj_char)
            end
            if obj_char["shot_sys_aim_process"][1] < obj_char["shot_sys_aim_process"][3] then
                obj_char["shot_sys_reticle_animation_table"][2] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_locking_and_unlocking(obj_char,"5H_reticle_unlocking")
                init_character_anim_with(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
                obj_char["shot_sys_reticle_state"] = "at_the_ready_unlocking"
                return
            end
            if get_character_anim_end_state(obj_char,obj_char["shot_sys_reticle_animation_table"][2]) then
                obj_char["shot_sys_reticle_animation_table"][2] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_locked(obj_char)
                init_character_anim_with(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
                obj_char["shot_sys_reticle_state"] = "at_the_ready_locked"
                return
            end
        end,
        ["at_the_ready_locked"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["shot_sys_reticle_animation_table"][1])
                character_animator(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
                character_function_game_scene_TRM_shot_sys_reticle_pos_update_at_the_ready(obj_char)
            end
            if obj_char["shot_sys_aim_process"][1] < obj_char["shot_sys_aim_process"][3] then
                obj_char["shot_sys_reticle_animation_table"][2] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_locking_and_unlocking(obj_char,"5H_reticle_unlocking")
                init_character_anim_with(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
                obj_char["shot_sys_reticle_state"] = "at_the_ready_unlocking"
                return
            end
        end,
        ["at_the_ready_unlocking"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["shot_sys_reticle_animation_table"][1])
                character_animator(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
                character_function_game_scene_TRM_shot_sys_reticle_pos_update_at_the_ready(obj_char)
            end
            if obj_char["shot_sys_aim_process"][1] >= obj_char["shot_sys_aim_process"][3] then
                obj_char["shot_sys_reticle_animation_table"][2] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_locking_and_unlocking(obj_char,"5H_reticle_locking")
                init_character_anim_with(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
                obj_char["shot_sys_reticle_state"] = "at_the_ready_locking"
                return
            end
            if get_character_anim_end_state(obj_char,obj_char["shot_sys_reticle_animation_table"][2]) then
                obj_char["shot_sys_reticle"][8] = 0
                obj_char["shot_sys_reticle_sprite_sheet_state"] = "5H_reticle_unlocked"
                obj_char["shot_sys_reticle_state"] = "at_the_ready_unlocked"
                return
            end
        end,
        ["at_the_ready_unlocked"] = function()
            if run_at_current_frame then
                character_function_game_scene_TRM_shot_sys_reticle_pos_update_at_the_ready(obj_char)
            end
            if obj_char["shot_sys_aim_process"][1] >= obj_char["shot_sys_aim_process"][3] then
                obj_char["shot_sys_reticle_animation_table"][2] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_locking_and_unlocking(obj_char,"5H_reticle_locking")
                init_character_anim_with(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
                obj_char["shot_sys_reticle_state"] = "at_the_ready_locking"
                return
            end
        end,
        ["at_the_ready_ease_out"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
            end
            if get_character_anim_end_state(obj_char,obj_char["shot_sys_reticle_animation_table"][2]) then
                obj_char["shot_sys_reticle"] = {0,0,0,0,1,1,0,0}
                obj_char["shot_sys_reticle_f"] = 0
                obj_char["shot_sys_reticle_f_4"] = 0
                obj_char["shot_sys_reticle_f_8"] = 0
                obj_char["shot_sys_reticle_animation_table"] = {}
                obj_char["shot_sys_reticle_stage_pos_current"] = {0,0}
                obj_char["shot_sys_reticle_stage_pos_target"] = {0,0}
                obj_char["shot_sys_reticle_sprite_sheet_state"] = "5H_reticle_unlocked"
                obj_char["shot_sys_reticle_state"] = "off"
                return
            end
        end,
        ["at_the_ready_shot"] = function()
            if run_at_current_frame then
                character_animator(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
            end
            if get_character_anim_end_state(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
            and obj_char["shot_sys_aim_process"][1] >= obj_char["shot_sys_aim_process"][3] 
            then
                character_function_game_scene_TRM_shot_sys_reticle_pos_update_at_the_ready(obj_char)
                obj_char["shot_sys_reticle_animation_table"][2] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_locking_and_unlocking(obj_char,"5H_reticle_locking")
                init_character_anim_with(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
                obj_char["shot_sys_reticle_state"] = "at_the_ready_locking"
                return
            end
            if get_character_anim_end_state(obj_char,obj_char["shot_sys_reticle_animation_table"][2]) then
                obj_char["shot_sys_reticle"][8] = 0
                obj_char["shot_sys_reticle_sprite_sheet_state"] = "5H_reticle_unlocked"
                obj_char["shot_sys_reticle_animation_table"][1] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_ease_in(obj_char)
                init_character_anim_without(obj_char,obj_char["shot_sys_reticle_animation_table"][1])
                obj_char["shot_sys_reticle_state"] = "at_the_ready_ease_in"
                return
            end
        end,
        ["steady_aim_ease_in"] = function()
        end,
        ["steady_aim_locking"] = function()
        end,
        ["steady_aim_locked"] = function()
        end,
        ["steady_aim_unlocking"] = function()
        end,
        ["steady_aim_ease_out"] = function()
        end,
        ["steady_aim_shot"] = function()
        end,
    }
    local this_function = switch[obj_char["shot_sys_reticle_state"]]
    if this_function then this_function() end
end

-- input_sys
function state_machine_char_game_scene_char_LP_input_sys_cache()
    local obj_char = obj_char_game_scene_char_LP
    local input = INPUT_SYS_CURRENT_COMMAND_STATE["L"]
    local switch = {
        ["none"] = function()
        end,
        ["save"] = function()
            if test_input_sys_press_or_hold(input["left"]) then
                obj_char["input_sys_cache"]["left"] = true
                obj_char["input_sys_cache"]["right"] = false
            elseif test_input_sys_press_or_hold(input["right"]) then
                obj_char["input_sys_cache"]["left"] = false
                obj_char["input_sys_cache"]["right"] = true
            end
            if test_input_sys_press(input["up"]) then
                obj_char["input_sys_cache"]["up"] = true
            end
            if test_input_sys_press(input["P"]) then
                obj_char["input_sys_cache"]["P"] = true
                obj_char["input_sys_cache"]["S"] = false
                obj_char["input_sys_cache"]["K"] = false
                obj_char["input_sys_cache"]["Launcher"] = false
            elseif test_input_sys_press(input["S"]) then
                obj_char["input_sys_cache"]["P"] = false
                obj_char["input_sys_cache"]["S"] = true
                obj_char["input_sys_cache"]["K"] = false
                obj_char["input_sys_cache"]["Launcher"] = false
            elseif test_input_sys_press(input["K"]) then
                obj_char["input_sys_cache"]["P"] = false
                obj_char["input_sys_cache"]["S"] = false
                obj_char["input_sys_cache"]["K"] = true
                obj_char["input_sys_cache"]["Launcher"] = false
            elseif test_input_sys_press(input["Launcher"]) then
                obj_char["input_sys_cache"]["P"] = false
                obj_char["input_sys_cache"]["S"] = false
                obj_char["input_sys_cache"]["K"] = false
                obj_char["input_sys_cache"]["Launcher"] = true
            end
            if test_input_sys_press_or_hold(input["SP"]) then
                obj_char["input_sys_cache"]["SP"] = true
            end
            if test_input_sys_press(input["RC"]) then
                obj_char["input_sys_cache"]["RC"] = true
            end
            if test_input_sys_press(input["burst"]) then
                obj_char["input_sys_cache"]["burst"] = true
            end
            if test_input_sys_press(input["dash"]) then
                obj_char["input_sys_cache"]["dash"] = true
            end
            if test_input_sys_press(input["UA"]) then
                obj_char["input_sys_cache"]["UA"] = true
            end
            if test_input_sys_press(input["correction_up"]) then
                obj_char["input_sys_cache"]["correction_up"] = true
                obj_char["input_sys_cache"]["correction_down"] = false
            elseif test_input_sys_press(input["correction_down"]) then
                obj_char["input_sys_cache"]["correction_up"] = false
                obj_char["input_sys_cache"]["correction_down"] = true
            end
            if test_input_sys_press(input["correction_left"]) then
                obj_char["input_sys_cache"]["correction_left"] = true
                obj_char["input_sys_cache"]["correction_right"] = false
            elseif test_input_sys_press(input["correction_right"]) then
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
            common_update_game_scene_input_direction(obj_char)
            obj_char["input_sys_state"] = "none"
            init_input_sys_cache_LP(obj_char)
        end,
    }
    local this_function = switch[obj_char["input_sys_state"]]
    if this_function then this_function() end
end
function state_machine_char_game_scene_char_LP_input_sys_cache_negative_edge()
    local obj_char = obj_char_game_scene_char_LP
    local input = INPUT_SYS_CURRENT_COMMAND_STATE["L"]
    local switch = {
        ["none"] = function()
        end,
        ["save"] = function()
            if test_input_sys_release(input["H"]) then
                obj_char["input_sys_cache_negative_edge"]["H"] = true
            end
        end,
        ["load"] = function()
            if obj_char["input_sys_cache_negative_edge"]["H"] then
                input["H"] = "Releasing"
            end
            obj_char["input_sys_state_negative_edge"] = "none"
            init_input_sys_cache_negative_edge_LP(obj_char)
        end,
    }
    local this_function = switch[obj_char["input_sys_state_negative_edge"]]
    if this_function then this_function() end
end
function init_input_sys_cache_LP(obj_char)
    for i=1,20 do
        obj_char["input_sys_cache"][INPUT_SYS_COMMAND_TABLE[i]] = false
    end
    obj_char["input_sys_cache"]["jump"] = false
end
function init_input_sys_cache_negative_edge_LP(obj_char)
    for i=1,20 do
        obj_char["input_sys_cache_negative_edge"][INPUT_SYS_COMMAND_TABLE[i]] = false
    end
end

-- 状态机连接门
-- to_gate
function state_gate_game_scene_char_LP_common_ground_to_dash_move(input,obj_char)
    -- _4dash_backdash
    if obj_char["direction_input"] == 4 and test_input_sys_press(input["dash"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4dash_backdash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4dash_backdash"
        return true
    end
    -- _6dash_dash
    if (obj_char["direction_input"] == 5 or obj_char["direction_input"] == 6) 
    and test_input_sys_press(input["dash"]) 
    and obj_char["state"] ~= "6dash_dash" then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6dash_dash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6dash_dash"
        return true
    end
    return false
end
function state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char)
    -- direction_input
    if not common_game_scene_get_character_facing_currect(obj_char) and test_input_sys_press_or_hold(input["dash"]) then
        obj_char[5] = -obj_char[5]
        common_update_game_scene_input_direction(obj_char)
    end
    -- _4dash_backdash
    if obj_char["direction_input"] == 4 and test_input_sys_press_or_hold(input["dash"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4dash_backdash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4dash_backdash"
        return true
    end
    -- _6dash_dash
    if (obj_char["direction_input"] == 5 or obj_char["direction_input"] == 6) 
    and test_input_sys_press_or_hold(input["dash"]) 
    and obj_char["state"] ~= "6dash_dash" then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6dash_dash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6dash_dash"
        return true
    end
    return false
end
function state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_6dash_only(input,obj_char)
    -- direction_input
    if not common_game_scene_get_character_facing_currect(obj_char) and test_input_sys_press_or_hold(input["dash"]) then
        obj_char[5] = -obj_char[5]
        common_update_game_scene_input_direction(obj_char)
    end
    -- _4dash_backdash
    if obj_char["direction_input"] == 4 and test_input_sys_press(input["dash"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4dash_backdash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4dash_backdash"
        return true
    end
    -- _6dash_dash
    if (obj_char["direction_input"] == 5 or obj_char["direction_input"] == 6) 
    and test_input_sys_press_or_hold(input["dash"]) 
    and obj_char["state"] ~= "6dash_dash" then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6dash_dash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6dash_dash"
        return true
    end
    return false
end
function state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_4dash_to_walk(input,obj_char)
    -- direction_input
    if not common_game_scene_get_character_facing_currect(obj_char) and test_input_sys_press_or_hold(input["dash"]) then
        obj_char[5] = -obj_char[5]
        common_update_game_scene_input_direction(obj_char)
    end
    -- _6dash_dash
    if (obj_char["direction_input"] == 5 or obj_char["direction_input"] == 6) 
    and test_input_sys_press_or_hold(input["dash"]) 
    and obj_char["state"] ~= "6dash_dash" then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6dash_dash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6dash_dash"
        return true
    end
    return false
end

function state_gate_game_scene_char_LP_common_ground_to_attack_move(input,obj_char)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    -- _active_FD_block

    -- special
    if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
        return true
    end
    -- _2P
    if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press(input["P"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_2P(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "2P"
        return true
    end
    -- _6P
    if obj_char["direction_input"] == 6 and test_input_sys_press(input["P"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6P(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6P"
        return true
    end
    -- _5P
    if test_input_sys_press(input["P"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5P(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5P"
        return true
    end
    -- _2K
    if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press(input["K"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_2K(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "2K"
        return true
    end
    -- _6K
    if obj_char["direction_input"] == 6 and test_input_sys_press(input["K"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6K(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6K"
        return true
    end
    -- _5K
    if test_input_sys_press(input["K"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5K(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5K"
        return true
    end
    -- _2S
    if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press(input["S"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_2S(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "2S"
        return true
    end
    -- _6S
    if obj_char["direction_input"] == 6 and test_input_sys_press(input["S"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6S(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6S"
        return true
    end
    -- _cS
    if test_input_sys_press(input["S"]) and collision_test_cS_distance_check(obj_char,300) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_cS(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "cS"
        return true
    end
    -- _fS
    if test_input_sys_press(input["S"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_fS(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "fS"
        return true
    end
    -- _2Launcher
    if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press(input["Launcher"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_2Launcher(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "2Launcher"
        return true
    end
    -- _4_6Launcher
    if (obj_char["direction_input"] == 4 or obj_char["direction_input"] == 6) 
    and test_input_sys_press(input["Launcher"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4_6Launcher(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4_6Launcher"
        return true
    end
    -- _5Launcher
    if test_input_sys_press(input["Launcher"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5Launcher(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5Launcher"
        return true
    end
    return false
end
function state_gate_game_scene_char_LP_common_ground_to_attack_move_hold_ver(input,obj_char)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    -- _active_FD_block

    -- 4UA
    -- 6UA
    -- 5UA
    -- 4SP_S_5UA

    -- special
    if state_gate_game_scene_char_LP_common_ground_to_special_move_hold_ver(input,obj_char) then
        return true
    end
    -- _2P
    if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press_or_hold(input["P"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_2P(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "2P"
        return true
    end
    -- _6P
    if obj_char["direction_input"] == 6 and test_input_sys_press_or_hold(input["P"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6P(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6P"
        return true
    end
    -- _5P
    if test_input_sys_press_or_hold(input["P"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5P(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5P"
        return true
    end
    -- _2K
    if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press_or_hold(input["K"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_2K(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "2K"
        return true
    end
    -- _6K
    if obj_char["direction_input"] == 6 and test_input_sys_press_or_hold(input["K"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6K(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6K"
        return true
    end
    -- _5K
    if test_input_sys_press_or_hold(input["K"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5K(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5K"
        return true
    end
    -- _2S
    if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press_or_hold(input["S"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_2S(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "2S"
        return true
    end
    -- _6S
    if obj_char["direction_input"] == 6 and test_input_sys_press_or_hold(input["S"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6S(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6S"
        return true
    end
    -- _cS
    if test_input_sys_press_or_hold(input["S"]) and collision_test_cS_distance_check(obj_char,300) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_cS(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "cS"
        return true
    end
    -- _fS
    if test_input_sys_press_or_hold(input["S"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_fS(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "fS"
        return true
    end
    -- _2Launcher
    if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press_or_hold(input["Launcher"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_2Launcher(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "2Launcher"
        return true
    end
    -- _4_6Launcher
    if (obj_char["direction_input"] == 4 or obj_char["direction_input"] == 6) 
    and test_input_sys_press_or_hold(input["Launcher"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4_6Launcher(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4_6Launcher"
        return true
    end
    -- _5Launcher
    if test_input_sys_press_or_hold(input["Launcher"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5Launcher(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5Launcher"
        return true
    end
    return false
end
function state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char)
    -- 4UA
    -- 6UA
    -- 5UA
    -- 4SP_S_5UA

    -- 4SP_P
    if (obj_char["direction_input"] == 4 or obj_char["direction_input"] == 1)
    and test_input_sys_press_or_hold(input["SP"])
    and test_input_sys_press(input["P"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4SP_P(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4SP_P"
        return true
    end
    -- 6SP_P
    -- 4SP_K
    -- 6SP_K
    -- 4SP_S
    -- 4SP_S_4dash
    -- 4SP_S_6dash
    -- 4SP_S_S
    -- 4SP_S_H
    -- 4SP_S_2Launcher
    -- 4SP_S_6Launcher
    -- 4SP_S_5Launcher
    -- 6SP_S
    if (obj_char["direction_input"] == 6 or obj_char["direction_input"] == 3)
    and obj_char["6SP_S_shot_sys_pass_state"][obj_char["shot_sys_state"]]
    and test_input_sys_press_or_hold(input["SP"])
    and test_input_sys_press(input["S"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6SP_S(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6SP_S"
        return true
    end
    -- SP_H
    -- SP_H_P
    -- SP_H_K
    -- SP_H_S
    -- SP_H_H
end
function state_gate_game_scene_char_LP_common_ground_to_special_move_hold_ver(input,obj_char)
    -- 4UA
    -- 6UA
    -- 5UA
    -- 4SP_S_5UA

    -- 4SP_P
    if (obj_char["direction_input"] == 4 or obj_char["direction_input"] == 1)
    and test_input_sys_press_or_hold(input["SP"])
    and test_input_sys_press_or_hold(input["P"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4SP_P(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4SP_P"
        return true
    end
    -- 6SP_P
    -- 4SP_K
    -- 6SP_K
    -- 4SP_S
    -- 4SP_S_4dash
    -- 4SP_S_6dash
    -- 4SP_S_S
    -- 4SP_S_H
    -- 4SP_S_2Launcher
    -- 4SP_S_6Launcher
    -- 4SP_S_5Launcher
    -- 6SP_S
    if (obj_char["direction_input"] == 6 or obj_char["direction_input"] == 3)
    and obj_char["6SP_S_shot_sys_pass_state"][obj_char["shot_sys_state"]]
    and test_input_sys_press_or_hold(input["SP"]) 
    and test_input_sys_press_or_hold(input["S"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6SP_S(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6SP_S"
        return true
    end
    -- SP_H
    -- SP_H_P
    -- SP_H_K
    -- SP_H_S
    -- SP_H_H
end

function state_gate_game_scene_char_LP_common_air_to_dash_move(input,obj_char)
    -- _4dash_air_backdash
    if obj_char["y"] < -320 and (obj_char["direction_input"] == 4 or obj_char["direction_input"] == 1)
    and test_input_sys_press(input["dash"]) and obj_char["air_move"]["air_dash"][1] > 0 then
        obj_char["air_move"]["jump"][1] = 0
        obj_char["air_move"]["air_dash"][1] = math.max(math.min(obj_char["air_move"]["air_dash"][1]-1,obj_char["air_move"]["air_dash"][2]),0)
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4dash_air_backdash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4dash_air_backdash"
        return true
    end
    -- _6dash_air_dash
    if obj_char["y"] < -320 and test_input_sys_press(input["dash"]) and obj_char["air_move"]["air_dash"][1] > 0 then
        obj_char["air_move"]["jump"][1] = 0
        obj_char["air_move"]["air_dash"][1] = math.max(math.min(obj_char["air_move"]["air_dash"][1]-1,obj_char["air_move"]["air_dash"][2]),0)
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6dash_air_dash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6dash_air_dash"
        return true
    end
end
function state_gate_game_scene_char_LP_common_air_to_dash_move_hold_ver_all(input,obj_char)
    -- _4dash_air_backdash
    if obj_char["y"] < -320 and (obj_char["direction_input"] == 4 or obj_char["direction_input"] == 1)
    and test_input_sys_press_or_hold(input["dash"]) and obj_char["air_move"]["air_dash"][1] > 0 then
        obj_char["air_move"]["jump"][1] = 0
        obj_char["air_move"]["air_dash"][1] = math.max(math.min(obj_char["air_move"]["air_dash"][1]-1,obj_char["air_move"]["air_dash"][2]),0)
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4dash_air_backdash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4dash_air_backdash"
        return true
    end
    -- _6dash_air_dash
    if obj_char["y"] < -320 and test_input_sys_press_or_hold(input["dash"]) and obj_char["air_move"]["air_dash"][1] > 0 then
        obj_char["air_move"]["jump"][1] = 0
        obj_char["air_move"]["air_dash"][1] = math.max(math.min(obj_char["air_move"]["air_dash"][1]-1,obj_char["air_move"]["air_dash"][2]),0)
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6dash_air_dash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6dash_air_dash"
        return true
    end
end
function state_gate_game_scene_char_LP_common_air_to_dash_move_hold_ver_4dash_only(input,obj_char)
    -- _4dash_air_backdash
    if obj_char["y"] < -320 and (obj_char["direction_input"] == 4 or obj_char["direction_input"] == 1)
    and test_input_sys_press_or_hold(input["dash"]) and obj_char["air_move"]["air_dash"][1] > 0 then
        obj_char["air_move"]["jump"][1] = 0
        obj_char["air_move"]["air_dash"][1] = math.max(math.min(obj_char["air_move"]["air_dash"][1]-1,obj_char["air_move"]["air_dash"][2]),0)
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4dash_air_backdash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4dash_air_backdash"
        return true
    end
    -- _6dash_air_dash
    if obj_char["y"] < -320 and test_input_sys_press(input["dash"]) and obj_char["air_move"]["air_dash"][1] > 0 then
        obj_char["air_move"]["jump"][1] = 0
        obj_char["air_move"]["air_dash"][1] = math.max(math.min(obj_char["air_move"]["air_dash"][1]-1,obj_char["air_move"]["air_dash"][2]),0)
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6dash_air_dash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6dash_air_dash"
        return true
    end
end
function state_gate_game_scene_char_LP_common_air_to_attack_move(input,obj_char)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local direction_input_true_table = { [4] = true, [6] = true, [7] = true, [9] = true }
    -- _burst_overdrive
    -- _burst_RC_blue
    -- _active_FD_block
    -- _jSP_S
    -- _jSP_H
    -- _jP
    if test_input_sys_press(input["P"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_jP(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "jP"
        return true
    end
    -- _j2K
    if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press(input["K"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_j2K(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "j2K"
        return true
    end
    -- _jK
    if test_input_sys_press(input["K"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_jK(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "jK"
        return true
    end
    -- _jS
    if test_input_sys_press(input["S"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_jS(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "jS"
        return true
    end
    -- _j4_6Launcher
    if test_input_sys_press(input["Launcher"]) and direction_input_true_table[obj_char["direction_input"]] then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_j4_6Launcher(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "j4_6Launcher"
        return true
    end
    -- _j5Launcher
    if test_input_sys_press(input["Launcher"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_j5Launcher(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "j5Launcher"
        return true
    end
    return false
end
function state_gate_game_scene_char_LP_common_air_to_attack_move_hold_ver(input,obj_char)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local direction_input_true_table = { [4] = true, [6] = true, [7] = true, [9] = true }
    -- _burst_overdrive
    -- _burst_RC_blue
    -- _active_FD_block
    -- _jSP_S
    -- _jSP_H
    -- _jP
    if test_input_sys_press_or_hold(input["P"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_jP(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "jP"
        return true
    end
    -- _j2K
    if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press_or_hold(input["K"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_j2K(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "j2K"
        return true
    end
    -- _jK
    if test_input_sys_press_or_hold(input["K"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_jK(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "jK"
        return true
    end
    -- _jS
    if test_input_sys_press_or_hold(input["S"]) then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_jS(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "jS"
        return true
    end
    -- _j4_6Launcher
    if test_input_sys_press_or_hold(input["Launcher"]) and direction_input_true_table[obj_char["direction_input"]] then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_j4_6Launcher(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "j4_6Launcher"
        return true
    end
    -- _j5Launcher
    if test_input_sys_press_or_hold(input["Launcher"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_j5Launcher(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "j5Launcher"
        return true
    end
    return false
end
function state_gate_game_scene_char_LP_common_air_to_special_move(input,obj_char)
end
function state_gate_game_scene_char_LP_common_air_to_special_move_hold_ver(input,obj_char)
end

function state_gate_game_scene_char_LP_common_to_burst_RC_red(input,obj_char)
    if obj_char["heat_gauge"][1] < 100.0 then
        return
    end
    if test_input_sys_press(input["RC"]) then
        obj_char["velocity_cache"] = {0,0}
        if test_input_sys_press_or_hold(input["dash"]) then
            if test_input_sys_press_or_hold(input["up"]) then
                obj_char["velocity"] = {0,-7.5}
            elseif test_input_sys_press_or_hold(input["down"]) then
                obj_char["velocity"] = {0,7.5}
            elseif test_input_sys_press_or_hold(input["left"]) then
                obj_char["velocity"] = {-7.5,0}
            elseif test_input_sys_press_or_hold(input["right"]) then
                obj_char["velocity"] = {7.5,0}
            else
                obj_char["velocity"] = {7.5*obj_char[5],0}
            end
        else
            obj_char["velocity"] = {0,0}
        end
        obj_char["physics_lock"] = false
        if obj_char["height_state"] == "air" then
            obj_char["sprite_sheet_state"] = "burst_overdrive_rc_air"
            obj_char["anchor_pos"] = {330,485}
            obj_char["pushbox"] = {0,-100,120,200}
            obj_char["collision_ground_height_offset"] = 185
            obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-320}
        else
            obj_char["height_state"] = "stand"
            obj_char["sprite_sheet_state"] = "burst_rc_ground"
            obj_char["anchor_pos"] = {300,615}
            obj_char["pushbox"]  = {0,-185,120,370}
            obj_char["collision_ground_height_offset"] = 0
            obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        end
        obj_char["character_animation"] = 
        load_game_scene_anim_char_common_burst_RC_red(obj_char,character_function_game_scene_TRM_RC_state_character_uncommon_update)
        obj_char["state"] = "burst_RC_red"
        init_character_anim_with(obj_char,obj_char["character_animation"])
        return true
    end
end
function state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char)
    if obj_char["heat_gauge"][1] < 100.0 then
        return
    end
    if test_input_sys_press(input["RC"]) then
        local forward_dash_state = {
            ["6dash_dash"] = true,
            ["6dash_dash_cancel"] = true,
            ["6dash_air_dash"] = true
        }
        local backward_dash_state = {
            ["4dash_backdash"] = true,
            ["4dash_air_backdash"] = true
        }
        local velocity_cache_uncommon_case = {
            ["7_8_9_pre_jump"] = {0,-25},
            ["6dash_dash_cancel"] = {7.5*obj_char[5],0},
            ["4dash_backdash"] = {-17.5*obj_char[5],-3.25}
        }
        obj_char["velocity_cache"] = obj_char["velocity"]
        if test_input_sys_press_or_hold(input["dash"]) then
            if test_input_sys_press_or_hold(input["up"]) then
                obj_char["velocity"] = {0,-7.5}
            elseif test_input_sys_press_or_hold(input["down"]) then
                obj_char["velocity"] = {0,7.5}
            elseif test_input_sys_press_or_hold(input["left"]) then
                obj_char["velocity"] = {-7.5,0}
            elseif test_input_sys_press_or_hold(input["right"]) then
                obj_char["velocity"] = {7.5,0}
            else
                obj_char["velocity"] = {7.5*obj_char[5],0}
            end
        elseif forward_dash_state[obj_char["state"]] then
            obj_char["velocity"] = {7.5*obj_char[5],0}
        else
            obj_char["velocity"] = {0,0}
        end
        if velocity_cache_uncommon_case[obj_char["state"]] then
            obj_char["velocity_cache"] = velocity_cache_uncommon_case[obj_char["state"]]
        end
        if obj_char["state"] == "6dash_dash_cancel" and obj_char["velocity"][2] < 0 then
            obj_char["velocity_cache"][2] = -12.5
        end
        if obj_char["state"] == "7_8_9_jump_air" and obj_char["velocity"][2] == 0 then
            obj_char["velocity_cache"][2] = -25
        end
        obj_char["velocity_cache"][2] = math.max(obj_char["velocity_cache"][2],-25)
        obj_char["velocity_cache"][2] = math.min(obj_char["velocity_cache"][2],12.5)

        obj_char["physics_lock"] = false
        if obj_char["height_state"] == "air" then
            obj_char["sprite_sheet_state"] = "burst_overdrive_rc_air"
            obj_char["anchor_pos"] = {330,485}
            obj_char["pushbox"] = {0,-100,120,200}
            obj_char["collision_ground_height_offset"] = 185
            obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-320}
        else
            obj_char["height_state"] = "stand"
            obj_char["sprite_sheet_state"] = "burst_rc_ground"
            obj_char["anchor_pos"] = {300,615}
            obj_char["pushbox"]  = {0,-185,120,370}
            obj_char["collision_ground_height_offset"] = 0
            obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        end
        obj_char["character_animation"] = 
        load_game_scene_anim_char_common_burst_RC_blue(obj_char,character_function_game_scene_TRM_RC_state_character_uncommon_update)
        obj_char["state"] = "burst_RC_blue"
        init_character_anim_with(obj_char,obj_char["character_animation"])
        return true
    end
end
function state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char)
    if obj_char["heat_gauge"][1] < 100.0 then
        return
    end
    if test_input_sys_press(input["RC"]) then
        obj_char["velocity_cache"] = {0,0}
        if test_input_sys_press_or_hold(input["dash"]) then
            if test_input_sys_press_or_hold(input["up"]) then
                obj_char["velocity"] = {0,-7.5}
            elseif test_input_sys_press_or_hold(input["down"]) then
                obj_char["velocity"] = {0,7.5}
            elseif test_input_sys_press_or_hold(input["left"]) then
                obj_char["velocity"] = {-7.5,0}
            elseif test_input_sys_press_or_hold(input["right"]) then
                obj_char["velocity"] = {7.5,0}
            else
                obj_char["velocity"] = {7.5*obj_char[5],0}
            end
        else
            obj_char["velocity"] = {0,0}
        end
        obj_char["physics_lock"] = false
        if obj_char["height_state"] == "air" then
            obj_char["sprite_sheet_state"] = "burst_overdrive_rc_air"
            obj_char["anchor_pos"] = {330,485}
            obj_char["pushbox"] = {0,-100,120,200}
            obj_char["collision_ground_height_offset"] = 185
            obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-320}
        else
            obj_char["height_state"] = "stand"
            obj_char["sprite_sheet_state"] = "burst_rc_ground"
            obj_char["anchor_pos"] = {300,615}
            obj_char["pushbox"]  = {0,-185,120,370}
            obj_char["collision_ground_height_offset"] = 0
            obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        end
        obj_char["character_animation"] = 
        load_game_scene_anim_char_common_burst_RC_purple(obj_char,character_function_game_scene_TRM_RC_state_character_uncommon_update)
        obj_char["state"] = "burst_RC_purple"
        init_character_anim_with(obj_char,obj_char["character_animation"])
        return true
    end
end
function state_gate_game_scene_char_LP_common_to_burst_RC_yellow(input,obj_char)
    if obj_char["heat_gauge"][1] < 100.0 then
        return
    end
    if test_input_sys_press(input["RC"]) 
    -- and obj_char["height_state"] ~= "air" 
    then
        obj_char["velocity"] = {0,0}
        obj_char["velocity_cache"] = {0,0}
        obj_char["physics_lock"] = false
        if obj_char["height_state"] == "air" then
            obj_char["sprite_sheet_state"] = "burst_overdrive_rc_air"
            obj_char["anchor_pos"] = {330,485}
            obj_char["pushbox"] = {0,-100,120,200}
            obj_char["collision_ground_height_offset"] = 185
            obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-320}
        else
            obj_char["height_state"] = "stand"
            obj_char["sprite_sheet_state"] = "burst_rc_ground"
            obj_char["anchor_pos"] = {300,615}
            obj_char["pushbox"]  = {0,-185,120,370}
            obj_char["collision_ground_height_offset"] = 0
            obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        end
        obj_char["character_animation"] = 
        load_game_scene_anim_char_common_burst_RC_yellow(obj_char,character_function_game_scene_TRM_RC_state_character_uncommon_update)
        obj_char["state"] = "burst_RC_yellow"
        init_character_anim_with(obj_char,obj_char["character_animation"])
        return true
    end
end

function state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,type)
    -- _overdrive
    if test_input_sys_press(input["burst"]) and type == "overdrive" and obj_char["overdrive_gauge"][1] == obj_char["overdrive_gauge"][2] then
        local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
        local hit_cancel_RC_state_table = {
            ["block"] = true,
            ["hurt"] = true,
            ["knockdown"] = true,
            ["knockdown_recovery"] = true,
            ["knockdown_recovery_wallstick"] = true,
            ["knockout"] = true,
            ["throw_tested"] = true,
            ["throw_hurt_success"] = true,
            ["blockstop"] = true,
            ["hurtstop"] = true,
            ["wallstick"] = true,
            ["wallbreak_hurt"] = true,
        }
        local obj_camera = obj_stage_game_scene_camera
        local height_state = obj_char["height_state"]
        if height_state == "air" then
            obj_char["sprite_sheet_state"] = "burst_overdrive_rc_air"
            obj_char["anchor_pos"] = {330,485}
            obj_char["pushbox"] = {0,-100,120,200}
            obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-320}
        else
            obj_char["height_state"] = "stand"
            obj_char["sprite_sheet_state"] = "burst_overdrive_ground"
            obj_char["anchor_pos"] = {300,615}
            obj_char["pushbox"]  = {0,-185,120,370}
            obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        end
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        if hit_cancel_RC_state_table[obj_char_other_side["state"]] then
            obj_char["character_animation"] = load_game_scene_anim_char_common_burst_overdrive(obj_char,70-3,true,character_function_game_scene_TRM_overdrive_state_character_uncommon_init)
        elseif obj_char["state"] == "block" then
            obj_char["character_animation"] = load_game_scene_anim_char_common_burst_overdrive(obj_char,70-23,true,character_function_game_scene_TRM_overdrive_state_character_uncommon_init)
        else
            obj_char["character_animation"] = load_game_scene_anim_char_common_burst_overdrive(obj_char,70-13,false,character_function_game_scene_TRM_overdrive_state_character_uncommon_init)
        end
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "burst_overdrive"
        return true
    end
end

-- uncommon_to_gate
function state_gate_game_scene_char_LP_to_5H(input,obj_char)
    -- _5H
    if test_input_sys_press(input["H"]) and obj_char["shot_sys_state"] == "off" then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5H(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5H"
        return true
    end
end

-- from_gate
function state_gate_game_scene_char_LP_from_active_FD_block(input,obj_char)
end
function state_gate_game_scene_char_LP_from_block(input,obj_char)
    -- _burst
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"burst") then
        return true
    end
    -- _YRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_yellow(input,obj_char) then
        return true
    end
    -- animation_end
    if not get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        return
    end
    obj_char["input_sys_state"] = "load" -- none save load
    state_machine_char_game_scene_char_LP_input_sys_cache()
    -- _5_stand_idle
    if obj_char["height_state"] == "stand" then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)  
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        -- _common_ground_idle_to_move
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        -- 5_stand_idle
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _1_2_3_crouch
    if obj_char["height_state"] == "crouch" then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        obj_char["f"] = 4
        character_animator(obj_char,obj_char["character_animation"])
        -- _common_ground_idle_to_move
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        -- 1_2_3_crouch
        if state_gate_game_scene_char_LP_from_1_2_3_crouch(input,obj_char) then
            return true
        end
    end
end
function state_gate_game_scene_char_LP_from_hurt(input,obj_char)
    -- _burst
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"burst") then
        return true
    end
    -- until land
    if obj_char["height_state"] == "air" then
        if (obj_char["collision_move_available"][1] == 0 or obj_char["collision_move_available"][2] == 0) 
        and obj_char["self_wallbounce_hurt_animation"] ~= nil then
            obj_char["character_animation"] = obj_char["self_wallbounce_hurt_animation"]
            init_character_anim_with(obj_char,obj_char["character_animation"])
        elseif collision_test_char_on_ground(obj_char) and obj_char["self_groundbounce_hurt_animation"] ~= nil then
            obj_char["character_animation"] = obj_char["self_groundbounce_hurt_animation"]
            init_character_anim_with(obj_char,obj_char["character_animation"])
        elseif collision_test_char_on_ground(obj_char) then
            obj_char["y"] = 0
            obj_char["state"] = obj_char["state_cache"]
            if obj_char["state"] == "knockdown" then
                obj_char["character_animation"] = obj_char["self_knockdown_animation"] 
                init_character_anim_with(obj_char,obj_char["character_animation"])
            elseif obj_char["state"] == "knockdown_recovery" then
                obj_char["character_animation"] = obj_char["self_knockdown_recovery_animation"] 
                init_character_anim_with(obj_char,obj_char["character_animation"])
            end
        end
        return
    end
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["input_sys_state"] = "load" -- none save load
        -- something could use for combo HUD
        -- print("hurt animation end")
        state_machine_char_game_scene_char_LP_input_sys_cache()
        -- 5_stand_idle
        if obj_char["height_state"] == "stand" then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)  
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "5_stand_idle"
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            -- 5_stand_idle
            if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
                return true
            end
        -- 1_2_3_crouch
        elseif obj_char["height_state"] == "crouch" then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "1_2_3_crouch"
            obj_char["f"] = 4
            character_animator(obj_char,obj_char["character_animation"])
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            -- 1_2_3_crouch
            if state_gate_game_scene_char_LP_from_1_2_3_crouch(input,obj_char) then
                return true
            end
        elseif obj_char["height_state"] == "OTG" then
            assert("此受伤动画为OTG状态中结束了")
        end
        return
    end
end

function state_gate_game_scene_char_LP_from_throw_success(input,obj_char)
    local obj_stage_main = obj_stage_game_scene_main
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local obj_camera = obj_stage_game_scene_camera
    -- _overdrive
    if obj_char["hit_cancel"] and state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _RRC
    if obj_char["hit_cancel"] and state_gate_game_scene_char_LP_common_to_burst_RC_red(input,obj_char) then
        return true
    end
    -- _PRC
    if not obj_char["hit_cancel"] and state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["physics_lock"] = false
        common_game_scene_nil_load_camear_shake_anim(obj_char)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        table.insert(obj_stage_main["camera_active_application_table"],
            function()
                anim_stage_point_linear_game_scene_camera_enclosing = obj_char["camera_enclosing_anim"]
                anim_stage_point_linear_game_scene_camera_shake_x = obj_char["camera_x_shake_anim"]
                anim_stage_point_linear_game_scene_camera_shake_y = obj_char["camera_y_shake_anim"]
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_enclosing)
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y)
                obj_camera["enclose_position_offset"] = obj_char["enclose_position_offset"]
                obj_camera["state"] = "active"
            end
        )

        obj_char_other_side["state"] = "hurt"
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["physics_lock"] = false
        obj_char_other_side["character_animation"] = obj_char["throw_hurt_PRC_animation"]
        init_character_anim_with(obj_char_other_side,obj_char_other_side["character_animation"])
        return true
    end
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        -- _common_ground_idle_to_move
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        -- 5_stand_idle
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
        return
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        -- air
        if obj_char["height_state"] == "air" then
            -- _common_air_to_move
            if state_gate_game_scene_char_LP_common_air_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            -- 7_8_9_jump_air
            if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
                return true
            end
        -- stand_idle
        elseif obj_char["height_state"] == "stand" then
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            -- 5_stand_idle
            if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
                return true
            end
        end
    end
end
function state_gate_game_scene_char_LP_from_throw_hurt_success(input,obj_char)
    -- knockdown knockdown_recovery
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["y"] = 0
        obj_char["state"] = obj_char["state_cache"]
        if obj_char["state"] == "knockdown" then
            obj_char["character_animation"] = obj_char["self_knockdown_animation"] 
            init_character_anim_with(obj_char,obj_char["character_animation"])
        elseif obj_char["state"] == "knockdown_recovery" then
            obj_char["character_animation"] = obj_char["self_knockdown_recovery_animation"] 
            init_character_anim_with(obj_char,obj_char["character_animation"])
        end
        return
    end
end
function state_gate_game_scene_char_LP_from_throw_testing(input,obj_char)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    obj_char["f"] = obj_char["f"] + 1
    if obj_char_other_side["hurt_state"] == "idle" and obj_char["f"] <= 9 and common_game_scene_change_input_state("L")["Launcher"] == "Pressing" then
        obj_char["state"] = "throw_teched"
        obj_char["physics_lock"] = false
        obj_char["character_animation"] = load_game_scene_anim_char_common_0_Launcher_throw_tech(
            obj_char,"teched"
        )
        init_character_anim_with(obj_char,obj_char["character_animation"])
    elseif obj_char["f"] > 9 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["state"] = "throw_success"
        obj_char["character_animation"] = obj_char["throw_success_animation"]
        init_character_anim_with(obj_char,obj_char["character_animation"])
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        state_gate_game_scene_char_LP_from_throw_success(input,obj_char)
        -- insert_VFX
        if obj_char_other_side["hurt_state"] ~= "idle" then
            insert_VFX_HUD_game_scene_punish(obj_char)
        end
    end
end
function state_gate_game_scene_char_LP_from_throw_tested(input,obj_char)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    obj_char["f"] = obj_char["f"] + 1
    if obj_char["hurt_state"] == "idle" and obj_char["f"] <= 9 and input["Launcher"] == "Pressing" then
        obj_char["state"] = "throw_teching"
        obj_char["physics_lock"] = false
        obj_char["character_animation"] = load_game_scene_anim_char_common_0_Launcher_throw_tech(
            obj_char,"teching"
        )
        init_character_anim_with(obj_char,obj_char["character_animation"])
    elseif obj_char["f"] > 9 then
        obj_char["state"] = "throw_hurt_success"
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end 
        obj_char["character_animation"] = obj_char_other_side["throw_hurt_success_animation"]
        init_character_anim_with(obj_char,obj_char["character_animation"])
    end
end
function state_gate_game_scene_char_LP_from_throw_tech(input,obj_char)
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        -- air
        if obj_char["height_state"] == "air" then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "7_8_9_jump_air"
            -- _common_air_to_move
            if state_gate_game_scene_char_LP_common_air_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            -- 7_8_9_jump_air
            if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
                return true
            end
        -- stand_idle
        elseif obj_char["height_state"] == "stand" then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "5_stand_idle"
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            -- 5_stand_idle
            if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
                return true
            end
        end
        return
    end
end

function state_gate_game_scene_char_LP_from_hitstop(input,obj_char)
    -- _[any_SP_hit_state_saved_in_state_cache]
    if obj_char["hit_hurt_blockstop_countdown"] <= 10 then
        if test_input_sys_press_or_hold(input["down"]) then
            obj_char["input_sys_cache"]["down"] = true
        end
    end
    if obj_char["hit_hurt_blockstop_countdown"] <= 0 then
        -- original_state
        obj_char["state"] = obj_char["state_cache"]
        obj_char["physics_lock"] = false
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        -- _overdrive
        if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
            return true
        end
        -- _RRC
        if state_gate_game_scene_char_LP_common_to_burst_RC_red(input,obj_char) then
            return true
        end
        -- force_delayed_gatling_cancel_input_sys_cache_processing
        character_function_game_scene_TRM_hitstop_force_delay_gatling_cancel_input_sys_cache_process(input,obj_char)
        update_game_scene_char_LP()
        return
    end
end
function state_gate_game_scene_char_LP_from_blockstop(input,obj_char)
    -- _block
    if obj_char["hit_hurt_blockstop_countdown"] <= 0 then
        obj_char["state"] = obj_char["state_cache"]
        obj_char["physics_lock"] = false
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        -- _burst
        if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
            return true
        end
        update_game_scene_char_LP()
        return
    end
end
function state_gate_game_scene_char_LP_from_hurtstop(input,obj_char)
    -- _hurtstop
    if obj_char["hit_hurt_blockstop_countdown"] <= 0 then
        obj_char["state"] = obj_char["state_cache"]
        obj_char["physics_lock"] = false
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        -- _burst
        if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"burst") then
            return true
        end
        update_game_scene_char_LP()
        return
    end
end

function state_gate_game_scene_char_LP_from_wallstick(input,obj_char)
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["state"] = obj_char["state_cache"]
        obj_char["character_animation"] = obj_char["self_knockdown_recovery_animation"] 
        init_character_anim_with(obj_char,obj_char["character_animation"])
        return
    end
end

function state_gate_game_scene_char_LP_from_knockdown(input,obj_char)
    -- _burst
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"burst") then
        return true
    end
    -- _knockdown_recover
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = obj_char["self_knockdown_recovery_animation"]
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "knockdown_recovery"
        return true
    end
end
function state_gate_game_scene_char_LP_from_knockdown_recovery(input,obj_char)
    -- _burst
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"burst") then
        return true
    end
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        -- 5_stand_idle
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        -- _common_ground_idle_to_move
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        -- 5_stand_idle
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
        return
    end
end
function state_gate_game_scene_char_LP_from_knockdown_recovery_wallstick(input,obj_char)
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        state_machine_char_game_scene_char_LP_input_sys_cache()
        obj_char["state"] = obj_char["state_cache"]
        if obj_char["state"] == "5_stand_idle" then
            -- 5_stand_idle
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            -- 5_stand_idle
            if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
                return true
            end
            return
        elseif obj_char["state"] == "7_8_9_jump_air" then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["idle_cancel"] = true
            obj_char["f"] = 20
            character_animator(obj_char,obj_char["character_animation"])
            if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
                return true
            end
            return true
        end
    end
end

function state_gate_game_scene_char_LP_from_1_2_3_crouch(input,obj_char)
    -- _1_2_3_crouch_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch_turn"
        common_update_game_scene_input_direction(obj_char)
        state_gate_game_scene_char_LP_from_1_2_3_crouch_turn(input,obj_char)
        return true
    end
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache_hit_jump_cancel"] = obj_char["direction_input"]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_6dash_only(input,obj_char) then
        return true
    end
    if state_gate_game_scene_char_LP_common_ground_to_attack_move(input,obj_char) then
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- _1_2_3_crouch_to_stand_idle
    if obj_char["direction_input"] == 5 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch_to_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_1_2_3_crouch_turn(input,obj_char)
    -- _init_if_changed_again
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        common_update_game_scene_input_direction(obj_char)
    end
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache_hit_jump_cancel"] = obj_char["direction_input"]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_6dash_only(input,obj_char) then
        return true
    end
    if state_gate_game_scene_char_LP_common_ground_to_attack_move(input,obj_char) then
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- _1_2_3_crouch_to_stand_idle
    if obj_char["direction_input"] == 5 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch_to_stand_idle"
        return true
    end
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        obj_char["f"] = 4
        character_animator(obj_char,obj_char["character_animation"])
        return true
    end
end
function state_gate_game_scene_char_LP_from_1_2_3_crouch_to_stand_idle(input,obj_char)
    -- _5_stand_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_turn"
        state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        common_update_game_scene_input_direction(obj_char)
        return true
    end
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache_hit_jump_cancel"] = obj_char["direction_input"]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_6dash_only(input,obj_char) then
        return true
    end
    if state_gate_game_scene_char_LP_common_ground_to_attack_move(input,obj_char) then
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char)
    -- _5_stand_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_turn"
        state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        common_update_game_scene_input_direction(obj_char)
        return true
    end
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache_hit_jump_cancel"] = obj_char["direction_input"]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_6dash_only(input,obj_char) then
        return true
    end
    if state_gate_game_scene_char_LP_common_ground_to_attack_move(input,obj_char) then
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
end
function state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
    -- _init_if_changed_again
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        common_update_game_scene_input_direction(obj_char)
    end
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache_hit_jump_cancel"] = obj_char["direction_input"]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_6dash_only(input,obj_char) then
        return true
    end
    if state_gate_game_scene_char_LP_common_ground_to_attack_move(input,obj_char) then
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_5_stand_dash_skid(input,obj_char)
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache_hit_jump_cancel"] = obj_char["direction_input"]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_6dash_only(input,obj_char) then
        return true
    end
    if state_gate_game_scene_char_LP_common_ground_to_attack_move(input,obj_char) then
        return true
    end
    if obj_char["idle_cancel"] and state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
        return true
    end
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_4_walk(input,obj_char)
    -- _5_stand_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_turn"
        common_update_game_scene_input_direction(obj_char)
        state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        return true
    end
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache_hit_jump_cancel"] = obj_char["direction_input"]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_6dash_only(input,obj_char) then
        return true
    end
    if state_gate_game_scene_char_LP_common_ground_to_attack_move(input,obj_char) then
        if obj_char["velocity"][1]*obj_char[5] < 0 then
            obj_char["velocity"][1] = 0
        end
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- _4_walk_to_stand_idle
    if obj_char["direction_input"] == 5 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4_walk_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4_walk_to_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_4_walk_to_stand_idle(input,obj_char)
    -- _5_stand_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_turn"
        common_update_game_scene_input_direction(obj_char)
        state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        return true
    end
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache_hit_jump_cancel"] = obj_char["direction_input"]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_6dash_only(input,obj_char) then
        return true
    end
    if state_gate_game_scene_char_LP_common_ground_to_attack_move(input,obj_char) then
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        obj_char["f"] = 20
        character_animator(obj_char,obj_char["character_animation"])
        return true
    end
end
function state_gate_game_scene_char_LP_from_6_walk(input,obj_char)
    -- _5_stand_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_turn"
        common_update_game_scene_input_direction(obj_char)
        state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        return true
    end
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache_hit_jump_cancel"] = obj_char["direction_input"]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_6dash_only(input,obj_char) then
        return true
    end
    if state_gate_game_scene_char_LP_common_ground_to_attack_move(input,obj_char) then
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk_to_stand_idle
    if obj_char["direction_input"] == 5 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6_walk_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6_walk_to_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_6_walk_to_stand_idle(input,obj_char)
    -- _5_stand_turn
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_turn"
        common_update_game_scene_input_direction(obj_char)
        state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char)
        return true
    end
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache_hit_jump_cancel"] = obj_char["direction_input"]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        return true
    end
    -- _common_ground_idle_to_move
    if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_6dash_only(input,obj_char) then
        return true
    end
    if state_gate_game_scene_char_LP_common_ground_to_attack_move(input,obj_char) then
        return true
    end
    -- _1_2_3_crouch
    if common_game_scene_check_crouch_direction(obj_char) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        return true
    end
    -- _4_walk
    if obj_char["direction_input"] == 4 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4_walk"
        return true
    end
    -- _6_walk
    if obj_char["direction_input"] == 6 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_6_walk(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "6_walk"
        return true
    end
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end

function state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char)
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _common_ground_idle_to_move
    if obj_char["idle_cancel"] then
        -- _common_ground_idle_to_move
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_common_ground_to_attack_move_hold_ver(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_common_ground_to_attack_move_hold_ver(input,obj_char) then
            return true
        end
        -- 5_stand_idle
        if state_gate_game_scene_char_LP_from_5_stand_turn(input,obj_char) then
            return true
        end
    end
    -- animation_end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char)
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_jump_air_to_stand_idle
    if collision_test_char_on_ground(obj_char) and obj_char["velocity"][2] > 0.0 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air_to_stand_idle"
        return true
    end
    -- _common_air_idle_to_move
    if obj_char["idle_cancel"] then
        -- _common_air_idle_to_move
        if state_gate_game_scene_char_LP_common_air_to_dash_move_hold_ver_4dash_only(input,obj_char) then
            -- save_input_sys_cache_from_pre_jump_and_7_8_9_jump_air
            load_input_sys_cache_manual_release(input,obj_char,"dash")
            load_input_sys_cache_recache(input,obj_char)
            obj_char["input_sys_state"] = "save" -- none save load
            return true
        end
        if state_gate_game_scene_char_LP_common_air_to_special_move(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_common_air_to_attack_move_hold_ver(input,obj_char) then
            return true
        end
    end
    -- _7_8_9_jump_air(second_air_jump)
    if obj_char["air_move"]["jump"][1] > 0 and test_input_sys_press(input["up"]) and obj_char["idle_cancel"] then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        common_update_game_scene_input_direction(obj_char)
        -- air_move
        obj_char["air_move"]["jump"][1] = math.max(math.min(obj_char["air_move"]["jump"][1]-1,obj_char["air_move"]["jump"][2]),0)
        obj_char["air_move"]["air_dash"][1] = 0
        -- velocity
        if obj_char["direction_input"] == 7 then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"7_jump",{200,470},obj_char["velocity"][1]*0.1 - obj_char[5]*11.5,-45.0)
        elseif obj_char["direction_input"] == 8 then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},0,-45.0)
        elseif obj_char["direction_input"] == 9 then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"9_jump",{320,430},obj_char["velocity"][1]*0.1 + obj_char[5]*11.5,-45.0)
        end
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air"
        return true
    end
end
function state_gate_game_scene_char_LP_from_7_8_9_pre_jump(input,obj_char)
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_jump_air
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        -- velocity_cache
        local multiplyer = 1
        if test_input_sys_press_or_hold(input["SP"]) then
            multiplyer = 1.08
            obj_char["air_move"]["jump"][1] = math.max(math.min(obj_char["air_move"]["jump"][1]-1,obj_char["air_move"]["jump"][2]),0)
        end
        if obj_char["direction_input_cache_hit_jump_cancel"] == 7 then
            if (obj_char[5]*obj_char["velocity_cache"][1] <= 0) then
                obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"7_jump",{200,470},(obj_char["velocity_cache"][1]*0.6 - obj_char[5]*2.75)*multiplyer,-55.0*multiplyer)
            else
                obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},(obj_char["velocity_cache"][1]*0.6 - obj_char[5]*2.75)*multiplyer,-55.0*multiplyer)
            end
        elseif obj_char["direction_input_cache_hit_jump_cancel"] == 8 then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},(obj_char["velocity_cache"][1]*0.25)*multiplyer,-55.0*multiplyer)
        elseif obj_char["direction_input_cache_hit_jump_cancel"] == 9 then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"9_jump",{320,430},(obj_char["velocity_cache"][1]*0.6 + obj_char[5]*2.75)*multiplyer,-55.0*multiplyer)
        end
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["y"] = -140
        obj_char["state"] = "7_8_9_jump_air"
        obj_char["velocity"][1] = obj_char["velocity_cache"][1]
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
            return true
        end
        return true
    end
end

function state_gate_game_scene_char_LP_from_4dash_backdash(input,obj_char)
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _common_ground_idle_to_move
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_4dash_air_backdash(input,obj_char)
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_jump_air_to_stand_idle
    if collision_test_char_on_ground(obj_char) and obj_char["velocity"][2] > 0.0 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air_to_stand_idle"
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char) then
            return true
        end
        return true
    end
    -- _common_air_idle_to_move
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
            if obj_char["velocity"][1] ~= 0 then
                obj_char["velocity"][1] = obj_char["velocity"][1]/math.abs(obj_char["velocity"][1])*math.min(15,math.abs(obj_char["velocity"][1]))
            end
            obj_char["gravity"] = 2.0
            return true
        end
    end
    -- _7_8_9_jump_air
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"7_jump",{200,470},-9.0*obj_char[5],nil)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air"
        obj_char["idle_cancel"] = true
        obj_char["f"] = 12
        character_animator(obj_char,obj_char["character_animation"])
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
            return true
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_6dash_dash(input,obj_char)
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_pre_jump
    if common_game_scene_check_jump_direction(obj_char) then
        obj_char["direction_input_cache_hit_jump_cancel"] = obj_char["direction_input"]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_pre_jump"
        if state_gate_game_scene_char_LP_from_7_8_9_pre_jump(input,obj_char) then
            return true
        end
        return true
    end
    -- _common_ground_idle_to_move
    if obj_char["direction_input"] == 4 and test_input_sys_press(input["dash"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_4dash_backdash(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "4dash_backdash"
        return true
    end
    if state_gate_game_scene_char_LP_common_ground_to_attack_move_hold_ver(input,obj_char) then
        return true
    end
    -- _5_stand_dash_skid
    if not test_input_sys_press_or_hold(input["dash"]) or obj_char["direction_input"] == 4 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_dash_skid(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_dash_skid"
        if state_gate_game_scene_char_LP_from_5_stand_dash_skid(input,obj_char) then
            return true
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_6dash_air_dash(input,obj_char)
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- _7_8_9_jump_air_to_stand_idle
    if collision_test_char_on_ground(obj_char) and obj_char["velocity"][2] > 0.0 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air_to_stand_idle"
        state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char)
        return true
    end
    -- _common_air_idle_to_move
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
            if obj_char["velocity"][1] ~= 0 then
                obj_char["velocity"][1] = obj_char["velocity"][1]/math.abs(obj_char["velocity"][1])*math.min(25,math.abs(obj_char["velocity"][1]))
            end
            return true
        end
    end
    -- _7_8_9_jump_air
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"9_jump",{320,430},18.0*obj_char[5],nil)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air"
        obj_char["f"] = 12
        obj_char["idle_cancel"] = true
        character_animator(obj_char,obj_char["character_animation"])
        state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char)
        return true
    end
end
function state_gate_game_scene_char_LP_from_6dash_dash_cancel(input,obj_char)
    -- _overdrive
    if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
        return true
    end
    -- _BRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_blue(input,obj_char) then
        return true
    end
    -- common_ground_to_special_move
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
    end
    -- _5_stand_dash_skid
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_dash_skid(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_dash_skid"
        state_gate_game_scene_char_LP_from_5_stand_dash_skid(input,obj_char)
        return true
    end
end

function state_gate_game_scene_char_LP_from_burst_RC_red(input,obj_char)
    local obj_char_other_side = common_game_scene_change_character("L")
    if obj_char["idle_cancel"] then
        if obj_char["height_state"] == "air" then
            -- _common_air_idle_to_move
            if state_gate_game_scene_char_LP_common_air_to_special_move_hold_ver(input,obj_char) then
                common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,0,nil})
                common_game_scene_game_speed_load_application(obj_char_other_side,{1,2,1,19,0,nil})
                obj_char["heat_penalty"] = 0.1
                obj_char["heat_penalty_countdown"] = 120
                obj_char["velocity"][1] = obj_char["velocity"][1]*1
                obj_char["velocity"][2] = obj_char["velocity"][2]*5
                return true
            end
            if state_gate_game_scene_char_LP_common_air_to_attack_move_hold_ver(input,obj_char) then
                common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,0,nil})
                common_game_scene_game_speed_load_application(obj_char_other_side,{1,2,1,19,0,nil})
                obj_char["heat_penalty"] = 0.1
                obj_char["heat_penalty_countdown"] = 120
                obj_char["velocity"][1] = obj_char["velocity"][1]*1
                obj_char["velocity"][2] = obj_char["velocity"][2]*5
                return true
            end
        else
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_attack_move_hold_ver(input,obj_char) then
                common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,0,nil})
                common_game_scene_game_speed_load_application(obj_char_other_side,{1,2,1,19,0,nil})
                obj_char["heat_penalty"] = 0.1
                obj_char["heat_penalty_countdown"] = 120
                obj_char["velocity"][1] = obj_char["velocity"][1]*1
                obj_char["velocity"][2] = 0
                return true
            end
        end
    end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        -- state
        obj_char["idle_cancel"] = true
        obj_char["physics_lock"] = false
        -- state_number
        obj_char["heat_penalty"] = 0.1
        obj_char["heat_penalty_countdown"] = 240
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- init_character_anim
        if obj_char["height_state"] == "air" then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "7_8_9_jump_air"
            obj_char["idle_cancel"] = true
            obj_char["f"] = 20
            character_animator(obj_char,obj_char["character_animation"])
            -- _common_air_idle_to_move
            if state_gate_game_scene_char_LP_common_air_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
                return true
            end
            return true
        else
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)  
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "5_stand_idle"
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
                return true
            end
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_burst_RC_blue(input,obj_char)
    local obj_char_other_side = common_game_scene_change_character("L")
    if obj_char["idle_cancel"] then
        if obj_char["height_state"] == "air" then
            -- _common_air_idle_to_move
            if state_gate_game_scene_char_LP_common_air_to_special_move_hold_ver(input,obj_char) then
                common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,0,nil})
                common_game_scene_game_speed_load_application(obj_char_other_side,{1,2,1,29,0,nil})
                obj_char["heat_penalty"] = 0.1
                obj_char["heat_penalty_countdown"] = 60
                obj_char["velocity"][1] = obj_char["velocity"][1]*1 + obj_char["velocity_cache"][1]*0.625
                obj_char["velocity"][2] = obj_char["velocity"][2]*1 + obj_char["velocity_cache"][2]*1.25
                return true
            end
            if state_gate_game_scene_char_LP_common_air_to_attack_move_hold_ver(input,obj_char) then
                common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,0,nil})
                common_game_scene_game_speed_load_application(obj_char_other_side,{1,2,1,29,0,nil})
                obj_char["heat_penalty"] = 0.1
                obj_char["heat_penalty_countdown"] = 60
                obj_char["velocity"][1] = obj_char["velocity"][1]*1 + obj_char["velocity_cache"][1]*0.625
                obj_char["velocity"][2] = obj_char["velocity"][2]*1 + obj_char["velocity_cache"][2]*1.25
                return true
            end
        else
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_attack_move_hold_ver(input,obj_char) then
                common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,0,nil})
                common_game_scene_game_speed_load_application(obj_char_other_side,{1,2,1,29,0,nil})
                obj_char["heat_penalty"] = 0.1
                obj_char["heat_penalty_countdown"] = 60
                obj_char["velocity"][1] = obj_char["velocity"][1]*1 + obj_char["velocity_cache"][1]*0.625
                obj_char["velocity"][2] = 0
                return true
            end
        end
    end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        -- state
        obj_char["idle_cancel"] = true
        obj_char["physics_lock"] = false
        -- state_number
        obj_char["heat_penalty"] = 0.1
        obj_char["heat_penalty_countdown"] = 120
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- init_character_anim
        if obj_char["height_state"] == "air" then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "7_8_9_jump_air"
            obj_char["idle_cancel"] = true
            obj_char["f"] = 20
            character_animator(obj_char,obj_char["character_animation"])
            -- _common_air_idle_to_move
            if state_gate_game_scene_char_LP_common_air_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
                return true
            end
            return true
        else
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)  
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "5_stand_idle"
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
                return true
            end
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_burst_RC_purple(input,obj_char)
    local obj_char_other_side = common_game_scene_change_character("L")
    if obj_char["idle_cancel"] then
        if obj_char["height_state"] == "air" then
            -- _common_air_idle_to_move
            if state_gate_game_scene_char_LP_common_air_to_special_move_hold_ver(input,obj_char) then
                common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,0,nil})
                common_game_scene_game_speed_load_application(obj_char_other_side,{1,2,1,29,0,nil})
                obj_char["heat_penalty"] = 0.1
                obj_char["heat_penalty_countdown"] = 120
                obj_char["velocity"][1] = obj_char["velocity"][1]*1
                obj_char["velocity"][2] = obj_char["velocity"][2]*5
                return true
            end
            if state_gate_game_scene_char_LP_common_air_to_attack_move_hold_ver(input,obj_char) then
                common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,0,nil})
                common_game_scene_game_speed_load_application(obj_char_other_side,{1,2,1,29,0,nil})
                obj_char["heat_penalty"] = 0.1
                obj_char["heat_penalty_countdown"] = 120
                obj_char["velocity"][1] = obj_char["velocity"][1]*1
                obj_char["velocity"][2] = obj_char["velocity"][2]*5
                return true
            end
        else
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_attack_move_hold_ver(input,obj_char) then
                common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,0,nil})
                common_game_scene_game_speed_load_application(obj_char_other_side,{1,2,1,29,0,nil})
                obj_char["heat_penalty"] = 0.1
                obj_char["heat_penalty_countdown"] = 120
                obj_char["velocity"][1] = obj_char["velocity"][1]*1
                obj_char["velocity"][2] = 0
                return true
            end
        end
    end
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        -- state
        obj_char["idle_cancel"] = true
        obj_char["physics_lock"] = false
        -- state_number
        obj_char["heat_penalty"] = 0.1
        obj_char["heat_penalty_countdown"] = 60
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- init_character_anim
        if obj_char["height_state"] == "air" then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "7_8_9_jump_air"
            obj_char["idle_cancel"] = true
            obj_char["f"] = 20
            character_animator(obj_char,obj_char["character_animation"])
            -- _common_air_idle_to_move
            if state_gate_game_scene_char_LP_common_air_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
                return true
            end
            return true
        else
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)  
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "5_stand_idle"
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
                return true
            end
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_burst_RC_yellow(input,obj_char)
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        -- state
        obj_char["idle_cancel"] = true
        obj_char["physics_lock"] = false
        -- state_number
        obj_char["heat_penalty"] = 0.1
        obj_char["heat_penalty_countdown"] = 480
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- init_character_anim
        if obj_char["height_state"] == "air" then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "7_8_9_jump_air"
            obj_char["idle_cancel"] = true
            obj_char["f"] = 20
            character_animator(obj_char,obj_char["character_animation"])
            -- _common_air_idle_to_move
            if state_gate_game_scene_char_LP_common_air_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
                return true
            end
            return true
        else
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)  
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "5_stand_idle"
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
                return true
            end
        end
        return true
    end
end

function state_gate_game_scene_char_LP_from_burst_overdrive(input,obj_char)
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        -- to stand_idle
        obj_char["idle_cancel"] = true
        obj_char["physics_lock"] = false
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        if obj_char["height_state"] == "air" then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "7_8_9_jump_air"
            obj_char["idle_cancel"] = true
            obj_char["f"] = 20
            character_animator(obj_char,obj_char["character_animation"])
            -- _common_air_idle_to_move
            if state_gate_game_scene_char_LP_common_air_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
                return true
            end
            return true
        else
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)  
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["f"] = 28
            character_animator(obj_char,obj_char["character_animation"])
            obj_char["state"] = "5_stand_idle"
            -- _common_ground_idle_to_move
            if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
                return true
            end
            if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
                return true
            end
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_burst_burst(input,obj_char)
end

function state_gate_game_scene_char_LP_from_2P(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- special
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
        -- _2P
        if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press(input["P"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_2P(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "2P"
            return true
        end
        -- _6P
        if obj_char["direction_input"] == 6 and test_input_sys_press(input["P"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6P(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6P"
            return true
        end
        -- _5P
        if test_input_sys_press(input["P"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5P(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "5P"
            return true
        end
        -- _6K
        if obj_char["direction_input"] == 6 and test_input_sys_press(input["K"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6K(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6K"
            return true
        end
        -- _6S
        if obj_char["direction_input"] == 6 and test_input_sys_press(input["S"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6S(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6S"
            return true
        end
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_1_2_3_crouch(input,obj_char) then
            return true
        end
    end
    -- _1_2_3_crouch
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        obj_char["f"] = 4
        character_animator(obj_char,obj_char["character_animation"])
        return true
    end
end
function state_gate_game_scene_char_LP_from_6P(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- special
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_5P(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- special
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
        -- _2P
        if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press(input["P"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_2P(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "2P"
            return true
        end
        -- _6P
        if obj_char["direction_input"] == 6 and test_input_sys_press(input["P"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6P(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6P"
            return true
        end
        -- _5P
        if test_input_sys_press(input["P"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5P(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "5P"
            return true
        end
        -- _6K
        if (obj_char["direction_input"] == 6 or obj_char["direction_input"] == 3) and test_input_sys_press(input["K"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6K(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6K"
            return true
        end
        -- _6S
        if (obj_char["direction_input"] == 6 or obj_char["direction_input"] == 3) and test_input_sys_press(input["S"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6S(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6S"
            return true
        end
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_2K(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- special
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
        -- _6K
        if (obj_char["direction_input"] == 6 or obj_char["direction_input"] == 3) and test_input_sys_press(input["K"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6K(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6K"
            return true
        end
        -- _6S
        if (obj_char["direction_input"] == 6 or obj_char["direction_input"] == 3) and test_input_sys_press(input["S"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6S(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6S"
            return true
        end
        -- 2Launcher
        if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press(input["Launcher"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_2Launcher(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "2Launcher"
            return true
        end
        -- _5Launcher
        if test_input_sys_press(input["Launcher"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5Launcher(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "5Launcher"
            return true
        end
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_1_2_3_crouch(input,obj_char) then
            return true
        end
    end
    -- _1_2_3_crouch
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        obj_char["f"] = 4
        character_animator(obj_char,obj_char["character_animation"])
        return true
    end
end
function state_gate_game_scene_char_LP_from_6K(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- special
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_5K(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- kara
    -- 2K
    if common_game_scene_check_crouch_direction(obj_char) and obj_char["f"] <= 4 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["velocity"] = obj_char["velocity_cache"]
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_2K(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "2K"
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- special
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
        -- _6P
        if (obj_char["direction_input"] == 6 or obj_char["direction_input"] == 3) and test_input_sys_press(input["P"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6P(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6P"
            return true
        end
        -- _6K
        if (obj_char["direction_input"] == 6 or obj_char["direction_input"] == 3) and test_input_sys_press(input["K"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6K(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6K"
            return true
        end
        -- _6S
        if (obj_char["direction_input"] == 6 or obj_char["direction_input"] == 3) and test_input_sys_press(input["S"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6S(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6S"
            return true
        end
        -- _2Launcher
        if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press(input["Launcher"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_2Launcher(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "2Launcher"
            return true
        end
        -- _5Launcher
        if test_input_sys_press(input["Launcher"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5Launcher(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "5Launcher"
            return true
        end
        -- _6dash_dash_cancel
        if test_input_sys_press(input["dash"]) and obj_char["f"] < 13 then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6dash_dash_cancel(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6dash_dash_cancel"
            return true
        end
        -- _7_8_9_pre_jump
        if test_input_sys_press(input["up"]) then
            character_function_game_scene_TRM_histop_ground_jump_cancel(input,obj_char)
            return true
        end
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_2S(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- special
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_1_2_3_crouch(input,obj_char) then
            return true
        end
    end
    -- _1_2_3_crouch
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        obj_char["f"] = 4
        character_animator(obj_char,obj_char["character_animation"])
        return true
    end
end
function state_gate_game_scene_char_LP_from_6S(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- special
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_cS(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- special
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
        -- _6P
        if (obj_char["direction_input"] == 6 or obj_char["direction_input"] == 3) and test_input_sys_press(input["P"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6P(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6P"
            return true
        end
        -- _6K
        if (obj_char["direction_input"] == 6 or obj_char["direction_input"] == 3) and test_input_sys_press(input["K"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6K(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6K"
            return true
        end
        -- _2S
        if (obj_char["direction_input"] == 2 or obj_char["direction_input"] == 1) and test_input_sys_press(input["S"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_2S(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "2S"
            return true
        end
        -- _6S
        if (obj_char["direction_input"] == 6 or obj_char["direction_input"] == 3) and test_input_sys_press(input["S"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6S(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6S"
            return true
        end
        -- _fS
        if test_input_sys_press(input["S"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_fS(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "fS"
            return true
        end
        -- _2Launcher
        if common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press(input["Launcher"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_2Launcher(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "2Launcher"
            return true
        end
        -- _5Launcher
        if test_input_sys_press(input["Launcher"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_5Launcher(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "5Launcher"
            return true
        end
        -- _6dash_dash_cancel
        if test_input_sys_press(input["dash"]) and obj_char["f"] < 13 then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_6dash_dash_cancel(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "6dash_dash_cancel"
            return true
        end
        -- _7_8_9_pre_jump
        if test_input_sys_press(input["up"]) then
            character_function_game_scene_TRM_histop_ground_jump_cancel(input,obj_char)
            return true
        end
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_fS(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- special
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_5H(input,obj_char)
    if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
        return true
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_2Launcher(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- special
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_1_2_3_crouch(input,obj_char) then
            return true
        end
    end
    -- _1_2_3_crouch
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "1_2_3_crouch"
        obj_char["f"] = 4
        character_animator(obj_char,obj_char["character_animation"])
        return true
    end
end
function state_gate_game_scene_char_LP_from_4_6Launcher(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_5Launcher(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- special
        if state_gate_game_scene_char_LP_common_ground_to_special_move(input,obj_char) then
            return true
        end
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_5Launcher_hold(input,obj_char)
end

function state_gate_game_scene_char_LP_from_jP(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- _7_8_9_jump_air_to_stand_idle
    if collision_test_char_on_ground(obj_char) and obj_char["velocity"][2] > 0.0 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air_to_stand_idle"
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char) then
            return true
        end
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- _jP
        if obj_char["y"] < -240 and test_input_sys_press(input["P"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_jP(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "jP"
            return true
        end
    end
    if obj_char["hit_cancel"] and obj_char["air_gatling_state"] then
        -- _j2K
        if obj_char["y"] < -240 and common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press(input["K"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_j2K(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "j2K"
            return true
        end
        -- _jK
        if obj_char["y"] < -240 and test_input_sys_press(input["K"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_jK(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "jK"
            return true
        end
        -- _jS
        if obj_char["y"] < -240 and test_input_sys_press(input["S"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_jS(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "jS"
            return true
        end
    end
    -- _7_8_9_jump_air
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air"
        obj_char["idle_cancel"] = true
        obj_char["f"] = 20
        character_animator(obj_char,obj_char["character_animation"])
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
            return true
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_jK(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- _7_8_9_jump_air_to_stand_idle
    if collision_test_char_on_ground(obj_char) and obj_char["velocity"][2] > 0.0 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air_to_stand_idle"
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char) then
            return true
        end
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- _jS
        if obj_char["y"] < -240 and test_input_sys_press(input["S"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_jS(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "jS"
            return true
        end
    end
    if obj_char["hit_cancel"] and obj_char["air_gatling_state"] then
        -- _jP
        if obj_char["y"] < -240 and test_input_sys_press(input["P"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_jP(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "jP"
            return true
        end
        -- _j2K
        if obj_char["y"] < -240 and common_game_scene_check_crouch_direction(obj_char) and test_input_sys_press(input["K"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_j2K(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "j2K"
            return true
        end
        -- _jS
        if obj_char["y"] < -240 and test_input_sys_press(input["S"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_jS(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "jS"
            return true
        end
    end
    -- _7_8_9_jump_air
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air"
        obj_char["idle_cancel"] = true
        obj_char["f"] = 20
        character_animator(obj_char,obj_char["character_animation"])
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
            return true
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_j2K(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- _7_8_9_jump_air_to_stand_idle
    if collision_test_char_on_ground(obj_char) and obj_char["velocity"][2] > 0.0 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air_to_stand_idle"
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char) then
            return true
        end
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] and obj_char["f"] >= 15 then
        if test_input_sys_press(input["S"]) then
            if not common_game_scene_get_character_facing_currect(obj_char) then
                obj_char[5] = -obj_char[5]
            end
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_jS(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "jS"
            return true
        end
        if test_input_sys_press(input["Launcher"]) then
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_j5Launcher(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "j5Launcher"
            return true
        end
    end
    -- _7_8_9_jump_air
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air"
        obj_char["idle_cancel"] = true
        obj_char["f"] = 20
        character_animator(obj_char,obj_char["character_animation"])
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
            return true
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_jS(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- _7_8_9_jump_air_to_stand_idle
    if collision_test_char_on_ground(obj_char) and obj_char["velocity"][2] > 0.0 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air_to_stand_idle"
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char) then
            return true
        end
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        -- jump_cancel
        if test_input_sys_press(input["up"]) and obj_char["air_move"]["jump"][1] > 0 then
            character_function_game_scene_TRM_hitstop_air_jump_cancel(
                input,obj_char,
                0.1,-11.5,-30,
                0,0,-30,
                0.1,11.5,-25
            )
            return true
        end
    end
    -- _7_8_9_jump_air
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air"
        obj_char["idle_cancel"] = true
        obj_char["f"] = 20
        character_animator(obj_char,obj_char["character_animation"])
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
            return true
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_j4_6Launcher(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- _7_8_9_jump_air_to_stand_idle
    if collision_test_char_on_ground(obj_char) and obj_char["velocity"][2] > 0.0 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air_to_stand_idle"
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char) then
            return true
        end
        return true
    end
    -- _7_8_9_jump_air
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air"
        obj_char["idle_cancel"] = true
        obj_char["f"] = 20
        character_animator(obj_char,obj_char["character_animation"])
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
            return true
        end
        return true
    end
end
function state_gate_game_scene_char_LP_from_j5Launcher(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- _7_8_9_jump_air_to_stand_idle
    if collision_test_char_on_ground(obj_char) and obj_char["velocity"][2] > 0.0 then
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air_to_stand_idle"
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air_to_stand_idle(input,obj_char) then
            return true
        end
        return true
    end
    -- hit_cancel
    if obj_char["hit_cancel"] then
        if test_input_sys_press(input["up"]) and obj_char["air_move"]["jump"][1] > 0 then
            -- jump_cancel
            character_function_game_scene_TRM_hitstop_air_jump_cancel(
                input,obj_char,
                0.1,-11.5,-30,
                0,0,-30,
                0.1,11.5,-29.5
            )
            return true
        end
    end
    -- _7_8_9_jump_air
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1],obj_char["velocity"][2])
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "7_8_9_jump_air"
        obj_char["idle_cancel"] = true
        obj_char["f"] = 24
        character_animator(obj_char,obj_char["character_animation"])
        if state_gate_game_scene_char_LP_from_7_8_9_jump_air(input,obj_char) then
            return true
        end
        return true
    end
end

function state_gate_game_scene_char_LP_from_4SP_P(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        -- _overdrive
        if state_gate_game_scene_char_LP_common_to_burst_overdrive(input,obj_char,"overdrive") then
            return true
        end
        -- _7_8_9_pre_jump
        if common_game_scene_check_jump_direction(obj_char) then
            obj_char["direction_input_cache_hit_jump_cancel"] = obj_char["direction_input"]
            obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
            init_character_anim_with(obj_char,obj_char["character_animation"])
            obj_char["state"] = "7_8_9_pre_jump"
            return true
        end
        -- _common_ground_idle_to_move
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_6dash_only(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_common_ground_to_attack_move(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_6SP_P(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4SP_K(input,obj_char)
end
function state_gate_game_scene_char_LP_from_6SP_K(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4SP_S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4SP_S_4dash(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4SP_S_6dash(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4SP_S_S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4SP_S_H(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4SP_S_2Launcher(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4SP_S_6Launcher(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4SP_S_5Launcher(input,obj_char)
end
function state_gate_game_scene_char_LP_from_6SP_S(input,obj_char)
    -- _PRC
    if state_gate_game_scene_char_LP_common_to_burst_RC_purple(input,obj_char) then
        return true
    end
    -- idle_cancel
    if obj_char["idle_cancel"] then
        if state_gate_game_scene_char_LP_common_ground_to_dash_move_hold_ver_all(input,obj_char) then
            return true
        end
        if state_gate_game_scene_char_LP_from_5_stand_idle(input,obj_char) then
            return true
        end
    end
    -- _5_stand_idle
    if get_character_anim_end_state(obj_char,obj_char["character_animation"]) then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
        init_character_anim_with(obj_char,obj_char["character_animation"])
        obj_char["state"] = "5_stand_idle"
        return true
    end
end
function state_gate_game_scene_char_LP_from_SP_H(input,obj_char)
end
function state_gate_game_scene_char_LP_from_SP_H_P(input,obj_char)
end
function state_gate_game_scene_char_LP_from_SP_H_K(input,obj_char)
end
function state_gate_game_scene_char_LP_from_SP_H_S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_SP_H_H(input,obj_char)
end

function state_gate_game_scene_char_LP_from_jSP_S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_jSP_H(input,obj_char)
end
function state_gate_game_scene_char_LP_from_jSP_H_P(input,obj_char)
end
function state_gate_game_scene_char_LP_from_jSP_H_K(input,obj_char)
end
function state_gate_game_scene_char_LP_from_jSP_H_S(input,obj_char)
end
function state_gate_game_scene_char_LP_from_jSP_H_H(input,obj_char)
end

function state_gate_game_scene_char_LP_from_4UA(input,obj_char)
end
function state_gate_game_scene_char_LP_from_6UA(input,obj_char)
end
function state_gate_game_scene_char_LP_from_5UA(input,obj_char)
end
function state_gate_game_scene_char_LP_from_4SP_S_5UA(input,obj_char)
end

-- draw
function draw_game_scene_char_LP_logic_graphic_pos_sync()
    local obj = nil
    local obj_char = obj_char_game_scene_char_LP
    local oroboros_ease_current = obj_char["shot_sys_oroboros_ease_current"]
    local shot_offset_amount = obj_char["shot_sys_oroboros_offset_amount"] 
    local shot_r = obj_char["shot_sys_oroboros_aim_r"]*obj_char[5]
    local dx = -15
    local dy = -50
    local rot_dx = nil
    local rot_dy = nil

    if obj_char[5] > 0 then
        shot_r = math.min(shot_r,0.42)
        shot_r = math.max(shot_r,-0.8)
    else
        shot_r = math.max(shot_r,-0.42)
        shot_r = math.min(shot_r,0.8)
    end

    -- x y z opacity sx sy r f
    -- oroboros_back
    obj = obj_char["shot_sys_oroboros_back"]
    obj[1] = oroboros_ease_current[1] + oroboros_ease_current[3]*(dx - math.cos(shot_r)*shot_offset_amount*0.5)
    obj[2] = oroboros_ease_current[2] + oroboros_ease_current[4]*(dy - math.sin(shot_r)*shot_offset_amount*0.5)
    obj[3] = obj_char[3]
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]

    -- character
    obj_char[1] = obj_char["x"]+obj_char["hurtstop_wiggle_current_x"]-obj_char[5]*obj_char["anchor_pos"][1]
    obj_char[2] = obj_char["y"]+obj_char["hurtstop_wiggle_current_y"]-obj_char[6]*obj_char["anchor_pos"][2]

    -- oroboros_mid
    obj = obj_char["shot_sys_oroboros_mid"]
    dx = -80
    dy = -95
    rot_dx = dx*oroboros_ease_current[3]*math.cos(shot_r) - dy*oroboros_ease_current[4]*math.sin(shot_r)
    rot_dy = dx*oroboros_ease_current[3]*math.sin(shot_r) + dy*oroboros_ease_current[4]*math.cos(shot_r)
    obj[1] = oroboros_ease_current[1] + rot_dx
    obj[2] = oroboros_ease_current[2] + rot_dy
    obj[3] = obj_char[3]
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = shot_r

    -- oroboros_front
    obj = obj_char["shot_sys_oroboros_front"]
    dx = -80
    dy = -80
    obj[1] = oroboros_ease_current[1] + oroboros_ease_current[3]*(dx - math.cos(shot_r)*shot_offset_amount*0.7)
    obj[2] = oroboros_ease_current[2] + oroboros_ease_current[4]*(dy - math.sin(shot_r)*shot_offset_amount*0.7)
    obj[3] = obj_char[3]
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
end
function draw_game_scene_char_LP()
    local obj = {0,0,0,0,0,0,0,0}
    local obj_char = obj_char_game_scene_char_LP
    local obj_camera = obj_stage_game_scene_camera
    local image_sprite_sheet = nil
    
    local shader = shader_game_scene_brightness_contrast
    shader:send("contrast",obj_char["contrast"])
    shader:send("brightness",obj_char["brightness"])

    -- draw_back
    -- x y z opacity sx sy r f
    obj = obj_char["shot_sys_oroboros_back"]
    image_sprite_sheet = image_sprite_sheet_table_char_game_scene_LP[obj["sprite_sheet_state"]]
    image_sprite_sheet["sprite_batch"]:clear()
    draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    
    -- draw_3d_image_table(obj_camera,obj,character_image_table)
    image_sprite_sheet = image_sprite_sheet_table_char_game_scene_LP[obj_char["sprite_sheet_state"]]
    image_sprite_sheet["sprite_batch"]:clear()
    draw_3d_image_sprite_batch(obj_camera,obj_char,image_sprite_sheet,tostring(obj_char[8]))
    love.graphics.setShader(shader)
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    love.graphics.setShader()

    -- draw_mid
    obj = obj_char["shot_sys_oroboros_mid"]
    image_sprite_sheet = image_sprite_sheet_table_char_game_scene_LP[obj["sprite_sheet_state"]]
    image_sprite_sheet["sprite_batch"]:clear()
    draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])

    -- darw_front
    obj = obj_char["shot_sys_oroboros_front"]
    image_sprite_sheet = image_sprite_sheet_table_char_game_scene_LP[obj["sprite_sheet_state"]]
    image_sprite_sheet["sprite_batch"]:clear()
    draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
end
function draw_game_scene_char_LP_shadow()
    local obj_char = obj_char_game_scene_char_LP
    local obj_camera = obj_stage_game_scene_camera
    local light_obj = obj_stage_game_scene_glow_with_linear_fade_alpha

    local light_x = light_obj["glow_3d_pos"][1]
    local light_y = light_obj["glow_3d_pos"][2]
    local light_z = light_obj["glow_3d_pos"][3]

    local camera_x = obj_camera[1]
    local camera_y = obj_camera[2]
    local camera_z = obj_camera[3]

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
    local side_blur_start = 0.75
    local blur_start = side_blur_start - ((width-dx_light_char_2d)/width*(side_blur_start-center_blur_start))
    local blur_width = (1.0 - blur_start)*0.85

    love.graphics.setCanvas(DRAW_SHADOW_CANVAS)
    love.graphics.clear(0,0,0,0)
    love.graphics.setShader(shader_game_scene_shadow_radial_blur)
    shader_game_scene_shadow_radial_blur:send("start_coods",cood_res)
    shader_game_scene_shadow_radial_blur:send("input_screen_coords",{width,height})
    shader_game_scene_shadow_radial_blur:send("blur_start",blur_start)
    shader_game_scene_shadow_radial_blur:send("blur_width",blur_width)
    love.graphics.draw(DRAW_CHARACTER_CANVAS,0,0)
    love.graphics.setShader()
    love.graphics.setCanvas()

    -- local opacity = math.max(0,(obj["y"] - 345)/20)*0.5
    love.graphics.setColor(0,0,0,obj_char["shadow_opacity"])
    love.graphics.draw(DRAW_SHADOW_CANVAS)
    love.graphics.setColor(1,1,1,1)
end
function draw_game_scene_char_LP_attachment_front()
    -- retcile
    local obj_char = obj_char_game_scene_char_LP
    local obj_camera = obj_stage_game_scene_camera
    local image_sprite_sheet = image_sprite_sheet_table_char_game_scene_LP[obj_char["shot_sys_reticle_sprite_sheet_state"]]
    image_sprite_sheet["sprite_batch"]:clear()
    draw_3d_image_sprite_batch(obj_camera,obj_char["shot_sys_reticle"],image_sprite_sheet,tostring(obj_char["shot_sys_reticle"][8]))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
end
function draw_game_scene_char_LP_attachment_back()
    -- nil
end
function draw_game_scene_char_LP_pushbox()
    if not DEBUG_HITBOX_SHOWS then
        return
    end

    local obj_char = obj_char_game_scene_char_LP
    local obj_camera = obj_stage_game_scene_camera

    -- push box
    local color = DEBUG_BOX_COLOR_YELLOW
    local draw_box = {
        obj_char["x"] + (obj_char["pushbox"][1] - obj_char["pushbox"][3]/2)*obj_char[5],
        obj_char["y"] + obj_char["pushbox"][2] - obj_char["pushbox"][4]/2,
        obj_char[3],obj_char[5],1
    }
    draw_box["w"] = obj_char["pushbox"][3]
    draw_box["h"] = obj_char["pushbox"][4]
    draw_3d_color_box(obj_camera,draw_box,color)

    local draw_capsule = {
        obj_char["x"] + obj_char["pushbox"][1]*obj_char[5],
        obj_char["y"] + obj_char["pushbox"][2],
        obj_char[3],obj_char[5],1
    }
    draw_capsule["r"] = obj_char["pushbox"][3]/2
    draw_capsule["h"] = obj_char["pushbox"][4]
    draw_3d_capsule(obj_camera,draw_capsule,color)

    for i=1,#obj_char["projectile_table"] do
        local current_projectile = obj_char["projectile_table"][i]
        local current_pushbox = current_projectile["pushbox"]
        if current_pushbox then
            local draw_box = {
                current_projectile["x"] + (current_pushbox[1] - current_pushbox[3]/2)*current_projectile[5],
                current_projectile["y"] + current_pushbox[2] - current_pushbox[4]/2,
                current_projectile[3],current_projectile[5],1
            }
            draw_box["w"] = current_hurtbox[3]
            draw_box["h"] = current_hurtbox[4]
            draw_3d_color_box(obj_camera,draw_box,color)
        end
    end
end
function draw_game_scene_char_LP_hurtbox()
    if not DEBUG_HITBOX_SHOWS then
        return
    end

    local obj_char = obj_char_game_scene_char_LP
    local obj_camera = obj_stage_game_scene_camera

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
        draw_3d_color_box(obj_camera,draw_box,color)
    end
    for i=1,#obj_char["projectile_table"] do
        local current_projectile = obj_char["projectile_table"][i]
        for j=1,#current_projectile["hurtbox_table"] do
            local current_hurtbox = current_projectile["hurtbox_table"][j]
            if current_hurtbox then
                local draw_box = {
                    current_projectile["x"] + (current_hurtbox[1] - current_hurtbox[3]/2)*current_projectile[5],
                    current_projectile["y"] + current_hurtbox[2] - current_hurtbox[4]/2,
                    current_projectile[3],current_projectile[5],1
                }
                draw_box["w"] = current_hurtbox[3]
                draw_box["h"] = current_hurtbox[4]
                draw_3d_color_box(obj_camera,draw_box,color)
            end
        end
    end
end
function draw_game_scene_char_LP_hitbox()
    if not DEBUG_HITBOX_SHOWS then
        return
    end

    local obj_char = obj_char_game_scene_char_LP
    local obj_camera = obj_stage_game_scene_camera

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
        draw_3d_color_box(obj_camera,draw_box,color)
    end
    for i=1,#obj_char["projectile_table"] do
        local current_projectile = obj_char["projectile_table"][i]
        for j=1,#current_projectile["hitbox_table"] do
            local current_hitbox = current_projectile["hitbox_table"][j]
            if current_hitbox then
                local draw_box = {
                    current_projectile["x"] + (current_hitbox[1] - current_hitbox[3]/2)*current_projectile[5],
                    current_projectile["y"] + current_hitbox[2] - current_hitbox[4]/2,
                    current_projectile[3],current_projectile[5],1
                }
                draw_box["w"] = current_hitbox[3]
                draw_box["h"] = current_hitbox[4]
                draw_3d_color_box(obj_camera,draw_box,color)
            end
        end
    end
    for i=1,#obj_char["projectile_rc_table"] do
        local current_projectile = obj_char["projectile_rc_table"][i]
        for j=1,#current_projectile["hitbox_table"] do
            local current_hitbox = current_projectile["hitbox_table"][j]
            if current_hitbox then
                local draw_box = {
                    current_projectile["x"] + (current_hitbox[1] - current_hitbox[3]/2)*current_projectile[5],
                    current_projectile["y"] + current_hitbox[2] - current_hitbox[4]/2,
                    current_projectile[3],current_projectile[5],1
                }
                draw_box["w"] = current_hitbox[3]
                draw_box["h"] = current_hitbox[4]
                draw_3d_color_box(obj_camera,draw_box,color)
            end
        end
    end
end

-- projectile
function update_game_scene_char_LP_projectile()
    for i = #obj_char_game_scene_char_LP["projectile_rc_table"],1,-1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["projectile_rc_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["projectile_rc_table"],i) -- 寿命耗尽，从列表中移除
        end
    end
    for i = #obj_char_game_scene_char_LP["projectile_table"],1,-1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["projectile_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["projectile_table"],i) -- 寿命耗尽，从列表中移除
        end
    end
end
function draw_game_scene_char_LP_projectile()
    for i = #obj_char_game_scene_char_LP["projectile_table"],1,-1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["projectile_table"][i]
        object["draw"]()
    end
end
function draw_game_scene_char_LP_projectile_rc()
    for i = #obj_char_game_scene_char_LP["projectile_rc_table"],1,-1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["projectile_rc_table"][i]
        object["draw"]()
    end
end

-- VFX
function update_game_scene_char_LP_VFX()
    for i = #obj_char_game_scene_char_LP["VFX_HUD_table"],1,-1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_HUD_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["VFX_HUD_table"],i) -- 寿命耗尽，从列表中移除
        end
    end
    for i = #obj_char_game_scene_char_LP["VFX_hit_front_table"],1,-1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_hit_front_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["VFX_hit_front_table"],i) -- 寿命耗尽，从列表中移除
        end
    end
    for i = #obj_char_game_scene_char_LP["VFX_front_table"],1,-1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_front_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["VFX_front_table"],i) -- 寿命耗尽，从列表中移除
        end
    end
    for i = #obj_char_game_scene_char_LP["VFX_hit_back_table"],1,-1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_hit_back_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["VFX_hit_back_table"],i) -- 寿命耗尽，从列表中移除
        end
    end
    for i = #obj_char_game_scene_char_LP["VFX_back_table"],1,-1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_back_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["VFX_back_table"],i) -- 寿命耗尽，从列表中移除
        end
    end
end
function draw_game_scene_char_LP_VFX_HUD()
    for i = 1,#obj_char_game_scene_char_LP["VFX_HUD_table"],1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_HUD_table"][i]
        object["draw"]()
    end
end
function draw_game_scene_char_LP_VFX_front()
    for i = 1,#obj_char_game_scene_char_LP["VFX_front_table"],1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_front_table"][i]
        object["draw"]()
    end
    for i = 1,#obj_char_game_scene_char_LP["VFX_hit_front_table"],1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_hit_front_table"][i]
        object["draw"]()
    end
end
function draw_game_scene_char_LP_VFX_back()
    for i = 1,#obj_char_game_scene_char_LP["VFX_back_table"],1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_back_table"][i]
        object["draw"]()
    end
    for i = 1,#obj_char_game_scene_char_LP["VFX_hit_back_table"],1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_hit_back_table"][i]
        object["draw"]()
    end
end
function update_game_scene_char_LP_black_overlay()
    for i = #obj_char_game_scene_char_LP["VFX_black_overlay_table"],1,-1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_black_overlay_table"][i]
        object["update"](object)
        if object["life"] <= 0 then
            table.remove(obj_char_game_scene_char_LP["VFX_black_overlay_table"],i) -- 寿命耗尽，从列表中移除
        end
    end
end
function draw_game_scene_char_LP_black_overlay()
    for i = 1,#obj_char_game_scene_char_LP["VFX_black_overlay_table"],1 do -- 反向遍历，便于删除元素
        local object = obj_char_game_scene_char_LP["VFX_black_overlay_table"][i]
        object["draw"]()
    end
end

-- countdown
function update_game_scene_char_LP_overdrive_countdown()
    local obj_char = obj_char_game_scene_char_LP
    if obj_char["state"] == "hitstop" or obj_char["state"] == "hurtstop" or obj_char["state"] == "blockstop" then
        return
    end
    if obj_char["state"] ~= "burst_overdrive" and 
    obj_char["overdrive_timer"][1] + obj_char["overdrive_timer"][2] +
    obj_char["overdrive_timer"][3] + obj_char["overdrive_timer"][4] > 1
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
    obj_char["overdrive_timer"][3] + obj_char["overdrive_timer"][4] <= 1
    then
        obj_char["overdrive_timer"] = {0,0,0,0}
        obj_char["overdrive_gauge"][3] = "off"
    end
end
function update_game_scene_char_LP_inv_state_countdown()
    local obj_char = obj_char_game_scene_char_LP
    if obj_char["state"] == "hitstop" or obj_char["state"] == "hurtstop" or obj_char["state"] == "blockstop" then
        return
    end
    if obj_char["strike_inv_countdown"] > 1 then
        obj_char["strike_inv_countdown"] = obj_char["strike_inv_countdown"] - 1
    else
        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
    end
    if obj_char["throw_inv_countdown"] > 1 then
        obj_char["throw_inv_countdown"] = obj_char["throw_inv_countdown"] - 1
    else
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
    end
    if obj_char["projectile_inv_countdown"] > 1 then
        obj_char["projectile_inv_countdown"] = obj_char["projectile_inv_countdown"] - 1
    else
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
    end
end
function update_game_scene_char_LP_heat_penalty_countdown()
    local obj_char = obj_char_game_scene_char_LP
    if obj_char["state"] == "hitstop" or obj_char["state"] == "hurtstop" or obj_char["state"] == "blockstop" then
        return
    end
    if obj_char["heat_penalty_countdown"] > 1 then
        obj_char["heat_penalty_countdown"] = obj_char["heat_penalty_countdown"] - 1
    else
        obj_char["heat_penalty"] = 1
        obj_char["heat_penalty_countdown"] = 0
    end
end
function update_game_scene_char_LP_ability_penalty_countdown()
    local obj_char = obj_char_game_scene_char_LP
    if obj_char["state"] == "hitstop" or obj_char["state"] == "hurtstop" or obj_char["state"] == "blockstop" then
        return
    end
    if obj_char["ability_penalty_countdown"] > 1 then
        obj_char["ability_penalty_countdown"] = obj_char["ability_penalty_countdown"] - 1
    else
        obj_char["ability_penalty"] = 1
        obj_char["ability_penalty_countdown"] = 0
    end
end
function update_game_scene_char_LP_positive_bonus_countdown()
    
end
function update_game_scene_char_LP_uncommon()
    -- countdown
    update_game_scene_char_LP_overdrive_countdown()
    update_game_scene_char_LP_inv_state_countdown()
    update_game_scene_char_LP_heat_penalty_countdown()
    update_game_scene_char_LP_ability_penalty_countdown()
    update_game_scene_char_LP_positive_bonus_countdown()
    -- basic_prop_cache
    for i = 1,8 do
        obj_char_game_scene_char_LP["basic_prop_cache"][i] = obj_char_game_scene_char_LP[i]
    end
end
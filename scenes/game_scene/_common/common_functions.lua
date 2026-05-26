function common_game_scene_toggle_dynamic_HUD(toggle_value)
    obj_HUD_game_scene_timer[4] = toggle_value
    obj_HUD_game_scene_win_marks_LP[4] = toggle_value
    obj_HUD_game_scene_win_marks_RP[4] = toggle_value
    obj_HUD_game_scene_match_point_LP[4] = MATCH_POINT["L"]
    obj_HUD_game_scene_match_point_RP[4] = MATCH_POINT["R"]
    obj_HUD_game_scene_health_bar_LP[4] = toggle_value
    obj_HUD_game_scene_health_bar_RP[4] = toggle_value
    obj_HUD_game_scene_health_bar_LP_fade[4] = toggle_value*0.5
    obj_HUD_game_scene_health_bar_RP_fade[4] = toggle_value*0.5
    obj_HUD_game_scene_heat_bar_LP[4] = toggle_value
    obj_HUD_game_scene_heat_bar_RP[4] = toggle_value
    obj_HUD_game_scene_ability_bar_LP[4] = toggle_value
    obj_HUD_game_scene_ability_bar_RP[4] = toggle_value
    obj_HUD_game_scene_overdrive_pie_LP[4] = toggle_value
    obj_HUD_game_scene_overdrive_pie_RP[4] = toggle_value
    obj_HUD_game_scene_overdrive_text_LP[4] = toggle_value
    obj_HUD_game_scene_overdrive_text_RP[4] = toggle_value
    obj_HUD_game_scene_risk_LP[4] = toggle_value
    obj_HUD_game_scene_risk_RP[4] = toggle_value
    obj_HUD_game_scene_background_gauge[4] = toggle_value
end
function common_game_scene_toggle_ease_in(toggle_value)
    obj_annoucer_game_scene_act_common[4] = toggle_value
    obj_annoucer_game_scene_act_num[4] = toggle_value
    obj_HUD_game_scene_ease_in[4] = toggle_value
    obj_annoucer_game_scene_lets_dance[4] = toggle_value
end

function common_game_scene_test_and_apply_wallbreak(hurt_side_obj_char,hit_side_obj_char,projectile,wallhurt_wallstick_on_side_cache)
    local collision_side = false
    if hurt_side_obj_char["collision_move_available"][1] == 0 then
        collision_side = -1
    elseif hurt_side_obj_char["collision_move_available"][2] == 0 then
        collision_side = 1
    end

    if not collision_side then
        return
    end

    if (wallhurt_wallstick_on_side_cache ~= 0 and hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"]) or
    (collision_side and hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"]) 
    then
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = collision_side
        table.insert(obj_stage_game_scene_main["wallbreak_active_application_table"],
            function()
                load_game_scene_stage_apply_wallbreak_start_init(hurt_side_obj_char,hit_side_obj_char)
            end
        )
    end
end

function common_game_scene_anim_0_update_function_unwallstick(obj_char)
    obj_char["wallhurt_wallstickable"] = false
    obj_char["wallhurt_wallbreakable_with_wallstick"] = false
    obj_char["wallhurt_wallbreakable_without_wallstick"] = false
    obj_char["wallhurt_wallbreak_adv"] = false
end

function common_game_scene_get_SFX_table(side)
    if side == "L" then
        return audio_SFX_game_scene_LP
    elseif side == "R" then
        return audio_SFX_game_scene_RP
    end
end
function common_game_scene_get_pushbox(side)
    if side == "L" then
        return obj_pushboxs_data_game_scene_char_LP
    elseif side == "R" then
        return obj_pushboxs_data_game_scene_char_RP
    end
end
function common_game_scene_get_hurtbox(side)
    if side == "L" then
        return obj_hurtboxs_data_game_scene_char_LP
    elseif side == "R" then
        return obj_hurtboxs_data_game_scene_char_RP
    end
end
function common_game_scene_get_anchor(side)
    if side == "L" then
        return obj_anchor_data_game_scene_char_LP
    elseif side == "R" then
        return obj_anchor_data_game_scene_char_RP
    end
end
function common_game_scene_get_VFX_spawn_anchor_pos(side)
    if side == "L" then
        return obj_VFX_spawn_anchor_pos_data_game_scene_char_LP
    elseif side == "R" then
        return obj_VFX_spawn_anchor_pos_data_game_scene_char_RP
    end
end
function common_game_scene_get_image_sprite_sheet_table(side)
    if side == "L" then
        return image_sprite_sheet_table_char_game_scene_LP
    elseif side == "R" then
        return image_sprite_sheet_table_char_game_scene_RP
    end
end
function common_game_scene_get_input_sys_cache_state_machine(side)
    if side == "L" then
        return state_machine_char_game_scene_char_LP_input_sys_cache
    elseif side == "R" then
        return state_machine_char_game_scene_char_RP_input_sys_cache
    end
end
function common_game_scene_get_input_sys_cache_init(side)
    if side == "L" then
        return init_input_sys_cache_LP
    elseif side == "R" then
        return init_input_sys_cache_RP
    end
end
function common_game_scene_get_input_sys_cache_negative_edge_state_machine(side)
    if side == "L" then
        return state_machine_char_game_scene_char_LP_input_sys_cache_negative_edge
    elseif side == "R" then
        return state_machine_char_game_scene_char_RP_input_sys_cache_negative_edge
    end
end
function common_game_scene_get_input_sys_cache_negative_edge_init(side)
    if side == "L" then
        return init_input_sys_cache_negative_edge_LP
    elseif side == "R" then
        return init_input_sys_cache_negative_edge_RP
    end
end
function common_update_game_scene_input_direction(obj_char)
    local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char["player_side"]]
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local right = (test_input_sys_press_or_hold(input["right"]) and 1 or 0)
    local left  = (test_input_sys_press_or_hold(input["left"]) and 1 or 0)
    local up    = (test_input_sys_press_or_hold(input["up"]) and 1 or 0)
    local down  = (test_input_sys_press_or_hold(input["down"]) and 1 or 0)
    if test_input_sys_press_or_hold(input["correction_up"]) then
        up = 1 down = 0
    elseif test_input_sys_press_or_hold(input["correction_down"]) then
        down = 1 up = 0
    end
    if obj_char[5] == -1 then
        left,right = right,left
    end
    obj_char["direction_input"] = 5 + 3*up - 3*down + right*1 - left*1
end
function common_game_scene_get_character_facing_currect(obj_char)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    if obj_char[5] == -1 and obj_char["x"] < obj_char_other_side["x"] then
        return false
    end
    if obj_char[5] == 1 and obj_char["x"] > obj_char_other_side["x"] then
        return false
    end
    return true
end
function common_game_scene_get_character_hurt_direction(obj_char,obj_char_other_side,hurt_horizontal_velocity)
    local dx = obj_char_other_side["x"] - obj_char["x"]
    if dx == 0 then return 0 end
    return hurt_horizontal_velocity*(dx)/math.abs(dx)
end
function common_game_scene_char_enclose_heat_gain(obj_char)
end

function common_game_scene_change_character(side)
    if side == "L" then
        return obj_char_game_scene_char_RP
    elseif side == "R" then
        return obj_char_game_scene_char_LP
    end
end
function common_game_scene_change_character_pushbox(side)
    if side == "L" then
        return obj_pushboxs_data_game_scene_char_RP
    elseif side == "R" then
        return obj_pushboxs_data_game_scene_char_LP
    end
end
function common_game_scene_change_character_hurtbox(side)
    if side == "L" then
        return obj_hurtboxs_data_game_scene_char_RP
    elseif side == "R" then
        return obj_hurtboxs_data_game_scene_char_LP
    end
end
function common_game_scene_change_character_anchor(side)
    if side == "L" then
        return obj_anchor_data_game_scene_char_RP
    elseif side == "R" then
        return obj_anchor_data_game_scene_char_LP
    end
end
function common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    if side == "L" then
        return obj_VFX_spawn_anchor_pos_data_game_scene_char_RP
    elseif side == "R" then
        return obj_VFX_spawn_anchor_pos_data_game_scene_char_LP
    end
end
function common_game_scene_change_input_state(side)
    if side == "L" then
        return INPUT_SYS_CURRENT_COMMAND_STATE["R"]
    elseif side == "R" then
        return INPUT_SYS_CURRENT_COMMAND_STATE["L"]
    end
end

function common_game_scene_check_block_direction(obj_char)
    return
    (
        obj_char["direction_input"] == 1 or
        obj_char["direction_input"] == 4 or
        obj_char["direction_input"] == 7
    ) 
end
function common_game_scene_check_forward_direction(obj_char)
    return
    (
        obj_char["direction_input"] == 9 or
        obj_char["direction_input"] == 6 or
        obj_char["direction_input"] == 3
    ) 
end
function common_game_scene_check_jump_direction(obj_char)
    return
    (
        obj_char["direction_input"] == 7 or
        obj_char["direction_input"] == 8 or
        obj_char["direction_input"] == 9
    ) 
end
function common_game_scene_check_stand_direction(obj_char)
    return
    (
        obj_char["direction_input"] == 4 or
        obj_char["direction_input"] == 5 or
        obj_char["direction_input"] == 6
    ) 
end
function common_game_scene_check_crouch_direction(obj_char)
    return
    (
        obj_char["direction_input"] == 1 or
        obj_char["direction_input"] == 2 or
        obj_char["direction_input"] == 3
    ) 
end

function common_game_scene_block_test(obj_char,obj)
    -- block_test
    local block_bool = false
    local block_direction = obj_char["direction_input"]
    local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char["player_side"]]
    local FD_block = test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"])

    if obj_char["hurt_state"] == "idle" and common_game_scene_check_block_direction(obj_char) then
        if obj_char["height_state"] == "air" and FD_block then
            block_bool = true
        elseif obj_char["height_state"] == "air" and obj["hit_guard_type_state"] ~= "high" then
            block_bool = true
        elseif block_direction == 1 and obj["hit_guard_type_state"] == "low" then
            block_bool = true
        elseif ( block_direction == 4 or block_direction == 7 ) and obj["hit_guard_type_state"] == "mid" then
            block_bool = true
        elseif obj["hit_guard_type_state"] == "all" then
            block_bool = true
        end
    end
    -- You bunch of fools speak like not been protected by this while happy chaos doing cross_up.
    -- Even complaining that this is what causing you to get stuck in an endless 528 loop?
    -- Well then. I shall grant your idoit wish.
    -- if obj_char["hurt_state"] == "idle" and (obj_char["state"] == "block" or obj_char["state"] == "blockstop")then
    --     if obj_char["height_state"] == "air" then
    --         block_bool = true
    --     elseif common_game_scene_check_crouch_direction(obj_char) and obj["hit_guard_type_state"] == "low" then
    --         block_bool = true
    --     elseif ( not common_game_scene_check_crouch_direction(obj_char)) and obj["hit_guard_type_state"] == "mid" then
    --         block_bool = true
    --     elseif obj["hit_guard_type_state"] == "all" then
    --         block_bool = true
    --     end
    -- end
    return block_bool
end

function common_game_scene_strike_hit_function(obj_char)
    -- 只需要设置hitstop
    local hit_side_obj_char = common_game_scene_change_character(obj_char["player_side"])
    local hit_VFX_insert_function_argument = hit_side_obj_char["hit_VFX_insert_function_argument"]
    hit_side_obj_char["state_cache"] = hit_side_obj_char["state"]
    hit_side_obj_char["state"] = "hitstop"
    hit_side_obj_char["last_hitstop_frame"] = 0
    hit_side_obj_char["strike_active"] = false
    hit_side_obj_char["hit_cancel"] = true
    -- stage_collide
    if obj_char["x"] <= -1985 and hit_side_obj_char["x"] < -1930 and hit_side_obj_char[5] == -1 then
        hit_side_obj_char["x"] = -1930
    elseif obj_char["x"] >= 1985 and hit_side_obj_char["x"] > 1930 and hit_side_obj_char[5] == 1 then
        hit_side_obj_char["x"] = 1930
    end
    -- physics_lock
    hit_side_obj_char["physics_lock"] = true
    -- block_test
    local block_bool = common_game_scene_block_test(obj_char,hit_side_obj_char)
    -- risk_gauge
    if obj_char["risk_gauge"][1] >= obj_char["risk_gauge"][2] and not block_bool then
        obj_char["hurt_state"] = "counter"
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver3
    end
    -- counter
    if obj_char["hurt_state"] == "counter" then -- idle unblock punish counter GP parry
        hit_side_obj_char["hit_damage"] = hit_side_obj_char["hit_damage"]*1.1
        local hit_counter_VFX_insert_function_argument = hit_side_obj_char["hit_counter_VFX_insert_function_argument"]
        hit_side_obj_char["hit_counter_VFX_insert_function"](
            hit_counter_VFX_insert_function_argument[1],
            hit_counter_VFX_insert_function_argument[2],
            hit_counter_VFX_insert_function_argument[3],
            hit_counter_VFX_insert_function_argument[4],
            hit_counter_VFX_insert_function_argument[5],
            hit_counter_VFX_insert_function_argument[6],
            hit_counter_VFX_insert_function_argument[7],
            hit_counter_VFX_insert_function_argument[8],
            hit_counter_VFX_insert_function_argument[9]
        )
    elseif not block_bool then
        hit_side_obj_char["hit_VFX_insert_function"](
            hit_VFX_insert_function_argument[1],
            hit_VFX_insert_function_argument[2],
            hit_VFX_insert_function_argument[3],
            hit_VFX_insert_function_argument[4],
            hit_VFX_insert_function_argument[5],
            hit_VFX_insert_function_argument[6],
            hit_VFX_insert_function_argument[7],
            hit_VFX_insert_function_argument[8],
            hit_VFX_insert_function_argument[9]
        )
    else
        hit_side_obj_char["hit_VFX_insert_function"](
            hit_VFX_insert_function_argument[1],
            hit_VFX_insert_function_argument[2],
            hit_VFX_insert_function_argument[3],
            hit_VFX_insert_function_argument[4]*0.25,
            hit_VFX_insert_function_argument[5],
            hit_VFX_insert_function_argument[6],
            hit_VFX_insert_function_argument[7],
            hit_VFX_insert_function_argument[8],
            hit_VFX_insert_function_argument[9]
        )
    end
    -- debug
    hit_side_obj_char["active_frame"] = hit_side_obj_char["active_frame"] + 1
end
function common_game_scene_strike_hurt_function(obj_char)
    -- idle unblock punish counter GP parry
    -- stand crouch air OTG wallstick
    local obj_stage_main = obj_stage_game_scene_main
    local obj_camera = obj_stage_game_scene_camera
    local hit_side_obj_char = common_game_scene_change_character(obj_char["player_side"])
    local wallhurt_wallstick_on_side_cache = obj_char["wallhurt_wallstick_on_side"]
    -- physics_lock
    obj_char["physics_lock"] = true
    -- hurt_block_at_current_frame
    if obj_char["hurt_block_at_current_frame"] then
        return
    end
    obj_char["hurt_block_at_current_frame"] = true
    -- change_draw_front
    CHARACTER_VISUAL_FRONT = hit_side_obj_char["player_side"]
    -- change_character_face
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
    end
    -- block_test
    local block_bool = common_game_scene_block_test(obj_char,hit_side_obj_char)
    if obj_char["height_state"] ~= "air" and block_bool then
        if common_game_scene_check_crouch_direction(obj_char) then
            obj_char["height_state"] = "crouch"
        else
            obj_char["height_state"] = "stand"
        end
    end
    -- idle block
    if block_bool then
        common_game_scene_strike_hurt_function_common_block(obj_char,hit_side_obj_char,obj_stage_main,obj_camera)
    -- GP
    elseif obj_char["hurt_state"] == "GP" then -- idle unblock punish counter GP parry
        -- insert GP
        common_game_scene_strike_hurt_function_GP_hurt(obj_char,hit_side_obj_char,obj_stage_main,obj_camera)
    -- parry
    elseif obj_char["hurt_state"] == "parry" then -- idle unblock punish counter GP parry
        -- parry function
        obj_char["parry_function"](hit_side_obj_char,obj_char)
    -- idle_and_unblock
    else
        if obj_char["hurt_state"] == "punish" then
            insert_VFX_HUD_game_scene_punish(hit_side_obj_char)
        end
        common_game_scene_strike_hurt_function_common_hurt(obj_char,hit_side_obj_char,obj_stage_main,obj_camera)
    end
    -- wallbreak_test_and_apply
    common_game_scene_test_and_apply_wallbreak(obj_char,hit_side_obj_char,nil,wallhurt_wallstick_on_side_cache)
end
function common_game_scene_strike_hurt_function_common_block(obj_char,hit_side_obj_char,obj_stage_main,obj_camera)
    local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char["player_side"]]
    local FD_block = test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"])
    -- state
    obj_char["state_cache"] = "block"
    obj_char["state"] = "blockstop"
    -- hit_hurt_blockstop_countdown
    obj_char["hit_hurt_blockstop_countdown"] = hit_side_obj_char["hit_hurt_blockstop_countdown"]
    obj_char["last_hitstop_frame"] = 0
    -- camera_shake_enclose
    table.insert(obj_stage_main["camera_active_application_table"],
        function()
            anim_stage_point_linear_game_scene_camera_shake_x = hit_side_obj_char["camera_x_shake_anim"]
            anim_stage_point_linear_game_scene_camera_shake_y = hit_side_obj_char["camera_y_shake_anim"]
            init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
            init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y)
            obj_camera["state"] = "active"
        end
    )
    -- character_shake
    obj_char["hurtstop_wiggle_x_animation"] = 
    common_game_scene_create_wiggle_animation(
        obj_char["hit_hurt_blockstop_countdown"] - 1,
        "hurtstop_wiggle_x",
        15
    )
    obj_char["hurtstop_wiggle_y_animation"] = 
    common_game_scene_create_wiggle_animation(
        obj_char["hit_hurt_blockstop_countdown"] - 1,
        "hurtstop_wiggle_y",
        7
    )
    init_point_linear_anim_with(obj_char,obj_char["hurtstop_wiggle_x_animation"])
    init_point_linear_anim_with(obj_char,obj_char["hurtstop_wiggle_y_animation"])
    obj_char["hurtstop_wiggle_current_x"] = (obj_char["hurtstop_wiggle_x"]*(math.random()-0.5)*2)
    obj_char["hurtstop_wiggle_current_y"] = (obj_char["hurtstop_wiggle_y"]*(math.random()-0.5)*2)
    -- block_animation
    if common_game_scene_check_crouch_direction(obj_char) and obj_char["height_state"] == "stand" then
        obj_char["height_state"] = "crouch"
    elseif common_game_scene_check_stand_direction(obj_char) and obj_char["height_state"] == "crouch" then
        obj_char["height_state"] = "stand"
    end
    if obj_char["height_state"] == "stand" then
        obj_char["character_animation"] = hit_side_obj_char["stand_block_animation"]
    elseif obj_char["height_state"] == "crouch" then
        obj_char["character_animation"] = hit_side_obj_char["crouch_block_animation"]
    elseif obj_char["height_state"] == "air" then
        obj_char["character_animation"] = hit_side_obj_char["air_block_animation"]
    end
    init_character_anim_with(obj_char,obj_char["character_animation"])
    -- block_VFX
    hit_side_obj_char["block_VFX_insert_function"](obj_char)
    if FD_block then
        insert_VFX_game_scene_char_FD_block(obj_char)
    end
end
function common_game_scene_strike_hurt_function_GP_hurt(obj_char,hit_side_obj_char,obj_stage_main,obj_camera)
    -- state
    obj_char["state_cache"] = obj_char["state"]
    obj_char["state"] = "hurtstop"
    -- hit_hurt_blockstop_countdown
    obj_char["hit_hurt_blockstop_countdown"] = hit_side_obj_char["hit_hurt_blockstop_countdown"]
    obj_char["last_hitstop_frame"] = 0
    -- camera_shake
    table.insert(obj_stage_main["camera_active_application_table"],
        function()
            anim_stage_point_linear_game_scene_camera_shake_x = hit_side_obj_char["camera_x_shake_anim"]
            anim_stage_point_linear_game_scene_camera_shake_y = hit_side_obj_char["camera_y_shake_anim"]
            init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
            init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y)
            obj_camera["state"] = "active"
        end
    )
    -- character_shake
    obj_char["hurtstop_wiggle_x_animation"] = 
    common_game_scene_create_wiggle_animation(
        obj_char["hit_hurt_blockstop_countdown"] - 1,
        "hurtstop_wiggle_x",
        15
    )
    obj_char["hurtstop_wiggle_y_animation"] = 
    common_game_scene_create_wiggle_animation(
        obj_char["hit_hurt_blockstop_countdown"] - 1,
        "hurtstop_wiggle_y",
        7
    )
    init_point_linear_anim_with(obj_char,obj_char["hurtstop_wiggle_x_animation"])
    init_point_linear_anim_with(obj_char,obj_char["hurtstop_wiggle_y_animation"])
    obj_char["hurtstop_wiggle_current_x"] = (obj_char["hurtstop_wiggle_x"]*(math.random()-0.5)*2)
    obj_char["hurtstop_wiggle_current_y"] = (obj_char["hurtstop_wiggle_y"]*(math.random()-0.5)*2)
    -- insert_GP_VFX
    insert_VFX_game_scene_char_GP(obj_char)
end
function common_game_scene_strike_hurt_function_common_hurt(obj_char,hit_side_obj_char,obj_stage_main,obj_camera)
    -- state
    obj_char["state_cache"] = "hurt"
    obj_char["state"] = "hurtstop"
    obj_char["collision_move_available_cache"] = {1,1}
    -- hit_hurt_blockstop_countdown
    obj_char["hit_hurt_blockstop_countdown"] = hit_side_obj_char["hit_hurt_blockstop_countdown"]
    obj_char["last_hitstop_frame"] = 0
    -- hit_counter_ver_function
    if obj_char["hurt_state"] == "counter" then 
        hit_side_obj_char["hit_counter_ver_function"](hit_side_obj_char,obj_char)
    else
    -- set_nil_camera_enclose
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
    end
    -- insert_camera_shake_enclose
    if not hit_side_obj_char["camera_enclosing_anim"]["nil_mark"] then
        table.insert(obj_stage_main["camera_active_application_table"],
            function()
                anim_stage_point_linear_game_scene_camera_enclosing = hit_side_obj_char["camera_enclosing_anim"]
                anim_stage_point_linear_game_scene_camera_shake_x = hit_side_obj_char["camera_x_shake_anim"]
                anim_stage_point_linear_game_scene_camera_shake_y = hit_side_obj_char["camera_y_shake_anim"]
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_enclosing)
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y)
                obj_camera["enclose_position_offset"] = hit_side_obj_char["enclose_position_offset"]
                obj_camera["state"] = "active"
            end
        )
    else
        table.insert(obj_stage_main["camera_active_application_table"],
            function()
                anim_stage_point_linear_game_scene_camera_shake_x = hit_side_obj_char["camera_x_shake_anim"]
                anim_stage_point_linear_game_scene_camera_shake_y = hit_side_obj_char["camera_y_shake_anim"]
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y)
                obj_camera["state"] = "active"
            end
        )
    end
    -- character_shake
    obj_char["hurtstop_wiggle_x_animation"] = 
    common_game_scene_create_wiggle_animation(
        obj_char["hit_hurt_blockstop_countdown"] - 1,
        "hurtstop_wiggle_x",
        15
    )
    obj_char["hurtstop_wiggle_y_animation"] = 
    common_game_scene_create_wiggle_animation(
        obj_char["hit_hurt_blockstop_countdown"] - 1,
        "hurtstop_wiggle_y",
        7
    )
    init_point_linear_anim_with(obj_char,obj_char["hurtstop_wiggle_x_animation"])
    init_point_linear_anim_with(obj_char,obj_char["hurtstop_wiggle_y_animation"])
    obj_char["hurtstop_wiggle_current_x"] = (obj_char["hurtstop_wiggle_x"]*(math.random()-0.5)*2)
    obj_char["hurtstop_wiggle_current_y"] = (obj_char["hurtstop_wiggle_y"]*(math.random()-0.5)*2)
    -- hurt_animation
    if obj_char["height_state"] == "stand" then
        obj_char["character_animation"] = hit_side_obj_char["stand_hurt_animation"]
    elseif obj_char["height_state"] == "crouch" then
        obj_char["character_animation"] = hit_side_obj_char["crouch_hurt_animation"]
    elseif obj_char["height_state"] == "air" then
        obj_char["character_animation"] = hit_side_obj_char["air_hurt_animation"]
    elseif obj_char["height_state"] == "OTG" then
        obj_char["character_animation"] = hit_side_obj_char["OTG_hurt_animation"]
    elseif obj_char["height_state"] == "wallstick" then
        obj_char["character_animation"] = hit_side_obj_char["wallstick_hurt_animation"]
    end
    init_character_anim_with(obj_char,obj_char["character_animation"])

    -- hit_side_game_speed
    common_game_scene_game_speed_load_application(hit_side_obj_char,{1,1,1,0,0,0})
end
function common_game_scene_throw_hit_function(obj_char)
    local side = obj_char["player_side"]
    local hit_side_obj_char = common_game_scene_change_character(obj_char["player_side"])
    -- physics_lock
    hit_side_obj_char["physics_lock"] = true
    -- change_draw_front
    CHARACTER_VISUAL_FRONT = side
    -- change_character_face
    if not common_game_scene_get_character_facing_currect(hit_side_obj_char) then
        hit_side_obj_char[5] = -hit_side_obj_char[5]
    end
    -- set min hight of air throw
    if obj_char["height_state"] == "air" then
        hit_side_obj_char["y"] = math.min(hit_side_obj_char["y"],125)
    end
    obj_char["y"] = hit_side_obj_char["y"]
    -- hit_side_state
    hit_side_obj_char["f"] = 0
    hit_side_obj_char["state"] = "throw_testing"
    hit_side_obj_char["throw_active"] = false

    hit_side_obj_char["strike_inv"] = true
    hit_side_obj_char["strike_inv_countdown"] = 10
    hit_side_obj_char["throw_inv"] = true
    hit_side_obj_char["throw_inv_countdown"] = 10
    hit_side_obj_char["projectile_inv"] = true
    hit_side_obj_char["projectile_inv_countdown"] = 10

    hit_side_obj_char["velocity"] = {0,0}
    -- game_speed
    common_game_scene_game_speed_load_application(hit_side_obj_char,{1,1,1,0,0,0})
end
function common_game_scene_throw_hurt_function(obj_char)
    local side = obj_char["player_side"]
    local hit_side_obj_char = common_game_scene_change_character(side)
    local obj_camera = obj_stage_game_scene_camera
    local pushbox_data = common_game_scene_get_pushbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local sprite_sheet_state = nil
    local collision_ground_height_offset = nil
    -- physics_lock
    obj_char["physics_lock"] = true
    -- change_character_face
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
    end
    -- state
    obj_char[8] = 4
    if obj_char["height_state"] == "air" then
        obj_char["sprite_sheet_state"] = "1_4_7_air_block"
        obj_char["anchor_pos"] = anchor_data["air_thrown_tested"]
        collision_ground_height_offset = 130
    else
        obj_char["height_state"] = "stand"
        obj_char["sprite_sheet_state"] = "4_stand_block_high"
        obj_char["anchor_pos"] = anchor_data["ground_thrown_tested"]
        collision_ground_height_offset = 0
    end
    sprite_sheet_state = obj_char["sprite_sheet_state"]

    obj_char["pushbox"] = pushbox_data[sprite_sheet_state][0]
    obj_char["pushbox_other_side_char_active"] = false
    obj_char["hitbox_table"] = {}
    obj_char["hurtbox_table"] = {}
    obj_char["collision_ground_height_offset"] = collision_ground_height_offset    

    hit_side_obj_char["x"] = obj_char["x"] + obj_char[5]*160
    collision_pushbox_stage_relocate_x(hit_side_obj_char)
    obj_char["x"] = hit_side_obj_char["x"] + hit_side_obj_char[5]*160

    obj_char["f"] = 0
    obj_char["state"] = "throw_tested"

    obj_char["startup_frame"] = 0
    obj_char["active_frame"] = 0
    obj_char["recovery_frame"] = 0

    obj_char["idle_cancel"] = false

    obj_char["strike_inv"] = true
    obj_char["strike_inv_countdown"] = 10
    obj_char["throw_inv"] = true
    obj_char["throw_inv_countdown"] = 10
    obj_char["projectile_inv"] = true
    obj_char["projectile_inv_countdown"] = 10
    -- state_number
    obj_char["velocity"] = {0,0}
    -- game_speed
    common_game_scene_game_speed_load_application(obj_char,{1,1,1,0,0,0})
end

function common_game_scene_hurt_animation_oscillator_obj_8(obj_char,option_0,option_1)
    if obj_char[8] == option_0 then
        obj_char[8] = option_1
    else
        obj_char[8] = option_0
    end
end

function common_game_scene_game_speed_load_application(
    obj_char,application_table
)    
    for i = 1,6 do
        if application_table[i] ~= nil then
            obj_char["game_speed_application"][i] = application_table[i]
        end
    end
end
function common_game_scene_game_speed_apply_application()
    local char_LP = obj_char_game_scene_char_LP
    local char_RP = obj_char_game_scene_char_RP
    if char_LP["game_speed_application"][1] == 1 then
        local apply_table = {
            "0","game_speed","game_speed_subframe","game_speed_abnormal_realtime_countdown","game_speed_force_0_countdown","game_speed_force_1_countdown"
        }
        for i = 2,6 do
            if char_LP["game_speed_application"][i] ~= nil then
                char_LP[apply_table[i]] = char_LP["game_speed_application"][i]
            end
        end
        char_LP["game_speed_application"] = {0,nil,nil,nil,nil,nil}
    end
    if char_RP["game_speed_application"][1] == 1 then
        local apply_table = {
            "0","game_speed","game_speed_subframe","game_speed_abnormal_realtime_countdown","game_speed_force_0_countdown","game_speed_force_1_countdown"
        }
        for i = 2,6 do
            if char_RP["game_speed_application"][i] ~= nil then
                char_RP[apply_table[i]] = char_RP["game_speed_application"][i]
            end
        end
        char_RP["game_speed_application"] = {0,nil,nil,nil,nil,nil}
    end
end

function common_game_scene_create_wiggle_animation(length,prop,wiggle_amount)
    local mid_length = (length-length%4)/4
    local res_anim = {}
    res_anim[0] = {0,mid_length}
    res_anim[mid_length] = {wiggle_amount/4,length}
    res_anim[length] = {0,length}
    res_anim["prop"] = prop
    res_anim["length"] = length
    res_anim["loop"] = false
    res_anim["fix_type"] = true
    return res_anim
end

function common_game_scene_counter_ver0(hit_side_obj_char,hurt_side_obj_char)
    insert_VFX_HUD_game_scene_counter_ver0_2(hit_side_obj_char)
end
function common_game_scene_counter_ver1(hit_side_obj_char,hurt_side_obj_char)
    insert_VFX_HUD_game_scene_counter_ver0_2(hit_side_obj_char)
    hurt_side_obj_char["hit_hurt_block_slowdown_countdown"] = 11
end
function common_game_scene_counter_ver2(hit_side_obj_char,hurt_side_obj_char)
    insert_VFX_HUD_game_scene_counter_ver0_2(hit_side_obj_char)
    hit_side_obj_char["hit_hurt_blockstop_countdown"] = 21
    hit_side_obj_char["hit_hurt_block_slowdown_countdown"] = 0
    hurt_side_obj_char["hit_hurt_blockstop_countdown"] = 21
    hurt_side_obj_char["hit_hurt_block_slowdown_countdown"] = 25
end
function common_game_scene_counter_ver3(hit_side_obj_char,hurt_side_obj_char)
    local obj_camera = obj_stage_game_scene_camera
    insert_VFX_HUD_game_scene_counter_ver3(hit_side_obj_char)
    common_game_scene_counter_ver3_load_camera_enclose_anim(hit_side_obj_char)
    hit_side_obj_char["enclose_position_offset"] = {
        (hit_side_obj_char["x"]+hurt_side_obj_char["x"])/2 - obj_camera["3d_pos_x"],
        (hit_side_obj_char["y"]+hurt_side_obj_char["y"])/8 - obj_camera["3d_pos_y"],
        100
    }
    hit_side_obj_char["hit_hurt_blockstop_countdown"] = 31
    hit_side_obj_char["hit_hurt_block_slowdown_countdown"] = 0
    hurt_side_obj_char["hit_hurt_blockstop_countdown"] = 31
    hurt_side_obj_char["hit_hurt_block_slowdown_countdown"] = 35
end

function common_game_scene_nil_load_camera_enclose_anim(obj_char)
    local obj_camera = obj_stage_game_scene_camera
    local anim = {}
    anim[0] = {obj_camera["enclose_percentage"],5}
    anim[5] = {obj_camera["enclose_percentage"]*0.25,10}
    anim[10] = {obj_camera["enclose_percentage"]*0.125,15}
    anim[15] = {0.00,15}
    anim["prop"] = "enclose_percentage"
    anim["length"] = 15
    anim["loop"] = false
    anim["fix_type"] = true
    anim["nil_mark"] = true

    obj_char["camera_enclosing_anim"] = anim
end
function common_game_scene_counter_ver3_load_camera_enclose_anim(obj_char)
    local anim = {}
    local obj_camera = obj_stage_game_scene_camera
    anim[0] = {obj_camera["enclose_percentage"],5}
    anim[5] = {obj_camera["enclose_percentage"]*0.5+0.5,10}
    anim[10] = {obj_camera["enclose_percentage"]*0.25+0.75,20}
    anim[20] = {obj_camera["enclose_percentage"]*0.0625+0.9375,30}
    anim[30] = {obj_camera["enclose_percentage"]*0.0156+0.9844,40}
    anim[40] = {1.00,45}
    anim[45] = {1.00,50}
    anim[50] = {0.97,60}
    anim[60] = {0.69,70}
    anim[70] = {0.20,80}
    anim[80] = {0.03,90}
    anim[90] = {0.00,90}
    anim["prop"] = "enclose_percentage"
    anim["length"] = 90
    anim["loop"] = false
    anim["fix_type"] = true
    anim["nil_mark"] = false

    obj_char["camera_enclosing_anim"] = anim
end
function common_game_scene_red_rc_hit_load_camera_enclose_anim(obj_char)
    local anim = {}
    local obj_camera = obj_stage_game_scene_camera
    anim[0] = {obj_camera["enclose_percentage"],2}
    anim[2] = {obj_camera["enclose_percentage"]*0.2+0.8,5}
    anim[5] = {obj_camera["enclose_percentage"]*0.05+0.95,10}
    anim[10] = {obj_camera["enclose_percentage"]*0.0125+0.9875,15}
    anim[15] = {1.00,20}
    anim[20] = {0.43,25}
    anim[25] = {0.17,30}
    anim[30] = {0.00,30}
    anim["prop"] = "enclose_percentage"
    anim["length"] = 30
    anim["loop"] = false
    anim["fix_type"] = true
    anim["nil_mark"] = false

    obj_char["camera_enclosing_anim"] = anim
end
function common_game_scene_overdrive_load_camera_shake_anim(obj_char)
    local anim = {}
    anim = {}
    anim[0] = {0.00,28}
    anim[28] = {0.00,29}
    anim[29] = {3.25,30}
    anim[30] = {-10.34,31}
    anim[31] = {-3.93,32}
    anim[32] = {-1.02,33}
    anim[33] = {-12.10,34}
    anim[34] = {-6.69,35}
    anim[35] = {4.72,36}
    anim[36] = {6.47,37}
    anim[37] = {-3.78,38}
    anim[38] = {2.46,39}
    anim[39] = {18.31,40}
    anim[40] = {10.65,41}
    anim[41] = {11.00,42}
    anim[42] = {17.81,43}
    anim[43] = {2.63,44}
    anim[44] = {11.94,45}
    anim[45] = {13.25,46}
    anim[46] = {-2.44,47}
    anim[47] = {-4.13,48}
    anim[48] = {15.69,49}
    anim[49] = {13.50,50}
    anim[50] = {-2.19,51}
    anim[51] = {8.63,52}
    anim[52] = {5.44,53}
    anim[53] = {1.35,54}
    anim[54] = {-2.74,55}
    anim[55] = {2.18,57}
    anim[57] = {0.00,78}
    anim[78] = {0.00,78}
    anim["prop"] = "3d_pos_x"
    anim["length"] = 78
    anim["loop"] = false
    anim["fix_type"] = false
    obj_char["camera_x_shake_anim"] = anim

    anim = {}
    anim[0] = {0.00,28}
    anim[28] = {0.00,29}
    anim[29] = {0.35,30}
    anim[30] = {-0.92,31}
    anim[31] = {2.67,32}
    anim[32] = {-4.00,33}
    anim[33] = {-5.26,34}
    anim[34] = {0.60,35}
    anim[35] = {-2.15,36}
    anim[36] = {0.35,37}
    anim[37] = {0.04,38}
    anim[38] = {1.75,39}
    anim[39] = {1.44,40}
    anim[40] = {-2.69,41}
    anim[41] = {-4.00,42}
    anim[42] = {2.67,43}
    anim[43] = {-3.13,44}
    anim[44] = {4.11,45}
    anim[45] = {4.55,46}
    anim[46] = {-1.82,47}
    anim[47] = {1.75,48}
    anim[48] = {-0.95,49}
    anim[49] = {-2.15,50}
    anim[50] = {-0.08,51}
    anim[51] = {4.11,52}
    anim[52] = {0.79,53}
    anim[53] = {2.67,54}
    anim[54] = {-0.95,55}
    anim[55] = {0.50,57}
    anim[57] = {0.00,78}
    anim[78] = {0.00,78}
    anim["prop"] = "3d_pos_y"
    anim["length"] = 78
    anim["loop"] = false
    anim["fix_type"] = false
    obj_char["camera_y_shake_anim"] = anim
end
function common_game_scene_hit_load_camera_shake_anim(obj_char,multiplyer,animation_length)
    local x = 0
    local function linear_return(i)
        return (animation_length-i)/animation_length
    end
    local function random_function()
        x = (x + 0.61803398875) % 1
        return x
    end
    local anim = {}

    for i = 0,animation_length-1 do
        anim[i] = {(random_function()-0.5)*3*linear_return(i)*13*multiplyer,i+1}
    end
    anim[animation_length] = {0*multiplyer,animation_length}
    anim["prop"] = "3d_pos_x"
    anim["length"] = animation_length
    anim["loop"] = false
    anim["fix_type"] = false
    obj_char["camera_x_shake_anim"] = anim

    anim = {}
    for i = 0,animation_length-1 do
        anim[i] = {(random_function()-0.5)*3*linear_return(i)*3*multiplyer,i+1}
    end
    anim[animation_length] = {0*multiplyer,animation_length}
    anim["prop"] = "3d_pos_y"
    anim["length"] = animation_length
    anim["loop"] = false
    anim["fix_type"] = false
    obj_char["camera_y_shake_anim"] = anim
end
function common_game_scene_wallstick_load_camera_shake_anim(multiplyer)
    local anim_x = {}
    local anim_y = {}

    anim_x[0] = {13.25*multiplyer,1}
    anim_x[1] = {-10.34*multiplyer,2}
    anim_x[2] = {-9.93*multiplyer,3}
    anim_x[3] = {9.02*multiplyer,4}
    anim_x[4] = {-8.10*multiplyer,5}
    anim_x[5] = {8.69*multiplyer,6}
    anim_x[6] = {-6.72*multiplyer,7}
    anim_x[7] = {6.47*multiplyer,8}
    anim_x[8] = {-5.78*multiplyer,9}
    anim_x[9] = {5.46*multiplyer,10}
    anim_x[10] = {4.31*multiplyer,11}
    anim_x[11] = {-4.65*multiplyer,12}
    anim_x[12] = {2.00*multiplyer,13}
    anim_x[13] = {-2.81*multiplyer,14}
    anim_x[14] = {1.63*multiplyer,15}
    anim_x[15] = {0*multiplyer,15}
    anim_x["prop"] = "3d_pos_x"
    anim_x["length"] = 15
    anim_x["loop"] = false
    anim_x["fix_type"] = false

    local multiplyer_fix = multiplyer*0.2
    anim_y = {}
    anim_y[0] = {10.92*multiplyer_fix,1}
    anim_y[1] = {2.67*multiplyer_fix,2}
    anim_y[2] = {-4.00*multiplyer_fix,3}
    anim_y[3] = {-8.26*multiplyer_fix,4}
    anim_y[4] = {3.60*multiplyer_fix,5}
    anim_y[5] = {8.15*multiplyer_fix,6}
    anim_y[6] = {-2.35*multiplyer_fix,7}
    anim_y[7] = {-6.04*multiplyer_fix,8}
    anim_y[8] = {1.75*multiplyer_fix,9}
    anim_y[9] = {5.44*multiplyer_fix,10}
    anim_y[10] = {-1.69*multiplyer_fix,11}
    anim_y[11] = {1.00*multiplyer_fix,12}
    anim_y[12] = {3.67*multiplyer_fix,13}
    anim_y[13] = {-1.13*multiplyer_fix,14}
    anim_y[14] = {2.11*multiplyer_fix,15}
    anim_y[15] = {0*multiplyer_fix,15}
    anim_y["prop"] = "3d_pos_y"
    anim_y["length"] = 15
    anim_y["loop"] = false
    anim_y["fix_type"] = false

    return anim_x,anim_y
end
function common_game_scene_wallbreak_init_all_camera_shake_enclose_anim(multiplyer)
    local obj_camera = obj_stage_game_scene_camera
    local anim_enclose = {}
    local anim_x = {}
    local anim_y = {}

    anim_enclose[0] = {obj_camera["enclose_percentage"],5}
    anim_enclose[5] = {obj_camera["enclose_percentage"]*0.25,10}
    anim_enclose[10] = {obj_camera["enclose_percentage"]*0.125,15}
    anim_enclose[15] = {0.00,15}
    anim_enclose["prop"] = "enclose_percentage"
    anim_enclose["length"] = 15
    anim_enclose["loop"] = false
    anim_enclose["fix_type"] = true
    anim_enclose["nil_mark"] = true

    anim_x[0] = {13.25*multiplyer,1}
    anim_x[1] = {-10.34*multiplyer,2}
    anim_x[2] = {-9.93*multiplyer,3}
    anim_x[3] = {9.02*multiplyer,4}
    anim_x[4] = {-8.10*multiplyer,5}
    anim_x[5] = {8.69*multiplyer,6}
    anim_x[6] = {-6.72*multiplyer,7}
    anim_x[7] = {6.47*multiplyer,8}
    anim_x[8] = {-5.78*multiplyer,9}
    anim_x[9] = {5.46*multiplyer,10}
    anim_x[10] = {4.31*multiplyer,11}
    anim_x[11] = {-4.65*multiplyer,12}
    anim_x[12] = {2.00*multiplyer,13}
    anim_x[13] = {-2.81*multiplyer,14}
    anim_x[14] = {1.63*multiplyer,15}
    anim_x[15] = {0*multiplyer,15}
    anim_x["prop"] = "3d_pos_x"
    anim_x["length"] = 15
    anim_x["loop"] = false
    anim_x["fix_type"] = false

    local multiplyer_fix = multiplyer*0.2
    anim_y = {}
    anim_y[0] = {10.92*multiplyer_fix,1}
    anim_y[1] = {2.67*multiplyer_fix,2}
    anim_y[2] = {-4.00*multiplyer_fix,3}
    anim_y[3] = {-8.26*multiplyer_fix,4}
    anim_y[4] = {3.60*multiplyer_fix,5}
    anim_y[5] = {8.15*multiplyer_fix,6}
    anim_y[6] = {-2.35*multiplyer_fix,7}
    anim_y[7] = {-6.04*multiplyer_fix,8}
    anim_y[8] = {1.75*multiplyer_fix,9}
    anim_y[9] = {5.44*multiplyer_fix,10}
    anim_y[10] = {-1.69*multiplyer_fix,11}
    anim_y[11] = {1.00*multiplyer_fix,12}
    anim_y[12] = {3.67*multiplyer_fix,13}
    anim_y[13] = {-1.13*multiplyer_fix,14}
    anim_y[14] = {2.11*multiplyer_fix,15}
    anim_y[15] = {0*multiplyer_fix,15}
    anim_y["prop"] = "3d_pos_y"
    anim_y["length"] = 15
    anim_y["loop"] = false
    anim_y["fix_type"] = false

    return anim_enclose,anim_x,anim_y
end

function common_update_game_scene_char_hitstop_countdown(obj_char)
    if obj_char["hit_hurt_blockstop_countdown"] > 1 then
        obj_char["hit_hurt_blockstop_countdown"] = obj_char["hit_hurt_blockstop_countdown"] - 1
    else
        obj_char["hit_hurt_blockstop_countdown"] = 0 
        obj_char["hit_hurt_block_slowdown_countdown"] = 0
    end
end
function common_update_game_scene_char_blockstop_hurtstop_countdown(obj_char)
    if obj_char["hit_hurt_blockstop_countdown"] > 1 then
        obj_char["hit_hurt_blockstop_countdown"] = obj_char["hit_hurt_blockstop_countdown"] - 1
        point_linear_animator(obj_char,obj_char["hurtstop_wiggle_x_animation"])
        point_linear_animator(obj_char,obj_char["hurtstop_wiggle_y_animation"])
        obj_char["hurtstop_wiggle_current_x"] = (obj_char["hurtstop_wiggle_x"]*(math.random()-0.5)*2)
        obj_char["hurtstop_wiggle_current_y"] = (obj_char["hurtstop_wiggle_y"]*(math.random()-0.5)*2)
    else
        if obj_char["hit_hurt_block_slowdown_countdown"] > 0 then
            common_game_scene_game_speed_load_application(obj_char,{1,2,1,obj_char["hit_hurt_block_slowdown_countdown"],nil,nil})
        end
    
        obj_char["hit_hurt_blockstop_countdown"] = 0 
        obj_char["hit_hurt_block_slowdown_countdown"] = 0

        obj_char["hurtstop_wiggle_x"] = 0
        obj_char["hurtstop_wiggle_y"] = 0
        obj_char["hurtstop_wiggle_current_x"] = 0
        obj_char["hurtstop_wiggle_current_y"] = 0
    end
end
function common_update_game_scene_char_game_speed_abnormal_realtime_countdown(obj_char)
    if obj_char["game_speed_force_0_countdown"] >= 1 then
        obj_char["game_speed_force_0_countdown"] = obj_char["game_speed_force_0_countdown"] - 1
        return
    end
    if obj_char["game_speed_force_1_countdown"] >= 1 then
        obj_char["game_speed_force_1_countdown"] = obj_char["game_speed_force_1_countdown"] - 1
        return
    end
    if obj_char["game_speed"] ~= 1 then 
        obj_char["game_speed_subframe"] = obj_char["game_speed_subframe"] + 1
        if obj_char["game_speed_abnormal_realtime_countdown"] > 1 then
            obj_char["game_speed_abnormal_realtime_countdown"] = obj_char["game_speed_abnormal_realtime_countdown"] - 1
        else
            obj_char["game_speed"] = 1
            obj_char["game_speed_subframe"] = 1
            obj_char["game_speed_abnormal_realtime_countdown"] = 0
        end
    end
end

function common_game_scene_char_apply_damage_heat(
    hit_side_obj_char,hurt_side_obj_char,block_or_hurt,FD_block
)
    local hurt_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side_obj_char["player_side"]]
    if block_or_hurt == "hurt" then
        -- hit_side
            -- apply heat gain
            hit_side_obj_char["heat_gauge"][1] = math.min(
                hit_side_obj_char["heat_gauge"][1] + hit_side_obj_char["hit_heat_gain"], -- hit_heat_gain
                hit_side_obj_char["heat_gauge"][2]
            )
        -- hurt_side
            -- apply hit damage
            hurt_side_obj_char["health_gauge"][1] = math.max(
                hurt_side_obj_char["health_gauge"][1] - hit_side_obj_char["hit_damage"]*hurt_side_obj_char["damage_correction"], -- hit_damage
                0
            )
            -- apply heat gain
            hurt_side_obj_char["heat_gauge"][1] = math.min(
                hurt_side_obj_char["heat_gauge"][1] + hit_side_obj_char["hurt_heat_gain"], -- hurt_heat_gain
                hurt_side_obj_char["heat_gauge"][2]
            ) 
            -- apply risk gauge and damage_correction
            if hurt_side_obj_char["risk_gauge"][1] < 0 then
                hurt_side_obj_char["damage_correction"] = hurt_side_obj_char["damage_correction"]*hit_side_obj_char["hit_damage_correction_factor"] -- hit_damage_correction_factor
            else
                hurt_side_obj_char["risk_gauge"][1] = math.max(
                    hurt_side_obj_char["risk_gauge"][1]-100,
                    0
                )
            end
            -- apply wallbreak damage
            hurt_side_obj_char["wallstick_gauge"][1] = math.min(
                hurt_side_obj_char["wallstick_gauge"][1] + hit_side_obj_char["hit_wallbreak_damage"], -- hit_wallbreak_damage
                hurt_side_obj_char["wallstick_gauge"][2]
            )
    elseif not FD_block then
        -- hit_side
            -- apply heat gain
            hit_side_obj_char["heat_gauge"][1] = math.min(
                hit_side_obj_char["heat_gauge"][1] + hit_side_obj_char["blocked_heat_gain"], -- blocked_heat_gain
                hit_side_obj_char["heat_gauge"][2]
            )
        -- hurt_side
            -- apply heat gain
            hurt_side_obj_char["heat_gauge"][1] = math.min(
                hurt_side_obj_char["heat_gauge"][1] + hit_side_obj_char["block_heat_gain"], -- block_heat_gain
                hurt_side_obj_char["heat_gauge"][2]
            ) 
            -- apply risk gauge
            hurt_side_obj_char["risk_gauge"][1] = math.min(
                hurt_side_obj_char["risk_gauge"][1] + hit_side_obj_char["block_risk_gauge_gain"], -- block_risk_gauge_gain
                hurt_side_obj_char["risk_gauge"][2]
            )
    else
        -- hit_side
            -- apply heat gain
            hit_side_obj_char["heat_gauge"][1] = math.min(
                hit_side_obj_char["heat_gauge"][1] + hit_side_obj_char["blocked_heat_gain"],
                hit_side_obj_char["heat_gauge"][2]
            )
        -- hurt_side
            -- apply heat drain
            hurt_side_obj_char["heat_gauge"][1] = math.max(
                hurt_side_obj_char["heat_gauge"][1] - hit_side_obj_char["FD_block_heat_drain"], -- FD_block_heat_drain
                0
            )
    end
end
function common_game_scene_char_apply_hurt_velocity(
    obj_char,obj_char_other_side,
    hurt_horizontal_velocity,
    hurt_horizontal_friction,
    hurt_horizontal_velocity_correction,
    hurt_vertical_velocity,
    hurt_vertical_gravity,
    hurt_vertical_gravity_correction,
    fix_direction
)
    local final_hurt_horizontal_velocity = nil
    if fix_direction then
        final_hurt_horizontal_velocity = hurt_horizontal_velocity * obj_char[5]
    else
        final_hurt_horizontal_velocity = common_game_scene_get_character_hurt_direction(obj_char,obj_char_other_side,hurt_horizontal_velocity)
    end
    obj_char_other_side["gravity_correction"] 
    = obj_char_other_side["gravity_correction"]*hurt_vertical_gravity_correction
    obj_char_other_side["gravity"] = hurt_vertical_gravity*obj_char_other_side["gravity_correction"] 
    obj_char_other_side["horizontal_velocity_correction"] 
    = obj_char_other_side["horizontal_velocity_correction"]*hurt_horizontal_velocity_correction
    if obj_char["x"] < obj_char_other_side["x"] then
        if obj_char_other_side["collision_move_available"][2] == 1 or final_hurt_horizontal_velocity <= 0 then
            obj_char_other_side["friction"] = hurt_horizontal_friction
            obj_char_other_side["velocity"] = {
                final_hurt_horizontal_velocity*obj_char_other_side["horizontal_velocity_correction"]+obj_char_other_side["velocity"][1]*0.15,
                hurt_vertical_velocity
            }
        elseif obj_char_other_side["collision_move_available"][2] == 0 then
            obj_char["friction"] = hurt_horizontal_friction
            obj_char["velocity"] = {
                - final_hurt_horizontal_velocity*obj_char_other_side["horizontal_velocity_correction"]+math.max(obj_char["velocity"][1],0)*0.15,
                obj_char["velocity"][2]
            }
            obj_char_other_side["velocity"] = {0,hurt_vertical_velocity}
        end
    elseif obj_char["x"] > obj_char_other_side["x"] then
        if obj_char_other_side["collision_move_available"][1] == 1 or final_hurt_horizontal_velocity >= 0 then
            obj_char_other_side["friction"] = hurt_horizontal_friction
            obj_char_other_side["velocity"] = {
                final_hurt_horizontal_velocity*obj_char_other_side["horizontal_velocity_correction"]+obj_char_other_side["velocity"][1]*0.15,
                hurt_vertical_velocity
            }
        elseif obj_char_other_side["collision_move_available"][1] == 0 then
            obj_char["friction"] = hurt_horizontal_friction
            obj_char["velocity"] = {
                - final_hurt_horizontal_velocity*obj_char_other_side["horizontal_velocity_correction"]+math.max(obj_char["velocity"][1],0)*0.15,
                obj_char["velocity"][2]
            }
            obj_char_other_side["velocity"] = {0,hurt_vertical_velocity}
        end
    else
        obj_char_other_side["friction"] = hurt_horizontal_friction
        obj_char_other_side["velocity"] = {0,hurt_vertical_velocity}
    end
end
function common_game_scene_char_apply_knockdown_velocity(
    obj_char,obj_char_other_side,
    hurt_horizontal_velocity,
    hurt_horizontal_friction,
    hurt_horizontal_velocity_correction,
    hurt_vertical_velocity,
    hurt_vertical_gravity,
    hurt_vertical_gravity_correction
)
    
    local final_hurt_horizontal_velocity = obj_char_other_side[5]*hurt_horizontal_velocity
    obj_char_other_side["gravity_correction"] 
    = obj_char_other_side["gravity_correction"]*hurt_vertical_gravity_correction
    obj_char_other_side["gravity"] = hurt_vertical_gravity*obj_char_other_side["gravity_correction"] 
    obj_char_other_side["horizontal_velocity_correction"] 
    = obj_char_other_side["horizontal_velocity_correction"]*hurt_horizontal_velocity_correction
    if obj_char["x"] ~= obj_char_other_side["x"] then
        obj_char_other_side["friction"] = hurt_horizontal_friction
        obj_char_other_side["velocity"] = {
            final_hurt_horizontal_velocity*obj_char_other_side["horizontal_velocity_correction"],
            hurt_vertical_velocity
        }
    else
        obj_char_other_side["velocity"] ={0,hurt_vertical_velocity}
        -- 根据当前敌我x位置变化
        obj_char_other_side["friction"] = hurt_horizontal_friction
    end
end

function common_game_scene_projectile_apply_damage_heat(
    hit_side_obj_char,hurt_side_obj_char,block_or_hurt,FD_block,projectile
)
    local hurt_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side_obj_char["player_side"]]
    if block_or_hurt == "hurt" then
        -- hit_side
            -- apply heat gain
            hit_side_obj_char["heat_gauge"][1] = math.min(
                hit_side_obj_char["heat_gauge"][1] + projectile["hit_heat_gain"],
                hit_side_obj_char["heat_gauge"][2]
            )
        -- hurt_side
            -- apply hit damage
            hurt_side_obj_char["health_gauge"][1] = math.max(
                hurt_side_obj_char["health_gauge"][1] - projectile["hit_damage"]*hurt_side_obj_char["damage_correction"],
                0
            )
            -- apply heat gain
            hurt_side_obj_char["heat_gauge"][1] = math.min(
                hurt_side_obj_char["heat_gauge"][1] + projectile["hurt_heat_gain"],
                hurt_side_obj_char["heat_gauge"][2]
            ) 
            -- apply risk gauge and damage_correction
            if hurt_side_obj_char["risk_gauge"][1] < 0 then
                hurt_side_obj_char["damage_correction"] = hurt_side_obj_char["damage_correction"]*hit_side_obj_char["hit_damage_correction_factor"]
            else
                hurt_side_obj_char["risk_gauge"][1] = math.max(
                    hurt_side_obj_char["risk_gauge"][1]-100,
                    0
                )
            end
            -- apply wallbreak damage
            hurt_side_obj_char["wallstick_gauge"][1] = math.min(
                hurt_side_obj_char["wallstick_gauge"][1] + projectile["hit_wallbreak_damage"],
                hurt_side_obj_char["wallstick_gauge"][2]
            )
    elseif not FD_block then
        -- hit_side
            -- apply heat gain
            hit_side_obj_char["heat_gauge"][1] = math.min(
                hit_side_obj_char["heat_gauge"][1] + projectile["blocked_heat_gain"],
                hit_side_obj_char["heat_gauge"][2]
            )
        -- hurt_side
            -- apply heat gain
            hurt_side_obj_char["heat_gauge"][1] = math.min(
                hurt_side_obj_char["heat_gauge"][1] + hit_side_obj_char["block_heat_gain"],
                hurt_side_obj_char["heat_gauge"][2]
            ) 
            -- apply risk gauge
            hurt_side_obj_char["risk_gauge"][1] = math.min(
                hurt_side_obj_char["risk_gauge"][1] + hit_side_obj_char["block_risk_gauge_gain"],
                hurt_side_obj_char["risk_gauge"][2]
            )
    else
        -- hit_side
            -- apply heat gain
            hit_side_obj_char["heat_gauge"][1] = math.min(
                hit_side_obj_char["heat_gauge"][1] + projectile["blocked_heat_gain"],
                hit_side_obj_char["heat_gauge"][2]
            )
        -- hurt_side
            -- apply heat drain
            hurt_side_obj_char["heat_gauge"][1] = math.max(
                hurt_side_obj_char["heat_gauge"][1] - projectile["FD_block_heat_drain"],
                0
            )
    end
end
function common_game_scene_projectile_apply_hurt_velocity(
    obj_char,obj_char_other_side,projectile,
    hurt_horizontal_velocity,
    hurt_horizontal_friction,
    hurt_horizontal_velocity_correction,
    hurt_vertical_velocity,
    hurt_vertical_gravity,
    hurt_vertical_gravity_correction,
    fix_direction,
    velocity_center
)
    local final_hurt_horizontal_velocity = nil
    if fix_direction then
        final_hurt_horizontal_velocity = hurt_horizontal_velocity*projectile[5]
    elseif velocity_center == "character" then
        final_hurt_horizontal_velocity = common_game_scene_get_character_hurt_direction(obj_char,obj_char_other_side,hurt_horizontal_velocity)
    elseif velocity_center == "projectile" then
        final_hurt_horizontal_velocity = common_game_scene_get_character_hurt_direction(projectile,obj_char_other_side,hurt_horizontal_velocity)
    end
    obj_char_other_side["gravity_correction"] 
    = obj_char_other_side["gravity_correction"]*hurt_vertical_gravity_correction
    obj_char_other_side["gravity"] = hurt_vertical_gravity*obj_char_other_side["gravity_correction"] 
    obj_char_other_side["horizontal_velocity_correction"] 
    = obj_char_other_side["horizontal_velocity_correction"]*hurt_horizontal_velocity_correction
    obj_char_other_side["friction"] = hurt_horizontal_friction
    obj_char_other_side["velocity"] = {
        final_hurt_horizontal_velocity*obj_char_other_side["horizontal_velocity_correction"]+obj_char_other_side["velocity"][1]*0.15,
        hurt_vertical_velocity
    }
end

function common_game_scene_reset_velocity_by_ground_friction(obj_char)
    if obj_char["friction"] == 1 then
        obj_char["velocity"][1] = 0
    end
end

function common_game_scene_init_chars_trainning()
    load_game_scene_common_obj()
    load_game_scene_common_anim()
    
    local obj_camera = obj_stage_game_scene_camera
    if test_input_sys_press_or_hold(INPUT_SYS_CURRENT_COMMAND_STATE["L"]["up"]) then
        if DEBUG_TRAINNING_SPAWN_SIDE == 0 then
            DEBUG_TRAINNING_SPAWN_SIDE = 1
        else
            DEBUG_TRAINNING_SPAWN_SIDE = 0
        end
    elseif test_input_sys_press_or_hold(INPUT_SYS_CURRENT_COMMAND_STATE["L"]["down"]) then
        DEBUG_TRAINNING_SPAWN_POS = 1
    elseif test_input_sys_press_or_hold(INPUT_SYS_CURRENT_COMMAND_STATE["L"]["left"]) then
        DEBUG_TRAINNING_SPAWN_POS = 0
    elseif test_input_sys_press_or_hold(INPUT_SYS_CURRENT_COMMAND_STATE["L"]["right"]) then
        DEBUG_TRAINNING_SPAWN_POS = 2
    end
    if DEBUG_TRAINNING_SPAWN_POS == 0 then
        obj_camera[1] = -1350
        obj_camera["3d_pos_x"] = -1350
        obj_camera["3d_pos_x_target"] = -1350
    elseif DEBUG_TRAINNING_SPAWN_POS == 1 then
        obj_camera[1] = 0
        obj_camera["3d_pos_x"] = 0
        obj_camera["3d_pos_x_target"] = 0
    elseif DEBUG_TRAINNING_SPAWN_POS == 2 then
        obj_camera[1] = 1350
        obj_camera["3d_pos_x"] = 1350
        obj_camera["3d_pos_x_target"] = 1350
    end
    obj_char_game_scene_char_LP["x"] = DEBUG_TRAINNING_SPAWN_ARRAY[DEBUG_TRAINNING_SPAWN_POS][DEBUG_TRAINNING_SPAWN_SIDE][1]
    obj_char_game_scene_char_RP["x"] = DEBUG_TRAINNING_SPAWN_ARRAY[DEBUG_TRAINNING_SPAWN_POS][DEBUG_TRAINNING_SPAWN_SIDE][2]
    obj_char_game_scene_char_LP[5] = DEBUG_TRAINNING_SPAWN_ARRAY[DEBUG_TRAINNING_SPAWN_POS][DEBUG_TRAINNING_SPAWN_SIDE][3]
    obj_char_game_scene_char_RP[5] = DEBUG_TRAINNING_SPAWN_ARRAY[DEBUG_TRAINNING_SPAWN_POS][DEBUG_TRAINNING_SPAWN_SIDE][4]

    obj_char_game_scene_char_LP["brightness"] = -0.05
    obj_char_game_scene_char_LP["brightness_const"] = -0.05
    obj_char_game_scene_char_LP["brightness_overdrive_const"] = 0.15
    obj_char_game_scene_char_LP["contrast"] = 0.8
    obj_char_game_scene_char_RP["brightness"] = -0.05
    obj_char_game_scene_char_RP["brightness_const"] = -0.05
    obj_char_game_scene_char_RP["contrast"] = 0.8
    obj_char_game_scene_char_RP["brightness_overdrive_const"] = 0.15
    if 	CHAR_SELECT_LR["L"] == 	CHAR_SELECT_LR["R"] then
        obj_char_game_scene_char_RP["brightness"] = -0.5
        obj_char_game_scene_char_RP["brightness_const"] = -0.5
        obj_char_game_scene_char_RP["brightness_overdrive_const"] = -0.3
        obj_char_game_scene_char_RP["contrast"] = 1
    end

    preset_game_scene_training()
end
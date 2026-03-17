function character_function_TRM_j2K_game_scene_strike_hit_function(obj_char)
    -- 只需要设置hitstop
    local hit_side_obj_char = common_game_scene_change_character(obj_char["player_side"])
    hit_side_obj_char["state_cache"] = hit_side_obj_char["state"]
    hit_side_obj_char["state"] = "hitstop"
    hit_side_obj_char["last_hitstop_frame"] = 0
    hit_side_obj_char["strike_active"] = false
    hit_side_obj_char["hit_cancel"] = true
    hit_side_obj_char["game_speed"] = 1
    hit_side_obj_char["game_speed_subframe"] = 1
    hit_side_obj_char["game_speed_abnormal_realtime_countdown"] = 0 -- 只能是game_speed的倍数
    if obj_char["x"] <= -1485 and hit_side_obj_char["x"] < -1430 and hit_side_obj_char[5] == -1 then
        hit_side_obj_char["x"] = -1430
    elseif obj_char["x"] >= 1485 and hit_side_obj_char["x"] > 1430 and hit_side_obj_char[5] == 1 then
        hit_side_obj_char["x"] = 1430
    end
    -- physics_lock
    hit_side_obj_char["physics_lock"] = true
    -- block_test
    local block_bool = false
    local block_direction = obj_char["direction_input"]
    if obj_char["hurt_state"] == "idle" and common_game_scene_check_block_direction(obj_char) then
        if hit_side_obj_char["hit_guard_type_state"] == "all" then
            block_bool = true
        elseif obj_char["height_state"] == "air" and common_game_scene_check_block_direction(obj_char) then
            block_bool = true
        elseif block_direction == 4 and hit_side_obj_char["hit_guard_type_state"] == "high" then
            block_bool = true
        elseif block_direction == 1 and hit_side_obj_char["hit_guard_type_state"] == "low" then
            block_bool = true
        end
    end
    if obj_char["hurt_state"] == "counter" then -- idle unblock punish counter GP parry
        hit_side_obj_char["hit_damage"] = hit_side_obj_char["hit_damage"]*1.1
        local counter_VFX_insert_function_argument = hit_side_obj_char["counter_VFX_insert_function_argument"]
        hit_side_obj_char["counter_VFX_insert_function"](
            counter_VFX_insert_function_argument[1],
            counter_VFX_insert_function_argument[2],
            counter_VFX_insert_function_argument[3],
            counter_VFX_insert_function_argument[4],
            counter_VFX_insert_function_argument[5],
            counter_VFX_insert_function_argument[6],
            counter_VFX_insert_function_argument[7],
            counter_VFX_insert_function_argument[8],
            counter_VFX_insert_function_argument[9]
        )
    elseif obj_char["hurt_state"] ~= "idle" or (not block_bool) then
        local hit_VFX_insert_function_argument = hit_side_obj_char["hit_VFX_insert_function_argument"]
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
    end
    -- velocity
    hit_side_obj_char["velocity"][2] = -5
    if hit_side_obj_char["direction_input"] == 3 then
        hit_side_obj_char["velocity"][1] = 20*hit_side_obj_char[5]
        hit_side_obj_char["velocity"][2] = -10
    elseif hit_side_obj_char["direction_input"] == 1 then
        hit_side_obj_char["velocity"][1] = 5*hit_side_obj_char[5]
    else
        hit_side_obj_char["velocity"][1] = 10*hit_side_obj_char[5]
    end
    -- debug
    hit_side_obj_char["active_frame"] = hit_side_obj_char["active_frame"] + 1
end
function character_function_TRM_j2K_game_scene_strike_hurt_function(obj_char)
    -- idle unblock punish counter GP parry
    -- stand crouch air OTG
    local hit_side_obj_char = common_game_scene_change_character(obj_char["player_side"])
    local obj_camera = obj_stage_game_scene_camera
    local function GP_hurt()
        obj_char["state_cache"] = obj_char["state"]
        obj_char["state"] = "hurtstop"
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        table.insert(obj_camera["active_application_table"],
            function()
                anim_camera_point_linear_game_scene_camera_enclosing = hit_side_obj_char["camera_enclosing_anim"]
                anim_camera_point_linear_game_scene_camera_shake_x = hit_side_obj_char["camera_x_shake_anim"]
                anim_camera_point_linear_game_scene_camera_shake_y = hit_side_obj_char["camera_y_shake_anim"]
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_enclosing)
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_shake_x)
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_shake_y)
                obj_camera["enclose_position_offset"] = hit_side_obj_char["enclose_position_offset"]
                obj_camera["state"] = "active"
            end
        )

        obj_char["hit_hurt_blockstop_countdown"] = hit_side_obj_char["hit_hurt_blockstop_countdown"]
        obj_char["last_hitstop_frame"] = 0

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
        insert_VFX_game_scene_char_GP(obj_char)
    end
    local function common_hurt()
        obj_char["state_cache"] = "hurt"
        obj_char["state"] = "hurtstop"
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        if obj_char["hurt_state"] == "counter" then 
            hit_side_obj_char["hit_counter_ver_function"](hit_side_obj_char,obj_char)
        end
        table.insert(obj_camera["active_application_table"],
            function()
                anim_camera_point_linear_game_scene_camera_enclosing = hit_side_obj_char["camera_enclosing_anim"]
                anim_camera_point_linear_game_scene_camera_shake_x = hit_side_obj_char["camera_x_shake_anim"]
                anim_camera_point_linear_game_scene_camera_shake_y = hit_side_obj_char["camera_y_shake_anim"]
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_enclosing)
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_shake_x)
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_shake_y)
                obj_camera["enclose_position_offset"] = hit_side_obj_char["enclose_position_offset"]
                obj_camera["state"] = "active"
            end
        )
        obj_char["game_speed"] = 1
        obj_char["game_speed_subframe"] = 1
        obj_char["game_speed_abnormal_realtime_countdown"] = 0 -- 只能是game_speed的倍数

        if obj_char["height_state"] == "stand" then
            obj_char["current_animation"] = hit_side_obj_char["stand_hurt_animation"]
        elseif obj_char["height_state"] == "crouch" then
            obj_char["current_animation"] = hit_side_obj_char["crouch_hurt_animation"]
        elseif obj_char["height_state"] == "air" then
            obj_char["current_animation"] = hit_side_obj_char["air_hurt_animation"]
        elseif obj_char["height_state"] == "OTG" then
            obj_char["current_animation"] = hit_side_obj_char["OTG_hurt_animation"]
        end

        obj_char["hit_hurt_blockstop_countdown"] = hit_side_obj_char["hit_hurt_blockstop_countdown"]
        obj_char["last_hitstop_frame"] = 0
        init_character_anim_with(obj_char,obj_char["current_animation"])

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
    end
    local function common_block()
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char["player_side"]]
        obj_char["state_cache"] = "block"
        obj_char["state"] = "blockstop"

        if common_game_scene_check_crouch_direction(obj_char) and obj_char["height_state"] == "stand" then
            obj_char["height_state"] = "crouch"
        elseif common_game_scene_check_stand_direction(obj_char) and obj_char["height_state"] == "crouch" then
            obj_char["height_state"] = "stand"
        end
        
        if obj_char["height_state"] == "stand" then
            obj_char["current_animation"] = hit_side_obj_char["stand_block_animation"]
        elseif obj_char["height_state"] == "crouch" then
            obj_char["current_animation"] = hit_side_obj_char["crouch_block_animation"]
        elseif obj_char["height_state"] == "air" then
            obj_char["current_animation"] = hit_side_obj_char["air_block_animation"]
        end
        obj_char["hit_hurt_blockstop_countdown"] = hit_side_obj_char["hit_hurt_blockstop_countdown"]
        obj_char["last_hitstop_frame"] = 0
        init_character_anim_with(obj_char,obj_char["current_animation"])
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.5)
        table.insert(obj_camera["active_application_table"],
            function()
                anim_camera_point_linear_game_scene_camera_enclosing = hit_side_obj_char["camera_enclosing_anim"]
                anim_camera_point_linear_game_scene_camera_shake_x = hit_side_obj_char["camera_x_shake_anim"]
                anim_camera_point_linear_game_scene_camera_shake_y = hit_side_obj_char["camera_y_shake_anim"]
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_enclosing)
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_shake_x)
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_shake_y)
                obj_camera["enclose_position_offset"] = hit_side_obj_char["enclose_position_offset"]
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
        hit_side_obj_char["block_VFX_insert_function"](obj_char)
        if test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"]) then
            insert_VFX_game_scene_char_FD_block(obj_char)
        end
    end
    -- physics_lock
    obj_char["physics_lock"] = true
    -- change draw front
    CHARACTER_VISUAL_FRONT = hit_side_obj_char["player_side"]
    -- change character face
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
    end
    -- block_test
    local block_bool = false
    local block_direction = obj_char["direction_input"]
    if obj_char["hurt_state"] == "idle" and common_game_scene_check_block_direction(obj_char) then
        if obj_char["height_state"] == "air" then
            block_bool = true
        elseif block_direction == 1 and hit_side_obj_char["hit_guard_type_state"] == "low" then
            block_bool = true
        elseif ( block_direction == 4 or block_direction == 7 ) and hit_side_obj_char["hit_guard_type_state"] == "high" then
            block_bool = true
        elseif hit_side_obj_char["hit_guard_type_state"] == "all" then
            block_bool = true
        end
    end
    -- idle block
    if block_bool then
        common_block()
    -- GP
    elseif obj_char["hurt_state"] == "GP" then -- idle unblock punish counter GP parry
        -- insert GP
        GP_hurt()
    -- parry
    elseif obj_char["hurt_state"] == "parry" then -- idle unblock punish counter GP parry
        -- parry function
        obj_char["parry_function"](hit_side_obj_char,obj_char)

    -- idle and unblock
    else
        if obj_char["hurt_state"] == "punish" then
            insert_VFX_HUD_game_scene_punish(hit_side_obj_char)
        end
        common_hurt()
    end
end
function character_game_scene_char_TRM_j2K_apply_hurt_velocity(
    obj_char,obj_char_other_side,
    hurt_horizontal_velocity,
    hurt_horizontal_friction,
    hurt_horizontal_velocity_correction,
    hurt_vertical_velocity,
    hurt_vertical_gravity,
    hurt_vertical_gravity_correction
)
    local final_hurt_horizontal_velocity = common_game_scene_get_character_hurt_direction(obj_char,obj_char_other_side,hurt_horizontal_velocity)
    obj_char_other_side["gravity"] = hurt_vertical_gravity

    obj_char_other_side["gravity_correction"] 
    = obj_char_other_side["gravity_correction"]*hurt_vertical_gravity_correction
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
                - final_hurt_horizontal_velocity*obj_char_other_side["horizontal_velocity_correction"]*0.1+obj_char["velocity"][1]*0.05,
                obj_char["velocity"][2]
            }
            obj_char_other_side["velocity"] = {obj_char_other_side["velocity"][1],hurt_vertical_velocity}
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
                - final_hurt_horizontal_velocity*obj_char_other_side["horizontal_velocity_correction"]*0.1+obj_char["velocity"][1]*0.05,
                obj_char["velocity"][2]
            }
            obj_char_other_side["velocity"] = {obj_char_other_side["velocity"][1],hurt_vertical_velocity}
        end
    else
        obj_char_other_side["friction"] = hurt_horizontal_friction
        obj_char_other_side["velocity"] = {0,hurt_vertical_velocity}
    end
end
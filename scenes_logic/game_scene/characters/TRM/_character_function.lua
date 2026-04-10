-- hit_function
function character_function_game_scene_TRM_j2K_strike_hit_function(obj_char)
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
function character_function_game_scene_TRM_j2K_strike_hurt_function(obj_char)
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
            obj_char["character_animation"] = hit_side_obj_char["stand_hurt_animation"]
        elseif obj_char["height_state"] == "crouch" then
            obj_char["character_animation"] = hit_side_obj_char["crouch_hurt_animation"]
        elseif obj_char["height_state"] == "air" then
            obj_char["character_animation"] = hit_side_obj_char["air_hurt_animation"]
        elseif obj_char["height_state"] == "OTG" then
            obj_char["character_animation"] = hit_side_obj_char["OTG_hurt_animation"]
        end

        obj_char["hit_hurt_blockstop_countdown"] = hit_side_obj_char["hit_hurt_blockstop_countdown"]
        obj_char["last_hitstop_frame"] = 0
        init_character_anim_with(obj_char,obj_char["character_animation"])

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
            obj_char["character_animation"] = hit_side_obj_char["stand_block_animation"]
        elseif obj_char["height_state"] == "crouch" then
            obj_char["character_animation"] = hit_side_obj_char["crouch_block_animation"]
        elseif obj_char["height_state"] == "air" then
            obj_char["character_animation"] = hit_side_obj_char["air_block_animation"]
        end
        obj_char["hit_hurt_blockstop_countdown"] = hit_side_obj_char["hit_hurt_blockstop_countdown"]
        obj_char["last_hitstop_frame"] = 0
        init_character_anim_with(obj_char,obj_char["character_animation"])
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
function character_function_game_scene_TRM_j2K_apply_hurt_velocity(
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

-- cancel_function
function character_function_game_scene_TRM_hitstop_jump_cancel(
    input,obj_char,
    v1,v2,v3,v4,v5,v6,v7,v8,v9
)
    local down_cache = input["down"]
    input["down"] = false
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
    end
    common_update_game_scene_input_direction(obj_char)
    input["down"] = down_cache
    -- air_move
    obj_char["air_move"]["jump"][1] = math.max(math.min(obj_char["air_move"]["jump"][1]-1,obj_char["air_move"]["jump"][2]),0)
    obj_char["air_move"]["air_dash"][1] = 0
    -- velocity_cache
    if obj_char["direction_input"] == 7 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"7_jump",{200,470},obj_char["velocity"][1]*v1 + obj_char[5]*v2,v3)
    elseif obj_char["direction_input"] == 8 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"8_jump",{350,430},obj_char["velocity"][1]*v4 + obj_char[5]*v5,v6)
    elseif obj_char["direction_input"] == 9 then
        obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,"9_jump",{320,430},obj_char["velocity"][1]*v7 + obj_char[5]*v8,v9)
    end
    init_character_anim_with(obj_char,obj_char["character_animation"])
    obj_char["state"] = "7_8_9_jump_air"
    -- save_input_sys_cache_from_jS_and_7_8_9_jump_air
    load_input_sys_cache_manual_release(input,obj_char,"up")
    load_input_sys_cache_recache(input,obj_char)
    obj_char["input_sys_state"] = "save" -- none save load
end
function character_function_game_scene_TRM_hitstop_dash_cancel(
    input,obj_char,
    v1,v2,v3,v4,v5,v6,v7,v8,v9
)
end
function character_function_game_scene_TRM_hitstop_air_dash_cancel(
    input,obj_char,
    v1,v2,v3,v4,v5,v6,v7,v8,v9
)
end
function character_function_game_scene_TRM_hitstop_force_delay_gatling_cancel_input_sys_cache_process(input,obj_char)
    if obj_char["state"] == "j2K" then
        load_input_sys_cache_recache(input,obj_char)
        obj_char["input_sys_state"] = "save" -- none save load
    end
end

-- shot_sys_function
-- aim_process_update
function character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(obj_char)
    -- 0.敌我之间距离
    -- 1.敌方绝对速度
    -- 2.水平相对速度
    -- 3.命中对方
    -- 4.空拳脚 开枪
    -- 5.诅咒
    -- 6.特定的己方模组（哈皮的翻滚）
    local obj_char_shot_sys_aim_process = obj_char["shot_sys_aim_process"]
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local obj_char_other_side_abs_velocity = math.sqrt(obj_char_other_side["velocity"][1]^2+obj_char_other_side["velocity"][2]^2)
    local obj_char_relative_velocity_x = math.abs(obj_char["velocity"][1] - obj_char_other_side["velocity"][1])
    local dot = (obj_char["velocity"][1]-obj_char_other_side["velocity"][1])*(obj_char["x"]-obj_char_other_side["x"] )
    local instant_aim_state = {
        ["block"] = true,
        ["hurt"] = true,
        ["hurtstop"] = true,
        ["blockstop"] = true,
        ["knockdown"] = true,
        ["knockdown_recovery"] = true,
        ["knockout"] = true
    }
    function debuff(obj_char, obj_char_other_side)
        local dx = obj_char_other_side["x"] - obj_char["x"]
        local vx = obj_char_other_side["velocity"][1]
        local v = math.sqrt(obj_char_other_side["velocity"][1]^2 + obj_char_other_side["velocity"][2]^2)
        local dist = math.max(math.abs(dx)-1000, 0)
        local speed = math.min(math.abs(v), 40)
        local approaching = (dx * vx < 0) and 1.075 or 0
        local k_speed = 1.625
        local k_approach = 1.5
        local result = (dist/600*0.05+1)*speed*k_speed - approaching*speed*k_approach
        return result
    end
    -- set_focus_speed
    obj_char_shot_sys_aim_process[2] = 10
    if obj_char["shot_sys_curse"] then
        obj_char_shot_sys_aim_process[2] = 17.5
    end
    -- set_buff_base_on_abs_and_relative_velocity
    obj_char_shot_sys_aim_process[1] = obj_char_shot_sys_aim_process[1] - 
        debuff(obj_char, obj_char_other_side)
    -- add_focus_speed
    obj_char_shot_sys_aim_process[1] = 
        math.min(
            obj_char_shot_sys_aim_process[1]+obj_char_shot_sys_aim_process[2],
            obj_char_shot_sys_aim_process[4]
        )
    obj_char_shot_sys_aim_process[1] = math.max(obj_char_shot_sys_aim_process[1],0)
    -- set_instandt_aim
    if instant_aim_state[obj_char_other_side["state"]] then
        obj_char_shot_sys_aim_process[1] = math.max(obj_char_shot_sys_aim_process[1], obj_char_shot_sys_aim_process[3])
    end
end
-- oroboros_pos_update
function character_function_game_scene_TRM_shot_sys_oroboros_pos_init(obj_char)
    obj_char["shot_sys_oroboros_ease_current"] = {
        obj_char["x"] + obj_char[5]*obj_char["shot_sys_oroboros_anchor_pos"][1],
        obj_char["y"] + obj_char[6]*obj_char["shot_sys_oroboros_anchor_pos"][2],
        obj_char[5],
        obj_char[6]
    }
end
function character_function_game_scene_TRM_shot_sys_oroboros_pos_update(obj_char)
    obj_char["shot_sys_oroboros_ease_target"] = {
        obj_char["x"] + obj_char[5]*obj_char["shot_sys_oroboros_anchor_pos"][1],
        obj_char["y"] + obj_char[6]*obj_char["shot_sys_oroboros_anchor_pos"][2],
        obj_char[5],
        obj_char[6]
    }
    obj_char["shot_sys_oroboros_ease_current"] = {
        (obj_char["shot_sys_oroboros_ease_target"][1]*2 + obj_char["shot_sys_oroboros_ease_current"][1])/3,
        (obj_char["shot_sys_oroboros_ease_target"][2]*2 + obj_char["shot_sys_oroboros_ease_current"][2])/3,
        (obj_char["shot_sys_oroboros_ease_target"][3]*2 + obj_char["shot_sys_oroboros_ease_current"][3])/3,
        (obj_char["shot_sys_oroboros_ease_target"][4]*2 + obj_char["shot_sys_oroboros_ease_current"][4])/3
    }
end
-- reticle_basic_prop_update
function character_function_game_scene_TRM_shot_sys_reticle_pos_update_at_the_ready(obj_char)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local obj_char_shot_sys_aim_process = obj_char["shot_sys_aim_process"]
    local div_value = 30-math.min(obj_char_shot_sys_aim_process[1],obj_char_shot_sys_aim_process[3])/15

    local height_offset = {
        [370] = 365,
        [285] = 200,
        [200] = 100,
        [130] = 100
    }
    -- update_shot_sys_reticle_visual_offset
    obj_char["shot_sys_reticle_stage_pos_target"] = {
        obj_char_other_side["x"]-160,
        obj_char_other_side["y"]-height_offset[obj_char_other_side["pushbox"][4]]-160
    }
    obj_char["shot_sys_reticle_stage_pos_current"] = {
        (obj_char["shot_sys_reticle_stage_pos_current"][1]*(div_value-1)+obj_char["shot_sys_reticle_stage_pos_target"][1])/div_value,
        (obj_char["shot_sys_reticle_stage_pos_current"][2]*(div_value-1)+obj_char["shot_sys_reticle_stage_pos_target"][2])/div_value
    }
    obj_char["shot_sys_reticle"][1] = obj_char["shot_sys_reticle_stage_pos_current"][1]
    obj_char["shot_sys_reticle"][2] = obj_char["shot_sys_reticle_stage_pos_current"][2]
    return
end
function character_function_game_scene_TRM_shot_sys_reticle_pos_update_ease_in(obj_char)
    if obj_char["shot_sys_aim_process"][1] < obj_char["shot_sys_aim_process"][3] then
        return
    end
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local obj_char_shot_sys_aim_process = obj_char["shot_sys_aim_process"]
    local div_value = 30-math.min(obj_char_shot_sys_aim_process[1],obj_char_shot_sys_aim_process[3])/15

    local height_offset = {
        [370] = 365,
        [285] = 200,
        [200] = 100,
        [130] = 100
    }
    -- update_shot_sys_reticle_visual_offset
    obj_char["shot_sys_reticle_stage_pos_target"] = {
        obj_char_other_side["x"]-160,
        obj_char_other_side["y"]-height_offset[obj_char_other_side["pushbox"][4]]-160
    }
    obj_char["shot_sys_reticle_stage_pos_current"] = {
        (obj_char["shot_sys_reticle_stage_pos_current"][1]*(div_value-1)+obj_char["shot_sys_reticle_stage_pos_target"][1])/div_value,
        (obj_char["shot_sys_reticle_stage_pos_current"][2]*(div_value-1)+obj_char["shot_sys_reticle_stage_pos_target"][2])/div_value
    }
    obj_char["shot_sys_reticle"][1] = obj_char["shot_sys_reticle_stage_pos_current"][1]
    obj_char["shot_sys_reticle"][2] = obj_char["shot_sys_reticle_stage_pos_current"][2]
    return
end
function character_function_game_scene_TRM_shot_sys_init_new_reticle_pos(obj_char)
    local random_offset = (math.random(2) == 1) and 1 or 0
    local random_index = math.random(1, 2)
    local offset_multiplier = 200
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local height_offset = {
        [370] = 365,
        [285] = 200,
        [200] = 100,
        [130] = 100
    }

    if random_index == 1 then
        obj_char["shot_sys_reticle_stage_pos_current"][1] = obj_char_other_side["x"]-160
            +(math.random() * 2 - 1)*offset_multiplier
        obj_char["shot_sys_reticle_stage_pos_current"][2] = obj_char_other_side["y"]
            -height_offset[obj_char_other_side["pushbox"][4]]-160
            +((math.random(2) == 1) and 1 or -1)*offset_multiplier
    else
        obj_char["shot_sys_reticle_stage_pos_current"][1] = obj_char_other_side["x"]-160
            +((math.random(2) == 1) and 1 or -1)*offset_multiplier
        obj_char["shot_sys_reticle_stage_pos_current"][2] = obj_char_other_side["y"]
            -height_offset[obj_char_other_side["pushbox"][4]]-160
            +(math.random() * 2 - 1)*offset_multiplier
    end
    obj_char["shot_sys_reticle"][1] = obj_char["shot_sys_reticle_stage_pos_current"][1]
    obj_char["shot_sys_reticle"][2] = obj_char["shot_sys_reticle_stage_pos_current"][2]
end
-- emplayment_function
function character_function_game_scene_TRM_shot_sys_off_init(obj_char)
    -- hurt_state
    obj_char["hurt_state"] = obj_char["hurt_state_target"]
    -- shot_sys
    obj_char["shot_sys_fire_cancel"] = false
    obj_char["shot_sys_idle_cancel"] = false
    return
end
function character_function_game_scene_TRM_shot_sys_off_update(obj_char)
    -- hurt_state
    obj_char["hurt_state"] = obj_char["hurt_state_target"]
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_ease_in_init(obj_char)
    -- hurt_state
    obj_char["hurt_state"] = "unblock"
    -- shot_sys
    obj_char["shot_sys_animation"] = load_game_scene_anim_char_TRM_5H_shot_sys_at_the_ready_ease_in(obj_char)
    init_character_anim_with(obj_char,obj_char["shot_sys_animation"])
    obj_char["shot_sys_aim_process"] = {0,0,420,450,false}
    character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(obj_char)
    -- oroboros
    obj_char["shot_sys_oroboros_aim_r"] = 0.42
    obj_char["shot_sys_oroboros_animation_table"][1] = load_game_scene_anim_char_TRM_5H_oroboros_chain_ease_in(obj_char["shot_sys_oroboros_front"])
    obj_char["shot_sys_oroboros_animation_table"][2] = load_game_scene_anim_char_TRM_5H_oroboros_chain_loop(obj_char["shot_sys_oroboros_front"],"5H_oroboros_loop_front")
    obj_char["shot_sys_oroboros_animation_table"][3] = load_game_scene_anim_char_TRM_5H_oroboros_mid_ease(obj_char["shot_sys_oroboros_mid"],"5H_oroboros_ease_in_mid")
    obj_char["shot_sys_oroboros_animation_table"][4] = load_game_scene_anim_char_TRM_5H_oroboros_chain_ease_in(obj_char["shot_sys_oroboros_back"])
    obj_char["shot_sys_oroboros_animation_table"][5] = load_game_scene_anim_char_TRM_5H_oroboros_chain_loop(obj_char["shot_sys_oroboros_back"],"5H_oroboros_loop_back")
    init_character_anim_without(obj_char["shot_sys_oroboros_front"],obj_char["shot_sys_oroboros_animation_table"][1])
    init_character_anim_without(obj_char["shot_sys_oroboros_front"],obj_char["shot_sys_oroboros_animation_table"][2])
    init_character_anim_without(obj_char["shot_sys_oroboros_mid"],obj_char["shot_sys_oroboros_animation_table"][3])
    init_character_anim_without(obj_char["shot_sys_oroboros_back"],obj_char["shot_sys_oroboros_animation_table"][4])
    init_character_anim_without(obj_char["shot_sys_oroboros_back"],obj_char["shot_sys_oroboros_animation_table"][5])
    character_function_game_scene_TRM_shot_sys_oroboros_pos_init(obj_char)
    obj_char["shot_sys_oroboros_state"] = "ease_in"
    -- reticle
    obj_char["shot_sys_reticle_animation_table"][1] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_ease_in(obj_char)
    init_character_anim_without(obj_char,obj_char["shot_sys_reticle_animation_table"][1])
    character_function_game_scene_TRM_shot_sys_init_new_reticle_pos(obj_char)
    character_function_game_scene_TRM_shot_sys_reticle_pos_update_ease_in(obj_char)
    obj_char["shot_sys_reticle_state"] = "at_the_ready_ease_in"
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_ease_in_update(obj_char)
    -- hurt_state
    obj_char["hurt_state"] = "unblock"
    -- shot_sys
    character_animator(obj_char,obj_char["shot_sys_animation"])
    character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(obj_char)
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_ease_out_init(obj_char)
    -- hurt_state
    obj_char["hurt_state"] = obj_char["hurt_state_target"]
    -- shot_sys
    obj_char["shot_sys_aim_process"][1] = 0
    obj_char["shot_sys_animation"] = load_game_scene_anim_char_TRM_5H_shot_sys_at_the_ready_ease_out(obj_char)
    init_character_anim_with(obj_char,obj_char["shot_sys_animation"])
    -- oroboros
    obj_char["shot_sys_oroboros_aim_r"] = 0.42
    obj_char["shot_sys_oroboros_offset_amount"] = 0
    obj_char["shot_sys_oroboros_animation_table"][1] = load_game_scene_anim_char_TRM_5H_oroboros_chain_ease_out(obj_char["shot_sys_oroboros_front"])
    obj_char["shot_sys_oroboros_animation_table"][3] = load_game_scene_anim_char_TRM_5H_oroboros_mid_ease(obj_char["shot_sys_oroboros_mid"],"5H_oroboros_ease_out_mid")
    obj_char["shot_sys_oroboros_animation_table"][4] = load_game_scene_anim_char_TRM_5H_oroboros_chain_ease_out(obj_char["shot_sys_oroboros_back"])
    init_character_anim_without(obj_char["shot_sys_oroboros_front"],obj_char["shot_sys_oroboros_animation_table"][1])
    init_character_anim_without(obj_char["shot_sys_oroboros_mid"],obj_char["shot_sys_oroboros_animation_table"][3])
    init_character_anim_without(obj_char["shot_sys_oroboros_back"],obj_char["shot_sys_oroboros_animation_table"][4])
    character_function_game_scene_TRM_shot_sys_oroboros_pos_update(obj_char)
    obj_char["shot_sys_oroboros_state"] = "ease_out"
    -- reticle
    obj_char["shot_sys_reticle_animation_table"][2] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_ease_out(obj_char)
    init_character_anim_without(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
    obj_char["shot_sys_reticle_state"] = "at_the_ready_ease_out"
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_ease_out_update(obj_char)
    -- hurt_state
    obj_char["hurt_state"] = obj_char["hurt_state_target"]
    -- shot_sys
    character_animator(obj_char,obj_char["shot_sys_animation"])
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_read_init(obj_char)
    -- hurt_state
    obj_char["hurt_state"] = "unblock"
    -- shot_sys
    -- 已经在ease_in阶段完成了当前帧数的aim_process
    -- reticle
    -- rewrite in case of aim_process change in at_the_ready
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_update(obj_char)
    -- hurt_state
    obj_char["hurt_state"] = "unblock"
    -- shot_sys
    character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(obj_char)
    return
end
function character_function_game_scene_TRM_shot_sys_steady_aim_ease_in_init(obj_char)
end
function character_function_game_scene_TRM_shot_sys_steady_aim_ease_in_update(obj_char)
end
function character_function_game_scene_TRM_shot_sys_steady_aim_ease_out_init(obj_char)
end
function character_function_game_scene_TRM_shot_sys_steady_aim_ease_out_update(obj_char)
end
function character_function_game_scene_TRM_shot_sys_steady_aim_init(obj_char)
end
function character_function_game_scene_TRM_shot_sys_steady_aim_update(obj_char)
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_shot_init(obj_char)
    -- hurt_state
    obj_char["hurt_state"] = "unblock"
    -- shot_sys
    obj_char["shot_sys_animation"] = load_game_scene_anim_char_TRM_5H_shot_sys_at_the_ready_shot(obj_char)
    init_character_anim_with(obj_char,obj_char["shot_sys_animation"])
    -- 已经在ease_in阶段完成了当前帧数的aim_process
    -- oroboros
    obj_char["shot_sys_oroboros_animation_table"][6] = load_game_scene_anim_char_TRM_5H_oroboros_shot(obj_char)
    init_character_anim_without(obj_char,obj_char["shot_sys_oroboros_animation_table"][6])
    character_function_game_scene_TRM_shot_sys_oroboros_pos_update(obj_char)
    obj_char["shot_sys_oroboros_state"] = "shot"
    -- reticle
    obj_char["shot_sys_reticle_animation_table"][2] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_shot(obj_char)
    init_character_anim_with(obj_char,obj_char["shot_sys_reticle_animation_table"][2])
    obj_char["shot_sys_reticle_state"] = "at_the_ready_shot"
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_shot_update(obj_char)
    -- hurt_state
    obj_char["hurt_state"] = "unblock"
    -- shot_sys
    character_animator(obj_char,obj_char["shot_sys_animation"])
    return
end
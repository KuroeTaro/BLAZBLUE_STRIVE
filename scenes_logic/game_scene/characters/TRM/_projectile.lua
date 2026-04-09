function insert_projectile_game_scene_char_TRM_5H_at_the_ready_shot(obj_char)
    local obj = {0,0,0,0,0,0,0,0}
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local obj_char_velocity = {obj_char["velocity"][1],obj_char["velocity"][2]}
    obj["x"] = 0
    obj["y"] = 0
    obj["type"] = "projectile"
    obj["hit_type_state"] = "strike"
    obj["life"] = 42
    obj["animation"] = {}
    obj["sprite_sheet_state"] = nil

    obj["shot_hit_confirm"] = (obj_char["shot_sys_aim_process"][1] >= obj_char["shot_sys_aim_process"][3])

    obj["camera_enclosing_anim"] = nil
    obj["camera_x_shake_anim"] = nil
    obj["camera_y_shake_anim"] = nil
    common_game_scene_nil_load_camera_enclose_anim(obj)
    common_game_scene_hit_load_camera_shake_anim(obj,0.5)

    obj["stand_block_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_block(
        obj_char,obj,true,nil,
        "4_stand_block_high",
        "stand","5_stand_idle",
        8,5,1.05,
        0,2.5,1.05,
        nil,nil,nil,nil,
        function() end
    )
    obj["crouch_block_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_block(
        obj_char,obj,true,nil,
        "1_crouch_block",
        "crouch","1_2_3_crouch",
        8,5,1.05,
        0,2.5,1.05,
        nil,nil,nil,nil,
        function() end
    )
    obj["air_block_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_block(
        obj_char,obj,true,nil,
        "1_4_7_air_block",
        "air","5_stand_idle",
        4,5,1.05,
        -30,2.5,1.05,
        nil,nil,nil,nil,
        function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
    )
    obj["stand_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_hurt(
        obj_char,obj,true,nil,
        "0_stand_hurt_high",
        "stand","5_stand_idle",
        8,5,1.05,
        0,2.5,1.05,
        nil,nil,nil,nil,
        function() end
    )
    obj["crouch_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_hurt(
        obj_char,obj,true,nil,
        "0_crouch_hurt",
        "crouch","1_2_3_crouch",
        8,5,1.05,
        0,2.5,1.05,
        nil,nil,nil,nil,
        function() end
    )
    obj["air_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_and_OTG_hurt(
        obj_char,obj,true,nil,
        "0_general_hurt_launched_high",
        "air","knockdown_recovery",
        1,5,1.05,
        -30,2.5,1.05,
        nil,
        load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
            obj_char,
            "0_general_hurt_soft_recovery_ground",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        ),
        nil,nil,
        function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
    )
    obj["OTG_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_and_OTG_hurt(
        obj_char,obj,true,nil,
        "0_general_hurt_launched_high",
        "air","knockdown_recovery",
        27,5,1.05,
        -5,2.5,1.05,
        nil,
        load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
            obj_char,
            "0_general_hurt_soft_recovery_ground",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        ),
        nil,nil,
        function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
    )
    obj["hit_hurt_blockstop_countdown"] = 10

    obj["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver0
    obj["hit_VFX_insert_function_argument"] = {obj_char,55,-255,0.8,0.75,0.75,0,false,false}
    obj["hit_SFX"] = nil
    obj["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver0
    obj["counter_VFX_insert_function_argument"] = {obj_char,35,-535,1,1.1,1.1,0,false,false}
    obj["counter_SFX"] = nil
    obj["block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
    obj["block_SFX"] = nil

    obj["hit_counter_ver_function"] = common_game_scene_counter_ver0

    obj["update"] = function()
    end
    obj["draw"] = function()
    end
    obj["enemy_interact_function"] = function()
        -- strike_clash
        -- projectile_and_projectile_interaction
        -- interaction_with_enemy
            -- normal_hit
            -- if hit
                -- insert_hit_VFX
                -- set_physics_lock
                -- if block
                    -- set_state_and_state_cache
                    -- set_insert_camera_anim
                    -- set_play_character_shake_animation
                    -- set_play_block_animaiton_by_height_and_input
                    -- set_hit_hurt_blockstop_countdown
                    -- insert_block_VFX
                    -- insert_FD_block_VFX
                    -- return
                -- if GP
                    -- set_state_and_state_cache
                    -- set_insert_camera_anim
                    -- set_play_character_shake_animation
                    -- set_hit_hurt_blockstop_countdown
                    -- insert_VFX_game_scene_char_GP
                    -- return
                -- if parry
                    -- obj_char["parry_function"]
                    -- return
                -- if idle_and_unblock
                    -- set_state_and_state_cache
                    -- set_nil_camera_enclose
                    -- hit_counter_ver_function
                    -- insert_camera_shake_enclose
                    -- set_play_character_shake_animation
                    -- set_play_hurt_animaiton_by_height
                    -- hit_hurt_blockstop_countdown
                    -- return
                -- else
                    -- return
        -- interaction_with_enemy
            -- normal_hit
            -- if hit
        if collision_strike_hurtbox_test(obj,obj_char_other_side) then
                -- insert_hit_VFX
                -- set_physics_lock
        end
                -- insert_hit_VFX
                -- if block
                    -- set_state_and_state_cache
                    -- set_insert_camera_anim
                    -- set_play_character_shake_animation
                    -- set_play_block_animaiton_by_height_and_input
                    -- set_hit_hurt_blockstop_countdown
                    -- insert_block_VFX
                    -- insert_FD_block_VFX
                    -- return
                -- if GP
                    -- set_state_and_state_cache
                    -- set_insert_camera_anim
                    -- set_play_character_shake_animation
                    -- set_hit_hurt_blockstop_countdown
                    -- insert_VFX_game_scene_char_GP
                    -- return
                -- if parry
                    -- obj_char["parry_function"]
                    -- return
                -- if idle_and_unblock
                    -- set_state_and_state_cache
                    -- set_nil_camera_enclose
                    -- hit_counter_ver_function
                    -- insert_camera_shake_enclose
                    -- set_play_character_shake_animation
                    -- set_play_hurt_animaiton_by_height
                    -- hit_hurt_blockstop_countdown
                    -- return
                -- else
                    -- return
    end
    -- obj["friendly_interact_function"] = function()

    -- end
end

function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_main_anim(obj)

end

function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_block(
    obj_char,projectile,fix_direction,velocity_center,
    sprite_sheet_state,
    height_state,
    state_cache,
    hurt_horizontal_velocity,
    hurt_horizontal_friction,
    hurt_horizontal_velocity_correction,
    hurt_vertical_velocity,
    hurt_vertical_gravity,
    hurt_vertical_gravity_correction,
    self_knockdown_animation,
    self_knockdown_recovery_animation,
    self_wallbounce_hurt_animation,
    self_groundbounce_hurt_animation,
    frame_0_special_update_function
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 10

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet_state"] = sprite_sheet_state
        obj_char_other_side["height_state"] = height_state -- stand crouch air OTG
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery
        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0
        obj_char_other_side["frame_adv"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 14
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char_other_side["player_side"]]
        if test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"]) then
            hurt_horizontal_velocity = hurt_horizontal_velocity * 2
        end
        common_game_scene_projectile_apply_hurt_velocity(
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
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 5
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][1],
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(obj_char_other_side["player_side"])(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[4] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(obj_char_other_side["player_side"])(obj_char_other_side)
    end
    res[6] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[8] = function()
        -- draw_correction
        obj_char_other_side[8] = 0
    end
    res[10] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_block(
    obj_char,projectile,fix_direction,velocity_center,
    sprite_sheet_state,
    height_state,
    state_cache,
    hurt_horizontal_velocity,
    hurt_horizontal_friction,
    hurt_horizontal_velocity_correction,
    hurt_vertical_velocity,
    hurt_vertical_gravity,
    hurt_vertical_gravity_correction,
    self_knockdown_animation,
    self_knockdown_recovery_animation,
    self_wallbounce_hurt_animation,
    self_groundbounce_hurt_animation,
    frame_0_special_update_function
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    local function update_before_land()
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 1
        if collision_test_char_on_ground(obj_char_other_side) then
            -- state
            obj_char_other_side["y"] = 365
            obj_char_other_side["f"] = 13
            obj_char_other_side["height_state"]  = "stand"
            obj_char_other_side["throw_inv"] = true
            obj_char_other_side["throw_inv_countdown"] = 23
            obj_char_other_side["gravity"] = 2.5
            obj_char_other_side["friction"] = 7

            -- collide
            obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][6]
            obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][6]
            obj_char_other_side["collision_test_ground_height_offset"] = 0

            -- draw_correction
            obj_char_other_side[8] = 6

            -- VFX
            insert_VFX_game_scene_stage_smoke_land_blow(
                obj_char_other_side,
                VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][1],
                VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][2],
                0.5,1,1,0
            )
        end
    end
    res["prop_f"] = "f"
    res["anim_length"] = 32

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet_state"] = sprite_sheet_state
        obj_char_other_side["height_state"] = height_state -- stand crouch air OTG
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery
        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0
        obj_char_other_side["frame_adv"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 1
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char_other_side["player_side"]]
        if test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"]) then
            hurt_horizontal_velocity = hurt_horizontal_velocity * 2
            hurt_vertical_velocity = hurt_vertical_velocity + math.abs(hurt_vertical_velocity)*0.2
        end
        common_game_scene_projectile_apply_hurt_velocity(
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
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 180
        -- draw_correction
        obj_char_other_side[8] = 5
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(obj_char_other_side["player_side"])(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        if obj_char_other_side["y"] > 125 then obj_char_other_side["y"] = 125 end
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[3] = function()
        -- state
        update_before_land()
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[6] = function()
        -- state
        update_before_land()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[9] = function()
        -- state
        update_before_land()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[12] = function()
        -- state
        obj_char_other_side["f"] = 3
        update_before_land()
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[13] = function()
        -- land animation start
    end
    res[16] = function()
        -- collide
        obj_char_other_side["collision_test_ground_height_offset"] = 0
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][6]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][6]
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[22] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][7]
        -- draw_correction
        obj_char_other_side[8] = 7
    end
    res[26] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(obj_char_other_side["player_side"])(obj_char_other_side)
    end
    res[28] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][8]
        -- draw_correction
        obj_char_other_side[8] = 8
    end
    res[32] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_hurt(
    obj_char,projectile,fix_direction,velocity_center,
    sprite_sheet_state,
    height_state,
    state_cache,
    hurt_horizontal_velocity,
    hurt_horizontal_friction,
    hurt_horizontal_velocity_correction,
    hurt_vertical_velocity,
    hurt_vertical_gravity,
    hurt_vertical_gravity_correction,
    self_knockdown_animation,
    self_knockdown_recovery_animation,
    self_wallbounce_hurt_animation,
    self_groundbounce_hurt_animation,
    frame_0_special_update_function
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 13

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet_state"] = sprite_sheet_state
        obj_char_other_side["height_state"] = height_state -- stand crouch air OTG
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery
        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0
        obj_char_other_side["frame_adv"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 18
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        common_game_scene_projectile_apply_hurt_velocity(
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
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][1],
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(obj_char_other_side["player_side"])(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[2] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[8] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(obj_char_other_side["player_side"])(obj_char_other_side)
    end
    res[9] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[11] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        -- draw_correction
        obj_char_other_side[8] = 0
    end
    res[13] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_and_OTG_hurt(
    obj_char,projectile,fix_direction,velocity_center,
    sprite_sheet_state,
    height_state,
    state_cache,
    hurt_horizontal_velocity,
    hurt_horizontal_friction,
    hurt_horizontal_velocity_correction,
    hurt_vertical_velocity,
    hurt_vertical_gravity,
    hurt_vertical_gravity_correction,
    self_knockdown_animation,
    self_knockdown_recovery_animation,
    self_wallbounce_hurt_animation,
    self_groundbounce_hurt_animation,
    frame_0_special_update_function
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    local function update_throw_inv()
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 1
    end
    res["prop_f"] = "f"
    res["anim_length"] = 34
    for i = 0,33 do
        res[i] = function()
            update_throw_inv()
        end
    end

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet_state"] = sprite_sheet_state
        obj_char_other_side["height_state"] = height_state -- stand crouch air OTG
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery
        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0
        obj_char_other_side["frame_adv"] = 0

        obj_char_other_side["self_wallbounce_hurt_animation"] = self_wallbounce_hurt_animation
        obj_char_other_side["self_groundbounce_hurt_animation"] = self_groundbounce_hurt_animation
        obj_char_other_side["self_knockdown_animation"] = self_knockdown_animation
        obj_char_other_side["self_knockdown_recovery_animation"] = self_knockdown_recovery_animation

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 1
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        common_game_scene_projectile_apply_hurt_velocity(
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
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 180
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- update
        update_throw_inv()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(obj_char_other_side["player_side"])(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[1] = function()
        -- update
        update_throw_inv()
        obj_char_other_side["state_cache"] = state_cache
    end
    res[3] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][1]
        -- draw_correction
        obj_char_other_side[8] = 1
        -- update
        update_throw_inv()
    end
    res[6] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_throw_inv()
    end
    res[9] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][3]
        -- draw_correction
        obj_char_other_side[8] = 3
        -- update
        update_throw_inv()
    end
    res[12] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
        -- update
        update_throw_inv()
    end
    res[15] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][5]
        -- draw_correction
        obj_char_other_side[8] = 5
        -- update
        update_throw_inv()
    end
    res[18] = function()
        -- draw_correction
        obj_char_other_side[8] = 6
        -- update
        update_throw_inv()
    end
    res[21] = function()
        if obj_char_other_side["velocity"][2] <= math.abs(obj_char_other_side["velocity"][1])*2 then
            -- collide
            obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][7]
            -- draw_correction
            obj_char_other_side[8] = 7
        else
            -- state
            obj_char_other_side["f"] = 15
            -- draw_correction
            obj_char_other_side[8] = 5
        end
        -- update
        update_throw_inv()
    end
    res[24] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][8]
        -- draw_correction
        obj_char_other_side[8] = 8
        -- update
        update_throw_inv()
    end
    res[27] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][9]
        -- draw_correction
        obj_char_other_side[8] = 9
        -- update
        update_throw_inv()
    end
    res[30] = function()
        -- draw_correction
        obj_char_other_side[8] = 10
        -- update
        update_throw_inv()
    end
    res[33] = function()
        -- state
        obj_char_other_side["f"] = 27
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][9]
        -- draw_correction
        obj_char_other_side[8] = 9
        -- update
        update_throw_inv()
    end
    res[34] = function()
        -- animation_end
    end
    return res
end

function insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_hit_blast()

end
function insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_counter_hit_blast()

end
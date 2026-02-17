    -- obj_char,
    -- sprite_sheet_state,
    -- height_state,
    -- hurt_horizontal_velocity,
    -- hurt_horizontal_friction,
    -- hurt_horizontal_velocity_correction
    -- hurt_vertical_velocity,
    -- hurt_vertical_gravity,
    -- hurt_vertical_gravity_correction,
    -- self_knockdown_animation

-- 0_general_hurt_falled_knockout
    -- 需要修改的角色属性
        -- 打击方
            -- velocity
        -- 受击方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- startup_frame
            -- active_frame
            -- recovery_frame
            -- frame_adv
            -- current_animation_length
            -- strike_inv
            -- strike_inv_countdown
            -- throw_inv
            -- throw_inv_countdown
            -- projectile_inv
            -- projectile_inv_countdown
            -- burst_inv
            -- burst_inv_countdown
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- damage_correction
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_test_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_general_hurt_falled_knockout(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 94
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = true
        obj_char_other_side["strike_inv_countdown"] = 1000
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 1000
        obj_char_other_side["projectile_inv"] = true
        obj_char_other_side["projectile_inv_countdown"] = 1000
        obj_char_other_side["burst_inv"] = true
        obj_char_other_side["burst_inv_countdown"] = 1000
        -- state_number
        obj_char_other_side["velocity"] = {0,0}
        obj_char_other_side["gravity"] = 2.5
        obj_char_other_side["friction"] = 10
        obj_char_other_side["horizontal_velocity_correction"] = 1
        obj_char_other_side["gravity_correction"] = 1
        obj_char_other_side["damage_correction"] = 1
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
    end
    res[11] = function()
        -- state
        obj_char_other_side["height_state"] = "crouch" -- stand crouch air OTG
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][1]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[20] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[31] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[37] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[44] = function()
        -- VFX
        insert_VFX_game_scene_stage_smoke_land_blow(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][1],
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][2],
            0.5,1,1,0
        )
        -- draw_correction
        obj_char_other_side[8] = 5
    end
    res[49] = function()
        -- state
        obj_char_other_side["velocity"][1] = 6.0*obj_char_other_side[5]
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[78] = function()
        -- draw_correction
        obj_char_other_side[8] = 7
    end
    res[84] = function()
        -- draw_correction
        obj_char_other_side[8] = 8
    end
    res[89] = function()
        -- draw_correction
        obj_char_other_side[8] = 9
    end
    res[93] = function()
        -- state
        obj_char_other_side["height_state"] = "OTG" -- stand crouch air OTG
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][10]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][10]
        -- draw_correction
        obj_char_other_side[8] = 10
    end
    res[94] = function()
        -- animation_end
    end
    return res
end

-- 0_ground_hurt
    -- 需要修改的角色属性
        -- 打击方
            -- velocity
        -- 受击方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- startup_frame
            -- active_frame
            -- recovery_frame
            -- frame_adv
            -- current_animation_length
            -- strike_inv
            -- strike_inv_countdown
            -- throw_inv
            -- throw_inv_countdown
            -- projectile_inv
            -- projectile_inv_countdown
            -- burst_inv
            -- burst_inv_countdown
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_test_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_ground_hurt_lv0(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 13
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
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
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
        init_input_sys_cache(obj_char_other_side)
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
function load_game_scene_anim_char_common_0_ground_hurt_lv1(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 15
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 20
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[2] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][3]
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[9] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[10] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[11] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[13] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        -- draw_correction
        obj_char_other_side[8] = 0
    end
    res[15] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_hurt_lv2(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 17
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 22
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[2] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][4]
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[9] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][3]
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[11] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[12] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[13] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[15] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        -- draw_correction
        obj_char_other_side[8] = 0
    end
    res[17] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_hurt_lv3(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 20
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 25
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[2] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][4]
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[12] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][3]
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[14] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[15] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[16] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[18] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        -- draw_correction
        obj_char_other_side[8] = 0
    end
    res[20] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_hurt_lv4(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 22
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 27
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[2] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][4]
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[12] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][3]
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[16] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[17] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[18] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[20] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        -- draw_correction
        obj_char_other_side[8] = 0
    end
    res[22] = function()
        -- animation end
    end
    return res
end

-- 0_ground_block
    -- 需要修改的角色属性
        -- 打击方
            -- velocity
        -- 受击方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- startup_frame
            -- active_frame
            -- recovery_frame
            -- frame_adv
            -- current_animation_length
            -- strike_inv
            -- strike_inv_countdown
            -- throw_inv
            -- throw_inv_countdown
            -- projectile_inv
            -- projectile_inv_countdown
            -- burst_inv
            -- burst_inv_countdown
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_test_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_ground_block_lv0(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 10
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
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
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
        init_input_sys_cache(obj_char_other_side)
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
function load_game_scene_anim_char_common_0_ground_block_lv1(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 12
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 16
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char_other_side["player_side"]]
        if test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"]) then
            hurt_horizontal_velocity = hurt_horizontal_velocity * 2
        end
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[6] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[9] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[10] = function()
        -- draw_correction
        obj_char_other_side[8] = 0
    end
    res[12] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_block_lv2(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 14
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
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char_other_side["player_side"]]
        if test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"]) then
            hurt_horizontal_velocity = hurt_horizontal_velocity * 2
        end
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[6] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[8] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[9] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[12] = function()
        -- draw_correction
        obj_char_other_side[8] = 0
    end
    res[14] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_block_lv3(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 17
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 21
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char_other_side["player_side"]]
        if test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"]) then
            hurt_horizontal_velocity = hurt_horizontal_velocity * 2
        end
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[6] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[9] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[11] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[12] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[14] = function()
        -- draw_correction
        obj_char_other_side[8] = 0
    end
    res[17] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_block_lv4(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 19
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 23
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char_other_side["player_side"]]
        if test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"]) then
            hurt_horizontal_velocity = hurt_horizontal_velocity * 2
        end
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[6] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[9] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[12] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[13] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[16] = function()
        -- draw_correction
        obj_char_other_side[8] = 0
    end
    res[19] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_air_block(
    obj_char,
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
        if test_char_on_ground(obj_char_other_side) then
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

        obj_char_other_side["current_animation_length"] = 32
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
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
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
        init_input_sys_cache(obj_char_other_side)
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

-- teching&teched
function load_game_scene_anim_char_common_0_Launcher_throw_tech(
    obj_char,teching_or_teched
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    local sprite_sheet_state = nil
    local pushbox = nil
    local collision_test_ground_height_offset = nil
    local velocity = nil
    if obj_char["height_state"] == "air" then
        if teching_or_teched == "teching" then
            sprite_sheet_state = "0_air_Launcher_teching"
        elseif teching_or_teched == "teched" then
            sprite_sheet_state = "0_air_Launcher_teched"
        end
        pushbox = pushbox_data_other_side["1_4_7_air_block"][0]
        collision_test_ground_height_offset = 180
        velocity = {-obj_char[5]*15,-40}
        obj_char["y"] = math.min(obj_char["y"],125)
    else
        if teching_or_teched == "teching" then
            sprite_sheet_state = "0_ground_Launcher_teching"
        elseif teching_or_teched == "teched" then
            sprite_sheet_state = "0_ground_Launcher_teched"
        end
        pushbox = pushbox_data_other_side["4_stand_block_high"][0]
        collision_test_ground_height_offset = 0
        velocity = {-obj_char[5]*60,0}
        obj_char["y"] = 365
    end

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = sprite_sheet_state
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0

        obj_char["current_animation_length"] = 30
        obj_char["idle_cancel"] = false

        obj_char["strike_inv"] = true
        obj_char["strike_inv_countdown"] = 30
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 30
        obj_char["projectile_inv"] = true
        obj_char["projectile_inv_countdown"] = 30
        obj_char["burst_inv"] = true
        obj_char["burst_inv_countdown"] = 30

        obj_char["physics_lock"] = false
        -- state_number
        obj_char["velocity"] = velocity
        obj_char["velocity_cache"] = {0,0}
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 5 -- 包括地面移动和空中dash的水平阻力
        -- collide
        obj_char["pushbox"] = pushbox
        obj_char["pushbox_other_side_char_active"] = false
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {}
        obj_char["collision_test_ground_height_offset"] = collision_test_ground_height_offset
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- insert VFX
        if teching_or_teched == "teching" then
            insert_VFX_game_scene_char_throw_tech(obj_char,-450,-900,1,1.2,1.2,0)
        end
        if obj_char["height_state"] ~= "air" then
            insert_VFX_game_scene_stage_smoke_horizontal_shot(
                obj_char,
                VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][1],
                VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][2],
                0.5,1,1,0
            )
        end
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[3] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[7] = function()
        -- draw_correction
        obj_char[8] = 2
    end
    res[24] = function()
        -- draw_correction
        obj_char[8] = 3
    end
    res[25] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[28] = function()
        -- draw_correction
        obj_char[8] = 4
    end
    res[30] = function()
        -- animation end
    end
    return res
end

-- hurt_soft_knockdown_wallstick_air
    -- 需要修改的角色属性
        -- 打击方
            -- velocity
        -- 受击方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- startup_frame
            -- active_frame
            -- recovery_frame
            -- frame_adv
            -- self_knockdown_recovery_animation
            -- current_animation_length
            -- strike_inv
            -- strike_inv_countdown
            -- throw_inv
            -- throw_inv_countdown
            -- projectile_inv
            -- projectile_inv_countdown
            -- burst_inv
            -- burst_inv_countdown
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_test_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_general_hurt_soft_knockdown_wallstick_air(
    obj_char,
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

        obj_char_other_side["self_knockdown_recovery_animation"] = self_knockdown_recovery_animation

        obj_char_other_side["current_animation_length"] = 60
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 65
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_knockdown_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        -- VFX
        insert_VFX_game_scene_stage_wallbreaks(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][1],
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][2],
            0.5,-1,1,0
        )
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[1] = function()
        -- update
        obj_char_other_side["state_cache"] = state_cache
    end
    res[55] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[60] = function()
        -- animation
    end
    return res
end

-- hurt_hard_knockdown
    -- 需要修改的角色属性
        -- 打击方
            -- velocity
        -- 受击方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- startup_frame
            -- active_frame
            -- recovery_frame
            -- frame_adv
            -- current_animation_length
            -- strike_inv
            -- strike_inv_countdown
            -- throw_inv
            -- throw_inv_countdown
            -- projectile_inv
            -- projectile_inv_countdown
            -- burst_inv
            -- burst_inv_countdown
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_test_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_down(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 25
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 30
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_knockdown_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        insert_VFX_game_scene_stage_smoke_land_blow(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][1],
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][2],
            0.5,1,1,0
        )
        -- special_update
        frame_0_special_update_function()
    end
    res[1] = function()
        -- update
        obj_char_other_side["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[6] = function()
        -- state
        obj_char_other_side["velocity"][2] = -5.0
        obj_char_other_side["height_state"] = "OTG" -- stand crouch air OTG
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][2]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[8] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[11] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[14] = function()
        -- draw_correction
        obj_char_other_side[8] = 5
    end
    res[18] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][6]
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[21] = function()
        -- draw_correction
        obj_char_other_side[8] = 7
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_head_down(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 25
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 30
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_knockdown_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        insert_VFX_game_scene_stage_smoke_land_blow(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][1],
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][2],
            0.5,1,1,0
        )
        -- special_update
        frame_0_special_update_function()
    end
    res[1] = function()
        -- update
        obj_char_other_side["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[6] = function()
        -- state
        obj_char_other_side["velocity"][2] = -5.0
        obj_char_other_side["height_state"] = "OTG" -- stand crouch air OTG
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][2]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[8] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[11] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[14] = function()
        -- draw_correction
        obj_char_other_side[8] = 5
    end
    res[18] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][6]
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[21] = function()
        -- draw_correction
        obj_char_other_side[8] = 7
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_up(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 25
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 30
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_knockdown_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        insert_VFX_game_scene_stage_smoke_land_blow(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][1],
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][2],
            0.5,1,1,0
        )
        -- special_update
        frame_0_special_update_function()
    end
    res[1] = function()
        -- update
        obj_char_other_side["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[6] = function()
        -- state
        obj_char_other_side["velocity"][2] = -5.0
        obj_char_other_side["height_state"] = "OTG" -- stand crouch air OTG
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][2]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[8] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[11] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[14] = function()
        -- draw_correction
        obj_char_other_side[8] = 5
    end
    res[18] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][6]
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[21] = function()
        -- draw_correction
        obj_char_other_side[8] = 7
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_wallstick_ground(
    obj_char,
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
    for i = 60,69 do
        res[i] = function()
            obj_char_other_side["y"] = 155 + (i-59)*10
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

        obj_char_other_side["current_animation_length"] = 85
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 90
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_knockdown_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        insert_VFX_game_scene_stage_wallbreaks(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][1],
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][2],
            0.5,-1,1,0
        )
        -- update
        obj_char_other_side["y"] = 155
        -- special_update
        frame_0_special_update_function()
    end
    res[1] = function()
        -- update
        obj_char_other_side["state_cache"] = state_cache
    end
    res[60] = function()
        -- state
        obj_char_other_side["y"] = 165
        obj_char_other_side["8"] = 1
    end
    res[65] = function()
        -- state
        obj_char_other_side["y"] = 215
        obj_char_other_side["8"] = 2
    end
    res[70] = function()
        -- state
        obj_char_other_side["y"] = 365
        obj_char_other_side["8"] = 3
        obj_char_other_side["height_state"] = "crouch" -- stand crouch air OTG
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][3]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][3]
    end
    res[72] = function()
        -- state
        obj_char_other_side["8"] = 4
        obj_char_other_side["height_state"] = "OTG" -- stand crouch air OTG
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][4]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][4]
    end
    res[75] = function()
        -- state
        obj_char_other_side["8"] = 5
    end
    res[85] = function()
        -- animation end
    end
    return res
end

-- recovery
    -- 需要修改的角色属性
        -- 打击方
            ------
        -- 受击方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- current_animation_length
            -- strike_inv
            -- strike_inv_countdown
            -- throw_inv
            -- throw_inv_countdown
            -- projectile_inv
            -- projectile_inv_countdown
            -- burst_inv
            -- burst_inv_countdown
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- damage_correction
            -- air_move
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_test_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_general_hurt_hard_recovery_down(
    obj_char,
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

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet_state"] = sprite_sheet_state
        obj_char_other_side["height_state"] = height_state -- stand crouch air OTG
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["current_animation_length"] = 30
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 35
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        obj_char_other_side["velocity"] = {0,0}
        obj_char_other_side["gravity"] = 2.5
        obj_char_other_side["friction"] = 1
        obj_char_other_side["horizontal_velocity_correction"] = 1
        obj_char_other_side["gravity_correction"] = 1
        obj_char_other_side["damage_correction"] = 1

        obj_char_other_side["air_move"]["jump"][1] = obj_char_other_side["air_move"]["jump"][2]
        obj_char_other_side["air_move"]["air_dash"][1] = obj_char_other_side["air_move"]["air_dash"][2]
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- special_update
        frame_0_special_update_function()
    end
    res[1] = function()
        -- update
        obj_char_other_side["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[5] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[7] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[10] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[15] = function()
        -- draw_correction
        obj_char_other_side[8] = 5
    end
    res[20] = function()
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[24] = function()
        -- draw_correction
        obj_char_other_side[8] = 7
    end
    res[25] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[27] = function()
        -- draw_correction
        obj_char_other_side[8] = 8
    end
    res[30] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_hard_recovery_up(
    obj_char,
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

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet_state"] = sprite_sheet_state
        obj_char_other_side["height_state"] = height_state -- stand crouch air OTG
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["current_animation_length"] = 30
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 35
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        obj_char_other_side["velocity"] = {0,0}
        obj_char_other_side["gravity"] = 2.5
        obj_char_other_side["friction"] = 1
        obj_char_other_side["horizontal_velocity_correction"] = 1
        obj_char_other_side["gravity_correction"] = 1
        obj_char_other_side["damage_correction"] = 1

        obj_char_other_side["air_move"]["jump"][1] = obj_char_other_side["air_move"]["jump"][2]
        obj_char_other_side["air_move"]["air_dash"][1] = obj_char_other_side["air_move"]["air_dash"][2]
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- special_update
        frame_0_special_update_function()
    end
    res[1] = function()
        -- update
        obj_char_other_side["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[5] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[7] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[10] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[15] = function()
        -- draw_correction
        obj_char_other_side[8] = 5
    end
    res[20] = function()
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[24] = function()
        -- draw_correction
        obj_char_other_side[8] = 7
    end
    res[25] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[27] = function()
        -- draw_correction
        obj_char_other_side[8] = 8
    end
    res[30] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_hard_recovery_wallstick_ground(
    obj_char,
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

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet_state"] = sprite_sheet_state
        obj_char_other_side["height_state"] = height_state -- stand crouch air OTG
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["current_animation_length"] = 25
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = true
        obj_char_other_side["strike_inv_countdown"] = 25
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 30
        obj_char_other_side["projectile_inv"] = true
        obj_char_other_side["projectile_inv_countdown"] = 25
        obj_char_other_side["burst_inv"] = true
        obj_char_other_side["burst_inv_countdown"] = 25
        -- state_number
        obj_char_other_side["velocity"] = {0,0}
        obj_char_other_side["gravity"] = 2.5
        obj_char_other_side["friction"] = 1
        obj_char_other_side["horizontal_velocity_correction"] = 1
        obj_char_other_side["gravity_correction"] = 1
        obj_char_other_side["damage_correction"] = 1

        obj_char_other_side["air_move"]["jump"][1] = obj_char_other_side["air_move"]["jump"][2]
        obj_char_other_side["air_move"]["air_dash"][1] = obj_char_other_side["air_move"]["air_dash"][2]
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- special_update
        frame_0_special_update_function()
    end
    res[1] = function()
        -- update
        obj_char_other_side["state_cache"] = state_cache
    end
    res[4] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[8] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[12] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[15] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[18] = function()
        -- draw_correction
        obj_char_other_side[8] = 5
    end
    res[20] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[21] = function()
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
    obj_char,
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

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet_state"] = sprite_sheet_state
        obj_char_other_side["height_state"] = height_state -- stand crouch air OTG
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["current_animation_length"] = 30
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 35
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        obj_char_other_side["velocity"] = {obj_char_other_side[5]*-25.0,0}
        obj_char_other_side["gravity"] = 2.5
        obj_char_other_side["friction"] = 0
        obj_char_other_side["horizontal_velocity_correction"] = 1
        obj_char_other_side["gravity_correction"] = 1
        obj_char_other_side["damage_correction"] = 1

        obj_char_other_side["air_move"]["jump"][1] = obj_char_other_side["air_move"]["jump"][2]
        obj_char_other_side["air_move"]["air_dash"][1] = obj_char_other_side["air_move"]["air_dash"][2]
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- update
        obj_char_other_side["y"] = 365
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][0][1],
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][0][2],
            0.5,-1,1,0
        )
        -- special_update
        frame_0_special_update_function()
    end
    res[1] = function()
        -- update
        obj_char_other_side["state_cache"] = state_cache
    end
    res[2] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[5] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[9] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[13] = function()
        -- state
        obj_char_other_side["height_state"] = "crouch" -- stand crouch air OTG
        obj_char_other_side["friction"] = 7
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][4]
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[18] = function()
        -- state
        obj_char_other_side["height_state"] = "OTG" -- stand crouch air OTG
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][5]
        -- draw_correction
        obj_char_other_side[8] = 5
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_land_blow(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][1][1],
            VFX_spawn_anchor_pos_data_other_side["smoke_spawn_anchor_pos"][sprite_sheet_state][1][2],
            0.5,1,1,0
        )
    end
    res[24] = function()
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[25] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[28] = function()
        -- draw_correction
        obj_char_other_side[8] = 7
    end
    res[30] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_soft_recovery_wallstick_air(
    obj_char,
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
    
    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet_state"] = sprite_sheet_state
        obj_char_other_side["height_state"] = height_state -- stand crouch air OTG
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "none" -- none startup active recovery

        obj_char_other_side["current_animation_length"] = 10
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = true
        obj_char_other_side["strike_inv_countdown"] = 25
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 25
        obj_char_other_side["projectile_inv"] = true
        obj_char_other_side["projectile_inv_countdown"] = 25
        obj_char_other_side["burst_inv"] = true
        obj_char_other_side["burst_inv_countdown"] = 25
        -- state_number
        obj_char_other_side["velocity"] = {obj_char_other_side[5]*hurt_horizontal_velocity,hurt_vertical_velocity}
        obj_char_other_side["gravity"] = 2.5
        obj_char_other_side["friction"] = 4
        obj_char_other_side["horizontal_velocity_correction"] = 1
        obj_char_other_side["gravity_correction"] = 1
        obj_char_other_side["damage_correction"] = 1

        obj_char_other_side["air_move"]["jump"][1] = obj_char_other_side["air_move"]["jump"][2]
        obj_char_other_side["air_move"]["air_dash"][1] = obj_char_other_side["air_move"]["air_dash"][2]
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 180
        -- draw_correction
        obj_char_other_side[8] = 2
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- special_update
        frame_0_special_update_function()
    end
    res[1] = function()
        -- update
        obj_char_other_side["state_cache"] = state_cache
    end
    res[4] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[5] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[7] = function()
        -- draw_correction
        obj_char_other_side[8] = 0
    end
    res[10] = function()
        -- animation_end
    end
    return res
end

-- hurt_launched
    -- 需要修改的角色属性
        -- 打击方
            -- velocity
        -- 受击方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- startup_frame
            -- active_frame
            -- recovery_frame
            -- frame_adv
            -- self_wallbounce_hurt_animation
            -- self_groundbounce_hurt_animation
            -- self_knockdown_animation
            -- self_knockdown_recovery_animation
            -- current_animation_length
            -- strike_inv
            -- strike_inv_countdown
            -- throw_inv
            -- throw_inv_countdown
            -- projectile_inv
            -- projectile_inv_countdown
            -- burst_inv
            -- burst_inv_countdown
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_test_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_general_hurt_launched_float(
    obj_char,
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
    local common_land_function = function(i)
        -- state
        obj_char_other_side["f"] = i
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][i]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][i]
        -- draw_correction
        obj_char_other_side[8] = i
    end
    local update_before_land_actions = {
        function()
            if obj_char_other_side["f"] < 8 then
                return
            else
                -- state
                obj_char_other_side["f"] = 1
                -- collide
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][1]
                -- draw_correction
                obj_char_other_side[8] = 1
            end
        end,
        function()
            if obj_char_other_side["f"] < 15 then
                return
            else
                -- state
                obj_char_other_side["f"] = 8
                -- collide
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][3]
                -- draw_correction
                obj_char_other_side[8] = 3
            end
        end,
        function()
            if obj_char_other_side["f"] < 22 then
                return
            else
                -- state
                obj_char_other_side["f"] = 15
                -- collide
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][5]
                -- draw_correction
                obj_char_other_side[8] = 5
            end
        end,
        function()
            if obj_char_other_side["f"] < 29 then
                return
            else
                -- state
                obj_char_other_side["f"] = 22
                -- collide
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][7]
                -- draw_correction
                obj_char_other_side[8] = 7
            end 
        end,
        function()
            if obj_char_other_side["f"] < 36 then
                return
            else
                -- state
                obj_char_other_side["f"] = 29
                -- collide
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][9]
                -- draw_correction
                obj_char_other_side[8] = 9
            end 
        end,
        function()
            if obj_char_other_side["f"] < 43 then
                return
            else
                -- state
                obj_char_other_side["f"] = 36
                -- collide
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][11]
                -- draw_correction
                obj_char_other_side[8] = 11
            end 
        end,
        function()
            if obj_char_other_side["f"] >= 36 then
                return
            else
                -- state
                obj_char_other_side["f"] = 36

                -- collide
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][11]
                
                -- draw_correction
                obj_char_other_side[8] = 11
            end
        end,
    }
    local function update_before_land()
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 1
        update_before_land_actions[
            math.floor((obj_char_other_side["velocity"][2] + obj_char_other_side["gravity"] * obj_char_other_side["gravity_correction"] + 60) / 20) + 1
        ]()
    end
    for i = 0,37 do
        res[i] = function()
            update_before_land()
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

        obj_char_other_side["current_animation_length"] = 45
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
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        update_before_land()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[1] = function()
        -- update
        update_before_land()
        obj_char_other_side["state_cache"] = state_cache
    end
    res[3] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][1]
        -- draw_correction
        obj_char_other_side[8] = 1
        -- update
        update_before_land()
    end
    res[6] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_before_land()
    end
    res[9] = function()
        -- state
        obj_char_other_side["f"] = 3
        -- draw_correction
        obj_char_other_side[8] = 1
        -- update
        update_before_land()
    end
    res[10] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][3]
        -- draw_correction
        obj_char_other_side[8] = 3
        -- update
        update_before_land()
    end
    res[13] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
        -- update
        update_before_land()
    end
    res[16] = function()
        -- state
        obj_char_other_side["f"] = 10
        -- draw_correction
        obj_char_other_side[8] = 3
        -- update
        update_before_land()
    end
    res[17] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][5]
        -- draw_correction
        obj_char_other_side[8] = 5
        -- update
        update_before_land()
    end
    res[20] = function()
        -- draw_correction
        obj_char_other_side[8] = 6
        -- update
        update_before_land()
    end
    res[23] = function()
        -- state
        obj_char_other_side["f"] = 17
        -- draw_correction
        obj_char_other_side[8] = 5
        -- update
        update_before_land()
    end
    res[24] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][7]
        -- draw_correction
        obj_char_other_side[8] = 7
        -- update
        update_before_land()
    end
    res[27] = function()
        -- draw_correction
        obj_char_other_side[8] = 8
        -- update
        update_before_land()
    end
    res[30] = function()
        -- state
        obj_char_other_side["f"] = 24
        -- draw_correction
        obj_char_other_side[8] = 7
        -- update
        update_before_land()
    end
    res[31] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][9]
        -- draw_correction
        obj_char_other_side[8] = 9
        -- update
        update_before_land()
    end
    res[34] = function()
        -- draw_correction
        obj_char_other_side[8] = 10
        -- update
        update_before_land()
    end
    res[37] = function()
        -- state
        obj_char_other_side["f"] = 31
        -- draw_correction
        obj_char_other_side[8] = 9
        -- update
        update_before_land()
    end
    res[38] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][11]
        -- draw_correction
        obj_char_other_side[8] = 11
    end
    res[41] = function()
        -- draw_correction
        obj_char_other_side[8] = 12
    end
    res[44] = function()
        -- state
        obj_char_other_side["f"] = 38
        -- draw_correction
        obj_char_other_side[8] = 11
    end
    res[45] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_high(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 34
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
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
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
function load_game_scene_anim_char_common_0_general_hurt_launched_low(
    obj_char,
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
    for i = 0,18 do
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

        obj_char_other_side["current_animation_length"] = 19
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
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
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
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][2]
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_throw_inv()
    end
    res[12] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
        -- update
        update_throw_inv()
    end
    res[18] = function()
        -- state
        obj_char_other_side["f"] = 6
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_throw_inv()
    end
    res[19] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_mid_hori_heavy(
    obj_char,
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
    for i = 0,9 do
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

        obj_char_other_side["current_animation_length"] = 10
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
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
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
        -- state
        obj_char_other_side["f"] = 3
        -- draw_correction
        obj_char_other_side[8] = 1
        -- update
        update_throw_inv()
    end
    res[10] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_mid_up(
    obj_char,
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
    local function update_before_falling()
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 1
        if obj_char_other_side["velocity"][2] > 0 then
            -- state
            obj_char_other_side["f"] = 9
            -- collide
            obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][3]
            -- draw_correction
            obj_char_other_side[8] = 3
        end
    end
    for i = 0,9 do
        res[i] = function()
            update_before_falling()
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

        obj_char_other_side["current_animation_length"] = 25
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
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        update_before_falling()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[1] = function()
        -- update
        update_before_falling()
        obj_char_other_side["state_cache"] = state_cache
    end
    res[3] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][1]
        -- draw_correction
        obj_char_other_side[8] = 1
        -- update
        update_before_falling()
    end
    res[6] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_before_falling()
    end
    res[9] = function()
        -- state
        obj_char_other_side["f"] = 3
        -- draw_correction
        obj_char_other_side[8] = 1
        -- update
        update_before_falling()
    end
    res[12] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][4]
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[15] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][5]
        -- draw_correction
        obj_char_other_side[8] = 5
    end
    res[18] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][6]
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[21] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][7]
        -- draw_correction
        obj_char_other_side[8] = 7
    end
    res[24] = function()
        -- state
        obj_char_other_side["f"] = 18
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][6]
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_rolling(
    obj_char,
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
    for i = 0,24 do
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

        obj_char_other_side["current_animation_length"] = 25
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
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
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
        update_throw_inv()
        obj_char_other_side[8] = 1
    end
    res[6] = function()
        update_throw_inv()
        obj_char_other_side[8] = 2
    end
    res[9] = function()
        update_throw_inv()
        obj_char_other_side[8] = 3
    end
    res[12] = function()
        update_throw_inv()
        obj_char_other_side[8] = 4
    end
    res[15] = function()
        update_throw_inv()
        obj_char_other_side[8] = 5
    end
    res[18] = function()
        update_throw_inv()
        obj_char_other_side[8] = 6
    end
    res[21] = function()
        update_throw_inv()
        obj_char_other_side[8] = 7
    end
    res[24] = function()
        update_throw_inv()
        obj_char_other_side[8] = 1
        obj_char_other_side["f"] = 1
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_rotate(
    obj_char,
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

    for i = 0,15 do
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

        obj_char_other_side["current_animation_length"] = 16
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
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        init_input_sys_cache(obj_char_other_side)
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
        update_throw_inv()
        obj_char_other_side[8] = 1
    end
    res[6] = function()
        update_throw_inv()
        obj_char_other_side[8] = 2
    end
    res[9] = function()
        update_throw_inv()
        obj_char_other_side[8] = 3
    end
    res[12] = function()
        update_throw_inv()
        obj_char_other_side[8] = 4
    end
    res[15] = function()
        update_throw_inv()
        obj_char_other_side[8] = 1
        obj_char_other_side["f"] = 1
    end
    res[16] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_wallbounce(
    obj_char,
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
    for i = 0,16 do
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

        obj_char_other_side["current_animation_length"] = 16
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
        -- common_game_scene_char_apply_hurt_velocity(
        --     obj_char,obj_char_other_side,
        --     hurt_horizontal_velocity,
        --     hurt_horizontal_friction,
        --     hurt_horizontal_velocity_correction,
        --     hurt_vertical_velocity,
        --     hurt_vertical_gravity,
        --     hurt_vertical_gravity_correction
        -- )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 180
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
        -- update
        update_throw_inv()
        -- special_update
        frame_0_special_update_function()
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
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][2]
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
        -- state
        obj_char_other_side["f"] = 9
        -- draw_correction
        obj_char_other_side[8] = 3
        -- update
        update_throw_inv()
    end
    res[16] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_groundbounce(
    obj_char,
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
    local function update_before_land()
        update_throw_inv()
        if obj_char_other_side["velocity"][2] >= 0 then
            -- collide
            obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][2]
            -- draw_correction
            obj_char_other_side[8] = 2
        end
    end
    for i = 0,22 do
        res[i] = function()
            update_throw_inv()
        end
    end
    for i = 0,6 do
        res[i] = function()
            update_before_land()
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

        obj_char_other_side["current_animation_length"] = 22
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
        -- common_game_scene_char_apply_hurt_velocity(
        --     obj_char,obj_char_other_side,
        --     hurt_horizontal_velocity,
        --     hurt_horizontal_friction,
        --     hurt_horizontal_velocity_correction,
        --     hurt_vertical_velocity,
        --     hurt_vertical_gravity,
        --     hurt_vertical_gravity_correction
        -- )
        obj_char_other_side["friction"] = hurt_horizontal_friction
        obj_char_other_side["gravity"] = hurt_vertical_gravity*hurt_vertical_gravity_correction
        obj_char_other_side["velocity"][1] = hurt_horizontal_velocity*hurt_horizontal_velocity_correction*(-obj_char_other_side[5])
        obj_char_other_side["velocity"][2] = hurt_vertical_velocity

        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 180
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet_state]
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
        -- update
        update_before_land()
        -- special_update
        frame_0_special_update_function()
    end
    res[1] = function()
        -- update
        update_throw_inv()
        obj_char_other_side["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
        -- update
        update_before_land()
    end
    res[6] = function()
        -- state
        obj_char_other_side["f"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        -- update
        update_before_land()
    end
    res[9] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][2]
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_throw_inv()
    end
    res[12] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][3]
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[15] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][4]
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[18] = function()
        -- draw_correction
        obj_char_other_side[8] = 5
    end
    res[21] = function()
        -- state
        obj_char_other_side["f"] = 15
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[22] = function()
        -- animation_end
    end
    return res
end

-- semi_launched
function load_game_scene_anim_char_common_0_general_hurt_semi_launched_mid(
    obj_char,
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

        obj_char_other_side["current_animation_length"] = 29
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 43
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
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
        -- update
        obj_char_other_side["y"] = 100
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
        -- special_update
        frame_0_special_update_function()
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[4] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[8] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[11] = function()
        -- state
        obj_char_other_side["height_state"] = "stand"
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet_state][3]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][3]
        -- update
        obj_char_other_side["y"] = 365
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[14] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][4]
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[18] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][5]
        -- draw_correction
        obj_char_other_side[8] = 5
    end
    res[20] = function()
        -- state
        obj_char_other_side["hurt_state_target"] = "idle"
    end
    res[21] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet_state][6]
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[24] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char_other_side)
    end
    res[29] = function()
        -- animation_end
    end
    return res
end
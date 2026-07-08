    -- obj_char,
    -- sprite_sheet,
    -- height,
    -- hurt_horizontal_velocity,
    -- hurt_horizontal_friction,
    -- hurt_horizontal_velocity_correction
    -- hurt_vertical_velocity,
    -- hurt_vertical_gravity,
    -- hurt_vertical_gravity_correction,
    -- self_knockdown_animation

-- character_animation
-- 0_general_hurt_falled_knockout
    -- 需要修改的角色属性
        -- 打击方
            -- velocity
        -- 受击方
            -- sprite_sheet
            -- height
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
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- damage_correction
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_general_hurt_falled_knockout(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 95

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = true
        obj_char_other_side["strike_inv_countdown"] = 1000
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 1000
        obj_char_other_side["projectile_inv"] = true
        obj_char_other_side["projectile_inv_countdown"] = 1000
        -- state_number
        obj_char_other_side["velocity"] = {0,0}
        obj_char_other_side["friction"] = 10
        obj_char_other_side["gravity"] = 2.5
        obj_char_other_side["horizontal_velocity_correction"] = 1
        obj_char_other_side["gravity_correction"] = 1
        obj_char_other_side["damage_correction"] = 1
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[11] = function()
        -- state
        obj_char_other_side["height"] = "crouch" -- stand crouch air OTG wallstick
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][1]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
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
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
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
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- draw_correction
        obj_char_other_side[8] = 8
    end
    res[89] = function()
        -- draw_correction
        obj_char_other_side[8] = 9
    end
    res[93] = function()
        -- state
        obj_char_other_side["height"] = "OTG" -- stand crouch air OTG wallstick
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][10]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][10]
        -- draw_correction
        obj_char_other_side[8] = 10
    end
    res[95] = function()
        -- animation_end
    end
    return res
end

-- 0_ground_hurt
    -- 需要修改的角色属性
        -- 打击方
            -- velocity
        -- 受击方
            -- sprite_sheet
            -- height
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
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_ground_hurt_lv0(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
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
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false
        
        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[8] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
    end
    res[9] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[11] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
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
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 15

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[10] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
    end
    res[11] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[13] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
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
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 17

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[12] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
    end
    res[13] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[15] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
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
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 20

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[15] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
    end
    res[16] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[18] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
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
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 22

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][2]
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[17] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
    end
    res[18] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[20] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
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
            -- sprite_sheet
            -- height
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
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_ground_block_lv0(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
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
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char_other_side["player_side"]]
        local FD_block = test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"])
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"block",FD_block
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,FD_block,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 5
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[5] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
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
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 12

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char_other_side["player_side"]]
        local FD_block = test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"])
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"block",FD_block
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,FD_block,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 5
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[6] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[7] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
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
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 14

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char_other_side["player_side"]]
        local FD_block = test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"])
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"block",FD_block
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,FD_block,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 5
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[6] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[9] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
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
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 17

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char_other_side["player_side"]]
        local FD_block = test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"])
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"block",FD_block
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,FD_block,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 5
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
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
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
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
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 19

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char_other_side["player_side"]]
        local FD_block = test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"])
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"block",FD_block
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,FD_block,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 5
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
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
    res[14] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
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
    sprite_sheet,
    height,
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
    character_uncommon_init
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
            obj_char_other_side["y"] = 0
            obj_char_other_side["f"] = 13
            obj_char_other_side["height"]  = "stand"
            obj_char_other_side["throw_inv"] = true
            obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5-13
            obj_char_other_side["velocity"][2] = 0
            obj_char_other_side["gravity"] = 2.5
            -- collide
            obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][6]
            obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][6]
            obj_char_other_side["collision_ground_height_offset"] = 0
            -- draw_correction
            obj_char_other_side[8] = 6
            -- VFX
            insert_VFX_game_scene_stage_smoke_land_blow(
                obj_char_other_side,
                VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
                VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
                0.5,1,1,0
            )
        end
    end
    for i = 0,12 do
        res[i] = function()
            update_before_land()
        end
    end
    res["prop_f"] = "f"
    res["anim_length"] = 32

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 1
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char_other_side["player_side"]]
        local FD_block = test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"])
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"block",FD_block
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,FD_block,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 185
        -- draw_correction
        obj_char_other_side[8] = 5
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
        -- update
        update_before_land()
    end
    res[6] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
        -- update
        update_before_land()
    end
    res[9] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_before_land()
    end
    res[12] = function()
        -- state
        obj_char_other_side["f"] = 3
        -- draw_correction
        obj_char_other_side[8] = 4
        -- update
        update_before_land()
    end
    res[13] = function()
        -- land animation start
    end
    res[16] = function()
        -- collide
        obj_char_other_side["collision_ground_height_offset"] = 0
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][6]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][6]
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[22] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][7]
        -- draw_correction
        obj_char_other_side[8] = 7
    end
    res[27] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
    end
    res[28] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][8]
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
    local sprite_sheet = nil
    local pushbox = nil
    local collision_ground_height_offset = nil
    local velocity = nil
    local function update_1f_15f_air(i)
        -- state_number
        if obj_char["height"] == "air" then
            obj_char["velocity"][1] = -obj_char[5]*(32-2*i)
        end
    end
    res["prop_f"] = "f"
    res["anim_length"] = 30
    
    if obj_char["height"] == "air" then
        obj_char["y"] = math.min(obj_char["y"],-240)
        if teching_or_teched == "teching" then
            sprite_sheet = "0_air_Launcher_teching"
        elseif teching_or_teched == "teched" then
            sprite_sheet = "0_air_Launcher_teched"
        end
        velocity = {-obj_char[5]*32,-37.5}
        pushbox = pushbox_data_other_side["1_4_7_air_block"][0]
        collision_ground_height_offset = 185
    else
        obj_char["y"] = 0
        if teching_or_teched == "teching" then
            sprite_sheet = "0_ground_Launcher_teching"
        elseif teching_or_teched == "teched" then
            sprite_sheet = "0_ground_Launcher_teched"
        end
        velocity = {-obj_char[5]*60,0}
        pushbox = pushbox_data_other_side["4_stand_block_high"][0]
        collision_ground_height_offset = 0
    end
    for i=1,15 do
        res[i] = function()
            update_1f_15f_air(i)
        end
    end

    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = sprite_sheet
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery

        obj_char["wallhurt_wallstick_on_side"] = 0
        obj_char["wallhurt_wallstickable"] = false
        obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char["wallhurt_wallbreak_adv"] = false

        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0

        obj_char["idle_cancel"] = false

        obj_char["strike_inv"] = true
        obj_char["strike_inv_countdown"] = 30
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 30
        obj_char["projectile_inv"] = true
        obj_char["projectile_inv_countdown"] = 30

        update_1f_15f_air(0)
        -- state_number
        obj_char["velocity"] = velocity
        obj_char["velocity_cache"] = {0,0}
        obj_char["friction"] = 5 -- 包括地面移动和空中dash的水平阻力
        obj_char["gravity"] = 2.5
        -- collide
        obj_char["pushbox"] = pushbox
        obj_char["pushbox_other_side_char_active"] = false
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {}
        obj_char["collision_ground_height_offset"] = collision_ground_height_offset
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
        -- insert VFX
        if teching_or_teched == "teching" then
            insert_VFX_game_scene_char_throw_tech(obj_char,-450,-900,1,1.2,1.2,0)
        end
        if obj_char["height"] ~= "air" then
            insert_VFX_game_scene_stage_smoke_horizontal_shot(
                obj_char,
                VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
                VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
                0.5,1,1,0
            )
        end
    end
    res[3] = function()
        -- state_number
        update_1f_15f_air(3)
        -- draw_correction
        obj_char[8] = 1
    end
    res[7] = function()
        -- state_number
        update_1f_15f_air(7)
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
        common_game_scene_set_input_sys_cache_init(obj_char)
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
            -- sprite_sheet
            -- height
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
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_general_hurt_soft_knockdown_wallstick_air(obj_char)
    local res = {}
    local sprite_sheet = "0_general_hurt_soft_knockdown_wallstick_air"
    local side = obj_char["player_side"]
    local pushbox_data = common_game_scene_get_pushbox(side)
    local hurtbox_data = common_game_scene_get_hurtbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local VFX_spawn_anchor_pos_data = common_game_scene_get_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 60

    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = sprite_sheet
        obj_char["height"] = "wallstick" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery

        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0

        obj_char["self_knockdown_recovery_animation"] = 
        load_game_scene_anim_char_common_0_general_hurt_soft_recovery_wallstick_air(obj_char)

        obj_char["idle_cancel"] = false

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = res["anim_length"]+5
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["velocity_debug"] = {0,0}
        obj_char["velocity_cache"] = {0,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 0
        -- collide
        obj_char["pushbox"] = pushbox_data[sprite_sheet][0]
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][0]
        obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = anchor_data[sprite_sheet]
    end
    res[1] = function()
        -- state
        obj_char["state_cache"] = "knockdown_recovery_wallstick"
    end
    res[55] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
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
            -- sprite_sheet
            -- height
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
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_down(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 25

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
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
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_land_blow(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[6] = function()
        -- state
        obj_char_other_side["velocity"][2] = -5.0
        obj_char_other_side["height"] = "OTG" -- stand crouch air OTG wallstick
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][2]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][2]
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
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][6]
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
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 25

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
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
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_land_blow(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[6] = function()
        -- state
        obj_char_other_side["velocity"][2] = -5.0
        obj_char_other_side["height"] = "OTG" -- stand crouch air OTG wallstick
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][2]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][2]
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
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][6]
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
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 25

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
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
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_land_blow(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[6] = function()
        -- state
        obj_char_other_side["velocity"][2] = -5.0
        obj_char_other_side["height"] = "OTG" -- stand crouch air OTG wallstick
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][2]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][2]
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
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][6]
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
function load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_wallstick_ground(obj_char)
    local res = {}
    local sprite_sheet = "0_general_hurt_hard_knockdown_wallstick_ground"
    local side = obj_char["player_side"]
    local pushbox_data = common_game_scene_get_pushbox(side)
    local hurtbox_data = common_game_scene_get_hurtbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local VFX_spawn_anchor_pos_data = common_game_scene_get_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 85
    for i = 60,69 do
        res[i] = function()
            obj_char["y"] = -210 + (i-59)*10
        end
    end

    res[0] = function()
        -- state
        obj_char["y"] = -200
        obj_char["sprite_sheet"] = sprite_sheet
        obj_char["height"] = "wallstick" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery

        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0

        obj_char["self_knockdown_recovery_animation"] = 
        load_game_scene_anim_char_common_0_general_hurt_hard_recovery_wallstick_ground(obj_char)

        obj_char["idle_cancel"] = false

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = res["anim_length"]+5
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0

        obj_char["velocity"] = {0,0}
        obj_char["velocity_debug"] = {0,0}
        obj_char["velocity_cache"] = {0,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 0
        -- collide
        obj_char["pushbox"] = pushbox_data[sprite_sheet][0]
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][0]
        obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = anchor_data[sprite_sheet]
    end
    res[1] = function()
        -- state
        obj_char["state_cache"] = "knockdown_recovery_wallstick"
    end
    res[60] = function()
        -- state
        obj_char["y"] = -200
        obj_char[8] = 1
    end
    res[65] = function()
        -- state
        obj_char["y"] = -150
        obj_char[8] = 2
    end
    res[70] = function()
        -- state
        obj_char["y"] = 0
        obj_char[8] = 3
        -- collide
        obj_char["pushbox"] = pushbox_data[sprite_sheet][3]
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][3]
        insert_VFX_game_scene_stage_smoke_land_blow(
            obj_char,
            VFX_spawn_anchor_pos_data["stage_VFX_spawn_anchor_pos"][sprite_sheet][1],
            VFX_spawn_anchor_pos_data["stage_VFX_spawn_anchor_pos"][sprite_sheet][2],
            0.5,1,1,0
        )
    end
    res[72] = function()
        -- state
        obj_char[8] = 4
        -- collide
        obj_char["pushbox"] = pushbox_data[sprite_sheet][4]
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][4]
    end
    res[75] = function()
        -- state
        obj_char[8] = 5
    end
    res[85] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_wallbreak(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local sprite_sheet = "0_general_hurt_hard_knockdown_up"
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 7

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = "OTG" -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["self_knockdown_animation"] = nil
        obj_char_other_side["self_knockdown_recovery_animation"] = 
        load_game_scene_anim_char_common_0_general_hurt_hard_recovery_up(
            obj_char,
            "0_general_hurt_hard_recovery_up",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        )

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
    
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][2]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = {}
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 7
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = "knockdown_recovery"
    end
    res[7] = function()
        -- animation_end
    end

    return res
end

-- recovery
    -- 需要修改的角色属性
        -- 打击方
            ------
        -- 受击方
            -- sprite_sheet
            -- height
            -- hurt_state_target
            -- move_state
            -- current_animation_length
            -- strike_inv
            -- strike_inv_countdown
            -- throw_inv
            -- throw_inv_countdown
            -- projectile_inv
            -- projectile_inv_countdown
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
            -- collision_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_general_hurt_hard_recovery_down(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 30

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        obj_char_other_side["velocity"] = {0,0}
        obj_char_other_side["friction"] = 1
        obj_char_other_side["gravity"] = 2.5
        obj_char_other_side["horizontal_velocity_correction"] = 1
        obj_char_other_side["gravity_correction"] = 1
        obj_char_other_side["damage_correction"] = 1

        obj_char_other_side["air_move"]["jump"][1] = obj_char_other_side["air_move"]["jump"][2]
        obj_char_other_side["air_move"]["air_dash"][1] = obj_char_other_side["air_move"]["air_dash"][2]
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
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
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
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
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 30

    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        obj_char_other_side["velocity"] = {0,0}
        obj_char_other_side["friction"] = 1
        obj_char_other_side["gravity"] = 2.5
        obj_char_other_side["horizontal_velocity_correction"] = 1
        obj_char_other_side["gravity_correction"] = 1
        obj_char_other_side["damage_correction"] = 1

        obj_char_other_side["air_move"]["jump"][1] = obj_char_other_side["air_move"]["jump"][2]
        obj_char_other_side["air_move"]["air_dash"][1] = obj_char_other_side["air_move"]["air_dash"][2]
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
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
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
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
function load_game_scene_anim_char_common_0_general_hurt_hard_recovery_wallstick_ground(obj_char)
    local res = {}
    local sprite_sheet = "0_general_hurt_hard_recovery_wallstick_ground"
    local side = obj_char["player_side"]
    local pushbox_data = common_game_scene_get_pushbox(side)
    local hurtbox_data = common_game_scene_get_hurtbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local VFX_spawn_anchor_pos_data = common_game_scene_get_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 25

    res[0] = function()
        -- state
        obj_char["y"] = 0
        obj_char["sprite_sheet"] = sprite_sheet
        obj_char["height"] = "OTG" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery

        obj_char["wallhurt_wallstick_on_side"] = 0
        obj_char["wallhurt_wallstickable"] = false
        obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char["wallhurt_wallbreak_adv"] = false

        obj_char["idle_cancel"] = false

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = res["anim_length"]+5
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1

        obj_char["air_move"]["jump"][1] = obj_char["air_move"]["jump"][2]
        obj_char["air_move"]["air_dash"][1] = obj_char["air_move"]["air_dash"][2]
        -- collide
        obj_char["pushbox"] = pushbox_data[sprite_sheet][0]
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][0]
        obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = anchor_data[sprite_sheet]
    end
    res[1] = function()
        -- state
        obj_char["state_cache"] = "5_stand_idle"
    end
    res[4] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[8] = function()
        -- draw_correction
        obj_char[8] = 2
    end
    res[12] = function()
        -- draw_correction
        obj_char[8] = 3
    end
    res[15] = function()
        -- draw_correction
        obj_char[8] = 4
    end
    res[18] = function()
        -- draw_correction
        obj_char[8] = 5
    end
    res[20] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
    end
    res[21] = function()
        -- draw_correction
        obj_char[8] = 6
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 30

    res[0] = function()
        -- state
        obj_char_other_side["y"] = 0
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = false
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        obj_char_other_side["velocity"] = {-20.0*obj_char_other_side[5],0}
        obj_char_other_side["friction"] = 100
        obj_char_other_side["gravity"] = 2.5
        obj_char_other_side["horizontal_velocity_correction"] = 1
        obj_char_other_side["gravity_correction"] = 1
        obj_char_other_side["damage_correction"] = 1

        obj_char_other_side["air_move"]["jump"][1] = obj_char_other_side["air_move"]["jump"][2]
        obj_char_other_side["air_move"]["air_dash"][1] = obj_char_other_side["air_move"]["air_dash"][2]
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][0][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][0][2],
            0.5,-1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
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
        obj_char_other_side["height"] = "crouch" -- stand crouch air OTG wallstick
        obj_char_other_side["friction"] = 7
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][4]
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[18] = function()
        -- state
        obj_char_other_side["height"] = "OTG" -- stand crouch air OTG wallstick
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][5]
        -- draw_correction
        obj_char_other_side[8] = 5
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_land_blow(
            obj_char_other_side,
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1][1],
            VFX_spawn_anchor_pos_data_other_side["stage_VFX_spawn_anchor_pos"][sprite_sheet][1][2],
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
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
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
function load_game_scene_anim_char_common_0_general_hurt_soft_recovery_wallstick_air(obj_char)
    local res = {}
    local sprite_sheet = "0_general_hurt_soft_recovery_wallstick_air"
    local side = obj_char["player_side"]
    local pushbox_data = common_game_scene_get_pushbox(side)
    local hurtbox_data = common_game_scene_get_hurtbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local VFX_spawn_anchor_pos_data = common_game_scene_get_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 10
    
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = sprite_sheet
        obj_char["height"] = "air" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["wallhurt_wallstick_on_side"] = 0
        obj_char["wallhurt_wallstickable"] = false
        obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char["wallhurt_wallbreak_adv"] = false

        obj_char["idle_cancel"] = false

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = res["anim_length"]+5
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        -- state_number
        obj_char["velocity"] = {0,-25}
        if obj_char["direction_input"] == 9 then
            obj_char["velocity"][1] = 17.5*obj_char[5]
            obj_char["velocity"][2] = -45
        elseif common_game_scene_check_forward_direction(obj_char) then
            obj_char["velocity"][1] = 42.5*obj_char[5]
        elseif common_game_scene_check_jump_direction(obj_char) then
            obj_char["velocity"][2] = -62.5
        end
        obj_char["friction"] = 4
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1

        obj_char["air_move"]["jump"][1] = obj_char["air_move"]["jump"][2]
        obj_char["air_move"]["air_dash"][1] = obj_char["air_move"]["air_dash"][2]
        -- collide
        obj_char["pushbox"] = pushbox_data[sprite_sheet][0]
        obj_char["pushbox_other_side_char_active"] = false
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][0]
        obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        obj_char[8] = 2
        obj_char["anchor_pos"] = anchor_data[sprite_sheet]
    end
    res[1] = function()
        -- state
        obj_char["state_cache"] = "7_8_9_jump_air"
    end
    res[4] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[5] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
    end
    res[7] = function()
        -- draw_correction
        obj_char[8] = 0
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
            -- sprite_sheet
            -- height
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
            -- velocity
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_ground_height_offset
            -- 8
            -- anchor_pos
            ------
function load_game_scene_anim_char_common_0_general_hurt_launched_float(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
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
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][i]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][i]
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
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
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
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][3]
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
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][5]
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
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][7]
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
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][9]
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
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][11]
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
                obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][11]
                
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
    res["prop_f"] = "f"
    res["anim_length"] = 45

    for i = 0,37 do
        res[i] = function()
            update_before_land()
        end
    end
    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

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
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- update
        update_before_land()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
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
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][3]
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
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][5]
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
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][7]
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
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][9]
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
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][11]
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
    sprite_sheet,
    height,
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
    character_uncommon_init
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
    end
    res["prop_f"] = "f"
    res["anim_length"] = 34

    for i = 0,33 do
        res[i] = function()
            update_before_land()
        end
    end
    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

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
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- update
        update_before_land()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_before_land()
    end
    res[9] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][3]
        -- draw_correction
        obj_char_other_side[8] = 3
        -- update
        update_before_land()
    end
    res[12] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
        -- update
        update_before_land()
    end
    res[15] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][5]
        -- draw_correction
        obj_char_other_side[8] = 5
        -- update
        update_before_land()
    end
    res[18] = function()
        -- draw_correction
        obj_char_other_side[8] = 6
        -- update
        update_before_land()
    end
    res[21] = function()
        -- state
        if obj_char_other_side["velocity"][2] <= math.abs(obj_char_other_side["velocity"][1])*2 then
            -- collide
            obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][7]
            -- draw_correction
            obj_char_other_side[8] = 7
        else
            -- state
            obj_char_other_side["f"] = 15
            -- draw_correction
            obj_char_other_side[8] = 5
        end
        -- update
        update_before_land()
    end
    res[24] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][8]
        -- draw_correction
        obj_char_other_side[8] = 8
        -- update
        update_before_land()
    end
    res[27] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][9]
        -- draw_correction
        obj_char_other_side[8] = 9
        -- update
        update_before_land()
    end
    res[30] = function()
        -- draw_correction
        obj_char_other_side[8] = 10
        -- update
        update_before_land()
    end
    res[33] = function()
        -- state
        obj_char_other_side["f"] = 27
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][9]
        -- draw_correction
        obj_char_other_side[8] = 9
        -- update
        update_before_land()
    end
    res[34] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_low(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
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
    end
    res["prop_f"] = "f"
    res["anim_length"] = 19

    for i = 0,18 do
        res[i] = function()
            update_before_land()
        end
    end
    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

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
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- update
        update_before_land()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
        -- draw_correction
        obj_char_other_side[8] = 1
        -- update
        update_before_land()
    end
    res[6] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][2]
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_before_land()
    end
    res[12] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
        -- update
        update_before_land()
    end
    res[18] = function()
        -- state
        obj_char_other_side["f"] = 6
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_before_land()
    end
    res[19] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_mid_hori_heavy(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
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
    end
    res["prop_f"] = "f"
    res["anim_length"] = 10

    for i = 0,9 do
        res[i] = function()
            update_before_land()
        end
    end
    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

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
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
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
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_mid_up(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
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
            obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][3]
            -- draw_correction
            obj_char_other_side[8] = 3
        end
    end
    local function update_before_land()
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 1
    end
    res["prop_f"] = "f"
    res["anim_length"] = 25

    for i = 0,9 do
        res[i] = function()
            update_before_falling()
        end
    end
    for i = 10,24 do
        res[i] = function()
            update_before_land()
        end
    end
    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

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
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- update
        update_before_falling()
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
        -- update
        update_before_falling()
    end
    res[3] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
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
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][4]
        -- draw_correction
        obj_char_other_side[8] = 4
        -- update
        update_before_land()
    end
    res[15] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][5]
        -- draw_correction
        obj_char_other_side[8] = 5
        -- update
        update_before_land()
    end
    res[18] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][6]
        -- draw_correction
        obj_char_other_side[8] = 6
        -- update
        update_before_land()
    end
    res[21] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][7]
        -- draw_correction
        obj_char_other_side[8] = 7
        -- update
        update_before_land()
    end
    res[24] = function()
        obj_char_other_side["f"] = 18
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][6]
        -- draw_correction
        obj_char_other_side[8] = 6
        -- update
        update_before_land()
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_rolling(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
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
    end
    res["prop_f"] = "f"
    res["anim_length"] = 25

    for i = 0,24 do
        res[i] = function()
            update_before_land()
        end
    end
    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

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
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- update
        update_before_land()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- state
        obj_char_other_side[8] = 1
        -- update
        update_before_land()
    end
    res[6] = function()
        -- state
        obj_char_other_side[8] = 2
        -- update
        update_before_land()
    end
    res[9] = function()
        -- state
        obj_char_other_side[8] = 3
        -- update
        update_before_land()
    end
    res[12] = function()
        -- state
        obj_char_other_side[8] = 4
        -- update
        update_before_land()
    end
    res[15] = function()
        -- state
        obj_char_other_side[8] = 5
        -- update
        update_before_land()
    end
    res[18] = function()
        -- state
        obj_char_other_side[8] = 6
        -- update
        update_before_land()
    end
    res[21] = function()
        -- state
        obj_char_other_side[8] = 7
        -- update
        update_before_land()
    end
    res[24] = function()
        -- state
        obj_char_other_side[8] = 1
        obj_char_other_side["f"] = 1
        -- update
        update_before_land()
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_rotate(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
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
    end
    res["prop_f"] = "f"
    res["anim_length"] = 16

    for i = 0,15 do
        res[i] = function()
            update_before_land()
        end
    end
    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

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
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- update
        update_before_land()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- state
        obj_char_other_side[8] = 1
        -- update
        update_before_land()
    end
    res[6] = function()
        -- state
        obj_char_other_side[8] = 2
        -- update
        update_before_land()
    end
    res[9] = function()
        -- state
        obj_char_other_side[8] = 3
        -- update
        update_before_land()
    end
    res[12] = function()
        -- state
        obj_char_other_side[8] = 4
        -- update
        update_before_land()
    end
    res[15] = function()
        -- state
        obj_char_other_side[8] = 1
        obj_char_other_side["f"] = 1
        -- update
        update_before_land()
    end
    res[16] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_wallbounce(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
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
    end
    res["prop_f"] = "f"
    res["anim_length"] = 16

    for i = 0,15 do
        res[i] = function()
            update_before_land()
        end
    end
    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

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
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- update
        update_before_land()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
        -- draw_correction
        obj_char_other_side[8] = 1
        -- update
        update_before_land()
    end
    res[6] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][2]
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_before_land()
    end
    res[9] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][3]
        -- draw_correction
        obj_char_other_side[8] = 3
        -- update
        update_before_land()
    end
    res[12] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
        -- update
        update_before_land()
    end
    res[15] = function()
        -- state
        obj_char_other_side["f"] = 9
        -- draw_correction
        obj_char_other_side[8] = 3
        -- update
        update_before_land()
    end
    res[16] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_groundbounce(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
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
    end
    local function update_before_land()
        update_before_land()
        if obj_char_other_side["velocity"][2] >= 0 then
            -- collide
            obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][2]
            -- draw_correction
            obj_char_other_side[8] = 2
        end
    end
    res["prop_f"] = "f"
    res["anim_length"] = 22
    
    for i = 0,22 do
        res[i] = function()
            update_before_land()
        end
    end
    for i = 0,6 do
        res[i] = function()
            update_before_land()
        end
    end
    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

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
        -- state_number
        obj_char_other_side["friction"] = hurt_horizontal_friction
        obj_char_other_side["gravity"] = hurt_vertical_gravity*hurt_vertical_gravity_correction
        obj_char_other_side["velocity"][1] = hurt_horizontal_velocity*hurt_horizontal_velocity_correction*(-obj_char_other_side[5])
        obj_char_other_side["velocity"][2] = hurt_vertical_velocity

        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- update
        update_before_land()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
        -- update
        update_before_land()
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
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][2]
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_before_land()
    end
    res[12] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][3]
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[15] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][4]
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

function load_game_scene_anim_char_common_0_general_hurt_lanuched_throw_success_PRC(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
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
    end
    res["prop_f"] = "f"
    res["anim_length"] = 34

    for i = 0,33 do
        res[i] = function()
            update_before_land()
        end
    end
    res[0] = function()
        -- state
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

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
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_projectile_apply_hurt_velocity(
            obj_char,obj_char_other_side,nil,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false,
            "character"
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- update
        update_before_land()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_before_land()
    end
    res[9] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][3]
        -- draw_correction
        obj_char_other_side[8] = 3
        -- update
        update_before_land()
    end
    res[12] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
        -- update
        update_before_land()
    end
    res[15] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][5]
        -- draw_correction
        obj_char_other_side[8] = 5
        -- update
        update_before_land()
    end
    res[18] = function()
        -- draw_correction
        obj_char_other_side[8] = 6
        -- update
        update_before_land()
    end
    res[21] = function()
        -- state
        if obj_char_other_side["velocity"][2] <= math.abs(obj_char_other_side["velocity"][1])*2 then
            -- collide
            obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][7]
            -- draw_correction
            obj_char_other_side[8] = 7
        else
            -- state
            obj_char_other_side["f"] = 15
            -- draw_correction
            obj_char_other_side[8] = 5
        end
        -- update
        update_before_land()
    end
    res[24] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][8]
        -- draw_correction
        obj_char_other_side[8] = 8
        -- update
        update_before_land()
    end
    res[27] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][9]
        -- draw_correction
        obj_char_other_side[8] = 9
        -- update
        update_before_land()
    end
    res[30] = function()
        -- draw_correction
        obj_char_other_side[8] = 10
        -- update
        update_before_land()
    end
    res[33] = function()
        -- state
        obj_char_other_side["f"] = 27
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][9]
        -- draw_correction
        obj_char_other_side[8] = 9
        -- update
        update_before_land()
    end
    res[34] = function()
        -- animation_end
    end
    return res
end

-- semi_launched
function load_game_scene_anim_char_common_0_general_hurt_semi_launched_mid(
    obj_char,
    sprite_sheet,
    height,
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
    character_uncommon_init
)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local VFX_spawn_anchor_pos_data_other_side = common_game_scene_change_character_VFX_spawn_anchor_pos(side)
    res["prop_f"] = "f"
    res["anim_length"] = 29

    res[0] = function()
        -- state
        obj_char_other_side["y"] = -265
        obj_char_other_side["sprite_sheet"] = sprite_sheet
        obj_char_other_side["height"] = height -- stand crouch air OTG wallstick
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery

        obj_char_other_side["wallhurt_wallstick_on_side"] = 0
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = false

        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0

        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = res["anim_length"]+5
        obj_char_other_side["projectile_inv"] = false
        obj_char_other_side["projectile_inv_countdown"] = 0
        -- state_number
        common_game_scene_char_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["pushbox_other_side_char_active"] = true
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][0]
        obj_char_other_side["collision_ground_height_offset"] = 0
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(obj_char_other_side,0,1)
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[4] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][1]
        -- draw_correction
        obj_char_other_side[8] = 1
    end
    res[8] = function()
        -- draw_correction
        obj_char_other_side[8] = 2
    end
    res[11] = function()
        -- state
        obj_char_other_side["y"] = 0
        obj_char_other_side["height"] = "stand"
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side[sprite_sheet][3]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][3]
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[14] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][4]
        -- draw_correction
        obj_char_other_side[8] = 4
    end
    res[18] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][5]
        -- draw_correction
        obj_char_other_side[8] = 5
    end
    res[20] = function()
        -- state
        obj_char_other_side["hurt_state_target"] = "idle"
    end
    res[21] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side[sprite_sheet][6]
        -- draw_correction
        obj_char_other_side[8] = 6
    end
    res[24] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side)
    end
    res[29] = function()
        -- animation_end
    end
    return res
end

-- wallstick_lead_to_wallbreak
function load_game_scene_anim_char_common_0_general_hurt_wallbreak(obj_char,projectile,adv)
    local res = {}
    local side = obj_char["player_side"]
    local obj_char_other_side = common_game_scene_change_character(side)
    res["prop_f"] = "f"
    res["anim_length"] = 1

    res[0] = function()
        obj_char_other_side["wallhurt_wallstickable"] = true
        obj_char_other_side["wallhurt_wallbreakable_with_wallstick"] = true
        obj_char_other_side["wallhurt_wallbreakable_without_wallstick"] = false
        obj_char_other_side["wallhurt_wallbreak_adv"] = adv
        
        if not projectile then
            common_game_scene_char_apply_damage_heat(
                obj_char,obj_char_other_side,"hurt",false
            )
        else
            common_game_scene_projectile_apply_damage_heat(
                obj_char,obj_char_other_side,"hurt",false,projectile
            )
        end
    end
    res[1] = function()
        -- animation_end
    end
    return res
end

-- active_common_move
-- burst_overdrive
    -- 需要修改的角色属性
        -- 我方
            -- sprite_sheet
            -- height
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
            -- velocity
            -- velocity_cache
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- damage_correction
            -- overdrive_gauge
            -- game_speed
            -- game_speed_subframe
            -- game_speed_abnormal_realtime_countdown
            -- hit_hurt_blockstop_countdown
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_ground_height_offset
            -- 8
            -- anchor_pos
        -- 对方
            -- game_speed
            -- game_speed_subframe
            -- game_speed_abnormal_realtime_countdown
function load_game_scene_anim_char_common_burst_overdrive(obj_char,other_side_countdown,overdrive_halved,character_uncommon_init)
    local res = {}
    local height = obj_char["height"]
    local obj_stage_main = obj_stage_game_scene_main
    local obj_camera = obj_stage_game_scene_camera
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local function update_move_overdrive_state()
        if obj_char_other_side["game_speed_force_0_countdown"] == 0 and obj_char["f"] >= 4 then
            obj_char["move_state"] = "recovery"
        end
        if obj_char["overdrive_gauge"][1] > 0 then
            obj_char["overdrive_gauge"][1] = 
            obj_char["overdrive_gauge"][1] - 24
        elseif obj_char["overdrive_gauge"][1] < 0 then
            obj_char["overdrive_gauge"][1] = 0
        end
    end
    res["prop_f"] = "f"
    res["anim_length"] = 70

    for i = 0,69 do
        res[i] = function()
            -- state
            update_move_overdrive_state()
        end
    end
    res[0] = function()
        -- state
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0

        obj_char["strike_inv"] = true
        obj_char["strike_inv_countdown"] = 70
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 70
        obj_char["projectile_inv"] = true
        obj_char["projectile_inv_countdown"] = 70
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["velocity_cache"] = {0,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        obj_char["physics_lock"] = true
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1

        obj_char["overdrive_gauge"][3] = "on"
        update_move_overdrive_state()

        play_obj_audio(audio_SFX_game_scene_overdrive)
        -- air_move
        obj_char["air_move"] = {}
        obj_char["air_move"]["jump"] = {1,1}
        obj_char["air_move"]["air_dash"] = {1,1}
        -- game_speed
        -- 设置为强制速度为1到动画结束
        common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,nil,69})

        obj_char["hit_hurt_blockstop_countdown"] = 0
        -- collide
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {} --{ 攻击类型 是投还是打， function值 内部为命中后的逻辑,具体的box形状}
        obj_char["hurtbox_table"] = {}
        obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char[8] = 0
        -- camera_animation_load
        common_game_scene_overdrive_load_camera_shake_anim(obj_char)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- camera_animation_application
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
        -- VFX
        insert_VFX_game_scene_char_overdrive_badge(obj_char)
        insert_VFX_game_scene_char_overdrive_partical(obj_char)
        insert_VFX_game_scene_char_overdrive_black_overlay(obj_char)
        -- character_uncommon_init
        character_uncommon_init(obj_char)
    end
    res[2] = function()
        -- state & state_number
        update_move_overdrive_state()
            -- idle状态下OD 恢复为3+13
            -- 攻击状态下OD 恢复为3+3
        -- game_speed
        -- 设置为强制速度为0到动画结束
        common_game_scene_game_speed_load_application(obj_char_other_side,{1,nil,nil,nil,other_side_countdown-2,nil})
    end
    res[4] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 1
    end
    res[8] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 2
    end
    res[12] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 3
    end
    res[28] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 4
    end
    res[30] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- VFX
        insert_VFX_game_scene_char_overdrive_airflow(obj_char)
    end
    res[32] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 5
    end
    res[35] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 6
    end
    res[38] = function()
        -- state & state_number
        update_move_overdrive_state()
        local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
        if overdrive_halved then
            if obj_char["health_gauge"][1]/obj_char["health_gauge"][3] > 0.85 then
                obj_char["overdrive_timer"] = {0,2,0,0}
            elseif obj_char["health_gauge"][1]/obj_char["health_gauge"][3] > 0.60 then
                obj_char["overdrive_timer"] = {0,3,0,0}
            elseif obj_char["health_gauge"][1]/obj_char["health_gauge"][3] > 0.45 then
                obj_char["overdrive_timer"] = {0,4,0,0}
            elseif obj_char["health_gauge"][1]/obj_char["health_gauge"][3] > 0.35 then
                obj_char["overdrive_timer"] = {0,5,0,0}
            else
                obj_char["overdrive_timer"] = {0,6,0,0}
            end
        else
            if obj_char["health_gauge"][1]/obj_char["health_gauge"][3] > 0.85 then
                obj_char["overdrive_timer"] = {0,4,0,0}
            elseif obj_char["health_gauge"][1]/obj_char["health_gauge"][3] > 0.60 then
                obj_char["overdrive_timer"] = {0,6,0,0}
            elseif obj_char["health_gauge"][1]/obj_char["health_gauge"][3] > 0.45 then
                obj_char["overdrive_timer"] = {0,8,0,0}
            elseif obj_char["health_gauge"][1]/obj_char["health_gauge"][3] > 0.35 then
                obj_char["overdrive_timer"] = {1,0,0,0}
            else
                obj_char["overdrive_timer"] = {1,2,0,0}
            end
        end
        obj_char["overdrive_gauge"][3] = "on"
        -- draw_correction
        obj_char[8] = 7
    end
    res[41] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 5
    end
    res[44] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 6
    end
    res[47] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 7
    end
    res[50] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 5
    end
    res[53] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 6
    end
    res[56] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 7
    end
    res[60] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
        -- draw_correction
        obj_char[8] = 8
    end
    res[65] = function()
        -- state & state_number
        update_move_overdrive_state()
        -- draw_correction
        obj_char[8] = 9
    end
    res[70] = function()
        -- animation end
    end
    return res
end

-- RC
-- logic attack by projectile
-- 需要修改的角色属性
    -- 我方
        -- sprite_sheet
        -- height
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
        -- velocity
        -- velocity_cache
        -- gravity
        -- friction
        -- horizontal_velocity_correction
        -- gravity_correction
        -- damage_correction
        -- overdrive_gauge
        -- game_speed
        -- game_speed_subframe
        -- game_speed_abnormal_realtime_countdown
        -- hit_hurt_blockstop_countdown
        -- pushbox
        -- hitbox_table
        -- hurtbox_table
        -- collision_ground_height_offset
        -- 8
        -- anchor_pos
    -- 对方
        -- game_speed
        -- game_speed_subframe
        -- game_speed_abnormal_realtime_countdown
function load_game_scene_anim_char_common_burst_RC_red(obj_char,character_uncommon_update)
    local res = {}
    local side = obj_char["player_side"]
    local height = obj_char["height"]
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local pushbox_data = common_game_scene_get_pushbox(side)
    local hurtbox_data = common_game_scene_get_hurtbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local goal_heat_gauge_remain = math.max(0,obj_char["heat_gauge"][1]-100)
    local function update_heat_gauge_state()
        if obj_char["heat_gauge"][1] > goal_heat_gauge_remain then
            obj_char["heat_gauge"][1] = obj_char["heat_gauge"][1] - 5
        end
    end
    local function update_state()
        -- move_state
        if obj_char_other_side["game_speed_force_0_countdown"] == 0 and obj_char["f"] >= 26 then
            obj_char["move_state"] = "recovery"
        end
        if height ~= obj_char["height"] then
            return
        end
        -- height
        if height == "air" and collision_test_char_on_ground(obj_char) then
            obj_char["y"] = 0
            obj_char["height"] = "stand"
            obj_char["sprite_sheet"] = "burst_rc_ground"
            obj_char["pushbox"]  = pushbox_data["RC"]["stand"]
            obj_char["anchor_pos"] = anchor_data["RC"]["stand"]
            obj_char["collision_ground_height_offset"] = 0
        elseif height ~= "air" and not collision_test_char_on_ground(obj_char) then
            obj_char["height"] = "air"
            obj_char["sprite_sheet"] = "burst_overdrive_rc_air"
            obj_char["pushbox"]  = pushbox_data["RC"]["air"]
            obj_char["anchor_pos"] = anchor_data["RC"]["air"]
            obj_char["collision_ground_height_offset"] = 185
        end
        character_uncommon_update(obj_char)
    end
    
    res["prop_f"] = "f"
    res["anim_length"] = 45
    for i = 0,44 do
        res[i] = function()
            -- state
            update_state()
        end
    end
    for i = 0,24 do
        res[i] = function()
            -- state
            update_state()
            update_heat_gauge_state()
        end
    end
    res[0] = function()
        -- state
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0

        obj_char["idle_cancel"] = false
        update_state()

        obj_char["strike_inv"] = true
        obj_char["strike_inv_countdown"] = res["anim_length"]
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = res["anim_length"]
        obj_char["projectile_inv"] = true
        obj_char["projectile_inv_countdown"] = res["anim_length"]
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
        -- state_number
        obj_char["friction"] = 0
        obj_char["gravity"] = 0
        obj_char["physics_lock"] = false
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        update_heat_gauge_state()
        -- air_move
        obj_char["air_move"] = {}
        obj_char["air_move"]["jump"] = {1,1}
        obj_char["air_move"]["air_dash"] = {1,1}
        -- game_speed
        -- 设置为强制速度到动画结束
        common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,nil,44})
        common_game_scene_game_speed_load_application(obj_char_other_side,{1,nil,nil,nil,44,nil})
        -- collide
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {} --{ 攻击类型 是投还是打， function值 内部为命中后的逻辑,具体的box形状}
        obj_char["hurtbox_table"] = {}
        -- draw_correction
        obj_char[8] = 0
        -- VFX
        obj_char["VFX_hit_front_table"] = {}
        obj_char["VFX_hit_back_table"] = {}
        obj_char_other_side["VFX_hit_front_table"] = {}
        obj_char_other_side["VFX_hit_back_table"] = {}
        insert_VFX_game_scene_char_RC_badge(obj_char,image_sprite_sheet_VFX_game_scene_RC_red_badge)
        insert_VFX_game_scene_char_RC_partical(obj_char)
        insert_VFX_game_scene_char_RC_black_overlay(obj_char)
    end
    res[3] = function()
        -- state&state_number
        update_state()
        update_heat_gauge_state()
        -- draw_correction
        obj_char[8] = 1
    end
    res[7] = function()
        -- state&state_number
        obj_char["idle_cancel"] = true
        update_state()
        update_heat_gauge_state()
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- draw_correction
        obj_char[8] = 2
    end
    res[13] = function()
        -- state&state_number
        update_state()
        update_heat_gauge_state()
        -- draw_correction
        obj_char[8] = 3
    end
    res[24] = function()
        -- state&state_number
        obj_char["idle_cancel"] = false
        update_state()
        update_heat_gauge_state()
    end
    res[26] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 4
        -- projectile
        insert_projectile_game_scene_char_common_RC_shockwave_red(obj_char)
    end
    res[27] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 5
    end
    res[31] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 6
    end
    res[35] = function()
        -- state
        update_state()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
        -- draw_correction
        obj_char[8] = 7
    end
    res[39] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 8
    end
    res[42] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 9
    end
    res[45] = function()
        -- aniamtion_end
    end
    return res
end
function load_game_scene_anim_char_common_burst_RC_blue(obj_char,character_uncommon_update)
    local res = {}
    local side = obj_char["player_side"]
    local height = obj_char["height"]
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local pushbox_data = common_game_scene_get_pushbox(side)
    local hurtbox_data = common_game_scene_get_hurtbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local goal_heat_gauge_remain = math.max(0,obj_char["heat_gauge"][1]-100)
    local function update_heat_gauge_state()
        if obj_char["heat_gauge"][1] > goal_heat_gauge_remain then
            obj_char["heat_gauge"][1] = obj_char["heat_gauge"][1] - 5
        end
    end
    local function update_state()
        -- move_state
        if obj_char_other_side["game_speed_force_0_countdown"] == 0 and obj_char["f"] >= 26 then
            obj_char["move_state"] = "recovery"
        end
        if height ~= obj_char["height"] then
            return
        end
        -- height
        if height == "air" and collision_test_char_on_ground(obj_char) then
            obj_char["y"] = 0
            obj_char["height"] = "stand"
            obj_char["sprite_sheet"] = "burst_rc_ground"
            obj_char["pushbox"]  = pushbox_data["RC"]["stand"]
            obj_char["anchor_pos"] = anchor_data["RC"]["stand"]
            obj_char["collision_ground_height_offset"] = 0
        elseif height ~= "air" and not collision_test_char_on_ground(obj_char) then
            obj_char["height"] = "air"
            obj_char["sprite_sheet"] = "burst_overdrive_rc_air"
            obj_char["pushbox"]  = pushbox_data["RC"]["air"]
            obj_char["anchor_pos"] = anchor_data["RC"]["air"]
            obj_char["collision_ground_height_offset"] = 185
        end
        character_uncommon_update(obj_char)
    end
    
    res["prop_f"] = "f"
    res["anim_length"] = 45
    for i = 0,44 do
        res[i] = function()
            -- state
            update_state()
        end
    end
    for i = 0,24 do
        res[i] = function()
            -- state
            update_state()
            update_heat_gauge_state()
        end
    end
    for i = 0,4 do
        res[i] = function()
            -- state
            update_state()
            update_heat_gauge_state()
            -- collide
            obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        end
    end
    res[0] = function()
        -- state
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0

        obj_char["idle_cancel"] = false
        update_state()

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 5
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
        -- state_number
        obj_char["friction"] = 0
        obj_char["gravity"] = 0
        obj_char["physics_lock"] = false
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        update_heat_gauge_state()
        -- air_move
        obj_char["air_move"] = {}
        obj_char["air_move"]["jump"] = {1,1}
        obj_char["air_move"]["air_dash"] = {1,1}
        -- collide
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {} --{ 攻击类型 是投还是打， function值 内部为命中后的逻辑,具体的box形状}
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        -- draw_correction
        obj_char[8] = 0
        -- VFX
        obj_char["VFX_hit_front_table"] = {}
        obj_char["VFX_hit_back_table"] = {}
        obj_char_other_side["VFX_hit_front_table"] = {}
        obj_char_other_side["VFX_hit_back_table"] = {}
        insert_VFX_game_scene_char_RC_badge(obj_char,image_sprite_sheet_VFX_game_scene_RC_blue_badge)
        insert_VFX_game_scene_char_RC_partical(obj_char)
        insert_VFX_game_scene_char_RC_black_overlay(obj_char)
    end
    res[3] = function()
        -- state&state_number
        update_state()
        update_heat_gauge_state()
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        -- draw_correction
        obj_char[8] = 1
    end
    res[5] = function()
        -- state&state_number
        update_state()
        update_heat_gauge_state()
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["strike_inv"] = true
        obj_char["strike_inv_countdown"] = 40
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 40
        obj_char["projectile_inv"] = true
        obj_char["projectile_inv_countdown"] = 40
        -- collide
        obj_char["hurtbox_table"] = {}
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- game_speed
        -- 设置为强制速度到动画结束
        common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,nil,39})
        common_game_scene_game_speed_load_application(obj_char_other_side,{1,nil,nil,nil,39,nil})
    end
    res[7] = function()
        update_state()
        update_heat_gauge_state()
        -- draw_correction
        obj_char[8] = 2
    end
    res[10] = function()
        -- state&state_number
        obj_char["idle_cancel"] = true
        update_state()
        update_heat_gauge_state()
    end
    res[13] = function()
        -- state&state_number
        update_state()
        update_heat_gauge_state()
        -- draw_correction
        obj_char[8] = 3
    end
    res[24] = function()
        -- state&state_number
        obj_char["idle_cancel"] = false
        update_state()
        update_heat_gauge_state()
    end
    res[26] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 4
        -- projectile
        insert_projectile_game_scene_char_common_RC_shockwave_blue(obj_char)
    end
    res[27] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 5
    end
    res[31] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 6
    end
    res[35] = function()
        -- state
        update_state()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
        -- draw_correction
        obj_char[8] = 7
    end
    res[39] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 8
    end
    res[42] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 9
    end
    res[45] = function()
        -- aniamtion_end
    end
    return res
end
function load_game_scene_anim_char_common_burst_RC_purple(obj_char,character_uncommon_update)
    local res = {}
    local side = obj_char["player_side"]
    local height = obj_char["height"]
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local pushbox_data = common_game_scene_get_pushbox(side)
    local hurtbox_data = common_game_scene_get_hurtbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local goal_heat_gauge_remain = math.max(0,obj_char["heat_gauge"][1]-100)
    local function update_heat_gauge_state()
        if obj_char["heat_gauge"][1] > goal_heat_gauge_remain then
            obj_char["heat_gauge"][1] = obj_char["heat_gauge"][1] - 5
        end
    end
    local function update_state()
        -- move_state
        if obj_char_other_side["game_speed_force_0_countdown"] == 0 and obj_char["f"] >= 26 then
            obj_char["move_state"] = "recovery"
        end
        if height ~= obj_char["height"] then
            return
        end
        -- height
        if height == "air" and collision_test_char_on_ground(obj_char) then
            obj_char["y"] = 0
            obj_char["height"] = "stand"
            obj_char["sprite_sheet"] = "burst_rc_ground"
            obj_char["pushbox"]  = pushbox_data["RC"]["stand"]
            obj_char["anchor_pos"] = anchor_data["RC"]["stand"]
            obj_char["collision_ground_height_offset"] = 0
        elseif height ~= "air" and not collision_test_char_on_ground(obj_char) then
            obj_char["height"] = "air"
            obj_char["sprite_sheet"] = "burst_overdrive_rc_air"
            obj_char["pushbox"]  = pushbox_data["RC"]["air"]
            obj_char["anchor_pos"] = anchor_data["RC"]["air"]
            obj_char["collision_ground_height_offset"] = 185
        end
        character_uncommon_update(obj_char)
    end
    
    res["prop_f"] = "f"
    res["anim_length"] = 45
    for i = 0,44 do
        res[i] = function()
            -- state
            update_state()
        end
    end
    for i = 0,24 do
        res[i] = function()
            -- state
            update_state()
            update_heat_gauge_state()
        end
    end
    for i = 0,4 do
        res[i] = function()
            -- state
            update_state()
            update_heat_gauge_state()
            -- collide
            obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        end
    end
    res[0] = function()
        -- state
        obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0

        obj_char["idle_cancel"] = false
        update_state()

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 5
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
        -- state_number
        obj_char["friction"] = 0
        obj_char["gravity"] = 0
        obj_char["physics_lock"] = false
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        update_heat_gauge_state()
        -- air_move
        obj_char["air_move"] = {}
        obj_char["air_move"]["jump"] = {1,1}
        obj_char["air_move"]["air_dash"] = {1,1}
        -- collide
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {} --{ 攻击类型 是投还是打， function值 内部为命中后的逻辑,具体的box形状}
        obj_char["hurtbox_table"] = {}
        -- draw_correction
        obj_char[8] = 0
        -- VFX
        obj_char["VFX_hit_front_table"] = {}
        obj_char["VFX_hit_back_table"] = {}
        obj_char_other_side["VFX_hit_front_table"] = {}
        obj_char_other_side["VFX_hit_back_table"] = {}
        insert_VFX_game_scene_char_RC_badge(obj_char,image_sprite_sheet_VFX_game_scene_RC_purple_badge)
        insert_VFX_game_scene_char_RC_partical(obj_char)
        insert_VFX_game_scene_char_RC_black_overlay(obj_char)
    end
    res[3] = function()
        -- state&state_number
        update_state()
        update_heat_gauge_state()
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        -- draw_correction
        obj_char[8] = 1
    end
    res[5] = function()
        -- state&state_number
        update_state()
        update_heat_gauge_state()
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["strike_inv"] = true
        obj_char["strike_inv_countdown"] = 40
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 40
        obj_char["projectile_inv"] = true
        obj_char["projectile_inv_countdown"] = 40
        -- collide
        obj_char["hurtbox_table"] = {}
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- game_speed
        -- 设置为强制速度到动画结束
        common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,nil,39})
        common_game_scene_game_speed_load_application(obj_char_other_side,{1,nil,nil,nil,39,nil})
    end
    res[7] = function()
        update_state()
        update_heat_gauge_state()
        -- draw_correction
        obj_char[8] = 2
    end
    res[10] = function()
        -- state&state_number
        obj_char["idle_cancel"] = true
        update_state()
        update_heat_gauge_state()
    end
    res[13] = function()
        -- state&state_number
        update_state()
        update_heat_gauge_state()
        -- draw_correction
        obj_char[8] = 3
    end
    res[16] = function()
        -- state&state_number
        update_state()
        update_heat_gauge_state()
    end
    res[24] = function()
        -- state&state_number
        obj_char["idle_cancel"] = false
        update_state()
        update_heat_gauge_state()
    end
    res[26] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 4
        -- projectile
        insert_projectile_game_scene_char_common_RC_shockwave_purple(obj_char)
    end
    res[27] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 5
    end
    res[31] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 6
    end
    res[35] = function()
        -- state
        update_state()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
        -- draw_correction
        obj_char[8] = 7
    end
    res[39] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 8
    end
    res[42] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 9
    end
    res[45] = function()
        -- aniamtion_end
    end
    return res
end
function load_game_scene_anim_char_common_burst_RC_yellow(obj_char,character_uncommon_update)
    local res = {}
    local side = obj_char["player_side"]
    local height = obj_char["height"]
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local pushbox_data = common_game_scene_get_pushbox(side)
    local hurtbox_data = common_game_scene_get_hurtbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local goal_heat_gauge_remain = math.max(0,obj_char["heat_gauge"][1]-100)
    local function update_heat_gauge_state()
        if obj_char["heat_gauge"][1] > goal_heat_gauge_remain then
            obj_char["heat_gauge"][1] = obj_char["heat_gauge"][1] - 5
        end
    end
    local function update_state()
        -- move_state
        if obj_char_other_side["game_speed_force_0_countdown"] == 0 and obj_char["f"] >= 26 then
            obj_char["move_state"] = "recovery"
        end
        if height ~= obj_char["height"] then
            return
        end
        -- height
        if height == "air" and collision_test_char_on_ground(obj_char) then
            obj_char["y"] = 0
            obj_char["height"] = "stand"
            obj_char["sprite_sheet"] = "burst_rc_ground"
            obj_char["pushbox"]  = pushbox_data["RC"]["stand"]
            obj_char["anchor_pos"] = anchor_data["RC"]["stand"]
            obj_char["collision_ground_height_offset"] = 0
        elseif height ~= "air" and not collision_test_char_on_ground(obj_char) then
            obj_char["height"] = "air"
            obj_char["sprite_sheet"] = "burst_overdrive_rc_air"
            obj_char["pushbox"]  = pushbox_data["RC"]["air"]
            obj_char["anchor_pos"] = anchor_data["RC"]["air"]
            obj_char["collision_ground_height_offset"] = 185
        end
        character_uncommon_update(obj_char)
    end
    
    res["prop_f"] = "f"
    res["anim_length"] = 75
    for i = 0,75 do
        res[i] = function()
            -- state
            update_state()
        end
    end
    for i = 0,24 do
        res[i] = function()
            -- state
            update_state()
            update_heat_gauge_state()
        end
    end
    for i = 42,75 do
        res[i] = function()
            -- state
            update_state()
            update_heat_gauge_state()
            -- collide
            obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        end
    end
    res[0] = function()
        -- state
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0

        obj_char["idle_cancel"] = false
        update_state()

        obj_char["strike_inv"] = true
        obj_char["strike_inv_countdown"] = 42
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 42
        obj_char["projectile_inv"] = true
        obj_char["projectile_inv_countdown"] = 42
        -- input_sys_cache
        obj_char["input_sys_state"] = "none" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
        -- state_number
        obj_char["friction"] = 0
        obj_char["gravity"] = 0
        obj_char["physics_lock"] = false
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        update_heat_gauge_state()
        -- air_move
        obj_char["air_move"] = {}
        obj_char["air_move"]["jump"] = {1,1}
        obj_char["air_move"]["air_dash"] = {1,1}
        -- collide
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {} --{ 攻击类型 是投还是打， function值 内部为命中后的逻辑,具体的box形状}
        obj_char["hurtbox_table"] = {}
        -- draw_correction
        obj_char[8] = 0
        -- VFX
        obj_char["VFX_hit_front_table"] = {}
        obj_char["VFX_hit_back_table"] = {}
        obj_char_other_side["VFX_hit_front_table"] = {}
        obj_char_other_side["VFX_hit_back_table"] = {}
        insert_VFX_game_scene_char_RC_badge(obj_char,image_sprite_sheet_VFX_game_scene_RC_yellow_badge)
        insert_VFX_game_scene_char_RC_partical(obj_char)
        insert_VFX_game_scene_char_RC_black_overlay(obj_char)
    end
    res[3] = function()
        -- state&state_number
        update_state()
        update_heat_gauge_state()
        -- draw_correction
        obj_char[8] = 1
    end
    res[7] = function()
        update_state()
        update_heat_gauge_state()
        -- draw_correction
        obj_char[8] = 2
    end
    res[13] = function()
        -- state&state_number
        update_state()
        update_heat_gauge_state()
        -- game_speed
        -- 设置为强制速度到动画结束
        common_game_scene_game_speed_load_application(obj_char,{1,nil,nil,nil,nil,28})
        common_game_scene_game_speed_load_application(obj_char_other_side,{1,nil,nil,nil,28,nil})
        -- draw_correction
        obj_char[8] = 3
    end
    res[26] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 4
        -- projectile
        insert_projectile_game_scene_char_common_RC_shockwave_yellow(obj_char)
    end
    res[27] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 5
    end
    res[31] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 6
    end
    res[35] = function()
        -- state
        update_state()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char)
        -- draw_correction
        obj_char[8] = 7
    end
    res[39] = function()
        -- state
        update_state()
        -- draw_correction
        obj_char[8] = 5
    end
    res[42] = function()
        -- time_continue_frame_0
        -- state
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        update_state()
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
    end
    res[43] = function()
        -- state
        update_state()
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        -- draw_correction
        obj_char[8] = 6
    end
    res[47] = function()
        -- state
        update_state()
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        -- draw_correction
        obj_char[8] = 7
    end
    res[51] = function()
        -- state
        update_state()
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        -- draw_correction
        obj_char[8] = 5
    end
    res[55] = function()
        -- state
        update_state()
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        -- draw_correction
        obj_char[8] = 6
    end
    res[59] = function()
        -- state
        update_state()
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        -- draw_correction
        obj_char[8] = 7
    end
    res[63] = function()
        -- state
        update_state()
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        -- draw_correction
        obj_char[8] = 5
    end
    res[67] = function()
        -- state
        update_state()
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        -- draw_correction
        obj_char[8] = 6
    end
    res[69] = function()
        -- state
        update_state()
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        -- draw_correction
        obj_char[8] = 8
    end
    res[72] = function()
        -- state
        update_state()
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data["RC"][obj_char["height"]]
        -- draw_correction
        obj_char[8] = 9
    end
    res[75] = function()
        -- aniamtion_end
    end
    return res
end
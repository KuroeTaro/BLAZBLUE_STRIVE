    -- hit_side_obj_char,
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
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 95
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        hurt_side_obj_char["velocity"] = {0,0}
        hurt_side_obj_char["friction"] = 10
        hurt_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = true
        hurt_side_obj_char["strike_inv_countdown"] = 1000
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1000
        hurt_side_obj_char["projectile_inv"] = true
        hurt_side_obj_char["projectile_inv_countdown"] = 1000
        hurt_side_obj_char["horizontal_velocity_correction"] = 1
        hurt_side_obj_char["gravity_correction"] = 1
        hurt_side_obj_char["damage_correction"] = 1
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 0
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[11] = function()
        -- state
        hurt_side_obj_char["height"] = "crouch" -- stand crouch air OTG wallstick
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][1]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[20] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[31] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[37] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end
    res[44] = function()
        -- sub_obj_table
        insert_VFX_game_scene_stage_smoke_land_blow(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,1,1,0
        )
        -- draw_correction
        hurt_side_obj_char[8] = 5
    end
    res[49] = function()
        -- state_number
        hurt_side_obj_char["velocity"][1] = 6.0*hurt_side_obj_char[5]
        -- draw_correction
        hurt_side_obj_char[8] = 6
    end
    res[78] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 7
    end
    res[84] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- draw_correction
        hurt_side_obj_char[8] = 8
    end
    res[89] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 9
    end
    res[93] = function()
        -- state
        hurt_side_obj_char["height"] = "OTG" -- stand crouch air OTG wallstick
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][10]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][10]
        -- draw_correction
        hurt_side_obj_char[8] = 10
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
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 13
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[8] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[9] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[11] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        -- draw_correction
        hurt_side_obj_char[8] = 0
    end
    res[13] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_hurt_lv1(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 15
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[10] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[11] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[13] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        -- draw_correction
        hurt_side_obj_char[8] = 0
    end
    res[15] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_hurt_lv2(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 17
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[12] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[13] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[15] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        -- draw_correction
        hurt_side_obj_char[8] = 0
    end
    res[17] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_hurt_lv3(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 20
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[15] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[16] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[18] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        -- draw_correction
        hurt_side_obj_char[8] = 0
    end
    res[20] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_hurt_lv4(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 22
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[17] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[18] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[20] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        -- draw_correction
        hurt_side_obj_char[8] = 0
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
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 10
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        local hurt_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side]
        local FD_block = test_input_sys_press_or_hold(hurt_side_input["correction_left"]) or test_input_sys_press_or_hold(hurt_side_input["correction_right"])
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,FD_block,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"block",FD_block
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 5
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[5] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[6] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[8] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 0
    end
    res[10] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_block_lv1(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 12
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        local hurt_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side]
        local FD_block = test_input_sys_press_or_hold(hurt_side_input["correction_left"]) or test_input_sys_press_or_hold(hurt_side_input["correction_right"])
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,FD_block,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"block",FD_block
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 5
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[6] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[7] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[9] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[10] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 0
    end
    res[12] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_block_lv2(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 14
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        local hurt_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side]
        local FD_block = test_input_sys_press_or_hold(hurt_side_input["correction_left"]) or test_input_sys_press_or_hold(hurt_side_input["correction_right"])
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,FD_block,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"block",FD_block
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 5
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[6] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[9] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[12] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 0
    end
    res[14] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_block_lv3(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 17
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        local hurt_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side]
        local FD_block = test_input_sys_press_or_hold(hurt_side_input["correction_left"]) or test_input_sys_press_or_hold(hurt_side_input["correction_right"])
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,FD_block,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"block",FD_block
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 5
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end
    res[6] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[9] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[12] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[14] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 0
    end
    res[17] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_ground_block_lv4(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 19
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        local hurt_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side]
        local FD_block = test_input_sys_press_or_hold(hurt_side_input["correction_left"]) or test_input_sys_press_or_hold(hurt_side_input["correction_right"])
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,FD_block,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"block",FD_block
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 5
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end
    res[6] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[9] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[12] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[14] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[16] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 0
    end
    res[19] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_air_block(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local function update_before_land()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        if collision_test_char_on_ground(hurt_side_obj_char) then
            -- state
            hurt_side_obj_char["y"] = 0
            hurt_side_obj_char["f"] = 13
            hurt_side_obj_char["height"]  = "stand"
            -- state_number
            hurt_side_obj_char["velocity"][2] = 0
            hurt_side_obj_char["gravity"] = 2.5
            -- enemy_friend_interaction
            hurt_side_obj_char["throw_inv"] = true
            hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5-13
            -- collide
            hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][6]
            hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][6]
            hurt_side_obj_char["collision_ground_height_offset"] = 0
            -- draw_correction
            hurt_side_obj_char[8] = 6
            -- insert_VFX
            insert_VFX_game_scene_stage_smoke_land_blow(
                hurt_side_obj_char,
                hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
                hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
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
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        local hurt_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side]
        local FD_block = test_input_sys_press_or_hold(hurt_side_input["correction_left"]) or test_input_sys_press_or_hold(hurt_side_input["correction_right"])
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,FD_block,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"block",FD_block
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        hurt_side_obj_char[8] = 5
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
        -- update
        update_before_land()
    end
    res[6] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
        -- update
        update_before_land()
    end
    res[9] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_before_land()
    end
    res[12] = function()
        -- state
        hurt_side_obj_char["f"] = 3
        -- draw_correction
        hurt_side_obj_char[8] = 4
        -- update
        update_before_land()
    end
    res[13] = function()
        -- land animation start
    end
    res[16] = function()
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][6]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][6]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 6
    end
    res[22] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][7]
        -- draw_correction
        hurt_side_obj_char[8] = 7
    end
    res[27] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[28] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][8]
        -- draw_correction
        hurt_side_obj_char[8] = 8
    end
    res[32] = function()
        -- animation end
    end
    return res
end
-- teching&teched
function load_game_scene_anim_char_common_0_Launcher_throw_tech(
    hit_side_obj_char,hurt_side_obj_char,teching_or_teched
)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local sprite_sheet = nil
    local pushbox = nil
    local collision_ground_height_offset = nil
    local velocity = nil
    local function update_1f_15f_air(i)
        -- state_number
        if hit_side_obj_char["height"] == "air" then
            hit_side_obj_char["velocity"][1] = -hit_side_obj_char[5]*(32-2*i)
        end
    end
    res["prop_f"] = "f"
    res["anim_length"] = 30
    if hit_side_obj_char["height"] == "air" then
        hit_side_obj_char["y"] = math.min(hit_side_obj_char["y"],-240)
        if teching_or_teched == "teching" then
            sprite_sheet = "0_air_Launcher_teching"
        elseif teching_or_teched == "teched" then
            sprite_sheet = "0_air_Launcher_teched"
        end
        velocity = {-hit_side_obj_char[5]*32,-37.5}
        pushbox = hurt_side_pushbox_data["1_4_7_air_block"][0]
        collision_ground_height_offset = 185
    else
        hit_side_obj_char["y"] = 0
        if teching_or_teched == "teching" then
            sprite_sheet = "0_ground_Launcher_teching"
        elseif teching_or_teched == "teched" then
            sprite_sheet = "0_ground_Launcher_teched"
        end
        velocity = {-hit_side_obj_char[5]*60,0}
        pushbox = hurt_side_pushbox_data["4_stand_block_high"][0]
        collision_ground_height_offset = 0
    end
    for i=1,15 do
        res[i] = function()
            update_1f_15f_air(i)
        end
    end
    res[0] = function()
        -- state
        hit_side_obj_char["sprite_sheet"] = sprite_sheet
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        hit_side_obj_char["velocity"] = velocity
        hit_side_obj_char["velocity_cache"] = {0,0}
        hit_side_obj_char["friction"] = 5 -- 包括地面移动和空中dash的水平阻力
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hit_side_obj_char["wallhurt_wallstickable"] = false
        hit_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hit_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hit_side_obj_char["wallhurt_wallbreak_adv"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_inv"] = true
        hit_side_obj_char["strike_inv_countdown"] = 30
        hit_side_obj_char["throw_inv"] = true
        hit_side_obj_char["throw_inv_countdown"] = 30
        hit_side_obj_char["projectile_inv"] = true
        hit_side_obj_char["projectile_inv_countdown"] = 30
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- collide
        hit_side_obj_char["pushbox"] = pushbox
        hit_side_obj_char["pushbox_opponent_collision_active"] = false
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {}
        hit_side_obj_char["collision_ground_height_offset"] = collision_ground_height_offset
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert VFX
        if teching_or_teched == "teching" then
            insert_VFX_game_scene_char_throw_tech(
                hit_side_obj_char,hurt_side_obj_char,
                -450,-900,1,1.2,1.2,0
            )
        end
        if hit_side_obj_char["height"] ~= "air" then
            insert_VFX_game_scene_stage_smoke_horizontal_shot(
                hit_side_obj_char,
                hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
                hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
                0.5,1,1,0
            )
        end
        -- update
        update_1f_15f_air(0)
    end
    res[3] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
        -- update
        update_1f_15f_air(3)
    end
    res[7] = function()
        -- draw_correction
        hit_side_obj_char[8] = 2
        -- update
        update_1f_15f_air(7)
    end
    res[24] = function()
        -- draw_correction
        hit_side_obj_char[8] = 3
    end
    res[25] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[28] = function()
        -- draw_correction
        hit_side_obj_char[8] = 4
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
    local side = obj_char["player_side"]
    local pushbox_data = common_game_scene_get_pushbox(side)
    local hurtbox_data = common_game_scene_get_hurtbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(side)
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    local sprite_sheet = "0_general_hurt_soft_knockdown_wallstick_air"
    res["prop_f"] = "f"
    res["anim_length"] = 60
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = sprite_sheet
        obj_char["height"] = "wallstick" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["velocity_debug"] = {0,0}
        obj_char["velocity_cache"] = {0,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 0
        -- enemy_friend_interaction
        obj_char["self_knockdown_recovery_animation"] =
        load_game_scene_anim_char_common_0_general_hurt_soft_recovery_wallstick_air(obj_char)
        obj_char["idle_cancel"] = false
        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = res["anim_length"]+5
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        -- collide
        obj_char["pushbox"] = pushbox_data[sprite_sheet][0]
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][0]
        obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = anchor_data[sprite_sheet]
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["wall_wallstick"])
    end
    res[1] = function()
        -- state
        obj_char["state_cache"] = "knockdown_recovery_wallstick"
    end
    res[55] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(side)(obj_char)
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
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local hurt_side_stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 25
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_knockdown_velocity(
            hit_side_obj_char,hurt_side_obj_char,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 0
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_land_blow(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,1,1,0
        )
        -- play_SFX
        play_obj_audio(hurt_side_stage_interactive_SFX_table["ground_hard_knockdown"])
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[6] = function()
        -- state
        hurt_side_obj_char["velocity"][2] = -5.0
        hurt_side_obj_char["height"] = "OTG" -- stand crouch air OTG wallstick
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][2]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[8] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[11] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end
    res[14] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 5
    end
    res[18] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][6]
        -- draw_correction
        hurt_side_obj_char[8] = 6
    end
    res[21] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 7
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_head_down(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local hurt_side_stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 25
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_knockdown_velocity(
            hit_side_obj_char,hurt_side_obj_char,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 0
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_land_blow(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,1,1,0
        )
        -- play_SFX
        play_obj_audio(hurt_side_stage_interactive_SFX_table["ground_hard_knockdown"])
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[6] = function()
        -- state
        hurt_side_obj_char["velocity"][2] = -5.0
        hurt_side_obj_char["height"] = "OTG" -- stand crouch air OTG wallstick
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][2]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[8] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[11] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end
    res[14] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 5
    end
    res[18] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][6]
        -- draw_correction
        hurt_side_obj_char[8] = 6
    end
    res[21] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 7
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_up(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local hurt_side_stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 25
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_knockdown_velocity(
            hit_side_obj_char,hurt_side_obj_char,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 0
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_land_blow(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,1,1,0
        )
        -- play_SFX
        play_obj_audio(hurt_side_stage_interactive_SFX_table["ground_hard_knockdown"])
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[6] = function()
        -- state
        hurt_side_obj_char["velocity"][2] = -5.0
        hurt_side_obj_char["height"] = "OTG" -- stand crouch air OTG wallstick
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][2]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[8] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[11] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end
    res[14] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 5
    end
    res[18] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][6]
        -- draw_correction
        hurt_side_obj_char[8] = 6
    end
    res[21] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 7
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_wallstick_ground(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local pushbox_data = common_game_scene_get_pushbox(side)
    local hurtbox_data = common_game_scene_get_hurtbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(side)
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    local sprite_sheet = "0_general_hurt_hard_knockdown_wallstick_ground"
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
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["velocity_debug"] = {0,0}
        obj_char["velocity_cache"] = {0,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 0
        -- enemy_friend_interaction
        obj_char["self_knockdown_recovery_animation"] =
        load_game_scene_anim_char_common_0_general_hurt_hard_recovery_wallstick_ground(obj_char)
        obj_char["idle_cancel"] = false
        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = res["anim_length"]+5
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        -- collide
        obj_char["pushbox"] = pushbox_data[sprite_sheet][0]
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][0]
        obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = anchor_data[sprite_sheet]
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["wall_wallstick"])
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
        obj_char["pushbox"] = pushbox_data[sprite_sheet][3]
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][3]
        obj_char[8] = 3
        insert_VFX_game_scene_stage_smoke_land_blow(
            obj_char,
            VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,1,1,0
        )
    end
    res[72] = function()
        -- state
        obj_char["pushbox"] = pushbox_data[sprite_sheet][4]
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][4]
        obj_char[8] = 4
    end
    res[75] = function()
        -- draw_correction
        obj_char[8] = 5
    end
    res[85] = function()
        -- animation end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_wallbreak(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local sprite_sheet = "0_general_hurt_hard_knockdown_up"
    res["prop_f"] = "f"
    res["anim_length"] = 7
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = "OTG" -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["self_knockdown_animation"] = nil
        hurt_side_obj_char["self_knockdown_recovery_animation"] =
        load_game_scene_anim_char_common_0_general_hurt_hard_recovery_up(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_hard_recovery_up",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        )
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][2]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = {}
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 7
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = "knockdown_recovery"
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
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 30
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        hurt_side_obj_char["air_move"]["jump"][1] = hurt_side_obj_char["air_move"]["jump"][2]
        hurt_side_obj_char["air_move"]["air_dash"][1] = hurt_side_obj_char["air_move"]["air_dash"][2]
        -- state_number
        hurt_side_obj_char["velocity"] = {0,0}
        hurt_side_obj_char["friction"] = 1
        hurt_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        hurt_side_obj_char["horizontal_velocity_correction"] = 1
        hurt_side_obj_char["gravity_correction"] = 1
        hurt_side_obj_char["damage_correction"] = 1
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 0
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[5] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[7] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[10] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end
    res[15] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 5
    end
    res[20] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 6
    end
    res[24] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 7
    end
    res[25] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[27] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 8
    end
    res[30] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_hard_recovery_up(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 30
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        hurt_side_obj_char["air_move"]["jump"][1] = hurt_side_obj_char["air_move"]["jump"][2]
        hurt_side_obj_char["air_move"]["air_dash"][1] = hurt_side_obj_char["air_move"]["air_dash"][2]
        -- state_number
        hurt_side_obj_char["velocity"] = {0,0}
        hurt_side_obj_char["friction"] = 1
        hurt_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        hurt_side_obj_char["horizontal_velocity_correction"] = 1
        hurt_side_obj_char["gravity_correction"] = 1
        hurt_side_obj_char["damage_correction"] = 1
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 0
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
    end
    res[3] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[5] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[7] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[10] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end
    res[15] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 5
    end
    res[20] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 6
    end
    res[24] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 7
    end
    res[25] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[27] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 8
    end
    res[30] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_hard_recovery_wallstick_ground(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local pushbox_data = common_game_scene_get_pushbox(side)
    local hurtbox_data = common_game_scene_get_hurtbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(side)
    local sprite_sheet = "0_general_hurt_hard_recovery_wallstick_ground"
    res["prop_f"] = "f"
    res["anim_length"] = 25
    res[0] = function()
        -- state
        obj_char["y"] = 0
        obj_char["sprite_sheet"] = sprite_sheet
        obj_char["height"] = "OTG" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["air_move"]["jump"][1] = obj_char["air_move"]["jump"][2]
        obj_char["air_move"]["air_dash"][1] = obj_char["air_move"]["air_dash"][2]
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
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
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = pushbox_data[sprite_sheet][0]
        obj_char["pushbox_opponent_collision_active"] = true
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
        common_game_scene_get_input_sys_cache_init(side)(obj_char)
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
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local hurt_side_stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 30
    res[0] = function()
        -- state
        hurt_side_obj_char["y"] = 0
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        hurt_side_obj_char["air_move"]["jump"][1] = hurt_side_obj_char["air_move"]["jump"][2]
        hurt_side_obj_char["air_move"]["air_dash"][1] = hurt_side_obj_char["air_move"]["air_dash"][2]
        -- state_number
        hurt_side_obj_char["velocity"] = {-20.0*hurt_side_obj_char[5],0}
        hurt_side_obj_char["friction"] = 100
        hurt_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        hurt_side_obj_char["horizontal_velocity_correction"] = 1
        hurt_side_obj_char["gravity_correction"] = 1
        hurt_side_obj_char["damage_correction"] = 1
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 0
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][0][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][0][2],
            0.5,-1,1,0
        )
        -- play_SFX
        play_obj_audio(hurt_side_stage_interactive_SFX_table["ground_soft_knockdown"])
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
    end
    res[2] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[5] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[9] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[13] = function()
        -- state
        hurt_side_obj_char["height"] = "crouch" -- stand crouch air OTG wallstick
        hurt_side_obj_char["friction"] = 7
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][4]
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end
    res[18] = function()
        -- state
        hurt_side_obj_char["height"] = "OTG" -- stand crouch air OTG wallstick
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][5]
        -- draw_correction
        hurt_side_obj_char[8] = 5
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_land_blow(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1][2],
            0.5,1,1,0
        )
    end
    res[24] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 6
    end
    res[25] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[28] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 7
    end
    res[30] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_soft_recovery_wallstick_air(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local pushbox_data = common_game_scene_get_pushbox(side)
    local hurtbox_data = common_game_scene_get_hurtbox(side)
    local anchor_data = common_game_scene_get_anchor(side)
    local VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(side)
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    local sprite_sheet = "0_general_hurt_soft_recovery_wallstick_air"
    res["prop_f"] = "f"
    res["anim_length"] = 10
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = sprite_sheet
        obj_char["height"] = "air" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["air_move"]["jump"][1] = obj_char["air_move"]["jump"][2]
        obj_char["air_move"]["air_dash"][1] = obj_char["air_move"]["air_dash"][2]
        -- state_number
        obj_char["velocity"] = {0,-25}
        obj_char["friction"] = 4
        obj_char["gravity"] = 2.5
        if obj_char["direction_input"] == 9 then
            obj_char["velocity"][1] = 17.5*obj_char[5]
            obj_char["velocity"][2] = -45
        elseif common_game_scene_check_forward_direction(obj_char) then
            obj_char["velocity"][1] = 42.5*obj_char[5]
        elseif common_game_scene_check_jump_direction(obj_char) then
            obj_char["velocity"][2] = -62.5
        end
        -- enemy_friend_interaction
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
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = pushbox_data[sprite_sheet][0]
        obj_char["pushbox_opponent_collision_active"] = false
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][0]
        obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        obj_char[8] = 2
        obj_char["anchor_pos"] = anchor_data[sprite_sheet]
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["air_jump"])
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
        common_game_scene_get_input_sys_cache_init(side)(obj_char)
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
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local common_land_function = function(i)
        -- state
        hurt_side_obj_char["f"] = i
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][i]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][i]
        -- draw_correction
        hurt_side_obj_char[8] = i
    end
    local update_before_land_actions = {
        function()
            if hurt_side_obj_char["f"] < 8 then
                return
            else
                -- state
                hurt_side_obj_char["f"] = 1
                -- collide
                hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
                -- draw_correction
                hurt_side_obj_char[8] = 1
            end
        end,
        function()
            if hurt_side_obj_char["f"] < 15 then
                return
            else
                -- state
                hurt_side_obj_char["f"] = 8
                -- collide
                hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][3]
                -- draw_correction
                hurt_side_obj_char[8] = 3
            end
        end,
        function()
            if hurt_side_obj_char["f"] < 22 then
                return
            else
                -- state
                hurt_side_obj_char["f"] = 15
                -- collide
                hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][5]
                -- draw_correction
                hurt_side_obj_char[8] = 5
            end
        end,
        function()
            if hurt_side_obj_char["f"] < 29 then
                return
            else
                -- state
                hurt_side_obj_char["f"] = 22
                -- collide
                hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][7]
                -- draw_correction
                hurt_side_obj_char[8] = 7
            end 
        end,
        function()
            if hurt_side_obj_char["f"] < 36 then
                return
            else
                -- state
                hurt_side_obj_char["f"] = 29
                -- collide
                hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][9]
                -- draw_correction
                hurt_side_obj_char[8] = 9
            end 
        end,
        function()
            if hurt_side_obj_char["f"] < 43 then
                return
            else
                -- state
                hurt_side_obj_char["f"] = 36
                -- collide
                hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][11]
                -- draw_correction
                hurt_side_obj_char[8] = 11
            end 
        end,
        function()
            if hurt_side_obj_char["f"] >= 36 then
                return
            else
                -- state
                hurt_side_obj_char["f"] = 36
                -- collide
                hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][11]
                -- draw_correction
                hurt_side_obj_char[8] = 11
            end
        end
    }
    local function update_before_land()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
    end
    local function update_before_last_loop()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        update_before_land_actions[
            math.floor((hurt_side_obj_char["velocity"][2] + hurt_side_obj_char["gravity"] * hurt_side_obj_char["gravity_correction"] + 60) / 20) + 1
        ]()
    end
    res["prop_f"] = "f"
    res["anim_length"] = 45
    for i = 0,44 do
        res[i] = function()
            update_before_land()
        end
    end
    for i = 0,37 do
        res[i] = function()
            update_before_last_loop()
        end
    end
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["self_wallbounce_hurt_animation"] = self_wallbounce_hurt_animation
        hurt_side_obj_char["self_groundbounce_hurt_animation"] = self_groundbounce_hurt_animation
        hurt_side_obj_char["self_knockdown_animation"] = self_knockdown_animation
        hurt_side_obj_char["self_knockdown_recovery_animation"] = self_knockdown_recovery_animation
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- update
        update_before_last_loop()
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
        -- update
        update_before_last_loop()
    end
    res[3] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
        -- update
        update_before_last_loop()
    end
    res[6] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_before_last_loop()
    end
    res[9] = function()
        -- state
        hurt_side_obj_char["f"] = 3
        -- draw_correction
        hurt_side_obj_char[8] = 1
        -- update
        update_before_last_loop()
    end
    res[10] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][3]
        -- draw_correction
        hurt_side_obj_char[8] = 3
        -- update
        update_before_last_loop()
    end
    res[13] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
        -- update
        update_before_last_loop()
    end
    res[16] = function()
        -- state
        hurt_side_obj_char["f"] = 10
        -- draw_correction
        hurt_side_obj_char[8] = 3
        -- update
        update_before_last_loop()
    end
    res[17] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][5]
        -- draw_correction
        hurt_side_obj_char[8] = 5
        -- update
        update_before_last_loop()
    end
    res[20] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 6
        -- update
        update_before_last_loop()
    end
    res[23] = function()
        -- state
        hurt_side_obj_char["f"] = 17
        -- draw_correction
        hurt_side_obj_char[8] = 5
        -- update
        update_before_last_loop()
    end
    res[24] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][7]
        -- draw_correction
        hurt_side_obj_char[8] = 7
        -- update
        update_before_last_loop()
    end
    res[27] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 8
        -- update
        update_before_last_loop()
    end
    res[30] = function()
        -- state
        hurt_side_obj_char["f"] = 24
        -- draw_correction
        hurt_side_obj_char[8] = 7
        -- update
        update_before_last_loop()
    end
    res[31] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][9]
        -- draw_correction
        hurt_side_obj_char[8] = 9
        -- update
        update_before_last_loop()
    end
    res[34] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 10
        -- update
        update_before_last_loop()
    end
    res[37] = function()
        -- state
        hurt_side_obj_char["f"] = 31
        -- draw_correction
        hurt_side_obj_char[8] = 9
        -- update
        update_before_last_loop()
    end
    res[38] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][11]
        -- draw_correction
        hurt_side_obj_char[8] = 11
        -- update
        update_before_land()
    end
    res[41] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 12
        -- update
        update_before_land()
    end
    res[44] = function()
        -- state
        hurt_side_obj_char["f"] = 38
        -- draw_correction
        hurt_side_obj_char[8] = 11
        -- update
        update_before_land()
    end
    res[45] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_high(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local function update_before_land()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
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
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["self_wallbounce_hurt_animation"] = self_wallbounce_hurt_animation
        hurt_side_obj_char["self_groundbounce_hurt_animation"] = self_groundbounce_hurt_animation
        hurt_side_obj_char["self_knockdown_animation"] = self_knockdown_animation
        hurt_side_obj_char["self_knockdown_recovery_animation"] = self_knockdown_recovery_animation
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- update
        update_before_land()
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_before_land()
    end
    res[9] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][3]
        -- draw_correction
        hurt_side_obj_char[8] = 3
        -- update
        update_before_land()
    end
    res[12] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
        -- update
        update_before_land()
    end
    res[15] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][5]
        -- draw_correction
        hurt_side_obj_char[8] = 5
        -- update
        update_before_land()
    end
    res[18] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 6
        -- update
        update_before_land()
    end
    res[21] = function()
        -- state
        if hurt_side_obj_char["velocity"][2] <= math.abs(hurt_side_obj_char["velocity"][1])*2 then
            -- collide
            hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][7]
            -- draw_correction
            hurt_side_obj_char[8] = 7
        else
            -- state
            hurt_side_obj_char["f"] = 15
            -- draw_correction
            hurt_side_obj_char[8] = 5
        end
        -- update
        update_before_land()
    end
    res[24] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][8]
        -- draw_correction
        hurt_side_obj_char[8] = 8
        -- update
        update_before_land()
    end
    res[27] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][9]
        -- draw_correction
        hurt_side_obj_char[8] = 9
        -- update
        update_before_land()
    end
    res[30] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 10
        -- update
        update_before_land()
    end
    res[33] = function()
        -- state
        hurt_side_obj_char["f"] = 27
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][9]
        -- draw_correction
        hurt_side_obj_char[8] = 9
        -- update
        update_before_land()
    end
    res[34] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_low(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local function update_before_land()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
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
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["self_wallbounce_hurt_animation"] = self_wallbounce_hurt_animation
        hurt_side_obj_char["self_groundbounce_hurt_animation"] = self_groundbounce_hurt_animation
        hurt_side_obj_char["self_knockdown_animation"] = self_knockdown_animation
        hurt_side_obj_char["self_knockdown_recovery_animation"] = self_knockdown_recovery_animation
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- update
        update_before_land()
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
        -- update
        update_before_land()
    end
    res[6] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_before_land()
    end
    res[12] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
        -- update
        update_before_land()
    end
    res[18] = function()
        -- state
        hurt_side_obj_char["f"] = 6
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_before_land()
    end
    res[19] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_mid_hori_heavy(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local function update_before_land()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
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
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["self_wallbounce_hurt_animation"] = self_wallbounce_hurt_animation
        hurt_side_obj_char["self_groundbounce_hurt_animation"] = self_groundbounce_hurt_animation
        hurt_side_obj_char["self_knockdown_animation"] = self_knockdown_animation
        hurt_side_obj_char["self_knockdown_recovery_animation"] = self_knockdown_recovery_animation
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
        -- update
        update_before_land()
    end
    res[6] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_before_land()
    end
    res[9] = function()
        -- state
        hurt_side_obj_char["f"] = 3
        -- draw_correction
        hurt_side_obj_char[8] = 1
        -- update
        update_before_land()
    end
    res[10] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_mid_up(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local function update_before_falling()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        if hurt_side_obj_char["velocity"][2] > 0 then
            -- state
            hurt_side_obj_char["f"] = 9
            -- collide
            hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][3]
            -- draw_correction
            hurt_side_obj_char[8] = 3
        end
    end
    local function update_before_land()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
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
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["self_wallbounce_hurt_animation"] = self_wallbounce_hurt_animation
        hurt_side_obj_char["self_groundbounce_hurt_animation"] = self_groundbounce_hurt_animation
        hurt_side_obj_char["self_knockdown_animation"] = self_knockdown_animation
        hurt_side_obj_char["self_knockdown_recovery_animation"] = self_knockdown_recovery_animation
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- update
        update_before_falling()
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
        -- update
        update_before_falling()
    end
    res[3] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
        -- update
        update_before_falling()
    end
    res[6] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_before_falling()
    end
    res[9] = function()
        -- state
        hurt_side_obj_char["f"] = 3
        -- draw_correction
        hurt_side_obj_char[8] = 1
        -- update
        update_before_falling()
    end
    res[12] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][4]
        -- draw_correction
        hurt_side_obj_char[8] = 4
        -- update
        update_before_land()
    end
    res[15] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][5]
        -- draw_correction
        hurt_side_obj_char[8] = 5
        -- update
        update_before_land()
    end
    res[18] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][6]
        -- draw_correction
        hurt_side_obj_char[8] = 6
        -- update
        update_before_land()
    end
    res[21] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][7]
        -- draw_correction
        hurt_side_obj_char[8] = 7
        -- update
        update_before_land()
    end
    res[24] = function()
        hurt_side_obj_char["f"] = 18
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][6]
        -- draw_correction
        hurt_side_obj_char[8] = 6
        -- update
        update_before_land()
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_rolling(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local function update_before_land()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
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
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["self_wallbounce_hurt_animation"] = self_wallbounce_hurt_animation
        hurt_side_obj_char["self_groundbounce_hurt_animation"] = self_groundbounce_hurt_animation
        hurt_side_obj_char["self_knockdown_animation"] = self_knockdown_animation
        hurt_side_obj_char["self_knockdown_recovery_animation"] = self_knockdown_recovery_animation
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- update
        update_before_land()
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 1
        -- update
        update_before_land()
    end
    res[6] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_before_land()
    end
    res[9] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
        -- update
        update_before_land()
    end
    res[12] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
        -- update
        update_before_land()
    end
    res[15] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 5
        -- update
        update_before_land()
    end
    res[18] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 6
        -- update
        update_before_land()
    end
    res[21] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 7
        -- update
        update_before_land()
    end
    res[24] = function()
        -- state
        hurt_side_obj_char["f"] = 1
        hurt_side_obj_char[8] = 1
        -- update
        update_before_land()
    end
    res[25] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_rotate(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local function update_before_land()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
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
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["self_wallbounce_hurt_animation"] = self_wallbounce_hurt_animation
        hurt_side_obj_char["self_groundbounce_hurt_animation"] = self_groundbounce_hurt_animation
        hurt_side_obj_char["self_knockdown_animation"] = self_knockdown_animation
        hurt_side_obj_char["self_knockdown_recovery_animation"] = self_knockdown_recovery_animation
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- update
        update_before_land()
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 1
        -- update
        update_before_land()
    end
    res[6] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_before_land()
    end
    res[9] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
        -- update
        update_before_land()
    end
    res[12] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
        -- update
        update_before_land()
    end
    res[15] = function()
        -- state
        hurt_side_obj_char["f"] = 1
        hurt_side_obj_char[8] = 1
        -- update
        update_before_land()
    end
    res[16] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_wallbounce(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local function update_before_land()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
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
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["self_wallbounce_hurt_animation"] = self_wallbounce_hurt_animation
        hurt_side_obj_char["self_groundbounce_hurt_animation"] = self_groundbounce_hurt_animation
        hurt_side_obj_char["self_knockdown_animation"] = self_knockdown_animation
        hurt_side_obj_char["self_knockdown_recovery_animation"] = self_knockdown_recovery_animation
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- update
        update_before_land()
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
        -- update
        update_before_land()
    end
    res[6] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_before_land()
    end
    res[9] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][3]
        -- draw_correction
        hurt_side_obj_char[8] = 3
        -- update
        update_before_land()
    end
    res[12] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
        -- update
        update_before_land()
    end
    res[15] = function()
        -- state
        hurt_side_obj_char["f"] = 9
        -- draw_correction
        hurt_side_obj_char[8] = 3
        -- update
        update_before_land()
    end
    res[16] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_launched_groundbounce(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local function update_before_land()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
    end
    local function update_before_falling()
        update_before_land()
        if hurt_side_obj_char["velocity"][2] >= 0 then
            -- collide
            hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
            -- draw_correction
            hurt_side_obj_char[8] = 2
        end
    end
    res["prop_f"] = "f"
    res["anim_length"] = 22
    for i = 0,21 do
        res[i] = function()
            update_before_land()
        end
    end
    for i = 0,6 do
        res[i] = function()
            update_before_falling()
        end
    end
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        hurt_side_obj_char["velocity"][1] = hurt_horizontal_velocity*hurt_horizontal_velocity_correction*(-hurt_side_obj_char[5])
        hurt_side_obj_char["velocity"][2] = hurt_vertical_velocity
        hurt_side_obj_char["friction"] = hurt_horizontal_friction
        hurt_side_obj_char["gravity"] = hurt_vertical_gravity*hurt_vertical_gravity_correction
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["self_wallbounce_hurt_animation"] = self_wallbounce_hurt_animation
        hurt_side_obj_char["self_groundbounce_hurt_animation"] = self_groundbounce_hurt_animation
        hurt_side_obj_char["self_knockdown_animation"] = self_knockdown_animation
        hurt_side_obj_char["self_knockdown_recovery_animation"] = self_knockdown_recovery_animation
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- update
        update_before_falling()
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
        -- update
        update_before_falling()
    end
    res[3] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 1
        -- update
        update_before_falling()
    end
    res[6] = function()
        -- state
        hurt_side_obj_char["f"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 0
        -- update
        update_before_falling()
    end
    res[9] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_before_land()
    end
    res[12] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][3]
        -- draw_correction
        hurt_side_obj_char[8] = 3
        -- update
        update_before_land()
    end
    res[15] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][4]
        -- draw_correction
        hurt_side_obj_char[8] = 4
        -- update
        update_before_land()
    end
    res[18] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 5
        -- update
        update_before_land()
    end
    res[21] = function()
        -- state
        hurt_side_obj_char["f"] = 15
        -- draw_correction
        hurt_side_obj_char[8] = 4
        -- update
        update_before_land()
    end
    res[22] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_common_0_general_hurt_lanuched_throw_success_PRC(
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local function update_before_land()
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
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
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_projectile_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,nil,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false,
            "character"
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["self_wallbounce_hurt_animation"] = self_wallbounce_hurt_animation
        hurt_side_obj_char["self_groundbounce_hurt_animation"] = self_groundbounce_hurt_animation
        hurt_side_obj_char["self_knockdown_animation"] = self_knockdown_animation
        hurt_side_obj_char["self_knockdown_recovery_animation"] = self_knockdown_recovery_animation
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- update
        update_before_land()
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = state_cache
        -- update
        update_before_land()
    end
    res[3] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_before_land()
    end
    res[9] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][3]
        -- draw_correction
        hurt_side_obj_char[8] = 3
        -- update
        update_before_land()
    end
    res[12] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
        -- update
        update_before_land()
    end
    res[15] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][5]
        -- draw_correction
        hurt_side_obj_char[8] = 5
        -- update
        update_before_land()
    end
    res[18] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 6
        -- update
        update_before_land()
    end
    res[21] = function()
        -- state
        if hurt_side_obj_char["velocity"][2] <= math.abs(hurt_side_obj_char["velocity"][1])*2 then
            -- collide
            hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][7]
            -- draw_correction
            hurt_side_obj_char[8] = 7
        else
            -- state
            hurt_side_obj_char["f"] = 15
            -- draw_correction
            hurt_side_obj_char[8] = 5
        end
        -- update
        update_before_land()
    end
    res[24] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][8]
        -- draw_correction
        hurt_side_obj_char[8] = 8
        -- update
        update_before_land()
    end
    res[27] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][9]
        -- draw_correction
        hurt_side_obj_char[8] = 9
        -- update
        update_before_land()
    end
    res[30] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 10
        -- update
        update_before_land()
    end
    res[33] = function()
        -- state
        hurt_side_obj_char["f"] = 27
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][9]
        -- draw_correction
        hurt_side_obj_char[8] = 9
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
    hit_side_obj_char,hurt_side_obj_char,sprite_sheet,height,state_cache,
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
    local hit_side = hit_side_obj_char["player_side"]
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    res["prop_f"] = "f"
    res["anim_length"] = 29
    res[0] = function()
        -- state
        hurt_side_obj_char["y"] = -265
        hurt_side_obj_char["sprite_sheet"] = sprite_sheet
        hurt_side_obj_char["height"] = height -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false
        )
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[4] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
    end
    res[8] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[11] = function()
        -- state
        hurt_side_obj_char["y"] = 0
        hurt_side_obj_char["height"] = "stand"
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][3]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][3]
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[14] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][4]
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end
    res[18] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][5]
        -- draw_correction
        hurt_side_obj_char[8] = 5
    end
    res[20] = function()
        -- state
        hurt_side_obj_char["hurt_state_target"] = "idle"
    end
    res[21] = function()
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][6]
        -- draw_correction
        hurt_side_obj_char[8] = 6
    end
    res[24] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
    end
    res[29] = function()
        -- animation_end
    end
    return res
end
-- wallstick_lead_to_wallbreak
function load_game_scene_anim_char_common_0_general_hurt_wallbreak(hit_side_obj_char,hurt_side_obj_char,obj_projectile,adv)
    local res = {}
    res["prop_f"] = "f"
    res["anim_length"] = 1
    res[0] = function()
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = adv
        if not obj_projectile then
            common_game_scene_char_apply_damage_heat(
                hit_side_obj_char,hurt_side_obj_char,"hurt",false
            )
        else
            common_game_scene_projectile_apply_damage_heat(
                hit_side_obj_char,hurt_side_obj_char,obj_projectile,"hurt",false
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
function load_game_scene_anim_char_common_burst_overdrive(
    self_side_obj_char,opponent_side_obj_char,
    opponent_side_game_speed_force_0_countdown,
    overdrive_halved,character_uncommon_init
)
    local res = {}
    local self_side = self_side_obj_char["player_side"]
    local obj_camera = obj_stage_game_scene_camera
    local obj_stage_main = obj_stage_game_scene_main
    local function update_move_overdrive_state()
        if opponent_side_obj_char["game_speed_force_0_countdown"] == 0 and self_side_obj_char["f"] >= 4 then
            self_side_obj_char["move_state"] = "recovery"
        end
        if self_side_obj_char["overdrive_gauge"][1] > 0 then
            self_side_obj_char["overdrive_gauge"][1] = 
            self_side_obj_char["overdrive_gauge"][1] - 24
        elseif self_side_obj_char["overdrive_gauge"][1] < 0 then
            self_side_obj_char["overdrive_gauge"][1] = 0
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
        self_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        self_side_obj_char["move_state"] = "startup" -- none startup active recovery
        self_side_obj_char["air_move"] = {}
        self_side_obj_char["air_move"]["jump"] = {1,1}
        self_side_obj_char["air_move"]["air_dash"] = {1,1}
        -- state_number
        self_side_obj_char["velocity"] = {0,0}
        self_side_obj_char["velocity_cache"] = {0,0}
        self_side_obj_char["friction"] = 1
        self_side_obj_char["gravity"] = 2.5
        self_side_obj_char["physics_lock"] = true
        self_side_obj_char["overdrive_gauge"][3] = "on"
        -- enemy_friend_interaction
        self_side_obj_char["strike_inv"] = true
        self_side_obj_char["strike_inv_countdown"] = 70
        self_side_obj_char["throw_inv"] = true
        self_side_obj_char["throw_inv_countdown"] = 70
        self_side_obj_char["projectile_inv"] = true
        self_side_obj_char["projectile_inv_countdown"] = 70
        self_side_obj_char["horizontal_velocity_correction"] = 1
        self_side_obj_char["gravity_correction"] = 1
        self_side_obj_char["damage_correction"] = 1
        -- frame_data
        self_side_obj_char["startup_frame"] = 0
        self_side_obj_char["active_frame"] = 0
        self_side_obj_char["recovery_frame"] = 0
        -- game_speed
        -- 设置为强制速度为1到动画结束
        common_game_scene_game_speed_load_application(self_side_obj_char,{1,nil,nil,nil,nil,69})
        self_side_obj_char["hit_hurt_blockstop_countdown"] = 0
        -- collide
        self_side_obj_char["pushbox_opponent_collision_active"] = true
        self_side_obj_char["hitbox_table"] = {} --{ 攻击类型 是投还是打， function值 内部为命中后的逻辑,具体的box形状}
        self_side_obj_char["hurtbox_table"] = {}
        self_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        self_side_obj_char["VFX_common_front_table"] = {}
        self_side_obj_char[8] = 0
        -- camera_animation_load
        common_game_scene_overdrive_load_camera_shake_anim(self_side_obj_char)
        common_game_scene_nil_load_camera_enclose_anim(self_side_obj_char)
        -- camera_animation_application
        table.insert(obj_stage_main["camera_active_application_table"],
            function()
                anim_stage_point_linear_game_scene_camera_enclosing = self_side_obj_char["camera_enclosing_anim"]
                anim_stage_point_linear_game_scene_camera_shake_x = self_side_obj_char["camera_x_shake_anim"]
                anim_stage_point_linear_game_scene_camera_shake_y = self_side_obj_char["camera_y_shake_anim"]
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_enclosing)
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y)
                obj_camera["enclose_position_offset"] = self_side_obj_char["enclose_position_offset"]
                obj_camera["state"] = "active"
            end
        )
        -- insert_VFX
        self_side_obj_char["VFX_common_back_table"] = {}
        insert_VFX_game_scene_char_overdrive_badge(self_side_obj_char)
        insert_VFX_game_scene_char_overdrive_partical(self_side_obj_char,opponent_side_obj_char)
        insert_VFX_game_scene_char_overdrive_black_overlay(self_side_obj_char)
        -- play_SFX
        -- update
        update_move_overdrive_state()
        -- character_uncommon_init
        character_uncommon_init(self_side_obj_char)
    end
    res[2] = function()
        -- game_speed
        -- 设置为强制速度为0到动画结束
        common_game_scene_game_speed_load_application(
            opponent_side_obj_char,
            {1,nil,nil,nil,opponent_side_game_speed_force_0_countdown-2,nil}
        )
        -- update
        update_move_overdrive_state()
    end
    res[4] = function()
        -- draw_correction
        self_side_obj_char[8] = 1
        -- update
        update_move_overdrive_state()
    end
    res[8] = function()
        -- draw_correction
        self_side_obj_char[8] = 2
        -- update
        update_move_overdrive_state()
    end
    res[12] = function()
        -- draw_correction
        self_side_obj_char[8] = 3
        -- update
        update_move_overdrive_state()
    end
    res[28] = function()
        -- draw_correction
        self_side_obj_char[8] = 4
        -- update
        update_move_overdrive_state()
    end
    res[30] = function()
        -- insert_VFX
        insert_VFX_game_scene_char_overdrive_airflow(self_side_obj_char)
        -- update
        update_move_overdrive_state()
    end
    res[32] = function()
        -- draw_correction
        self_side_obj_char[8] = 5
        -- update
        update_move_overdrive_state()
    end
    res[35] = function()
        -- draw_correction
        self_side_obj_char[8] = 6
        -- update
        update_move_overdrive_state()
    end
    res[38] = function()
        -- state_number
        if overdrive_halved then
            if self_side_obj_char["health_gauge"][1]/self_side_obj_char["health_gauge"][3] > 0.85 then
                self_side_obj_char["overdrive_timer"] = {0,2,0,0}
            elseif self_side_obj_char["health_gauge"][1]/self_side_obj_char["health_gauge"][3] > 0.60 then
                self_side_obj_char["overdrive_timer"] = {0,3,0,0}
            elseif self_side_obj_char["health_gauge"][1]/self_side_obj_char["health_gauge"][3] > 0.45 then
                self_side_obj_char["overdrive_timer"] = {0,4,0,0}
            elseif self_side_obj_char["health_gauge"][1]/self_side_obj_char["health_gauge"][3] > 0.35 then
                self_side_obj_char["overdrive_timer"] = {0,5,0,0}
            else
                self_side_obj_char["overdrive_timer"] = {0,6,0,0}
            end
        else
            if self_side_obj_char["health_gauge"][1]/self_side_obj_char["health_gauge"][3] > 0.85 then
                self_side_obj_char["overdrive_timer"] = {0,4,0,0}
            elseif self_side_obj_char["health_gauge"][1]/self_side_obj_char["health_gauge"][3] > 0.60 then
                self_side_obj_char["overdrive_timer"] = {0,6,0,0}
            elseif self_side_obj_char["health_gauge"][1]/self_side_obj_char["health_gauge"][3] > 0.45 then
                self_side_obj_char["overdrive_timer"] = {0,8,0,0}
            elseif self_side_obj_char["health_gauge"][1]/self_side_obj_char["health_gauge"][3] > 0.35 then
                self_side_obj_char["overdrive_timer"] = {1,0,0,0}
            else
                self_side_obj_char["overdrive_timer"] = {1,2,0,0}
            end
        end
        self_side_obj_char["overdrive_gauge"][3] = "on"
        -- draw_correction
        self_side_obj_char[8] = 7
        -- update
        update_move_overdrive_state()
    end
    res[41] = function()
        -- draw_correction
        self_side_obj_char[8] = 5
        -- update
        update_move_overdrive_state()
    end
    res[44] = function()
        -- draw_correction
        self_side_obj_char[8] = 6
        -- update
        update_move_overdrive_state()
    end
    res[47] = function()
        -- draw_correction
        self_side_obj_char[8] = 7
        -- update
        update_move_overdrive_state()
    end
    res[50] = function()
        -- draw_correction
        self_side_obj_char[8] = 5
        -- update
        update_move_overdrive_state()
    end
    res[53] = function()
        -- draw_correction
        self_side_obj_char[8] = 6
        -- update
        update_move_overdrive_state()
    end
    res[56] = function()
        -- draw_correction
        self_side_obj_char[8] = 7
        -- update
        update_move_overdrive_state()
    end
    res[60] = function()
        -- input_sys_cache
        self_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(self_side)(self_side_obj_char)
        -- draw_correction
        self_side_obj_char[8] = 8
        -- update
        update_move_overdrive_state()
    end
    res[65] = function()
        -- draw_correction
        self_side_obj_char[8] = 9
        -- update
        update_move_overdrive_state()
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
function load_game_scene_anim_char_common_burst_RC_red(
    self_side_obj_char,opponent_side_obj_char,
    character_uncommon_update
)
    local res = {}
    local self_side = self_side_obj_char["player_side"]
    local self_height = self_side_obj_char["height"]
    local pushbox_data = common_game_scene_get_pushbox(self_side)
    local hurtbox_data = common_game_scene_get_hurtbox(self_side)
    local anchor_data = common_game_scene_get_anchor(self_side)
    local goal_heat_gauge_remain = math.max(0,self_side_obj_char["heat_gauge"][1]-100)
    local move_SFX_table = common_game_scene_get_SFX_move(self_side)
    local function update_heat_gauge_state()
        if self_side_obj_char["heat_gauge"][1] > goal_heat_gauge_remain then
            self_side_obj_char["heat_gauge"][1] = self_side_obj_char["heat_gauge"][1] - 5
        end
    end
    local function update_state()
        -- move_state
        if opponent_side_obj_char["game_speed_force_0_countdown"] == 0 and self_side_obj_char["f"] >= 26 then
            self_side_obj_char["move_state"] = "recovery"
        end
        if self_height ~= self_side_obj_char["height"] then
            return
        end
        -- height
        if self_height == "air" and collision_test_char_on_ground(self_side_obj_char) then
            self_side_obj_char["y"] = 0
            self_side_obj_char["height"] = "stand"
            self_side_obj_char["sprite_sheet"] = "burst_RC_ground"
            self_side_obj_char["pushbox"]  = pushbox_data["RC"]["stand"]
            self_side_obj_char["anchor_pos"] = anchor_data["RC"]["stand"]
            self_side_obj_char["collision_ground_height_offset"] = 0
        elseif self_height ~= "air" and not collision_test_char_on_ground(self_side_obj_char) then
            self_side_obj_char["height"] = "air"
            self_side_obj_char["sprite_sheet"] = "burst_overdrive_RC_air"
            self_side_obj_char["pushbox"]  = pushbox_data["RC"]["air"]
            self_side_obj_char["anchor_pos"] = anchor_data["RC"]["air"]
            self_side_obj_char["collision_ground_height_offset"] = 185
        end
        character_uncommon_update(self_side_obj_char)
    end
    res["prop_f"] = "f"
    res["anim_length"] = 45
    for i = 0,44 do
        res[i] = function()
            -- update
            update_state()
        end
    end
    for i = 0,24 do
        res[i] = function()
            -- update
            update_state()
            update_heat_gauge_state()
        end
    end
    res[0] = function()
        -- state
        self_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        self_side_obj_char["move_state"] = "startup" -- none startup active recovery
        self_side_obj_char["air_move"] = {}
        self_side_obj_char["air_move"]["jump"] = {1,1}
        self_side_obj_char["air_move"]["air_dash"] = {1,1}
        -- state_number
        self_side_obj_char["friction"] = 0
        self_side_obj_char["gravity"] = 0
        self_side_obj_char["physics_lock"] = false
        -- enemy_friend_interaction
        self_side_obj_char["idle_cancel"] = false
        self_side_obj_char["strike_inv"] = true
        self_side_obj_char["strike_inv_countdown"] = res["anim_length"]
        self_side_obj_char["throw_inv"] = true
        self_side_obj_char["throw_inv_countdown"] = res["anim_length"]
        self_side_obj_char["projectile_inv"] = true
        self_side_obj_char["projectile_inv_countdown"] = res["anim_length"]
        self_side_obj_char["horizontal_velocity_correction"] = 1
        self_side_obj_char["gravity_correction"] = 1
        self_side_obj_char["damage_correction"] = 1
        -- frame_data
        self_side_obj_char["startup_frame"] = 0
        self_side_obj_char["active_frame"] = 0
        self_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        self_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(self_side)(self_side_obj_char)
        -- game_speed
        -- 设置为强制速度到动画结束
        common_game_scene_game_speed_load_application(self_side_obj_char,{1,nil,nil,nil,nil,44})
        common_game_scene_game_speed_load_application(opponent_side_obj_char,{1,nil,nil,nil,44,nil})
        -- collide
        self_side_obj_char["pushbox_opponent_collision_active"] = true
        self_side_obj_char["hitbox_table"] = {} --{ 攻击类型 是投还是打， function值 内部为命中后的逻辑,具体的box形状}
        self_side_obj_char["hurtbox_table"] = {}
        -- draw_correction
        self_side_obj_char[8] = 0
        -- insert_VFX
        self_side_obj_char["VFX_hit_front_table"] = {}
        opponent_side_obj_char["VFX_hit_front_table"] = {}
        self_side_obj_char["VFX_hit_back_table"] = {}
        opponent_side_obj_char["VFX_hit_back_table"] = {}
        insert_VFX_game_scene_char_RC_badge(self_side_obj_char,image_sprite_sheet_VFX_game_scene_RC_red_badge)
        insert_VFX_game_scene_char_RC_partical(self_side_obj_char)
        insert_VFX_game_scene_char_RC_black_overlay(self_side_obj_char)
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[3] = function()
        -- draw_correction
        self_side_obj_char[8] = 1
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[7] = function()
        -- state
        self_side_obj_char["idle_cancel"] = true
        -- input_sys_cache
        self_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(self_side)()
        -- draw_correction
        self_side_obj_char[8] = 2
        -- play_SFX
        play_obj_audio(move_SFX_table["red_RC_whiff"])
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[13] = function()
        -- draw_correction
        self_side_obj_char[8] = 3
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[24] = function()
        -- state
        self_side_obj_char["idle_cancel"] = false
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[26] = function()
        -- draw_correction
        self_side_obj_char[8] = 4
        -- projectile
        insert_projectile_game_scene_char_common_RC_shockwave_red(self_side_obj_char,opponent_side_obj_char)
        -- update
        update_state()
    end
    res[27] = function()
        -- draw_correction
        self_side_obj_char[8] = 5
        -- update
        update_state()
    end
    res[31] = function()
        -- draw_correction
        self_side_obj_char[8] = 6
        -- update
        update_state()
    end
    res[35] = function()
        -- input_sys_cache
        self_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(self_side)(self_side_obj_char)
        -- draw_correction
        self_side_obj_char[8] = 7
        -- update
        update_state()
    end
    res[39] = function()
        -- draw_correction
        self_side_obj_char[8] = 8
        -- update
        update_state()
    end
    res[42] = function()
        -- draw_correction
        self_side_obj_char[8] = 9
        -- update
        update_state()
    end
    res[45] = function()
        -- aniamtion_end
    end
    return res
end
function load_game_scene_anim_char_common_burst_RC_blue(
    self_side_obj_char,opponent_side_obj_char,
    character_uncommon_update
)
    local res = {}
    local self_side = self_side_obj_char["player_side"]
    local self_height = self_side_obj_char["height"]
    local pushbox_data = common_game_scene_get_pushbox(self_side)
    local hurtbox_data = common_game_scene_get_hurtbox(self_side)
    local anchor_data = common_game_scene_get_anchor(self_side)
    local goal_heat_gauge_remain = math.max(0,self_side_obj_char["heat_gauge"][1]-100)
    local move_SFX_table = common_game_scene_get_SFX_move(self_side)
    local function update_heat_gauge_state()
        if self_side_obj_char["heat_gauge"][1] > goal_heat_gauge_remain then
            self_side_obj_char["heat_gauge"][1] = self_side_obj_char["heat_gauge"][1] - 5
        end
    end
    local function update_state()
        -- move_state
        if opponent_side_obj_char["game_speed_force_0_countdown"] == 0 and self_side_obj_char["f"] >= 26 then
            self_side_obj_char["move_state"] = "recovery"
        end
        if self_height ~= self_side_obj_char["height"] then
            return
        end
        -- height
        if self_height == "air" and collision_test_char_on_ground(self_side_obj_char) then
            self_side_obj_char["y"] = 0
            self_side_obj_char["height"] = "stand"
            self_side_obj_char["sprite_sheet"] = "burst_RC_ground"
            self_side_obj_char["pushbox"]  = pushbox_data["RC"]["stand"]
            self_side_obj_char["anchor_pos"] = anchor_data["RC"]["stand"]
            self_side_obj_char["collision_ground_height_offset"] = 0
        elseif self_height ~= "air" and not collision_test_char_on_ground(self_side_obj_char) then
            self_side_obj_char["height"] = "air"
            self_side_obj_char["sprite_sheet"] = "burst_overdrive_RC_air"
            self_side_obj_char["pushbox"]  = pushbox_data["RC"]["air"]
            self_side_obj_char["anchor_pos"] = anchor_data["RC"]["air"]
            self_side_obj_char["collision_ground_height_offset"] = 185
        end
        character_uncommon_update(self_side_obj_char)
    end
    res["prop_f"] = "f"
    res["anim_length"] = 45
    for i = 0,44 do
        res[i] = function()
            -- update
            update_state()
        end
    end
    for i = 0,24 do
        res[i] = function()
            -- update
            update_state()
            update_heat_gauge_state()
        end
    end
    for i = 0,4 do
        res[i] = function()
            -- collide
            self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
            -- update
            update_state()
            update_heat_gauge_state()
        end
    end
    res[0] = function()
        -- state
        self_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        self_side_obj_char["move_state"] = "startup" -- none startup active recovery
        self_side_obj_char["air_move"] = {}
        self_side_obj_char["air_move"]["jump"] = {1,1}
        self_side_obj_char["air_move"]["air_dash"] = {1,1}
        -- state_number
        self_side_obj_char["friction"] = 0
        self_side_obj_char["gravity"] = 0
        self_side_obj_char["physics_lock"] = false
        -- enemy_friend_interaction
        self_side_obj_char["idle_cancel"] = false
        self_side_obj_char["strike_inv"] = false
        self_side_obj_char["strike_inv_countdown"] = 0
        self_side_obj_char["throw_inv"] = true
        self_side_obj_char["throw_inv_countdown"] = 5
        self_side_obj_char["projectile_inv"] = false
        self_side_obj_char["projectile_inv_countdown"] = 0
        self_side_obj_char["horizontal_velocity_correction"] = 1
        self_side_obj_char["gravity_correction"] = 1
        self_side_obj_char["damage_correction"] = 1
        -- frame_data
        self_side_obj_char["startup_frame"] = 0
        self_side_obj_char["active_frame"] = 0
        self_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        self_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(self_side)(self_side_obj_char)
        -- collide
        self_side_obj_char["pushbox_opponent_collision_active"] = true
        self_side_obj_char["hitbox_table"] = {} --{ 攻击类型 是投还是打， function值 内部为命中后的逻辑,具体的box形状}
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- draw_correction
        self_side_obj_char[8] = 0
        -- insert_VFX
        self_side_obj_char["VFX_hit_front_table"] = {}
        opponent_side_obj_char["VFX_hit_front_table"] = {}
        self_side_obj_char["VFX_hit_back_table"] = {}
        opponent_side_obj_char["VFX_hit_back_table"] = {}
        insert_VFX_game_scene_char_RC_badge(self_side_obj_char,image_sprite_sheet_VFX_game_scene_RC_blue_badge)
        insert_VFX_game_scene_char_RC_partical(self_side_obj_char)
        insert_VFX_game_scene_char_RC_black_overlay(self_side_obj_char)
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[3] = function()
        -- collide
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- draw_correction
        self_side_obj_char[8] = 1
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[5] = function()
        -- state
        self_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        -- enemy_friend_interaction
        self_side_obj_char["strike_inv"] = true
        self_side_obj_char["strike_inv_countdown"] = 40
        self_side_obj_char["throw_inv"] = true
        self_side_obj_char["throw_inv_countdown"] = 40
        self_side_obj_char["projectile_inv"] = true
        self_side_obj_char["projectile_inv_countdown"] = 40
        -- input_sys_cache
        self_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(self_side)()
        -- game_speed
        -- 设置为强制速度到动画结束
        common_game_scene_game_speed_load_application(self_side_obj_char,{1,nil,nil,nil,nil,39})
        common_game_scene_game_speed_load_application(opponent_side_obj_char,{1,nil,nil,nil,39,nil})
        -- collide
        self_side_obj_char["hurtbox_table"] = {}
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[7] = function()
        -- draw_correction
        self_side_obj_char[8] = 2
        -- play_SFX
        play_obj_audio(move_SFX_table["blue_RC"])
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[10] = function()
        -- state
        self_side_obj_char["idle_cancel"] = true
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[13] = function()
        -- draw_correction
        self_side_obj_char[8] = 3
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[24] = function()
        -- state
        self_side_obj_char["idle_cancel"] = false
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[26] = function()
        -- draw_correction
        self_side_obj_char[8] = 4
        -- projectile
        insert_projectile_game_scene_char_common_RC_shockwave_blue(self_side_obj_char,opponent_side_obj_char)
        -- update
        update_state()
    end
    res[27] = function()
        -- draw_correction
        self_side_obj_char[8] = 5
        -- update
        update_state()
    end
    res[31] = function()
        -- draw_correction
        self_side_obj_char[8] = 6
        -- update
        update_state()
    end
    res[35] = function()
        -- input_sys_cache
        self_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(self_side)(self_side_obj_char)
        -- draw_correction
        self_side_obj_char[8] = 7
        -- update
        update_state()
    end
    res[39] = function()
        -- draw_correction
        self_side_obj_char[8] = 8
        -- update
        update_state()
    end
    res[42] = function()
        -- draw_correction
        self_side_obj_char[8] = 9
        -- update
        update_state()
    end
    res[45] = function()
        -- aniamtion_end
    end
    return res
end
function load_game_scene_anim_char_common_burst_RC_purple(
    self_side_obj_char,opponent_side_obj_char,
    character_uncommon_update
)
    local res = {}
    local self_side = self_side_obj_char["player_side"]
    local self_height = self_side_obj_char["height"]
    local pushbox_data = common_game_scene_get_pushbox(self_side)
    local hurtbox_data = common_game_scene_get_hurtbox(self_side)
    local anchor_data = common_game_scene_get_anchor(self_side)
    local goal_heat_gauge_remain = math.max(0,self_side_obj_char["heat_gauge"][1]-100)
    local move_SFX_table = common_game_scene_get_SFX_move(self_side)
    local function update_heat_gauge_state()
        if self_side_obj_char["heat_gauge"][1] > goal_heat_gauge_remain then
            self_side_obj_char["heat_gauge"][1] = self_side_obj_char["heat_gauge"][1] - 5
        end
    end
    local function update_state()
        -- move_state
        if opponent_side_obj_char["game_speed_force_0_countdown"] == 0 and self_side_obj_char["f"] >= 26 then
            self_side_obj_char["move_state"] = "recovery"
        end
        if self_height ~= self_side_obj_char["height"] then
            return
        end
        -- height
        if self_height == "air" and collision_test_char_on_ground(self_side_obj_char) then
            self_side_obj_char["y"] = 0
            self_side_obj_char["height"] = "stand"
            self_side_obj_char["sprite_sheet"] = "burst_RC_ground"
            self_side_obj_char["pushbox"]  = pushbox_data["RC"]["stand"]
            self_side_obj_char["anchor_pos"] = anchor_data["RC"]["stand"]
            self_side_obj_char["collision_ground_height_offset"] = 0
        elseif self_height ~= "air" and not collision_test_char_on_ground(self_side_obj_char) then
            self_side_obj_char["height"] = "air"
            self_side_obj_char["sprite_sheet"] = "burst_overdrive_RC_air"
            self_side_obj_char["pushbox"]  = pushbox_data["RC"]["air"]
            self_side_obj_char["anchor_pos"] = anchor_data["RC"]["air"]
            self_side_obj_char["collision_ground_height_offset"] = 185
        end
        character_uncommon_update(self_side_obj_char)
    end
    res["prop_f"] = "f"
    res["anim_length"] = 45
    for i = 0,44 do
        res[i] = function()
            -- update
            update_state()
        end
    end
    for i = 0,24 do
        res[i] = function()
            -- update
            update_state()
            update_heat_gauge_state()
        end
    end
    for i = 0,4 do
        res[i] = function()
            -- collide
            self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
            -- update
            update_state()
            update_heat_gauge_state()
        end
    end
    res[0] = function()
        -- state
        self_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        self_side_obj_char["move_state"] = "startup" -- none startup active recovery
        self_side_obj_char["air_move"] = {}
        self_side_obj_char["air_move"]["jump"] = {1,1}
        self_side_obj_char["air_move"]["air_dash"] = {1,1}
        -- state_number
        self_side_obj_char["friction"] = 0
        self_side_obj_char["gravity"] = 0
        self_side_obj_char["physics_lock"] = false
        -- enemy_friend_interaction
        self_side_obj_char["idle_cancel"] = false
        self_side_obj_char["strike_inv"] = false
        self_side_obj_char["strike_inv_countdown"] = 0
        self_side_obj_char["throw_inv"] = true
        self_side_obj_char["throw_inv_countdown"] = 5
        self_side_obj_char["projectile_inv"] = false
        self_side_obj_char["projectile_inv_countdown"] = 0
        self_side_obj_char["horizontal_velocity_correction"] = 1
        self_side_obj_char["gravity_correction"] = 1
        self_side_obj_char["damage_correction"] = 1
        -- frame_data
        self_side_obj_char["startup_frame"] = 0
        self_side_obj_char["active_frame"] = 0
        self_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        self_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(self_side)(self_side_obj_char)
        -- collide
        self_side_obj_char["pushbox_opponent_collision_active"] = true
        self_side_obj_char["hitbox_table"] = {} --{ 攻击类型 是投还是打， function值 内部为命中后的逻辑,具体的box形状}
        self_side_obj_char["hurtbox_table"] = {}
        -- draw_correction
        self_side_obj_char[8] = 0
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[3] = function()
        -- collide
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- draw_correction
        self_side_obj_char[8] = 1
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[5] = function()
        -- state
        self_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        -- enemy_friend_interaction
        self_side_obj_char["strike_inv"] = true
        self_side_obj_char["strike_inv_countdown"] = 40
        self_side_obj_char["throw_inv"] = true
        self_side_obj_char["throw_inv_countdown"] = 40
        self_side_obj_char["projectile_inv"] = true
        self_side_obj_char["projectile_inv_countdown"] = 40
        -- input_sys_cache
        self_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(self_side)()
        -- game_speed
        -- 设置为强制速度到动画结束
        common_game_scene_game_speed_load_application(self_side_obj_char,{1,nil,nil,nil,nil,39})
        common_game_scene_game_speed_load_application(opponent_side_obj_char,{1,nil,nil,nil,39,nil})
        -- collide
        self_side_obj_char["hurtbox_table"] = {}
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[7] = function()
        -- draw_correction
        self_side_obj_char[8] = 2
        -- insert_VFX
        self_side_obj_char["VFX_hit_front_table"] = {}
        opponent_side_obj_char["VFX_hit_front_table"] = {}
        self_side_obj_char["VFX_hit_back_table"] = {}
        opponent_side_obj_char["VFX_hit_back_table"] = {}
        insert_VFX_game_scene_char_RC_badge(self_side_obj_char,image_sprite_sheet_VFX_game_scene_RC_purple_badge)
        insert_VFX_game_scene_char_RC_partical(self_side_obj_char)
        insert_VFX_game_scene_char_RC_black_overlay(self_side_obj_char)
        -- play_SFX
        play_obj_audio(move_SFX_table["purple_RC"])
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[10] = function()
        -- state
        self_side_obj_char["idle_cancel"] = true
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[13] = function()
        -- draw_correction
        self_side_obj_char[8] = 3
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[24] = function()
        -- state
        self_side_obj_char["idle_cancel"] = false
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[26] = function()
        -- draw_correction
        self_side_obj_char[8] = 4
        -- projectile
        insert_projectile_game_scene_char_common_RC_shockwave_purple(self_side_obj_char,opponent_side_obj_char)
        -- update
        update_state()
    end
    res[27] = function()
        -- draw_correction
        self_side_obj_char[8] = 5
        -- update
        update_state()
    end
    res[31] = function()
        -- draw_correction
        self_side_obj_char[8] = 6
        -- update
        update_state()
    end
    res[35] = function()
        -- input_sys_cache
        self_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(self_side)(self_side_obj_char)
        -- draw_correction
        self_side_obj_char[8] = 7
        -- update
        update_state()
    end
    res[39] = function()
        -- draw_correction
        self_side_obj_char[8] = 8
        -- update
        update_state()
    end
    res[42] = function()
        -- draw_correction
        self_side_obj_char[8] = 9
        -- update
        update_state()
    end
    res[45] = function()
        -- aniamtion_end
    end
    return res
end
function load_game_scene_anim_char_common_burst_RC_yellow(
    self_side_obj_char,opponent_side_obj_char,
    character_uncommon_update
)
    local res = {}
    local self_side = self_side_obj_char["player_side"]
    local self_height = self_side_obj_char["height"]
    local pushbox_data = common_game_scene_get_pushbox(self_side)
    local hurtbox_data = common_game_scene_get_hurtbox(self_side)
    local anchor_data = common_game_scene_get_anchor(self_side)
    local goal_heat_gauge_remain = math.max(0,self_side_obj_char["heat_gauge"][1]-100)
    local move_SFX_table = common_game_scene_get_SFX_move(self_side)
    local function update_heat_gauge_state()
        if self_side_obj_char["heat_gauge"][1] > goal_heat_gauge_remain then
            self_side_obj_char["heat_gauge"][1] = self_side_obj_char["heat_gauge"][1] - 5
        end
    end
    local function update_state()
        -- move_state
        if opponent_side_obj_char["game_speed_force_0_countdown"] == 0 and self_side_obj_char["f"] >= 26 then
            self_side_obj_char["move_state"] = "recovery"
        end
        if self_height ~= self_side_obj_char["height"] then
            return
        end
        -- height
        if self_height == "air" and collision_test_char_on_ground(self_side_obj_char) then
            self_side_obj_char["y"] = 0
            self_side_obj_char["height"] = "stand"
            self_side_obj_char["sprite_sheet"] = "burst_RC_ground"
            self_side_obj_char["pushbox"]  = pushbox_data["RC"]["stand"]
            self_side_obj_char["anchor_pos"] = anchor_data["RC"]["stand"]
            self_side_obj_char["collision_ground_height_offset"] = 0
        elseif self_height ~= "air" and not collision_test_char_on_ground(self_side_obj_char) then
            self_side_obj_char["height"] = "air"
            self_side_obj_char["sprite_sheet"] = "burst_overdrive_RC_air"
            self_side_obj_char["pushbox"]  = pushbox_data["RC"]["air"]
            self_side_obj_char["anchor_pos"] = anchor_data["RC"]["air"]
            self_side_obj_char["collision_ground_height_offset"] = 185
        end
        character_uncommon_update(self_side_obj_char)
    end
    res["prop_f"] = "f"
    res["anim_length"] = 75
    for i = 0,75 do
        res[i] = function()
            -- update
            update_state()
        end
    end
    for i = 0,24 do
        res[i] = function()
            -- update
            update_state()
            update_heat_gauge_state()
        end
    end
    res[0] = function()
        -- state
        self_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        self_side_obj_char["move_state"] = "startup" -- none startup active recovery
        self_side_obj_char["air_move"] = {}
        self_side_obj_char["air_move"]["jump"] = {1,1}
        self_side_obj_char["air_move"]["air_dash"] = {1,1}
        -- state_number
        self_side_obj_char["friction"] = 0
        self_side_obj_char["gravity"] = 0
        self_side_obj_char["physics_lock"] = false
        -- enemy_friend_interaction
        self_side_obj_char["idle_cancel"] = false
        self_side_obj_char["strike_inv"] = true
        self_side_obj_char["strike_inv_countdown"] = 42
        self_side_obj_char["throw_inv"] = true
        self_side_obj_char["throw_inv_countdown"] = 42
        self_side_obj_char["projectile_inv"] = true
        self_side_obj_char["projectile_inv_countdown"] = 42
        self_side_obj_char["horizontal_velocity_correction"] = 1
        self_side_obj_char["gravity_correction"] = 1
        self_side_obj_char["damage_correction"] = 1
        -- frame_data
        self_side_obj_char["startup_frame"] = 0
        self_side_obj_char["active_frame"] = 0
        self_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        self_side_obj_char["input_sys_state"] = "none" -- none save load
        common_game_scene_get_input_sys_cache_init(self_side)(self_side_obj_char)
        -- collide
        self_side_obj_char["pushbox_opponent_collision_active"] = true
        self_side_obj_char["hitbox_table"] = {} --{ 攻击类型 是投还是打， function值 内部为命中后的逻辑,具体的box形状}
        self_side_obj_char["hurtbox_table"] = {}
        -- draw_correction
        self_side_obj_char[8] = 0
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[3] = function()
        -- draw_correction
        self_side_obj_char[8] = 1
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[7] = function()
        -- draw_correction
        self_side_obj_char[8] = 2
        -- insert_VFX
        self_side_obj_char["VFX_hit_front_table"] = {}
        opponent_side_obj_char["VFX_hit_front_table"] = {}
        self_side_obj_char["VFX_hit_back_table"] = {}
        opponent_side_obj_char["VFX_hit_back_table"] = {}
        insert_VFX_game_scene_char_RC_badge(self_side_obj_char,image_sprite_sheet_VFX_game_scene_RC_yellow_badge)
        insert_VFX_game_scene_char_RC_partical(self_side_obj_char)
        insert_VFX_game_scene_char_RC_black_overlay(self_side_obj_char)
        -- play_SFX
        play_obj_audio(move_SFX_table["yellow_RC_whiff"])
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[13] = function()
        -- game_speed
        -- 设置为强制速度到动画结束
        common_game_scene_game_speed_load_application(self_side_obj_char,{1,nil,nil,nil,nil,28})
        common_game_scene_game_speed_load_application(opponent_side_obj_char,{1,nil,nil,nil,28,nil})
        -- draw_correction
        self_side_obj_char[8] = 3
        -- update
        update_state()
        update_heat_gauge_state()
    end
    res[26] = function()
        -- draw_correction
        self_side_obj_char[8] = 4
        -- projectile
        insert_projectile_game_scene_char_common_RC_shockwave_yellow(self_side_obj_char,opponent_side_obj_char)
        -- update
        update_state()
    end
    res[27] = function()
        -- draw_correction
        self_side_obj_char[8] = 5
        -- update
        update_state()
    end
    res[31] = function()
        -- draw_correction
        self_side_obj_char[8] = 6
        -- update
        update_state()
    end
    res[35] = function()
        -- input_sys_cache
        self_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(self_side)(self_side_obj_char)
        -- draw_correction
        self_side_obj_char[8] = 7
        -- update
        update_state()
    end
    res[39] = function()
        -- draw_correction
        self_side_obj_char[8] = 5
        -- update
        update_state()
    end
    res[42] = function()
        -- time_continue_frame_0
        -- state
        self_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        self_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- collide
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- update
        update_state()
    end
    res[43] = function()
        -- collide
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- draw_correction
        self_side_obj_char[8] = 6
        -- update
        update_state()
    end
    res[47] = function()
        -- collide
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- draw_correction
        self_side_obj_char[8] = 7
        -- update
        update_state()
    end
    res[51] = function()
        -- collide
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- draw_correction
        self_side_obj_char[8] = 5
        -- update
        update_state()
    end
    res[55] = function()
        -- collide
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- draw_correction
        self_side_obj_char[8] = 6
        -- update
        update_state()
    end
    res[59] = function()
        -- collide
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- draw_correction
        self_side_obj_char[8] = 7
        -- update
        update_state()
    end
    res[63] = function()
        -- collide
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- draw_correction
        self_side_obj_char[8] = 5
        -- update
        update_state()
    end
    res[67] = function()
        -- collide
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- draw_correction
        self_side_obj_char[8] = 6
        -- update
        update_state()
    end
    res[69] = function()
        -- collide
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- draw_correction
        self_side_obj_char[8] = 8
        -- update
        update_state()
    end
    res[72] = function()
        -- collide
        self_side_obj_char["hurtbox_table"] = hurtbox_data["RC"][self_side_obj_char["height"]]
        -- draw_correction
        self_side_obj_char[8] = 9
        -- update
        update_state()
    end
    res[75] = function()
        -- aniamtion_end
    end
    return res
end

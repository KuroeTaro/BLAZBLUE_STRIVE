-- type life x y velocity projectile_clash_type
-- 1-8 f sprite_sheet

-- push_box_interact_function	push_box
-- projectile_clashed_function	projectile_clash_box
-- enemy_interact_function		hitbox hurtbox hit_type	hit_damage hit_damage_correction_factor 
-- friendly_interact_function
-- friction_update_function	friction
-- gravity_update_function		gravity

function insert_projectile_game_scene_char_TRM_5H_at_the_ready_shot(obj_char)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,0.75,1,1,0,0}
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local obj_char_velocity = {obj_char["velocity"][1],obj_char["velocity"][2]}
    local obj_camera = obj_stage_game_scene_camera
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_projectile_sprite_sheet_table(side)
    
    -- common
    obj["type"] = "projectile"
    obj["projectile_clash_type"] = -1 -- -1: 不与其他飞道交互 0-3：飞行道具等级
    -- obj["projectile_clash_box"] = {}
    -- obj["projectile_clashed_function"] = function end
    obj["hit_type"] = "strike"
    obj["life"] = 42

    obj[1] = obj_char["shot_sys_reticle"][1]
    obj[2] = obj_char["shot_sys_reticle"][2]
    obj["x"] = obj_char_other_side["x"]
    obj["y"] = obj_char_other_side["y"]-obj_char_other_side["pushbox"][4]/2
    obj["f"] = -1
    obj["sprite_sheet"] = "5H_miss_projectile"

    obj["hit_damage"] = 0
    obj["hit_damage_correction_factor"] = 1
    obj["hit_heat_gain"] = 0
    obj["hit_wallbreak_damage"] = 0
    obj["hurt_heat_gain"] = 0
    obj["blocked_heat_gain"] = 0
    obj["block_heat_gain"] = 0
    obj["block_risk_gauge_gain"] = 0
    obj["FD_block_heat_drain"] = 0

    obj["velocity"] = {0,0}

    obj["pushbox"] = nil
    obj["hitbox_table"] = {}
    obj["hurtbox_table"] = {}

    obj["strike_active"] = true

    obj["hit_guard_type"] = "all"

    -- collide
    if (obj_char["shot_sys_aim_process"][1] >= obj_char["shot_sys_aim_process"][3]) then
        obj["hitbox_table"] = {{0,0,200,200}}
        obj["sprite_sheet"] = "5H_hit_projectile"
    end

    -- init_animation
    -- this projectile is spwaned by an attchment of charcter, so the animation is init and play at same frame with spawning
    obj["animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_main_anim(obj,obj_char,obj_char_other_side)
    init_character_anim_with(obj,obj["animation"])

    obj["camera_x_shake_anim"] = nil
    obj["camera_y_shake_anim"] = nil
    common_game_scene_hit_load_camera_shake_anim(obj,0.25,15)

    obj["stand_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_hurt(
        obj_char,obj,true,nil,
        "0_stand_hurt_high",
        "stand","5_stand_idle",
        8,5,1.00,
        0,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj["stand_block_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_block(
        obj_char,obj,true,nil,
        "4_stand_block_high",
        "stand","5_stand_idle",
        8,5,1.00,
        0,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj["crouch_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_hurt(
        obj_char,obj,true,nil,
        "0_crouch_hurt",
        "crouch","1_2_3_crouch",
        8,5,1.00,
        0,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj["crouch_block_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_block(
        obj_char,obj,true,nil,
        "1_crouch_block",
        "crouch","1_2_3_crouch",
        8,5,1.00,
        0,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj["air_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_and_OTG_hurt(
        obj_char,obj,true,nil,
        "0_general_hurt_launched_high",
        "air","knockdown_recovery",
        17.5,5,1.035,
        -25,2.5,1.035,
        nil,
        load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
            obj_char,
            "0_general_hurt_soft_recovery_ground",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        ),
        nil,nil,
        function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],-200) end
    )
    obj["air_block_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_block(
        obj_char,obj,true,nil,
        "1_4_7_air_block",
        "air","5_stand_idle",
        12.5,5,1.00,
        -7.5,12.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj["OTG_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_and_OTG_hurt(
        obj_char,obj,true,nil,
        "0_general_hurt_launched_high",
        "air","knockdown_recovery",
        20,5,1.035,
        -6.25,2.5,1.035,
        nil,
        load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
            obj_char,
            "0_general_hurt_soft_recovery_ground",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        ),
        nil,nil,
        function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],-200) end
    )
    obj["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
        obj_char,obj,true
    )
    
    obj["hit_hurt_blockstop_countdown"] = 12

    obj["hurt_VFX_insert_function"] = function() end
    obj["hurt_SFX"] = nil
    obj["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
    obj["hurt_block_SFX"] = nil

    obj["hit_counter_ver_function"] = common_game_scene_counter_ver0

    obj["update"] = function()
        obj["x"] = obj_char_other_side["x"]
        obj["y"] = obj_char_other_side["y"]-obj_char_other_side["pushbox"][4]/2
        character_animator(obj,obj["animation"])
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        local image_sprite_sheet = image_sprite_sheet_table[obj["sprite_sheet"]]
        obj[1] = obj_char["shot_sys_reticle"][1]
        obj[2] = obj_char["shot_sys_reticle"][2]
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    obj["enemy_interact_function"] = function()
        if collision_strike_hurtbox_test(obj,obj_char_other_side) and obj["strike_active"] and (not obj_char_other_side["strike_inv"]) then
            -- insert_projectile_VFX
            insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_hit_blast(obj_char,obj_char_other_side)
            -- set_projectile_strike_active
            obj["strike_active"] = false
            -- common_hurt_function
            common_game_scene_projectile_hurt_function(obj_char_other_side,obj)
        end
    end
    -- obj["friendly_interact_function"] = function()

    -- end
    table.insert(obj_char["projectile_table"],obj)
end

function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_main_anim(obj,obj_char,obj_char_other_side)
    local res = {}
    local test_shot_sys_ban_state = obj_char["shot_sys_at_the_ready_force_off_state"][obj_char["state"]]
    res["prop_f"] = "f"
    res["anim_length"] = 40

    for i = 0,19 do
        res[i*2] = function()
            -- draw_correction
            obj[8] = i
        end
    end
    res[0] = function()
        -- state
        obj[1] = obj_char["shot_sys_reticle"][1]
        obj[2] = obj_char["shot_sys_reticle"][2]
        if test_shot_sys_ban_state then
            obj["strike_active"] = false
        end
        -- state_number
        obj["hit_damage"] = 300.0
        obj["hit_damage_correction_factor"] = 1
        obj["hit_heat_gain"] = 10.0
        obj["hit_wallbreak_damage"] = 20.0
        obj["hurt_heat_gain"] = 2.0
        obj["blocked_heat_gain"] = 8.0
        obj["block_heat_gain"] = 2.0
        obj["block_risk_gauge_gain"] = 25.0
        obj["FD_block_heat_drain"] = 5.0
        -- draw_correction
        obj[8] = 0
    end
    res[1] = function()
        if test_shot_sys_ban_state then
            obj["strike_active"] = false
        end
    end
    res[2] = function()
        -- state
        if obj_char["shot_sys_state"] == "at_the_ready_shot" then
            obj[1] = obj_char["shot_sys_reticle"][1]
            obj[2] = obj_char["shot_sys_reticle"][2]
        end
        -- collide
        obj["hitbox_table"] = {}
        obj["strike_active"] = false
        -- draw_correction
        obj[8] = 1
    end
    res[40] = function()
        -- animation_end
    end
    return res
end

function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_block(
    obj_char,projectile,fix_direction,velocity_center,
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
        common_game_scene_projectile_apply_damage_heat(
            obj_char,obj_char_other_side,"block",FD_block,projectile
        )
        common_game_scene_projectile_apply_hurt_velocity(
            obj_char,obj_char_other_side,projectile,
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
        common_game_scene_set_input_sys_cache_init(obj_char_other_side["player_side"])
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[3] = function()
        -- draw_correction
        obj_char_other_side[8] = 3
    end
    res[6] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side["player_side"])
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
function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_block(
    obj_char,projectile,fix_direction,velocity_center,
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
            obj_char_other_side["friction"] = 7
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
        common_game_scene_projectile_apply_damage_heat(
            obj_char,obj_char_other_side,"block",FD_block,projectile
        )
        common_game_scene_projectile_apply_hurt_velocity(
            obj_char,obj_char_other_side,projectile,
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
        obj_char_other_side[8] = 5
        obj_char_other_side["anchor_pos"] = anchor_data_other_side[sprite_sheet]
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side["player_side"])
        -- character_uncommon_init
        character_uncommon_init()
    end
    res[3] = function()
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
    res[26] = function()
        -- input_sys_cache
        obj_char_other_side["input_sys_state"] = "save" -- none save load
        common_game_scene_set_input_sys_cache_init(obj_char_other_side["player_side"])
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
function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_hurt(
    obj_char,projectile,fix_direction,velocity_center,
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
        common_game_scene_projectile_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false,projectile
        )
        common_game_scene_projectile_apply_hurt_velocity(
            obj_char,obj_char_other_side,projectile,
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
        common_game_scene_set_input_sys_cache_init(obj_char_other_side["player_side"])
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
        common_game_scene_set_input_sys_cache_init(obj_char_other_side["player_side"])
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
function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_and_OTG_hurt(
    obj_char,projectile,fix_direction,velocity_center,
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
        common_game_scene_projectile_apply_damage_heat(
            obj_char,obj_char_other_side,"hurt",false,projectile
        )
        common_game_scene_projectile_apply_hurt_velocity(
            obj_char,obj_char_other_side,projectile,
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
        common_game_scene_set_input_sys_cache_init(obj_char_other_side["player_side"])
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

function insert_projectile_game_scene_char_TRM_6SP_P(obj_char)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,0.75,1,1,0,0}
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_projectile_sprite_sheet_table(side)
    
    -- common
    obj["type"] = "projectile"
    obj["projectile_clash_type"] = -1 -- -1: 不与其他飞道交互 0-3：飞行道具等级
    -- obj["projectile_clash_box"] = {}
    -- obj["projectile_clashed_function"] = function end
    obj["hit_type"] = "strike"
    obj["life"] = 90

    obj[1] = obj_char["x"]
    obj[2] = obj_char["y"]
    obj["x"] = obj_char["x"]
    obj["y"] = obj_char["y"]
    obj["f"] = -1
    obj["sprite_sheet"] = "5H_miss_projectile"

    obj["velocity"] = {0,0}

    obj["pushbox"] = nil
    obj["hitbox_table"] = {0,0,100,100}
    obj["hurtbox_table"] = {}

    obj["animation"] = load_game_scene_anim_char_TRM_6SP_P_projectile_main_anim(obj,obj_char,obj_char_other_side)
    -- init_character_anim_with(obj,obj["animation"])

    obj["update"] = function()
        -- obj["x"] = obj_char_other_side["x"]
        -- obj["y"] = obj_char_other_side["y"]-obj_char_other_side["pushbox"][4]/2
        -- character_animator(obj,obj["animation"])
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        -- local image_sprite_sheet = image_sprite_sheet_table[obj["sprite_sheet"]]
        -- obj[1] = obj_char["shot_sys_reticle"][1]
        -- obj[2] = obj_char["shot_sys_reticle"][2]
        -- image_sprite_sheet["sprite_batch"]:clear()
        -- draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        -- love.graphics.setBlendMode("add")
        -- love.graphics.draw(image_sprite_sheet["sprite_batch"])
        -- love.graphics.setBlendMode("alpha")
    end
    obj["enemy_interact_function"] = function()
        -- -- if hit
        -- if collision_strike_hurtbox_test(obj,obj_char_other_side) then

        -- end
    end
end

function load_game_scene_anim_char_TRM_6SP_P_projectile_main_anim(obj,obj_char,obj_char_other_side)
end
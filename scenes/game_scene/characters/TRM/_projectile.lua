-- insert_projectile_game_scene_char_TRM_5H_at_the_ready_shot
-- 1-8 type life x y velocity projectile_clash_type f
-- sprite_sheet
-- enemy_interact_function		hitbox hit_type	hit_guard_type hit_hurt_blockstop_countdown
--                              hit_damage hit_damage_correction_factor 
--                              hit_heat_gain hit_wallbreak_damage hurt_heat_gain 
--                              blocked_heat_gain block_heat_gain block_risk_gauge_gain FD_block_heat_drain
--                              stand_hurt_animation stand_block_animation
--                              crouch_hurt_animation crouch_block_animation
--                              air_hurt_animation air_block_animation
--                              OTG_hurt_animation wallstick_hurt_animation
--                              projectile_active projectile_counter_ver_function
--                              block_SFX counter_SFX hit_SFX_whiff_SFX
--                              hurt_block_VFX_insert_function
-- animation                    projectile_animation camera_x_shake_anim camera_y_shake_anim camera_enclosing_anim enclose_position_offset
-- update/update_sub_frame/draw
-- uncommon
-- projectile_init_fix
function insert_projectile_game_scene_char_TRM_5H_at_the_ready_shot(hit_side_obj_char,hurt_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_projectile = {0,0,0,0.75,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_projectile_sprite_sheet_table = common_game_scene_get_projectile_sprite_sheet_table(hit_side)
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    -- common
    obj_projectile["type"] = "projectile"
    obj_projectile["life"] = 40
    obj_projectile["x"] = hurt_side_obj_char["x"]
    obj_projectile["y"] = hurt_side_obj_char["y"] - hurt_side_obj_char[6]*hurt_side_obj_char["pushbox"][4]/2
    obj_projectile["velocity"] = {0,0}
    obj_projectile["projectile_clash_type"] = -1 -- -1: 不与其他飞道交互 0-3：飞行道具等级
    obj_projectile["f"] = -1
    obj_projectile["sprite_sheet"] = "5H_miss_projectile"
    -- pushbox_interact_function nil
    -- projectile_clashed_function nil
    -- enemy_interact_function
    obj_projectile["hitbox_table"] = {}
    obj_projectile["hit_type"] = "strike"
    obj_projectile["hit_guard_type"] = "all"
    obj_projectile["hit_hurt_blockstop_countdown"] = 12
    obj_projectile["hit_damage"] = 0
    obj_projectile["hit_damage_correction_factor"] = 1
    obj_projectile["hit_heat_gain"] = 0
    obj_projectile["hit_wallbreak_damage"] = 0
    obj_projectile["hurt_heat_gain"] = 0
    obj_projectile["blocked_heat_gain"] = 0
    obj_projectile["block_heat_gain"] = 0
    obj_projectile["block_risk_gauge_gain"] = 0
    obj_projectile["FD_block_heat_drain"] = 0
    obj_projectile["stand_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,true,nil,
        "0_stand_hurt_high",
        "stand","5_stand_idle",
        8,5,1.00,
        0,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj_projectile["stand_block_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_block(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,true,nil,
        "4_stand_block_high",
        "stand","5_stand_idle",
        8,5,1.00,
        0,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj_projectile["crouch_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,true,nil,
        "0_crouch_hurt",
        "crouch","1_2_3_crouch",
        8,5,1.00,
        0,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj_projectile["crouch_block_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_block(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,true,nil,
        "1_crouch_block",
        "crouch","1_2_3_crouch",
        8,5,1.00,
        0,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj_projectile["air_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,true,nil,
        "0_general_hurt_launched_high",
        "air","knockdown_recovery",
        17.5,5,1.035,
        -25,2.5,1.035,
        nil,
        load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_soft_recovery_ground",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        ),
        nil,nil,
        function() hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-200) end
    )
    obj_projectile["air_block_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_block(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,true,nil,
        "1_4_7_air_block",
        "air","5_stand_idle",
        12.5,5,1.00,
        -7.5,12.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj_projectile["OTG_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,true,nil,
        "0_general_hurt_launched_high",
        "air","knockdown_recovery",
        20,5,1.035,
        -6.25,2.5,1.035,
        nil,
        load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_soft_recovery_ground",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        ),
        nil,nil,
        function() hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-200) end
    )
    obj_projectile["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,true
    )
    obj_projectile["projectile_active"] = true
    obj_projectile["projectile_counter_ver_function"] = common_game_scene_counter_ver0
    obj_projectile["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
    obj_projectile["hit_SFX"] = hit_side_move_SFX_table["5H_projectile_hit"]
    obj_projectile["hit_block_SFX"] = hit_side_move_SFX_table["5H_projectile_block"]
    obj_projectile["hit_counter_SFX"] = hit_side_move_SFX_table["5H_projectile_counter"]
    obj_projectile["hit_whiff_SFX"] = hit_side_move_SFX_table["5H_projectile_whiff"]
    obj_projectile["enemy_interact_function"] = function()
        if collision_projectile_hit_confirm_test(obj_projectile,hurt_side_obj_char) then
            -- projectile_active
            obj_projectile["projectile_active"] = false
            -- block_test
            local block_bool = common_game_scene_block_test(obj_projectile,hurt_side_obj_char)
            -- risk_gauge
            if hurt_side_obj_char["risk_gauge"][1] >= hurt_side_obj_char["risk_gauge"][2] and (not block_bool) then
                hurt_side_obj_char["hurt_state"] = "counter"
            end
            -- counter/hit/block
            if hurt_side_obj_char["hurt_state"] == "counter" then -- idle unblock punish counter GP parry
                -- state_number
                obj_projectile["hit_damage"] = obj_projectile["hit_damage"]*1.1
                -- insert_VFX
                insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_hit_blast(hit_side_obj_char,hurt_side_obj_char)
                -- play_SFX
                play_obj_audio(obj_projectile["hit_counter_SFX"])
                stop_obj_audio(obj_projectile["hit_whiff_SFX"])
            elseif not block_bool then
                -- insert_VFX
                insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_hit_blast(hit_side_obj_char,hurt_side_obj_char)
                -- play_SFX
                play_obj_audio(obj_projectile["hit_SFX"])
                stop_obj_audio(obj_projectile["hit_whiff_SFX"])
            elseif block_bool then
                -- insert_VFX
                insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_hit_blast(hit_side_obj_char,hurt_side_obj_char)
                -- play_SFX
                play_obj_audio(obj_projectile["hit_block_SFX"])
                stop_obj_audio(obj_projectile["hit_whiff_SFX"])
            end
            -- common_hurt_function
            common_game_scene_projectile_hurt_function(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
        end
    end
    -- friendly_interact_function nil
    -- friction_update_function nil
    -- gravity_update_function nil
    -- animation
        -- projectile_animation
        -- this projectile is spwaned by an attchment of charcter,so the animation is init and play at same frame with spawning.
    obj_projectile["projectile_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_main(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
    init_character_anim_without(obj_projectile,obj_projectile["projectile_animation"])
        -- camera_animation
    obj_projectile["camera_x_shake_anim"] = nil
    obj_projectile["camera_y_shake_anim"] = nil
    obj_projectile["camera_enclosing_anim"] = nil
    obj_projectile["enclose_position_offset"] = nil
    common_game_scene_hit_load_camera_shake_anim(obj_projectile,0.25,15)
    common_game_scene_nil_load_camera_enclose_anim(obj_projectile)
    -- update
    obj_projectile["update"] = function()
        obj_projectile["x"] = hurt_side_obj_char["x"]
        obj_projectile["y"] = hurt_side_obj_char["y"] - hurt_side_obj_char[6]*hurt_side_obj_char["pushbox"][4]/2
        character_animator(obj_projectile,obj_projectile["projectile_animation"])
        obj_projectile["life"] = obj_projectile["life"] - 1
    end
    obj_projectile["update_sub_frame"] = function()
        obj_projectile["x"] = hurt_side_obj_char["x"]
        obj_projectile["y"] = hurt_side_obj_char["y"] - hurt_side_obj_char[6]*hurt_side_obj_char["pushbox"][4]/2
    end
    -- draw
    obj_projectile["draw"] = function()
        local image_sprite_sheet = hit_side_projectile_sprite_sheet_table[obj_projectile["sprite_sheet"]]
        if obj_projectile["sprite_sheet"] == "5H_hit_projectile" then
            obj_projectile[1] = hit_side_obj_char["shot_sys_reticle"][1]
            obj_projectile[2] = hit_side_obj_char["shot_sys_reticle"][2]
        end
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_projectile,image_sprite_sheet,tostring(obj_projectile[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    -- uncommon nil
    -- projectile_init_fix
    obj_projectile[1] = hit_side_obj_char["shot_sys_reticle"][1]
    obj_projectile[2] = hit_side_obj_char["shot_sys_reticle"][2]
    if (hit_side_obj_char["shot_sys_aim_process"][1] >= hit_side_obj_char["shot_sys_aim_process"][3]) then
        obj_projectile["hitbox_table"] = {{0,0,200,200}}
        obj_projectile["sprite_sheet"] = "5H_hit_projectile"
    end
    -- insert_projectile
    table.insert(hit_side_obj_char["projectile_table"],obj_projectile)
end
function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_main(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
    local res = {}
    local test_shot_sys_ban_state = hit_side_obj_char["shot_sys_at_the_ready_force_off_state"][hit_side_obj_char["state"]]
    res["prop_f"] = "f"
    res["anim_length"] = 40
    for i = 0,19 do
        res[i*2] = function()
            -- draw_correction
            obj_projectile[8] = i
        end
    end
    res[0] = function()
        -- state
        obj_projectile[1] = hit_side_obj_char["shot_sys_reticle"][1]
        obj_projectile[2] = hit_side_obj_char["shot_sys_reticle"][2]
        if test_shot_sys_ban_state then
            obj_projectile["projectile_active"] = false
        end
        -- state_number
        obj_projectile["hit_damage"] = 300.0
        obj_projectile["hit_damage_correction_factor"] = 1
        obj_projectile["hit_heat_gain"] = 10.0
        obj_projectile["hit_wallbreak_damage"] = 20.0
        obj_projectile["hurt_heat_gain"] = 2.0
        obj_projectile["blocked_heat_gain"] = 8.0
        obj_projectile["block_heat_gain"] = 2.0
        obj_projectile["block_risk_gauge_gain"] = 25.0
        obj_projectile["FD_block_heat_drain"] = 5.0
        -- draw_correction
        obj_projectile[8] = 0
        -- play_SFX
        play_obj_audio(obj_projectile["hit_whiff_SFX"])
    end
    res[1] = function()
        if test_shot_sys_ban_state then
            obj_projectile["projectile_active"] = false
        end
    end
    res[2] = function()
        -- state
        if hit_side_obj_char["shot_sys_state"] == "at_the_ready_shot" then
            obj_projectile[1] = hit_side_obj_char["shot_sys_reticle"][1]
            obj_projectile[2] = hit_side_obj_char["shot_sys_reticle"][2]
        end
        -- collide
        obj_projectile["hitbox_table"] = {}
        obj_projectile["projectile_active"] = false
        -- draw_correction
        obj_projectile[8] = 1
    end
    res[40] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_block(
    hit_side_obj_char,hurt_side_obj_char,obj_projectile,fix_direction,velocity_center,
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
        common_game_scene_projectile_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false,
            "character"
        )
        common_game_scene_projectile_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,"block",FD_block
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
    res[3] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[6] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)(hurt_side_obj_char)
        -- draw_correction
        hurt_side_obj_char[8] = 2
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
function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_block(
    hit_side_obj_char,hurt_side_obj_char,obj_projectile,fix_direction,velocity_center,
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
            hurt_side_obj_char["throw_inv"] = true
            hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5-13
            hurt_side_obj_char["friction"] = 7
            hurt_side_obj_char["gravity"] = 2.5
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
        common_game_scene_projectile_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false,
            "character"
        )
        common_game_scene_projectile_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,"block",FD_block
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
    res[3] = function()
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
    res[26] = function()
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
function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_hurt(
    hit_side_obj_char,hurt_side_obj_char,obj_projectile,fix_direction,velocity_center,
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
        common_game_scene_projectile_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false,
            "character"
        )
        common_game_scene_projectile_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,"hurt",false
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
function load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_and_OTG_hurt(
    hit_side_obj_char,hurt_side_obj_char,obj_projectile,fix_direction,velocity_center,
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
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,
            hurt_horizontal_velocity,
            hurt_horizontal_friction,
            hurt_horizontal_velocity_correction,
            hurt_vertical_velocity,
            hurt_vertical_gravity,
            hurt_vertical_gravity_correction,
            false,
            "character"
        )
        common_game_scene_projectile_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,"hurt",false
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
-- insert_projectile_game_scene_char_TRM_6SP_P
-- 1-8 type life x y velocity projectile_clash_type f
-- state sprite_sheet
-- enemy_interact_function		hitbox projectile_active
--                              block_SFX counter_SFX hit_SFX_whiff_SFX
--                              hit_VFX_insert_function
-- gravity_update_function		gravity
-- animation                    projectile_animation
-- update/update_sub_frame/draw
-- uncommon
-- projectile_init_fix
function insert_projectile_game_scene_char_TRM_6SP_P(hit_side_obj_char,hurt_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_projectile = {0,0,0,0.875,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local hit_side_projectile_sprite_sheet_table = common_game_scene_get_projectile_sprite_sheet_table(hit_side_obj_char["player_side"])
    -- common
    obj_projectile["type"] = "projectile"
    obj_projectile["life"] = 42+45
    obj_projectile["x"] = hit_side_obj_char["x"]
    obj_projectile["y"] = hit_side_obj_char["y"]
    obj_projectile["velocity"] = {0,0}
    obj_projectile["projectile_clash_type"] = -1 -- -1: 不与其他飞道交互 0-3：飞行道具等级
    obj_projectile["f"] = -1
    obj_projectile["state"] = "in_spawner"
    obj_projectile["sprite_sheet"] = "6SP_P_curse_ball_loop_projectile"
    -- pushbox_interact_function nil
    -- projectile_clashed_function nil
    -- enemy_interact_function
    obj_projectile["hitbox_table"] = {}
    obj_projectile["projectile_active"] = true
    obj_projectile["hit_VFX_insert_function"] = function()
        for i = 1,#hurt_side_obj_char["VFX_status_back_table"] do
            local current_VFX = hurt_side_obj_char["VFX_status_back_table"][i]
            if current_VFX["status_name"] == "TRM_6SP_P_arua" and current_VFX["state"] ~= "end" then
                return
            end
        end
        insert_VFX_game_scene_char_TRM_6SP_P_arua(hit_side_obj_char,hurt_side_obj_char)
    end
    obj_projectile["hit_SFX"] = nil
    obj_projectile["hit_block_SFX"] = nil
    obj_projectile["hit_counter_SFX"] = nil
    obj_projectile["hit_whiff_SFX"] = nil
    obj_projectile["ground_bounce_SFX"] = nil
    obj_projectile["enemy_interact_function"] = function()
        if collision_uncondicational_hit_confirm_test(obj_projectile,hurt_side_obj_char) then
            -- blast_state_init
            obj_projectile["velocity"] = {0,0}
            obj_projectile["sprite_sheet"] = "6SP_P_curse_ball_blast_projectile"
            obj_projectile["state"] = "blast"
            obj_projectile["hitbox_table"] = {}
            obj_projectile["projectile_active"] = false
            -- insert_VFX
            obj_projectile["hit_VFX_insert_function"]()
            -- play_SFX
            play_obj_audio(obj_projectile["hit_SFX"])
            stop_obj_audio(obj_projectile["hit_whiff_SFX"])
            stop_obj_audio(obj_projectile["ground_bounce_SFX"])
            obj_projectile["gravity"] = 0
            obj_projectile["projectile_animation"] = load_game_scene_anim_char_TRM_6SP_P_projectile_blast(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
            init_character_anim_with(obj_projectile,obj_projectile["projectile_animation"])
            -- shot_sys_curse
            hit_side_obj_char["shot_sys_curse"] = true
            hit_side_obj_char["shot_sys_curse_countdown"] = 420
        end
    end
    -- gravity_update_function
    obj_projectile["gravity"] = 0
    obj_projectile["gravity_update_function"] = function()
        if not hit_side_obj_char["run_at_current_sub_frame"] then
            return
        end
        obj_projectile["velocity"][2] = obj_projectile["velocity"][2] + obj_projectile["gravity"]
    end
    -- animation
        -- projectile_animation
        -- this projectile is spwaned by an attchment of charcter,so the animation is init and play at same frame with spawning
    obj_projectile["projectile_animation"] = load_game_scene_anim_char_TRM_6SP_P_projectile_in_spawner(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
    init_character_anim_without(obj_projectile,obj_projectile["projectile_animation"])
    -- update
    obj_projectile["update"] = function()
        if not hit_side_obj_char["run_at_current_frame"] then
            return
        end
        if hurt_side_obj_char["state_cache"] == "wallstick" then
            return
        end
        local switch = {
            ["in_spawner"] = function()
                character_animator(obj_projectile,obj_projectile["projectile_animation"])
                obj_projectile["x"] = hit_side_obj_char["x"] + hit_side_obj_char[5]*obj_projectile["in_spawner_offset_x"]
                obj_projectile["y"] = hit_side_obj_char["y"] + obj_projectile["in_spawner_offset_y"]
                if get_character_anim_end_state(obj_projectile,obj_projectile["projectile_animation"]) then
                    obj_projectile["state"] = "in_air"
                    obj_projectile["hitbox_table"] = {{0,0,160,160}}
                    obj_projectile["projectile_animation"] = load_game_scene_anim_char_TRM_6SP_P_projectile_in_air(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
                    obj_projectile["velocity"] = {obj_projectile[5]*20,-12.5}
                    obj_projectile["gravity"] = 2.5
                    obj_projectile[8] = 0
                end
            end,
            ["in_air"] = function()
                character_animator(obj_projectile,obj_projectile["projectile_animation"])
                obj_projectile["life"] = obj_projectile["life"] - 1
                if obj_projectile["life"] <= 45 then
                    -- blast_state_init
                    obj_projectile["velocity"] = {0,0}
                    obj_projectile["sprite_sheet"] = "6SP_P_curse_ball_blast_projectile"
                    obj_projectile["state"] = "blast"
                    obj_projectile["hitbox_table"] = {}
                    obj_projectile["projectile_active"] = false
                    stop_obj_audio(obj_projectile["hit_whiff_SFX"])
                    play_obj_audio(obj_projectile["hit_SFX"])
                    obj_projectile["gravity"] = 0
                    obj_projectile["projectile_animation"] = load_game_scene_anim_char_TRM_6SP_P_projectile_blast(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
                    init_character_anim_with(obj_projectile,obj_projectile["projectile_animation"])
                end
            end,
            ["blast"] = function()
                character_animator(obj_projectile,obj_projectile["projectile_animation"])
                if get_character_anim_end_state(obj_projectile,obj_projectile["projectile_animation"]) then
                    obj_projectile["life"] = 0
                end
            end
        }
        local this_function = switch[obj_projectile["state"]]
        if this_function then this_function() end
    end
    obj_projectile["update_sub_frame"] = function()
        if not hit_side_obj_char["run_at_current_sub_frame"] then
            return
        end
        local switch = {
            ["in_spawner"] = function()
                obj_projectile["x"] = hit_side_obj_char["x"] + hit_side_obj_char[5]*obj_projectile["in_spawner_offset_x"]
                obj_projectile["y"] = hit_side_obj_char["y"] + obj_projectile["in_spawner_offset_y"]
            end,
            ["in_air"] = function()
                obj_projectile["x"] = obj_projectile["x"] + obj_projectile["velocity"][1]/COLLIDE_TICK
                obj_projectile["y"] = obj_projectile["y"] + obj_projectile["velocity"][2]/COLLIDE_TICK
                if obj_projectile["y"] > -25 then
                    obj_projectile["y"] = -25
                    obj_projectile["velocity"] = {obj_projectile[5]*25,-32.5}
                    play_obj_audio(obj_projectile["ground_bounce_SFX"])
                end
            end,
            ["blast"] = function()
            end
        }
        local this_function = switch[obj_projectile["state"]]
        if this_function then this_function() end
    end
    -- draw
    obj_projectile["draw"] = function()
        local switch = {
            ["in_spawner"] = function()
                local image_sprite_sheet = hit_side_projectile_sprite_sheet_table[obj_projectile["sprite_sheet"]]
                obj_projectile[1] = obj_projectile["x"] - hit_side_obj_char[5]*80
                obj_projectile[2] = obj_projectile["y"] - 80
                image_sprite_sheet["sprite_batch"]:clear()
                draw_3d_image_sprite_batch(obj_camera,obj_projectile,image_sprite_sheet,tostring(obj_projectile[8]))
                love.graphics.setColor(1,1,1,obj_projectile[4])
                love.graphics.draw(image_sprite_sheet["sprite_batch"])
                love.graphics.setColor(1,1,1,1)
            end,
            ["in_air"] = function()
                local image_sprite_sheet = hit_side_projectile_sprite_sheet_table[obj_projectile["sprite_sheet"]]
                obj_projectile[1] = obj_projectile["x"] - hit_side_obj_char[5]*80
                obj_projectile[2] = obj_projectile["y"] - 80
                image_sprite_sheet["sprite_batch"]:clear()
                draw_3d_image_sprite_batch(obj_camera,obj_projectile,image_sprite_sheet,tostring(obj_projectile[8]))
                love.graphics.setColor(1,1,1,obj_projectile[4])
                love.graphics.draw(image_sprite_sheet["sprite_batch"])
                love.graphics.setColor(1,1,1,1)
            end,
            ["blast"] = function()
                local image_sprite_sheet = hit_side_projectile_sprite_sheet_table[obj_projectile["sprite_sheet"]]
                obj_projectile[1] = obj_projectile["x"] - hit_side_obj_char[5]*250
                obj_projectile[2] = obj_projectile["y"] - 250
                image_sprite_sheet["sprite_batch"]:clear()
                draw_3d_image_sprite_batch(obj_camera,obj_projectile,image_sprite_sheet,tostring(obj_projectile[8]))
                love.graphics.setColor(1,1,1,obj_projectile[4])
                love.graphics.draw(image_sprite_sheet["sprite_batch"])
                love.graphics.setColor(1,1,1,1)
            end
        }
        local this_function = switch[obj_projectile["state"]]
        if this_function then this_function() end
    end
    -- uncommon
    obj_projectile["in_spawner_offset_x"] = 0
    obj_projectile["in_spawner_offset_y"] = 0
    obj_projectile["ground_collide"] = false
    -- projectile_init_fix
    obj_projectile["x"] = hit_side_obj_char["x"] + obj_projectile["in_spawner_offset_x"]*hit_side_obj_char[5]
    obj_projectile["y"] = hit_side_obj_char["y"] + obj_projectile["in_spawner_offset_y"]
    obj_projectile[1] = obj_projectile["x"] - hit_side_obj_char[5]*80
    obj_projectile[2] = obj_projectile["y"] - 80
    obj_projectile[5] = hit_side_obj_char[5]
    -- insert_projectile
    table.insert(hit_side_obj_char["projectile_table"],obj_projectile)
end
function load_game_scene_anim_char_TRM_6SP_P_projectile_in_spawner(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
    local res = {}
    res["prop_f"] = "f"
    res["anim_length"] = 4
    res[0] = function()
        obj_projectile["in_spawner_offset_x"] = 105.0
        obj_projectile["in_spawner_offset_y"] = -175.0
        obj_projectile[8] = 0
    end
    res[1] = function()
        obj_projectile["in_spawner_offset_x"] = 111.7
        obj_projectile["in_spawner_offset_y"] = -175.8
    end
    res[2] = function()
        obj_projectile["in_spawner_offset_x"] = 118.3
        obj_projectile["in_spawner_offset_y"] = -176.6
        obj_projectile[8] = 1
    end
    res[3] = function()
        obj_projectile["in_spawner_offset_x"] = 125.0
        obj_projectile["in_spawner_offset_y"] = -177.5
    end
    res[4] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_6SP_P_projectile_in_air(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
    local res = {}
    res["prop_f"] = "f"
    res["anim_length"] = 61
    for i = 0,29 do
        res[i*2] = function() obj_projectile[8] = i end
    end
    res[60] = function()
        obj_projectile[8] = 0
        obj_projectile["f"] = 0
    end
    res[61] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_6SP_P_projectile_blast(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
    local res = {}
    res["prop_f"] = "f"
    res["anim_length"] = 45
    for i = 0,22 do
        res[i*2] = function() obj_projectile[8] = i end
    end
    res[45] = function()
        -- animation_end
    end
    return res
end

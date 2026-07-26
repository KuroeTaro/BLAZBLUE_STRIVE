-- global_projectile_prop_table
-- 1-8 type life x y velocity projectile_clash_type f
-- state state_cache physics_lock sprite_sheet
-- pushbox_interact_function	pushbox
-- projectile_clashed_function	projectile_clash_box
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
--                              hit_VFX_dynamic_spawn_pos
--                              hit_VFX_insert_function hit_VFX_insert_function_argument
--                              hit_counter_VFX_insert_function hit_counter_VFX_insert_function_argument
--                              hit_block_VFX_insert_function hit_block_VFX_insert_function_argument
--                              hurt_block_VFX_insert_function
-- friendly_interact_function   same_as_above
-- friction_update_function	    friction
-- gravity_update_function		gravity
-- animation                    projectile_animation camera_x_shake_anim camera_y_shake_anim camera_enclosing_anim enclose_position_offset
-- update/update_sub_frame/draw
-- uncommon
-- projectile_init_fix
-- min_require common_projectile_hit_function
    -- state
    -- state_cache
    -- physics_lock
    -- hit_damage
    -- hit_damage_correction_factor
    -- hit_heat_gain
    -- hit_wallbreak_damage
    -- hurt_heat_gain
    -- blocked_heat_gain
    -- block_heat_gain
    -- block_risk_gauge_gain
    -- FD_block_heat_drain
    -- hit_VFX_insert_function
    -- hit_SFX
    -- hit_block_VFX_insert_function
    -- hit_block_SFX
    -- hit_counter_VFX_insert_function
    -- hit_counter_SFX
-- min_require common_projectile_hurt_function
    -- hit_guard_type
    -- hit_hurt_blockstop_countdown
    -- camera_x_shake_anim
    -- camera_y_shake_anim
    -- camera_enclosing_anim
    -- enclose_position_offset
    -- stand_block_animation crouch_block_animation air_block_animation
    -- stand_hurt_animation crouch_hurt_animation air_hurt_animation OTG_hurt_animation wallstick_hurt_animation
    -- projectile_counter_ver_function
    -- hurt_block_VFX_insert_function
    -- hurt_block_SFX
-- min_require common_projectile_clashed_by_char
    -- state
    -- state_cache
    -- physics_lock
    -- projectile_clash_box
function load_game_scene_anim_projectile_RC_main(obj_projectile)
    local res = {}
    res["prop_f"] = "f"
    res["anim_length"] = 15
    for i = 0,14 do
        res[i*2] = function()
            obj_projectile[8] = i
        end
    end
    res[1] = function()
        obj_projectile["hitbox_table"] = {}
    end
    res[15] = function()
        -- animation_end
    end
    return res
end
-- insert_projectile_game_scene_char_common_RC_shockwave_red
-- 1-8 type life x y velocity projectile_clash_type f
-- enemy_interact_function		hitbox hit_guard_type hit_damage hit_damage_correction_factor 
--                              hit_heat_gain hit_wallbreak_damage hurt_heat_gain 
--                              blocked_heat_gain block_heat_gain block_risk_gauge_gain FD_block_heat_drain
--                              stand_hurt_animation stand_block_animation
--                              crouch_hurt_animation crouch_block_animation
--                              air_hurt_animation air_block_animation
--                              OTG_hurt_animation wallstick_hurt_animation
--                              projectile_active projectile_counter_ver_function
--                              block_SFX counter_SFX hit_SFX_whiff_SFX
--                              hit_VFX_insert_function
--                              hurt_block_VFX_insert_function
-- animation                    projectile_animation camera_x_shake_anim camera_y_shake_anim camera_enclosing_anim enclose_position_offset
-- update/update_sub_frame/draw
-- uncommon
-- projectile_init_fix
function insert_projectile_game_scene_char_common_RC_shockwave_red(hit_side_obj_char,hurt_side_obj_char)
    local obj_projectile = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RC_shockwave
    -- clear_projectile_RC_table
    hit_side_obj_char["projectile_RC_table"] = {}
    -- common
    obj_projectile["type"] = "projectile"
    obj_projectile["life"] = 30
    obj_projectile["x"] = hit_side_obj_char["x"]
    obj_projectile["y"] = hit_side_obj_char["y"]
    obj_projectile["velocity"] = {hit_side_obj_char["velocity"][1],hit_side_obj_char["velocity"][2]}
    obj_projectile["projectile_clash_type"] = -1 -- -1: 不与其他飞道交互 0-3：飞行道具等级
    obj_projectile["f"] = -1
    -- enemy_interact_function
    obj_projectile["hitbox_table"] = {{0,0,1000,800},{0,0,800,1000}}
    obj_projectile["hit_guard_type"] = "all"
    obj_projectile["hit_damage"] = 0
    obj_projectile["hit_damage_correction_factor"] = 1
    obj_projectile["hit_heat_gain"] = 0
    obj_projectile["hit_wallbreak_damage"] = 0
    obj_projectile["hurt_heat_gain"] = 0
    obj_projectile["blocked_heat_gain"] = 0
    obj_projectile["block_heat_gain"] = 0
    obj_projectile["block_risk_gauge_gain"] = 0
    obj_projectile["FD_block_heat_drain"] = 0
    obj_projectile["stand_hurt_animation"] = load_game_scene_anim_char_RC_red_projectile_ground_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"0_general_hurt_launched_high",
        "air","knockdown",
        7.5,5,1.00,
        -7.5,1.0,1.00,
        load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_up(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_hard_knockdown_up",
            "air",
            "knockdown_recovery",
            -5,5,1.00,
            -10,2.5,1.00,
            nil,nil,nil,nil,function() end
        ),
        load_game_scene_anim_char_common_0_general_hurt_hard_recovery_up(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_hard_recovery_up",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        ),
        nil,nil,
        function() hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-290) end
    )
    obj_projectile["stand_block_animation"] = load_game_scene_anim_char_RC_red_projectile_ground_block(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"4_stand_block_high",
        "stand","5_stand_idle",
        8,5,1.00,
        0,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj_projectile["crouch_hurt_animation"] = load_game_scene_anim_char_RC_red_projectile_ground_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"0_general_hurt_launched_high",
        "air","knockdown",
        7.5,5,1.00,
        -7.5,1.0,1.00,
        load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_up(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_hard_knockdown_up",
            "air",
            "knockdown_recovery",
            -5,5,1.00,
            -10,2.5,1.00,
            nil,nil,nil,nil,function() end
        ),
        load_game_scene_anim_char_common_0_general_hurt_hard_recovery_up(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_hard_recovery_up",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        ),
        nil,nil,
        function() hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-290) end
    )
    obj_projectile["crouch_block_animation"] = load_game_scene_anim_char_RC_red_projectile_ground_block(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"1_crouch_block",
        "crouch","1_2_3_crouch",
        8,5,1.00,
        0,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj_projectile["air_hurt_animation"] = load_game_scene_anim_char_RC_red_projectile_ground_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"0_general_hurt_launched_high",
        "air","knockdown",
        7.5,5,1.00,
        -7.5,1.0,1.00,
        load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_up(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_hard_knockdown_up",
            "air",
            "knockdown_recovery",
            -5,5,1.00,
            -10,2.5,1.00,
            nil,nil,nil,nil,function() end
        ),
        load_game_scene_anim_char_common_0_general_hurt_hard_recovery_up(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_hard_recovery_up",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        ),
        nil,nil,
        function() hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-290) end
    )
    obj_projectile["air_block_animation"] = load_game_scene_anim_char_RC_red_projectile_air_block(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"1_4_7_air_block",
        "air","5_stand_idle",
        7.5,5,1.00,
        -7.5,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj_projectile["OTG_hurt_animation"] = load_game_scene_anim_char_RC_red_projectile_ground_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"0_general_hurt_launched_high",
        "air","knockdown",
        7.5,5,1.00,
        -5,2.5,1.00,
        load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_up(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_hard_knockdown_up",
            "air",
            "knockdown_recovery",
            -5,5,1.00,
            -10,2.5,1.00,
            nil,nil,nil,nil,function() end
        ),
        load_game_scene_anim_char_common_0_general_hurt_hard_recovery_up(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_hard_recovery_up",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        ),
        nil,nil,
        function() hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-200) end
    )
    obj_projectile["wallstick_hurt_animation"] = load_game_scene_anim_char_RC_red_projectile_ground_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"0_general_hurt_launched_high",
        "air","knockdown",
        7.5,5,1.00,
        -15,1.0,1.00,
        load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_up(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_hard_knockdown_up",
            "air",
            "knockdown_recovery",
            -5,5,1.00,
            -10,2.5,1.00,
            nil,nil,nil,nil,function() end
        ),
        load_game_scene_anim_char_common_0_general_hurt_hard_recovery_up(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_hard_recovery_up",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        ),
        nil,nil,
        function() hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-200) end
    )
    obj_projectile["projectile_active"] = true
    obj_projectile["projectile_counter_ver_function"] = common_game_scene_counter_ver0
    obj_projectile["block_SFX"] = nil
    obj_projectile["counter_SFX"] = nil
    obj_projectile["hit_SFX"] = nil
    obj_projectile["whiff_SFX"] = nil
    obj_projectile["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_special
    obj_projectile["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_RC_red
    obj_projectile["enemy_interact_function"] = function()
        -- if hit
        if collision_uncondicational_hit_confirm_test(obj_projectile,hurt_side_obj_char) and obj_projectile["projectile_active"] and (not hurt_side_obj_char["strike_inv"]) then
            -- projectile_active
            obj_projectile["projectile_active"] = false
            -- block_test
            local block_bool = common_game_scene_block_test(obj_projectile,hurt_side_obj_char)
            -- risk_gauge
            if hurt_side_obj_char["risk_gauge"][1] >= hurt_side_obj_char["risk_gauge"][2] and (not block_bool) then
                hurt_side_obj_char["hurt_state"] = "counter"
            end
            -- insert_projectile_VFX 
            if not block_bool then
                obj_projectile["hit_VFX_insert_function"](hit_side_obj_char,hurt_side_obj_char)
                -- SFX_audio_code_place_holder
            end
            -- common_hurt_function
            common_game_scene_projectile_RC_red_yellow_hurt_function(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
        end
    end
    -- animation
        -- projectile_animation
    obj_projectile["projectile_animation"] = load_game_scene_anim_projectile_RC_main(obj_projectile)
    init_character_anim_without(obj_projectile,obj_projectile["projectile_animation"])
        -- camera_animation
    obj_projectile["camera_x_shake_anim"] = nil
    obj_projectile["camera_y_shake_anim"] = nil
    obj_projectile["camera_enclosing_anim"] = nil
    obj_projectile["enclose_position_offset"] = {0,0,0}
    -- update
    obj_projectile["update"] = function()
        if hit_side_obj_char["height"] == "air" then
            obj_projectile["y_offset"] = 150
        else
            obj_projectile["y_offset"] = 280
        end
        obj_projectile["x"] = hit_side_obj_char["x"]
        obj_projectile["y"] = hit_side_obj_char["y"] - obj_projectile["y_offset"]
        character_animator(obj_projectile,obj_projectile["projectile_animation"])
        obj_projectile["life"] = obj_projectile["life"] - 1
    end
    obj_projectile["update_sub_frame"] = function()
        obj_projectile["x"] = hit_side_obj_char["x"]
        obj_projectile["y"] = hit_side_obj_char["y"] - obj_projectile["y_offset"]
    end
    -- draw
    obj_projectile["draw"] = function()
        obj_projectile[1] = obj_projectile["x"] - hit_side_obj_char[5]*600
        obj_projectile[2] = obj_projectile["y"] - 600
        obj_projectile[5] = hit_side_obj_char[5]
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_projectile,image_sprite_sheet,tostring(obj_projectile[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    -- uncommon nil
    -- projectile_init_fix
    if hit_side_obj_char["height"] == "air" then
        obj_projectile["y_offset"] = 150
    else
        obj_projectile["y_offset"] = 280
    end
    obj_projectile["x"] = hit_side_obj_char["x"]
    obj_projectile["y"] = hit_side_obj_char["y"] - obj_projectile["y_offset"]
    obj_projectile[1] = obj_projectile["x"] - hit_side_obj_char[5]*600
    obj_projectile[2] = obj_projectile["y"] - 600
    obj_projectile[5] = hit_side_obj_char[5]
    -- insert_projectile
    table.insert(hit_side_obj_char["projectile_RC_table"],obj_projectile)
end
-- insert_projectile_game_scene_char_common_RC_shockwave_blue
-- 1-8 type life x y velocity projectile_clash_type f
-- enemy_interact_function		hitbox projectile_active
-- animation                    projectile_animation
-- update/update_sub_frame/draw
-- uncommon
-- projectile_init_fix
function insert_projectile_game_scene_char_common_RC_shockwave_blue(hit_side_obj_char,hurt_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_projectile = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RC_shockwave
    -- clear_projectile_RC_table
    hit_side_obj_char["projectile_RC_table"] = {}
    -- common
    obj_projectile["type"] = "projectile"
    obj_projectile["life"] = 30
    obj_projectile["x"] = hit_side_obj_char["x"]
    obj_projectile["y"] = hit_side_obj_char["y"]
    obj_projectile["velocity"] = {hit_side_obj_char["velocity"][1],hit_side_obj_char["velocity"][2]}
    obj_projectile["projectile_clash_type"] = -1 -- -1: 不与其他飞道交互 0-3：飞行道具等级
    obj_projectile["f"] = -1
    -- enemy_interact_function
    obj_projectile["hitbox_table"] = {{0,0,1000,800},{0,0,800,1000}}
    obj_projectile["projectile_active"] = true
    obj_projectile["enemy_interact_function"] = function()
        local hit_side = hit_side_obj_char["player_side"]
        local hurt_side = hurt_side_obj_char["player_side"]
        -- if hit
        if collision_uncondicational_hit_confirm_test(obj_projectile,hurt_side_obj_char) and obj_projectile["projectile_active"] then
            -- projectile_hit_active
            obj_projectile["projectile_active"] = false
            -- physics_lock
            hurt_side_obj_char["physics_lock"] = false
            -- common_hurt_function
            common_game_scene_projectile_RC_blue_purple_hurt_function(
                hit_side_obj_char,hurt_side_obj_char,{1,2,1,59,45-27,nil}
            )
        end
    end
    -- animation
        -- projectile_animation
    obj_projectile["projectile_animation"] = load_game_scene_anim_projectile_RC_main(obj_projectile)
    init_character_anim_without(obj_projectile,obj_projectile["projectile_animation"])
    -- update
    obj_projectile["update"] = function()
        if hit_side_obj_char["height"] == "air" then
            obj_projectile["y_offset"] = 150
        else
            obj_projectile["y_offset"] = 280
        end
        obj_projectile["x"] = hit_side_obj_char["x"]
        obj_projectile["y"] = hit_side_obj_char["y"] - obj_projectile["y_offset"]
        character_animator(obj_projectile,obj_projectile["projectile_animation"])
        obj_projectile["life"] = obj_projectile["life"] - 1
    end
    obj_projectile["update_sub_frame"] = function()
        obj_projectile["x"] = hit_side_obj_char["x"]
        obj_projectile["y"] = hit_side_obj_char["y"] - obj_projectile["y_offset"]
    end
    -- draw
    obj_projectile["draw"] = function()
        obj_projectile[1] = obj_projectile["x"] - hit_side_obj_char[5]*600
        obj_projectile[2] = obj_projectile["y"] - 600
        obj_projectile[5] = hit_side_obj_char[5]
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_projectile,image_sprite_sheet,tostring(obj_projectile[8]))
        love.graphics.setBlendMode("add")
        love.graphics.setColor(1,1,1,1)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
        love.graphics.setBlendMode("alpha")
    end
    -- uncommon
    -- projectile_init_fix
    if hit_side_obj_char["height"] == "air" then
        obj_projectile["y_offset"] = 150
    else
        obj_projectile["y_offset"] = 280
    end
    obj_projectile["x"] = hit_side_obj_char["x"]
    obj_projectile["y"] = hit_side_obj_char["y"] - obj_projectile["y_offset"]
    obj_projectile[1] = obj_projectile["x"] - hit_side_obj_char[5]*600
    obj_projectile[2] = obj_projectile["y"] - 600
    obj_projectile[5] = hit_side_obj_char[5]
    -- insert_projectile
    table.insert(hit_side_obj_char["projectile_RC_table"],obj_projectile)
end
-- insert_projectile_game_scene_char_common_RC_shockwave_purple
-- 1-8 type life x y velocity projectile_clash_type f
-- enemy_interact_function		hitbox projectile_active
-- animation                    projectile_animation camera_animation
-- update/update_sub_frame/draw
-- uncommon
-- projectile_init_fix
function insert_projectile_game_scene_char_common_RC_shockwave_purple(hit_side_obj_char,hurt_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_projectile = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RC_shockwave
    -- clear_projectile_RC_table
    hit_side_obj_char["projectile_RC_table"] = {}
    -- common
    obj_projectile["type"] = "projectile"
    obj_projectile["life"] = 30
    obj_projectile["x"] = hit_side_obj_char["x"]
    obj_projectile["y"] = hit_side_obj_char["y"]
    obj_projectile["velocity"] = {hit_side_obj_char["velocity"][1],hit_side_obj_char["velocity"][2]}
    obj_projectile["projectile_clash_type"] = -1 -- -1: 不与其他飞道交互 0-3：飞行道具等级
    obj_projectile["f"] = -1
    -- enemy_interact_function
    obj_projectile["hitbox_table"] = {{0,0,1000,800},{0,0,800,1000}}
    obj_projectile["projectile_active"] = true
    obj_projectile["enemy_interact_function"] = function()
        local hit_side = hit_side_obj_char["player_side"]
        local hurt_side = hurt_side_obj_char["player_side"]
        -- if hit
        if collision_uncondicational_hit_confirm_test(obj_projectile,hurt_side_obj_char) and obj_projectile["projectile_active"] then
            -- projectile_hit_active
            obj_projectile["projectile_active"] = false
            -- physics_lock
            hurt_side_obj_char["physics_lock"] = false
            -- common_hurt_function
            common_game_scene_projectile_RC_blue_purple_hurt_function(
                hit_side_obj_char,hurt_side_obj_char,{1,2,1,19,45-27,nil}
            )
        end
    end
    -- animation
        -- projectile_animation
    obj_projectile["projectile_animation"] = load_game_scene_anim_projectile_RC_main(obj_projectile)
    init_character_anim_without(obj_projectile,obj_projectile["projectile_animation"])
    -- update
    obj_projectile["update"] = function()
        if hit_side_obj_char["height"] == "air" then
            obj_projectile["y_offset"] = 150
        else
            obj_projectile["y_offset"] = 280
        end
        obj_projectile["x"] = hit_side_obj_char["x"]
        obj_projectile["y"] = hit_side_obj_char["y"] - obj_projectile["y_offset"]
        character_animator(obj_projectile,obj_projectile["projectile_animation"])
        obj_projectile["life"] = obj_projectile["life"] - 1
    end
    obj_projectile["update_sub_frame"] = function()
        obj_projectile["x"] = hit_side_obj_char["x"]
        obj_projectile["y"] = hit_side_obj_char["y"] - obj_projectile["y_offset"]
    end
    -- draw
    obj_projectile["draw"] = function()
        obj_projectile[1] = obj_projectile["x"] - hit_side_obj_char[5]*600
        obj_projectile[2] = obj_projectile["y"] - 600
        obj_projectile[5] = hit_side_obj_char[5]
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_projectile,image_sprite_sheet,tostring(obj_projectile[8]))
        love.graphics.setBlendMode("add")
        love.graphics.setColor(1,1,1,1)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
        love.graphics.setBlendMode("alpha")
    end
    -- uncommon
    -- projectile_init_fix
    if hit_side_obj_char["height"] == "air" then
        obj_projectile["y_offset"] = 150
    else
        obj_projectile["y_offset"] = 280
    end
    obj_projectile["x"] = hit_side_obj_char["x"]
    obj_projectile["y"] = hit_side_obj_char["y"] - obj_projectile["y_offset"]
    obj_projectile[1] = obj_projectile["x"] - hit_side_obj_char[5]*600
    obj_projectile[2] = obj_projectile["y"] - 600
    obj_projectile[5] = hit_side_obj_char[5]
    -- insert_projectile
    table.insert(hit_side_obj_char["projectile_RC_table"],obj_projectile)
end
-- insert_projectile_game_scene_char_common_RC_shockwave_yellow
-- 1-8 type life x y velocity projectile_clash_type f
-- enemy_interact_function		hitbox hit_guard_type hit_damage hit_damage_correction_factor 
--                              hit_heat_gain hit_wallbreak_damage hurt_heat_gain 
--                              blocked_heat_gain block_heat_gain block_risk_gauge_gain FD_block_heat_drain
--                              stand_hurt_animation stand_block_animation
--                              crouch_hurt_animation crouch_block_animation
--                              air_hurt_animation air_block_animation
--                              OTG_hurt_animation wallstick_hurt_animation
--                              projectile_active projectile_counter_ver_function
--                              block_SFX counter_SFX hit_SFX_whiff_SFX
--                              hit_VFX_insert_function hit_SFX
--                              hurt_block_VFX_insert_function, hurt_block_SFX
-- animation                    projectile_animation camera_x_shake_anim camera_y_shake_anim camera_enclosing_anim enclose_position_offset
-- update/update_sub_frame/draw
-- uncommon
-- projectile_init_fix
function insert_projectile_game_scene_char_common_RC_shockwave_yellow(hit_side_obj_char,hurt_side_obj_char)
    local obj_projectile = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RC_shockwave
    -- clear_projectile_RC_table
    hit_side_obj_char["projectile_RC_table"] = {}
    -- common
    obj_projectile["type"] = "projectile"
    obj_projectile["life"] = 30
    obj_projectile["x"] = hit_side_obj_char["x"]
    obj_projectile["y"] = hit_side_obj_char["y"]
    obj_projectile["velocity"] = {hit_side_obj_char["velocity"][1],hit_side_obj_char["velocity"][2]}
    obj_projectile["projectile_clash_type"] = -1 -- -1: 不与其他飞道交互 0-3：飞行道具等级
    obj_projectile["f"] = -1
    -- enemy_interact_function
    obj_projectile["hitbox_table"] = {{0,0,1000,800},{0,0,800,1000}}
    obj_projectile["hit_guard_type"] = "all"
    obj_projectile["hit_damage"] = 0
    obj_projectile["hit_damage_correction_factor"] = 1
    obj_projectile["hit_heat_gain"] = 0
    obj_projectile["hit_wallbreak_damage"] = 0
    obj_projectile["hurt_heat_gain"] = 0
    obj_projectile["blocked_heat_gain"] = 0
    obj_projectile["block_heat_gain"] = 0
    obj_projectile["block_risk_gauge_gain"] = 0
    obj_projectile["FD_block_heat_drain"] = 0
    obj_projectile["stand_hurt_animation"] = load_game_scene_anim_char_RC_yellow_projectile_ground_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"0_general_hurt_launched_high",
        "air","knockdown_recovery",
        30,5,1.00,
        -2.5,0.5,1.00,
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
    obj_projectile["stand_block_animation"] = load_game_scene_anim_char_RC_yellow_projectile_ground_block(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"4_stand_block_high",
        "stand","5_stand_idle",
        42.5,5,1.00,
        0,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj_projectile["crouch_hurt_animation"] = load_game_scene_anim_char_RC_yellow_projectile_ground_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"0_general_hurt_launched_high",
        "air","knockdown_recovery",
        30,5,1.00,
        -2.5,0.5,1.00,
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
    obj_projectile["crouch_block_animation"] = load_game_scene_anim_char_RC_yellow_projectile_ground_block(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"1_crouch_block",
        "crouch","1_2_3_crouch",
        42.5,5,1.00,
        0,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj_projectile["air_hurt_animation"] = load_game_scene_anim_char_RC_yellow_projectile_ground_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"0_general_hurt_launched_high",
        "air","knockdown_recovery",
        30,5,1.00,
        -2.5,1.0,1.00,
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
    obj_projectile["air_block_animation"] = load_game_scene_anim_char_RC_yellow_projectile_air_block(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"1_4_7_air_block",
        "air","5_stand_idle",
        7.5,5,1.00,
        -7.5,2.5,1.00,
        nil,nil,nil,nil,
        function() end
    )
    obj_projectile["OTG_hurt_animation"] = load_game_scene_anim_char_RC_yellow_projectile_ground_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"0_general_hurt_launched_high",
        "air","knockdown_recovery",
        30,5,1.00,
        -2.5,1.0,1.00,
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
    obj_projectile["wallstick_hurt_animation"] = load_game_scene_anim_char_RC_yellow_projectile_ground_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,
        true,nil,"0_general_hurt_launched_high",
        "air","knockdown_recovery",
        30,5,1.00,
        -2.5,1.0,1.00,
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
    obj_projectile["projectile_active"] = true
    obj_projectile["projectile_counter_ver_function"] = common_game_scene_counter_ver0
    obj_projectile["block_SFX"] = nil
    obj_projectile["counter_SFX"] = nil
    obj_projectile["hit_SFX"] = nil
    obj_projectile["whiff_SFX"] = nil
    obj_projectile["hit_VFX_insert_function"] = function() end
    obj_projectile["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_RC_yellow
    obj_projectile["enemy_interact_function"] = function()
        -- if hit
        if collision_uncondicational_hit_confirm_test(obj_projectile,hurt_side_obj_char) and obj_projectile["projectile_active"] and (not hurt_side_obj_char["strike_inv"]) then
            -- projectile_active
            obj_projectile["projectile_active"] = false
            -- block_test
            local block_bool = common_game_scene_block_test(obj_projectile,hurt_side_obj_char)
            -- risk_gauge
            if hurt_side_obj_char["risk_gauge"][1] >= hurt_side_obj_char["risk_gauge"][2] and (not block_bool) then
                hurt_side_obj_char["hurt_state"] = "counter"
            end
            -- insert_projectile_VFX 
            if not block_bool then
                obj_projectile["hit_VFX_insert_function"](hit_side_obj_char,hurt_side_obj_char)
                -- SFX_audio_code_place_holder
            end
            -- common_hurt_function
            common_game_scene_projectile_RC_red_yellow_hurt_function(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
        end
    end
    -- animation
        -- projectile_animation
    obj_projectile["projectile_animation"] = load_game_scene_anim_projectile_RC_main(obj_projectile)
    init_character_anim_without(obj_projectile,obj_projectile["projectile_animation"])
        -- camera_animation
    obj_projectile["camera_x_shake_anim"] = nil
    obj_projectile["camera_y_shake_anim"] = nil
    obj_projectile["camera_enclosing_anim"] = nil
    obj_projectile["enclose_position_offset"] = {0,0,0}
    -- update
    obj_projectile["update"] = function()
        if hit_side_obj_char["height"] == "air" then
            obj_projectile["y_offset"] = 150
        else
            obj_projectile["y_offset"] = 280
        end
        obj_projectile["x"] = hit_side_obj_char["x"]
        obj_projectile["y"] = hit_side_obj_char["y"] - obj_projectile["y_offset"]
        character_animator(obj_projectile,obj_projectile["projectile_animation"])
        obj_projectile["life"] = obj_projectile["life"] - 1
    end
    obj_projectile["update_sub_frame"] = function()
        obj_projectile["x"] = hit_side_obj_char["x"]
        obj_projectile["y"] = hit_side_obj_char["y"] - obj_projectile["y_offset"]
    end
    -- draw
    obj_projectile["draw"] = function()
        obj_projectile[1] = obj_projectile["x"] - hit_side_obj_char[5]*600
        obj_projectile[2] = obj_projectile["y"] - 600
        obj_projectile[5] = hit_side_obj_char[5]
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_projectile,image_sprite_sheet,tostring(obj_projectile[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    -- uncommon nil
    -- projectile_init_fix
    if hit_side_obj_char["height"] == "air" then
        obj_projectile["y_offset"] = 150
    else
        obj_projectile["y_offset"] = 280
    end
    obj_projectile["x"] = hit_side_obj_char["x"]
    obj_projectile["y"] = hit_side_obj_char["y"] - obj_projectile["y_offset"]
    obj_projectile[1] = obj_projectile["x"] - hit_side_obj_char[5]*600
    obj_projectile[2] = obj_projectile["y"] - 600
    obj_projectile[5] = hit_side_obj_char[5]
    -- insert_projectile
    table.insert(hit_side_obj_char["projectile_RC_table"],obj_projectile)
end
function load_game_scene_anim_char_RC_red_projectile_ground_block(
    hit_side_obj_char,hurt_side_obj_char,obj_projectile,
    fix_direction,velocity_center,
    sprite_sheet,height,state_cache,
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
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side]
        local FD_block = test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"])
        common_game_scene_projectile_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,"block",FD_block
        )
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
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 5
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)
        -- game_speed
        common_game_scene_game_speed_load_application(hurt_side_obj_char,{1,2,1,39,45-27,0})
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
        common_game_scene_get_input_sys_cache_init(hurt_side)
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
function load_game_scene_anim_char_RC_red_projectile_air_block(
    hit_side_obj_char,hurt_side_obj_char,obj_projectile,
    fix_direction,velocity_center,
    sprite_sheet,height,state_cache,
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
            -- VFX
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
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side]
        local FD_block = test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"])
        common_game_scene_projectile_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,"block",FD_block
        )
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
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        hurt_side_obj_char[8] = 5
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)
        -- game_speed
        common_game_scene_game_speed_load_application(hurt_side_obj_char,{1,2,1,39,45-27,0})
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
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][6]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][6]
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
        common_game_scene_get_input_sys_cache_init(hurt_side)
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
function load_game_scene_anim_char_RC_red_projectile_ground_air_and_OTG_hurt(
    hit_side_obj_char,hurt_side_obj_char,obj_projectile,
    fix_direction,velocity_center,
    sprite_sheet,height,state_cache,
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
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
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
        -- state_number
        common_game_scene_projectile_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,"hurt",false
        )
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
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- update
        update_before_land()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)
        -- game_speed
        common_game_scene_game_speed_load_application(hurt_side_obj_char,{1,2,1,39,45-27,0})
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
function load_game_scene_anim_char_RC_yellow_projectile_ground_block(
    hit_side_obj_char,hurt_side_obj_char,obj_projectile,
    fix_direction,velocity_center,
    sprite_sheet,height,state_cache,
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
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side]
        local FD_block = test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"])
        common_game_scene_projectile_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,"block",FD_block
        )
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
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 5
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hurt_side_obj_char,
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][1],
            hurt_side_VFX_spawn_anchor_data["stage_VFX_spawn_anchor"][sprite_sheet][2],
            0.5,-1,1,0
        )
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)
        -- game_speed
        common_game_scene_game_speed_load_application(hurt_side_obj_char,{1,1,1,0,0,0})
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
    res[11] = function()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)
    end
    res[12] = function()
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
function load_game_scene_anim_char_RC_yellow_projectile_air_block(
    hit_side_obj_char,hurt_side_obj_char,obj_projectile,
    fix_direction,velocity_center,
    sprite_sheet,height,state_cache,
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
            -- VFX
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
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = false
        hurt_side_obj_char["strike_inv_countdown"] = 0
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = 1
        hurt_side_obj_char["projectile_inv"] = false
        hurt_side_obj_char["projectile_inv_countdown"] = 0
        -- state_number
        local input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side]
        local FD_block = test_input_sys_press_or_hold(input["correction_left"]) or test_input_sys_press_or_hold(input["correction_right"])
        common_game_scene_projectile_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,"block",FD_block
        )
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
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][0]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        hurt_side_obj_char[8] = 5
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)
        -- game_speed
        common_game_scene_game_speed_load_application(hurt_side_obj_char,{1,1,1,0,0,0})
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
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][6]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][6]
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
        common_game_scene_get_input_sys_cache_init(hurt_side)
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
function load_game_scene_anim_char_RC_yellow_projectile_ground_air_and_OTG_hurt(
    hit_side_obj_char,hurt_side_obj_char,obj_projectile,
    fix_direction,velocity_center,
    sprite_sheet,height,state_cache,
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
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
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
        -- state_number
        common_game_scene_projectile_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,obj_projectile,"hurt",false
        )
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
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][1]
        hurt_side_obj_char["collision_ground_height_offset"] = 185
        -- draw_correction
        common_game_scene_hurt_animation_oscillator_obj_8(hurt_side_obj_char,0,1)
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[sprite_sheet]
        -- update
        update_before_land()
        -- input_sys_cache
        hurt_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hurt_side)
        -- game_speed
        common_game_scene_game_speed_load_application(hurt_side_obj_char,{1,1,1,0,0,0})
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

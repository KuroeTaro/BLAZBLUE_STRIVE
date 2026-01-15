-- all_ground_idle_animation
    -- 需要修改的角色属性
        -- 我方
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
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- damage_correction
            -- pushbox_other_side_char_active
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_test_ground_height_offset
            -- 8
            -- anchor_pos
        -- 对方
            ------

-- _1_2_3_crouch
function load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
    local res = {}
    for i = 1,7 do
        res[i*7+5] = function()
            -- draw_correction
            obj_char[8] = i+2
        end
    end

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "1_2_3_crouch"
        obj_char["height_state"] = "crouch" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        
        obj_char["current_animation_length"] = 62

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 1
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-142.5,121.5,285}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-175,180,350}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {292,420}
    end
    res[2] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-160,190,320}}
        -- draw_correction
        obj_char[8] = 1
    end
    res[5] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-150,200,300}}
        -- draw_correction
        obj_char[8] = 2
    end
    res[61] = function()
        -- state
        obj_char["f"] = 5
        -- draw_correction
        obj_char[8] = 2
    end
    res[62] = function()
        -- animation_end
    end
    return res
end
-- _1_2_3_crouch_turn
function load_game_scene_anim_char_TRM_1_2_3_crouch_turn(obj_char)
    local res = {}

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "1_2_3_crouch_turn"
        obj_char["height_state"] = "crouch" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        
        obj_char["current_animation_length"] = 12

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 1
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-142.5,121.5,285}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-150,200,300}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {292,297}
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
        -- animation_end
    end
    return res
end
-- _1_2_3_crouch_to_stand_idle
function load_game_scene_anim_char_TRM_1_2_3_crouch_to_stand_idle(obj_char)
    local res = {}

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "1_2_3_crouch_to_stand_idle"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        
        obj_char["current_animation_length"] = 5

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 1
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collid
        obj_char["pushbox"] = {0,-142.5,121.5,285}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-190,190,380}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {292,420}
    end
    res[2] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-205,165,410}}
        -- draw_correction
        obj_char[8] = 1
    end
    res[5] = function()
        -- animation_end
    end
    return res
end
-- _5_stand_idle
function load_game_scene_anim_char_TRM_5_stand_idle(obj_char)
    local res = {}
    for i = 0,7 do
        res[i*7] = function()
            -- draw_correction
            obj_char[8] = i
        end
    end

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "5_stand_idle"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        
        obj_char["current_animation_length"] = 57

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 1
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {215,510}
    end
    res[8*7] = function()
        -- state
        obj_char["f"] = 0
        -- draw_correction
        obj_char[8] = 0
    end
    res[57] = function()
        -- animation_end
    end
    return res
end
-- _5_stand_turn
function load_game_scene_anim_char_TRM_5_stand_turn(obj_char)
    local res = {}

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "5_stand_turn"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        
        obj_char["current_animation_length"] = 12

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 1
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {220,510}
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
        -- animation_end
    end
    return res
end
-- _5_stand_dash_skid
function load_game_scene_anim_char_TRM_5_stand_dash_skid(obj_char)
    local res = {}

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "5_stand_dash_skid"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        
        obj_char["current_animation_length"] = 16

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 10
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-142.5,121.5,285}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-160,290,320}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {323,515}
    end
    res[4] = function()
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["hurtbox_table"] = {{0,-215,170,430}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 1
    end
    res[8] = function()
        -- state
        obj_char["idle_cancel"] = true
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 2
    end
    res[12] = function()
        -- draw_correction
        obj_char[8] = 3
    end
    res[16] = function()
        -- animation_end
    end
    return res
end

-- all_ground_walk_dash
    -- 需要修改的角色属性
        -- 我方
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
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_test_ground_height_offset
            -- 8
            -- anchor_pos
        -- 对方
            ------

-- _4_walk
function load_game_scene_anim_char_TRM_4_walk(obj_char)
    local walk_speed = -7.0
    local res = {}
    for i = 0,89 do
        res[i] = function()
            -- state_number
            obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        end
    end

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "4_walk"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["current_animation_length"] = 85

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 1
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-7,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {170,510}
    end
    res[7] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-3,-455,100,50}}
        -- draw_correction
        obj_char[8] = 1
    end
    res[14] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 2
    end
    res[21] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 3
    end
    res[28] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 4
    end
    res[35] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 5
    end
    res[42] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 6
    end
    res[49] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 7
    end
    res[56] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 8
    end
    res[63] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 9
    end
    res[70] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 10
    end
    res[77] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 11
    end
    res[84] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 2
        -- update
        obj_char["f"] = 21
    end
    res[85] = function()
        -- animation_end
    end
    return res
end
-- _4_walk_to_stand_idle
function load_game_scene_anim_char_TRM_4_walk_to_stand_idle(obj_char)
    local res = {}

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "4_walk_to_stand_idle"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["current_animation_length"] = 8

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 1
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {155,515}
    end
    res[3] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[8] = function()
        -- animation end
    end
    return res
end
-- _6_walk
function load_game_scene_anim_char_TRM_6_walk(obj_char)
    local walk_speed = 9.0
    local res = {}
    for i = 0,84 do
        res[i] = function()
            -- state_number
            obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        end
    end

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "6_walk"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["current_animation_length"] = 84

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 1
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{7,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {288,510}
    end
    res[7] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{10,-455,100,50}}
        -- draw_correction
        obj_char[8] = 1
    end
    res[14] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 2
    end
    res[21] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 3
    end
    res[28] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 4
    end
    res[35] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 5
    end
    res[42] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 6
    end
    res[49] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 7
    end
    res[56] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 8
    end
    res[63] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 9
    end
    res[70] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 10
    end
    res[77] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 11
    end
    res[84] = function()
        -- state
        obj_char[8] = 2
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char["f"] = 14
    end
    res[85] = function()
        -- animation_end
    end
    return res
end
-- _6_walk_to_stand_idle
function load_game_scene_anim_char_TRM_6_walk_to_stand_idle(obj_char)
    local res = {}

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "6_walk_to_stand_idle"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["current_animation_length"] = 8

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 1
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {155,510}
    end
    res[3] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[8] = function()
        -- animation end
    end
    return res
end

-- _7_8_9_jump_air_to_stand_idle
    -- 需要修改的角色属性
        -- 我方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- startup_frame
            -- active_frame
            -- recovery_frame
            -- frame_adv
            -- current_animation_length
            -- idle_cancel
            -- strike_inv
            -- strike_inv_countdown
            -- throw_inv
            -- throw_inv_countdown
            -- projectile_inv
            -- projectile_inv_countdown
            -- burst_inv
            -- burst_inv_countdown
            -- velocity
            -- velocity_cache
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
        -- 对方
            -- frame_adv
function load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
    local res = {}

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "7_8_9_jump_air_to_stand_idle"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0

        obj_char["current_animation_length"] = 17

        obj_char["idle_cancel"] = false

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["velocity_cache"] = {0,0}
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 1
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1

        obj_char["air_move"]["jump"][1] = obj_char["air_move"]["jump"][2]
        obj_char["air_move"]["air_dash"][1] = obj_char["air_move"]["air_dash"][2]
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,175,430}}
        obj_char["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {325,690}
        -- update
        obj_char["y"] = 365
        -- VFX
        insert_VFX_game_scene_stage_smoke_land_blow(obj_char,-355,-160,1,1,1,0)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
    end
    res[3] = function()
        -- state
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["idle_cancel"] = true
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["hurtbox_table"] = {{0,-190,180,380}}
        -- draw_correction
        obj_char[8] = 1
    end
    res[6] = function()
        -- draw_correction
        obj_char[8] = 2
    end
    res[10] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,175,430}}
        -- draw_correction
        obj_char[8] = 3
    end
    res[13] = function()
        -- draw_correction
        obj_char[8] = 4
    end
    res[15] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{15,-455,100,50}}
        -- draw_correction
        obj_char[8] = 5
    end
    res[17] = function()
        -- animation end
    end
    return res
end
-- _7_8_9_jump_air
    -- 需要修改的角色属性
        -- 我方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- current_animation_length
            -- idle_cancel
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
        -- 对方
            ------
function load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,sprite_sheet_state,anchor_pos,horizontal_velocity,vertical_velocity)
    if horizontal_velocity ~= nil then
        -- state_number
        obj_char["velocity_cache"][1] = horizontal_velocity
    end
    local res = {}
    local function update_maintain_horizontal_velocity()
        -- state_number
        obj_char["velocity"][1] = obj_char["velocity_cache"][1]
    end
    local function update_before_falling()
        -- state_number
        obj_char["velocity"][1] = obj_char["velocity_cache"][1]
        if obj_char["velocity"][2] >= - 16.0 and obj_char["f"] <= 8 then
            obj_char["f"] = 9
            obj_char[8] = 2
        end
    end
    for i=0,35 do
        res[i] = function() update_maintain_horizontal_velocity() end
    end
    for i=0,8 do
        res[i] = function() update_before_falling() end
    end

    res[0] = function()
        -- 上升阶段开始
        -- state
        obj_char["sprite_sheet_state"] = sprite_sheet_state
        obj_char["height_state"] = "air" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["current_animation_length"] = 35

        obj_char["idle_cancel"] = false

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["velocity"][1] = obj_char["velocity_cache"][1]
        if vertical_velocity ~= nil then
            obj_char["velocity"][2] = vertical_velocity
        else
            assert("null vertical_velocity")
        end
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 0
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-100,121.5,200}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-180,200,380}}
        obj_char["collision_test_ground_height_offset"] = 180
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = anchor_pos
        -- update
        update_before_falling()
    end
    res[4] = function()
        -- state
        obj_char["idle_cancel"] = true
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- draw_correction
        obj_char[8] = 1
        -- update
        update_before_falling()
    end
    res[8] = function()
        -- 上升阶段循环结束
        -- state
        obj_char["f"] = 0
        -- draw_correction
        obj_char[8] = 0
        -- update
        update_before_falling()
    end
    res[9] = function()
        -- 上升到下降的转换阶段
        -- state_number
        update_maintain_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 2
    end
    res[13] = function()
        -- state_number
        update_maintain_horizontal_velocity()
        -- collide
        obj_char["hurtbox_table"] = {{0,-135,200,290}}
        -- draw_correction
        obj_char[8] = 3
    end
    res[17] = function()
        -- state_number
        update_maintain_horizontal_velocity()
        -- collide
        obj_char["hurtbox_table"] = {{0,-120,200,260}}
        -- draw_correction
        obj_char[8] = 4
    end
    res[21] = function()
        -- state_number
        update_maintain_horizontal_velocity()
        -- collide
        obj_char["hurtbox_table"] = {{0,-150,200,320}}
        -- draw_correction
        obj_char[8] = 5
    end
    res[25] = function()
        -- state_number
        update_maintain_horizontal_velocity()
        -- collide
        obj_char["hurtbox_table"] = {{0,-180,200,380}}
        -- draw_correction
        obj_char[8] = 6
    end
    res[26] = function()
        -- 下降阶段开始
        -- state_number
        update_maintain_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 7
    end
    res[30] = function()
        -- state_number
        update_maintain_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 8
    end
    res[34] = function()
        -- state
        obj_char["f"] = 26
        -- state_number
        update_maintain_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 7
    end
    res[35] = function()
        -- animation end
    end
    return res
end
-- _7_8_9_pre_jump
    -- 需要修改的角色属性
        -- 我方
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
            -- air_move
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_test_ground_height_offset
            -- 8
            -- anchor_pos
        -- 对方
            -- frame_adv
function load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
    local res = {}

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "7_8_9_pre_jump"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0

        obj_char["current_animation_length"] = 4

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 4
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        if test_input_sys_press_or_hold(INPUT_SYS_CURRENT_COMMAND_STATE[obj_char["player_side"]]["dash"]) 
        and obj_char["velocity"][1] <= 1.0
        and obj_char["direction_input"] == 9
        then
            obj_char["velocity"][1] = 20*obj_char[5]
        end
        if obj_char["direction_input"] == 7 then
            obj_char["velocity"][1] = math.max(7,math.abs(obj_char["velocity"][1]))
            obj_char["velocity"][1] = -obj_char["velocity"][1]*obj_char[5]
        elseif obj_char["direction_input"] == 9 then
            obj_char["velocity"][1] = math.max(9,math.abs(obj_char["velocity"][1]))
            obj_char["velocity"][1] = obj_char["velocity"][1]*obj_char[5]
        end
        obj_char["velocity_cache"] = {obj_char["velocity"][1],0}
        obj_char["velocity"] = {0,0}
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 7
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1

        obj_char["air_move"]["jump"][1] = obj_char["air_move"]["jump"][2]
        obj_char["air_move"]["air_dash"][1] = obj_char["air_move"]["air_dash"][2]
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430}}
        obj_char["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {275,415}
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
    end
    res[2] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[3] = function()
        -- draw_correction
        obj_char[8] = 2
        -- VFX
        insert_VFX_game_scene_stage_smoke_vertical_shot(obj_char,-470,-380,1,1,1,0)
    end
    res[4] = function()
        -- animation_end
    end
    return res
end

-- _4dash_backdash
    -- 需要修改的角色属性
        -- 我方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- startup_frame
            -- active_frame
            -- recovery_frame
            -- frame_adv
            -- current_animation_length
            -- idle_cancel
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
        -- 对方
            -- frame_adv
function load_game_scene_anim_char_TRM_4dash_backdash(input,obj_char)
    local res = {}
    for i=0,10 do
        res[i] = function()
            -- state_number
            obj_char["velocity"][1] = (-32.0+i)*obj_char[5]
        end
    end

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "4dash_backdash"
        obj_char["height_state"] = "air" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0

        obj_char["current_animation_length"] = 30

        obj_char["idle_cancel"] = false

        obj_char["strike_inv"] = true
        obj_char["strike_inv_countdown"] = 4
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 15
        obj_char["projectile_inv"] = true
        obj_char["projectile_inv_countdown"] = 4
        obj_char["burst_inv"] = true
        obj_char["burst_inv_countdown"] = 7
        -- state_number
        obj_char["velocity"] = {-32.0*obj_char[5],-9.0}
        obj_char["gravity"] = 1.2
        obj_char["friction"] = 0
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-100,121.5,200}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {}
        obj_char["collision_test_ground_height_offset"] = 180
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {275,505}
        -- update
        obj_char["y"] = 185
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
    end
    res[2] = function()
        -- state_number
        obj_char["velocity"][1] = -30.0*obj_char[5]
        -- draw_correction
        obj_char[8] = 1
    end
    res[4] = function()
        -- state_number
        obj_char["velocity"][1] = -28.0*obj_char[5]
        -- collide
        obj_char["hurtbox_table"] = {{-15,-100,170,360}}
    end
    res[7] = function()
        -- state_number
        obj_char["velocity"][1] = -25.0*obj_char[5]
        -- collide
        obj_char["hurtbox_table"] = {{-15,-100,170,360}}
        -- draw_correction
        obj_char[8] = 2
    end
    res[11] = function()
        -- state_number
        obj_char["velocity"][1] = - 6.0*obj_char[5]
        -- draw_correction
        obj_char[8] = 1
    end
    res[13] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[15] = function()
        -- state
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        -- state_number
        obj_char["velocity"][2] = 0
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 10
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["hurtbox_table"] = {{0,-225,180,450}}
        obj_char["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char[8] = 3
        -- update
        obj_char["y"] = 365
        -- VFX
        insert_VFX_game_scene_stage_smoke_land_blow(obj_char,-340,-160,1,1,1,0)
    end
    res[18] = function()
        -- state
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" 

        obj_char["idle_cancel"] = true
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["hurtbox_table"] = {{0,-195,205,390}}
        -- draw_correction
        obj_char[8] = 4
    end
    res[22] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-200,170,400}}
        -- draw_correction
        obj_char[8] = 5
    end
    res[26] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{15,-455,100,50}}
        -- draw_correction
        obj_char[8] = 6
    end
    res[30] = function()
        -- animation_end
    end
    return res
end
-- _4dash_air_backdash
    -- 需要修改的角色属性
        -- 我方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- startup_frame
            -- active_frame
            -- recovery_frame
            -- frame_adv
            -- current_animation_length
            -- idle_cancel
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
        -- 对方
            -- frame_adv
function load_game_scene_anim_char_TRM_4dash_air_backdash(input,obj_char)
    local res = {}
    for i=0,6 do
        res[i] = function()
            -- state_number
            if obj_char["velocity"][2] > 0 then
                obj_char["velocity"][2] = 0
                obj_char["gravity"] = 0
            end
        end
    end

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "4dash_air_backdash"
        obj_char["height_state"] = "air" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0

        obj_char["current_animation_length"] = 11

        obj_char["idle_cancel"] = false

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["velocity"][1] = -25*obj_char[5]
        obj_char["velocity"][2] = obj_char["velocity"][2]*0.6
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 0
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-100,121.5,200}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-125,260,270}}
        obj_char["collision_test_ground_height_offset"] = 180
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {242,285}
        -- VFX
        insert_VFX_game_scene_stage_4dash_air_backdash_shockwave(obj_char,150,-400,0.75,-0.75,0.75,0)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
    end
    res[3] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-125,260,270},{30,-80,260,260}}
        -- draw_correction
        obj_char[8] = 1
        -- update
        if obj_char["velocity"][2] > 0 then
            obj_char["velocity"][2] = 0
            obj_char["gravity"] = 0
        end
    end
    res[5] = function()
        -- draw_correction
        obj_char[8] = 2
    end
    res[6] = function()
        -- state
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["idle_cancel"] = true
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- update
        obj_char["velocity"][1] = -25*obj_char[5]
        obj_char["velocity"][2] = 0
        obj_char["gravity"] = 0
    end
    res[7] = function()
        -- draw_correction
        obj_char[8] = 3
    end
    res[9] = function()
        -- draw_correction
        obj_char[8] = 4
    end
    res[11] = function()
        -- animation_end
    end
    return res
end
-- _6dash_dash
    -- 需要修改的角色属性
        -- 我方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- startup_frame
            -- active_frame
            -- recovery_frame
            -- frame_adv
            -- current_animation_length
            -- idle_cancel
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
        -- 对方
            ------
function load_game_scene_anim_char_TRM_6dash_dash(input,obj_char)
    local dash_acceleration = 0.4
    local res = {}
    local function update_horizontal_velocity()
        obj_char["velocity"] = {
            obj_char[5]*dash_acceleration+obj_char["velocity"][1],0
        }
    end
    for i = 0,37 do
        res[i] = function()
            -- state_number
            update_horizontal_velocity()
        end
    end

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "6dash_dash"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0

        obj_char["current_animation_length"] = 37

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["velocity"] = {obj_char[5]*20.0,0}
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 100
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-190,285,380}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {288,510}
    end
    res[4] = function()
        -- state_number
        update_horizontal_velocity()
        -- collide
        obj_char["pushbox"] = {0,-142.5,121.5,285}
        obj_char["hurtbox_table"] = {{0,-150,390,300}}
        -- draw_correction
        obj_char[8] = 1
        -- VFX
        insert_VFX_game_scene_stage_smoke_dash_burst(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[8] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 2
        -- VFX
        insert_VFX_game_scene_stage_smoke_dash_burst(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[12] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 3
        -- VFX
        insert_VFX_game_scene_stage_smoke_dash_burst(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[16] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 4
        -- VFX
        insert_VFX_game_scene_stage_smoke_dash_burst(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[20] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 5
        -- VFX
        insert_VFX_game_scene_stage_smoke_dash_burst(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[24] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 6
        -- VFX
        insert_VFX_game_scene_stage_smoke_dash_burst(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[28] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 7
        -- VFX
        insert_VFX_game_scene_stage_smoke_dash_burst(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[32] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 8
        -- VFX
        insert_VFX_game_scene_stage_smoke_dash_burst(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[36] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 1
        -- update
        obj_char["f"] = 4
        -- VFX
        insert_VFX_game_scene_stage_smoke_dash_burst(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[37] = function()
        -- animation_end
    end
    return res
end
-- _6dash_air_dash
    -- 需要修改的角色属性
        -- 我方
            -- sprite_sheet_state
            -- height_state
            -- hurt_state_target
            -- move_state
            -- startup_frame
            -- active_frame
            -- recovery_frame
            -- frame_adv
            -- current_animation_length
            -- idle_cancel
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
        -- 对方
            -- frame_adv
function load_game_scene_anim_char_TRM_6dash_air_dash(input,obj_char)
    local res = {}
    for i=0,11 do
        res[i] = function()
            -- state_number
            obj_char["velocity"][1] = (4+i*0.5)*obj_char[5]
            if obj_char["velocity"][2] > 0 then
                obj_char["velocity"][2] = 0
                obj_char["gravity"] = 0
            end
        end
    end
    for i=12,24 do
        res[i] = function()
            -- state_number
            obj_char["velocity"][1] = (90-(i-12)*6)*obj_char[5]
        end
    end

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "6dash_air_dash"
        obj_char["height_state"] = "air" -- stand crouch air OTG
        obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0

        obj_char["current_animation_length"] = 24

        obj_char["idle_cancel"] = false

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0
        -- state_number
        obj_char["velocity"][1] = 4*obj_char[5]
        obj_char["velocity"][2] = obj_char["velocity"][2]*0.6
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 0
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-100,121.5,200}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-120,260,270}}
        obj_char["collision_test_ground_height_offset"] = 18
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {350,283}
        -- update
        if obj_char["velocity"][2] > 0 then
            obj_char["velocity"][2] = 0
            obj_char["gravity"] = 0
        end
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
    end
    res[3] = function()
        -- state_number
        obj_char["velocity"][1] = (4+3*0.5)*obj_char[5]
        if obj_char["velocity"][2] > 0 then
            obj_char["velocity"][2] = 0
            obj_char["gravity"] = 0
        end
        -- draw_correction
        obj_char[8] = 1
    end
    res[6] = function()
        -- state_number
        obj_char["velocity"][1] = (4+6*0.5)*obj_char[5]
        if obj_char["velocity"][2] > 0 then
            obj_char["velocity"][2] = 0
            obj_char["gravity"] = 0
        end
        -- draw_correction
        obj_char[8] = 2
    end
    res[9] = function()
        -- state_number
        obj_char["velocity"][1] = (4+9*0.5)*obj_char[5]
        if obj_char["velocity"][2] > 0 then
            obj_char["velocity"][2] = 0
            obj_char["gravity"] = 0
        end
    end
    res[12] = function()
        -- state_number
        obj_char["velocity"][1] = (90-(12-12)*6)*obj_char[5]
        obj_char["velocity"][2] = 0
        obj_char["gravity"] = 0
        -- state
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["idle_cancel"] = true
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["pushbox"] = {0,-100,121.5,200}
        obj_char["hurtbox_table"] = {{0,-120,260,270},{-65,-45,260,120}}
        -- draw_correction
        obj_char[8] = 3
        -- VFX
        insert_VFX_game_scene_stage_6dash_air_dash_shockwave(obj_char,50,-430,0.75,0.75,0.75,0)
    end
    res[15] = function()
        -- state_number
        obj_char["velocity"][1] = (90-(15-12)*6)*obj_char[5]
        -- draw_correction
        obj_char[8] = 4
    end
    res[18] = function()
        -- state_number
        obj_char["velocity"][1] = (90-(18-12)*6)*obj_char[5]
        -- draw_correction
        obj_char[8] = 5
    end
    res[21] = function()
        -- state_number
        obj_char["velocity"][1] = (90-(21-12)*6)*obj_char[5]
        -- draw_correction
        obj_char[8] = 0
    end
    res[24] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_6dash_dash_cancel(input,obj_char)
    local res = {}

    return res
end

-- burst_overdrive_ground
    -- 需要修改的角色属性
        -- 我方
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
            -- oroboros_state
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
            -- collision_test_ground_height_offset
            -- 8
            -- anchor_pos
        -- 对方
            -- game_speed
            -- game_speed_subframe
            -- game_speed_abnormal_realtime_countdown
function load_game_scene_anim_char_TRM_burst_overdrive(obj_char,other_side_countdown)
    local res = {}
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    -- 更新hitbox table 有一个全屏的红框
    -- 更新逻辑为没有伤害 没有硬直 只是速度调为0
    local function update_move_overdrive_state()
        if obj_char["overdrive_gauge"][1] > 0 then
            obj_char["overdrive_gauge"][1] = 
            obj_char["overdrive_gauge"][1] - obj_char["overdrive_drain_speed"]
        elseif obj_char["overdrive_gauge"][1] < 0 then
            obj_char["overdrive_gauge"][1] = 0
        end
        if obj_char_other_side["game_speed_abnormal_realtime_countdown"] == 0 and obj_char["f"] >= 4 then
            obj_char["move_state"] = "recovery"
        end
    end
    for i = 0,69 do
        res[i] = function()
            -- state
            update_move_overdrive_state()
        end
    end

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "burst_overdrive_rc_ground"
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0

        obj_char["current_animation_length"] = 70

        obj_char["strike_inv"] = true
        obj_char["strike_inv_countdown"] = 70
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 70
        obj_char["projectile_inv"] = true
        obj_char["projectile_inv_countdown"] = 70
        obj_char["burst_inv"] = true
        obj_char["burst_inv_countdown"] = 70

        obj_char["oroboros_state"] = "idle"
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["velocity_cache"] = {0,0}
        obj_char["gravity"] = 2.5
        obj_char["friction"] = 1
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1

        update_move_overdrive_state()
        obj_char["overdrive_gauge"][3] = "on"

        play_obj_audio(audio_SFX_game_scene_overdrive)
        -- air_move
        obj_char["air_move"] = {}
        obj_char["air_move"]["jump"] = {1,1}
        obj_char["air_move"]["air_dash"] = {1,1}
        -- game_speed
        obj_char["game_speed"] = 1
        obj_char["game_speed_subframe"] = 1
        obj_char["game_speed_abnormal_realtime_countdown"] = 0 -- 只能是game_speed的倍数
        obj_char["hit_hurt_blockstop_countdown"] = 0
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {} --{ 攻击类型 是投还是打， function值 内部为命中后的逻辑,具体的box形状}
        obj_char["hurtbox_table"] = {}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {296,615}
        -- camera_animation_load
        common_game_scene_overdrive_load_camera_shake_anim(obj_char)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- camera_animation_application
        local obj_camera = obj_stage_game_scene_camera
        table.insert(obj_camera["active_application_table"],
            function()
                anim_camera_point_linear_game_scene_camera_enclosing = obj_char["camera_enclosing_anim"]
                anim_camera_point_linear_game_scene_camera_shake_x = obj_char["camera_x_shake_anim"]
                anim_camera_point_linear_game_scene_camera_shake_y = obj_char["camera_y_shake_anim"]
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_enclosing)
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_shake_x)
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_shake_y)
                obj_camera["state"] = "active"
            end
        )
        obj_char["enclose_position_offset"] = {0,0,0}
        -- VFX
        insert_VFX_game_scene_char_overdrive_badge(obj_char)
        insert_VFX_game_scene_char_overdrive_partical(obj_char)
        insert_VFX_game_scene_char_overdrive_black_overlay(obj_char)
    end
    res[3] = function()
        -- state & state_number
        update_move_overdrive_state()
            -- idle状态下OD 恢复为3+13
            -- 攻击状态下OD 恢复为3+3
            -- block_stun状态下OD 恢复为3+23
        obj_char_other_side["game_speed"] = 0
        obj_char_other_side["game_speed_subframe"] = 0
        obj_char_other_side["game_speed_abnormal_realtime_countdown"] = other_side_countdown
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
        if obj_char_other_side["state"] == "block" or obj_char_other_side["state"] == "hurt" then
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
        init_input_sys_cache(obj_char)
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

-- 2P
function load_game_scene_anim_char_TRM_2P(obj_char)
    local res = {}
    local friction = 4
    local gravity = 2.5
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "2P"
        obj_char["height_state"] = "crouch" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "all" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv0(
            obj_char,
            "0_stand_hurt_low",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv0(
            obj_char,
            "4_stand_block_mid",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv0(
            obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv0(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            32,5,1.05,
            -30,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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

        obj_char["current_animation_length"] = 27

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver1
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 12
        -- collide
        obj_char["pushbox"] = {0,-142.5,121.5,285}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-150,200,300}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver0
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,95,-400,0.8,0.75,0.75,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver0
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,70,-700,1,1.1,1.1,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {295,315}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,0.6)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[1] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[2] = function()
        -- draw_correction
        obj_char[8] = 2
    end
    res[4] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true
        -- collide
        obj_char["hitbox_table"] = {{150,-200,260,98}}
        obj_char["hurtbox_table"] = {{0,-150,200,300},{150,-200,290,128}}
        -- SFX
        play_obj_audio(SFX_table["5P"])
        -- VFX
        insert_VFX_game_scene_char_TRM_2P_whiff(obj_char)
        -- draw_correction
        obj_char[8] = 3
    end
    res[5] = function()
        -- draw_correction
        obj_char[8] = 4
    end
    res[6] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-150,200,300}}
    end
    res[11] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[15] = function()
        -- draw_correction
        obj_char[8] = 5
    end
    res[16] = function()
        obj_char["height_state"] = "crouch" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["hurtbox_table"] = {{0,-150,200,300}}
    end
    res[19] = function()
        -- draw_correction
        obj_char[8] = 6
    end
    res[23] = function()
        -- draw_correction
        obj_char[8] = 7
    end
    res[27] = function()
        -- animation end
    end
    return res
end
-- 6P
function load_game_scene_anim_char_TRM_6P(obj_char)
    local res = {}
    local friction = 10
    local gravity = 2.5
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "6P"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "all" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            obj_char,
            "0_stand_hurt_mid",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            32,5,1.05,
            -30,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
            0-5,2.5,1.05,
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

        obj_char["current_animation_length"] = 42

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver2
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        -- state_number
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 14
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{-10,-105,230,210}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver1
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,-150,-510,0.9,0.8,0.8,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver1
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,-150,-510,1,0.8,0.8,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {280,495}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,1.2)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[2] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-25,-75,320,150}}
        -- SFX
        play_obj_audio(SFX_table["5P"])
        -- VFX
        insert_VFX_game_scene_char_TRM_6P_whiff(obj_char)
        -- draw_correction
        obj_char[8] = 1
    end
    res[4] = function()
        -- draw_correction
        obj_char[8] = 2
    end
    res[6] = function()
        -- draw_correction
        obj_char[8] = 3
    end
    res[8] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true
        -- collide
        obj_char["hitbox_table"] = {{120,-360,200,350}}
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char,
            500,
            -160,
            0.5,-0.8,0.8,0
        )
        -- draw_correction
        obj_char[8] = 4
    end
    res[13] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()

        obj_char["hit_function"] = function() end
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-170,220,340}}
        -- draw_correction
        obj_char[8] = 5
    end
    res[18] = function()
        -- draw_correction
        obj_char[8] = 6
    end
    res[23] = function()
        -- draw_correction
        obj_char[8] = 7
    end
    res[28] = function()
        -- draw_correction
        obj_char[8] = 8
    end
    res[32] = function()
        -- draw_correction
        obj_char[8] = 9
        -- collide
        obj_char["hurtbox_table"] = {{0,-205,180,410}}
    end
    res[36] = function()
        -- draw_correction
        obj_char[8] = 10
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430}}
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[38] = function()
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
    end
    res[42] = function()
        -- animation end
    end
    return res
end
-- 5P
    -- 需要修改的角色属性
        -- 我方
            -- sprite_sheet_state
            -- height_state
            -- hit_type_state
            -- hit_guard_type_state
            -- hurt_state_target
            -- move_state
            -- startup_frame
            -- active_frame
            -- recovery_frame
            -- frame_adv
            -- hit_damage
            -- hit_heat_gain
            -- hit_wallbreak_damage
            -- hurt_heat_gain
            -- blocked_heat_gain
            -- block_heat_gain
            -- block_risk_gauge_gain
            -- FD_block_heat_drain
            -- stand_hurt_animation
            -- stand_block_animation
            -- crouch_hurt_animation
            -- crouch_block_animation
            -- air_hurt_animation
            -- air_block_animation
            -- OTG_hurt_animation
            -- current_animation_length
            -- hit_cancel
            -- idle_cancel
            -- strike_active
            -- strike_inv
            -- strike_inv_countdown
            -- throw_inv
            -- throw_inv_countdown
            -- projectile_inv
            -- projectile_inv_countdown
            -- burst_inv
            -- burst_inv_countdown
            -- hit_function
            -- hurt_function
            -- hit_counter_ver_function
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- damage_correction
            -- hit_hurt_blockstop_countdown
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_test_ground_height_offset
            -- hit_VFX_insert_function
            -- hit_VFX_insert_function_argument
            -- hit_SFX
            -- counter_VFX_insert_function
            -- counter_VFX_insert_function_argument
            -- counter_SFX
            -- block_VFX_insert_function
            -- block_VFX_insert_function_argument
            -- block_SFX
            -- 8
            -- anchor_pos
            -- hurtstop_wiggle_x_animation
            -- hurtstop_wiggle_y_animation
            -- hurtstop_enclose_animation
        -- 对方
            -- frame_adv
function load_game_scene_anim_char_TRM_5P(obj_char)
    local res = {}
    local friction = 4
    local gravity = 2.5
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "5P"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "all" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv0(
            obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv0(
            obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv0(
            obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv0(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            32,5,1.05,
            -30,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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

        obj_char["current_animation_length"] = 27

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver1
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 12
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver0
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,99,-600,0.8,0.75,0.75,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver0
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,75,-915,1,1.1,1.1,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {233,520}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,0.6)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[1] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[2] = function()
        -- state & state_number
        -- draw_correction
        obj_char[8] = 2
    end
    res[4] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true 
        -- collide
        obj_char["hitbox_table"] = {{130,-416,260,98}}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-455,100,50},{130,-416,290,128}}
        -- SFX
        play_obj_audio(SFX_table["5P"])
        -- VFX
        insert_VFX_game_scene_char_TRM_5P_whiff(obj_char)
        -- draw_correction
        obj_char[8] = 3
    end
    res[5] = function()
        -- draw_correction
        obj_char[8] = 4
    end
    res[8] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-455,100,50}}
    end
    res[10] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[12] = function()
        -- draw_correction
        obj_char[8] = 5
    end
    res[15] = function()
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
    end
    res[19] = function()
        -- draw_correction
        obj_char[8] = 6
    end
    res[22] = function()
        -- draw_correction
        obj_char[8] = 7
    end
    res[27] = function()
        -- animation end
    end
    return res
end
-- 2K
function load_game_scene_anim_char_TRM_2K(obj_char)
    local res = {}
    local friction = 10
    local gravity = 2.5
    local side = obj_char["player_side"]
    local input = INPUT_SYS_CURRENT_COMMAND_STATE[side]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "2K"
        obj_char["height_state"] = "crouch" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "low" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv1(
            obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            27,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv1(
            obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            27,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv1(
            obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            27,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv1(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            27,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            27,5,1.05,
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
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            27,5,1.05,
            -30,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
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

        obj_char["current_animation_length"] = 39

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver1
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 12
        -- collide
        obj_char["pushbox"] = {0,-142.5,121.5,285}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-125,200,250}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver0
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,115,-306,0.8,1,1,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver0
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,100,-614,0.9,1.2,1.2,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {290,300}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,0.6)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[2] = function()
        -- state & state_number
        -- collide
        obj_char["hurtbox_table"] = {{0,-100,200,200}}
    end
    res[3] = function()
        -- draw_correction
        obj_char[8] = 1
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char,
            550,
            -160,
            0.5,-0.8,0.8,0
        )
    end
    res[4] = function()
        -- state & state_number
        -- collide
        obj_char["hurtbox_table"] = {{0,-75,200,150}}
        -- draw_correction
        obj_char[8] = 2
    end
    res[6] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true 
        -- collide
        obj_char["hitbox_table"] = {{160,-52.5,260,105}}
        obj_char["hurtbox_table"] = {{0,-75,200,150},{160,-62.5,300,125}}
        -- SFX
        play_obj_audio(SFX_table["5P"])
        -- draw_correction
        obj_char[8] = 3
    end
    res[10] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-75,200,150},{170,-40,140,80}}
    end
    res[11] = function()
        -- draw_correction
        obj_char[8] = 4
    end
    res[12] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-75,200,150}}
    end
    res[15] = function()
        -- draw_correction
        obj_char[8] = 5
    end
    res[17] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[19] = function()
        -- draw_correction
        obj_char[8] = 6
    end
    res[22] = function()
        obj_char["height_state"] = "crouch" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["hurtbox_table"] = {{0,-100,200,200}}
        -- draw_correction
        obj_char[8] = 7
    end
    res[26] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-125,200,250}}
        -- draw_correction
        obj_char[8] = 8
    end
    res[30] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-150,200,300}}
        -- draw_correction
        obj_char[8] = 9
    end
    res[34] = function()
        -- draw_correction
        obj_char[8] = 10
    end
    res[39] = function()
        -- animation end
    end
    return res
end
-- 6K
function load_game_scene_anim_char_TRM_6K(obj_char)
    local res = {}
    local friction = 1
    local gravity = 2.5
    local side = obj_char["player_side"]
    local input = INPUT_SYS_CURRENT_COMMAND_STATE[side]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)
    local velocity_cache = obj_char["velocity"][1]*1
    
    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "6K"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "low" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            obj_char,
            "0_stand_hurt_low",
            "stand","5_stand_idle",
            27,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            27,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            27,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            27,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            27,5,1.05,
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
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            27,5,1.05,
            -30,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
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

        obj_char["current_animation_length"] = 44

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver2
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        obj_char["velocity"] = {obj_char[5]*(60+velocity_cache),0}
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 14
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver1
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,0,-350,0.6,0.6,0.6,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver1
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,-60,-420,0.8,0.8,0.8,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {370,540}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,1.2)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[3] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*(120+velocity_cache),0}
        -- collide
        obj_char["hurtbox_table"] = {{0,-200,190,400}}
        -- draw_correction
        obj_char[8] = 1
    end
    res[8] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*(80+velocity_cache),0}
        -- draw_correction
        obj_char[8] = 2
    end
    res[12] = function()
        -- state & state_number
        obj_char["velocity"] = {obj_char[5]*(40+velocity_cache),0}
        -- draw_correction
        obj_char[8] = 3
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char,
            550,
            -160,
            0.5,-0.8,0.8,0
        )
    end
    res[15] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true 
        obj_char["velocity"] = {obj_char[5]*(20+velocity_cache),0}
        -- collide
        obj_char["hitbox_table"] = {{100,-180,120,250},{200,-140,80,170}}
        obj_char["hurtbox_table"] = {{-15,-215,200,430},{130,-375,90,110},{100,-180,150,280},{200,-140,110,200}}
        -- SFX
        play_obj_audio(SFX_table["5P"])
        -- draw_correction
        obj_char[8] = 4
    end
    res[20] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{-15,-220,230,440}}
        -- draw_correction
        obj_char[8] = 5
    end
    res[24] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-50,-240,180,480}}
        -- draw_correction
        obj_char[8] = 6
    end
    res[28] = function()
        -- draw_correction
        obj_char[8] = 7
    end
    res[31] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[32] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-30,-240,180,480}}
        -- draw_correction
        obj_char[8] = 8
    end
    res[36] = function()
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["hurtbox_table"] = {{-15,-215,170,430},{-40,-455,100,50}}
        -- draw_correction
        obj_char[8] = 9
    end
    res[40] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*(5),0}
        -- collide
        obj_char["hurtbox_table"] = {{-5,-215,170,430},{-15,-455,100,50}}
        -- draw_correction
        obj_char[8] = 10
    end
    res[44] = function()
        -- state_number
        obj_char["velocity"] = {obj_char[5]*(25),0}
        -- animation end
    end
    return res
end
-- 5K
function load_game_scene_anim_char_TRM_5K(obj_char)
    local res = {}
    local friction = 7
    local gravity = 2.5
    local side = obj_char["player_side"]
    local input = INPUT_SYS_CURRENT_COMMAND_STATE[side]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "5K"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "all" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv1(
            obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            18,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv1(
            obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            18,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv1(
            obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            18,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv1(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            18,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            18,5,1.05,
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
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            18,5,1.05,
            -30,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            18,5,1.05,
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

        obj_char["current_animation_length"] = 36

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver1
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 13
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{-20,-215,200,430},{-36,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver0
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,145,-555,0.8,1,1,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver0
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,150,-860,0.9,1.2,1.2,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {235,510}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,0.6)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[2] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-24,-220,200,440},{-60,-460,100,40}}
        -- draw_correction
        obj_char[8] = 1
    end
    res[4] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-28,-325,200,250},{-50,-100,154,200}}
        -- draw_correction
        obj_char[8] = 2
    end
    res[5] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true 
        -- collide
        obj_char["hitbox_table"] = {{187,-300,320,100},{87,-210,120,80}}
        obj_char["hurtbox_table"] = {{-28,-325,200,250},{-50,-100,154,200},{187,-300,360,140},{87,-210,160,120}}
        -- SFX
        play_obj_audio(SFX_table["5P"])
        -- draw_correction
        obj_char[8] = 3
    end
    res[8] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{-28,-325,200,250},{-50,-100,154,200},{117,-300,180,100},{67,-210,80,80}}
    end
    res[11] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-28,-325,200,250},{-50,-100,154,200}}
        -- draw_correction
        obj_char[8] = 4
    end
    res[14] = function()
        -- draw_correction
        obj_char[8] = 5
    end
    res[15] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[18] = function()
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char,
            -550,
            -160,
            0.5,0.8,0.8,0
        )
    end
    res[20] = function()
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{-5,-225,180,450}}
        -- draw_correction
        obj_char[8] = 6
    end
    res[23] = function()
        -- draw_correction
        obj_char[8] = 7
    end
    res[26] = function()
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-455,100,50}}
        -- draw_correction
        obj_char[8] = 8
    end
    res[31] = function()
        -- draw_correction
        obj_char[8] = 9
    end
    res[36] = function()
        -- animation end
    end
    return res
end
-- 2S
function load_game_scene_anim_char_TRM_2S(obj_char)
    local res = {}
    local friction = 10
    local gravity = 2.5
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "2S"
        obj_char["height_state"] = "crouch" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "all" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            32,5,1.05,
            -30,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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

        obj_char["current_animation_length"] = 56

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver2
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 15
        -- collide
        obj_char["pushbox"] = {0,-142.5,121.5,285}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-150,200,300}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver1
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,305,-325,0.9,0.75,0.75,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver1
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,305,-325,1,0.75,0.75,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {292,405}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,1.2)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[3] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[5] = function()
        -- collide
        obj_char["hurtbox_table"] = {{10,-150,220,300}}
        -- draw_correction
        obj_char[8] = 2
    end
    res[8] = function()
        -- collide
        obj_char["hurtbox_table"] = {{20,-150,240,300}}
        -- draw_correction
        obj_char[8] = 3
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char,
            760,
            -160,
            0.5,-0.8,0.8,0
        )
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char,
            -550,
            -160,
            0.5,0.8,0.8,0
        )
    end
    res[10] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true 
        -- collide
        obj_char["hitbox_table"] = {{180,-100,130,200},{325,-75,420,150}}
        obj_char["hurtbox_table"] = {{20,-150,240,300},{180,-110,170,220},{240,-85,280,170}}
        -- draw_correction
        obj_char[8] = 4
        -- SFX
        play_obj_audio(SFX_table["5P"])
        -- VFX
        insert_VFX_game_scene_char_TRM_2S_whiff(obj_char)
    end
    res[12] = function()
        -- draw_correction
        obj_char[8] = 5
    end
    res[13] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["hitbox_table"] = {}
    end
    res[16] = function()
        -- collide
        obj_char["hurtbox_table"] = {{20,-150,240,300},{180,-110,170,220},{225,-85,185,170}}
        -- draw_correction
        obj_char[8] = 6
    end
    res[19] = function()
        -- collide
        obj_char["hurtbox_table"] = {{20,-150,240,300},{180,-110,170,220}}
    end
    res[22] = function()
        -- collide
        obj_char["hurtbox_table"] = {{20,-150,240,300},{165,-110,140,220}}
        -- draw_correction
        obj_char[8] = 7
    end
    res[25] = function()
        -- collide
        obj_char["hurtbox_table"] = {{20,-150,240,300},{145,-110,100,220}}
    end
    res[26] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[28] = function()
        -- collide
        obj_char["hurtbox_table"] = {{10,-150,220,300}}
        -- draw_correction
        obj_char[8] = 8
    end
    res[31] = function()
        -- state
        obj_char["height_state"] = "crouch" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
    end
    res[32] = function()
        -- draw_correction
        obj_char[8] = 9
        -- collide
        obj_char["hurtbox_table"] = {{10,-150,200,300}}
    end
    res[39] = function()
        -- draw_correction
        obj_char[8] = 10
    end
    res[46] = function()
        -- draw_correction
        obj_char[8] = 11
    end
    res[52] = function()
        -- draw_correction
        obj_char[8] = 12
    end
    res[56] = function()
        -- animation_end
    end

    return res
end
-- 6S
function load_game_scene_anim_char_TRM_6S(obj_char)
    local res = {}
    local friction = 20
    local gravity = 2.5
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "6S"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "all" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv3(
            obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv3(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            32,5,1.05,
            -30,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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

        obj_char["current_animation_length"] = 59

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver2
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        if obj_char["velocity"][1]*obj_char[5] < 0 then
            obj_char["velocity"][1] = 0
        end
        obj_char["velocity"][1] = obj_char["velocity"][1]+25*obj_char[5]*0.5
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 16
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-210,180,420}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver1
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,130,-640,0.9,0.75,0.75,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver1
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,130,-640,1,0.75,0.75,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char,
            -420,
            -160,
            0.5,0.8,0.8,0
        )
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {375,510}
        -- VFX
        insert_VFX_game_scene_char_TRM_6S_whiff(obj_char)
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,1.2)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[2] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-200,190,400}}
        -- draw_correction
        obj_char[8] = 1
    end
    res[5] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,190,430},{125,-215,60,280}}
        -- draw_correction
        obj_char[8] = 2
    end
    res[11] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true 
        -- collide
        obj_char["hitbox_table"] = {{200,-410,320,150}}
        obj_char["hurtbox_table"] = {{0,-190,270,380},{200,-260,130,240},{150,-385,370,156}}
        -- draw_correction
        obj_char[8] = 3
        -- SFX
        play_obj_audio(SFX_table["5P"])
    end
    res[15] = function()
        -- state_number
        obj_char["friction"] = 5
        -- collide
        obj_char["hitbox_table"] = {{300,-350,330,150}}
        obj_char["hurtbox_table"] = {{0,-190,270,380},{80,-410,60,60},{210,-135,150,270},{300,-350,380,190}}
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver1
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,175,-615,0.9,0.75,0.75,0}
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver1
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,175,-615,1,0.75,0.75,0}
        -- draw_correction
        obj_char[8] = 4
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char,
            760,
            -160,
            0.5,-0.8,0.8,0
        )
    end
    res[19] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-190,270,380},{200,-135,130,270},{245,-325,320,200}}
        -- draw_correction
        obj_char[8] = 5
    end
    res[24] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-190,270,380},{190,-140,110,280},{200,-310,240,160}}
        -- draw_correction
        obj_char[8] = 6
    end
    res[29] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-190,270,380},{180,-160,90,320},{155,-310,180,110}}
        -- draw_correction
        obj_char[8] = 7
    end
    res[36] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-190,240,380},{155,-180,70,360}}
        -- draw_correction
        obj_char[8] = 8
    end
    res[37] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[42] = function()
        -- state
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["hurtbox_table"] = {{0,-200,190,400}}
        -- draw_correction
        obj_char[8] = 9
    end
    res[47] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430}}
        -- draw_correction
        obj_char[8] = 10
    end
    res[51] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{35,-455,100,50}}
        -- draw_correction
        obj_char[8] = 11
    end
    res[54] = function()
        -- draw_correction
        obj_char[8] = 12
    end
    res[59] = function()
        -- animation_end
    end

    return res
end
-- cS
function load_game_scene_anim_char_TRM_cS(obj_char)
    local res = {}
    local friction = 10
    local gravity = 2.5
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "cS"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "all" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv3(
            obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv3(
            obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv3(
            obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv3(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            32,5,1.05,
            -30,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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

        obj_char["current_animation_length"] = 29

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver2
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 15
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver1
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,10,-580,0.6,0.75,0.75,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver1
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,10,-580,0.75,0.75,0.75,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {320,510}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,1.2)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[3] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[6] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true 
        -- collide
        obj_char["hitbox_table"] = {{185,-230,240,350}}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-440,100,20},{185,-230,290,400}}
        -- draw_correction
        obj_char[8] = 2
        -- SFX
        play_obj_audio(SFX_table["5P"])
        -- VFX
        insert_VFX_game_scene_char_TRM_cS_whiff(obj_char)
    end
    res[10] = function()
        -- draw_correction
        obj_char[8] = 3
    end
    res[12] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-440,100,20},{172,-225,174,340}}
    end
    res[18] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[20] = function()
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-440,100,20},{126,-222.5,82,280}}
        -- draw_correction
        obj_char[8] = 4
    end
    res[22] = function()
        -- state
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char[8] = 5
    end
    res[26] = function()
        -- draw_correction
        obj_char[8] = 6
    end
    res[29] = function()
        -- animation_end
    end

    return res
end
-- _fS
function load_game_scene_anim_char_TRM_fS(obj_char)
    local res = {}
    local friction = 12
    local gravity = 2.5
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "fS"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "all" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            32,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            32,5,1.05,
            -30,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.05,
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

        obj_char["current_animation_length"] = 40

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver2
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        if obj_char["velocity"][1]*obj_char[5] < 0 then
            obj_char["velocity"][1] = 0
        end
        obj_char["velocity"][1] = obj_char["velocity"][1]+55*obj_char[5]
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 15
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-200,220,400}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver1
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,-40,-600,0.6,0.75,0.75,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver1
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,-40,-600,0.75,0.75,0.75,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {320,510}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,1.2)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[2] = function()
        -- state_number
        obj_char["friction"] = 4
        -- collide
        obj_char["hurtbox_table"] = {{-50,-190,250,380}}
        -- draw_correction
        obj_char[8] = 1
    end
    res[5] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-65,-190,250,380}}
        -- draw_correction
        obj_char[8] = 2
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char,
            -550,
            -160,
            0.5,0.8,0.8,0
        )
    end
    res[9] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true 
        -- collide
        obj_char["hitbox_table"] = {{85,-325,280,120}}
        obj_char["hurtbox_table"] = {{-80,-200,250,400},{20,-230,150,160},{20,-325,300,160}}
        -- draw_correction
        obj_char[8] = 3
        -- SFX
        play_obj_audio(SFX_table["5P"])
    end
    res[12] = function()
        -- collide
        obj_char["hitbox_table"] = {{160,-325,280,120}}
        obj_char["hurtbox_table"] = {{-80,-200,250,400},{95,-230,150,160},{85,-325,300,160}}
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver1
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,35,-600,0.6,0.75,0.75,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver1
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,35,-600,0.75,0.75,0.75,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 4
    end
    res[16] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{-50,-200,250,400},{95,-230,150,160},{75,-325,300,160}}
        -- draw_correction
        obj_char[8] = 5
    end
    res[21] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-40,-200,250,400},{80,-235,75,120},{60,-335,200,120}}
        -- draw_correction
        obj_char[8] = 6
    end
    res[24] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-30,-200,230,400},{80,-235,75,120},{60,-335,200,120}}
        -- draw_correction
        obj_char[8] = 7
    end
    res[27] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-30,-200,230,400}}
    end
    res[29] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-20,-200,210,400}}
        -- draw_correction
        obj_char[8] = 8
    end
    res[32] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-30,-455,100,50}}
        -- draw_correction
        obj_char[8] = 9
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[36] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-20,-215,170,430},{-30,-455,100,50}}
        -- draw_correction
        obj_char[8] = 10
    end
    res[37] = function()
        -- state
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
    end
    res[40] = function()
        -- animation_end
    end

    return res
end
-- _2Launcher
function load_game_scene_anim_char_TRM_2Launcher(obj_char)
    local res = {}
    local friction = 7
    local gravity = 2.5
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "2Launcher"
        obj_char["height_state"] = "crouch" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "low" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_low(
            obj_char,
            "0_general_hurt_launched_low",
            "air","knockdown",
            5,5,1.05,
            -15,1.6,1.05,
            load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_down(
                obj_char,
                "0_general_hurt_hard_knockdown_down",
                "air",
                "knockdown_recovery",
                5,5,1.05,
                -10,2.5,1.05,
                nil,nil,nil,nil,function() end
            ),
            load_game_scene_anim_char_common_0_general_hurt_hard_recovery_down(
                obj_char,
                "0_general_hurt_hard_recovery_down",
                "OTG",
                "5_stand_idle",
                nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
            ),
            nil,nil,
            function() 
                obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155)
                obj_char_other_side["gravity_correction"] = 1
            end
        )
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "4_stand_block_mid",
            "stand","5_stand_idle",
            5,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_low(
            obj_char,
            "0_general_hurt_launched_low",
            "air","knockdown",
            5,5,1.05,
            -15,1.6,1.05,
            load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_down(
                obj_char,
                "0_general_hurt_hard_knockdown_down",
                "air",
                "knockdown_recovery",
                -5,5,1.05,
                -10,2.5,1.05,
                nil,nil,nil,nil,function() end
            ),
            load_game_scene_anim_char_common_0_general_hurt_hard_recovery_down(
                obj_char,
                "0_general_hurt_hard_recovery_down",
                "OTG",
                "5_stand_idle",
                nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
            ),
            nil,nil,
            function() 
                obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155)
                obj_char_other_side["gravity_correction"] = 1
            end
        )
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            5,5,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_low(
            obj_char,
            "0_general_hurt_launched_low",
            "air","knockdown_recovery",
            5,5,1.05,
            -15,1.6,1.05,
            nil,
            load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
                obj_char,
                "0_general_hurt_soft_recovery_ground",
                "OTG",
                "5_stand_idle",
                nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
            ),
            nil,nil,
            function() 
                obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155)
            end
        )
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            5,5,1.05,
            -5,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_low(
            obj_char,
            "0_general_hurt_launched_low",
            "air","knockdown_recovery",
            -5,5,1.05,
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

        obj_char["current_animation_length"] = 50

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver3
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 14
        -- collide
        obj_char["pushbox"] = {0,-142.5,121.5,285}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-150,200,300}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver1
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,100,-350,0.6,0.75,0.75,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver1
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,100,-350,0.75,0.75,0.75,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char,
            640,
            -160,
            0.5,-0.8,0.8,0
        )
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {330,310}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,0.3)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[4] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[5] = function()
        -- draw_correction
        obj_char[8] = 2
    end
    res[9] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true
        -- collide
        obj_char["hitbox_table"] = {{240,-65,320,130}}
        obj_char["hurtbox_table"] = {{25,-150,250,300},{240,-72.5,350,145}}
        -- draw_correction
        obj_char[8] = 3
        -- SFX
        play_obj_audio(SFX_table["5P"])
    end
    res[12] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{10,-150,220,300},{155,-110,70,220}}
    end
    res[14] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-150,200,300},{120,-115,40,230}}
        -- draw_correction
        obj_char[8] = 4
    end
    res[16] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-150,200,300}}
        -- draw_correction
        obj_char[8] = 5
    end
    res[19] = function()
        -- draw_correction
        obj_char[8] = 6
    end
    res[23] = function()
        -- draw_correction
        obj_char[8] = 7
    end
    res[26] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[27] = function()
        -- draw_correction
        obj_char[8] = 8
    end
    res[30] = function()
        -- draw_correction
        obj_char[8] = 9
    end
    res[31] = function()
        -- state
        obj_char["height_state"] = "crouch" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-142.5,121.5,285}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-150,200,300}}
        obj_char["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char[8] = 10
    end
    res[37] = function()
        -- draw_correction
        obj_char[8] = 11
    end
    res[40] = function()
        -- draw_correction
        obj_char[8] = 12
    end
    res[44] = function()
        -- draw_correction
        obj_char[8] = 13
    end
    res[50] = function()
        -- animation_end
    end
    return res
end
-- _4_6Launcher
function load_game_scene_anim_char_TRM_4_6Launcher(obj_char)
    local res = {}
    local friction = 7
    local gravity = 2.5
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)
    local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char["player_side"]]

    res[0] = function()
        -- state
        obj_char["default_throw_distance"] = 0
        
        obj_char["sprite_sheet_state"] = "4_6Launcher"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "throw" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "all" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0

        obj_char["throw_success_animation"] = load_game_scene_anim_char_TRM_4_6Launcher_success(obj_char)
        obj_char["throw_hurt_success_animation"] = load_game_scene_anim_char_TRM_4_6Launcher_success_hurt(obj_char)
        obj_char["throw_hurt_PRC_animation"] = load_game_scene_anim_char_TRM_4_6Launcher_success_hurt(obj_char)

        obj_char["current_animation_length"] = 42

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["throw_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_throw_hit_function
        obj_char["hurt_function"] = common_game_scene_throw_hurt_function
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        if test_input_sys_press_or_hold(input["left"]) then
            obj_char["input_sys_cache"]["left"] = true
        elseif test_input_sys_press_or_hold(input["right"]) then
            obj_char["input_sys_cache"]["right"] = true
        end
        -- state_number
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 12
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-18,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = nil
        obj_char["hit_VFX_insert_function_argument"] = nil
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = nil
        obj_char["counter_VFX_insert_function_argument"] = nil
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = nil
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {245,530}
        -- camera_animation_load
        load_game_scene_anim_char_TRM_4_6Launcher_camera_shake_anim(obj_char,1.2)
        load_game_scene_anim_char_TRM_4_6Launcher_camera_enclose_anim(obj_char)
        obj_char["enclose_position_offset"] = {0,0,0}
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[1] = function()
        -- state & state_number
        obj_char["default_throw_distance"] = 240
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["throw_active"] = true 
        -- collide
        obj_char["hitbox_table"] = {{75,-190,160,350}}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-18,-455,100,50},{75,-190,180,370}}
        -- draw_correction
        obj_char[8] = 1
    end
    res[4] = function()
        -- state & state_number
        obj_char["default_throw_distance"] = 0

        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["throw_active"] = false 
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-2,-455,100,50}}
        -- draw_correction
        obj_char[8] = 2
    end
    res[12] = function()
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{22,-455,100,50}}
        -- draw_correction
        obj_char[8] = 3
    end
    res[14] = function()
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{35,-455,100,50}}
        -- draw_correction
        obj_char[8] = 4
    end
    res[19] = function()
        -- draw_correction
        obj_char[8] = 5
    end
    res[35] = function()
        -- draw_correction
        obj_char[8] = 6
    end
    res[37] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
    end
    res[40] = function()
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{16,-455,100,50}}
        -- draw_correction
        obj_char[8] = 7
    end
    res[42] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_4_6Launcher_success_hurt(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)
    local obj_camera = obj_stage_game_scene_camera
    local pushbox_data_other_side = common_game_scene_change_character_pushbox(side)
    local hurtbox_data_other_side = common_game_scene_change_character_hurtbox(side)
    local anchor_data_other_side = common_game_scene_change_character_anchor(side)
    local function update_y_37f_43f(i)
        obj_char_other_side["y"] = 2.5*(i-39)^2+185
    end
    local function update_y_44f_55f(i)
        obj_char_other_side["y"] = 1.5*(i-49)^2+335
    end
    local function update_y_56f_60f(i)
        obj_char_other_side["y"] = 1.111*(i-58)^2+355
    end

    for i = 28,36 do
        res[i] = function()
            point_linear_animator(obj_char_other_side,obj_char_other_side["hurtstop_wiggle_x_animation"])
            point_linear_animator(obj_char_other_side,obj_char_other_side["hurtstop_wiggle_y_animation"])
            obj_char_other_side["hurtstop_wiggle_current_x"] = (obj_char_other_side["hurtstop_wiggle_x"]*(math.random()-0.5)*2)
            obj_char_other_side["hurtstop_wiggle_current_y"] = (obj_char_other_side["hurtstop_wiggle_y"]*(math.random()-0.5)*2)
        end
    end
    for i = 37,43 do
        res[i] = function()
            update_y_37f_43f(i)
        end
    end
    for i = 44,55 do
        res[i] = function()
            update_y_44f_55f(i)
        end
    end
    for i = 56,60 do
        res[i] = function()
            update_y_56f_60f(i)
        end
    end

    res[0] = function()
        -- state
        obj_char_other_side["y"] = 365
        obj_char_other_side["sprite_sheet_state"] = "0_stand_hurt_high"
        obj_char_other_side["height_state"] = "stand" -- stand crouch air OTG
        obj_char_other_side["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char_other_side["move_state"] = "recovery" -- none startup active recovery
        obj_char_other_side["startup_frame"] = 0
        obj_char_other_side["active_frame"] = 0
        obj_char_other_side["recovery_frame"] = 0
        obj_char_other_side["frame_adv"] = 0

        obj_char_other_side["self_knockdown_animation"] = nil
        obj_char_other_side["self_knockdown_recovery_animation"] = 
        load_game_scene_anim_char_common_0_general_hurt_hard_recovery_up(
            obj_char,
            "0_general_hurt_hard_recovery_up",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        )

        obj_char_other_side["current_animation_length"] = 90
        obj_char_other_side["idle_cancel"] = false

        obj_char_other_side["strike_inv"] = false
        obj_char_other_side["strike_inv_countdown"] = 0
        obj_char_other_side["throw_inv"] = true
        obj_char_other_side["throw_inv_countdown"] = 95
        obj_char_other_side["projectile_inv"] = true
        obj_char_other_side["projectile_inv_countdown"] = 95
        obj_char_other_side["burst_inv"] = false
        obj_char_other_side["burst_inv_countdown"] = 0
        -- state_number
        obj_char_other_side["velocity"] = {0,0}
        obj_char_other_side["gravity"] = 0
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side["0_stand_hurt_high"][0]
        obj_char_other_side["pushbox_other_side_char_active"] = false
        obj_char_other_side["hitbox_table"] = {}
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side["0_stand_hurt_high"][0]
        obj_char_other_side["collision_test_ground_height_offset"] = 0
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side["0_stand_hurt_high"]
        -- set_frame_adv
        obj_char["frame_adv"] = 0
    end
    res[1] = function()
        -- state
        obj_char_other_side["state_cache"] = "knockdown_recovery"
    end
    res[27] = function()
        -- state
        obj_char_other_side["x"] = obj_char["x"] + obj_char[5]*315
        pushbox_stage_relocate_x(obj_char_other_side)
        obj_char["x"] = obj_char_other_side["x"] + obj_char_other_side[5]*315
        obj_char_other_side["y"] = 205
        obj_char_other_side["sprite_sheet_state"] = "0_general_hurt_launched_high"
        obj_char_other_side["height_state"] = "air"
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side["0_general_hurt_launched_high"][0]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side["0_general_hurt_launched_high"][0]
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side["0_general_hurt_launched_high"]
        -- character_shake
        obj_char_other_side["hurtstop_wiggle_x_animation"] = 
        common_game_scene_create_wiggle_animation(
            9,
            "hurtstop_wiggle_x",
            15
        )
        obj_char_other_side["hurtstop_wiggle_y_animation"] = 
        common_game_scene_create_wiggle_animation(
            9,
            "hurtstop_wiggle_y",
            7
        )
        init_point_linear_anim_with(obj_char_other_side,obj_char_other_side["hurtstop_wiggle_x_animation"])
        init_point_linear_anim_with(obj_char_other_side,obj_char_other_side["hurtstop_wiggle_y_animation"])
        obj_char_other_side["hurtstop_wiggle_current_x"] = (obj_char_other_side["hurtstop_wiggle_x"]*(math.random()-0.5)*2)
        obj_char_other_side["hurtstop_wiggle_current_y"] = (obj_char_other_side["hurtstop_wiggle_y"]*(math.random()-0.5)*2)
    end
    res[37] = function()
        -- state
        common_game_scene_char_apply_hurt_velocity(
            obj_char,obj_char_other_side,
            10,
            1,
            1,
            0,
            0,
            1
        )
        obj_char["velocity"] = obj_char["velocity_cache"]
        obj_char_other_side["velocity"] = obj_char_other_side["velocity_cache"]
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side["0_general_hurt_launched_high"][1]
        -- draw_correction
        obj_char_other_side[8] = 1
        obj_char_other_side["hurtstop_wiggle_x"] = 0
        obj_char_other_side["hurtstop_wiggle_y"] = 0
        obj_char_other_side["hurtstop_wiggle_current_x"] = 0
        obj_char_other_side["hurtstop_wiggle_current_y"] = 0
        -- update
        update_y_37f_43f(37)
    end
    res[40] = function()
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side["0_general_hurt_launched_high"][3]
        -- draw_correction
        obj_char_other_side[8] = 3
        -- update
        update_y_37f_43f(40)
    end
    res[44] = function()
        -- state
        obj_char_other_side["sprite_sheet_state"] = "0_general_hurt_hard_knockdown_up"
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side["0_general_hurt_hard_knockdown_up"][0]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side["0_general_hurt_hard_knockdown_up"][0]
        -- draw_correction
        obj_char_other_side[8] = 0
        obj_char_other_side["anchor_pos"] = anchor_data_other_side["0_general_hurt_hard_knockdown_up"]
        -- VFX
        obj_char_other_side["y"] = 365
        insert_VFX_game_scene_stage_smoke_land_blow(obj_char_other_side,-355,-160,1,1,1,0)
        -- update
        update_y_44f_55f(44)
    end
    res[49] = function()
        -- collide
        obj_char_other_side["pushbox"] = pushbox_data_other_side["0_general_hurt_hard_knockdown_up"][2]
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side["0_general_hurt_hard_knockdown_up"][2]
        -- draw_correction
        obj_char_other_side[8] = 2
        -- update
        update_y_44f_55f(49)
    end
    res[53] = function()
        -- draw_correction
        obj_char_other_side[8] = 4
        -- update
        update_y_44f_55f(55)
    end
    res[57] = function()
        -- draw_correction
        obj_char_other_side[8] = 5
        -- update
        update_y_56f_60f(56)
    end
    res[60] = function()
        -- state
        obj_char_other_side["height_state"] = "OTG"
        -- collide
        obj_char_other_side["hurtbox_table"] = hurtbox_data_other_side["0_general_hurt_hard_knockdown_up"][6]
        -- draw_correction
        obj_char_other_side[8] = 6
        -- update
        update_y_56f_60f(60)
    end
    res[65] = function()
        -- draw_correction
        obj_char_other_side[8] = 7
    end
    res[90] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_4_6Launcher_success(obj_char)
    local res = {}
    local friction = 1
    local gravity = 2.5
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)
    local input = INPUT_SYS_CURRENT_COMMAND_STATE[obj_char["player_side"]]

    res[0] = function()
        -- state
        obj_char["default_throw_distance"] = 0

        obj_char["sprite_sheet_state"] = "4_6Launcher_success"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "throw" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "all" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0

        obj_char["current_animation_length"] = 129

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["throw_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = true
        obj_char["strike_inv_countdown"] = 129
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 129
        obj_char["projectile_inv"] = true
        obj_char["projectile_inv_countdown"] = 129
        obj_char["burst_inv"] = true
        obj_char["burst_inv_countdown"] = 129

        obj_char["hit_function"] = common_game_scene_throw_hit_function
        obj_char["hurt_function"] = common_game_scene_throw_hurt_function
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 12
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = false
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver1_pos_fixed
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,250,-500,0.8,0.6,0.6,0.262}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = nil
        obj_char["counter_VFX_insert_function_argument"] = {}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = nil
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {249,530}
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- throw_relocate_x
        local dx = obj_char[5]*200
        if test_input_sys_press_or_hold(input["left"]) then
            dx = -200
        elseif test_input_sys_press_or_hold(input["right"]) then
            dx = 200
        end
        obj_char_other_side["x"] = obj_char["x"] + dx
        pushbox_stage_relocate_x(obj_char_other_side)
        obj_char["x"] = obj_char_other_side["x"] - dx
            
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        -- camera_animation_application
        local obj_camera = obj_stage_game_scene_camera
        obj_camera["3d_pos_z_target"] = (math.abs(obj_char["x"]-obj_char_other_side["x"])-720)*(-170)/720-800
        obj_camera["3d_pos_z_target"] = math.min(obj_camera["3d_pos_z_target"],-800)
        obj_camera["3d_pos_z_target"] = math.max(obj_camera["3d_pos_z_target"],-970)

        obj_camera["3d_pos_x_target"] = (obj_char["x"] + obj_char_other_side["x"])/2   -- 必须要保持两个pushbox宽度相同
        obj_camera["3d_pos_x_target"] = math.max(obj_camera["3d_pos_x_target"],-850-(obj_camera["3d_pos_z_target"]+800)*1)
        obj_camera["3d_pos_x_target"] = math.min(obj_camera["3d_pos_x_target"],850+(obj_camera["3d_pos_z_target"]+800)*1)
        local x = math.max(math.min((obj_char["x"]+obj_char_other_side["x"])/2,1000),-1000)
        obj_char["enclose_position_offset"] = {
            x - obj_camera["3d_pos_x_target"],
            (obj_char["y"]+obj_char_other_side["y"])/8 - obj_camera["3d_pos_y_target"],
            120
        }
        table.insert(obj_camera["active_application_table"],
            function()
                anim_camera_point_linear_game_scene_camera_enclosing = obj_char["camera_enclosing_anim"]
                anim_camera_point_linear_game_scene_camera_shake_x = obj_char["camera_x_shake_anim"]
                anim_camera_point_linear_game_scene_camera_shake_y = obj_char["camera_y_shake_anim"]
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_enclosing)
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_shake_x)
                init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_shake_y)
                obj_camera["enclose_position_offset"] = obj_char["enclose_position_offset"]
                obj_camera["state"] = "active"
            end
        )
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[7] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[13] = function()
        -- draw_correction
        obj_char[8] = 2
    end
    res[22] = function()
        -- draw_correction
        obj_char[8] = 3
    end
    res[26] = function()
        -- draw_correction
        obj_char[8] = 4
    end
    res[27] = function()
        -- VFX
        local hit_VFX_insert_function_argument = obj_char["hit_VFX_insert_function_argument"]
        obj_char["hit_VFX_insert_function"](
            hit_VFX_insert_function_argument[1],
            hit_VFX_insert_function_argument[2],
            hit_VFX_insert_function_argument[3],
            hit_VFX_insert_function_argument[4],
            hit_VFX_insert_function_argument[5],
            hit_VFX_insert_function_argument[6],
            hit_VFX_insert_function_argument[7]
        )
        -- draw_correction
        obj_char[8] = 5
    end
    res[45] = function()
        -- draw_correction
        obj_char[8] = 6
    end
    res[55] = function()
        -- draw_correction
        obj_char[8] = 7
    end
    res[60] = function()
        -- draw_correction
        obj_char[8] = 8
    end
    res[67] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- draw_correction
        obj_char[8] = 9
    end
    res[72] = function()
        -- draw_correction
        obj_char[8] = 10
    end
    res[74] = function()
        -- draw_correction
        obj_char[8] = 11
    end
    res[77] = function()
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430}}
    end
    res[81] = function()
        -- draw_correction
        obj_char[8] = 12
    end
    res[84] = function()
        -- draw_correction
        obj_char[8] = 13
    end
    res[120] = function()
        -- draw_correction
        obj_char[8] = 14
    end
    res[125] = function()
        -- draw_correction
        obj_char[8] = 15
    end
    res[129] = function()
        -- animation_end
    end
    return res
end

function load_game_scene_anim_char_TRM_4_6Launcher_camera_enclose_anim(obj_char)
    local anim = {}
    anim[0] = {0.00,1}
    anim[1] = {0.56,2}
    anim[2] = {0.70,4}
    anim[4] = {0.82,6}
    anim[6] = {0.86,8}
    anim[8] = {0.90,10}
    anim[10] = {0.94,20}
    anim[20] = {0.98,30}
    anim[30] = {0.99,35}
    anim[35] = {1.00,40}
    anim[40] = {1.00,45}
    anim[45] = {0.97,50}
    anim[50] = {0.69,55}
    anim[55] = {0.20,60}
    anim[60] = {0.03,65}
    anim[65] = {0.00,65}
    anim["prop"] = "enclose_percentage"
    anim["length"] = 65
    anim["loop"] = false
    anim["fix_type"] = true

    obj_char["camera_enclosing_anim"] = anim
end
function load_game_scene_anim_char_TRM_4_6Launcher_camera_shake_anim(obj_char,multiplyer)
    local anim = {}
    anim = {}
    anim[0] = {0,27}
    anim[27] = {0,28}
    anim[28] = {13.25*multiplyer,29}
    anim[29] = {-10.34*multiplyer,30}
    anim[30] = {-9.93*multiplyer,31}
    anim[31] = {9.02*multiplyer,32}
    anim[32] = {-8.10*multiplyer,33}
    anim[33] = {8.69*multiplyer,34}
    anim[34] = {-6.72*multiplyer,35}
    anim[35] = {6.47*multiplyer,36}
    anim[36] = {-5.78*multiplyer,37}
    anim[37] = {5.46*multiplyer,38}
    anim[38] = {4.31*multiplyer,39}
    anim[39] = {-4.65*multiplyer,40}
    anim[40] = {2.00*multiplyer,41}
    anim[41] = {-2.81*multiplyer,42}
    anim[42] = {1.63*multiplyer,43}
    anim[43] = {0*multiplyer,43}
    anim["prop"] = "3d_pos_x"
    anim["length"] = 43
    anim["loop"] = false
    anim["fix_type"] = false
    obj_char["camera_x_shake_anim"] = anim

    local multiplyer_fix = multiplyer*2
    anim = {}
    anim[0] = {0,27}
    anim[27] = {0,28}
    anim[28] = {10.92*multiplyer_fix,29}
    anim[29] = {2.67*multiplyer_fix,30}
    anim[30] = {-4.00*multiplyer_fix,31}
    anim[31] = {-8.26*multiplyer_fix,32}
    anim[32] = {3.60*multiplyer_fix,33}
    anim[33] = {8.15*multiplyer_fix,34}
    anim[34] = {-2.35*multiplyer_fix,35}
    anim[35] = {-6.04*multiplyer_fix,36}
    anim[36] = {1.75*multiplyer_fix,37}
    anim[37] = {5.44*multiplyer_fix,38}
    anim[38] = {-1.69*multiplyer_fix,39}
    anim[39] = {1.00*multiplyer_fix,40}
    anim[40] = {3.67*multiplyer_fix,41}
    anim[41] = {-1.13*multiplyer_fix,42}
    anim[42] = {2.11*multiplyer_fix,43}
    anim[43] = {0*multiplyer_fix,43}
    anim["prop"] = "3d_pos_y"
    anim["length"] = 43
    anim["loop"] = false
    anim["fix_type"] = false
    obj_char["camera_y_shake_anim"] = anim
end
-- _5Launcher
function load_game_scene_anim_char_TRM_5Launcher(obj_char)
    local res = {}
    local friction = 10
    local gravity = 2.5
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "5Launcher"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "high" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_semi_launched_mid(
            obj_char,
            "0_general_hurt_semi_launched_mid",
            "air",
            "5_stand_idle",
            5,7,1.05,
            0,2,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            5,7,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_semi_launched_mid(
            obj_char,
            "0_general_hurt_semi_launched_mid",
            "air",
            "5_stand_idle",
            5,7,1.05,
            0,2,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            5,7,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            5,7,1.05,
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
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            5,7,1.05,
            -5,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            5,7,1.05,
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

        obj_char["current_animation_length"] = 65

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver2
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 14
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-25,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver1
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,-20,-690,0.6,0.75,0.75,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver1
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,-20,-690,0.75,0.75,0.75,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {415,635}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,1.2)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[1] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[3] = function()
        -- VFX
        insert_VFX_game_scene_char_TRM_5Launcher_glow(obj_char)
    end
    res[5] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-10,-215,190,430},{-40,-455,100,50}}
        -- draw_correction
        obj_char[8] = 2
    end
    res[15] = function()
        -- VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            obj_char,
            500,
            -160,
            0.5,-0.8,0.8,0
        )
    end
    res[17] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-237.5,210,475}}
        -- draw_correction
        obj_char[8] = 3
    end
    res[19] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true
        -- collide
        obj_char["hitbox_table"] = {{140,-285,120,450}}
        obj_char["hurtbox_table"] = {{0,-237.5,210,475},{140,-285,170,500}}
        -- draw_correction
        obj_char[8] = 4
        -- SFX
        play_obj_audio(SFX_table["5P"])
        -- VFX
        insert_VFX_game_scene_char_TRM_5Launcher(obj_char)
    end
    res[20] = function()
        -- draw_correction
        obj_char[8] = 5
    end
    res[22] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-237.5,210,475}}
        -- draw_correction
        obj_char[8] = 6
    end
    res[26] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-237.5,210,475}}
    end
    res[28] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-237.5,210,475}}
    end
    res[30] = function()
        -- draw_correction
        obj_char[8] = 7
    end
    res[40] = function()
        -- draw_correction
        obj_char[8] = 8
    end
    res[43] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[45] = function()
        -- draw_correction
        obj_char[8] = 9
    end
    res[48] = function()
        -- state
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
    end
    res[51] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-25,-455,100,50}}
        -- draw_correction
        obj_char[8] = 10
    end
    res[56] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-25,-455,100,50}}
        -- draw_correction
        obj_char[8] = 11
    end
    res[59] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-12,-455,100,50}}
        -- draw_correction
        obj_char[8] = 12
    end
    res[65] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5Launcher_hold(obj_char)
    local res = {}
    local friction = 10
    local gravity = 2.5
    local side = obj_char["player_side"]
    local SFX_table = common_game_scene_get_SFX_table(side)
    local obj_char_other_side = common_game_scene_change_character(side)

    res[0] = function()
        -- state
        obj_char["sprite_sheet_state"] = "5Launcher"
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "strike" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "high" -- none all low high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        obj_char["frame_adv"] = 0
        
        obj_char["hit_damage"] = 300.0
        obj_char["hit_heat_gain"] = 10.0
        obj_char["hit_wallbreak_damage"] = 20.0
        obj_char["hurt_heat_gain"] = 2.0
        obj_char["blocked_heat_gain"] = 8.0
        obj_char["block_heat_gain"] = 2.0
        obj_char["block_risk_gauge_gain"] = 25.0
        obj_char["FD_block_heat_drain"] = 5.0
        obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_semi_launched_mid(
            obj_char,
            "0_general_hurt_semi_launched_mid",
            "air",
            "5_stand_idle",
            5,7,1.05,
            0,2,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            5,7,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_semi_launched_mid(
            obj_char,
            "0_general_hurt_semi_launched_mid",
            "air",
            "5_stand_idle",
            5,7,1.05,
            0,2,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            5,7,1.05,
            0,2.5,1.05,
            nil,nil,nil,nil,
            function() end
        )
        obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            5,7,1.05,
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
        obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            5,7,1.05,
            -5,2.5,1.05,
            nil,nil,nil,nil,
            function() obj_char_other_side["y"] = math.min(obj_char_other_side["y"],155) end
        )
        obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            5,7,1.05,
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

        obj_char["current_animation_length"] = 65

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false

        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发

        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["burst_inv"] = false
        obj_char["burst_inv_countdown"] = 0

        obj_char["hit_function"] = common_game_scene_strike_hit_function
        obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        obj_char["hit_counter_ver_function"] = common_game_scene_counter_ver2
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
        -- state_number
        obj_char["gravity"] = gravity
        obj_char["friction"] = friction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- game_speed
        obj_char["hit_hurt_blockstop_countdown"] = 14
        -- collide
        obj_char["pushbox"] = {0,-185,121.5,370}
        obj_char["pushbox_other_side_char_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-25,-455,100,50}}
        obj_char["collision_test_ground_height_offset"] = 0 
        -- sub_obj
        obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_ver1
        obj_char["hit_VFX_insert_function_argument"] = {obj_char,-20,-690,0.6,0.75,0.75,0}
        obj_char["hit_SFX"] = nil
        obj_char["counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_ver1
        obj_char["counter_VFX_insert_function_argument"] = {obj_char,-20,-690,0.75,0.75,0.75,0}
        obj_char["counter_SFX"] = nil
        obj_char["block_VFX_insert_function"] = insert_VFX_game_sceme_char_block_ver1
        obj_char["block_SFX"] = nil
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {415,635}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(obj_char,1.2)
        common_game_scene_nil_load_camera_enclose_anim(obj_char)
        -- set_frame_adv
        common_game_scene_change_character(obj_char["player_side"])["frame_adv"] = 0
        -- visual_front
        CHARACTER_VISUAL_FRONT = obj_char["player_side"]
    end
    res[1] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[3] = function()
        -- VFX
        insert_VFX_game_scene_char_TRM_5Launcher_glow(obj_char)
    end
    res[5] = function()
        -- collide
        obj_char["hurtbox_table"] = {{-10,-215,190,430},{-40,-455,100,50}}
        -- draw_correction
        obj_char[8] = 2
    end
    res[17] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-237.5,210,475}}
        -- draw_correction
        obj_char[8] = 3
    end
    res[19] = function()
        -- state & state_number
        if not common_game_scene_get_character_facing_currect(obj_char) then
            obj_char[5] = -obj_char[5]
        end
        obj_char["move_state"] = "active" -- none startup active recovery
        obj_char["strike_active"] = true
        -- collide
        obj_char["hitbox_table"] = {{-30,-400,490,230},{140,-170,150,230}}
        obj_char["hurtbox_table"] = {{0,-237.5,210,475},{-30,-400,540,280},{140,-170,200,280}}
        -- draw_correction
        obj_char[8] = 4
        -- SFX
        play_obj_audio(SFX_table["5P"])
        -- VFX
        insert_VFX_game_scene_char_TRM_5Launcher(obj_char)
    end
    res[20] = function()
        -- collide
        obj_char["hitbox_table"] = {{-30,-400,510,230},{145,-170,160,230}}
        obj_char["hurtbox_table"] = {{0,-237.5,210,475},{-30,-400,560,280},{145,-170,210,280}}
        -- draw_correction
        obj_char[8] = 5
    end
    res[22] = function()
        -- state
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        obj_char["strike_active"] = false
        obj_char["hit_function"] = function() end
        -- collide
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-237.5,210,475},{-30,-385,370,250},{110,-170,90,180}}
        -- draw_correction
        obj_char[8] = 6
    end
    res[26] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-237.5,210,475},{-30,-380,320,240},{97.5,-185,65,150}}
    end
    res[28] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-237.5,210,475}}
    end
    res[30] = function()
        -- draw_correction
        obj_char[8] = 7
    end
    res[40] = function()
        -- draw_correction
        obj_char[8] = 8
    end
    res[43] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        init_input_sys_cache(obj_char)
    end
    res[45] = function()
        -- draw_correction
        obj_char[8] = 9
    end
    res[48] = function()
        -- state
        obj_char["height_state"] = "stand" -- stand crouch air OTG
        obj_char["hit_type_state"] = "none" -- none strike throw burst
        obj_char["hit_guard_type_state"] = "none" -- none all low high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery

        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true

        obj_char["hit_function"] = function() end
        obj_char["hurt_function"] = function() end
        obj_char["parry_function"] = function() end
        obj_char["hit_counter_ver_function"] = function() end
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(obj_char["player_side"])()
        -- state_number
        obj_char["gravity"] = 2.5
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
    end
    res[51] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-25,-455,100,50}}
        -- draw_correction
        obj_char[8] = 10
    end
    res[56] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-25,-455,100,50}}
        -- draw_correction
        obj_char[8] = 11
    end
    res[59] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-12,-455,100,50}}
        -- draw_correction
        obj_char[8] = 12
    end
    res[65] = function()
        -- animation_end
    end
    return res
end
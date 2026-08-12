-- character_animation
-- all_ground_idle_animation
    -- 需要修改的角色属性
        -- 我方
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
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- damage_correction
            -- pushbox_opponent_collision_active
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_ground_height_offset
            -- 8
            -- anchor_pos
        -- 对方
            ------
-- _1_2_3_crouch
function load_game_scene_anim_char_TRM_1_2_3_crouch(obj_char)
    local res = {}
    res["prop_f"] = "f"
    res["anim_length"] = 62
    for i = 1,7 do
        res[i*7+5] = function()
            -- draw_correction
            obj_char[8] = i+2
        end
    end
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "1_2_3_crouch"
        obj_char["height"] = "crouch" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-142.5,120,285}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-175,180,350}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-80,-355}
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
    res["prop_f"] = "f"
    res["anim_length"] = 12
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "1_2_3_crouch_turn"
        obj_char["height"] = "crouch" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-142.5,120,285}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-150,200,300}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-80,-355}
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
    res["prop_f"] = "f"
    res["anim_length"] = 5
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "1_2_3_crouch_to_stand_idle"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-142.5,120,285}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-190,190,380}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
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
    res["prop_f"] = "f"
    res["anim_length"] = 57
    for i = 0,7 do
        res[i*7] = function()
            -- draw_correction
            obj_char[8] = i
        end
    end
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "5_stand_idle"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
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
    res["prop_f"] = "f"
    res["anim_length"] = 12
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "5_stand_turn"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
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
    local side = obj_char["player_side"]
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    res["prop_f"] = "f"
    res["anim_length"] = 16
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "5_stand_dash_skid"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["friction"] = 10
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["idle_cancel"] = false
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-142.5,120,285}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-160,290,320}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {323,515}
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_dash_skid"])
        play_obj_audio(stage_interactive_SFX_table["ground_step_0"])
    end
    res[4] = function()
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["hurtbox_table"] = {{0,-215,170,430}}
        obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char[8] = 1
    end
    res[8] = function()
        -- state
        obj_char["idle_cancel"] = true
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        obj_char[8] = 2
    end
    res[12] = function()
        -- draw_correction
        obj_char[8] = 3
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_step_1"])
    end
    res[16] = function()
        -- animation_end
    end
    return res
end
-- all_ground_walk_dash
    -- 需要修改的角色属性
        -- 我方
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
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_ground_height_offset
            -- 8
            -- anchor_pos
        -- 对方
            ------
-- _4_walk
function load_game_scene_anim_char_TRM_4_walk(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    local walk_speed = -7.0
    res["prop_f"] = "f"
    res["anim_length"] = 85
    for i = 0,84 do
        res[i] = function()
            -- state_number
            obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        end
    end
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "4_walk"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{-7,-455,100,50}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-120,-455}
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
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_step_0"])
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
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_step_1"])
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
        obj_char["f"] = 21
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 2
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_step_0"])
    end
    res[85] = function()
        -- animation_end
    end
    return res
end
-- _4_walk_to_stand_idle
function load_game_scene_anim_char_TRM_4_walk_to_stand_idle(obj_char)
    local res = {}
    res["prop_f"] = "f"
    res["anim_length"] = 8
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "4_walk_to_stand_idle"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
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
    local res = {}
    local side = obj_char["player_side"]
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    local walk_speed = 9.0
    res["prop_f"] = "f"
    res["anim_length"] = 85
    for i = 0,84 do
        res[i] = function()
            -- state_number
            obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        end
    end
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "6_walk"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{7,-455,100,50}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
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
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_step_0"])
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
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_step_1"])
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
        obj_char["f"] = 14
        -- state_number
        obj_char["velocity"] = {obj_char[5]*walk_speed,0}
        -- draw_correction
        obj_char[8] = 2
    end
    res[85] = function()
        -- animation_end
    end
    return res
end
-- _6_walk_to_stand_idle
function load_game_scene_anim_char_TRM_6_walk_to_stand_idle(obj_char)
    local res = {}
    res["prop_f"] = "f"
    res["anim_length"] = 8
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "6_walk_to_stand_idle"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
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
            -- sprite_sheet
            -- height
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
            -- collision_ground_height_offset
            -- 8
            -- anchor_pos
        -- 对方
            -- frame_adv
function load_game_scene_anim_char_TRM_7_8_9_jump_air_to_stand_idle(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    res["prop_f"] = "f"
    res["anim_length"] = 8
    res[0] = function()
        -- state
        obj_char["y"] = 0
        obj_char["sprite_sheet"] = "7_8_9_jump_air_to_stand_idle"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["velocity_cache"] = {0,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        obj_char["air_move"]["jump"][1] = obj_char["air_move"]["jump"][2]
        obj_char["air_move"]["air_dash"][1] = obj_char["air_move"]["air_dash"][2]
        -- enemy_friend_interaction
        obj_char["idle_cancel"] = false
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- frame_data
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-190,180,380}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {325,480}
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_land_blow(obj_char,-355,-160,1,1,1,0)
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_land"])
    end
    res[3] = function()
        -- state
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["idle_cancel"] = true
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(side)()
    end
    res[5] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-215,170,430},{15,-455,100,50}}
        -- draw_correction
        obj_char[8] = 1
    end
    res[8] = function()
        -- animation end
    end
    return res
end
-- _7_8_9_jump_air
    -- 需要修改的角色属性
        -- 我方
            -- sprite_sheet
            -- height
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
        -- 对方
            ------
function load_game_scene_anim_char_TRM_7_8_9_jump_air(obj_char,sprite_sheet,anchor_pos,horizontal_velocity,vertical_velocity,SFX_name)
    local res = {}
    local side = obj_char["player_side"]
    local input = INPUT_SYS_CURRENT_COMMAND_STATE[side]
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    local width_table = {200,200,200,230,260,270,235,200}
    local function update_maintain_horizontal_velocity()
        -- state_number
        obj_char["velocity"][1] = horizontal_velocity
    end
    local function update_before_falling()
        -- state_number
        obj_char["velocity"][1] = horizontal_velocity
        if obj_char["velocity"][2] >= - 16.0 and obj_char["f"] <= 8 then
            obj_char["f"] = 9
            update_maintain_horizontal_velocity()
            obj_char["hurtbox_table"] = {{0,-150,width_table[2],320}}
            obj_char[8] = 2
        end
    end
    res["prop_f"] = "f"
    res["anim_length"] = 35
    if sprite_sheet == "8_jump" then
        width_table = {200,200,200,200,200,200,200,200}
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
        obj_char["sprite_sheet"] = sprite_sheet
        obj_char["height"] = "air" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["velocity"][1] = horizontal_velocity
        if vertical_velocity ~= nil then
            obj_char["velocity"][2] = vertical_velocity
        end
        obj_char["friction"] = 0
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["idle_cancel"] = false
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-100,120,200}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-180,width_table[1],380}}
        obj_char["collision_ground_height_offset"] = 185
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-320}
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = anchor_pos
        -- play_SFX
        if SFX_name then
            play_obj_audio(stage_interactive_SFX_table[SFX_name])
        end
        -- update
        update_before_falling()
    end
    res[4] = function()
        -- state
        obj_char["idle_cancel"] = true
        -- input_sys_cache
        obj_char["input_sys_state"] = "load_without_direction" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(side)()
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
        -- collide
        obj_char["hurtbox_table"] = {{0,-150,width_table[3],320}}
        -- draw_correction
        obj_char[8] = 2
        -- update
        update_maintain_horizontal_velocity()
    end
    res[13] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-145,width_table[4],310}}
        -- draw_correction
        obj_char[8] = 3
        -- update
        update_maintain_horizontal_velocity()
    end
    res[17] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-130,width_table[5],280}}
        -- draw_correction
        obj_char[8] = 4
        -- update
        update_maintain_horizontal_velocity()
    end
    res[21] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-125,width_table[6],270}}
        -- draw_correction
        obj_char[8] = 5
        -- update
        update_maintain_horizontal_velocity()
    end
    res[25] = function()
        -- collide
        obj_char["hurtbox_table"] = {{0,-150,width_table[7],320}}
        -- draw_correction
        obj_char[8] = 6
        -- update
        update_maintain_horizontal_velocity()
    end
    res[26] = function()
        -- 下降阶段开始
        -- collide
        obj_char["hurtbox_table"] = {{0,-180,width_table[8],380}}
        -- draw_correction
        obj_char[8] = 7
        -- update
        update_maintain_horizontal_velocity()
    end
    res[30] = function()
        -- draw_correction
        obj_char[8] = 8
        -- update
        update_maintain_horizontal_velocity()
    end
    res[34] = function()
        -- state
        obj_char["f"] = 26
        -- draw_correction
        obj_char[8] = 7
        -- update
        update_maintain_horizontal_velocity()
    end
    res[35] = function()
        -- animation end
    end
    return res
end
-- _7_8_9_pre_jump
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
        -- 对方
            -- frame_adv
function load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    res["prop_f"] = "f"
    res["anim_length"] = 4
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "7_8_9_pre_jump"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        if test_input_sys_press_or_hold(INPUT_SYS_CURRENT_COMMAND_STATE[side]["dash"]) 
        and obj_char["velocity"][1] <= 1.0
        and obj_char["direction_input"] == 9
        then
            obj_char["velocity"][1] = 25*obj_char[5]
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
        obj_char["friction"] = 7
        obj_char["gravity"] = 2.5
        obj_char["air_move"]["jump"][1] = obj_char["air_move"]["jump"][2]
        obj_char["air_move"]["air_dash"][1] = obj_char["air_move"]["air_dash"][2]
        -- enemy_friend_interaction
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 4
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- frame_data
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(side)(obj_char)
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {275,415}
    end
    res[2] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[3] = function()
        -- draw_correction
        obj_char[8] = 2
        -- insert_VFX
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
            -- sprite_sheet
            -- height
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
            -- projectile_inv_countdow
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
        -- 对方
            -- frame_adv
function load_game_scene_anim_char_TRM_4dash_backdash(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    res["prop_f"] = "f"
    res["anim_length"] = 30
    for i=0,10 do
        res[i] = function()
            -- state_number
            obj_char["velocity"][1] = (-32.0+i)*obj_char[5]
        end
    end
    res[0] = function()
        -- state
        obj_char["y"] = -180
        obj_char["sprite_sheet"] = "4dash_backdash"
        obj_char["height"] = "air" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        obj_char["velocity"] = {-32.0*obj_char[5],-7.0}
        obj_char["friction"] = 0
        obj_char["gravity"] = 1.0
        -- enemy_friend_interaction
        obj_char["idle_cancel"] = false
        obj_char["strike_inv"] = true
        obj_char["strike_inv_countdown"] = 7
        obj_char["throw_inv"] = true
        obj_char["throw_inv_countdown"] = 15
        obj_char["projectile_inv"] = true
        obj_char["projectile_inv_countdown"] = 6
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- frame_data
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        -- collide
        obj_char["pushbox"] = {0,-100,120,200}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-175,-200}
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {275,505}
    end
    res[2] = function()
        -- state_number
        obj_char["velocity"][1] = -30.0*obj_char[5]
        -- draw_correction
        obj_char[8] = 1
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
        common_game_scene_get_input_sys_cache_init(side)(obj_char)
    end
    res[15] = function()
        -- state
        obj_char["y"] = 0
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        -- state_number
        obj_char["velocity"][2] = 0
        obj_char["friction"] = 10
        obj_char["gravity"] = 2.5
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["hurtbox_table"] = {{0,-225,180,450}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        obj_char[8] = 3
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_land_blow(obj_char,-340,-160,1,1,1,0)
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_land"])
    end
    res[18] = function()
        -- state
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" 
        obj_char["idle_cancel"] = true
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(side)()
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
            -- sprite_sheet
            -- height
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
        -- 对方
            -- frame_adv
function load_game_scene_anim_char_TRM_4dash_air_backdash(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    res["prop_f"] = "f"
    res["anim_length"] = 11
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
        obj_char["sprite_sheet"] = "4dash_air_backdash"
        obj_char["height"] = "air" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        obj_char["velocity"][1] = -25*obj_char[5]
        obj_char["velocity"][2] = obj_char["velocity"][2]*0.6
        obj_char["friction"] = 0
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["idle_cancel"] = false
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- frame_data
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(side)(obj_char)
        -- collide
        obj_char["pushbox"] = {0,-100,120,200}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-125,260,270}}
        obj_char["collision_ground_height_offset"] = 185
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-260}
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {242,285}
        -- insert_VFX
        insert_VFX_game_scene_stage_4dash_air_backdash_shockwave(obj_char,150,-400,0.75,-0.75,0.75,0)
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["air_backdash"])
    end
    res[3] = function()
        -- state_number
        if obj_char["velocity"][2] > 0 then
            obj_char["velocity"][2] = 0
            obj_char["gravity"] = 0
        end
        -- collide
        obj_char["hurtbox_table"] = {{0,-125,260,270},{30,-80,260,260}}
        -- draw_correction
        obj_char[8] = 1
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
        -- state_number
        obj_char["velocity"][1] = -25*obj_char[5]
        obj_char["velocity"][2] = 0
        obj_char["gravity"] = 0
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(side)()
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
            -- sprite_sheet
            -- height
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
        -- 对方
            ------
function load_game_scene_anim_char_TRM_6dash_dash(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    local dash_acceleration = 0.4
    local function update_horizontal_velocity()
        obj_char["velocity"] = {
            obj_char[5]*dash_acceleration+obj_char["velocity"][1],0
        }
    end
    res["prop_f"] = "f"
    res["anim_length"] = 37
    for i = 0,36 do
        res[i] = function()
            -- state_number
            update_horizontal_velocity()
        end
    end
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "6dash_dash"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["velocity"] = {20*obj_char[5],0}
        obj_char["friction"] = 100
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- frame_data
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-190,285,380}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {60,-350}
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {288,510}
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_dash_start_up"])
        play_obj_audio(stage_interactive_SFX_table["ground_dash_loop"])
    end
    res[4] = function()
        -- state_number
        update_horizontal_velocity()
        -- collide
        obj_char["pushbox"] = {0,-142.5,120,285}
        obj_char["hurtbox_table"] = {{0,-150,390,300}}
        -- draw_correction
        obj_char[8] = 1
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[8] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 2
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_step_0"])
    end
    res[12] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 3
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[16] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 4
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[20] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 5
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[24] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 6
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_step_1"])
    end
    res[28] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 7
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[32] = function()
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 8
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
    end
    res[36] = function()
        -- state
        obj_char["f"] = 4
        -- state_number
        update_horizontal_velocity()
        -- draw_correction
        obj_char[8] = 1
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_dash_loop"])
    end
    res[37] = function()
        -- animation_end
    end
    return res
end
-- _6dash_air_dash
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
            -- idle_cancel
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
        -- 对方
            -- frame_adv
function load_game_scene_anim_char_TRM_6dash_air_dash(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    res["prop_f"] = "f"
    res["anim_length"] = 24
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
    for i=12,23 do
        res[i] = function()
            -- state_number
            obj_char["velocity"][1] = (90-(i-12)*6)*obj_char[5]
        end
    end
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "6dash_air_dash"
        obj_char["height"] = "air" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        obj_char["velocity"][1] = 4*obj_char[5]
        obj_char["velocity"][2] = obj_char["velocity"][2]*0.6
        obj_char["friction"] = 0
        obj_char["gravity"] = 2.5
        if obj_char["velocity"][2] > 0 then
            obj_char["velocity"][2] = 0
            obj_char["gravity"] = 0
        end
        -- enemy_friend_interaction
        obj_char["idle_cancel"] = false
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- frame_data
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(side)(obj_char)
        -- collide
        obj_char["pushbox"] = {0,-100,120,200}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-125,260,270}}
        obj_char["collision_ground_height_offset"] = 185
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-260}
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {350,283}
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
        -- state
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["velocity"][1] = (90-(12-12)*6)*obj_char[5]
        obj_char["velocity"][2] = 0
        obj_char["gravity"] = 0
        -- collide
        obj_char["hurtbox_table"] = {{0,-125,260,270},{-65,-50,260,120}}
        -- draw_correction
        obj_char[8] = 3
        -- insert_VFX
        insert_VFX_game_scene_stage_6dash_air_dash_shockwave(obj_char,50,-430,0.75,0.75,0.75,0)
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["air_dash"])
    end
    res[15] = function()
        -- state_number
        obj_char["velocity"][1] = (90-(15-12)*6)*obj_char[5]
        -- draw_correction
        obj_char[8] = 4
    end
    res[18] = function()
        -- state
        obj_char["idle_cancel"] = true
        -- state_number
        obj_char["velocity"][1] = (90-(18-12)*6)*obj_char[5]
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(side)()
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
-- _6dash_dash_cancel
function load_game_scene_anim_char_TRM_6dash_dash_cancel(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(side)
    local dash_acceleration = 0.625
    local function update_horizontal_velocity()
        obj_char["velocity"] = {
            obj_char[5]*dash_acceleration+obj_char["velocity"][1],0
        }
    end
    res["prop_f"] = "f"
    res["anim_length"] = 26
    for i = 0,26 do
        res[i] = function()
            -- state_number
            update_horizontal_velocity()
        end
    end
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "6dash_dash"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        obj_char["velocity"] = {21.25*obj_char[5],0}
        obj_char["friction"] = 100
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["idle_cancel"] = true
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- frame_data
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-190,285,380}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {60,-350}
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {288,510}
        -- insert_VFX
        insert_VFX_game_scne_stage_dash_cancel_blow(obj_char,-870,-175,1,1,1,0)
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_dash_start_up"])
        play_obj_audio(stage_interactive_SFX_table["ground_dash_cancel"])
        play_obj_audio(stage_interactive_SFX_table["ground_dash_loop"])
        -- update
        update_horizontal_velocity()
    end
    res[4] = function()
        -- collide
        obj_char["pushbox"] = {0,-142.5,120,285}
        obj_char["hurtbox_table"] = {{0,-150,390,300}}
        -- draw_correction
        obj_char[8] = 1
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
        -- update
        update_horizontal_velocity()
    end
    res[8] = function()
        -- draw_correction
        obj_char[8] = 2
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_step_0"])
        -- update
        update_horizontal_velocity()
    end
    res[10] = function()
        -- state
        obj_char["idle_cancel"] = false
    end
    res[12] = function()
        -- draw_correction
        obj_char[8] = 3
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
        -- update
        update_horizontal_velocity()
    end
    res[16] = function()
        -- draw_correction
        obj_char[8] = 4
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
        -- update
        update_horizontal_velocity()
    end
    res[20] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(side)(obj_char)
        -- draw_correction
        obj_char[8] = 5
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
        -- update
        update_horizontal_velocity()
    end
    res[24] = function()
        -- draw_correction
        obj_char[8] = 6
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_dash_shot(obj_char,-1800,-600,0.5,1,1,0)
        -- play_SFX
        play_obj_audio(stage_interactive_SFX_table["ground_step_1"])
        -- update
        update_horizontal_velocity()
    end
    res[26] = function()
        -- animation_end
    end
    return res
end
-- 统一所有地面的速度阻力
-- 空中阻力和地面相同
-- 水平速度为地面的一半
-- 空防垂直速度7.5 重力2.5
-- 防御修正1.00
-- 打击修正1.02
-- _2P
    -- 需要修改的角色属性
        -- 我方
            -- sprite_sheet
            -- height
            -- hit_type
            -- hit_guard_type
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
            -- hit_function
            -- hurt_function
            -- strike_counter_ver_function
            -- gravity
            -- friction
            -- horizontal_velocity_correction
            -- gravity_correction
            -- damage_correction
            -- hit_hurt_blockstop_countdown
            -- pushbox
            -- hitbox_table
            -- hurtbox_table
            -- collision_ground_height_offset
            -- hit_VFX_insert_function
            -- hit_VFX_insert_function_argument
            -- hit_SFX
            -- hit_counter_VFX_insert_function
            -- hit_counter_VFX_insert_function_argument
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
function load_game_scene_anim_char_TRM_2P(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 27
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "2P"
        hit_side_obj_char["height"] = "crouch" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "all" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 4
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv0(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_low",
            "stand","5_stand_idle",
            37.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv0(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_mid",
            "stand","5_stand_idle",
            37.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv0(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            37.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv0(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            37.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            22.5,5,1.035,
            -17.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            17.5,5,1.00,
            -12.5,12.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            12.5,5,1.035,
            -5,2.5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver1
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 13
        -- collide
        hit_side_obj_char["pushbox"] = {0,-142.5,120,285}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-150,200,300}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver0
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {95,-380,0.8,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver0
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {95,-380,0.4,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver0
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {70,-700,1,1.1,1.1,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver0
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["2P_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["2P_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["2P_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["2P_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-80,-355}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {295,315}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.25,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[1] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[2] = function()
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[4] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true
        -- collide
        hit_side_obj_char["hitbox_table"] = {{150,-200,240,100}}
        hit_side_obj_char["hurtbox_table"] = {{0,-150,200,300},{150,-200,290,150}}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_2P_move(hit_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[5] = function()
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[6] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-150,200,300}}
    end
    res[11] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[15] = function()
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[16] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-150,200,300}}
    end
    res[19] = function()
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[23] = function()
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[27] = function()
        -- animation end
    end
    return res
end
-- _6P
function load_game_scene_anim_char_TRM_6P(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 42
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "6P"
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "high" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 10
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_mid",
            "stand","5_stand_idle",
            52.5,5,1.00,
            0,2.5,1.035,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            52.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            52.5,5,1.00,
            0,2.5,1.035,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            52.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            12.5,5,1.035,
            -22.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            27.5,5,1.00,
            -22.5,12.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            60,5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver2
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 15
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{-10,-105,230,210}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_dynamic_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {-150,-510,0.9,0.8,0.8,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_dynamic_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {-150,-510,0.45,0.8,0.8,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {-150,-510,1,0.8,0.8,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["6P_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["6P_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["6P_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["6P_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-170,-435}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {280,495}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.42,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[2] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-25,-75,320,150}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-225,-455}
        -- draw_correction
        hit_side_obj_char[8] = 1
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_6P_move(hit_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_move_SFX_table["common_oroboros"])
    end
    res[4] = function()
        -- draw_correction
        hit_side_obj_char[8] = 2
        -- play_SFX
    end
    res[6] = function()
        -- draw_correction
        hit_side_obj_char[8] = 3
    end
    res[8] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true
        -- collide
        hit_side_obj_char["hitbox_table"] = {{95,-300,130,240},{170,-275,20,190},{190,-255,20,150}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-90,-405}
        -- draw_correction
        hit_side_obj_char[8] = 4
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hit_side_obj_char,
            500,
            -160,
            0.5,-0.8,0.8,0
        )
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[13] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-170,220,340}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[18] = function()
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[23] = function()
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[28] = function()
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[32] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-205,180,410}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-105,-445}
        -- draw_correction
        hit_side_obj_char[8] = 9
    end
    res[36] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 10
    end
    res[38] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
    end
    res[42] = function()
        -- animation end
    end
    return res
end
-- _5P
function load_game_scene_anim_char_TRM_5P(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 27
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "5P"
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "all" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 4
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv0(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            37.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv0(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            37.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv0(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            37.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv0(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            37.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            22.5,5,1.035,
            -17.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            17.5,5,1.00,
            -12.5,12.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            12.5,5,1.035,
            -5,2.5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver1
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 13
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver0
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {99,-600,0.8,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver0
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {99,-600,0.4,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver0
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {75,-915,1,1.1,1.1,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver0
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["5P_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["5P_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["5P_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["5P_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {233,510}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.25,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[1] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[2] = function()
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[4] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true 
        -- collide
        hit_side_obj_char["hitbox_table"] = {{130,-416,260,98}}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30},{130,-416,290,128}}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_5P_move(hit_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[5] = function()
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[8] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
    end
    res[10] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[12] = function()
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[15] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
    end
    res[19] = function()
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[22] = function()
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[27] = function()
        -- animation end
    end
    return res
end
-- _2K
    -- Say hello to real low profile fucker.
    -- this is nothing but a Sol 2D low profile hurtbox
    -- enjoy
function load_game_scene_anim_char_TRM_2K(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hit_side]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 39
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "2K"
        hit_side_obj_char["height"] = "crouch" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "low" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 10
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv1(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_low",
            "stand","5_stand_idle",
            25,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv1(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_mid",
            "stand","5_stand_idle",
            25,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv1(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            25,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv1(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            25,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            22.5,5,1.035,
            -17.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            17.5,5,1.00,
            -12.5,12.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            12.5,5,1.035,
            -5,2.5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver1
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 13
        -- collide
        hit_side_obj_char["pushbox"] = {0,-142.5,120,285}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-125,200,250}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver0
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {115,-306,0.8,1,1,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver0
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {115,-306,0.4,1,1,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver0
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {100,-614,0.9,1.2,1.2,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["2K_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["2K_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["2K_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["2K_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-355}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {290,300}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.25,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[2] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-100,200,200}}
    end
    res[3] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hit_side_obj_char,
            550,
            -160,
            0.5,-0.8,0.8,0
        )
    end
    res[4] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-75,200,150}}
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[6] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true 
        -- collide
        hit_side_obj_char["hitbox_table"] = {{160,-52.5,260,105}}
        hit_side_obj_char["hurtbox_table"] = {{0,-75,200,150},{160,-62.5,300,125}}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[10] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-75,200,150},{170,-40,140,80}}
    end
    res[11] = function()
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[12] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-75,200,150}}
    end
    res[15] = function()
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[17] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[19] = function()
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[22] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-100,200,200}}
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[26] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-125,200,250}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-80,-355}
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[30] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-150,200,300}}
        -- draw_correction
        hit_side_obj_char[8] = 9
    end
    res[34] = function()
        -- draw_correction
        hit_side_obj_char[8] = 10
    end
    res[39] = function()
        -- animation end
    end
    return res
end
-- _6K
function load_game_scene_anim_char_TRM_6K(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hit_side]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    local hit_side_velocity_cache = hit_side_obj_char["velocity"][1]*hit_side_obj_char[5]
    res["prop_f"] = "f"
    res["anim_length"] = 44
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "6K"
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "low" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        if hit_side_velocity_cache < 0 then
            hit_side_velocity_cache = 0
        end
        hit_side_obj_char["velocity"] = {(hit_side_velocity_cache+60)*hit_side_obj_char[5],0}
        hit_side_obj_char["friction"] = 1
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_low",
            "stand","5_stand_idle",
            35,5,1.00,
            0,2.5,1.07,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_mid",
            "stand","5_stand_idle",
            35,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            35,5,1.00,
            0,2.5,1.07,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            35,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            7.5,5,1.07,
            -42.5,2.5,1.07,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            22.5,5,1.00,
            -7.5,12.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            45,5,1.07,
            -7.5,2.5,1.07,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver2
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 15
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_dynamic_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {0,0,0.6,0.8,0.8,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_dynamic_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {0,0,0.3,0.8,0.8,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_dynamic_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {0,0,0.8,1.0,1.0,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["6K_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["6K_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["6K_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["6K_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {370,540}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.42,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[3] = function()
        -- state_number
        hit_side_obj_char["velocity"] = {hit_side_obj_char[5]*(120+hit_side_velocity_cache),0}
        hit_side_obj_char["friction"] = 1
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-200,190,400}}
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[8] = function()
        -- state_number
        hit_side_obj_char["velocity"] = {hit_side_obj_char[5]*(80+hit_side_velocity_cache),0}
        hit_side_obj_char["friction"] = 1
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[12] = function()
        -- state_number
        hit_side_obj_char["velocity"] = {hit_side_obj_char[5]*(40+hit_side_velocity_cache),0}
        hit_side_obj_char["friction"] = 1
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hit_side_obj_char,
            550,
            -160,
            0.5,-0.8,0.8,0
        )
    end
    res[15] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- state_number
        hit_side_obj_char["velocity"] = {hit_side_obj_char[5]*(20+hit_side_velocity_cache),0}
        hit_side_obj_char["friction"] = 1
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true 
        -- collide
        hit_side_obj_char["hitbox_table"] = {{90,-180,140,250},{180,-160,40,210}}
        hit_side_obj_char["hurtbox_table"] = {{-15,-215,200,430},{110,-375,50,110},{90,-180,170,280},{180,-160,70,240}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-180,-455}
        -- draw_correction
        hit_side_obj_char[8] = 4
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[20] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{-15,-220,230,440}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[24] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-50,-240,180,480}}
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[26] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[28] = function()
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[32] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-30,-240,180,480}}
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[36] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["friction"] = 1
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-15,-215,170,430},{-40,-455,100,50}}
        -- draw_correction
        hit_side_obj_char[8] = 9
    end
    res[40] = function()
        -- state_number
        hit_side_obj_char["velocity"] = {hit_side_obj_char[5]*(5),0}
        hit_side_obj_char["friction"] = 1
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-5,-215,170,430},{-15,-455,100,50}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 10
    end
    res[44] = function()
        -- state_number
        hit_side_obj_char["velocity"] = {hit_side_obj_char[5]*(25),0}
        hit_side_obj_char["friction"] = 1
        -- animation end
    end
    return res
end
-- _5K
function load_game_scene_anim_char_TRM_5K(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hit_side]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    local function direction_input_mapping()
        if hit_side_obj_char["direction_input"] >= 7 then
            hit_side_obj_char["direction_input_cache"] = hit_side_obj_char["direction_input"]
            return
        end
    end
    res["prop_f"] = "f"
    res["anim_length"] = 36
    for i = 0,9 do
        res[i] = function()
            direction_input_mapping()
        end
    end
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "5K"
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "all" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        hit_side_obj_char["direction_input_cache"] = 9
        -- state_number
        hit_side_obj_char["friction"] = 7
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            42.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            42.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            42.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            42.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            18.25,5,1.035,
            -22.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            27.5,5,1.00,
            -17.5,12.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            18.25,5,1.035,
            -5,2.5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver1
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 14
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{-20,-215,200,430},{-36,-455,100,50}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver0
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {145,-555,0.8,1,1,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver0
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {145,-555,0.4,1,1,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver0
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {150,-860,0.9,1.2,1.2,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["5K_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["5K_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["5K_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["5K_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-145,-440}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {235,510}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.25,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
        -- update
        direction_input_mapping()
    end
    res[2] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-24,-220,200,440},{-60,-460,100,40}}
        -- draw_correction
        hit_side_obj_char[8] = 1
        -- update
        direction_input_mapping()
    end
    res[4] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-28,-325,200,250},{-50,-100,154,200}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-170,-400}
        -- draw_correction
        hit_side_obj_char[8] = 2
        -- update
        direction_input_mapping()
    end
    res[5] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true 
        -- collide
        hit_side_obj_char["hitbox_table"] = {{187,-300,320,100},{87,-210,120,80}}
        hit_side_obj_char["hurtbox_table"] = {{-28,-325,200,250},{-50,-100,154,200},{187,-300,360,140},{87,-210,160,120}}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
        -- update
        direction_input_mapping()
    end
    res[8] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{-28,-325,200,250},{-50,-100,154,200},{117,-300,180,100},{67,-210,80,80}}
        -- update
        direction_input_mapping()
    end
    res[11] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-28,-325,200,250},{-50,-100,154,200}}
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[14] = function()
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[15] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[18] = function()
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hit_side_obj_char,
            -550,
            -160,
            0.5,0.8,0.8,0
        )
    end
    res[20] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{-5,-225,180,450}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-140,-425}
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[23] = function()
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[26] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[31] = function()
        -- draw_correction
        hit_side_obj_char[8] = 9
    end
    res[36] = function()
        -- animation end
    end
    return res
end
-- _2S
function load_game_scene_anim_char_TRM_2S(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 56
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "2S"
        hit_side_obj_char["height"] = "crouch" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "all" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 10
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_low",
            "stand","5_stand_idle",
            72.5,5,1.00,
            0,2.5,1.035,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_mid",
            "stand","5_stand_idle",
            72.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            72.5,5,1.00,
            0,2.5,1.035,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            72.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            8.75,5,1.035,
            -27.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            22.5,5,1.00,
            -25,12.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            42.5,5,1.035,
            -12.5,2.5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver2
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 16
        -- collide
        hit_side_obj_char["pushbox"] = {0,-142.5,120,285}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-150,200,300}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {305,-325,0.9,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {305,-325,0.45,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {305,-325,1,0.75,0.75,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["2S_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["2S_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["2S_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["2S_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-50,-345}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {292,405}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.42,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[3] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[5] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{10,-150,220,300}}
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[8] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{20,-150,240,300}}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hit_side_obj_char,
            760,
            -160,
            0.5,-0.8,0.8,0
        )
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hit_side_obj_char,
            -550,
            -160,
            0.5,0.8,0.8,0
        )
    end
    res[10] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true 
        -- collide
        hit_side_obj_char["hitbox_table"] = {{180,-100,130,200},{325,-75,420,150}}
        hit_side_obj_char["hurtbox_table"] = {{20,-150,240,300},{180,-110,170,220},{240,-85,280,170}}
        -- draw_correction
        hit_side_obj_char[8] = 4
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_2S_move(hit_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[12] = function()
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[13] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
    end
    res[16] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{20,-150,240,300},{180,-110,170,220},{225,-85,185,170}}
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[19] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{20,-150,240,300},{180,-110,170,220}}
    end
    res[22] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{20,-150,240,300},{165,-110,140,220}}
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[25] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{20,-150,240,300},{145,-110,100,220}}
    end
    res[26] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[28] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{10,-150,220,300}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-80,-355}
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[31] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
    end
    res[32] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{10,-150,200,300}}
        -- draw_correction
        hit_side_obj_char[8] = 9
    end
    res[39] = function()
        -- draw_correction
        hit_side_obj_char[8] = 10
    end
    res[46] = function()
        -- draw_correction
        hit_side_obj_char[8] = 11
    end
    res[52] = function()
        -- draw_correction
        hit_side_obj_char[8] = 12
    end
    res[56] = function()
        -- animation_end
    end
    return res
end
-- _6S
function load_game_scene_anim_char_TRM_6S(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_velocity_cache = hit_side_obj_char["velocity"][1]*hit_side_obj_char[5]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 59
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "6S"
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "all" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        if hit_side_velocity_cache < 0 then
            hit_side_velocity_cache = 0
        end
        hit_side_obj_char["velocity"] = {(hit_side_velocity_cache+21.5)*hit_side_obj_char[5],0}
        hit_side_obj_char["friction"] = 50
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32.5,5,1.00,
            -27.5,2.5,1.035,
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
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv3(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            32.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32.5,5,1.00,
            -27.5,2.5,1.035,
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
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv3(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            32.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32.5,5,1.035,
            -17.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            32.5,5,1.00,
            -17.5,12.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32.5,5,1.035,
            -5,2.5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver2
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 17
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-210,180,420}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {130,-690,0.9,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {130,-690,0.45,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {130,-690,1,0.75,0.75,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["6S_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["6S_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["6S_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["6S_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-430}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {375,510}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.42,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hit_side_obj_char,
            -420,
            -160,
            0.5,0.8,0.8,0
        )
        insert_VFX_game_scene_char_TRM_6S_move(hit_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_move_SFX_table["common_oroboros"])
    end
    res[2] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-200,190,400}}
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[5] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,190,430},{125,-215,60,280}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-90,-420}
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[11] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true 
        -- collide
        hit_side_obj_char["hitbox_table"] = {{200,-450,350,100}}
        hit_side_obj_char["hurtbox_table"] = {{0,-190,270,380},{-65,-400,60,40},{200,-260,130,200},{150,-385,370,160}}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[15] = function()
        -- state_number
        hit_side_obj_char["friction"] = 5
        -- collide
        hit_side_obj_char["hitbox_table"] = {{300,-350,330,150}}
        hit_side_obj_char["hurtbox_table"] = {{0,-190,270,380},{80,-395,60,30},{210,-135,150,270},{300,-350,380,190}}
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {175,-500,0.9,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {175,-500,0.45,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {175,-500,1,0.75,0.75,0,false,false}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-100,-355}
        -- draw_correction
        hit_side_obj_char[8] = 4
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hit_side_obj_char,
            760,
            -160,
            0.5,-0.8,0.8,0
        )
    end
    res[19] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-190,270,380},{200,-135,130,270},{245,-325,320,200}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[24] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-190,270,380},{190,-140,110,280},{210,-330,220,160}}
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[29] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-190,270,380},{170,-160,70,320}}
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[36] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-190,240,380},{140,-170,40,340}}
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[37] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[42] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-200,190,400}}
        -- draw_correction
        hit_side_obj_char[8] = 9
    end
    res[47] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 10
    end
    res[51] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{35,-455,100,50}}
        -- draw_correction
        hit_side_obj_char[8] = 11
    end
    res[54] = function()
        -- draw_correction
        hit_side_obj_char[8] = 12
    end
    res[59] = function()
        -- animation_end
    end
    return res
end
-- _cS
function load_game_scene_anim_char_TRM_cS(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    local function direction_input_mapping()
        if hit_side_obj_char["direction_input"] >= 7 then
            hit_side_obj_char["direction_input_cache"] = hit_side_obj_char["direction_input"]
            return
        end
    end
    res["prop_f"] = "f"
    res["anim_length"] = 29
    for i = 0,13 do
        res[i] = function()
            direction_input_mapping()
        end
    end
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "cS"
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "all" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        hit_side_obj_char["direction_input_cache"] = 9
        -- state_number
        hit_side_obj_char["friction"] = 10
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv3(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            42.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv3(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            42.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv3(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            42.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv3(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            42.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            18.25,5,1.035,
            -22.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            22.5,5,1.00,
            -25,12.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            18.25,5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver2
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 16
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {10,-580,0.6,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {10,-580,0.3,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {10,-580,0.75,0.75,0.75,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["cS_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["cS_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["cS_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["cS_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {320,510}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.42,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
        -- update
        direction_input_mapping()
    end
    res[3] = function()
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-145,-455}
        -- draw_correction
        hit_side_obj_char[8] = 1
        -- update
        direction_input_mapping()
    end
    res[6] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true
        -- collide
        hit_side_obj_char["hitbox_table"] = {{185,-230,240,350}}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30},{185,-230,290,400}}
        -- draw_correction
        hit_side_obj_char[8] = 2
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_cS_move(hit_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
        -- update
        direction_input_mapping()
    end
    res[10] = function()
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- update
        direction_input_mapping()
    end
    res[12] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30},{172,-225,174,340}}
        -- update
        direction_input_mapping()
    end
    res[18] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[20] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30},{126,-222.5,82,280}}
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[22] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[26] = function()
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-120,-455}
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[29] = function()
        -- animation_end
    end
    return res
end
-- _fS
function load_game_scene_anim_char_TRM_fS(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_velocity_cache = hit_side_obj_char["velocity"][1]*hit_side_obj_char[5]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 40
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "fS"
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "all" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        if hit_side_velocity_cache < 0 then
            hit_side_velocity_cache = 0
        end
        hit_side_obj_char["velocity"] = {(hit_side_velocity_cache+55)*hit_side_obj_char[5],0}
        hit_side_obj_char["friction"] = 12
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            42.5,5,1.00,
            0,2.5,1.035,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            42.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            42.5,5,1.00,
            0,2.5,1.035,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            42.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            27.5,5,1.035,
            -15,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            32.5,5,1.00,
            -12.5,12.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            17.5,5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver2
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 16
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-200,220,400}}
        hit_side_obj_char["collision_ground_height_offset"] = 0 
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {-40,-600,0.6,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {-40,-600,0.3,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {-40,-600,0.75,0.75,0.75,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["fS_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["fS_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["fS_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["fS_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-20,-375}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {320,510}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.42,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[2] = function()
        -- state_number
        hit_side_obj_char["friction"] = 4
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-50,-190,250,380}}
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[5] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-65,-190,250,380}}
        -- draw_correction
        hit_side_obj_char[8] = 2
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hit_side_obj_char,
            -550,
            -160,
            0.5,0.8,0.8,0
        )
    end
    res[9] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true 
        -- collide
        hit_side_obj_char["hitbox_table"] = {{85,-325,280,120}}
        hit_side_obj_char["hurtbox_table"] = {{-80,-200,250,400},{20,-230,150,160},{20,-325,300,160}}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[12] = function()
        -- collide
        hit_side_obj_char["hitbox_table"] = {{160,-325,280,120}}
        hit_side_obj_char["hurtbox_table"] = {{-80,-200,250,400},{95,-230,150,160},{85,-325,300,160}}
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {35,-600,0.6,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {35,-600,0.3,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {35,-600,0.75,0.75,0.75,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[16] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{-50,-200,250,400},{95,-230,150,160},{75,-325,300,160}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[21] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-40,-200,250,400},{80,-235,75,120},{60,-335,200,120}}
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[24] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-30,-200,230,400},{80,-235,75,120},{60,-335,200,120}}
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[27] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-30,-200,230,400}}
    end
    res[29] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-20,-200,210,400}}
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[32] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{-30,-455,100,50}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-100,-405}
        -- draw_correction
        hit_side_obj_char[8] = 9
    end
    res[36] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-20,-215,170,430},{-30,-455,100,50}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-105,-445}
        -- draw_correction
        hit_side_obj_char[8] = 10
    end
    res[37] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
    end
    res[40] = function()
        -- animation_end
    end
    return res
end
-- _5H
function load_game_scene_anim_char_TRM_5H(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local move_SFX_table = common_game_scene_get_SFX_move(side)
    res["prop_f"] = "f"
    res["anim_length"] = 60
    res[0] = function()
        -- state
        obj_char["sprite_sheet"] = "5H"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        -- state_number
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {200,515}
    end
    res[3] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[7] = function()
        -- draw_correction
        obj_char[8] = 2
    end
    res[11] = function()
        -- play_SFX
        play_obj_audio(move_SFX_table["5H_knife_clip_0"])
        -- draw_correction
        obj_char[8] = 3
    end
    res[16] = function()
        -- play_SFX
        play_obj_audio(move_SFX_table["5H_knife_clip_1"])
        -- draw_correction
        obj_char[8] = 4
    end
    res[22] = function()
        -- draw_correction
        obj_char[8] = 5
    end
    res[28] = function()
        -- play_SFX
        play_obj_audio(move_SFX_table["5H_knife_clip_2"])
        -- draw_correction
        obj_char[8] = 6
    end
    res[35] = function()
        -- play_SFX
        play_obj_audio(move_SFX_table["5H_knife_whiff"])
        -- draw_correction
        obj_char[8] = 7
    end
    res[41] = function()
        -- draw_correction
        obj_char[8] = 8
    end
    res[50] = function()
        -- draw_correction
        obj_char[8] = 9
    end
    res[60] = function()
        -- animation_end
    end
    return res
end
-- shot_sys
function load_game_scene_anim_char_TRM_5H_shot_sys_at_the_ready_ease_in(obj_char)
    local res = {}
    res["prop_f"] = "shot_sys_f"
    res["anim_length"] = 13
    res[0] = function()
        -- shot_sys
        obj_char["shot_sys_fire_cancel"] = false
        obj_char["shot_sys_idle_cancel"] = true
        --VFX
        insert_VFX_game_scene_char_TRM_5H_move_at_the_ready_switch(obj_char)
    end
    res[12] = function()
        -- -- input_sys_cache
        -- obj_char["input_sys_state_negative_edge"] = "load" -- none save load
        -- common_game_scene_get_input_sys_cache_negative_edge_state_machine(obj_char["player_side"])()
        -- -- shot_sys
        obj_char["shot_sys_fire_cancel"] = true
    end
    res[13] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_shot_sys_at_the_ready_shot(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local obj_camera = obj_stage_game_scene_camera
    local obj_stage_main = obj_stage_game_scene_main
    res["prop_f"] = "shot_sys_f"
    res["anim_length"] = 18
    for i = 13,17 do
        res[i] = function()
            character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(hit_side_obj_char,hurt_side_obj_char)
        end
    end
    res[0] = function()
        -- shot_sys
        hit_side_obj_char["shot_sys_fire_cancel"] = false
        hit_side_obj_char["shot_sys_idle_cancel"] = false
        character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(hit_side_obj_char,hurt_side_obj_char)
        -- camera_animation_application
        table.insert(obj_stage_main["camera_active_application_table"],
            function()
                -- cameara_animation_load
                common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char["shot_sys_camera_shake_table"],0.1,15)
                anim_stage_point_linear_game_scene_camera_shake_x = hit_side_obj_char["shot_sys_camera_shake_table"]["camera_x_shake_anim"]
                anim_stage_point_linear_game_scene_camera_shake_y = hit_side_obj_char["shot_sys_camera_shake_table"]["camera_y_shake_anim"]
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y)
                obj_camera["state"] = "active"
            end
        )
    end
    res[1] = function()
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(hit_side_obj_char,hurt_side_obj_char)
        -- insert_projectile
        insert_projectile_game_scene_char_TRM_5H_at_the_ready_shot(hit_side_obj_char,hurt_side_obj_char)
    end
    res[3] = function()
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
    end
    res[6] = function()
        -- shot_sys
        if hit_side_obj_char["shot_sys_aim_process"][1] < hit_side_obj_char["shot_sys_aim_process"][3] then
            character_function_game_scene_TRM_shot_sys_init_new_reticle_pos(hit_side_obj_char,hurt_side_obj_char)
        end
    end
    res[13] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state_negative_edge"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_negative_edge_state_machine(hit_side_obj_char["player_side"])()
        -- shot_sys
        hit_side_obj_char["shot_sys_idle_cancel"] = true
        hit_side_obj_char["shot_sys_fire_cancel"] = true
        character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(hit_side_obj_char,hurt_side_obj_char)
    end
    res[18] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_shot_sys_at_the_ready_ease_out(obj_char)
    local res = {}
    res["prop_f"] = "shot_sys_f"
    res["anim_length"] = 1
    res[0] = function()
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_5H_move_at_the_ready_switch(obj_char)
    end
    res[1] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_shot_sys_steady_aim_ease_in(obj_char)
    local res = {}
    res["prop_f"] = "shot_sys_f"
    res["anim_length"] = 1
    res[0] = function()
    end
    res[1] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_shot_sys_steady_aim_shot(obj_char)
    local res = {}
    local obj_camera = obj_stage_game_scene_camera
    res["prop_f"] = "shot_sys_f"
    res["anim_length"] = 1
    res[0] = function()
    end
    res[1] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_shot_sys_steady_aim_ease_out(obj_char)
    local res = {}
    res["prop_f"] = "shot_sys_f"
    res["anim_length"] = 1
    res[0] = function()
    end
    res[1] = function()
        -- animation_end
    end
    return res
end
-- shot_sys_reticle
    -- ease_in
    -- at_the_ready_aim_locking
    -- at_the_ready_aim_locked
    -- at_the_ready_aim_unlocking
    -- staedy_aim
    -- shot
    -- ease_out
function load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_ease_in(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local move_SFX_table = common_game_scene_get_SFX_move(side)
    res["prop_f"] = "shot_sys_reticle_f_4"
    res["anim_length"] = 13
    res[0] = function()
        obj_char["shot_sys_reticle"][4] = 0.2
        obj_char["shot_sys_reticle"][8] = 0
        obj_char["shot_sys_reticle_sprite_sheet"] = "5H_reticle_unlocked"
        -- play_SFX
        play_obj_audio(move_SFX_table["5H_reticle_ease_in"])
    end
    res[1] = function()
        obj_char["shot_sys_reticle"][4] = 0.4
    end
    res[2] = function()
        obj_char["shot_sys_reticle"][4] = 0.6
    end
    res[3] = function()
        obj_char["shot_sys_reticle"][4] = 0.8
    end
    res[4] = function()
        obj_char["shot_sys_reticle"][4] = 1
    end
    res[13] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_locking_and_unlocking(obj_char,sprite_sheet)
    local res = {}
    local side = obj_char["player_side"]
    local move_SFX_table = common_game_scene_get_SFX_move(side)
    res["prop_f"] = "shot_sys_reticle_f_8"
    res["anim_length"] = 10
    res[0] = function()
        obj_char["shot_sys_reticle_sprite_sheet"] = sprite_sheet
        obj_char["shot_sys_reticle"][4] = 1
        obj_char["shot_sys_reticle"][8] = 0
        -- play_SFX
        if sprite_sheet == "5H_reticle_locking" then
            play_obj_audio(move_SFX_table["5H_reticle_locking"])
        end
    end
    res[1] = function()
        obj_char["shot_sys_reticle"][8] = 1
    end
    res[3] = function()
        obj_char["shot_sys_reticle"][8] = 2
    end
    res[5] = function()
        obj_char["shot_sys_reticle"][8] = 3
    end
    res[7] = function()
        obj_char["shot_sys_reticle"][8] = 4
    end
    res[10] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_locked(obj_char)
    local res = {}
    res["prop_f"] = "shot_sys_reticle_f_8"
    res["anim_length"] = 41
    for i = 0,19 do
        res[i*2] = function()
            obj_char["shot_sys_reticle"][8] = i
        end
    end
    res[0] = function()
        obj_char["shot_sys_reticle_sprite_sheet"] = "5H_reticle_locked"
        obj_char["shot_sys_reticle"][4] = 1
        obj_char["shot_sys_reticle"][8] = 0
    end
    res[40] = function()
        obj_char["shot_sys_reticle_f_8"] = 0
        obj_char["shot_sys_reticle"][8] = 0
    end
    res[41] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_ease_out(obj_char)
    local res = {}
    local side = obj_char["player_side"]
    local move_SFX_table = common_game_scene_get_SFX_move(side)
    res["prop_f"] = "shot_sys_reticle_f_8"
    res["anim_length"] = 8
    res[0] = function()
        obj_char["shot_sys_reticle_sprite_sheet"] = "5H_reticle_ease_out"
        obj_char["shot_sys_reticle"][4] = 1
        obj_char["shot_sys_reticle"][8] = 0
        -- play_SFX
        play_obj_audio(move_SFX_table["5H_reticle_ease_out"])
    end
    res[2] = function()
        obj_char["shot_sys_reticle"][8] = 1
    end
    res[4] = function()
        obj_char["shot_sys_reticle"][8] = 2
    end
    res[8] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_shot(obj_char)
    local res = {}
    res["prop_f"] = "shot_sys_reticle_f_8"
    res["anim_length"] = 8
    res[0] = function()
        obj_char["shot_sys_reticle_sprite_sheet"] = "5H_reticle_shot"
        obj_char["shot_sys_reticle"][4] = 1
        obj_char["shot_sys_reticle"][8] = 0
    end
    res[2] = function()
        obj_char["shot_sys_reticle"][8] = 1
    end
    res[4] = function()
        obj_char["shot_sys_reticle"][8] = 2
    end
    res[6] = function()
        obj_char["shot_sys_reticle"][8] = 3
    end
    res[8] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_reticle_steady_aim_ease_in(obj_char)
end
function load_game_scene_anim_char_TRM_5H_reticle_steady_aim_locking_and_unlocking(obj_char)
end
function load_game_scene_anim_char_TRM_5H_reticle_steady_aim_unlocking(obj_char)
end
function load_game_scene_anim_char_TRM_5H_reticle_steady_aim_ease_out(obj_char)
end
function load_game_scene_anim_char_TRM_5H_reticle_steady_aim_shot(obj_char)
end
-- shot_sys_oroboros
function load_game_scene_anim_char_TRM_5H_oroboros_chain_ease_in(obj)
    local res = {}
    res["prop_f"] = "f_4"
    res["anim_length"] = 20
    res[0] = function()
        -- oroboros
        obj[4] = 0
    end
    res[3] = function()
        -- oroboros
        obj[4] = 0.56
    end
    res[7] = function()
        -- oroboros
        obj[4] = 0.80
    end
    res[11] = function()
        -- oroboros
        obj[4] = 0.92
    end
    res[15] = function()
        -- oroboros
        obj[4] = 0.98
    end
    res[20] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_oroboros_chain_ease_out(obj)
    local res = {}
    res["prop_f"] = "f_4"
    res["anim_length"] = 20
    for i = 0,10 do
        res[i] = function()
            -- oroboros
            obj[4] = 1-0.8*((i+1)/10)
        end
    end
    for i = 11,20 do
        res[i] = function()
            -- oroboros
            obj[4] = 0.12-0.12*((i-10)/10)
        end
    end
    res[0] = function()
        -- oroboros
        obj[4] = 0.92
    end
    res[10] = function()
        -- oroboros
        obj[4] = 0.12
    end
    res[20] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_oroboros_chain_loop(obj,sprite_sheet)
    local res = {}
    res["prop_f"] = "f_8"
    res["anim_length"] = 91
    res[0] = function()
        -- oroboros
        obj["sprite_sheet"] = sprite_sheet
        obj[4] = 1
        obj[8] = 0
    end
    for i = 1,14 do
        res[i*6] = function()
            -- oroboros
            obj[8] = i
        end
    end
    res[90] = function()
        -- oroboros
        obj["f_8"] = 0
        obj[8] = 0
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_oroboros_mid_ease(obj,sprite_sheet)
    local res = {}
    res["prop_f"] = "f_8"
    res["anim_length"] = 20
    res[0] = function()
        -- oroboros
        obj[4] = 1
        obj[8] = 1
        obj["sprite_sheet"]  = sprite_sheet
    end
    res[3] = function()
        -- oroboros
        obj[8] = 1
    end
    res[7] = function()
        -- oroboros
        obj[8] = 2
    end
    res[11] = function()
        -- oroboros
        obj[8] = 3
    end
    res[15] = function()
        -- oroboros
        obj[8] = 4
    end
    res[20] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_oroboros_mid_loop(obj)
    local res = {}
    res["prop_f"] = "f_8"
    res["anim_length"] = 91
    res[0] = function()
        -- oroboros
        obj["sprite_sheet"]  = "5H_oroboros_loop_mid"
        obj[8] = 0
    end
    res[6] = function()
        -- oroboros
        obj[8] = 1
    end
    res[12] = function()
        -- oroboros
        obj[8] = 2
    end
    res[18] = function()
        -- oroboros
        obj[8] = 3
    end
    res[24] = function()
        -- oroboros
        obj[8] = 4
    end
    res[30] = function()
        -- oroboros
        obj[8] = 5
    end
    res[36] = function()
        -- oroboros
        obj[8] = 6
    end
    res[42] = function()
        -- oroboros
        obj[8] = 7
    end
    res[48] = function()
        -- oroboros
        obj[8] = 8
    end
    res[54] = function()
        -- oroboros
        obj[8] = 9
    end
    res[60] = function()
        -- oroboros
        obj[8] = 10
    end
    res[66] = function()
        -- oroboros
        obj[8] = 11
    end
    res[72] = function()
        -- oroboros
        obj[8] = 12
    end
    res[78] = function()
        -- oroboros
        obj[8] = 13
    end
    res[84] = function()
        -- oroboros
        obj[8] = 14
    end
    res[90] = function()
        -- oroboros
        obj["f_8"] = 0
        obj[8] = 0
    end
    res[91] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_5H_oroboros_shot(obj_char)
    local res = {}
    local obj_camera = obj_stage_game_scene_camera
    local oroboros_pos = {obj_char["shot_sys_oroboros_ease_current"][1],obj_char["shot_sys_oroboros_ease_current"][2]}
    local reticle_pos = {obj_char["shot_sys_reticle_stage_pos_current"][1]+160,obj_char["shot_sys_reticle_stage_pos_current"][2]+160}
    local center_r = obj_char[5]*character_function_game_scene_TRM_shot_sys_at_the_ready_aim_r_calculation(obj_char,oroboros_pos,reticle_pos)
    local side = obj_char["player_side"]
    local move_SFX_table = common_game_scene_get_SFX_move(side)
    local function update_oroboros_r(obj_char,i)
        obj_char["shot_sys_oroboros_aim_r"] = center_r*(27-i)/17 + 0.42*(1-(27-i)/17)
    end
    res["prop_f"] = "shot_sys_oroboros_f"
    res["anim_length"] = 28
    res[0] = function()
        -- oroboros
        obj_char["shot_sys_oroboros_aim_r"] = center_r
        obj_char["shot_sys_oroboros_offset_amount"] = 75
        obj_char["shot_sys_oroboros_mid"]["sprite_sheet"]  = "5H_oroboros_shot"
        obj_char["shot_sys_oroboros_mid"][8] = 0
        -- play_SFX
        play_obj_audio(move_SFX_table["5H_oroboros_blast"])
    end
    res[1] = function()
        -- oroboros
        update_oroboros_r(obj_char,10)
        obj_char["shot_sys_oroboros_mid"][8] = 1
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_5H_move_at_the_ready_shot_oroboros_blast(obj_char)
    end
    res[3] = function()
        -- oroboros
        update_oroboros_r(obj_char,10)
        obj_char["shot_sys_oroboros_mid"][8] = 2
    end
    res[10] = function()
        -- oroboros
        update_oroboros_r(obj_char,10)
        obj_char["shot_sys_oroboros_offset_amount"] = 75*(17-0)/17
        obj_char["shot_sys_oroboros_mid"][8] = 3
    end
    res[15] = function()
        -- oroboros
        update_oroboros_r(obj_char,15)
        obj_char["shot_sys_oroboros_offset_amount"] = 75*(17-5)/17
        obj_char["shot_sys_oroboros_mid"][8] = 4
    end
    res[17] = function()
        -- oroboros
        if obj_char[5] ~= obj_char["basic_prop_cache"][5] then
            update_oroboros_r(obj_char,17)
        end
        obj_char["shot_sys_idle_cancel"] = true
    end
    res[19] = function()
        -- oroboros
        update_oroboros_r(obj_char,19)
        obj_char["shot_sys_oroboros_offset_amount"] = 75*(17-9)/17
        obj_char["shot_sys_oroboros_mid"][8] = 5
    end
    res[23] = function()
        -- oroboros
        update_oroboros_r(obj_char,23)
        obj_char["shot_sys_oroboros_offset_amount"] = 75*(17-13)/17
        obj_char["shot_sys_oroboros_mid"][8] = 6
    end
    res[27] = function()
        -- oroboros
        obj_char["shot_sys_oroboros_aim_r"] = 0.42
        obj_char["shot_sys_oroboros_offset_amount"] = 0
    end
    res[28] = function()
        -- animation_end
    end
    return res
end
-- _2Launcher
function load_game_scene_anim_char_TRM_2Launcher(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 50
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "2Launcher"
        hit_side_obj_char["height"] = "crouch" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "low" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 7
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_low(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_low",
            "air","knockdown",
            12,5,1.00,
            -22.5,2.5,1.035,
            load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_down(
                hit_side_obj_char,hurt_side_obj_char,
                "0_general_hurt_hard_knockdown_down",
                "air",
                "knockdown_recovery",
                -12,5,1.00,
                -10,2.5,1.00,
                nil,nil,nil,nil,function() end
            ),
            load_game_scene_anim_char_common_0_general_hurt_hard_recovery_down(
                hit_side_obj_char,hurt_side_obj_char,
                "0_general_hurt_hard_recovery_down",
                "OTG",
                "5_stand_idle",
                nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
            ),
            nil,nil,
            function() 
                hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-200)
            end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_mid",
            "stand","5_stand_idle",
            32.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_low(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_low",
            "air","knockdown",
            12,5,1.00,
            -22.5,2.5,1.035,
            load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_down(
                hit_side_obj_char,hurt_side_obj_char,
                "0_general_hurt_hard_knockdown_down",
                "air",
                "knockdown_recovery",
                -12,5,1.00,
                -10,2.5,1.00,
                nil,nil,nil,nil,function() end
            ),
            load_game_scene_anim_char_common_0_general_hurt_hard_recovery_down(
                hit_side_obj_char,hurt_side_obj_char,
                "0_general_hurt_hard_recovery_down",
                "OTG",
                "5_stand_idle",
                nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
            ),
            nil,nil,
            function() 
                hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-200)
            end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            32.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_low(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_low",
            "air","knockdown_recovery",
            8,5,1.035,
            -27.5,2.5,1.035,
            nil,
            load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
                hit_side_obj_char,hurt_side_obj_char,
                "0_general_hurt_soft_recovery_ground",
                "OTG",
                "5_stand_idle",
                nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
            ),
            nil,nil,
            function() 
                hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-200)
            end
        )
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            22.5,5,1.00,
            -25,12.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            42,5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver3
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 15
        -- collide
        hit_side_obj_char["pushbox"] = {0,-142.5,120,285}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-150,200,300}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {100,-350,0.6,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {100,-350,0.3,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {100,-350,0.75,0.75,0.75,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["2Launcher_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["2Launcher_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["2Launcher_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["2Launcher_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hit_side_obj_char,
            640,
            -160,
            0.5,-0.8,0.8,0
        )
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-80,-355}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {330,310}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.25,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[4] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[5] = function()
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[9] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true
        -- collide
        hit_side_obj_char["hitbox_table"] = {{240,-65,320,130}}
        hit_side_obj_char["hurtbox_table"] = {{25,-150,250,300},{240,-72.5,350,145}}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[12] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{10,-150,220,300},{155,-110,70,220}}
    end
    res[14] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-150,200,300},{120,-115,40,230}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-120,-355}
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[16] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-150,200,300}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[19] = function()
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[23] = function()
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[26] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[27] = function()
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[30] = function()
        -- draw_correction
        hit_side_obj_char[8] = 9
    end
    res[31] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-150,200,300}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hit_side_obj_char[8] = 10
    end
    res[37] = function()
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-90,-355}
        -- draw_correction
        hit_side_obj_char[8] = 11
    end
    res[40] = function()
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-80,-355}
        -- draw_correction
        hit_side_obj_char[8] = 12
    end
    res[44] = function()
        -- draw_correction
        hit_side_obj_char[8] = 13
    end
    res[50] = function()
        -- animation_end
    end
    return res
end
-- _4_6Launcher
function load_game_scene_anim_char_TRM_4_6Launcher(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hit_side]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 42
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["default_throw_distance"] = 0
        hit_side_obj_char["sprite_sheet"] = "4_6Launcher"
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "throw" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "all" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 7
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["throw_success_animation"] = load_game_scene_anim_char_TRM_4_6Launcher_success(hit_side_obj_char,hurt_side_obj_char)
        hit_side_obj_char["throw_hurt_success_animation"] = load_game_scene_anim_char_TRM_4_6Launcher_success_hurt(hit_side_obj_char,hurt_side_obj_char)
        hit_side_obj_char["throw_hurt_PRC_animation"] = load_game_scene_anim_char_common_0_general_hurt_lanuched_throw_success_PRC(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            12,5,1.00,
            -18,1.5,1.00,
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
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["throw_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_throw_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_throw_hurt_function
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        if test_input_sys_press_or_hold(hit_side_input["left"]) then
            hit_side_obj_char["input_sys_cache"]["left"] = true
        elseif test_input_sys_press_or_hold(hit_side_input["right"]) then
            hit_side_obj_char["input_sys_cache"]["right"] = true
        end
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 0
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{-18,-455,100,50}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = nil
        hit_side_obj_char["hit_VFX_insert_function_argument"] = nil
        hit_side_obj_char["hit_block_VFX_insert_function"] = nil
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = nil
        hit_side_obj_char["hit_counter_VFX_insert_function"] = nil
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = nil
        hit_side_obj_char["hurt_block_VFX_insert_function"] = nil
        -- SFX
        hit_side_obj_char["hit_throw_SFX"] = hit_side_move_SFX_table["4_6Launcher_throw"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["4_6Launcher_whiff"]
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-150,-455}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {245,530}
        -- camera_animation_load
        load_game_scene_anim_char_TRM_4_6Launcher_camera_shake_anim(hit_side_obj_char,1.2)
        load_game_scene_anim_char_TRM_4_6Launcher_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[1] = function()
        -- state
        hit_side_obj_char["default_throw_distance"] = 240
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["throw_active"] = true 
        -- collide
        hit_side_obj_char["hitbox_table"] = {{75,-190,160,350}}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{-18,-455,100,50},{75,-190,180,370}}
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[4] = function()
        -- state
        hit_side_obj_char["default_throw_distance"] = 0
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["throw_active"] = false
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{-2,-455,100,50}}
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[12] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{22,-455,100,50}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 3
    end
    res[14] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{35,-455,100,50}}
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[19] = function()
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[35] = function()
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[37] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
    end
    res[40] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{16,-455,100,50}}
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[42] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_4_6Launcher_success_hurt(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local obj_camera = obj_stage_game_scene_camera
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local hurt_side_stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(hurt_side)
    local function update_y_37f_43f(i)
        hurt_side_obj_char["y"] = 2.5*(i-39)^2-180
    end
    local function update_y_44f_55f(i)
        hurt_side_obj_char["y"] = 1.5*(i-49)^2-34
    end
    local function update_y_56f_60f(i)
        hurt_side_obj_char["y"] = 3*(i-57)^2-27
    end
    res["prop_f"] = "f"
    res["anim_length"] = 90
    for i = 28,36 do
        res[i] = function()
            point_linear_animator(hurt_side_obj_char,hurt_side_obj_char["hurtstop_wiggle_x_animation"])
            point_linear_animator(hurt_side_obj_char,hurt_side_obj_char["hurtstop_wiggle_y_animation"])
            hurt_side_obj_char["hurtstop_wiggle_current_x"] = (hurt_side_obj_char["hurtstop_wiggle_x"]*(math.random()-0.5)*2)
            hurt_side_obj_char["hurtstop_wiggle_current_y"] = (hurt_side_obj_char["hurtstop_wiggle_y"]*(math.random()-0.5)*2)
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
        hurt_side_obj_char["y"] = 0
        hurt_side_obj_char["sprite_sheet"] = "0_stand_hurt_high"
        hurt_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        hurt_side_obj_char["velocity"] = {0,0}
        hurt_side_obj_char["gravity"] = 0
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
        hurt_side_obj_char["strike_inv"] = true
        hurt_side_obj_char["strike_inv_countdown"] = 27
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = true
        hurt_side_obj_char["projectile_inv_countdown"] = 27
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data["0_stand_hurt_high"][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = false
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = {}
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 0
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data["0_stand_hurt_high"]
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = "knockdown_recovery"
    end
    res[27] = function()
        -- state
        hurt_side_obj_char["x"] = hit_side_obj_char["x"] + hit_side_obj_char[5]*315
        collision_pushbox_stage_relocate_x(hurt_side_obj_char)
        hit_side_obj_char["x"] = hurt_side_obj_char["x"] + hurt_side_obj_char[5]*315
        hurt_side_obj_char["y"] = -160
        hurt_side_obj_char["sprite_sheet"] = "0_general_hurt_launched_high"
        hurt_side_obj_char["height"] = "air"
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data["0_general_hurt_launched_high"][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data["0_general_hurt_launched_high"][0]
        -- draw_correction
        hurt_side_obj_char[8] = 0
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data["0_general_hurt_launched_high"]
        -- character_shake
        hurt_side_obj_char["hurtstop_wiggle_x_animation"] = 
        common_game_scene_create_hurtstop_wiggle_animation(
            9,
            "hurtstop_wiggle_x",
            15
        )
        hurt_side_obj_char["hurtstop_wiggle_y_animation"] = 
        common_game_scene_create_hurtstop_wiggle_animation(
            9,
            "hurtstop_wiggle_y",
            7
        )
        init_point_linear_anim_with(hurt_side_obj_char,hurt_side_obj_char["hurtstop_wiggle_x_animation"])
        init_point_linear_anim_with(hurt_side_obj_char,hurt_side_obj_char["hurtstop_wiggle_y_animation"])
        hurt_side_obj_char["hurtstop_wiggle_current_x"] = (hurt_side_obj_char["hurtstop_wiggle_x"]*(math.random()-0.5)*2)
        hurt_side_obj_char["hurtstop_wiggle_current_y"] = (hurt_side_obj_char["hurtstop_wiggle_y"]*(math.random()-0.5)*2)
    end
    res[37] = function()
        -- state
        update_y_37f_43f(37)
        common_game_scene_char_apply_damage_heat(
            hit_side_obj_char,hurt_side_obj_char,"hurt",false
        )
        common_game_scene_char_apply_hurt_velocity(
            hit_side_obj_char,hurt_side_obj_char,false,
            10,
            1,
            1,
            0,
            0,
            1,
            false
        )
        hurt_side_obj_char["physics_lock"] = false
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data["0_general_hurt_launched_high"][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
        hurt_side_obj_char["hurtstop_wiggle_x"] = 0
        hurt_side_obj_char["hurtstop_wiggle_y"] = 0
        hurt_side_obj_char["hurtstop_wiggle_current_x"] = 0
        hurt_side_obj_char["hurtstop_wiggle_current_y"] = 0
    end
    res[40] = function()
        -- state
        update_y_37f_43f(40)
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data["0_general_hurt_launched_high"][3]
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[44] = function()
        -- state
        update_y_44f_55f(44)
        hurt_side_obj_char["sprite_sheet"] = "0_general_hurt_hard_knockdown_up"
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data["0_general_hurt_hard_knockdown_up"][0]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data["0_general_hurt_hard_knockdown_up"][0]
        -- draw_correction
        hurt_side_obj_char[8] = 0
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data["0_general_hurt_hard_knockdown_up"]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_land_blow(hurt_side_obj_char,-355,-160,1,1,1,0)
        -- play_SFX
        play_obj_audio(hurt_side_stage_interactive_SFX_table["ground_hard_knockdown"])
    end
    res[49] = function()
        -- state
        update_y_44f_55f(49)
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data["0_general_hurt_hard_knockdown_up"][2]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data["0_general_hurt_hard_knockdown_up"][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end
    res[53] = function()
        -- state
        update_y_44f_55f(53)
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end
    res[57] = function()
        -- state
        update_y_56f_60f(57)
        -- draw_correction
        hurt_side_obj_char[8] = 5
    end
    res[60] = function()
        -- state
        update_y_56f_60f(60)
        hurt_side_obj_char["height"] = "OTG"
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data["0_general_hurt_hard_knockdown_up"][6]
        -- draw_correction
        hurt_side_obj_char[8] = 6
    end
    res[65] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 7
    end
    res[90] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_4_6Launcher_success(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local obj_camera = obj_stage_game_scene_camera
    local obj_stage_main = obj_stage_game_scene_main
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hit_side]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 129
    res[0] = function()
        -- state
        -- throw_relocate_x
        local hit_side_dx = hit_side_obj_char[5]*200
        if test_input_sys_press_or_hold(hit_side_input["left"]) then
            hit_side_dx = -200
        elseif test_input_sys_press_or_hold(hit_side_input["right"]) then
            hit_side_dx = 200
        end
        hurt_side_obj_char["x"] = hit_side_obj_char["x"] + hit_side_dx
        collision_pushbox_stage_relocate_x(hurt_side_obj_char)
        hit_side_obj_char["x"] = hurt_side_obj_char["x"] - hit_side_dx
        -- facing_currect
        if not common_game_scene_get_character_facing_currect(hit_side_obj_char,hurt_side_obj_char) then
            hit_side_obj_char[5] = -hit_side_obj_char[5]
        end
        hit_side_obj_char["default_throw_distance"] = 0
        hit_side_obj_char["sprite_sheet"] = "4_6Launcher_success"
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "throw" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "all" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        hit_side_obj_char["velocity"] = {0,0}
        hit_side_obj_char["friction"] = 1
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["throw_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = true
        hit_side_obj_char["strike_inv_countdown"] = res["anim_length"]
        hit_side_obj_char["throw_inv"] = true
        hit_side_obj_char["throw_inv_countdown"] = res["anim_length"]
        hit_side_obj_char["projectile_inv"] = true
        hit_side_obj_char["projectile_inv_countdown"] = res["anim_length"]
        hit_side_obj_char["hit_function"] = common_game_scene_throw_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_throw_hurt_function
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 0
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = false
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {250,-500,0.8,0.6,0.6,0.262,true,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = nil
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = nil
        hit_side_obj_char["hit_counter_VFX_insert_function"] = nil
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = nil
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {249,530}
        -- camera_animation_application
        obj_camera["3d_pos_z_target"] = (math.abs(hit_side_obj_char["x"]-hurt_side_obj_char["x"])-720)*(-170)/720-800
        obj_camera["3d_pos_z_target"] = math.min(obj_camera["3d_pos_z_target"],-800)
        obj_camera["3d_pos_z_target"] = math.max(obj_camera["3d_pos_z_target"],-970)
        obj_camera["3d_pos_x_target"] = (hit_side_obj_char["x"] + hurt_side_obj_char["x"])/2   -- 必须要保持两个pushbox宽度相同
        obj_camera["3d_pos_x_target"] = math.max(obj_camera["3d_pos_x_target"],-1350-(obj_camera["3d_pos_z_target"]+800)*1)
        obj_camera["3d_pos_x_target"] = math.min(obj_camera["3d_pos_x_target"],1350+(obj_camera["3d_pos_z_target"]+800)*1)
        obj_camera["3d_pos_y_target"] = math.min(hit_side_obj_char["y"],hurt_side_obj_char["y"])+75
        obj_camera["3d_pos_y_target"] = math.min(obj_camera["3d_pos_y_target"],-365)
        obj_camera["3d_pos_y_target"] = obj_camera["3d_pos_y_target"]+(800+obj_camera["3d_pos_z_target"])*0.5
        obj_camera["3d_pos_y_target"] = math.max(obj_camera["3d_pos_y_target"],-900)
        local x = math.max(math.min((hit_side_obj_char["x"]+hurt_side_obj_char["x"])/2,1550),-1550)
        hit_side_obj_char["enclose_position_offset"] = {
            x - obj_camera["3d_pos_x_target"],
            -295 - obj_camera["3d_pos_y_target"],
            120
        }
        table.insert(obj_stage_main["camera_active_application_table"],
            function()
                anim_stage_point_linear_game_scene_camera_enclosing = hit_side_obj_char["camera_enclosing_anim"]
                anim_stage_point_linear_game_scene_camera_shake_x = hit_side_obj_char["camera_x_shake_anim"]
                anim_stage_point_linear_game_scene_camera_shake_y = hit_side_obj_char["camera_y_shake_anim"]
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_enclosing)
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y)
                obj_camera["enclose_position_offset"] = hit_side_obj_char["enclose_position_offset"]
                obj_camera["state"] = "active"
            end
        )
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[7] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[13] = function()
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[22] = function()
        -- draw_correction
        hit_side_obj_char[8] = 3
    end
    res[26] = function()
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[27] = function()
        -- state
        hit_side_obj_char["hit_cancel"] = true
        -- insert_VFX
        hit_side_obj_char["hit_VFX_insert_function"](hit_side_obj_char,hurt_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_move_SFX_table["4_6Launcher_hit"])
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[37] = function()
        -- state
        hit_side_obj_char["physics_lock"] = false
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
    end
    res[45] = function()
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[55] = function()
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[60] = function()
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[67] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- draw_correction
        hit_side_obj_char[8] = 9
    end
    res[72] = function()
        -- draw_correction
        hit_side_obj_char[8] = 10
    end
    res[74] = function()
        -- draw_correction
        hit_side_obj_char[8] = 11
    end
    res[77] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430}}
    end
    res[81] = function()
        -- draw_correction
        hit_side_obj_char[8] = 12
    end
    res[84] = function()
        -- draw_correction
        hit_side_obj_char[8] = 13
    end
    res[120] = function()
        -- draw_correction
        hit_side_obj_char[8] = 14
    end
    res[125] = function()
        -- draw_correction
        hit_side_obj_char[8] = 15
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
function load_game_scene_anim_char_TRM_5Launcher(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 65
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "5Launcher"
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "mid" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 4
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_semi_launched_mid(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_semi_launched_mid",
            "air",
            "5_stand_idle",
            5,7,1.00,
            0,2,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            5,7,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_semi_launched_mid(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_semi_launched_mid",
            "air",
            "5_stand_idle",
            5,7,1.00,
            0,2,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            5,7,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            5,7,1.035,
            -35,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            10,5,1.00,
            10,7.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            32,5,1.00,
            0,2.5,1.00,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver2
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 15
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{-25,-455,100,50}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {-20,-690,0.6,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {-20,-690,0.3,0.75,0.75,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {-20,-690,0.75,0.75,0.75,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["5Launcher_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["5Launcher_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["5Launcher_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["5Launcher_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-170,-425}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {415,635}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.42,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[1] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[3] = function()
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_5Launcher_move_glow(hit_side_obj_char)
    end
    res[5] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{-10,-215,190,430},{-40,-455,100,50}}
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[15] = function()
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_horizontal_shot(
            hit_side_obj_char,
            500,
            -160,
            0.5,-0.8,0.8,0
        )
    end
    res[17] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-237.5,210,475}}
        -- draw_correction
        hit_side_obj_char[8] = 3
    end
    res[19] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true
        -- collide
        hit_side_obj_char["hitbox_table"] = {{140,-285,180,450}}
        hit_side_obj_char["hurtbox_table"] = {{0,-237.5,210,475},{140,-285,230,500}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-150,-385}
        -- draw_correction
        hit_side_obj_char[8] = 4
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_5Launcher_move_slash(hit_side_obj_char)
    end
    res[20] = function()
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[22] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-237.5,210,475}}
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[26] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-237.5,210,475}}
    end
    res[28] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-237.5,210,475}}
    end
    res[30] = function()
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[40] = function()
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[43] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[45] = function()
        -- draw_correction
        hit_side_obj_char[8] = 9
    end
    res[48] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
    end
    res[51] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{-25,-455,100,50}}
        -- draw_correction
        hit_side_obj_char[8] = 10
    end
    res[56] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{-25,-455,100,50}}
        -- draw_correction
        hit_side_obj_char[8] = 11
    end
    res[59] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{-12,-455,100,50}}
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 12
    end
    res[65] = function()
        -- animation_end
    end
    return res
end
-- _j5P
function load_game_scene_anim_char_TRM_j5P(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 24
    res[0] = function()
        -- state
        hit_side_obj_char["sprite_sheet"] = "j5P"
        hit_side_obj_char["height"] = "air" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "mid" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 4
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv0(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            7.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv0(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            7.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv0(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            7.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv0(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            7.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            10,5,1.035,
            -12.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            10,5,1.00,
            5,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            10,5,1.035,
            -5,2.5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver0
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 13
        -- collide
        hit_side_obj_char["pushbox"] = {0,-100,120,200}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-130,270,280}}
        hit_side_obj_char["collision_ground_height_offset"] = 185
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver0
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {-70,-325,0.8,1,1,0,true,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver0
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {-70,-325,0.4,1,1,0,true,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver0
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {-100,-710,1,1.35,1.35,0,true,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver0
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["j5P_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["j5P_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["j5P_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["j5P_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-260}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {310,290}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.25,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[2] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[3] = function()
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[4] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true 
        -- collide
        hit_side_obj_char["hitbox_table"] = {{160,-60,120,120}}
        hit_side_obj_char["hurtbox_table"] = {{0,-135,230,290},{160,-60,150,150}}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[6] = function()
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[8] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-135,260,290}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[12] = function()
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[16] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-130,270,280}}
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[19] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[20] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-125,260,270}}
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[24] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- animation end
    end
    return res
end
-- _j2K
function load_game_scene_anim_char_TRM_j2K(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 30
    res[0] = function()
        -- state
        hit_side_obj_char["sprite_sheet"] = "j2K"
        hit_side_obj_char["height"] = "air" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "mid" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 4
        hit_side_obj_char["gravity"] = 2.575
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        -- hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_TRM_j2K_hurt(hit_side_obj_char)
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            15,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            15,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            15,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            15,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            0,5,1.035,
            7.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            5,5,1.00,
            5,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            27.5,5,1.035,
            -5,2.5,1.035,
            nil,
            load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
                hit_side_obj_char,hurt_side_obj_char,
                "0_general_hurt_soft_recovery_ground",
                "OTG",
                "5_stand_idle",
                nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
            ),
            nil,nil,
            function()
                hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-200)
            end
        )
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = character_function_game_scene_TRM_j2K_strike_hit_function
        hit_side_obj_char["hurt_function"] = character_function_game_scene_TRM_j2K_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver2
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 15
        -- collide
        hit_side_obj_char["pushbox"] = {0,-100,120,200}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-150,235,320}}
        hit_side_obj_char["collision_ground_height_offset"] = 185
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {245,-120,0.6,0.75,0.75,1.571,true,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {245,-120,0.4,0.75,0.75,1.571,true,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {245,-120,0.9,0.75,0.75,1.571,true,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["j2K_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["j2K_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["j2K_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["j2K_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-260}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {240,480}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.42,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[4] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[9] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true
        -- collide
        hit_side_obj_char["hitbox_table"] = {{0,65,150,190}}
        hit_side_obj_char["hurtbox_table"] = {{0,-165,210,350},{0,65,210,250}}
        -- draw_correction
        hit_side_obj_char[8] = 2
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[11] = function()
        -- draw_correction
        hit_side_obj_char[8] = 3
    end
    res[14] = function()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-165,210,350},{0,65,180,200}}
    end
    res[15] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
    end
    res[16] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[19] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-165,210,350}}
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[21] = function()
        -- idle_cancel
        if hit_side_obj_char["hit_cancel"] then
            -- state
            hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
            hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
            hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
            hit_side_obj_char["move_state"] = "none" -- none startup active recovery
            hit_side_obj_char["hit_cancel"] = false
            hit_side_obj_char["idle_cancel"] = true
            -- state_number
            hit_side_obj_char["gravity"] = 2.5
            -- enemy_friend_interaction
            hit_side_obj_char["horizontal_velocity_correction"] = 1
            hit_side_obj_char["gravity_correction"] = 1
            hit_side_obj_char["damage_correction"] = 1
            -- input_sys_cache
            hit_side_obj_char["input_sys_state"] = "load" -- none save load
            common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        end
    end
    res[25] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-155,230,330}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[30] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- animation end
    end
    return res
end
-- _j5K
function load_game_scene_anim_char_TRM_j5K(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 27
    res[0] = function()
        -- state
        hit_side_obj_char["sprite_sheet"] = "j5K"
        hit_side_obj_char["height"] = "air" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "mid" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 4
        hit_side_obj_char["gravity"] = 2.575
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv1(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            10,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv1(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            10,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv1(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            10,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv1(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            10,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            7.5,5,1.035,
            -12.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            7.5,5,1.00,
            5,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            12.5,5,1.035,
            -5,2.5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver1
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 14
        -- collide
        hit_side_obj_char["pushbox"] = {0,-100,120,200}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-150,235,320}}
        hit_side_obj_char["collision_ground_height_offset"] = 185
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver0
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {135,-440,0.8,1,1,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver0
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {135,-440,0.4,1,1,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver0
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {80,-895,0.85,1.5,1.5,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["j5K_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["j5K_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["j5K_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["j5K_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-260}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {330,370}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.25,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[2] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[6] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true
        -- collide
        hit_side_obj_char["hitbox_table"] = {{242.5,-215,310,100},{100,-165,160,70}}
        hit_side_obj_char["hurtbox_table"] = {{0,-150,235,320},{-18,-335,180,50},{242.5,-215,350,140},{100,-165,200,110}}
        -- draw_correction
        hit_side_obj_char[8] = 2
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[9] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-150,235,320},{-18,-335,180,50},{187.5,-215,140,120},{132.5,-140,30,30}}
        -- draw_correction
        hit_side_obj_char[8] = 3
    end
    res[12] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-150,235,320},{-18,-335,180,50},{157.5,-210,80,90}}
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[16] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-150,235,320}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[20] = function()
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[22] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[24] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-125,260,270}}
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[27] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- animation end
    end
    return res
end
-- _j5S
function load_game_scene_anim_char_TRM_j5S(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 50
    res[0] = function()
        -- state
        hit_side_obj_char["sprite_sheet"] = "j5S"
        hit_side_obj_char["height"] = "air" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "mid" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 4
        hit_side_obj_char["gravity"] = 2.575
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            15,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            15,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            15,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            15,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            12.5,5,1.035,
            -17.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            12.5,5,1.00,
            5,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            25,5,1.035,
            -12.5,2.5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver2
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 18
        -- collide
        hit_side_obj_char["pushbox"] = {0,-100,120,200}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-140,260,300}}
        hit_side_obj_char["collision_ground_height_offset"] = 185
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {10,-315,0.6,1,1,0,false,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {10,-315,0.3,1,1,0,false,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {10,-315,0.75,1,1,0,false,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["j5S_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["j5S_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["j5S_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["j5S_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-260}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {350,330}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.42,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[2] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[4] = function()
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[6] = function()
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_j5S_move(hit_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_move_SFX_table["common_oroboros"])
    end
    res[9] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true
        -- collide
        hit_side_obj_char["hitbox_table"] = {{200,10,400,190},{275,-145,250,120},{200,-255,220,100}}
        hit_side_obj_char["hurtbox_table"] = {{0,-140,280,300},{170,-50,530,380},{200,-255,290,170}}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[13] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-140,260,300},{115,-80,360,240}}
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[19] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-140,260,300},{95,-80,280,220}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[25] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-140,260,300}}
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[30] = function()
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[31] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[35] = function()
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[36] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
    end
    res[40] = function()
        -- draw_correction
        hit_side_obj_char[8] = 9
    end
    res[45] = function()
        -- draw_correction
        hit_side_obj_char[8] = 10
    end
    res[50] = function()
        -- animation end
    end
    return res
end
-- _j4_6Launcher
function load_game_scene_anim_char_TRM_j4_6Launcher(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hit_side]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 42
    res[0] = function()
        -- state
        hit_side_obj_char["default_throw_distance"] = 0
        hit_side_obj_char["sprite_sheet"] = "j4_6Launcher"
        hit_side_obj_char["height"] = "air" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "throw" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "all" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 7
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["throw_success_animation"] = load_game_scene_anim_char_TRM_j4_6Launcher_success(hit_side_obj_char,hurt_side_obj_char)
        hit_side_obj_char["throw_hurt_success_animation"] = load_game_scene_anim_char_TRM_j4_6Launcher_success_hurt(hit_side_obj_char,hurt_side_obj_char)
        hit_side_obj_char["throw_hurt_PRC_animation"] = load_game_scene_anim_char_common_0_general_hurt_lanuched_throw_success_PRC(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            12,5,1.00,
            -18,1.5,1.00,
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
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["throw_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_throw_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_throw_hurt_function
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        if test_input_sys_press_or_hold(hit_side_input["left"]) then
            hit_side_obj_char["input_sys_cache"]["left"] = true
        elseif test_input_sys_press_or_hold(hit_side_input["right"]) then
            hit_side_obj_char["input_sys_cache"]["right"] = true
        end
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 0
        -- collide
        hit_side_obj_char["pushbox"] = {0,-100,120,200}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-140,250,300}}
        hit_side_obj_char["collision_ground_height_offset"] = 185
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = nil
        hit_side_obj_char["hit_VFX_insert_function_argument"] = nil
        hit_side_obj_char["hit_block_VFX_insert_function"] = nil
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = nil
        hit_side_obj_char["hit_counter_VFX_insert_function"] = nil
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = nil
        hit_side_obj_char["hurt_block_VFX_insert_function"] = nil
        -- SFX
        hit_side_obj_char["hit_throw_SFX"] = hit_side_move_SFX_table["j4_6Launcher_throw"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["j4_6Launcher_whiff"]
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-260}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {300,310}
        -- camera_animation_load
        load_game_scene_anim_char_TRM_j4_6Launcher_camera_shake_anim(hit_side_obj_char,1.2)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[1] = function()
        -- state
        hit_side_obj_char["default_throw_distance"] = 360
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["throw_active"] = true 
        -- collide
        hit_side_obj_char["hitbox_table"] = {{0,-160,560,80}}
        hit_side_obj_char["hurtbox_table"] = {{0,-140,250,300}}
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[4] = function()
        -- state
        hit_side_obj_char["default_throw_distance"] = 0
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["throw_active"] = false
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-140,250,300}}
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[7] = function()
        -- draw_correction
        hit_side_obj_char[8] = 3
    end
    res[11] = function()
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[18] = function()
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[33] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[38] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-140,250,300}}
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[42] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_j4_6Launcher_success_hurt(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local obj_camera = obj_stage_game_scene_camera
    local hurt_side = hurt_side_obj_char["player_side"]
    local hurt_side_pushbox_data = common_game_scene_get_pushbox(hurt_side)
    local hurt_side_hurtbox_data = common_game_scene_get_hurtbox(hurt_side)
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side)
    local hurt_side_VFX_spawn_anchor_data = common_game_scene_get_VFX_spawn_anchor(hurt_side)
    local hurt_side_stage_interactive_SFX_table = common_game_scene_get_SFX_stage_interactive(hurt_side)
    local function update_13f_18f()
        point_linear_animator(hurt_side_obj_char,hurt_side_obj_char["hurtstop_wiggle_x_animation"])
        point_linear_animator(hurt_side_obj_char,hurt_side_obj_char["hurtstop_wiggle_y_animation"])
        hurt_side_obj_char["hurtstop_wiggle_current_x"] = (hurt_side_obj_char["hurtstop_wiggle_x"]*(math.random()-0.5)*2)
        hurt_side_obj_char["hurtstop_wiggle_current_y"] = (hurt_side_obj_char["hurtstop_wiggle_y"]*(math.random()-0.5)*2)
    end
    local function update_y_29f_45f(i)
        hurt_side_obj_char["y"] = 1*(i-37)^2-64
    end
    local function update_y_46f_53f(i)
        hurt_side_obj_char["y"] = 2*(i-49)^2-32
    end
    res["prop_f"] = "f"
    res["anim_length"] = 84
    for i = 13,18 do
        res[i] = function()
            update_13f_18f()
        end
    end
    for i = 29,45 do
        res[i] = function()
            update_y_29f_45f(i)
        end
    end
    for i = 46,53 do
        res[i] = function()
            update_y_46f_53f(i)
        end
    end
    res[0] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = "0_general_hurt_launched_high"
        hurt_side_obj_char["height"] = "air" -- stand crouch air OTG wallstick
        hurt_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hurt_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        hurt_side_obj_char["velocity"] = {0,0}
        hurt_side_obj_char["friction"] = 4
        hurt_side_obj_char["gravity"] = math.max(math.abs(hit_side_obj_char["y"]-185)/50,7.5)
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstick_on_side"] = 0
        hurt_side_obj_char["wallhurt_wallstickable"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = false
        hurt_side_obj_char["self_knockdown_animation"] = nil
        hurt_side_obj_char["self_knockdown_recovery_animation"] = 
        load_game_scene_anim_char_common_0_general_hurt_hard_recovery_down(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_hard_recovery_down",
            "OTG",
            "5_stand_idle",
            nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
        )
        hurt_side_obj_char["idle_cancel"] = false
        hurt_side_obj_char["strike_inv"] = true
        hurt_side_obj_char["strike_inv_countdown"] = 12
        hurt_side_obj_char["throw_inv"] = true
        hurt_side_obj_char["throw_inv_countdown"] = res["anim_length"]+5
        hurt_side_obj_char["projectile_inv"] = true
        hurt_side_obj_char["projectile_inv_countdown"] = 12
        -- frame_data
        hurt_side_obj_char["startup_frame"] = 0
        hurt_side_obj_char["active_frame"] = 0
        hurt_side_obj_char["recovery_frame"] = 0
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data["0_general_hurt_launched_high"][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = false
        hurt_side_obj_char["hitbox_table"] = {}
        hurt_side_obj_char["hurtbox_table"] = {}
        hurt_side_obj_char["collision_ground_height_offset"] = 0
        -- draw_correction
        hurt_side_obj_char[8] = 0
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data["0_general_hurt_launched_high"]
    end
    res[1] = function()
        -- state
        hurt_side_obj_char["state_cache"] = "knockdown_recovery"
    end
    res[12] = function()
        -- state
        hurt_side_obj_char["sprite_sheet"] = "0_general_hurt_launched_low"
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data["0_general_hurt_launched_low"][0]
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data["0_general_hurt_launched_low"][0]
        -- draw_correction
        hurt_side_obj_char[8] = 2
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data["0_general_hurt_launched_low"]
        -- character_shake
        hurt_side_obj_char["hurtstop_wiggle_x_animation"] = 
        common_game_scene_create_hurtstop_wiggle_animation(
            6,
            "hurtstop_wiggle_x",
            15
        )
        hurt_side_obj_char["hurtstop_wiggle_y_animation"] = 
        common_game_scene_create_hurtstop_wiggle_animation(
            6,
            "hurtstop_wiggle_y",
            7
        )
        init_point_linear_anim_with(hurt_side_obj_char,hurt_side_obj_char["hurtstop_wiggle_x_animation"])
        init_point_linear_anim_with(hurt_side_obj_char,hurt_side_obj_char["hurtstop_wiggle_y_animation"])
        hurt_side_obj_char["hurtstop_wiggle_current_x"] = (hurt_side_obj_char["hurtstop_wiggle_x"]*(math.random()-0.5)*2)
        hurt_side_obj_char["hurtstop_wiggle_current_y"] = (hurt_side_obj_char["hurtstop_wiggle_y"]*(math.random()-0.5)*2)
    end
    res[19] = function()
        -- state
        hurt_side_obj_char["physics_lock"] = false
        hurt_side_obj_char["pushbox_opponent_collision_active"] = true
        -- state_number
        hurt_side_obj_char["velocity"] = {hit_side_obj_char[5]*7.5,0}
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data["0_general_hurt_launched_low"][1]
        -- draw_correction
        hurt_side_obj_char[8] = 1
        hurt_side_obj_char["hurtstop_wiggle_x"] = 0
        hurt_side_obj_char["hurtstop_wiggle_y"] = 0
        hurt_side_obj_char["hurtstop_wiggle_current_x"] = 0
        hurt_side_obj_char["hurtstop_wiggle_current_y"] = 0
    end
    res[22] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 3
    end
    res[29] = function()
        -- state
        hurt_side_obj_char["y"] = 0
        hurt_side_obj_char["sprite_sheet"] = "0_general_hurt_hard_knockdown_down"
        -- state_number
        hurt_side_obj_char["gravity"] = 0
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data["0_general_hurt_hard_knockdown_down"][0]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data["0_general_hurt_hard_knockdown_down"][0]
        -- draw_correction
        hurt_side_obj_char[8] = 0
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data["0_general_hurt_hard_knockdown_down"]
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_land_blow(hurt_side_obj_char,-355,-160,1,1,1,0)
        -- play_SFX
        play_obj_audio(hurt_side_stage_interactive_SFX_table["ground_hard_knockdown"])
        -- update
        update_y_29f_45f(29)
    end
    res[36] = function()
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data["0_general_hurt_hard_knockdown_down"][2]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data["0_general_hurt_hard_knockdown_down"][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
        -- update
        update_y_29f_45f(36)
    end
    res[42] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 4
        -- update
        update_y_29f_45f(42)
    end
    res[48] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 5
        -- update
        update_y_46f_53f(48)
    end
    res[53] = function()
        -- state
        hurt_side_obj_char["height"] = "OTG"
        -- collide
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data["0_general_hurt_hard_knockdown_down"][6]
        -- draw_correction
        hurt_side_obj_char[8] = 6
        -- update
        update_y_46f_53f(60)
    end
    res[58] = function()
        -- draw_correction
        hurt_side_obj_char[8] = 7
    end
    res[84] = function()
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_j4_6Launcher_success(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local obj_camera = obj_stage_game_scene_camera
    local obj_stage_main = obj_stage_game_scene_main
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hit_side]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 48
    res[0] = function()
        -- state
        -- throw_relocate_x
        local hit_side_dx = hit_side_obj_char[5]*200
        if test_input_sys_press_or_hold(hit_side_input["left"]) then
            hit_side_dx = -200
        elseif test_input_sys_press_or_hold(hit_side_input["right"]) then
            hit_side_dx = 200
        end
        hurt_side_obj_char["x"] = hit_side_obj_char["x"] + hit_side_dx
        collision_pushbox_stage_relocate_x(hurt_side_obj_char)
        hit_side_obj_char["x"] = hurt_side_obj_char["x"] - hit_side_dx
        -- facing_currect
        if not common_game_scene_get_character_facing_currect(hit_side_obj_char,hurt_side_obj_char) then
            hit_side_obj_char[5] = -hit_side_obj_char[5]
        end
        hit_side_obj_char["default_throw_distance"] = 0
        hit_side_obj_char["sprite_sheet"] = "j4_6Launcher_success"
        hit_side_obj_char["height"] = "air" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "throw" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "all" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        hit_side_obj_char["velocity"] = {0,0}
        hit_side_obj_char["friction"] = 1
        hit_side_obj_char["gravity"] = math.max(math.abs(hit_side_obj_char["y"]+180)/200,1)
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["throw_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = true
        hit_side_obj_char["strike_inv_countdown"] = res["anim_length"]
        hit_side_obj_char["throw_inv"] = true
        hit_side_obj_char["throw_inv_countdown"] = res["anim_length"]
        hit_side_obj_char["projectile_inv"] = true
        hit_side_obj_char["projectile_inv_countdown"] = res["anim_length"]
        hit_side_obj_char["hit_function"] = common_game_scene_throw_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_throw_hurt_function
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 0
        -- collide
        hit_side_obj_char["pushbox"] = {0,-100,120,200}
        hit_side_obj_char["pushbox_opponent_collision_active"] = false
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {355,-595,0.9,1,1,1.047,true,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = nil
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = nil
        hit_side_obj_char["hit_counter_VFX_insert_function"] = nil
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = nil
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-260}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {335,435}
        -- camera_animation_application
        table.insert(obj_stage_main["camera_active_application_table"],
            function()
                anim_stage_point_linear_game_scene_camera_shake_x = hit_side_obj_char["camera_x_shake_anim"]
                anim_stage_point_linear_game_scene_camera_shake_y = hit_side_obj_char["camera_y_shake_anim"]
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
                init_point_linear_anim_without(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y)
                obj_camera["state"] = "active"
            end
        )
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[2] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[5] = function()
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[9] = function()
        -- draw_correction
        hit_side_obj_char[8] = 3
    end
    res[12] = function()
        -- state
        hit_side_obj_char["hit_cancel"] = true
        -- insert_VFX
        hit_side_obj_char["hit_VFX_insert_function"](hit_side_obj_char,hurt_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_move_SFX_table["j4_6Launcher_hit"])
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[19] = function()
        -- state
        hit_side_obj_char["physics_lock"] = false
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[24] = function()
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[27] = function()
        -- state
        hit_side_obj_char["sprite_sheet"] = "8_jump"
        -- draw_correction
        hit_side_obj_char[8] = 6
        hit_side_obj_char["anchor_pos"] = {350,430}
    end
    res[32] = function()
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[37] = function()
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[40] = function()
        -- state
        hit_side_obj_char["y"] = 0
        hit_side_obj_char["sprite_sheet"] = "7_8_9_jump_air_to_stand_idle"
        -- state_number
        hit_side_obj_char["friction"] = 1
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {325,480}
    end
    res[43] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[45] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[48] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = false
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- animation_end
    end
    return res
end
function load_game_scene_anim_char_TRM_j4_6Launcher_camera_shake_anim(obj_char,multiplyer)
    local anim = {}
    anim = {}
    anim[0] = {0,12}
    anim[12] = {0,13}
    anim[13] = {13.25*multiplyer,14}
    anim[14] = {-10.34*multiplyer,15}
    anim[15] = {-9.93*multiplyer,16}
    anim[16] = {9.02*multiplyer,17}
    anim[17] = {-8.10*multiplyer,18}
    anim[18] = {8.69*multiplyer,19}
    anim[19] = {-6.72*multiplyer,20}
    anim[20] = {6.47*multiplyer,21}
    anim[21] = {-5.78*multiplyer,22}
    anim[22] = {5.46*multiplyer,23}
    anim[23] = {4.31*multiplyer,24}
    anim[24] = {-4.65*multiplyer,25}
    anim[25] = {2.00*multiplyer,26}
    anim[26] = {-2.81*multiplyer,27}
    anim[27] = {1.63*multiplyer,28}
    anim[28] = {0*multiplyer,28}
    anim["prop"] = "3d_pos_x"
    anim["length"] = 28
    anim["loop"] = false
    anim["fix_type"] = false
    obj_char["camera_x_shake_anim"] = anim
    local multiplyer_fix = multiplyer*2
    anim = {}
    anim[0] = {0,12}
    anim[12] = {0,13}
    anim[13] = {10.92*multiplyer_fix,14}
    anim[14] = {2.67*multiplyer_fix,15}
    anim[15] = {-4.00*multiplyer_fix,16}
    anim[16] = {-8.26*multiplyer_fix,17}
    anim[17] = {3.60*multiplyer_fix,18}
    anim[18] = {8.15*multiplyer_fix,19}
    anim[19] = {-2.35*multiplyer_fix,20}
    anim[20] = {-6.04*multiplyer_fix,21}
    anim[21] = {1.75*multiplyer_fix,22}
    anim[22] = {5.44*multiplyer_fix,23}
    anim[23] = {-1.69*multiplyer_fix,24}
    anim[24] = {1.00*multiplyer_fix,25}
    anim[25] = {3.67*multiplyer_fix,26}
    anim[26] = {-1.13*multiplyer_fix,27}
    anim[27] = {2.11*multiplyer_fix,28}
    anim[28] = {0*multiplyer_fix,28}
    anim["prop"] = "3d_pos_y"
    anim["length"] = 28
    anim["loop"] = false
    anim["fix_type"] = false
    obj_char["camera_y_shake_anim"] = anim
end
-- _j5Launcher
function load_game_scene_anim_char_TRM_j5Launcher(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 40
    res[0] = function()
        -- state
        hit_side_obj_char["sprite_sheet"] = "j5Launcher"
        hit_side_obj_char["height"] = "air" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "mid" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 4
        hit_side_obj_char["gravity"] = 3.5
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_stand_hurt_high",
            "stand","5_stand_idle",
            12.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            12.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_ground_hurt_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "0_crouch_hurt",
            "crouch","1_2_3_crouch",
            12.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv2(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            12.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            10,5,1.035,
            -27.5,2.5,1.035,
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
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            10,5,1.00,
            5,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            25,5,1.035,
            -5,2.5,1.035,
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
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver2
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 18
        -- collide
        hit_side_obj_char["pushbox"] = {0,-100,120,200}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-160,220,340}}
        hit_side_obj_char["collision_ground_height_offset"] = 185
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_attack_socket_ver1
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {-10,200,0.6,0.8,0.8,3.14,false,true}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_attack_socket_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {-10,200,0.3,0.8,0.8,3.14,false,true}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_attack_socket_ver1
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {-10,200,0.75,0.8,0.8,3.14,false,true}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["j5Launcher_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["j5Launcher_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["j5Launcher_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["j5Launcher_whiff"]
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-260}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {325,380}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.42,15)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[4] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-130,220,280}}
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[8] = function()
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[10] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true
        -- collide
        hit_side_obj_char["hitbox_table"] = {{-205,-45,220,100},{-230,-125,170,60}}
        hit_side_obj_char["hurtbox_table"] = {{0,-120,250,260},{-205,-45,260,140},{-230,-125,210,100}}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[14] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-120,250,260},{-215,-70,180,80},{-205,-130,160,40}}
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[18] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-120,250,260},{-210,-70,170,60},{-195,-130,140,60}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[22] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-120,250,260}}
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[25] = function()
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[30] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[35] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- draw_correction
        hit_side_obj_char[8] = 9
    end
    res[40] = function()
        -- animation end
    end
    return res
end
-- uncommon_hurt_animations
-- groundbounce
-- j2K
-- function load_game_scene_anim_char_TRM_j2K_hurt(hit_side_obj_char,hurt_side_obj_char)
--     local res = load_game_scene_anim_char_common_0_general_hurt_launched_high(
--         hit_side_obj_char,hurt_side_obj_char,
--         "0_general_hurt_launched_high",
--         "air","hurt",
--         4,5,1.00,
--         10,2.5,1.00,
--         nil,nil,nil,
--         load_game_scene_anim_char_common_0_general_hurt_launched_groundbounce(
--             hit_side_obj_char,
--             "0_general_hurt_launched_groundbounce",
--             "air","knockdown_recovery",
--             15,5,1.00,
--             -20,2.5,1.00,
--             nil,
--             load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
--                 hit_side_obj_char,hurt_side_obj_char,
--                 "0_general_hurt_soft_recovery_ground",
--                 "OTG",
--                 "5_stand_idle",
--                 nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
--             ),
--             nil,nil,
--             function() hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-200) end
--         ),
--         function()
--             hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],335)
--             hurt_side_obj_char["f"] = 26
--             character_animator(hurt_side_obj_char,hurt_side_obj_char["character_animation"])
--         end
--     )
--     return res
-- end
-- special
-- _4SP_P
function load_game_scene_anim_char_TRM_4SP_P(obj_char)
    local res = {}
    res["prop_f"] = "f"
    res["anim_length"] = 85
    local res = {}
    local side = obj_char["player_side"]
    local move_SFX_table = common_game_scene_get_SFX_move(side)
    local function test_full_ability_gauge_anim_jump()
        if obj_char["ability_gauge"][1] == obj_char["ability_gauge"][2] then
            -- state
            obj_char["f"] = 57
            -- draw_correction
            obj_char[8] = 12
        end
    end
    res["prop_f"] = "f"
    res["anim_length"] = 85
    for i = 30,57 do
        res[i] = function()
            test_full_ability_gauge_anim_jump()
        end
    end
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(obj_char)
        -- state
        obj_char["sprite_sheet"] = "4SP_P"
        obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        obj_char["hit_type"] = "none" -- none strike throw burst
        obj_char["hit_guard_type"] = "all" -- none all low mid high
        obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        obj_char["friction"] = 5
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = false
        obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        obj_char["strike_inv"] = false
        obj_char["strike_inv_countdown"] = 0
        obj_char["throw_inv"] = false
        obj_char["throw_inv_countdown"] = 0
        obj_char["projectile_inv"] = false
        obj_char["projectile_inv_countdown"] = 0
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- frame_data
        obj_char["startup_frame"] = 0
        obj_char["active_frame"] = 0
        obj_char["recovery_frame"] = 0
        -- input_sys_cache
        obj_char["input_sys_state"] = "none" -- none save load
        common_game_scene_get_input_sys_cache_init(side)(obj_char)
        -- collide
        obj_char["pushbox"] = {0,-185,120,370}
        obj_char["pushbox_opponent_collision_active"] = true
        obj_char["hitbox_table"] = {}
        obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        obj_char[8] = 0
        obj_char["anchor_pos"] = {190,515}
        -- visual_front
        CHARACTER_VISUAL_FRONT = side
    end
    res[5] = function()
        -- draw_correction
        obj_char[8] = 1
    end
    res[10] = function()
        -- draw_correction
        obj_char[8] = 2
    end
    res[13] = function()
        -- input_sys_cache
        obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(side)(obj_char)
    end
    res[14] = function()
        -- draw_correction
        obj_char[8] = 3
    end
    res[19] = function()
        -- draw_correction
        obj_char[8] = 4
    end
    res[23] = function()
        -- sub_obj_table
        obj_char["ability_gauge"][1] = math.min(obj_char["ability_gauge"][1] + 100.0,obj_char["ability_gauge"][2])
        -- draw_correction
        obj_char[8] = 5
        -- play_SFX
        play_obj_audio(move_SFX_table["4SP_P_clip_2"])
    end
    res[29] = function()
        -- state
        obj_char["hit_type"] = "none" -- none strike throw burst
        obj_char["hit_guard_type"] = "none" -- none all low mid high
        obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        obj_char["move_state"] = "none" -- none startup active recovery
        obj_char["hit_cancel"] = false
        obj_char["idle_cancel"] = true
        -- state_number
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        obj_char["horizontal_velocity_correction"] = 1
        obj_char["gravity_correction"] = 1
        obj_char["damage_correction"] = 1
        -- input_sys_cache
        obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(side)()
    end
    res[30] = function()
        -- sub_obj_table
        obj_char["ability_gauge"][1] = math.min(obj_char["ability_gauge"][1] + 100.0,obj_char["ability_gauge"][2])
        -- draw_correction
        obj_char[8] = 6
        -- uncommon_update
        test_full_ability_gauge_anim_jump()
    end
    res[32] = function()
        -- play_SFX
        play_obj_audio(move_SFX_table["4SP_P_clip_0"])
    end
    res[35] = function()
        -- draw_correction
        obj_char[8] = 7
        -- uncommon_update
        test_full_ability_gauge_anim_jump()
    end
    res[39] = function()
        -- sub_obj_table
        obj_char["ability_gauge"][1] = math.min(obj_char["ability_gauge"][1] + 100.0,obj_char["ability_gauge"][2])
        -- draw_correction
        obj_char[8] = 8
        -- play_SFX
        play_obj_audio(move_SFX_table["4SP_P_clip_1"])
        -- uncommon_update
        test_full_ability_gauge_anim_jump()
    end
    res[44] = function()
        -- draw_correction
        obj_char[8] = 9
        -- uncommon_update
        test_full_ability_gauge_anim_jump()
    end
    res[48] = function()
        -- sub_obj_table
        obj_char["ability_gauge"][1] = math.min(obj_char["ability_gauge"][1] + 100.0,obj_char["ability_gauge"][2])
        -- draw_correction
        obj_char[8] = 10
        -- play_SFX
        play_obj_audio(move_SFX_table["4SP_P_clip_0"])
        -- uncommon_update
        test_full_ability_gauge_anim_jump()
    end
    res[52] = function()
        -- draw_correction
        obj_char[8] = 11
        -- uncommon_update
        test_full_ability_gauge_anim_jump()
        -- play_SFX
        play_obj_audio(move_SFX_table["4SP_P_clip_2"])
    end
    res[57] = function()
        -- sub_obj_table
        obj_char["ability_gauge"][1] = math.min(obj_char["ability_gauge"][1] + 100.0,obj_char["ability_gauge"][2])
        -- draw_correction
        obj_char[8] = 12
    end
    res[61] = function()
        -- draw_correction
        obj_char[8] = 13
        -- play_SFX
        play_obj_audio(move_SFX_table["4SP_P_knife_whiff"])
    end
    res[66] = function()
        -- sub_obj_table
        obj_char["ability_gauge"][1] = math.min(obj_char["ability_gauge"][1] + 100.0,obj_char["ability_gauge"][2])
        -- play_SFX
        play_obj_audio(move_SFX_table["4SP_P_clip_1"])
        -- draw_correction
        obj_char[8] = 14
    end
    res[75] = function()
        -- draw_correction
        obj_char[8] = 15
    end
    res[85] = function()
        -- animation_end
    end
    return res
end
-- _6SP_P
function load_game_scene_anim_char_TRM_6SP_P(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 37
    for i=5,14 do
        res[i] = function()
            -- state_number
            hit_side_obj_char["velocity"][1] = (-45.0+i)*hit_side_obj_char[5]
        end
    end
    res[0] = function()
        -- state
        hit_side_obj_char["y"] = 0
        hit_side_obj_char["sprite_sheet"] = "6SP_P"
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hit_side_obj_char["hurt_state_target"] = "unblock" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        hit_side_obj_char["velocity"] = {0,0}
        hit_side_obj_char["friction"] = 0
        hit_side_obj_char["gravity"] = 1.0
        -- enemy_friend_interaction
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = true
        hit_side_obj_char["throw_inv_countdown"] = 19
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-195,205,390}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 4
        hit_side_obj_char["anchor_pos"] = {275,505}
    end
    res[2] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-200,170,400}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[5] = function()
        -- state
        hit_side_obj_char["y"] = -180
        hit_side_obj_char["sprite_sheet"] = "6SP_P"
        hit_side_obj_char["height"] = "air" -- stand crouch air OTG wallstick
        -- state_number
        hit_side_obj_char["velocity"] = {-40.0*hit_side_obj_char[5],-7.0}
        hit_side_obj_char["friction"] = 0
        hit_side_obj_char["gravity"] = 1.0
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- collide
        hit_side_obj_char["pushbox"] = {0,-100,120,200}
        hit_side_obj_char["hurtbox_table"] = {{-15,-100,170,360}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-175,-200}
        -- draw_correction
        hit_side_obj_char[8] = 0
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_6SP_P_spawn_halo(hit_side_obj_char)
    end
    res[8] = function()
        -- state_number
        hit_side_obj_char["velocity"][1] = -37.0*hit_side_obj_char[5]
        -- draw_correction
        hit_side_obj_char[8] = 1
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_6SP_P_curse_ball_spawner(hit_side_obj_char)
        -- insert_projectile
        insert_projectile_game_scene_char_TRM_6SP_P(hit_side_obj_char,hurt_side_obj_char)
    end
    res[11] = function()
        -- state_number
        hit_side_obj_char["velocity"][1] = -34.0*hit_side_obj_char[5]
        -- draw_correction
        hit_side_obj_char[8] = 2
        play_obj_audio(hit_side_move_SFX_table["6SP_P_whiff"])
    end
    res[15] = function()
        -- state_number
        hit_side_obj_char["velocity"][1] = -9.0*hit_side_obj_char[5]
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[19] = function()
        -- state
        hit_side_obj_char["y"] = 0
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        -- state_number
        hit_side_obj_char["velocity"][2] = 0
        hit_side_obj_char["friction"] = 10
        hit_side_obj_char["gravity"] = 2.5
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["hurtbox_table"] = {{0,-225,180,450}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- insert_VFX
        insert_VFX_game_scene_stage_smoke_land_blow(hit_side_obj_char,-340,-160,1,1,1,0)
    end
    res[22] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[25] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-195,205,390}}
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[29] = function()
        -- state
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" 
        hit_side_obj_char["idle_cancel"] = true
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-200,170,400}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[33] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{15,-455,100,50}}
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[37] = function()
        -- animation_end
    end
    return res
end
-- _4SP_K
function load_game_scene_anim_char_TRM_4SP_K(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hit_side]
    local hit_side_velocity_cache = hit_side_obj_char["velocity"][1]*hit_side_obj_char[5]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    res["prop_f"] = "f"
    res["anim_length"] = 40
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "4SP_K"
        hit_side_obj_char["height"] = "crouch" -- stand crouch air OTG wallstick
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- state_number
        if hit_side_velocity_cache < 0 then
            hit_side_velocity_cache = 0
        end
        hit_side_obj_char["velocity"] = {(hit_side_velocity_cache+75)*hit_side_obj_char[5],0}
        hit_side_obj_char["friction"] = 5
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = false
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {315,330}
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[3] = function()
        -- collide
        hit_side_obj_char["pushbox"] = {0,-65,120,130}
        hit_side_obj_char["hurtbox_table"] = {{0,-75,280,150}}
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[8] = function()
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[13] = function()
        -- draw_correction
        hit_side_obj_char[8] = 3
    end
    res[16] = function()
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430}}
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[21] = function()
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[27] = function()
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[30] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[32] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-195,205,390}}
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[35] = function()
        -- state
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" 
        hit_side_obj_char["idle_cancel"] = true
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[40] = function()
        -- animation_end
    end
    return res
end
-- _6SP_K
-- _4SP_S
-- _4SP_S_4dash
-- _4SP_S_6dash
-- _4SP_S_S
-- _4SP_S_H
-- _4SP_S_2Launcher
-- _4SP_S_6Launcher
-- _4SP_S_5Launcher
-- _6SP_S
function load_game_scene_anim_char_TRM_6SP_S(hit_side_obj_char,hurt_side_obj_char)
    local res = {}
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    local shot_sys_force_ease_out_state = {
        ["at_the_ready_ease_in"] = true,
        ["at_the_ready"] = true,
        ["at_the_ready_shot"] = true,
        ["steady_aim_ease_in"] = true,
        ["steady_aim"] = true,
        ["steady_aim_shot"] = true
    }
    res["prop_f"] = "f"
    res["anim_length"] = 45
    res[0] = function()
        -- pre_set
        common_game_scene_reset_velocity_by_ground_friction(hit_side_obj_char)
        -- state
        hit_side_obj_char["sprite_sheet"] = "6SP_S"
        hit_side_obj_char["height"] = "stand" -- stand crouch air OTG wallstick
        hit_side_obj_char["hit_type"] = "strike" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "all" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "counter" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "startup" -- none startup active recovery
        -- state_number
        hit_side_obj_char["friction"] = 5
        hit_side_obj_char["gravity"] = 2.5
        hit_side_obj_char["ability_gauge"][1] = math.max(0,hit_side_obj_char["ability_gauge"][1]-50)
        -- enemy_friend_interaction
        hit_side_obj_char["hit_damage"] = 300.0
        hit_side_obj_char["hit_damage_correction_factor"] = 1
        hit_side_obj_char["hit_heat_gain"] = 10.0
        hit_side_obj_char["hit_wallbreak_damage"] = 20.0
        hit_side_obj_char["hurt_heat_gain"] = 2.0
        hit_side_obj_char["blocked_heat_gain"] = 8.0
        hit_side_obj_char["block_heat_gain"] = 2.0
        hit_side_obj_char["block_risk_gauge_gain"] = 25.0
        hit_side_obj_char["FD_block_heat_drain"] = 5.0
        hit_side_obj_char["stand_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            7.5,5,1.10,
            -37.5,2.5,1.10,
            nil,
            load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
                hit_side_obj_char,hurt_side_obj_char,
                "0_general_hurt_soft_recovery_ground",
                "OTG",
                "5_stand_idle",
                nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
            ),
            nil,nil,
            function() hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-290) end
        )
        hit_side_obj_char["stand_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv3(
            hit_side_obj_char,hurt_side_obj_char,
            "4_stand_block_high",
            "stand","5_stand_idle",
            62.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["crouch_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            7.5,5,1.10,
            -37.5,2.5,1.10,
            nil,
            load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
                hit_side_obj_char,hurt_side_obj_char,
                "0_general_hurt_soft_recovery_ground",
                "OTG",
                "5_stand_idle",
                nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
            ),
            nil,nil,
            function() hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-290) end
        )
        hit_side_obj_char["crouch_block_animation"] = load_game_scene_anim_char_common_0_ground_block_lv3(
            hit_side_obj_char,hurt_side_obj_char,
            "1_crouch_block",
            "crouch","1_2_3_crouch",
            62.5,5,1.00,
            0,2.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["air_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            7.5,5,1.10,
            -37.5,2.5,1.10,
            nil,
            load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
                hit_side_obj_char,hurt_side_obj_char,
                "0_general_hurt_soft_recovery_ground",
                "OTG",
                "5_stand_idle",
                nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
            ),
            nil,nil,
            function() hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-290) end
        )
        hit_side_obj_char["air_block_animation"] = load_game_scene_anim_char_common_0_air_block(
            hit_side_obj_char,hurt_side_obj_char,
            "1_4_7_air_block",
            "air","5_stand_idle",
            37.5,5,1.00,
            -22.5,12.5,1.00,
            nil,nil,nil,nil,
            function() end
        )
        hit_side_obj_char["OTG_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_launched_high(
            hit_side_obj_char,hurt_side_obj_char,
            "0_general_hurt_launched_high",
            "air","knockdown_recovery",
            27.5,5,1.10,
            -5,2.5,1.10,
            nil,
            load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
                hit_side_obj_char,hurt_side_obj_char,
                "0_general_hurt_soft_recovery_ground",
                "OTG",
                "5_stand_idle",
                nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,function() end
            ),
            nil,nil,
            function() hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-565) end
        )
        hit_side_obj_char["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
            hit_side_obj_char,hurt_side_obj_char,nil,false
        )
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = false
        hit_side_obj_char["strike_active"] = false -- 防止在同一动作的active多次触发
        hit_side_obj_char["strike_inv"] = false
        hit_side_obj_char["strike_inv_countdown"] = 0
        hit_side_obj_char["throw_inv"] = false
        hit_side_obj_char["throw_inv_countdown"] = 0
        hit_side_obj_char["projectile_inv"] = false
        hit_side_obj_char["projectile_inv_countdown"] = 0
        hit_side_obj_char["hit_function"] = common_game_scene_strike_hit_function
        hit_side_obj_char["hurt_function"] = common_game_scene_strike_hurt_function
        hit_side_obj_char["strike_counter_ver_function"] = common_game_scene_counter_ver3
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- frame_data
        hit_side_obj_char["startup_frame"] = 0
        hit_side_obj_char["active_frame"] = 0
        hit_side_obj_char["recovery_frame"] = 0
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
        -- game_speed
        hit_side_obj_char["hit_hurt_blockstop_countdown"] = 17
        -- collide
        hit_side_obj_char["pushbox"] = {0,-185,120,370}
        hit_side_obj_char["pushbox_opponent_collision_active"] = true
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
        -- sub_obj_table
        -- VFX
        hit_side_obj_char["hit_VFX_insert_function"] = insert_VFX_game_scene_char_blast_special
        hit_side_obj_char["hit_VFX_insert_function_argument"] = {0,0,1,0,0,0,true,false}
        hit_side_obj_char["hit_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_blast_dynamic_ver1
        hit_side_obj_char["hit_block_VFX_insert_function_argument"] = {0,0,0.3,0.8,0.8,0,true,false}
        hit_side_obj_char["hit_counter_VFX_insert_function"] = insert_VFX_game_scene_char_counter_blast_special
        hit_side_obj_char["hit_counter_VFX_insert_function_argument"] = {0,0,1,0,0,0,true,false}
        hit_side_obj_char["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
        -- SFX
        hit_side_obj_char["hit_SFX"] = hit_side_move_SFX_table["6SP_S_hit"]
        hit_side_obj_char["hit_block_SFX"] = hit_side_move_SFX_table["6SP_S_block"]
        hit_side_obj_char["hit_counter_SFX"] = hit_side_move_SFX_table["6SP_S_counter"]
        hit_side_obj_char["hit_whiff_SFX"] = hit_side_move_SFX_table["6SP_S_whiff"]
        -- oroboros
        hit_side_obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
        -- draw_correction
        hit_side_obj_char[8] = 0
        hit_side_obj_char["anchor_pos"] = {200,570}
        -- camera_animation_load
        common_game_scene_hit_load_camera_shake_anim(hit_side_obj_char,0.54,10)
        common_game_scene_nil_load_camera_enclose_anim(hit_side_obj_char)
        -- visual_front
        CHARACTER_VISUAL_FRONT = hit_side
    end
    res[3] = function()
        -- draw_correction
        hit_side_obj_char[8] = 1
    end
    res[5] = function()
        -- draw_correction
        hit_side_obj_char[8] = 2
    end
    res[7] = function()
        -- input_sys
        hit_side_obj_char["input_sys_state_negative_edge"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_negative_edge_init(hit_side)(hit_side_obj_char)
    end
    res[8] = function()
        -- state
        hit_side_obj_char["move_state"] = "active" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = true
        -- collide
        hit_side_obj_char["hitbox_table"] = {{120,-425,160,320},{220,-425,40,290}}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30},{120,-425,220,370},{220,-425,90,340}}
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- insert_VFX
        insert_VFX_game_scene_char_TRM_6SP_S_move(hit_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_obj_char["hit_whiff_SFX"])
    end
    res[11] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "punish" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "recovery" -- none startup active recovery
        -- enemy_friend_interaction
        hit_side_obj_char["strike_active"] = false
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hitbox_table"] = {}
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30},{120,-425,150,280}}
        -- draw_correction
        hit_side_obj_char[8] = 4
    end
    res[14] = function()
        -- sub_obj_table
        character_function_game_scene_TRM_shot_sys_at_the_ready_ease_in_init(hit_side_obj_char,hurt_side_obj_char)
        hit_side_obj_char["shot_sys_state"] = "at_the_ready_ease_in"
    end
    res[15] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30},{120,-380,140,240}}
        -- draw_correction
        hit_side_obj_char[8] = 5
    end
    res[17] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_init(hit_side)(hit_side_obj_char)
    end
    res[20] = function()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        -- draw_correction
        hit_side_obj_char[8] = 6
    end
    res[22] = function()
        -- state
        hit_side_obj_char["hit_type"] = "none" -- none strike throw burst
        hit_side_obj_char["hit_guard_type"] = "none" -- none all low mid high
        hit_side_obj_char["hurt_state_target"] = "idle" -- idle unblock punish counter GP parry
        hit_side_obj_char["move_state"] = "none" -- none startup active recovery
        hit_side_obj_char["hit_cancel"] = false
        hit_side_obj_char["idle_cancel"] = true
        -- state_number
        hit_side_obj_char["gravity"] = 2.5
        -- enemy_friend_interaction
        hit_side_obj_char["horizontal_velocity_correction"] = 1
        hit_side_obj_char["gravity_correction"] = 1
        hit_side_obj_char["damage_correction"] = 1
        -- input_sys_cache
        hit_side_obj_char["input_sys_state"] = "load" -- none save load
        common_game_scene_get_input_sys_cache_state_machine(hit_side)()
        -- collide
        hit_side_obj_char["hurtbox_table"] = {{0,-215,170,430},{0,-445,100,30}}
        hit_side_obj_char["collision_ground_height_offset"] = 0
    end
    res[25] = function()
        -- draw_correction
        hit_side_obj_char[8] = 7
    end
    res[32] = function()
        -- draw_correction
        hit_side_obj_char[8] = 8
    end
    res[39] = function()
        -- draw_correction
        hit_side_obj_char[8] = 0
    end
    res[49] = function()
        -- animation_end
    end
    return res
end
-- _SP_H
-- _SP_H_P
-- _SP_H_K
-- _SP_H_S
-- _SP_H_H
-- _jSP_S
-- _jSP_H
-- _jSP_H_P
-- _jSP_H_K
-- _jSP_H_S
-- _jSP_H_H
-- _4UA
-- _6UA
-- _5UA
-- _4SP_S_UA

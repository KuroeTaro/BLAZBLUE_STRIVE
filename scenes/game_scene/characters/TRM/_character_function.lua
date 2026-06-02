-- hit_function
function character_function_game_scene_TRM_j2K_strike_hit_function(obj_char)
    local hit_side_obj_char = common_game_scene_change_character(obj_char["player_side"])
    common_game_scene_strike_hit_function(obj_char)
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
    common_game_scene_strike_hurt_function(obj_char)
end

-- RC_state_update_function
function character_function_game_scene_TRM_RC_state_character_uncommon_update(obj_char)
    -- height_state
    if obj_char["height_state"] == "stand" then
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
    elseif obj_char["height_state"] == "air" then
        obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-320}
    end
end
-- Overdrive_state_update_function
function character_function_game_scene_TRM_overdrive_state_character_uncommon_init(obj_char)
    -- shot_sys
    if obj_char["height_state"] == "air" then
        obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-320}
    else
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
    end
end

-- cancel_function
function character_function_game_scene_TRM_hitstop_air_jump_cancel(
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
function character_function_game_scene_TRM_histop_ground_jump_cancel(input,obj_char)
    obj_char["direction_input_cache"],obj_char["direction_input"] = obj_char["direction_input"],obj_char["direction_input_cache"]
    if not common_game_scene_get_character_facing_currect(obj_char) then
        obj_char[5] = -obj_char[5]
    end
    obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(obj_char)
    init_character_anim_with(obj_char,obj_char["character_animation"])
    obj_char["direction_input_cache"],obj_char["direction_input"] = obj_char["direction_input"],obj_char["direction_input_cache"]
    obj_char["state"] = "7_8_9_pre_jump"
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
    local instant_aim_state = {
        ["block"] = true,
        ["hurt"] = true,
        ["throw_hurt_success"] = true,
        ["hurtstop"] = true,
        ["blockstop"] = true,
        ["wallstick"] = true,
        ["wallbreak"] = true,
        ["knockdown"] = true,
        ["knockdown_recovery"] = true,
        ["knockdown_recovery_wallstick"] = true
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
-- r_visual_calculation
function character_function_game_scene_TRM_shot_sys_at_the_ready_aim_r_calculation(obj_char,oroboros_pos,rectile_pos)
    local center_r = math.atan2((rectile_pos[2]-oroboros_pos[2]),(rectile_pos[1]-oroboros_pos[1]))
    if obj_char[5] < 0 then
        center_r = center_r + 3.1416
    end
    if center_r > 3.1416 then center_r = center_r - 2*3.1416 end
    return center_r
end
-- reticle_basic_prop_update
function character_function_game_scene_TRM_shot_sys_reticle_pos_update_at_the_ready(obj_char)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local obj_char_shot_sys_aim_process = obj_char["shot_sys_aim_process"]
    local div_value = 30-math.min(obj_char_shot_sys_aim_process[1],obj_char_shot_sys_aim_process[3])/15

    local height_offset = {
        [370] = 315,
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
        [370] = 315,
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
        [370] = 315,
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
-- employment_function
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
    if obj_char["hurt_state"] == "idle" then
        obj_char["hurt_state"] = "unblock"
    end
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
    if obj_char["hurt_state"] == "idle" then
        obj_char["hurt_state"] = "unblock"
    end
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
function character_function_game_scene_TRM_shot_sys_at_the_ready_init(obj_char)
    -- hurt_state
    if obj_char["hurt_state"] == "idle" then
        obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    -- 已经在ease_in阶段完成了当前帧数的aim_process
    -- reticle
    -- rewrite in case of aim_process change in at_the_ready
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_update(obj_char)
    -- hurt_state
    if obj_char["hurt_state"] == "idle" then
        obj_char["hurt_state"] = "unblock"
    end
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
    if obj_char["hurt_state"] == "idle" then
        obj_char["hurt_state"] = "unblock"
    end
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
    if obj_char["hurt_state"] == "idle" then
        obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    character_animator(obj_char,obj_char["shot_sys_animation"])
    return
end
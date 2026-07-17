-- hit_function
function character_function_game_scene_TRM_j2K_strike_hit_function(hit_side_obj_char,hurt_side_obj_char)
    common_game_scene_strike_hit_function(hit_side_obj_char,hurt_side_obj_char)
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
function character_function_game_scene_TRM_j2K_strike_hurt_function(hit_side_obj_char,hurt_side_obj_char)
    common_game_scene_strike_hurt_function(hit_side_obj_char,hurt_side_obj_char)
end
-- RC_state_update_function
function character_function_game_scene_TRM_RC_state_character_uncommon_update(obj_char)
    -- height
    if obj_char["height"] == "stand" then
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
    elseif obj_char["height"] == "air" then
        obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-320}
    end
end
-- Overdrive_state_update_function
function character_function_game_scene_TRM_overdrive_state_character_uncommon_init(obj_char)
    -- shot_sys
    if obj_char["height"] == "air" then
        obj_char["shot_sys_oroboros_anchor_pos"] = {-130,-320}
    else
        obj_char["shot_sys_oroboros_anchor_pos"] = {-110,-455}
    end
end
-- cancel_function
function character_function_game_scene_TRM_hitstop_air_jump_cancel(
    input,self_side_obj_char,opponent_side_obj_char,
    v1,v2,v3,v4,v5,v6,v7,v8,v9
)
    local down_cache = input["down"]
    input["down"] = false
    if not common_game_scene_get_character_facing_currect(self_side_obj_char,opponent_side_obj_char) then
        self_side_obj_char[5] = -self_side_obj_char[5]
    end
    common_game_scene_update_input_direction(self_side_obj_char)
    input["down"] = down_cache
    -- air_move
    self_side_obj_char["air_move"]["jump"][1] = math.max(math.min(self_side_obj_char["air_move"]["jump"][1]-1,self_side_obj_char["air_move"]["jump"][2]),0)
    self_side_obj_char["air_move"]["air_dash"][1] = 0
    -- velocity_cache
    if self_side_obj_char["direction_input"] == 7 then
        self_side_obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(self_side_obj_char,"7_jump",{200,470},self_side_obj_char["velocity"][1]*v1 + self_side_obj_char[5]*v2,v3)
    elseif self_side_obj_char["direction_input"] == 8 then
        self_side_obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(self_side_obj_char,"8_jump",{350,430},self_side_obj_char["velocity"][1]*v4 + self_side_obj_char[5]*v5,v6)
    elseif self_side_obj_char["direction_input"] == 9 then
        self_side_obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_jump_air(self_side_obj_char,"9_jump",{320,430},self_side_obj_char["velocity"][1]*v7 + self_side_obj_char[5]*v8,v9)
    end
    init_character_anim_with(self_side_obj_char,self_side_obj_char["character_animation"])
    self_side_obj_char["state"] = "7_8_9_jump_air"
    -- save_input_sys_cache_from_jS_and_7_8_9_jump_air
    load_input_sys_cache_manual_release(input,self_side_obj_char,"up")
    load_input_sys_cache_recache(input,self_side_obj_char)
    self_side_obj_char["input_sys_state"] = "save" -- none save load
end
function character_function_game_scene_TRM_histop_ground_jump_cancel(input,self_side_obj_char,opponent_side_obj_char)
    self_side_obj_char["direction_input_cache"],self_side_obj_char["direction_input"] = self_side_obj_char["direction_input"],self_side_obj_char["direction_input_cache"]
    if not common_game_scene_get_character_facing_currect(self_side_obj_char,opponent_side_obj_char) then
        self_side_obj_char[5] = -self_side_obj_char[5]
    end
    self_side_obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(self_side_obj_char)
    init_character_anim_with(self_side_obj_char,self_side_obj_char["character_animation"])
    self_side_obj_char["direction_input_cache"],self_side_obj_char["direction_input"] = self_side_obj_char["direction_input"],self_side_obj_char["direction_input_cache"]
    self_side_obj_char["state"] = "7_8_9_pre_jump"
end
function character_function_game_scene_TRM_hitstop_force_delay_gatling_cancel_input_sys_cache_process(input,obj_char)
    if obj_char["state"] == "j2K" then
        load_input_sys_cache_recache(input,obj_char)
        obj_char["input_sys_state"] = "save" -- none save load
    end
end
-- shot_sys_function
-- ability_use_calculation
function character_function_game_scene_TRM_shot_sys_ability_gauge_use(obj_char)
    local current_ability_gauge = obj_char["ability_gauge"][1]
    if current_ability_gauge >= 100 and current_ability_gauge % 100 == 0 then
        obj_char["ability_gauge"][1] = current_ability_gauge - 100
    else
        obj_char["ability_gauge"][1] = math.floor(current_ability_gauge/100) * 100
    end
end
-- aim_process_init
function character_function_game_scene_TRM_shot_sys_aim_process_init(hit_side_obj_char,hurt_side_obj_char)
    local instant_aim_state = {
        ["block"] = true,
        ["hurt"] = true,
        ["throw_hurt_success"] = true,
        ["hurtstop"] = true,
        ["blockstop"] = true,
        ["wallstick"] = true,
        ["wallbreak"] = true,
        ["knockdown"] = true
    }
    if instant_aim_state[hurt_side_obj_char["state"]] then
        hit_side_obj_char["shot_sys_aim_process"][1] = hit_side_obj_char["shot_sys_aim_process"][3]
    else
        hit_side_obj_char["shot_sys_aim_process"][1] = 0
    end
end
-- aim_process_update
function character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(self_side_obj_char,opponent_side_obj_char)
    -- 0.敌我之间距离
    -- 1.敌方绝对速度
    -- 2.水平相对速度
    -- 3.命中对方
    -- 4.空拳脚 开枪
    -- 5.诅咒
    -- 6.特定的己方模组（哈皮的翻滚）
    local obj_char_shot_sys_aim_process = self_side_obj_char["shot_sys_aim_process"]
    local instant_aim_state = {
        ["block"] = true,
        ["hurt"] = true,
        ["throw_hurt_success"] = true,
        ["hurtstop"] = true,
        ["blockstop"] = true,
        ["wallstick"] = true,
        ["wallbreak"] = true,
        ["knockdown"] = true
    }
    local function debuff(self_side_obj_char, opponent_side_obj_char)
        local dx = opponent_side_obj_char["x"] - self_side_obj_char["x"]
        local vx = opponent_side_obj_char["velocity"][1]
        local v = math.sqrt(opponent_side_obj_char["velocity"][1]^2 + opponent_side_obj_char["velocity"][2]^2)
        local dist = math.max(math.abs(dx)-1000, 0)
        local speed = math.min(math.abs(v), 40)
        local approaching = (dx * vx < 0) and 1.075 or 0
        local k_speed = 1.625
        local k_approach = 1.5
        local result = (dist/600*0.05+1)*speed*k_speed - approaching*speed*k_approach
        return result
    end
    -- focus_speed
    obj_char_shot_sys_aim_process[2] = 10
    if self_side_obj_char["shot_sys_curse"] then
        obj_char_shot_sys_aim_process[2] = 17.5
    end
    -- debuff_base_on_abs_and_relative_velocity
    obj_char_shot_sys_aim_process[1] = obj_char_shot_sys_aim_process[1] - debuff(self_side_obj_char, opponent_side_obj_char)
    -- add_focus_speed
    obj_char_shot_sys_aim_process[1] = 
        math.min(
            obj_char_shot_sys_aim_process[1]+obj_char_shot_sys_aim_process[2],
            obj_char_shot_sys_aim_process[4]
        )
    obj_char_shot_sys_aim_process[1] = math.max(obj_char_shot_sys_aim_process[1],0)
    -- instandt_aim
    if instant_aim_state[opponent_side_obj_char["state"]] then
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
function character_function_game_scene_TRM_shot_sys_reticle_pos_update_at_the_ready(self_side_obj_char,opponent_side_obj_char)
    local self_side_obj_char_shot_sys_aim_process = self_side_obj_char["shot_sys_aim_process"]
    local div_value = 30-math.min(self_side_obj_char_shot_sys_aim_process[1],self_side_obj_char_shot_sys_aim_process[3])/15
    local height_offset = {
        [370] = 315,
        [285] = 200,
        [200] = 100,
        [130] = 100
    }
    -- update_shot_sys_reticle_visual_offset
    self_side_obj_char["shot_sys_reticle_stage_pos_target"] = {
        opponent_side_obj_char["x"]-160,
        opponent_side_obj_char["y"]-height_offset[opponent_side_obj_char["pushbox"][4]]-160
    }
    self_side_obj_char["shot_sys_reticle_stage_pos_current"] = {
        (self_side_obj_char["shot_sys_reticle_stage_pos_current"][1]*(div_value-1)+self_side_obj_char["shot_sys_reticle_stage_pos_target"][1])/div_value,
        (self_side_obj_char["shot_sys_reticle_stage_pos_current"][2]*(div_value-1)+self_side_obj_char["shot_sys_reticle_stage_pos_target"][2])/div_value
    }
    self_side_obj_char["shot_sys_reticle"][1] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][1]
    self_side_obj_char["shot_sys_reticle"][2] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][2]
    return
end
function character_function_game_scene_TRM_shot_sys_reticle_pos_update_ease_in(self_side_obj_char,opponent_side_obj_char)
    if self_side_obj_char["shot_sys_aim_process"][1] < self_side_obj_char["shot_sys_aim_process"][3] then
        return
    end
    local self_side_obj_char_shot_sys_aim_process = self_side_obj_char["shot_sys_aim_process"]
    local div_value = 30-math.min(self_side_obj_char_shot_sys_aim_process[1],self_side_obj_char_shot_sys_aim_process[3])/15
    local height_offset = {
        [370] = 315,
        [285] = 200,
        [200] = 100,
        [130] = 100
    }
    -- update_shot_sys_reticle_visual_offset
    self_side_obj_char["shot_sys_reticle_stage_pos_target"] = {
        opponent_side_obj_char["x"]-160,
        opponent_side_obj_char["y"]-height_offset[opponent_side_obj_char["pushbox"][4]]-160
    }
    self_side_obj_char["shot_sys_reticle_stage_pos_current"] = {
        (self_side_obj_char["shot_sys_reticle_stage_pos_current"][1]*(div_value-1)+self_side_obj_char["shot_sys_reticle_stage_pos_target"][1])/div_value,
        (self_side_obj_char["shot_sys_reticle_stage_pos_current"][2]*(div_value-1)+self_side_obj_char["shot_sys_reticle_stage_pos_target"][2])/div_value
    }
    self_side_obj_char["shot_sys_reticle"][1] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][1]
    self_side_obj_char["shot_sys_reticle"][2] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][2]
    return
end
function character_function_game_scene_TRM_shot_sys_init_new_reticle_pos(self_side_obj_char,opponent_side_obj_char)
    local random_offset = (math.random(2) == 1) and 1 or 0
    local random_index = math.random(1, 2)
    local offset_multiplier = 100
    local height_offset = {
        [370] = 315,
        [285] = 200,
        [200] = 100,
        [130] = 100
    }
    if random_index == 1 then
        self_side_obj_char["shot_sys_reticle_stage_pos_current"][1] = opponent_side_obj_char["x"]-160
            +(math.random() * 2 - 1)*offset_multiplier
        self_side_obj_char["shot_sys_reticle_stage_pos_current"][2] = opponent_side_obj_char["y"]
            -height_offset[opponent_side_obj_char["pushbox"][4]]-160
            +((math.random(2) == 1) and 1 or -1)*offset_multiplier
    else
        self_side_obj_char["shot_sys_reticle_stage_pos_current"][1] = opponent_side_obj_char["x"]-160
            +((math.random(2) == 1) and 1 or -1)*offset_multiplier
        self_side_obj_char["shot_sys_reticle_stage_pos_current"][2] = opponent_side_obj_char["y"]
            -height_offset[opponent_side_obj_char["pushbox"][4]]-160
            +(math.random() * 2 - 1)*offset_multiplier
    end
    self_side_obj_char["shot_sys_reticle"][1] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][1]
    self_side_obj_char["shot_sys_reticle"][2] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][2]
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
function character_function_game_scene_TRM_shot_sys_at_the_ready_ease_in_init(self_side_obj_char,opponent_side_obj_char)
    -- hurt_state
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    self_side_obj_char["shot_sys_animation"] = load_game_scene_anim_char_TRM_5H_shot_sys_at_the_ready_ease_in(self_side_obj_char)
    init_character_anim_with(self_side_obj_char,self_side_obj_char["shot_sys_animation"])
    self_side_obj_char["shot_sys_aim_process"] = {0,0,420,450,false}
    character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(self_side_obj_char,opponent_side_obj_char)
    -- oroboros
    self_side_obj_char["shot_sys_oroboros_aim_r"] = 0.42
    self_side_obj_char["shot_sys_oroboros_animation_table"][1] = load_game_scene_anim_char_TRM_5H_oroboros_chain_ease_in(self_side_obj_char["shot_sys_oroboros_front"])
    self_side_obj_char["shot_sys_oroboros_animation_table"][2] = load_game_scene_anim_char_TRM_5H_oroboros_chain_loop(self_side_obj_char["shot_sys_oroboros_front"],"5H_oroboros_loop_front")
    self_side_obj_char["shot_sys_oroboros_animation_table"][3] = load_game_scene_anim_char_TRM_5H_oroboros_mid_ease(self_side_obj_char["shot_sys_oroboros_mid"],"5H_oroboros_ease_in_mid")
    self_side_obj_char["shot_sys_oroboros_animation_table"][4] = load_game_scene_anim_char_TRM_5H_oroboros_chain_ease_in(self_side_obj_char["shot_sys_oroboros_back"])
    self_side_obj_char["shot_sys_oroboros_animation_table"][5] = load_game_scene_anim_char_TRM_5H_oroboros_chain_loop(self_side_obj_char["shot_sys_oroboros_back"],"5H_oroboros_loop_back")
    init_character_anim_without(self_side_obj_char["shot_sys_oroboros_front"],self_side_obj_char["shot_sys_oroboros_animation_table"][1])
    init_character_anim_without(self_side_obj_char["shot_sys_oroboros_front"],self_side_obj_char["shot_sys_oroboros_animation_table"][2])
    init_character_anim_without(self_side_obj_char["shot_sys_oroboros_mid"],self_side_obj_char["shot_sys_oroboros_animation_table"][3])
    init_character_anim_without(self_side_obj_char["shot_sys_oroboros_back"],self_side_obj_char["shot_sys_oroboros_animation_table"][4])
    init_character_anim_without(self_side_obj_char["shot_sys_oroboros_back"],self_side_obj_char["shot_sys_oroboros_animation_table"][5])
    character_function_game_scene_TRM_shot_sys_oroboros_pos_init(self_side_obj_char)
    self_side_obj_char["shot_sys_oroboros_state"] = "ease_in"
    -- reticle
    self_side_obj_char["shot_sys_reticle_animation_table"][1] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_ease_in(self_side_obj_char)
    init_character_anim_without(self_side_obj_char,self_side_obj_char["shot_sys_reticle_animation_table"][1])
    character_function_game_scene_TRM_shot_sys_init_new_reticle_pos(self_side_obj_char,opponent_side_obj_char)
    character_function_game_scene_TRM_shot_sys_reticle_pos_update_ease_in(self_side_obj_char,opponent_side_obj_char)
    self_side_obj_char["shot_sys_reticle_state"] = "at_the_ready_ease_in"
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_ease_in_update(self_side_obj_char,opponent_side_obj_char)
    -- hurt_state
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    character_animator(self_side_obj_char,self_side_obj_char["shot_sys_animation"])
    character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(self_side_obj_char,opponent_side_obj_char)
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
function character_function_game_scene_TRM_shot_sys_at_the_ready_update(self_side_obj_char,opponent_side_obj_char)
    -- hurt_state
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    self_side_obj_char["ability_gauge"][1] = math.max(0,self_side_obj_char["ability_gauge"][1]-0.5)
    character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(self_side_obj_char,opponent_side_obj_char)
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
function character_function_game_scene_TRM_shot_sys_at_the_ready_shot_init(self_side_obj_char,opponent_side_obj_char)
    -- hurt_state
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    self_side_obj_char["shot_sys_animation"] = load_game_scene_anim_char_TRM_5H_shot_sys_at_the_ready_shot(self_side_obj_char,opponent_side_obj_char)
    init_character_anim_with(self_side_obj_char,self_side_obj_char["shot_sys_animation"])
    -- 已经在ease_in阶段完成了当前帧数的aim_process
    -- oroboros
    self_side_obj_char["shot_sys_oroboros_animation_table"][6] = load_game_scene_anim_char_TRM_5H_oroboros_shot(self_side_obj_char)
    init_character_anim_without(self_side_obj_char,self_side_obj_char["shot_sys_oroboros_animation_table"][6])
    character_function_game_scene_TRM_shot_sys_oroboros_pos_update(self_side_obj_char)
    self_side_obj_char["shot_sys_oroboros_state"] = "shot"
    -- reticle
    self_side_obj_char["shot_sys_reticle_animation_table"][2] = load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_shot(self_side_obj_char)
    init_character_anim_with(self_side_obj_char,self_side_obj_char["shot_sys_reticle_animation_table"][2])
    self_side_obj_char["shot_sys_reticle_state"] = "at_the_ready_shot"
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

-- hit_function
function character_function_game_scene_TRM_j2K_strike_hit_function(
    hit_side_obj_char,hurt_side_obj_char
)
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
end
function character_function_game_scene_TRM_j2K_strike_hurt_function(
    hit_side_obj_char,hurt_side_obj_char
)
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
-- overdrive_state_update_function
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
    self_side_input,opponent_side_input,
    self_side_obj_char,opponent_side_obj_char,
    v1,v2,v3,v4,v5,v6,v7,v8,v9
)
    local down_cache = self_side_input["down"]
    self_side_input["down"] = false
    if not common_game_scene_get_character_facing_currect(self_side_obj_char,opponent_side_obj_char) then
        self_side_obj_char[5] = -self_side_obj_char[5]
    end
    common_game_scene_update_input_sys_direction(self_side_obj_char,opponent_side_obj_char)
    self_side_input["down"] = down_cache
    -- air_move
    self_side_obj_char["air_move"]["jump"][1] = math.max(
        math.min(self_side_obj_char["air_move"]["jump"][1] - 1,self_side_obj_char["air_move"]["jump"][2]),0
    )
    self_side_obj_char["air_move"]["air_dash"][1] = 0
    -- velocity_cach
    if self_side_obj_char["direction_input"] == 7 then
        self_side_obj_char["character_animation"] =
        load_game_scene_anim_char_TRM_7_8_9_jump_air(
            self_side_obj_char,"7_jump",{200,470},
            self_side_obj_char["velocity"][1]*v1 + self_side_obj_char[5]*v2,v3,"air_jump"
        )
    elseif self_side_obj_char["direction_input"] == 8 then
        self_side_obj_char["character_animation"] =
        load_game_scene_anim_char_TRM_7_8_9_jump_air(
            self_side_obj_char,"8_jump",{350,430},
            self_side_obj_char["velocity"][1]*v4 + self_side_obj_char[5]*v5,v6,"air_jump"
        )
    elseif self_side_obj_char["direction_input"] == 9 then
        self_side_obj_char["character_animation"] =
        load_game_scene_anim_char_TRM_7_8_9_jump_air(
            self_side_obj_char,"9_jump",{320,430},
            self_side_obj_char["velocity"][1]*v7 + self_side_obj_char[5]*v8,v9,"air_jump"
        )
    end
    common_game_scene_update_input_sys_direction(self_side_obj_char,opponent_side_obj_char)
    init_character_anim_with(
        self_side_obj_char,self_side_obj_char["character_animation"]
    )
    self_side_obj_char["state"] = "7_8_9_jump_air"
    -- save_input_sys_cache_from_j5S_and_7_8_9_jump_air
    load_input_sys_cache_manual_release(self_side_input,self_side_obj_char,"up")
    load_input_sys_cache_recache(self_side_input,self_side_obj_char)
    self_side_obj_char["input_sys_state"] = "save" -- none_save_load
end
function character_function_game_scene_TRM_histop_ground_jump_cancel(
    self_side_input,opponent_side_input,self_side_obj_char,opponent_side_obj_char
)
    self_side_obj_char["direction_input_cache"],self_side_obj_char["direction_input"] =
    self_side_obj_char["direction_input"],self_side_obj_char["direction_input_cache"]
    if not common_game_scene_get_character_facing_currect(self_side_obj_char,opponent_side_obj_char) then
        self_side_obj_char[5] = -self_side_obj_char[5]
    end
    self_side_obj_char["character_animation"] = load_game_scene_anim_char_TRM_7_8_9_pre_jump(self_side_obj_char)
    init_character_anim_with(
        self_side_obj_char,self_side_obj_char["character_animation"]
    )
    self_side_obj_char["direction_input_cache"],self_side_obj_char["direction_input"] =
    self_side_obj_char["direction_input"],self_side_obj_char["direction_input_cache"]
    self_side_obj_char["state"] = "7_8_9_pre_jump"
end
function character_function_game_scene_TRM_hitstop_force_delay_gatling_cancel_input_sys_cache_process(
    input,obj_char
)
    if obj_char["state"] == "j2K" then
        load_input_sys_cache_recache(input,obj_char)
        obj_char["input_sys_state"] = "save" -- none_save_load
    end
end
-- shot_sys_function
-- common_function_of_shot_sys
function character_function_game_scene_TRM_shot_sys_init_new_reticle_pos(
    self_side_obj_char,opponent_side_obj_char,offset_multiplier
)
    local random_index = math.random(1,2)
    if self_side_obj_char["shot_sys_curse"] then
        offset_multiplier = offset_multiplier*0.25
    end
    if random_index == 1 then
        self_side_obj_char["shot_sys_reticle_stage_pos_current"][1] = opponent_side_obj_char["x"] - 160
            + (math.random()*2 - 1)*offset_multiplier
        self_side_obj_char["shot_sys_reticle_stage_pos_current"][2] = opponent_side_obj_char["y"]
            - opponent_side_obj_char["shot_sys_reticle_height_offset"][opponent_side_obj_char["pushbox"][4]] - 160
            + ((math.random(2) == 1) and 1 or -1)*offset_multiplier
    else
        self_side_obj_char["shot_sys_reticle_stage_pos_current"][1] = opponent_side_obj_char["x"] - 160
            + ((math.random(2) == 1) and 1 or -1)*offset_multiplier
        self_side_obj_char["shot_sys_reticle_stage_pos_current"][2] = opponent_side_obj_char["y"]
            - opponent_side_obj_char["shot_sys_reticle_height_offset"][opponent_side_obj_char["pushbox"][4]] - 160
            + (math.random()*2 - 1)*offset_multiplier
    end
    self_side_obj_char["shot_sys_reticle"][1] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][1]
    self_side_obj_char["shot_sys_reticle"][2] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][2]
end
-- common_function_of_shot_sys_at_the_ready
-- at_the_ready/aim_process_init
function character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_init(
    hit_side_obj_char,hurt_side_obj_char
)
    if hurt_side_obj_char["shot_sys_at_the_ready_instant_aim_state"][hurt_side_obj_char["state"]] then
        hit_side_obj_char["shot_sys_aim_process"][1] = hit_side_obj_char["shot_sys_aim_process"][3]
    else
        hit_side_obj_char["shot_sys_aim_process"][1] = 0
    end
end
-- at_the_ready/aim_process_update
function character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(
    self_side_obj_char,opponent_side_obj_char
)
    -- 0.敌我之间距离
    -- 1.敌方绝对速度
    -- 2.水平相对速度
    -- 3.命中对方
    -- 4.空拳脚 开枪
    -- 5.诅咒
    -- 6.特定的己方模组（哈皮的翻滚）
    local self_side_obj_char_shot_sys_aim_process = self_side_obj_char["shot_sys_aim_process"]
    local function debuff(
        self_side_obj_char,opponent_side_obj_char
    )
        local dx = opponent_side_obj_char["x"] - self_side_obj_char["x"]
        local opponent_side_vx = opponent_side_obj_char["velocity"][1]
        local opponent_side_v =
        math.sqrt(opponent_side_obj_char["velocity"][1]^2 + opponent_side_obj_char["velocity"][2]^2)
        local dist = math.max(math.abs(dx) - 1000,0)
        local opponent_side_speed = math.min(math.abs(opponent_side_v),40)
        local approaching = (dx*opponent_side_vx < 0) and 1.075 or 0
        local k_speed = 1.625
        local k_approach = 1.5
        local result = (dist/600*0.05 + 1)*opponent_side_speed*k_speed - approaching*opponent_side_speed*k_approach
        return result
    end
    -- focus_speed
    self_side_obj_char_shot_sys_aim_process[2] = 10
    if self_side_obj_char["shot_sys_curse"] then
        self_side_obj_char_shot_sys_aim_process[2] = 17.5
    end
    -- debuff_base_on_abs_and_relative_velocity
    self_side_obj_char_shot_sys_aim_process[1] = self_side_obj_char_shot_sys_aim_process[1] - debuff(
        self_side_obj_char,opponent_side_obj_char
    )
    -- add_focus_speed
    self_side_obj_char_shot_sys_aim_process[1] =
        math.min(
            self_side_obj_char_shot_sys_aim_process[1] + self_side_obj_char_shot_sys_aim_process[2],
            self_side_obj_char_shot_sys_aim_process[4]
        )
    self_side_obj_char_shot_sys_aim_process[1] = math.max(self_side_obj_char_shot_sys_aim_process[1],0)
    -- instant_aim
    if opponent_side_obj_char["shot_sys_at_the_ready_instant_aim_state"][opponent_side_obj_char["state"]] then
        self_side_obj_char_shot_sys_aim_process[1] = math.max(
            self_side_obj_char_shot_sys_aim_process[1],self_side_obj_char_shot_sys_aim_process[3]
        )
    end
end
-- at_the_ready/aim_r_visual_calculation
function character_function_game_scene_TRM_shot_sys_at_the_ready_aim_r_calculation(
    obj_char,oroboros_pos,reticle_pos
)
    local center_r = math.atan2((reticle_pos[2] - oroboros_pos[2]),(reticle_pos[1] - oroboros_pos[1]))
    if obj_char[5] < 0 then
        center_r = center_r + 3.1416
    end
    if center_r > 3.1416 then center_r = center_r - 2*3.1416 end
    return center_r
end
-- at_the_ready/ability_gauge_use
function character_function_game_scene_TRM_shot_sys_at_the_ready_ability_gauge_use(obj_char)
    local ability_gauge_cache = obj_char["ability_gauge"][1]
    ability_gauge_cache = ability_gauge_cache - 100
    ability_gauge_cache = math.ceil(ability_gauge_cache/100)*100
    obj_char["ability_gauge"][1] = math.max(0,ability_gauge_cache)
end
-- at_the_ready_uncommon_projectile_block_function
function character_function_game_scene_TRM_shot_sys_at_the_ready_block_test(
    hit_obj,hurt_side_obj_char
)
    -- block_test
    local block_bool = false
    local block_direction = hurt_side_obj_char["direction_input"]
    local hurt_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[hurt_side_obj_char["player_side"]]
    local hurt_side_FD_block =
        test_input_sys_press_or_hold(hurt_side_input["correction_left"])
        or test_input_sys_press_or_hold(hurt_side_input["correction_right"])
    -- low_mid_high_all
    -- air_non_air
    -- FD
        -- air_low_ok
        -- air_mid_ok
        -- air_high_ok
        -- air_all_ok
        -- non_air low block_direction == 1 ok
        -- non_air mid block_direction == 4||7 ok
        -- non_air_high_ok
        -- non_air_all_ok
    -- not_FD
        -- air_low_ok
        -- air_mid_ok
        -- air_all_ok
        -- non_air low block_direction == 1 ok
        -- non_air mid block_direction == 4||7 ok
        -- non_air_high_ok
        -- non_air_all_ok
    if hurt_side_obj_char["hurt_state"] == "idle" and common_game_scene_check_block_direction(hurt_side_obj_char) then
        if hurt_side_FD_block then
            if hurt_side_obj_char["height"] == "air" then
                block_bool = true
            elseif hit_obj["hit_guard_type"] == "high" or hit_obj["hit_guard_type"] == "all" then
                block_bool = true
            end
        else
            if hurt_side_obj_char["height"] == "air" and hit_obj["hit_guard_type"] ~= "high" then
                block_bool = true
            elseif hit_obj["hit_guard_type"] == "all" then
                block_bool = true
            end
        end
    end
    -- no_cross_up_protection_for_this_you_little_fuck
    return block_bool
end
-- at_the_ready/shot_sys_oroboros_pos_update
function character_function_game_scene_TRM_shot_sys_at_the_ready_oroboros_pos_init(obj_char)
    obj_char["shot_sys_oroboros_ease_current"] = {
        obj_char["x"] + obj_char[5]*obj_char["shot_sys_oroboros_anchor_pos"][1],
        obj_char["y"] + obj_char[6]*obj_char["shot_sys_oroboros_anchor_pos"][2],
        obj_char[5],
        obj_char[6]
    }
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_oroboros_pos_update(obj_char)
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
-- at_the_ready/reticle_basic_prop_update
function character_function_game_scene_TRM_shot_sys_at_the_ready_reticle_pos_update(
    self_side_obj_char,opponent_side_obj_char
)
    local self_side_obj_char_shot_sys_aim_process = self_side_obj_char["shot_sys_aim_process"]
    local self_side_div_value = 30 - math.min(
        self_side_obj_char_shot_sys_aim_process[1],self_side_obj_char_shot_sys_aim_process[3]
    )/15
    -- update_shot_sys_reticle_visual_offset
    self_side_obj_char["shot_sys_reticle_stage_pos_target"] = {
        opponent_side_obj_char["x"] - 160,
        opponent_side_obj_char["y"] -
        opponent_side_obj_char["shot_sys_reticle_height_offset"][opponent_side_obj_char["pushbox"][4]] - 160
    }
    self_side_obj_char["shot_sys_reticle_stage_pos_current"] = {
        (self_side_obj_char["shot_sys_reticle_stage_pos_current"][1]*(self_side_div_value - 1) +
        self_side_obj_char["shot_sys_reticle_stage_pos_target"][1])/
        self_side_div_value,
        (self_side_obj_char["shot_sys_reticle_stage_pos_current"][2]*(self_side_div_value - 1) +
        self_side_obj_char["shot_sys_reticle_stage_pos_target"][2])/
        self_side_div_value
    }
    self_side_obj_char["shot_sys_reticle"][1] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][1]
    self_side_obj_char["shot_sys_reticle"][2] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][2]
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_reticle_pos_update_ease_in(
    self_side_obj_char,opponent_side_obj_char
)
    if self_side_obj_char["shot_sys_aim_process"][1] < self_side_obj_char["shot_sys_aim_process"][3] then
        return
    end
    local self_side_obj_char_shot_sys_aim_process = self_side_obj_char["shot_sys_aim_process"]
    local self_side_div_value = 30 - math.min(
        self_side_obj_char_shot_sys_aim_process[1],self_side_obj_char_shot_sys_aim_process[3]
    )/15
    -- update_shot_sys_reticle_visual_offset
    self_side_obj_char["shot_sys_reticle_stage_pos_target"] = {
        opponent_side_obj_char["x"] - 160,
        opponent_side_obj_char["y"] -
        opponent_side_obj_char["shot_sys_reticle_height_offset"][opponent_side_obj_char["pushbox"][4]] - 160
    }
    self_side_obj_char["shot_sys_reticle_stage_pos_current"] = {
        (self_side_obj_char["shot_sys_reticle_stage_pos_current"][1]*(self_side_div_value - 1) +
        self_side_obj_char["shot_sys_reticle_stage_pos_target"][1])/
        self_side_div_value,
        (self_side_obj_char["shot_sys_reticle_stage_pos_current"][2]*(self_side_div_value - 1) +
        self_side_obj_char["shot_sys_reticle_stage_pos_target"][2])/
        self_side_div_value
    }
    self_side_obj_char["shot_sys_reticle"][1] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][1]
    self_side_obj_char["shot_sys_reticle"][2] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][2]
    return
end
-- common_function_of_shot_sys_at_the_steady
-- at_the_steady/ability_gauge_use
function character_function_game_scene_TRM_shot_sys_at_the_steady_ability_gauge_use(obj_char)
    local ability_gauge_cache = obj_char["ability_gauge"][1]
    ability_gauge_cache = ability_gauge_cache - 100
    ability_gauge_cache = math.ceil(ability_gauge_cache/100)*100
    obj_char["ability_gauge"][1] = math.max(0,ability_gauge_cache)
end
-- clean_hit & quick_aim update
function character_function_game_scene_TRM_shot_sys_at_the_steady_quick_aim_clean_hit_update(
    self_side_obj_char,opponent_side_obj_char
)
    local self_side_shot_sys_state_cache = self_side_obj_char["shot_sys_state"]
    local quick_clean_hit_from_all_state =
        (self_side_obj_char["shot_sys_at_the_steady_quick_clean_hit_state"][opponent_side_obj_char["state"]])
    local quick_clean_hit_from_at_the_ready_state =
        (self_side_obj_char["shot_sys_at_the_ready_state_table"][self_side_shot_sys_state_cache]) and
        (self_side_obj_char["shot_sys_at_the_steady_quick_clean_hit_from_at_the_ready_state"][opponent_side_obj_char["state"]] or
        self_side_obj_char["shot_sys_aim_process"][1] >= self_side_obj_char["shot_sys_aim_process"][3])
    local quick_clean_hit_cache =
        quick_clean_hit_from_all_state or quick_clean_hit_from_at_the_ready_state
    local quick_aim_cache = quick_clean_hit_cache or self_side_obj_char["shot_sys_curse"]
    -- shot_sys
    self_side_obj_char["shot_sys_at_the_steady_aim"] = false
    self_side_obj_char["shot_sys_at_the_steady_clean_hit"] = false
    self_side_obj_char["shot_sys_fire_cancel"] = false
    if quick_aim_cache then
        self_side_obj_char["shot_sys_at_the_steady_aim"] = true
        self_side_obj_char["shot_sys_aim_process"][1] = self_side_obj_char["shot_sys_aim_process"][4]
    end
    if quick_clean_hit_cache then
        self_side_obj_char["shot_sys_at_the_steady_clean_hit"] = true
    end
end
-- at_the_steady/reticle_basic_prop_update
function character_function_game_scene_TRM_shot_sys_at_the_steady_reticle_pos_update_lock(
    self_side_obj_char,opponent_side_obj_char
)
    local self_side_obj_char_shot_sys_at_the_steady_aim = self_side_obj_char["shot_sys_at_the_steady_aim"]
    local self_side_div_value = 4.75
    if self_side_obj_char_shot_sys_at_the_steady_aim then
        self_side_div_value = 1.25
    end
    -- update_shot_sys_reticle_visual_offset
    self_side_obj_char["shot_sys_reticle_stage_pos_target"] = {
        opponent_side_obj_char["x"] - 160,
        opponent_side_obj_char["y"] -
        opponent_side_obj_char["shot_sys_reticle_height_offset"][opponent_side_obj_char["pushbox"][4]] - 160
    }
    self_side_obj_char["shot_sys_reticle_stage_pos_current"] = {
        (self_side_obj_char["shot_sys_reticle_stage_pos_current"][1]*(self_side_div_value - 1) +
        self_side_obj_char["shot_sys_reticle_stage_pos_target"][1])/
        self_side_div_value,
        (self_side_obj_char["shot_sys_reticle_stage_pos_current"][2]*(self_side_div_value - 1) +
        self_side_obj_char["shot_sys_reticle_stage_pos_target"][2])/
        self_side_div_value
    }
    self_side_obj_char["shot_sys_reticle"][1] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][1]
    self_side_obj_char["shot_sys_reticle"][2] = self_side_obj_char["shot_sys_reticle_stage_pos_current"][2]
    return
end
-- employment_function
-- common
function character_function_game_scene_TRM_shot_sys_off_init(obj_char)
    -- hurt_state
    obj_char["hurt_state"] = obj_char["hurt_state_target"]
    -- shot_sys
    obj_char["shot_sys_fire_cancel"] = false
    obj_char["shot_sys_idle_cancel"] = false
    obj_char["shot_sys_state"] = "off"
    return
end
function character_function_game_scene_TRM_shot_sys_off_update(obj_char)
    -- hurt_state
    obj_char["hurt_state"] = obj_char["hurt_state_target"]
    return
end
-- at_the_ready
function character_function_game_scene_TRM_shot_sys_at_the_ready_ease_in_init(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    self_side_obj_char["shot_sys_animation"] =
    load_game_scene_anim_char_TRM_5H_shot_sys_at_the_ready_ease_in(
        self_side_obj_char,opponent_side_obj_char
    )
    init_character_anim_without(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    self_side_obj_char["shot_sys_aim_process"][1] = 0
    character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(
        self_side_obj_char,opponent_side_obj_char
    )
    self_side_obj_char["shot_sys_state"] = "at_the_ready_ease_in"
    -- shot_sys_oroboros
    self_side_obj_char["shot_sys_oroboros_aim_r"] = 0.42
    self_side_obj_char["shot_sys_oroboros_animation_table"][1] =
    load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_chain_ease_in(
        self_side_obj_char["shot_sys_oroboros_front"]
    )
    self_side_obj_char["shot_sys_oroboros_animation_table"][2] = 
    load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_chain_loop(
        self_side_obj_char["shot_sys_oroboros_front"],"5H_oroboros_loop_front"
    )
    self_side_obj_char["shot_sys_oroboros_animation_table"][3] = 
    load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_mid_ease(
        self_side_obj_char["shot_sys_oroboros_mid"],"5H_oroboros_ease_in_mid"
    )
    self_side_obj_char["shot_sys_oroboros_animation_table"][4] =
    load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_chain_ease_in(
        self_side_obj_char["shot_sys_oroboros_back"]
    )
    self_side_obj_char["shot_sys_oroboros_animation_table"][5] = 
    load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_chain_loop(
        self_side_obj_char["shot_sys_oroboros_back"],"5H_oroboros_loop_back"
    )
    init_character_anim_without(
        self_side_obj_char["shot_sys_oroboros_front"],self_side_obj_char["shot_sys_oroboros_animation_table"][1]
    )
    init_character_anim_without(
        self_side_obj_char["shot_sys_oroboros_front"],self_side_obj_char["shot_sys_oroboros_animation_table"][2]
    )
    init_character_anim_without(
        self_side_obj_char["shot_sys_oroboros_mid"],self_side_obj_char["shot_sys_oroboros_animation_table"][3]
    )
    init_character_anim_without(
        self_side_obj_char["shot_sys_oroboros_back"],self_side_obj_char["shot_sys_oroboros_animation_table"][4]
    )
    init_character_anim_without(
        self_side_obj_char["shot_sys_oroboros_back"],self_side_obj_char["shot_sys_oroboros_animation_table"][5]
    )
    character_function_game_scene_TRM_shot_sys_at_the_ready_oroboros_pos_init(self_side_obj_char)
    self_side_obj_char["shot_sys_oroboros_state"] = "ease_in"
    -- shot_sys_reticle
    self_side_obj_char["shot_sys_reticle"][4] = 0
    self_side_obj_char["shot_sys_reticle"][8] = 0
    self_side_obj_char["shot_sys_reticle_animation_table"][1] =
    load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_ease_in(self_side_obj_char)
    init_character_anim_without(
        self_side_obj_char,self_side_obj_char["shot_sys_reticle_animation_table"][1]
    )
    character_function_game_scene_TRM_shot_sys_init_new_reticle_pos(
        self_side_obj_char,opponent_side_obj_char,100
    )
    character_function_game_scene_TRM_shot_sys_at_the_ready_reticle_pos_update_ease_in(
        self_side_obj_char,opponent_side_obj_char
    )
    self_side_obj_char["shot_sys_reticle_state"] = "at_the_ready_ease_in"
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_ease_in_update(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    character_animator(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(
        self_side_obj_char,opponent_side_obj_char
    )
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_ease_out_init(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    -- shot_sys
    self_side_obj_char["shot_sys_animation"] =
    load_game_scene_anim_char_TRM_5H_shot_sys_at_the_ready_ease_out(
        self_side_obj_char,opponent_side_obj_char
    )
    init_character_anim_with(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    self_side_obj_char["shot_sys_aim_process"][1] = 0
    self_side_obj_char["shot_sys_state"] = "at_the_ready_ease_out"
    -- shot_sys_oroboros
    self_side_obj_char["shot_sys_oroboros_aim_r"] = 0.42
    self_side_obj_char["shot_sys_oroboros_offset_amount"] = 0
    self_side_obj_char["shot_sys_oroboros_animation_table"][1] =
    load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_chain_ease_out(
        self_side_obj_char["shot_sys_oroboros_front"]
    )
    self_side_obj_char["shot_sys_oroboros_animation_table"][3] =
    load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_mid_ease(
        self_side_obj_char["shot_sys_oroboros_mid"],"5H_oroboros_ease_out_mid"
    )
    self_side_obj_char["shot_sys_oroboros_animation_table"][4] =
    load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_chain_ease_out(
        self_side_obj_char["shot_sys_oroboros_back"]
    )
    init_character_anim_without(
        self_side_obj_char["shot_sys_oroboros_front"],self_side_obj_char["shot_sys_oroboros_animation_table"][1]
    )
    init_character_anim_without(
        self_side_obj_char["shot_sys_oroboros_mid"],self_side_obj_char["shot_sys_oroboros_animation_table"][3]
    )
    init_character_anim_without(
        self_side_obj_char["shot_sys_oroboros_back"],self_side_obj_char["shot_sys_oroboros_animation_table"][4]
    )
    character_function_game_scene_TRM_shot_sys_at_the_ready_oroboros_pos_update(self_side_obj_char)
    self_side_obj_char["shot_sys_oroboros_state"] = "ease_out"
    -- shot_sys_reticle
    self_side_obj_char["shot_sys_reticle_animation_table"][2] =
    load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_ease_out(self_side_obj_char)
    init_character_anim_without(
        self_side_obj_char,self_side_obj_char["shot_sys_reticle_animation_table"][2]
    )
    self_side_obj_char["shot_sys_reticle_state"] = "at_the_ready_ease_out"
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_ease_out_update(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    -- shot_sys
    character_animator(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_init(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    self_side_obj_char["shot_sys_state"] = "at_the_ready"
    -- 已经在ease_in阶段完成了当前帧数的aim_process
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_update(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    if self_side_obj_char["state"] ~= "hitstop" then
        self_side_obj_char["ability_gauge"][1] = math.max(0,self_side_obj_char["ability_gauge"][1] - 0.5)
    end
    character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(
        self_side_obj_char,opponent_side_obj_char
    )
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_shot_init(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    self_side_obj_char["shot_sys_animation"] =
    load_game_scene_anim_char_TRM_5H_shot_sys_at_the_ready_shot(
        self_side_obj_char,opponent_side_obj_char
    )
    init_character_anim_with(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    self_side_obj_char["shot_sys_state"] = "at_the_ready_shot"
    -- 已经在ease_in阶段完成了当前帧数的aim_process
    -- shot_sys_oroboros
    self_side_obj_char["shot_sys_oroboros_animation_table"][6] =
    load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_shot(self_side_obj_char)
    init_character_anim_without(
        self_side_obj_char,self_side_obj_char["shot_sys_oroboros_animation_table"][6]
    )
    character_function_game_scene_TRM_shot_sys_at_the_ready_oroboros_pos_update(self_side_obj_char)
    self_side_obj_char["shot_sys_oroboros_state"] = "shot"
    -- shot_sys_reticle
    self_side_obj_char["shot_sys_reticle_animation_table"][2] =
    load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_shot(self_side_obj_char)
    init_character_anim_with(
        self_side_obj_char,self_side_obj_char["shot_sys_reticle_animation_table"][2]
    )
    self_side_obj_char["shot_sys_reticle_state"] = "at_the_ready_shot"
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_ready_shot_update(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    character_animator(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    return
end
-- at_the_steady
function character_function_game_scene_TRM_shot_sys_at_the_steady_lock_init(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "counter"
    end
    -- shot_sys
    self_side_obj_char["shot_sys_animation"] =
    load_game_scene_anim_char_TRM_4SP_S_shot_sys_at_the_steady_lock(
        self_side_obj_char,opponent_side_obj_char
    )
    init_character_anim_without(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    character_function_game_scene_TRM_shot_sys_at_the_steady_quick_aim_clean_hit_update(
        self_side_obj_char,opponent_side_obj_char
    )
    self_side_obj_char["shot_sys_state"] = "at_the_steady_lock"
    -- shot_sys_oroboros
    if self_side_obj_char["shot_sys_oroboros_state"] == "off" then
        self_side_obj_char["shot_sys_oroboros_aim_r"] = 0.42
        self_side_obj_char["shot_sys_oroboros_animation_table"][1] =
        load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_chain_ease_in(
            self_side_obj_char["shot_sys_oroboros_front"]
        )
        self_side_obj_char["shot_sys_oroboros_animation_table"][2] =
        load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_chain_loop(
            self_side_obj_char["shot_sys_oroboros_front"],"5H_oroboros_loop_front"
        )
        self_side_obj_char["shot_sys_oroboros_animation_table"][3] = 
        load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_mid_ease(
            self_side_obj_char["shot_sys_oroboros_mid"],"5H_oroboros_ease_in_mid"
        )
        self_side_obj_char["shot_sys_oroboros_animation_table"][4] =
        load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_chain_ease_in(
            self_side_obj_char["shot_sys_oroboros_back"]
        )
        self_side_obj_char["shot_sys_oroboros_animation_table"][5] =
        load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_chain_loop(
            self_side_obj_char["shot_sys_oroboros_back"],"5H_oroboros_loop_back"
        )
        init_character_anim_without(
            self_side_obj_char["shot_sys_oroboros_front"],self_side_obj_char["shot_sys_oroboros_animation_table"][1]
        )
        init_character_anim_without(
            self_side_obj_char["shot_sys_oroboros_front"],self_side_obj_char["shot_sys_oroboros_animation_table"][2]
        )
        init_character_anim_without(
            self_side_obj_char["shot_sys_oroboros_mid"],self_side_obj_char["shot_sys_oroboros_animation_table"][3]
        )
        init_character_anim_without(
            self_side_obj_char["shot_sys_oroboros_back"],self_side_obj_char["shot_sys_oroboros_animation_table"][4]
        )
        init_character_anim_without(
            self_side_obj_char["shot_sys_oroboros_back"],self_side_obj_char["shot_sys_oroboros_animation_table"][5]
        )
        character_function_game_scene_TRM_shot_sys_at_the_ready_oroboros_pos_init(self_side_obj_char)
        self_side_obj_char["shot_sys_oroboros_state"] = "ease_in"
    end
    -- shot_sys_reticle
    self_side_obj_char["shot_sys_reticle_animation_table"][1] =
    load_game_scene_anim_char_TRM_4SP_S_reticle_at_the_steady_lock(self_side_obj_char)
    init_character_anim_without(
        self_side_obj_char,self_side_obj_char["shot_sys_reticle_animation_table"][1]
    )
    if self_side_obj_char["shot_sys_reticle_state"] == "off" then
        character_function_game_scene_TRM_shot_sys_init_new_reticle_pos(
            self_side_obj_char,opponent_side_obj_char,800
        )
    end
    character_function_game_scene_TRM_shot_sys_at_the_steady_reticle_pos_update_lock(
        self_side_obj_char,opponent_side_obj_char
    )
    self_side_obj_char["shot_sys_reticle_state"] = "at_the_steady_lock"
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_steady_lock_update(
    self_side_obj_char,opponent_side_obj_char
)
    local ability_cost = 7.5
    if self_side_obj_char["shot_sys_scapegoat_exist"] then
        ability_cost = 2.5
    end
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    -- shot_sys
    if self_side_obj_char["state"] ~= "hitstop" then
        self_side_obj_char["ability_gauge"][1] = math.max(0,self_side_obj_char["ability_gauge"][1] - ability_cost)
    end
    character_animator(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_steady_lock_to_off_init(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    -- shot_sys
    self_side_obj_char["shot_sys_animation"] =
    load_game_scene_anim_char_TRM_4SP_S_shot_sys_at_the_steady_lock_to_off(
        self_side_obj_char,opponent_side_obj_char
    )
    init_character_anim_without(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    self_side_obj_char["shot_sys_aim_process"][1] = 0
    self_side_obj_char["shot_sys_state"] = "at_the_steady_lock_to_off"
    -- shot_sys_oroboros
    self_side_obj_char["shot_sys_oroboros_aim_r"] = 0.42
    self_side_obj_char["shot_sys_oroboros_offset_amount"] = 0
    self_side_obj_char["shot_sys_oroboros_animation_table"][1] =
    load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_chain_ease_out(
        self_side_obj_char["shot_sys_oroboros_front"]
    )
    self_side_obj_char["shot_sys_oroboros_animation_table"][3] =
    load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_mid_ease(
        self_side_obj_char["shot_sys_oroboros_mid"],"5H_oroboros_ease_out_mid"
    )
    self_side_obj_char["shot_sys_oroboros_animation_table"][4] =
    load_game_scene_anim_char_TRM_5H_oroboros_at_the_ready_chain_ease_out(
        self_side_obj_char["shot_sys_oroboros_back"]
    )
    init_character_anim_without(
        self_side_obj_char["shot_sys_oroboros_front"],self_side_obj_char["shot_sys_oroboros_animation_table"][1]
    )
    init_character_anim_without(
        self_side_obj_char["shot_sys_oroboros_mid"],self_side_obj_char["shot_sys_oroboros_animation_table"][3]
    )
    init_character_anim_without(
        self_side_obj_char["shot_sys_oroboros_back"],self_side_obj_char["shot_sys_oroboros_animation_table"][4]
    )
    character_function_game_scene_TRM_shot_sys_at_the_ready_oroboros_pos_update(self_side_obj_char)
    self_side_obj_char["shot_sys_oroboros_state"] = "ease_out"
    -- shot_sys_reticle
    self_side_obj_char["shot_sys_reticle_animation_table"][1] =
    load_game_scene_anim_char_TRM_4SP_S_reticle_at_the_steady_lock_to_off(self_side_obj_char)
    init_character_anim_without(
        self_side_obj_char,self_side_obj_char["shot_sys_reticle_animation_table"][1]
    )
    self_side_obj_char["shot_sys_reticle_state"] = "at_the_steady_lock_to_off"
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_steady_lock_to_off_update(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    -- shot_sys
    character_animator(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_steady_lock_to_ready_init(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    self_side_obj_char["shot_sys_animation"] = 
    load_game_scene_anim_char_TRM_4SP_S_shot_sys_at_the_steady_lock_to_ready(
        self_side_obj_char,opponent_side_obj_char
    )
    init_character_anim_without(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    self_side_obj_char["shot_sys_aim_process"][1] = 0
    if self_side_obj_char["shot_sys_at_the_steady_aim"] then
        self_side_obj_char["shot_sys_aim_process"][1] = self_side_obj_char["shot_sys_aim_process"][3]/2
    end
    character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(
        self_side_obj_char,opponent_side_obj_char
    )
    self_side_obj_char["shot_sys_state"] = "at_the_steady_lock_to_ready"
    -- shot_sys_reticle
    self_side_obj_char["shot_sys_reticle"][4] = 1
    self_side_obj_char["shot_sys_reticle"][8] = 0
    self_side_obj_char["shot_sys_reticle_animation_table"][1] =
        load_game_scene_anim_char_TRM_5H_reticle_at_the_ready_ease_in(self_side_obj_char)
    self_side_obj_char["shot_sys_reticle_animation_table"][2] =
        load_game_scene_anim_char_TRM_4SP_S_reticle_at_the_steady_lock_to_ready(self_side_obj_char)
    init_character_anim_without(
        self_side_obj_char,self_side_obj_char["shot_sys_reticle_animation_table"][1]
    )
    init_character_anim_without(
        self_side_obj_char,self_side_obj_char["shot_sys_reticle_animation_table"][2]
    )
    self_side_obj_char["shot_sys_reticle_f_4"] = 12
    character_function_game_scene_TRM_shot_sys_at_the_ready_reticle_pos_update_ease_in(
        self_side_obj_char,opponent_side_obj_char
    )
    self_side_obj_char["shot_sys_reticle_state"] = "at_the_steady_lock_to_ready"
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_steady_lock_to_ready_update(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    character_animator(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    character_function_game_scene_TRM_shot_sys_at_the_ready_aim_process_update(
        self_side_obj_char,opponent_side_obj_char
    )
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_steady_shot_init(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    if self_side_obj_char["hurt_state"] == "idle" then
        self_side_obj_char["hurt_state"] = "unblock"
    end
    -- shot_sys
    character_function_game_scene_TRM_shot_sys_at_the_steady_ability_gauge_use(self_side_obj_char)
    self_side_obj_char["shot_sys_animation"] =
    load_game_scene_anim_char_TRM_4SP_S_shot_sys_at_the_steady_shot(
        self_side_obj_char,opponent_side_obj_char
    )
    init_character_anim_with(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    self_side_obj_char["shot_sys_state"] = "at_the_steady_shot"
    -- 已经在ease_in阶段完成了当前帧数的aim_process
    -- shot_sys_oroboros
    self_side_obj_char["shot_sys_oroboros_animation_table"][6] =
    load_game_scene_anim_char_TRM_4SP_S_oroboros_at_the_steady_shot(self_side_obj_char)
    init_character_anim_without(
        self_side_obj_char,self_side_obj_char["shot_sys_oroboros_animation_table"][6]
    )
    character_function_game_scene_TRM_shot_sys_at_the_ready_oroboros_pos_update(self_side_obj_char)
    self_side_obj_char["shot_sys_oroboros_state"] = "shot"
    -- shot_sys_reticle
    self_side_obj_char["shot_sys_reticle_animation_table"][2] =
    load_game_scene_anim_char_TRM_4SP_S_reticle_at_the_steady_shot(self_side_obj_char)
    init_character_anim_with(
        self_side_obj_char,self_side_obj_char["shot_sys_reticle_animation_table"][2]
    )
    self_side_obj_char["shot_sys_reticle_state"] = "at_the_steady_shot"
    return
end
function character_function_game_scene_TRM_shot_sys_at_the_steady_shot_update(
    self_side_obj_char,opponent_side_obj_char
)
    -- hurt_state
    self_side_obj_char["hurt_state"] = self_side_obj_char["hurt_state_target"]
    -- shot_sys
    character_animator(
        self_side_obj_char,self_side_obj_char["shot_sys_animation"]
    )
    return
end
-- drive_sys
function character_function_game_scene_TRM_drive_sys_off_init(obj_char)
    -- state
    obj_char["drive_sys_state"] = "off"
    obj_char["drive_sys_f"] = 0
    obj_char["drive_sys_timer"] = 0
    obj_char["drive_sys_projectile"] = nil
    return
end
function character_function_game_scene_TRM_drive_sys_start_pos(obj_char)
    local anchor_pos = obj_char["shot_sys_oroboros_anchor_pos"]
    return {
        obj_char["x"] + obj_char[5]*anchor_pos[1],
        obj_char["y"] + obj_char[6]*anchor_pos[2]
    }
end
function character_function_game_scene_TRM_drive_sys_end_pos(obj_char,start_pos)
    local direction_input = obj_char["direction_input"]
    local chain_angle_table = {
        [5] = 0,
        [6] = 0,
        [9] = -math.pi/4,
        [3] = math.pi/4,
        [8] = -math.pi/2,
        [2] = math.pi/2,
        [7] = -math.pi*3/4,
        [1] = math.pi*3/4,
        [4] = math.pi
    }
    local chain_length_table = {
        [5] = 700,
        [6] = 700,
        [9] = 560,
        [3] = 560,
        [8] = 460,
        [2] = 460,
        [7] = 560,
        [1] = 560,
        [4] = 620
    }
    local chain_angle = chain_angle_table[direction_input] or 0
    local chain_length = chain_length_table[direction_input] or 700
    if obj_char[5] < 0 then
        chain_angle = math.pi - chain_angle
    end
    return {
        start_pos[1] + math.cos(chain_angle)*chain_length,
        start_pos[2] + math.sin(chain_angle)*chain_length
    }
end
function character_function_game_scene_TRM_drive_sys_bite_hit_init(obj_char)
    -- state
    obj_char["drive_sys_state"] = "bite_hit"
    obj_char["drive_sys_f"] = 0
    obj_char["drive_sys_timer"] = 0
    return
end
function character_function_game_scene_TRM_drive_sys_bite_miss_init(obj_char)
    -- state
    obj_char["drive_sys_state"] = "bite_miss"
    obj_char["drive_sys_f"] = 0
    obj_char["drive_sys_timer"] = 0
    return
end
function character_function_game_scene_TRM_drive_sys_pull_back_init(obj_char)
    -- state
    obj_char["drive_sys_state"] = "pull_back"
    obj_char["drive_sys_f"] = 0
    obj_char["drive_sys_timer"] = 0
    return
end
function character_function_game_scene_TRM_drive_sys_on_fly_init(
    obj_char,opponent_obj_char,start_pos,end_pos
)
    -- state
    obj_char["drive_sys_state"] = "on_fly"
    obj_char["drive_sys_f"] = 1
    obj_char["drive_sys_timer"] = 0
    -- draw_correction
    obj_char["drive_sys_chain_link_scale"] = 0.72
    obj_char["drive_sys_chain_head_scale"] = 1.00
    obj_char["drive_sys_chain_fade_length"] = 240
    -- insert_projectile
    obj_char["drive_sys_projectile"] = insert_projectile_game_scene_char_TRM_SP_H_chain(
        obj_char,opponent_obj_char,start_pos,end_pos
    )
    return
end
-- state_machine
function character_function_game_scene_TRM_drive_sys_state_machine(
    self_side_obj_char,opponent_side_obj_char
)
    -- state
    local drive_sys_state = self_side_obj_char["drive_sys_state"] or "off"
    local obj_projectile = self_side_obj_char["drive_sys_projectile"]
    -- state_machine
    local switch =
    {
        ["off"] = function()
            return
        end,
        ["on_fly"] = function()
            -- state_number
            self_side_obj_char["drive_sys_timer"] = self_side_obj_char["drive_sys_timer"] + 1
            if not obj_projectile then
                character_function_game_scene_TRM_drive_sys_off_init(self_side_obj_char)
                return
            end
            -- bite_hit
            if obj_projectile["chain_hitted"] then
                character_function_game_scene_TRM_drive_sys_bite_hit_init(self_side_obj_char)
                return
            end
            -- bite_miss
            if obj_projectile["chain_elapsed"] >= obj_projectile["chain_extend_frames"] then
                character_function_game_scene_TRM_drive_sys_bite_miss_init(self_side_obj_char)
                return
            end
        end,
        ["bite_hit"] = function()
            -- state_number
            self_side_obj_char["drive_sys_timer"] = self_side_obj_char["drive_sys_timer"] + 1
            -- off
            if (not obj_projectile) or obj_projectile["chain_length"] <= 0 then
                character_function_game_scene_TRM_drive_sys_off_init(self_side_obj_char)
                return
            end
        end,
        ["bite_miss"] = function()
            -- state_number
            self_side_obj_char["drive_sys_timer"] = self_side_obj_char["drive_sys_timer"] + 1
            -- pull_back
            if obj_projectile and obj_projectile["chain_retract_from"] then
                character_function_game_scene_TRM_drive_sys_pull_back_init(self_side_obj_char)
                return
            end
            -- off
            if (not obj_projectile) or obj_projectile["chain_length"] <= 0 then
                character_function_game_scene_TRM_drive_sys_off_init(self_side_obj_char)
                return
            end
        end,
        ["pull_back"] = function()
            -- state_number
            self_side_obj_char["drive_sys_timer"] = self_side_obj_char["drive_sys_timer"] + 1
            -- off
            if (not obj_projectile) or obj_projectile["chain_length"] <= 0 then
                character_function_game_scene_TRM_drive_sys_off_init(self_side_obj_char)
                return
            end
        end
    }
    local this_function = switch[drive_sys_state]
    if this_function then this_function() end
    return
end
-- 绘制：几何全部读飞行道具，drive_sys 只负责画
function character_function_game_scene_TRM_drive_sys_draw(
    obj_char,image_sprite_sheet_table,obj_camera
)
    local drive_sys_state = obj_char["drive_sys_state"] or "off"
    if drive_sys_state == "off" then
        return
    end
    local obj_projectile = obj_char["drive_sys_projectile"]
    if not obj_projectile then
        return
    end
    local length = obj_projectile["chain_length"]
    if length <= 1 then
        return
    end
    local z = obj_projectile[3]
    local depth_scale = draw_resolution_correction(800)/(z - obj_camera[3])
    local origin_x = obj_projectile["x"]
    local origin_y = obj_projectile["y"]
    local angle = obj_projectile["chain_angle"]
    local dir_x = math.cos(angle)
    local dir_y = math.sin(angle)
    -- chain_link
    local chain_sheet = image_sprite_sheet_table["SP_H_chain_projectile"]
    local chain_frame = chain_sheet["frames"]["0"]
    local chain_quad = love.graphics.newQuad(
        chain_frame[1],chain_frame[2],chain_frame[3],chain_frame[4],chain_frame[5],chain_frame[6]
    )
    local link_scale = obj_char["drive_sys_chain_link_scale"]*depth_scale
    local link_world_length = chain_frame[3]*obj_char["drive_sys_chain_link_scale"]
    local link_count = math.max(1,math.ceil(length/link_world_length))
    local link_spacing = length/link_count
    chain_sheet["sprite_batch"]:clear()
    for i = 0,link_count - 1 do
        local distance = (i + 0.5)*link_spacing
        local link_screen = draw_3d_point_to_2D(
            obj_camera,{origin_x + dir_x*distance,origin_y + dir_y*distance,z}
        )
        chain_sheet["sprite_batch"]:add(
            chain_quad,link_screen[1],link_screen[2],angle,
            link_scale,link_scale,chain_frame[3]/2,chain_frame[4]/2
        )
    end
    -- 起始端线性渐变（shader）
    if not shader_game_scene_drive_chain_fade then
        shader_game_scene_drive_chain_fade = love.graphics.newShader("shaders/drive_chain_fade.glsl")
    end
    local shader = shader_game_scene_drive_chain_fade
    local chain_start_screen = draw_3d_point_to_2D(obj_camera,{origin_x,origin_y,z})
    shader:send("chain_start",{chain_start_screen[1],chain_start_screen[2]})
    shader:send("chain_dir",{dir_x,dir_y})
    shader:send("fade_length",obj_char["drive_sys_chain_fade_length"]*depth_scale)
    love.graphics.setShader(shader)
    love.graphics.draw(chain_sheet["sprite_batch"])
    love.graphics.setShader()
    -- oroboros_head
    local head_sheet = image_sprite_sheet_table["SP_H_oroboros_projectile"]
    local head_frame = head_sheet["frames"][tostring(obj_char["drive_sys_f"])]
    local head_screen = draw_3d_point_to_2D(
        obj_camera,{origin_x + dir_x*length,origin_y + dir_y*length,z}
    )
    local head_scale = obj_char["drive_sys_chain_head_scale"]*depth_scale
    local head_angle = angle
    local head_scale_x = head_scale
    if dir_x < 0 then
        head_angle = angle + math.pi
        head_scale_x = -head_scale
    end
    local head_quad = love.graphics.newQuad(
        head_frame[1],head_frame[2],head_frame[3],head_frame[4],head_frame[5],head_frame[6]
    )
    head_sheet["sprite_batch"]:clear()
    head_sheet["sprite_batch"]:add(
        head_quad,head_screen[1],head_screen[2],head_angle,
        head_scale_x,head_scale,head_frame[3]/2,head_frame[4]/2
    )
    love.graphics.draw(head_sheet["sprite_batch"])
    return
end

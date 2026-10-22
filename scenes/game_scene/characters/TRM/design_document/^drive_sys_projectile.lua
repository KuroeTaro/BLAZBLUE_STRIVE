-- insert_projectile_game_scene_char_TRM_SP_H_chain
-- 链子飞行道具：只负责位置推进与伤害判定（命中盒 / 受击 / 伤害）
-- 绘制全部交给 drive_sys，这里 draw 是空的
function insert_projectile_game_scene_char_TRM_SP_H_chain(
    hit_side_obj_char,hurt_side_obj_char,start_pos,end_pos
)
    -- x_y_z_opacity_sx_sy_r_f
    local obj_projectile = {start_pos[1],start_pos[2],hit_side_obj_char[3],1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    -- chain_geometry
    local chain_delta_x = end_pos[1] - start_pos[1]
    local chain_delta_y = end_pos[2] - start_pos[2]
    local chain_distance = math.sqrt(chain_delta_x*chain_delta_x + chain_delta_y*chain_delta_y)
    -- common
    obj_projectile["type"] = "projectile"
    obj_projectile["life"] = 41
    obj_projectile["x"] = start_pos[1]
    obj_projectile["y"] = start_pos[2]
    obj_projectile["velocity"] = {0,0}
    obj_projectile["projectile_clash_type"] = 0 -- -1: 只要接触双方同时必然消失 0: 不与其他飞道交互 1-3：飞行道具等级
    obj_projectile["f"] = 0
    obj_projectile["sprite_sheet"] = "SP_H_oroboros_projectile"
    -- chain
    obj_projectile["chain_angle"] = math.atan2(chain_delta_y,chain_delta_x)
    obj_projectile["chain_max_length"] = chain_distance
    obj_projectile["chain_length"] = 0
    obj_projectile["chain_extend_frames"] = 12
    obj_projectile["chain_hold_frames"] = 18
    obj_projectile["chain_retract_frames"] = 10
    obj_projectile["chain_elapsed"] = 0
    obj_projectile["chain_hitted"] = false
    obj_projectile["chain_retract_from"] = nil
    obj_projectile["chain_hitbox_pad"] = 60
    -- enemy_interact_function
    obj_projectile["hitbox_table"] = {}
    obj_projectile["hit_type"] = "strike"
    obj_projectile["hit_guard_type"] = "all"
    obj_projectile["hit_hurt_blockstop_countdown"] = 12
    obj_projectile["hit_damage"] = 250.0
    obj_projectile["hit_damage_correction_factor"] = 0.9
    obj_projectile["hit_heat_gain"] = 5.0
    obj_projectile["hit_wallbreak_damage"] = 20.0
    obj_projectile["hurt_heat_gain"] = 2.0
    obj_projectile["blocked_heat_gain"] = 8.0
    obj_projectile["block_heat_gain"] = 2.0
    obj_projectile["block_risk_gauge_gain"] = 25.0
    obj_projectile["FD_block_heat_drain"] = 5.0
    obj_projectile["stand_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,"0_stand_hurt_high","stand","5_stand_idle",
        8,5,1.00,0,2.5,1.00,
        nil,nil,nil,nil,false,"character",function() end
    )
    obj_projectile["stand_block_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_block(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,"4_stand_block_high","stand","5_stand_idle",
        8,5,1.00,0,2.5,1.00,
        nil,nil,nil,nil,false,"character",function() end
    )
    obj_projectile["crouch_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,"0_crouch_hurt","crouch","1_2_3_crouch",
        8,5,1.00,0,2.5,1.00,
        nil,nil,nil,nil,false,"character",function() end
    )
    obj_projectile["crouch_block_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_ground_block(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,"1_crouch_block","crouch","1_2_3_crouch",
        8,5,1.00,0,2.5,1.00,
        nil,nil,nil,nil,false,"character",function() end
    )
    obj_projectile["air_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,"0_general_hurt_launched_high","air","knockdown_recovery",
        17.5,5,1.035,-25,2.5,1.035,
        nil,
        load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
            hit_side_obj_char,hurt_side_obj_char,"0_general_hurt_soft_recovery_ground","stand","5_stand_idle",
            nil,nil,nil,nil,nil,nil,
            nil,nil,nil,nil,function() end
        ),
        nil,nil,false,"character",function() end
    )
    obj_projectile["air_block_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_block(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,"1_4_7_air_block","air","5_stand_idle",
        12.5,5,1.00,-7.5,12.5,1.00,
        nil,nil,nil,nil,false,"character",function() end
    )
    obj_projectile["OTG_hurt_animation"] = load_game_scene_anim_char_TRM_5H_at_the_ready_projectile_air_and_OTG_hurt(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,"0_general_hurt_launched_high","air","knockdown_recovery",
        20,5,1.035,-6.25,2.5,1.035,
        nil,
        load_game_scene_anim_char_common_0_general_hurt_soft_recovery_ground(
            hit_side_obj_char,hurt_side_obj_char,"0_general_hurt_soft_recovery_ground","stand","5_stand_idle",
            nil,nil,nil,nil,nil,nil,
            nil,nil,nil,nil,function() end
        ),
        nil,nil,false,"character",function() end
    )
    obj_projectile["wallstick_hurt_animation"] = load_game_scene_anim_char_common_0_general_hurt_wallbreak(
        hit_side_obj_char,hurt_side_obj_char,obj_projectile,true
    )
    obj_projectile["projectile_active"] = false
    obj_projectile["projectile_counter_ver_function"] = common_game_scene_counter_ver0
    obj_projectile["hit_SFX"] = hit_side_move_SFX_table["5H_projectile_hit"]
    obj_projectile["hit_block_SFX"] = hit_side_move_SFX_table["5H_projectile_block"]
    obj_projectile["hit_counter_SFX"] = hit_side_move_SFX_table["5H_projectile_counter"]
    obj_projectile["hurt_block_VFX_insert_function"] = insert_VFX_game_scene_char_block_ver1
    obj_projectile["enemy_interact_function"] = function()
        if collision_projectile_hit_confirm_test(obj_projectile,hurt_side_obj_char) then
            -- projectile_active
            obj_projectile["projectile_active"] = false
            obj_projectile["chain_hitted"] = true
            -- block_test
            local hurt_side_block_bool = common_game_scene_block_test(obj_projectile,hurt_side_obj_char)
            -- risk_gauge
            if hurt_side_obj_char["risk_gauge"][1] >= hurt_side_obj_char["risk_gauge"][2] and
            (not hurt_side_block_bool) then
                hurt_side_obj_char["hurt_state"] = "counter"
            end
            -- counter
            if hurt_side_obj_char["hurt_state"] == "counter" then
                -- state_number
                obj_projectile["hit_damage"] = obj_projectile["hit_damage"]*1.1
                -- insert_VFX
                insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_hit_blast(
                    hit_side_obj_char,hurt_side_obj_char
                )
                -- play_SFX
                play_obj_audio(obj_projectile["hit_counter_SFX"])
            -- hit
            elseif not hurt_side_block_bool then
                insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_hit_blast(
                    hit_side_obj_char,hurt_side_obj_char
                )
                play_obj_audio(obj_projectile["hit_SFX"])
            -- block
            else
                insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_hit_blast(
                    hit_side_obj_char,hurt_side_obj_char
                )
                play_obj_audio(obj_projectile["hit_block_SFX"])
            end
            -- common_hurt_function
            common_game_scene_projectile_hurt_function(hit_side_obj_char,hurt_side_obj_char,obj_projectile)
        end
    end
    -- friendly_interact_function_nil
    -- friction_update_function_nil
    -- gravity_update_function_nil
    -- animation
    obj_projectile["projectile_animation"] = nil
    -- camera_animation
    obj_projectile["camera_x_shake_anim"],obj_projectile["camera_y_shake_anim"] =
    common_game_scene_hit_load_camera_shake_anim(0.25,15)
    obj_projectile["camera_enclosing_anim"] = common_game_scene_nil_load_camera_enclose_anim()
    obj_projectile["enclose_position_offset"] = nil
    -- update
    obj_projectile["update"] = function()
        -- 伸展 -> 保持 -> 收回
        local elapsed = obj_projectile["chain_elapsed"]
        local extend_frames = obj_projectile["chain_extend_frames"]
        local hold_frames = obj_projectile["chain_hold_frames"]
        local retract_frames = obj_projectile["chain_retract_frames"]
        local max_length = obj_projectile["chain_max_length"]
        -- 命中后立刻从命中点开始收回
        if obj_projectile["chain_hitted"] and elapsed < extend_frames + hold_frames then
            obj_projectile["chain_elapsed"] = extend_frames + hold_frames
            elapsed = obj_projectile["chain_elapsed"]
        end
        local length = 0
        local hitbox_active = false
        if elapsed < extend_frames then
            length = max_length*(elapsed + 1)/extend_frames
            hitbox_active = true
        elseif elapsed < extend_frames + hold_frames then
            length = max_length
            hitbox_active = true
        else
            if not obj_projectile["chain_retract_from"] then
                obj_projectile["chain_retract_from"] = obj_projectile["chain_length"]
            end
            local retract_elapsed = elapsed - extend_frames - hold_frames
            length = obj_projectile["chain_retract_from"]*
            math.max(0,1 - (retract_elapsed + 1)/retract_frames)
        end
        if obj_projectile["chain_hitted"] then
            hitbox_active = false
        end
        obj_projectile["chain_length"] = length
        obj_projectile["projectile_active"] = hitbox_active
        -- 判定盒：整条链的轴对齐包围盒（不同角度长宽不同，比原版宽松）
        local pad = obj_projectile["chain_hitbox_pad"]
        local dx = math.cos(obj_projectile["chain_angle"])*length
        local dy = math.sin(obj_projectile["chain_angle"])*length
        local box_left = math.min(0,dx) - pad
        local box_right = math.max(0,dx) + pad
        local box_top = math.min(0,dy) - pad
        local box_bottom = math.max(0,dy) + pad
        obj_projectile["hitbox_table"] = {{
            (box_left + box_right)/2,(box_top + box_bottom)/2,
            box_right - box_left,box_bottom - box_top
        }}
        obj_projectile["chain_elapsed"] = obj_projectile["chain_elapsed"] + 1
        obj_projectile["life"] = obj_projectile["life"] - 1
    end
    -- update_sub_frame
    obj_projectile["update_sub_frame"] = function()
        -- 链子发射后固定在世界坐标
    end
    -- draw（由 drive_sys 负责绘制）
    obj_projectile["draw"] = function()
        return
    end
    -- insert_projectile
    table.insert(hit_side_obj_char["projectile_front_table"],obj_projectile)
    return obj_projectile
end

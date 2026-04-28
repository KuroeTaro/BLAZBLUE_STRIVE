function update_game_scene_training_before_ease_in()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_game_scene_movie_cover_loop(obj_UI_game_scene_movie_cover)

    -- 状态出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        init_point_linear_anim_with(
            obj_UI_game_scene_black_solid,
            anim_UI_point_linear_game_scene_solid_ease_out_opacity_1_0
        )
        if TRAINING_MODE_CONFIG["announcer"] == false then
            current_update_block = update_game_scene_training_black_solid_ease_in
            common_game_scene_toggle_dynamic_HUD(1)
        else
            current_update_block = update_game_scene_training_annoucer_ease_in
            common_game_scene_toggle_ease_in(1)
            play_obj_audio(audio_SFX_game_scene_annoucer_ease_in)
        end
    end
end
function update_game_scene_training_black_solid_ease_in()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_game_scene_movie_cover_loop(obj_UI_game_scene_movie_cover)

    update_game_scene_char()
    
    point_linear_animator(
        obj_UI_game_scene_black_solid,
        anim_UI_point_linear_game_scene_solid_ease_out_opacity_1_0
    )
    -- 状态出口
    if SCENE_TIMER >= 5 
    and get_point_linear_anim_end_state(
        obj_UI_game_scene_black_solid,
        anim_UI_point_linear_game_scene_solid_ease_out_opacity_1_0
    )
    then
        SCENE_TIMER = 0
        current_update_block = update_game_scene_training_main
        obj_char_game_scene_char_LP["state"] = "5_stand_idle"
        obj_char_game_scene_char_RP["state"] = "5_stand_idle"
    end
end
function update_game_scene_training_annoucer_ease_in()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_game_scene_movie_cover_loop(obj_UI_game_scene_movie_cover)

    update_game_scene_char()

    if SCENE_TIMER <= 5 then
        point_linear_animator(
            obj_UI_game_scene_black_solid,
            anim_UI_point_linear_game_scene_solid_ease_out_opacity_1_0
        )
        state_machine_UI_game_scene_HUD_ACT_common(obj_annoucer_game_scene_act_common,105)
    elseif SCENE_TIMER <= 30 then
        state_machine_UI_game_scene_HUD_ACT_common(obj_annoucer_game_scene_act_common,105)
    elseif SCENE_TIMER < 105 then
        state_machine_UI_game_scene_HUD_ACT_common(obj_annoucer_game_scene_act_common,105)
        state_machine_UI_game_scene_HUD_ACT_common(obj_annoucer_game_scene_act_num,75)
    elseif SCENE_TIMER == 105 then
        obj_annoucer_game_scene_act_common[4] = 0
        obj_annoucer_game_scene_act_num[4] = 0
        obj_HUD_game_scene_timer[4] = 0
        init_point_linear_anim_with(
            obj_HUD_game_scene_timer,
            anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1
        )
    elseif SCENE_TIMER <= 115 then
        -- do nothing
    elseif SCENE_TIMER < 135 then
        state_machine_UI_game_scene_HUD_ACT_common(obj_HUD_game_scene_ease_in,50)
        point_linear_animator(
            obj_HUD_game_scene_timer,
            anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1
        )
    elseif SCENE_TIMER == 160 then
        -- input_sys save
        obj_char_game_scene_char_LP["input_sys_state"] = "save" -- none save load
        init_input_sys_cache_LP(obj_char_game_scene_char_LP)

        obj_char_game_scene_char_RP["input_sys_state"] = "save" -- none save load
        init_input_sys_cache_RP(obj_char_game_scene_char_RP)
    elseif SCENE_TIMER < 165 then
        state_machine_UI_game_scene_HUD_ACT_common(obj_HUD_game_scene_ease_in,50)
        state_machine_UI_game_scene_HUD_ACT_common(obj_annoucer_game_scene_lets_dance,40)
        state_machine_char_game_scene_char_LP_input_sys_cache()
        state_machine_char_game_scene_char_RP_input_sys_cache()
        state_machine_char_game_scene_char_LP_input_sys_cache_negative_edge()
        state_machine_char_game_scene_char_RP_input_sys_cache_negative_edge()
    elseif SCENE_TIMER == 165 then
        state_machine_UI_game_scene_HUD_ACT_common(obj_annoucer_game_scene_lets_dance,40)
        state_machine_char_game_scene_char_LP_input_sys_cache()
        state_machine_char_game_scene_char_RP_input_sys_cache()
        state_machine_char_game_scene_char_LP_input_sys_cache_negative_edge()
        state_machine_char_game_scene_char_RP_input_sys_cache_negative_edge()
    elseif SCENE_TIMER < 175 then
        state_machine_UI_game_scene_HUD_ACT_common(obj_annoucer_game_scene_lets_dance,40)
        state_machine_char_game_scene_char_LP_input_sys_cache()
        state_machine_char_game_scene_char_RP_input_sys_cache()
        state_machine_char_game_scene_char_LP_input_sys_cache_negative_edge()
        state_machine_char_game_scene_char_RP_input_sys_cache_negative_edge()
    elseif SCENE_TIMER == 175 then
        obj_annoucer_game_scene_lets_dance[4] = 0
        state_machine_char_game_scene_char_LP_input_sys_cache()
        state_machine_char_game_scene_char_RP_input_sys_cache()
        state_machine_char_game_scene_char_LP_input_sys_cache_negative_edge()
        state_machine_char_game_scene_char_RP_input_sys_cache_negative_edge()
    elseif SCENE_TIMER < 180 then
        state_machine_char_game_scene_char_LP_input_sys_cache()
        state_machine_char_game_scene_char_RP_input_sys_cache()
        state_machine_char_game_scene_char_LP_input_sys_cache_negative_edge()
        state_machine_char_game_scene_char_RP_input_sys_cache_negative_edge()
    elseif SCENE_TIMER == 180 then
        SCENE_TIMER = 0
        -- 改变char_LP RP的状态到可运行
        current_update_block = update_game_scene_training_main
        obj_char_game_scene_char_LP["state"] = "5_stand_idle"
        obj_char_game_scene_char_RP["state"] = "5_stand_idle"

        state_machine_char_game_scene_char_LP_input_sys_cache()
        state_machine_char_game_scene_char_RP_input_sys_cache()
        state_machine_char_game_scene_char_LP_input_sys_cache_negative_edge()
        state_machine_char_game_scene_char_RP_input_sys_cache_negative_edge()

        common_game_scene_toggle_dynamic_HUD(1)
        common_game_scene_toggle_ease_in(0)
    end
end
function update_game_scene_training_main()
    -- 获得输入 更新角色 状态 速度 和 碰撞盒
    -- 更新VFX
    -- loop * 16
        -- 角色更新位置 1/16
        -- 飞行道具更新位置 1/16
        -- 检测pushbox 更新Y位置
        -- 检测pushbox 更新X位置 static_relocate_x
        -- 检测pushbox 更新X位置 dynamic_relocate_x
        -- 检测打击受击盒 
            -- 如果命中 更新角色 状态 速度 和 碰撞盒 跳出loop
    -- 检测pushbox 更新Y位置
    -- 检测pushbox 更新X位置 static_relocate_x
    -- 检测pushbox 更新X位置 dynamic_relocate_x

    -- 删除已经命中的飞行道具

        -- 取整角色位置
    -- 取整飞行道具位置

    -- 更新HUD
    -- 更新场景
    state_machine_UI_game_scene_movie_cover_loop(obj_UI_game_scene_movie_cover)

    if SCENE_TIMER == 0 then
        state_machine_char_game_scene_char_LP_input_sys_cache()
        state_machine_char_game_scene_char_RP_input_sys_cache()
        state_machine_char_game_scene_char_LP_input_sys_cache_negative_edge()
        state_machine_char_game_scene_char_RP_input_sys_cache_negative_edge()
        obj_char_game_scene_char_LP["input_sys_state"] = "load"
        obj_char_game_scene_char_RP["input_sys_state"] = "load"
    end

    SCENE_TIMER = SCENE_TIMER + 1
    local char_LP = obj_char_game_scene_char_LP
    local char_RP = obj_char_game_scene_char_RP

    -- debug_delete_after 
    if DEBUG_TRAINNING_SPAWN_STATE == "Pressing" and DEBUG_TRAINNING_TOGGLE then
        SCENE_TIMER = 5
        common_game_scene_init_chars_trainning()
        current_update_block = update_game_scene_training_before_ease_in
        return
    end

    -- 获得输入 更新角色 状态 速度 和 碰撞盒
    -- 会被game_speed限制
    state_machine_char_game_scene_char_LP_input_sys_cache()
    state_machine_char_game_scene_char_RP_input_sys_cache()
    state_machine_char_game_scene_char_LP_input_sys_cache_negative_edge()
    state_machine_char_game_scene_char_RP_input_sys_cache_negative_edge()
    common_update_game_scene_input_direction(char_LP)
    common_update_game_scene_input_direction(char_RP)

    -- debug_delete_after
    if DEBUG_TRAINNING_TOGGLE then
        INPUT_SYS_CURRENT_COMMAND_STATE["R"]["left"] = "Released"
        INPUT_SYS_CURRENT_COMMAND_STATE["R"]["right"] = "Released"
        INPUT_SYS_CURRENT_COMMAND_STATE["R"]["up"] = "Released"
        INPUT_SYS_CURRENT_COMMAND_STATE["R"]["down"] = "Released"
        if DEBUG_TRAINNING_HEIGHT == 2 then
            INPUT_SYS_CURRENT_COMMAND_STATE["R"]["down"] = "Holding"
        elseif DEBUG_TRAINNING_HEIGHT == 8 then
            INPUT_SYS_CURRENT_COMMAND_STATE["R"]["up"] = "Holding"
        end
        obj_char_game_scene_char_RP["direction_input"] = DEBUG_TRAINNING_HEIGHT

        if obj_char_game_scene_char_RP["state"] == "knockdown" then
            obj_char_game_scene_char_RP["direction_input"] = DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS
        end
    end

    -- 更新角色
    update_game_scene_char()

    -- debug_delete_after
    if DEBUG_TRAINNING_TOGGLE then
        if DEBUG_TRAINNING_BLOCK ~= 0 and obj_char_game_scene_char_RP["hurt_state_target"] ~= "unblock" then
            obj_char_game_scene_char_RP["hurt_state_target"] = "idle"
            if DEBUG_TRAINNING_HEIGHT == 2 then
                obj_char_game_scene_char_RP["direction_input"] = 1
            elseif DEBUG_TRAINNING_HEIGHT == 5 then
                obj_char_game_scene_char_RP["direction_input"] = 4
            elseif DEBUG_TRAINNING_HEIGHT == 8 then
                obj_char_game_scene_char_RP["direction_input"] = 4
            end
            if DEBUG_TRAINNING_BLOCK == 2 then
                INPUT_SYS_CURRENT_COMMAND_STATE["R"]["correction_left"] = "Holding"
                INPUT_SYS_CURRENT_COMMAND_STATE["R"]["correction_right"] = "Holding"
            end
        end
        if DEBUG_TRAINNING_COUNTER and obj_char_game_scene_char_RP["hurt_state_target"] ~= "unblock" then
            obj_char_game_scene_char_RP["hurt_state_target"] = "counter"
        end
    end

    local char_LP_velocity = char_LP["velocity"]
    local char_RP_velocity = char_RP["velocity"]

    -- 进行push box hit box hurt box的检测
    for i = 1,16 do
        -- 更新角色和飞行道具位置
        if char_LP["game_speed"] ~= 0 and not char_LP["physics_lock"] then
            -- 角色更新位置 1/16
            char_LP["x"] = char_LP["x"] + char_LP_velocity[1]/(16* char_LP["game_speed"])
            char_LP["y"] = char_LP["y"] + char_LP_velocity[2]/(16* char_LP["game_speed"])

            -- 飞行道具更新位置 1/10
            for i = 1,#char_LP["projectile_table"] do
                local current_projectile = char_LP["projectile_table"][i]
                current_projectile["x"] = current_projectile["x"] + current_projectile["velocity"][1]/(16* char_LP["game_speed"])
                current_projectile["y"] = current_projectile["y"] + current_projectile["velocity"][2]/(16* char_LP["game_speed"])
            end
        end
        if char_RP["game_speed"] ~= 0 and not char_RP["physics_lock"] then
            -- 角色更新位置 1/10
            char_RP["x"] = char_RP["x"] + char_RP_velocity[1]/(16* char_RP["game_speed"])
            char_RP["y"] = char_RP["y"] + char_RP_velocity[2]/(16* char_RP["game_speed"])

            -- 飞行道具更新位置 1/10
            for i = 1,#char_RP["projectile_table"] do
                local current_projectile = char_RP["projectile_table"][i]
                current_projectile["x"] = current_projectile["x"] + current_projectile["velocity"][1]/(16*char_RP["game_speed"])
                current_projectile["y"] = current_projectile["y"] + current_projectile["velocity"][2]/(16*char_RP["game_speed"])
            end
        end

        -- 检测pushbox 更新Y位置
        collision_pushbox_relocate_y(char_LP)
        collision_pushbox_relocate_y(char_RP)

        -- 检测pushbox 更新X位置 static_relocate_x
        collision_pushbox_stage_relocate_x(char_LP)
        collision_pushbox_stage_relocate_x(char_RP)
        collision_pushbox_state_relocate_in_character_x(char_LP,char_RP,obj_stage_game_scene_mid_collision_anchor)

        -- 检测pushbox 更新X位置 dynamic_relocate_x
        collision_pushbox_dynamic_normal_aabb_relocate_x(char_LP,char_RP)

        -- 更新飞行道具 与角色碰撞交互
        for i = #char_LP["projectile_table"],1,-1 do -- 反向遍历，便于删除元素
            local object = char_LP["projectile_table"][i]
            if object["push_box_interact_update"] then
                object["push_box_interact_update"]()
            end
        end
        for i = #char_RP["projectile_table"],1,-1 do -- 反向遍历，便于删除元素
            local object = char_RP["projectile_table"][i]
            if object["push_box_interact_update"] then
                object["push_box_interact_update"]()
            end
        end

        -- 打击受击检测
        -- 检测投受击盒交互
        local LP_hurt_throw_accur = collision_throw_hurtbox_test(char_RP,char_LP) -- (obj_hit,obj_hurt)
        local RP_hurt_throw_accur = collision_throw_hurtbox_test(char_LP,char_RP)

        -- 检测打击受击盒交互
        if LP_hurt_throw_accur then
            char_RP["hit_function"](char_LP) -- RP更新主动攻击状态
        end
        if RP_hurt_throw_accur then
            char_LP["hit_function"](char_RP) -- LP更新主动攻击状态
        end
        if LP_hurt_throw_accur then
            char_RP["hurt_function"](char_LP) -- RP更新被攻击状态
        end
        if RP_hurt_throw_accur then
            char_LP["hurt_function"](char_RP) -- LP更新被攻击状态
        end

        -- debug_delete_after
        if (DEBUG_TRAINNING_THROW_CLASH and DEBUG_TRAINNING_TOGGLE) then
            if (char_LP["state"] == "throw_testing" and char_RP["state"] == "throw_tested") then
                char_LP["state"] = "throw_teched"
                char_LP["character_animation"] = load_game_scene_anim_char_common_0_Launcher_throw_tech(
                    char_LP,"teched"
                )
                init_character_anim_with(char_LP,char_LP["character_animation"])
                char_RP["state"] = "throw_teching"
                char_RP["character_animation"] = load_game_scene_anim_char_common_0_Launcher_throw_tech(
                    char_RP,"teching"
                )
                init_character_anim_with(char_RP,char_RP["character_animation"])
            elseif (char_RP["state"] == "throw_testing" and char_LP["state"] == "throw_tested") then
                char_RP["state"] = "throw_teched"
                char_RP["character_animation"] = load_game_scene_anim_char_common_0_Launcher_throw_tech(
                    char_RP,"teched"
                )
                init_character_anim_with(char_RP,char_RP["character_animation"])
                char_LP["state"] = "throw_teching"
                char_LP["character_animation"] = load_game_scene_anim_char_common_0_Launcher_throw_tech(
                    char_LP,"teching"
                )
                init_character_anim_with(char_LP,char_LP["character_animation"])
            end
        end

        -- enemy_interact_function
            -- strike_clash
            -- projectile_and_projectile_interaction
            -- interaction_with_enemy
        -- friendly_interact_function
            -- interaction_with_friendly

        -- 检测飞行道具人物交互
        for i = 1,#char_LP["projectile_table"] do
            local current_projectile = char_LP["projectile_table"][i]
            if current_projectile["enemy_interact_function"] then
                current_projectile["enemy_interact_function"]()
            end
        end
        for i = 1,#char_RP["projectile_table"] do
            local current_projectile = char_RP["projectile_table"][i]
            if current_projectile["enemy_interact_function"] then
                current_projectile["enemy_interact_function"]()
            end
        end
        for i = 1,#char_LP["projectile_table"] do
            local current_projectile = char_LP["projectile_table"][i]
            if current_projectile["friendly_interact_function"] then
                current_projectile["friendly_interact_function"]()
            end
        end
        for i = 1,#char_RP["projectile_table"] do
            local current_projectile = char_RP["projectile_table"][i]
            if current_projectile["friendly_interact_function"] then
                current_projectile["friendly_interact_function"]()
            end
        end

        -- 保留双康后的LP_hurt_strike_accur RP_hurt_strike_accur
        local LP_hurt_strike_accur = collision_strike_hurtbox_test(char_RP,char_LP) -- (obj_hit,obj_hurt)
        local RP_hurt_strike_accur = collision_strike_hurtbox_test(char_LP,char_RP)

        -- 检测打击受击盒交互
        if LP_hurt_strike_accur then
            char_RP["hit_function"](char_LP) -- RP更新主动攻击状态
        end
        if RP_hurt_strike_accur then
            char_LP["hit_function"](char_RP) -- LP更新主动攻击状态
        end
        if LP_hurt_strike_accur then
            char_RP["hurt_function"](char_LP) -- RP更新被攻击状态
        end
        if RP_hurt_strike_accur then
            char_LP["hurt_function"](char_RP) -- LP更新被攻击状态
        end

        -- 检测双康
        if LP_hurt_strike_accur and RP_hurt_strike_accur then
            local obj_camera = obj_stage_game_scene_camera
            char_LP["hit_hurt_blockstop_countdown"] = 0
            char_RP["hit_hurt_blockstop_countdown"] = 0
            char_LP["hit_hurt_block_slowdown_countdown"] = 0
            char_RP["hit_hurt_block_slowdown_countdown"] = 0
            char_LP["game_speed"] = 1
            char_RP["game_speed"] = 1
            obj_camera["state"] = "main"
            obj_camera["enclose_percentage"] = 0.0
            obj_camera["enclose_position_offset"] = {0,0,0}
        end

        -- 检测相杀
        if collision_strike_hitbox_clash_test() then

        end
    end

    -- 检测pushbox 更新Y位置
    collision_pushbox_relocate_y(char_LP)
    collision_pushbox_relocate_y(char_RP)

    -- 检测pushbox 更新X位置 static_relocate_x
    collision_pushbox_stage_relocate_x(char_LP)
    collision_pushbox_stage_relocate_x(char_RP)
    collision_pushbox_state_relocate_in_character_x(char_LP,char_RP,obj_stage_game_scene_mid_collision_anchor)

    -- 检测pushbox 更新X位置 dynamic_relocate_x
    collision_pushbox_dynamic_normal_aabb_relocate_x(char_LP,char_RP)

    -- 更新飞行道具 与角色碰撞交互
    for i = #char_LP["projectile_table"],1,-1 do -- 反向遍历，便于删除元素
        local object = char_LP["projectile_table"][i]
        if object["push_box_interact_update"] then
            object["push_box_interact_update"]()
        end
    end
    for i = #char_RP["projectile_table"],1,-1 do -- 反向遍历，便于删除元素
        local object = char_RP["projectile_table"][i]
        if object["push_box_interact_update"] then
            object["push_box_interact_update"]()
        end
    end

    -- 更新hurt_block_at_current_frame
    char_LP["hurt_block_at_current_frame"] = false
    char_RP["hurt_block_at_current_frame"] = false

    -- 更新阻力
    update_game_scene_friction()

    -- 更新角色重力方向速度
    update_game_scene_gravity()

    -- 更新资源槽
    update_game_scene_gauge()

    -- 更新上墙
    update_game_scene_test_and_apply_wallstick()

    -- 更新sub_frame
    update_game_scene_game_speed_sub_frame()

    -- 更新HUD
    update_game_scene_HUD()

    -- 更新场景
    update_game_scene_stage()
    
    -- 更新角色DEBUG信息
    update_character_frame_info(obj_char_game_scene_char_LP)
    update_character_frame_info(obj_char_game_scene_char_RP)
end
function update_game_scene_training_wallbreak_transport()
end
function update_game_scene_training_5Launcher_hold_transport_entering()
end

function update_game_scene_local_match_before_ease_in()
    update_game_scene_char_LP()
    update_game_scene_char_RP()
end
function update_game_scene_online_match_synchronizing()
    update_game_scene_char_LP()
    update_game_scene_char_RP()
end

function update_game_scene_char()
    local char_LP = obj_char_game_scene_char_LP
    local char_RP = obj_char_game_scene_char_RP
    
    common_update_game_scene_char_game_speed_abnormal_realtime_countdown(char_LP)
    common_update_game_scene_char_game_speed_abnormal_realtime_countdown(char_RP)

    -- 计算摩擦力时再将game_speed_subframe初始化
    local game_speed_cache_LP = char_LP["game_speed"]
    local game_speed_subframe_cache_LP = char_LP["game_speed_subframe"]
    local game_speed_cache_RP = char_RP["game_speed"]
    local game_speed_subframe_cache_RP = char_RP["game_speed_subframe"]
    if game_speed_cache_LP ~= 0 
    and game_speed_subframe_cache_LP > game_speed_cache_LP
    then
        update_game_scene_char_LP()
        update_game_scene_char_LP_projectile()
        update_game_scene_char_LP_VFX()
        update_game_scene_char_LP_black_overlay()
    end

    if game_speed_cache_RP ~= 0 
    and game_speed_subframe_cache_RP > game_speed_cache_RP
    then
        update_game_scene_char_RP()
        update_game_scene_char_RP_projectile()
        update_game_scene_char_RP_VFX()
        update_game_scene_char_RP_black_overlay()
    end

    -- attachment 用于某些需要根据角色本身本帧数据来更新的部分
    if game_speed_cache_LP ~= 0 
    and game_speed_subframe_cache_LP > game_speed_cache_LP
    then
        update_game_scene_char_LP_attachment()
    end

    if game_speed_cache_RP ~= 0 
    and game_speed_subframe_cache_RP > game_speed_cache_RP
    then
        update_game_scene_char_RP_attachment()
    end

    local game_speed_abnormal_realtime_countdown_LP = char_LP["game_speed_abnormal_realtime_countdown"]
    local game_speed_abnormal_realtime_countdown_RP = char_LP["game_speed_abnormal_realtime_countdown"]
    if char_LP["game_speed"] == 0 and char_RP["game_speed"] == 0 then
        if game_speed_abnormal_realtime_countdown_LP > game_speed_abnormal_realtime_countdown_RP then
            char_LP["game_speed_abnormal_realtime_countdown"] = 
            game_speed_abnormal_realtime_countdown_LP - game_speed_abnormal_realtime_countdown_RP
            char_RP["game_speed_abnormal_realtime_countdown"] = 0
        elseif game_speed_abnormal_realtime_countdown_RP > game_speed_abnormal_realtime_countdown_LP then
            char_RP["game_speed_abnormal_realtime_countdown"] = 
            game_speed_abnormal_realtime_countdown_RP - game_speed_abnormal_realtime_countdown_LP
            char_LP["game_speed_abnormal_realtime_countdown"] = 0
        else
            char_LP["game_speed_abnormal_realtime_countdown"] = 0
            char_RP["game_speed_abnormal_realtime_countdown"] = 0
        end
    end
end
function update_game_scene_friction()
    local char_LP = obj_char_game_scene_char_LP
    local char_RP = obj_char_game_scene_char_RP
    local LP_game_speed = char_LP["game_speed"]
    local RP_game_speed = char_LP["game_speed"]
    
    char_LP["velocity_debug"][1] = char_LP["velocity"][1]
    char_LP["velocity_debug"][2] = char_LP["velocity"][2]
    char_RP["velocity_debug"][1] = char_RP["velocity"][1]
    char_RP["velocity_debug"][2] = char_RP["velocity"][2]
    if char_LP["height_state"] ~= "air" and char_LP["game_speed"] ~= 0 and char_LP["game_speed_subframe"] > char_LP["game_speed"] and not char_LP["physics_lock"] then
        if char_LP["friction"] == 0 then
            char_LP["velocity"][1] = char_LP["velocity"][1]
        else
            char_LP["velocity"][1] = char_LP["velocity"][1] - (char_LP["velocity"][1] / char_LP["friction"])
        end
        if math.abs(char_LP["velocity"][1]) < 0.001 then
            char_LP["velocity"][1] = 0
        end
    end
    if char_RP["height_state"] ~= "air" and char_RP["game_speed"] ~= 0 and char_RP["game_speed_subframe"] > char_RP["game_speed"] and not char_RP["physics_lock"] then
        if char_RP["friction"] == 0 then
            char_RP["velocity"][1] = char_RP["velocity"][1]
        else
            char_RP["velocity"][1] = char_RP["velocity"][1] - (char_RP["velocity"][1] / char_RP["friction"])
        end
        if math.abs(char_RP["velocity"][1]) < 0.001 then
            char_RP["velocity"][1] = 0
        end
    end
end
function update_game_scene_gravity()
    local char_LP = obj_char_game_scene_char_LP
    local char_RP = obj_char_game_scene_char_RP

    if char_LP["y"] == 365 then
        char_LP["velocity"][2] = math.min(char_LP["velocity"][2],0)
    elseif char_LP["y"] > 365 then
        char_LP["y"] = 365
        char_LP["velocity"][2] = 0
        char_LP["gravity_correction"] = 1
    elseif char_LP["game_speed_subframe"] > char_LP["game_speed"] and not char_LP["physics_lock"] then
        char_LP["velocity"][2] = char_LP["velocity"][2] + char_LP["gravity"]*char_LP["gravity_correction"]
    end

    if char_RP["y"] == 365 then
        char_RP["velocity"][2] = math.min(char_RP["velocity"][2],0)
    elseif char_RP["y"] > 365 then
        char_RP["y"] = 365
        char_RP["velocity"][2] = 0
        char_LP["gravity_correction"] = 1
    elseif char_RP["game_speed_subframe"] > char_RP["game_speed"] and not char_RP["physics_lock"] then
        char_RP["velocity"][2] = char_RP["velocity"][2] + char_RP["gravity"]*char_RP["gravity_correction"]
    end
end
function update_game_scene_gauge()
    local char_LP = obj_char_game_scene_char_LP
    local char_RP = obj_char_game_scene_char_RP

    if not char_LP["gauge_update_ban_states"][char_LP["state"]] then
        char_LP["health_gauge_update_function"]()
        char_LP["overdrive_gauge_update_function"]()
        char_LP["ability_gauge_update_function"]()
        char_LP["risk_gauge_update_function"]()
        char_LP["wallbreak_gauge_update_function"]()
    end
    char_RP["health_gauge_update_function"]()
    if not char_RP["gauge_update_ban_states"][char_RP["state"]] then
        char_LP["health_gauge_update_function"]()
        char_RP["overdrive_gauge_update_function"]()
        char_RP["ability_gauge_update_function"]()
        char_RP["risk_gauge_update_function"]()
        char_RP["wallbreak_gauge_update_function"]()
    end
end
function update_game_scene_test_and_apply_wallbreak()
end
function update_game_scene_test_and_apply_wallbreak_sub()
end
function update_game_scene_test_and_apply_wallstick()
    local char_LP = obj_char_game_scene_char_LP
    local char_RP = obj_char_game_scene_char_RP
    local obj_camera = obj_stage_game_scene_camera
    update_game_scene_test_and_apply_wallstick_sub(char_LP,char_RP)
    char_LP["collision_move_available_cache"] = char_LP["collision_move_available"]
    update_game_scene_test_and_apply_wallstick_sub(char_RP,char_LP)
    char_RP["collision_move_available_cache"] = char_RP["collision_move_available"]
end
function update_game_scene_test_and_apply_wallstick_sub(obj_char,obj_char_other_side)
    local obj_stage_main = obj_stage_game_scene_main
    local obj_camera = obj_stage_game_scene_camera
    local obj_wallstick = obj_stage_game_scene_wallstick
    local wallbreak_spwan_anchor_pos = common_game_scene_get_VFX_spawn_anchor_pos(obj_char["player_side"])["wallstick_spawn_anchor_pos"]
    local stage_collision = false
    local collision_side = 0
    local collision_side_cache = 0

    if obj_char["state"] ~= "hurt" and obj_char["state"] ~= "hurtstop" then
        return
    end

    if obj_char["state"] == "hurtstop" and obj_char["state_cache"] == "wallstick" then
        return
    end

    if obj_char["collision_move_available"][1] == 0 then
        collision_side = -1
    elseif obj_char["collision_move_available"][2] == 0 then
        collision_side = 1
    else
        return
    end

    if obj_char["wallbreak_gauge"][1] >= obj_char["wallbreak_gauge"][2] and 
    (obj_char_other_side["state"] == "hurt" or obj_char_other_side["state"] == "hurtstop" or obj_char_other_side["state"] == "wallstick")
    then
        print("Did you code a guarantee projectile that active after the owner was hurt?")
        print("You could do that but I won't code a wallstick with it since this would cause a sync wallstick or wallbreak.")
        print("That is a issue even arcsys deal it shity.")
        print("I would just ban the wallbreak/wallstick process with it since I don't like guarantee projectile either")
        return
    end

    if obj_char["collision_move_available_cache"][1] == 0 then
        collision_side_cache = -1
    elseif obj_char["collision_move_available_cache"][2] == 0 then
        collision_side_cache = 1
    end
    obj_wallstick[1] = math.abs(obj_wallstick[1])*collision_side
    obj_wallstick[5] = collision_side
    -- wallstick_visual_effect
    if collision_side ~= 0 and collision_side ~= collision_side_cache then
        -- wallstick_stage_obj
        obj_wallstick[2] = obj_char["y"] - wallbreak_spwan_anchor_pos[obj_char["height_state"]]
        -- wallstick
        if obj_char["wallbreak_gauge"][1] >= obj_char["wallbreak_gauge"][2] then
            -- camera_shake
            obj_stage_main["camera_active_application_table"] = {}
            table.insert(obj_stage_main["camera_active_application_table"],
                function()
                    anim_camera_point_linear_game_scene_camera_shake_x,
                    anim_camera_point_linear_game_scene_camera_shake_y 
                    = common_game_scene_wallbreak_load_camera_shake_anim(1.5)
                    init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_shake_x)
                    init_point_linear_anim_with(obj_camera,anim_camera_point_linear_game_scene_camera_shake_y)
                    obj_camera["state"] = "active"
                end
            )
            -- onwall_hit_effect_stage_obj
            table.insert(obj_stage_main["wallstick_stage_obj_active_application_table"],
                function()
                    obj_wallstick[4] = 1
                    obj_wallstick["sprite_sheet"] = 1
                    init_frame_anim_with(obj_wallstick,anim_stage_wallstick)
                    obj_wallstick["state"] = "on"
                end
            )
        -- not_engage_wallstick_but_shows_onwall_hit_effect_stage_obj
        else
            table.insert(obj_stage_main["wallstick_stage_obj_active_application_table"],
                function()
                    obj_wallstick[4] = 1
                    obj_wallstick["sprite_sheet"] = 0
                    init_frame_anim_with(obj_wallstick,anim_stage_wallstick)
                    obj_wallstick["state"] = "on"
                end
            )
        end
    end
    -- wallstick_state_change
    if obj_char["wallstickable"] and collision_side ~= 0 
    and obj_char["wallbreak_gauge"][1] >= obj_char["wallbreak_gauge"][2]
    then
        table.insert(obj_stage_main["wallstick_char_obj_active_application_table"],
            function()
                if obj_char["height_state"] == "air" then
                    obj_char["character_animation"] = load_game_scene_anim_char_common_0_general_hurt_soft_knockdown_wallstick_air(obj_char)
                    init_character_anim_with(obj_char,obj_char["character_animation"])
                else
                    obj_char["character_animation"] = load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_wallstick_ground(obj_char)
                    init_character_anim_with(obj_char,obj_char["character_animation"])
                end
                obj_char[5] = -collision_side
                obj_char["state_cache"] = "wallstick"
                obj_char["state"] = "hurtstop"
                obj_char["wallstick_on"] = collision_side
                obj_char["physics_lock"] = true
                if obj_char_other_side["state"] ~= "hitstop" then
                    obj_char_other_side["state_cache"] = obj_char_other_side["state"]
                    obj_char_other_side["state"] = "hitstop"
                    obj_char_other_side["physics_lock"] = true
                end
                -- hit_hurt_blockstop_countdown
                obj_char["hit_hurt_blockstop_countdown"] = 30
                obj_char["last_hitstop_frame"] = 0
                obj_char_other_side["hit_hurt_blockstop_countdown"] = 30
                obj_char_other_side["last_hitstop_frame"] = 0
            end
        )
    end
end
function update_game_scene_game_speed_sub_frame()
    local char_LP = obj_char_game_scene_char_LP
    local char_RP = obj_char_game_scene_char_RP
    if char_LP["game_speed_subframe"] > char_LP["game_speed"] then
        char_LP["game_speed_subframe"] = 1
    end
    if char_RP["game_speed_subframe"] > char_RP["game_speed"] then
        char_RP["game_speed_subframe"] = 1
    end
end
function update_game_scene_HUD()
    update_game_scene_HUD_overdrive_timer(
        obj_char_game_scene_char_LP,
        obj_HUD_game_scene_overdrive_timer_LP
    )
    update_game_scene_HUD_overdrive_timer(
        obj_char_game_scene_char_RP,
        obj_HUD_game_scene_overdrive_timer_RP
    )
end
function update_game_scene_HUD_overdrive_timer(obj_char,timer_obj)
    local switch = {
        ["default"] = function()
            if obj_char["overdrive_gauge"][3] == "on" then
                timer_obj["state"] = "ease_in"
                obj_char["brightness"] = obj_char["brightness_const"]
                init_point_linear_anim_with(timer_obj,anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1)
                init_point_linear_anim_with(obj_char,anim_char_point_linear_game_scene_overdrive_brightness_ease_in)
            end
        end,
        ["ease_in"] = function()
            point_linear_animator(timer_obj,anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1)
            point_linear_animator(obj_char,anim_char_point_linear_game_scene_overdrive_brightness_ease_in)
            if get_point_linear_anim_end_state(timer_obj,anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1) 
            and get_point_linear_anim_end_state(obj_char,anim_char_point_linear_game_scene_overdrive_brightness_ease_in) then
                timer_obj["state"] = "active"
                obj_char["brightness"] = obj_char["brightness_overdrive_const"]
            elseif obj_char["overdrive_gauge"][3] == "off" then
                timer_obj["state"] = "ease_out"
                obj_char["brightness"] = obj_char["brightness_overdrive_const"]
                init_point_linear_anim_with(timer_obj,anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0)
                init_point_linear_anim_with(obj_char,anim_char_point_linear_game_scene_overdrive_brightness_ease_out)
            end
        end,
        ["active"] = function()
            if obj_char["overdrive_gauge"][3] == "off" then
                timer_obj["state"] = "ease_out"
                obj_char["brightness"] = obj_char["brightness_overdrive_const"]
                init_point_linear_anim_with(timer_obj,anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0)
                init_point_linear_anim_with(obj_char,anim_char_point_linear_game_scene_overdrive_brightness_ease_out)
            end
        end,
        ["ease_out"] = function()
            point_linear_animator(timer_obj,anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0)
            point_linear_animator(obj_char,anim_char_point_linear_game_scene_overdrive_brightness_ease_out)
            if get_point_linear_anim_end_state(timer_obj,anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0) 
            and get_point_linear_anim_end_state(obj_char,anim_char_point_linear_game_scene_overdrive_brightness_ease_out) then
                timer_obj["state"] = "default"
                obj_char["brightness"] = obj_char["brightness_const"]
            elseif obj_char["overdrive_gauge"][3] == "on" then
                timer_obj["state"] = "ease_in"
                obj_char["brightness"] = obj_char["brightness_const"]
                init_point_linear_anim_with(timer_obj,anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1)
                init_point_linear_anim_with(obj_char,anim_char_point_linear_game_scene_overdrive_brightness_ease_in)
            end
        end,
    }
    local this_function = switch[timer_obj["state"]]
    if this_function then this_function() end
end
function update_start_scene_ease_in()
    SCENE_TIMER = SCENE_TIMER + 1
    point_linear_animator(obj_UI_start_scene_solid_color,anim_UI_point_linear_start_scene_solid_ease_in_opacity)
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)

    if SCENE_TIMER == 10 then 
        play_obj_audio(audio_SFX_start_scene_blazblue_click_echo)
    end
    -- 场景出口
    if SCENE_TIMER >= 30 then 
        SCENE_TIMER = 0
        -- 初始化此出口所需属性 但是目前没有
        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_30f_confirm
    end
end 
function update_start_scene_30f_confirm()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)

    -- 场景出口
    if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then 
        SCENE_TIMER = 0
        play_obj_audio(audio_SFX_start_scene_confirm_4)
        -- 初始化此出口所需属性 但是目前没有

        -- 初始化main所需要的动画机
        init_point_linear_anim_with(obj_UI_start_scene_up_console_text,anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity)
        init_point_linear_anim_with(obj_UI_start_scene_down_console_text,anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity)
        init_point_linear_anim_with(obj_UI_start_scene_console_type_in_mark,anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity)
        init_point_linear_anim_with(obj_UI_start_scene_console_dabo_trig,anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity)
        init_point_linear_anim_with(obj_UI_start_scene_option_text,anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity)
        init_point_linear_anim_with(obj_UI_start_scene_breath_tag,anim_UI_point_linear_start_scene_general_ease_in_0_0p1_opacity)
        init_point_linear_anim_with(obj_UI_start_scene_main_press_any_key,anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity)

        -- 更新 current_update_block
        current_update_block = update_start_scene_1s45f_1s50f
    end
end 
function update_start_scene_1s45f_1s50f()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(obj_UI_start_scene_up_console_text,anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity)
    point_linear_animator(obj_UI_start_scene_down_console_text,anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity)
    point_linear_animator(obj_UI_start_scene_console_type_in_mark,anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity)
    point_linear_animator(obj_UI_start_scene_console_dabo_trig,anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity)
    point_linear_animator(obj_UI_start_scene_option_text,anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity)
    point_linear_animator(obj_UI_start_scene_breath_tag,anim_UI_point_linear_start_scene_general_ease_in_0_0p1_opacity)
    point_linear_animator(obj_UI_start_scene_main_press_any_key,anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity)

    -- 场景出口
    if SCENE_TIMER >= 5 then 
        SCENE_TIMER = 0

        -- 初始化此出口所需属性 但是目前没有
        
        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(obj_UI_start_scene_breath_tag,anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity)
        init_frame_anim_with(obj_UI_start_scene_console_type_in_mark,anim_UI_frame_start_scene_console_type_in_mark_blink_opacity)

        -- 更新 current_update_block
        current_update_block = update_start_scene_main
    end
end 
function update_start_scene_main()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    -- 场景出口
    if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["left"] == "Pressing" then 
        SCENE_TIMER = 0
        -- 播放twitch音频
        play_obj_audio(audio_SFX_start_scene_left_1)

        -- 轮转 option id
        if OPTION_ID == 0 then 
            OPTION_ID = 4 
        else 
            OPTION_ID = OPTION_ID - 1
        end

        -- 轮转 CONSOLE TEXT
        CONSOLE_TEXT_1_ID = OPTION_ID
        CONSOLE_TEXT_2_ID = OPTION_ID

        -- 初始化此出口所需属性 
        obj_UI_start_scene_breath_tag[4] = 0
        obj_UI_start_scene_console_dabo_trig[1] = 75
        obj_UI_start_scene_console_dabo_trig[4] = 0
        obj_UI_start_scene_option_text[1] = OPTION_TEXT_X_POSITION_TABLE[OPTION_ID + 1]
        obj_UI_start_scene_option_text[8] = OPTION_ID
        obj_UI_start_scene_console_type_in_mark[4] = 0

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_console_dabo_trig,
            anim_UI_frame_start_scene_console_dabo_trig_twtich_x
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_console_dabo_trig,
            anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_option_text,
            anim_UI_point_linear_start_scene_option_text_twitch_x
        )
        
        -- 更新 current_update_block
        current_update_block = update_start_scene_option_twitch

    -- 场景出口 option twitch right
    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["right"] == "Pressing" then 
        SCENE_TIMER = 0
        -- 播放twitch音频
        play_obj_audio(audio_SFX_start_scene_right_1)

        -- 轮转 option ID
        if OPTION_ID == 4 then 
            OPTION_ID = 0 
        else 
            OPTION_ID = OPTION_ID + 1
        end

        -- 轮转 CONSOLE TEXT
        CONSOLE_TEXT_1_ID = OPTION_ID
        CONSOLE_TEXT_2_ID = OPTION_ID

        -- 初始化此出口所需属性
        obj_UI_start_scene_breath_tag[4] = 0
        obj_UI_start_scene_console_dabo_trig[1] = 75
        obj_UI_start_scene_console_dabo_trig[4] = 0
        obj_UI_start_scene_option_text[1] = OPTION_TEXT_X_POSITION_TABLE[OPTION_ID + 1]
        obj_UI_start_scene_option_text[8] = OPTION_ID
        obj_UI_start_scene_console_type_in_mark[4] = 0

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_console_dabo_trig,
            anim_UI_frame_start_scene_console_dabo_trig_twtich_x
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_console_dabo_trig,
            anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_option_text,
            anim_UI_point_linear_start_scene_option_text_twitch_x
        )

        -- 更新 current_update_block
        current_update_block = update_start_scene_option_twitch

    -- 场景出口 option 确认
    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then 
        SCENE_TIMER = 0
        play_obj_audio(audio_SFX_start_scene_confirm_1)
        local switch = {
            [0] = function()
                SCENE_TIMER = 0

                -- 训练模式 设置玩家数
                PLAYER_NUMBER = 1

                -- 播放scene out audio
                play_obj_audio(audio_SFX_start_scene_scene_out)

                -- 初始化此出口所需属性
                obj_UI_start_scene_solid_color[4] = 0
                    -- audio
                audio_BGM_start_scene_NOC_high[1] = 1

                -- 初始化此出口所需要的动画机
                init_point_linear_anim_with(
                    obj_UI_start_scene_solid_color,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )

                    -- audio
                init_point_linear_anim_with(
                    audio_BGM_start_scene_NOC_high,
                    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0
                )

                -- 音量更新
                update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)

                -- 更新 current_update_block
                current_update_block = update_start_scene_ease_out

            end,
            [1] = function()
                SCENE_TIMER = 0

                -- 匹配模式 设置玩家数
                PLAYER_NUMBER = 2

                -- 播放scene out audio
                play_obj_audio(audio_SFX_start_scene_scene_out)

                -- 初始化此出口所需属性
                obj_UI_start_scene_solid_color[4] = 0
                audio_BGM_start_scene_NOC_high[1] = 1

                -- 初始化此出口所需要的动画机
                init_point_linear_anim_with(
                    obj_UI_start_scene_solid_color,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    audio_BGM_start_scene_NOC_high,
                    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0
                )
                -- 音量更新
                update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)

                -- 更新 current_update_block
                current_update_block = update_start_scene_ease_out

            end,
            [2] = function()
                SCENE_TIMER = 0
                SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID = 0

                -- config

                -- 初始化此出口所需属性
                obj_UI_start_scene_shutter[4] = 0
                obj_UI_start_scene_config_menu_dabo_trig[4] = 0
                obj_UI_start_scene_config_menu_text[4] = 0
                audio_BGM_start_scene_NOC_high[1] = 1
                audio_BGM_start_scene_NOC_low[1] = 0

                -- 初始化此出口所需要的动画机
                init_point_linear_anim_with(
                    obj_UI_start_scene_shutter,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_menu_dabo_trig,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_menu_text,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    audio_BGM_start_scene_NOC_high,
                    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0
                )
                init_point_linear_anim_with(
                    audio_BGM_start_scene_NOC_low,
                    anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume
                )

                -- 更新音量
                update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)
                update_BGM_VOLUME(audio_BGM_start_scene_NOC_low)

                -- 更新 current_update_block
                current_update_block = update_start_scene_config_ease_in
                current_draw_block = draw_start_scene_config_sub_scene

            end,
            [3] = function()
                SCENE_TIMER = 0
                SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID = 0

                -- record

                -- 初始化此出口所需属性
                obj_UI_start_scene_shutter[4] = 0
                obj_UI_start_scene_record_dabo_trig[4] = 0
                obj_UI_start_scene_record_dabo_trig[2] = 
                DABO_TIRG_RECORD_SUB_SCENE_Y_POSITION
                obj_UI_start_scene_record_game_duration_text[4] = 0
                obj_UI_start_scene_record_num_0[4] = 0
                obj_UI_start_scene_record_num_1[4] = 0
                obj_UI_start_scene_record_num_2[4] = 0
                obj_UI_start_scene_record_num_3[4] = 0
                obj_UI_start_scene_record_num_4[4] = 0
                obj_UI_start_scene_record_num_5[4] = 0
                obj_UI_start_scene_record_100h_plus_time_indi[4] = 0
                audio_BGM_start_scene_NOC_high[1] = 1
                audio_BGM_start_scene_NOC_low[1] = 0

                -- 初始化此出口所需要的动画机
                init_point_linear_anim_with(
                    obj_UI_start_scene_shutter,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_record_dabo_trig,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_record_game_duration_text,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_record_num_0,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_record_num_1,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_record_num_2,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_record_num_3,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_record_num_4,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_record_num_5,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_record_100h_plus_time_indi,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    audio_BGM_start_scene_NOC_high,
                    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0
                )
                init_point_linear_anim_with(
                    audio_BGM_start_scene_NOC_low,
                    anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume
                )

                -- 更新音量
                update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)
                update_BGM_VOLUME(audio_BGM_start_scene_NOC_low)

                -- 更新 current_update_block
                current_update_block = update_start_scene_record_ease_in
                current_draw_block = draw_start_scene_record_sub_scene

            end,
            [4] = function()
                SCENE_TIMER = 0

                -- exit

                -- 播放scene out audio
                play_obj_audio(audio_SFX_start_scene_scene_out)

                -- 初始化此出口所需属性
                obj_UI_start_scene_solid_color[4] = 0
                audio_BGM_start_scene_NOC_high[1] = 1
                audio_SFX_start_scene_scene_out[1] = 1

                -- 初始化此出口所需要的动画机
                init_point_linear_anim_with(
                    obj_UI_start_scene_solid_color,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    audio_BGM_start_scene_NOC_high,
                    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_1
                )

                -- 更新音量
                update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)
                update_SFX_VOLUME(audio_SFX_start_scene_scene_out)

                -- 更新 current_update_block
                current_update_block = update_start_scene_ease_out

            end
        }
        local thisFunction = switch[OPTION_ID]
        if thisFunction then 
            thisFunction() 
        end

    -- 场景出口 控制器更新
    elseif (INPUT_SYS_JOYSTICK_STATE[0] ~= INPUT_SYS_JOYSTICK_STATE[2] or INPUT_SYS_JOYSTICK_STATE[1] ~= INPUT_SYS_JOYSTICK_STATE[3]) then 
        SCENE_TIMER = 0
        -- 检测控制器具体变化 修改console text
        if INPUT_SYS_JOYSTICK_STATE[0] == 0 and INPUT_SYS_JOYSTICK_STATE[1] == 0 then 
            CONSOLE_TEXT_2_ID = 5
        elseif INPUT_SYS_JOYSTICK_STATE[0] == 1 and INPUT_SYS_JOYSTICK_STATE[1] == 0 then 
            CONSOLE_TEXT_2_ID = 6
        elseif INPUT_SYS_JOYSTICK_STATE[0] == 1 and INPUT_SYS_JOYSTICK_STATE[1] == 1 then 
            CONSOLE_TEXT_2_ID = 7
        end
        CONSOLE_TEXT_1_ID = 5

        -- 初始化此出口所需属性
        obj_UI_start_scene_console_dabo_trig[1] = 75
        obj_UI_start_scene_console_dabo_trig[4] = 0

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_console_dabo_trig,
            anim_UI_frame_start_scene_console_dabo_trig_twtich_x
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_console_dabo_trig,
            anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
        )

        -- 更新 current_update_block
        current_update_block = update_start_scene_only_console_twitch
    end
end 
function update_start_scene_ease_out()
    SCENE_TIMER = SCENE_TIMER + 1
    point_linear_animator(
        obj_UI_start_scene_solid_color,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        audio_BGM_start_scene_NOC_high,
        anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_1
    )
    update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)

    -- 场景出口
    if audio_SFX_start_scene_scene_out["audio"]:isPlaying() == false then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性 但是目前没有
        -- 初始化此出口所需要的动画机 但是目前没有
        local switch = {
            [0] = function()
                load_char_select_scene_prep()
                load_scene_prep_routine()

                GAME_MODE = 0

                -- 卸载所有资源 包括object anim image audio
                unload_start_scene_all()
            end,
            [1] = function()
                load_char_select_scene_prep()
                load_scene_prep_routine()

                GAME_MODE = 1
        
                -- 卸载所有资源 包括object anim image audio
                unload_start_scene_all()
            end,
            [4] = function()
                love.event.quit()
            end
        }

        local this_function = switch[OPTION_ID]
        if this_function then this_function() end
    end
end 
-- option twitch
function update_start_scene_option_twitch()
    SCENE_TIMER = SCENE_TIMER + 1

    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(obj_UI_start_scene_breath_tag,anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity)
    frame_animator(obj_UI_start_scene_console_type_in_mark,anim_UI_frame_start_scene_console_type_in_mark_blink_opacity)
    
    point_linear_animator(
        obj_UI_start_scene_console_dabo_trig,
        anim_UI_frame_start_scene_console_dabo_trig_twtich_x
    )
    point_linear_animator(
        obj_UI_start_scene_console_dabo_trig,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_option_text,
        anim_UI_point_linear_start_scene_option_text_twitch_x
    )

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0

        -- 初始化此出口所需属性
        obj_UI_start_scene_breath_tag[4] = 0.1
        obj_UI_start_scene_console_dabo_trig[1] = 75
        obj_UI_start_scene_console_dabo_trig[4] = 1
        obj_UI_start_scene_console_type_in_mark[1] = CONSOLE_TYPE_IN_MARK_X_POSITION_TABLE[CONSOLE_TEXT_2_ID + 1]
        obj_UI_start_scene_console_type_in_mark[4] = 0

        obj_UI_start_scene_up_console_text[8] = CONSOLE_TEXT_1_ID
        obj_UI_start_scene_down_console_text[8] = CONSOLE_TEXT_2_ID

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_breath_tag,
            anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
        )
        init_frame_anim_with(
            obj_UI_start_scene_console_type_in_mark,
            anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
        )

        -- 更新 current_update_block
        current_update_block = update_start_scene_main
    end
end 
function update_start_scene_only_console_twitch()
    SCENE_TIMER = SCENE_TIMER + 1

    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_console_dabo_trig,
        anim_UI_frame_start_scene_console_dabo_trig_twtich_x
    )
    point_linear_animator(
        obj_UI_start_scene_console_dabo_trig,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性
        obj_UI_start_scene_console_dabo_trig[1] = 75
        obj_UI_start_scene_console_dabo_trig[4] = 1
        obj_UI_start_scene_console_type_in_mark[1] = CONSOLE_TYPE_IN_MARK_X_POSITION_TABLE[CONSOLE_TEXT_2_ID + 1]
        obj_UI_start_scene_console_type_in_mark[4] = 0

        obj_UI_start_scene_up_console_text[8] = CONSOLE_TEXT_1_ID
        obj_UI_start_scene_down_console_text[8] = CONSOLE_TEXT_2_ID

        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_main
    end
end 
-- config
function update_start_scene_config_ease_in()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_shutter,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_menu_dabo_trig,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_menu_text,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )

    point_linear_animator(
        audio_BGM_start_scene_NOC_high,
        anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0
    )
    point_linear_animator(
        audio_BGM_start_scene_NOC_low,
        anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume
    )

    update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)
    update_BGM_VOLUME(audio_BGM_start_scene_NOC_low)

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性 但是目前没有
        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_main
    end
end 
function update_start_scene_config_main()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    -- 场景出口
    if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["up"] == "Pressing" then
        SCENE_TIMER = 0
        play_obj_audio(audio_SFX_start_scene_up_1)
        -- 更新 config dabo trig ID
        if SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID ~= 0 then
            SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID = SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID - 1
        end

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_menu_dabo_trig[2] = 
        DABO_TIRG_CONFIG_SUB_SCENE_Y_POSITION_TABLE[SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID + 1]

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_config_menu_dabo_trig,
            anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y
        )

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_twitch_up

    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["down"] == "Pressing" then
        SCENE_TIMER = 0
        play_obj_audio(audio_SFX_start_scene_down_1)
        -- 更新 config dabo trig ID
        if SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID ~= 3 then
            SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID = SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID + 1
        end

        -- 更新 twitch 场景属性 preset
        obj_UI_start_scene_config_menu_dabo_trig[2] = 
        DABO_TIRG_CONFIG_SUB_SCENE_Y_POSITION_TABLE[SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID + 1]

        -- 更新 twitch 场景动画 preset
        init_point_linear_anim_with(
            obj_UI_start_scene_config_menu_dabo_trig,
            anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y
        )

        -- 更新 update block
        current_update_block = update_start_scene_config_twitch_down

    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
        SCENE_TIMER = 0

        local switch = {
            [0] = function()
                -- audio config

                play_obj_audio(audio_SFX_start_scene_confirm_2)

                -- current bar mark ID
                AUDIO_BAR_MARK_ID = 0
    
                -- 初始化此出口所需属性
                obj_UI_start_scene_config_audio_bar_mark[4] = 0
                obj_UI_start_scene_config_audio_BGM_bar_light[4] = 0
                obj_UI_start_scene_config_audio_SFX_bar_light[4] = 0
                obj_UI_start_scene_config_audio_BGM_bar_gauge[4] = 0
                obj_UI_start_scene_config_audio_SFX_bar_gauge[4] = 0
                obj_UI_start_scene_config_audio_text[4] = 0
    
                obj_UI_start_scene_config_menu_dabo_trig[4] = 1
                obj_UI_start_scene_config_menu_text[4] = 1
    
                obj_UI_start_scene_config_audio_bar_mark[1] 
                = BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION
                
                obj_UI_start_scene_config_audio_bar_mark[2] 
                = BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE[AUDIO_BAR_MARK_ID+1]
    
                obj_UI_start_scene_config_audio_BGM_bar_alpha[1] = BGM_VOLUME*23
                obj_UI_start_scene_config_audio_SFX_bar_alpha[1] = SFX_VOLUME*23
    
    
                -- 初始化此出口所需要的动画机
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_audio_bar_mark,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_audio_BGM_bar_light,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_audio_SFX_bar_light,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_audio_BGM_bar_gauge,
                    anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_audio_SFX_bar_gauge,
                    anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_audio_text,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_menu_dabo_trig,
                    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_menu_text,
                    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity
                )
                
                -- 更新 update block
                current_update_block = update_start_scene_config_audio_ease_in
                current_draw_block = draw_start_scene_config_audio_sub_scene

            end,
            [1] = function()
                -- controller config

                play_obj_audio(audio_SFX_start_scene_confirm_2)

                -- 初始化此出口所需属性
                obj_UI_start_scene_config_controller_bar_mark_LP["state"] = "off_state"
                obj_UI_start_scene_config_controller_bar_mark_RP["state"] = "off_state"
                obj_UI_start_scene_config_controller_bar_mark_LP[4] = 0
                obj_UI_start_scene_config_controller_bar_mark_RP[4] = 0
                obj_UI_start_scene_config_controller_indi_text[4] = 0
                obj_UI_start_scene_config_menu_dabo_trig[4] = 1
                obj_UI_start_scene_config_menu_text[4] = 1

                -- 初始化此出口所需要的动画机
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_controller_bar_mark_LP,
                    anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_controller_bar_mark_RP,
                    anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_controller_indi_text,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )

                init_point_linear_anim_with(
                    obj_UI_start_scene_config_menu_dabo_trig,
                    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_menu_text,
                    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity
                )

                -- 更新 current_update_block
                current_update_block = update_start_scene_config_controller_ease_in
                current_draw_block = draw_start_scene_config_controller_sub_scene

            end,
            [2] = function()
                -- resolution config

                play_obj_audio(audio_SFX_start_scene_confirm_2)

                -- current bar mark ID
                get_current_resolution()
    
                -- 初始化此出口所需属性
                obj_UI_start_scene_config_resolution_w_x_h[8] = RES_PARTTEN
                obj_UI_start_scene_config_resolution_bar_mark[4] = 0
                obj_UI_start_scene_config_resolution_w_x_h[4] = 0
                obj_UI_start_scene_config_resolution_select_res_text[4] = 0
    
                    -- controller 子界面的几个object ease in 前 config main object 的设置
                obj_UI_start_scene_config_menu_dabo_trig[4] = 1
                obj_UI_start_scene_config_menu_text[4] = 1
    
                -- 初始化此出口所需要的动画机
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_resolution_bar_mark,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_resolution_w_x_h,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_resolution_select_res_text,
                    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
                )

                init_point_linear_anim_with(
                    obj_UI_start_scene_config_menu_dabo_trig,
                    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_menu_text,
                    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity
                )
                
                -- 更新 current_update_block
                current_update_block = update_start_scene_config_resolution_ease_in
                current_draw_block = draw_start_scene_config_resolution_sub_scene
    
            end,
            [3] = function()
                -- back to config main

                play_obj_audio(audio_SFX_start_scene_confirm_1)

                -- 初始化此出口所需属性
                obj_UI_start_scene_shutter[4] = 1
                obj_UI_start_scene_config_menu_dabo_trig[4] = 1
                obj_UI_start_scene_config_menu_text[4] = 1
                audio_BGM_start_scene_NOC_high[1] = 0
                audio_BGM_start_scene_NOC_low[1] = 1 
    
                -- 初始化此出口所需要的动画机
                init_point_linear_anim_with(
                    obj_UI_start_scene_shutter,
                    anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_menu_dabo_trig,
                    anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
                )
                init_point_linear_anim_with(
                    obj_UI_start_scene_config_menu_text,
                    anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
                )
    
                init_point_linear_anim_with(
                    audio_BGM_start_scene_NOC_high,
                    anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume
                )
                init_point_linear_anim_with(
                    audio_BGM_start_scene_NOC_low,
                    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0
                )
    
                update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)
                update_BGM_VOLUME(audio_BGM_start_scene_NOC_low)
    
                -- 更新 current_update_block
                current_update_block = update_start_scene_config_ease_out
    
            end
        }

        local thisFunction = switch[SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID]
        if thisFunction then 
            thisFunction() 
        end

    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["HS"] == "Pressing" then
        SCENE_TIMER = 0
        -- 播放scene out to sub
        play_obj_audio(audio_SFX_start_scene_exit_1)

        -- 初始化此出口所需属性
        obj_UI_start_scene_shutter[4] = 1
        obj_UI_start_scene_config_menu_dabo_trig[4] = 1
        obj_UI_start_scene_config_menu_text[4] = 1
        audio_BGM_start_scene_NOC_high[1] = 0
        audio_BGM_start_scene_NOC_low[1] = 1 

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_shutter,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_menu_dabo_trig,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_menu_text,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )

        init_point_linear_anim_with(
            audio_BGM_start_scene_NOC_high,
            anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume
        )
        init_point_linear_anim_with(
            audio_BGM_start_scene_NOC_low,
            anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0
        )

        update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)
        update_BGM_VOLUME(audio_BGM_start_scene_NOC_low)

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_ease_out
    end
end 
function update_start_scene_config_twitch_up()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )
    
    point_linear_animator(
        obj_UI_start_scene_config_menu_dabo_trig,
        anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y
    )

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_menu_dabo_trig[2] = 
        DABO_TIRG_CONFIG_SUB_SCENE_Y_POSITION_TABLE[SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID + 1]

        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_main
    end
end 
function update_start_scene_config_twitch_down()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_menu_dabo_trig,
        anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y
    )

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性
        obj_UI_start_scene_config_menu_dabo_trig[2] = 
        DABO_TIRG_CONFIG_SUB_SCENE_Y_POSITION_TABLE[SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID + 1]

        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_main
    end
end 
function update_start_scene_config_ease_out()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_shutter,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_menu_dabo_trig,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_menu_text,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )

    point_linear_animator(
        audio_BGM_start_scene_NOC_high,
        anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume
    )
    point_linear_animator(
        audio_BGM_start_scene_NOC_low,
        anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0
    )

    update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)
    update_BGM_VOLUME(audio_BGM_start_scene_NOC_low)

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性
        SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID = 0
        obj_UI_start_scene_config_menu_dabo_trig[2] = 
        DABO_TIRG_CONFIG_SUB_SCENE_Y_POSITION_TABLE[SUB_SCENE_CONIFG_MAIN_DABO_TRIG_ID + 1]

        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_main
        current_draw_block = draw_start_scene_main
    end
end 
    -- config audio
function update_start_scene_config_audio_ease_in()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )
    
    point_linear_animator(
        obj_UI_start_scene_config_audio_bar_mark,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_audio_BGM_bar_light,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_audio_SFX_bar_light,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_audio_BGM_bar_gauge,
        anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_audio_SFX_bar_gauge,
        anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_audio_text,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_menu_dabo_trig,
        anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_menu_text,
        anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity
    )

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0

        -- 初始化此出口所需属性 但是目前没有
        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_audio_main
    end
end 
function update_start_scene_config_audio_main()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    -- 场景出口
    if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["up"] == "Pressing" then
        SCENE_TIMER = 0
        play_obj_audio(audio_SFX_start_scene_up_1)

        -- 改变 AUDIO_BAR_MARK_ID
        if AUDIO_BAR_MARK_ID ~= 0 then
            AUDIO_BAR_MARK_ID = AUDIO_BAR_MARK_ID - 1
        end

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_audio_bar_mark[2] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE[AUDIO_BAR_MARK_ID + 1]
        obj_UI_start_scene_config_audio_bar_mark[1] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION

        obj_UI_start_scene_config_audio_BGM_bar_alpha[1] = BGM_VOLUME*23
        obj_UI_start_scene_config_audio_SFX_bar_alpha[1] = SFX_VOLUME*23

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_config_audio_bar_mark,
            anim_UI_point_linear_start_scene_config_audio_bar_mark_up_y
        )

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_audio_bar_mark_twtich_up

    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["down"] == "Pressing" then
        SCENE_TIMER = 0
        play_obj_audio(audio_SFX_start_scene_down_1)

        -- 改变AUDIO_BAR_MARK_ID
        if AUDIO_BAR_MARK_ID ~= 1 then
            AUDIO_BAR_MARK_ID = AUDIO_BAR_MARK_ID + 1
        end

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_audio_bar_mark[2] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE[AUDIO_BAR_MARK_ID + 1]
        obj_UI_start_scene_config_audio_bar_mark[1] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION

        obj_UI_start_scene_config_audio_BGM_bar_alpha[1] = BGM_VOLUME*23
        obj_UI_start_scene_config_audio_SFX_bar_alpha[1] = SFX_VOLUME*23

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_config_audio_bar_mark,
            anim_UI_point_linear_start_scene_config_audio_bar_mark_down_y
        )

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_audio_bar_mark_twtich_down

    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["left"] == "Pressing" then
        SCENE_TIMER = 0
        play_obj_audio(audio_SFX_start_scene_left_1)

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_audio_bar_mark[2] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE[AUDIO_BAR_MARK_ID + 1]
        obj_UI_start_scene_config_audio_bar_mark[1] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION

        obj_UI_start_scene_config_audio_BGM_bar_alpha[1] = BGM_VOLUME*23
        obj_UI_start_scene_config_audio_SFX_bar_alpha[1] = SFX_VOLUME*23

        -- 仅此出口使用所需table
        local alpha_bar_table = {
            obj_UI_start_scene_config_audio_BGM_bar_alpha,
            obj_UI_start_scene_config_audio_SFX_bar_alpha
        }

        local volume_table = {
            BGM_VOLUME,
            SFX_VOLUME
        }

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_config_audio_bar_mark,
            anim_UI_point_linear_start_scene_config_audio_bar_mark_left_x
        )

        if volume_table[AUDIO_BAR_MARK_ID+1] > 0 then
            -- 带 alpha
            -- 初始化此出口所需要的动画机
            init_point_linear_anim_with(
                alpha_bar_table[AUDIO_BAR_MARK_ID+1],
                anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_left_23_x
            )

            -- 更新BGM SFX volume
            volume_table[AUDIO_BAR_MARK_ID+1] = volume_table[AUDIO_BAR_MARK_ID+1] - 1
            BGM_VOLUME = volume_table[1]
            SFX_VOLUME = volume_table[2]

            update_start_scene_config_audio_main_update_volume()

            -- 更新 current_update_block
            current_update_block = update_start_scene_config_audio_bar_mark_twtich_left_with_alpha

        else
            -- 更新 current_update_block
            current_update_block = update_start_scene_config_audio_bar_mark_twtich_left_without_alpha

        end

    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["right"] == "Pressing" then
        SCENE_TIMER = 0
        play_obj_audio(audio_SFX_start_scene_right_1)

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_audio_bar_mark[2] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE[AUDIO_BAR_MARK_ID + 1]
        obj_UI_start_scene_config_audio_bar_mark[1] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION

        obj_UI_start_scene_config_audio_BGM_bar_alpha[1] = BGM_VOLUME*23
        obj_UI_start_scene_config_audio_SFX_bar_alpha[1] = SFX_VOLUME*23

        -- 仅此出口使用所需table
        local alpha_bar_table = {
            obj_UI_start_scene_config_audio_BGM_bar_alpha,
            obj_UI_start_scene_config_audio_SFX_bar_alpha
        }

        local volume_table = {
            BGM_VOLUME,
            SFX_VOLUME
        }

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_config_audio_bar_mark,
            anim_UI_point_linear_start_scene_config_audio_bar_mark_right_x
        )

        if volume_table[AUDIO_BAR_MARK_ID+1] < 10 then
            -- 带 alpha
            -- 初始化此出口所需要的动画机
            init_point_linear_anim_with(
                alpha_bar_table[AUDIO_BAR_MARK_ID+1],
                anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_right_23_x
            )
            volume_table[AUDIO_BAR_MARK_ID+1] = volume_table[AUDIO_BAR_MARK_ID+1] + 1

            -- 更新BGM SFX volume
            BGM_VOLUME = volume_table[1]
            SFX_VOLUME = volume_table[2]
            update_start_scene_config_audio_main_update_volume()
            
            -- 更新 current_update_block
            current_update_block = update_start_scene_config_audio_bar_mark_twtich_right_with_alpha

        else
            -- 不带alpha
            -- 更新 current_update_block
            current_update_block = update_start_scene_config_audio_bar_mark_twtich_right_without_alpha
            
        end

    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["HS"] == "Pressing" or INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
        SCENE_TIMER = 0
        play_obj_audio(audio_SFX_start_scene_exit_1)

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_audio_bar_mark[4] = 1
        obj_UI_start_scene_config_audio_BGM_bar_light[4] = 1
        obj_UI_start_scene_config_audio_SFX_bar_light[4] = 1
        obj_UI_start_scene_config_audio_BGM_bar_gauge[4] = 1
        obj_UI_start_scene_config_audio_SFX_bar_gauge[4] = 1
        obj_UI_start_scene_config_audio_text[4] = 1

        obj_UI_start_scene_config_menu_dabo_trig[4] = 0.5
        obj_UI_start_scene_config_menu_text[4] = 0.5

        obj_UI_start_scene_config_audio_bar_mark[1] 
        = BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION
        
        obj_UI_start_scene_config_audio_bar_mark[2] 
        = BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE[AUDIO_BAR_MARK_ID+1]

        obj_UI_start_scene_config_audio_BGM_bar_alpha[1] = BGM_VOLUME*23
        obj_UI_start_scene_config_audio_SFX_bar_alpha[1] = SFX_VOLUME*23

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_config_audio_bar_mark,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_audio_BGM_bar_light,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_audio_SFX_bar_light,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_audio_BGM_bar_gauge,
            anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_audio_SFX_bar_gauge,
            anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_audio_text,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )

        init_point_linear_anim_with(
            obj_UI_start_scene_config_menu_dabo_trig,
            anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_menu_text,
            anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity
        )
        
        -- 更新 current_update_block
        current_update_block = update_start_scene_config_audio_ease_out
    end
end 
function update_start_scene_config_audio_bar_mark_twtich_up()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_audio_bar_mark,
        anim_UI_point_linear_start_scene_config_audio_bar_mark_up_y
    )

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性
        obj_UI_start_scene_config_audio_bar_mark[1] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION
        obj_UI_start_scene_config_audio_bar_mark[2] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE[AUDIO_BAR_MARK_ID+1]

        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_audio_main
    end
end 
function update_start_scene_config_audio_bar_mark_twtich_down()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_audio_bar_mark,
        anim_UI_point_linear_start_scene_config_audio_bar_mark_down_y
    )

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_audio_bar_mark[1] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION
        obj_UI_start_scene_config_audio_bar_mark[2] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE[AUDIO_BAR_MARK_ID+1]

        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_audio_main
    end
end 
function update_start_scene_config_audio_bar_mark_twtich_left_with_alpha()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    -- 仅此出口使用所需table
    local alpha_bar_table = {
        obj_UI_start_scene_config_audio_BGM_bar_alpha,
        obj_UI_start_scene_config_audio_SFX_bar_alpha
    }

    point_linear_animator(
        obj_UI_start_scene_config_audio_bar_mark,
        anim_UI_point_linear_start_scene_config_audio_bar_mark_left_x
    )
    point_linear_animator(
        alpha_bar_table[AUDIO_BAR_MARK_ID+1],
        anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_left_23_x
    )

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        
        -- 初始化此出口所需属性
        obj_UI_start_scene_config_audio_bar_mark[1] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION
        obj_UI_start_scene_config_audio_bar_mark[2] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE[AUDIO_BAR_MARK_ID+1]

        -- 仅此出口使用所需table
        local volume_table = {
            BGM_VOLUME,
            SFX_VOLUME
        }

        alpha_bar_table[AUDIO_BAR_MARK_ID+1][1] = volume_table[AUDIO_BAR_MARK_ID+1]*23

        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_audio_main
    end
end 
function update_start_scene_config_audio_bar_mark_twtich_left_without_alpha()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_audio_bar_mark,
        anim_UI_point_linear_start_scene_config_audio_bar_mark_left_x
    )

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_audio_bar_mark[1] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION
        obj_UI_start_scene_config_audio_bar_mark[2] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE[AUDIO_BAR_MARK_ID+1]

        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_audio_main
    end
end 
function update_start_scene_config_audio_bar_mark_twtich_right_with_alpha()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    -- 仅此出口使用所需table
    local alpha_bar_table = {
        obj_UI_start_scene_config_audio_BGM_bar_alpha,
        obj_UI_start_scene_config_audio_SFX_bar_alpha
    }

    point_linear_animator(
        obj_UI_start_scene_config_audio_bar_mark,
        anim_UI_point_linear_start_scene_config_audio_bar_mark_right_x
    )
    point_linear_animator(
        alpha_bar_table[AUDIO_BAR_MARK_ID+1],
        anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_right_23_x
    )

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_audio_bar_mark[1] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION
        obj_UI_start_scene_config_audio_bar_mark[2] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE[AUDIO_BAR_MARK_ID+1]

        -- 仅此出口使用所需table
        local volume_table = {
            BGM_VOLUME,
            SFX_VOLUME
        }

        alpha_bar_table[AUDIO_BAR_MARK_ID+1][1] = volume_table[AUDIO_BAR_MARK_ID+1]*23

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_audio_main
    end
end 
function update_start_scene_config_audio_bar_mark_twtich_right_without_alpha()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_audio_bar_mark,
        anim_UI_point_linear_start_scene_config_audio_bar_mark_right_x
    )
    
    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        
        -- 初始化此出口所需属性
        obj_UI_start_scene_config_audio_bar_mark[1] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_X_POSITION
        obj_UI_start_scene_config_audio_bar_mark[2] = 
        BAR_MARK_CONFIG_SUB_SCENE_AUDIO_Y_POSITION_TABLE[AUDIO_BAR_MARK_ID+1]

        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_audio_main
    end
end 
function update_start_scene_config_audio_ease_out()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )
    
    point_linear_animator(
        obj_UI_start_scene_config_audio_bar_mark,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_audio_BGM_bar_light,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_audio_SFX_bar_light,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_audio_BGM_bar_gauge,
        anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_audio_SFX_bar_gauge,
        anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_audio_text,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_menu_dabo_trig,
        anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_menu_text,
        anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity
    )

    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- init bar mark ID
        AUDIO_BAR_MARK_ID = 0

        -- 存档
        write_volume_config()
        
        -- 初始化此出口所需属性 但是目前没有
        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_main
        current_draw_block = draw_start_scene_config_sub_scene
    end
end 
    -- config controller 
function update_start_scene_config_controller_ease_in()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_controller_bar_mark_LP,
        anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_controller_bar_mark_RP,
        anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_controller_indi_text,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_menu_dabo_trig,
        anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_menu_text,
        anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity
    )

    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性 但是目前没有
        -- 初始化此出口所需要的动画机 但是目前没有

        INPUT_SYS_CURRENT_CONTROLLER["L"] = {nil,nil} 
        INPUT_SYS_CURRENT_CONTROLLER["R"] = {nil,nil}

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_controller_main
    end
end 
function update_start_scene_config_controller_main()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )
    -- controller indi bar mark 状态机
    state_machine_UI_start_scene_config_controller(obj_UI_start_scene_config_controller_bar_mark_LP,"L")
    state_machine_UI_start_scene_config_controller(obj_UI_start_scene_config_controller_bar_mark_RP,"R")

    -- 场景出口
    if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["HS"] == "Pressing" or INPUT_SYS_CURRENT_COMMAND_STATE["R"]["HS"] == "Pressing" then
        SCENE_TIMER = 0

        play_obj_audio(audio_SFX_start_scene_exit_1)

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_controller_bar_mark_LP[4] = 0.5
        obj_UI_start_scene_config_controller_bar_mark_RP[4] = 0.5

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_config_controller_bar_mark_LP,
            anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_controller_bar_mark_RP,
            anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_controller_indi_text,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )

        init_point_linear_anim_with(
            obj_UI_start_scene_config_menu_dabo_trig,
            anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_menu_text,
            anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity
        )

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_controller_ease_out
    end
end 
function update_start_scene_config_controller_ease_out()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_controller_bar_mark_LP,
        anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_controller_bar_mark_RP,
        anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_controller_indi_text,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_menu_dabo_trig,
        anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_menu_text,
        anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity
    )

    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性 但是目前没有
        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_main
        current_draw_block = draw_start_scene_config_sub_scene
    end
end 
    -- config resolution 
function update_start_scene_config_resolution_ease_in()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_resolution_bar_mark,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_resolution_w_x_h,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_resolution_select_res_text,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_menu_dabo_trig,
        anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_menu_text,
        anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity
    )

    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性 但是目前没有
        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_resolution_main
    end
end 
function update_start_scene_config_resolution_main()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["left"] == "Pressing" then
        SCENE_TIMER = 0

        play_obj_audio(audio_SFX_start_scene_left_1)

        if RES_PARTTEN ~= 0 then
            RES_PARTTEN = RES_PARTTEN - 1
        end

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_resolution_w_x_h[8] = RES_PARTTEN
        obj_UI_start_scene_config_resolution_bar_mark[1] = BAR_MARK_CONFIG_SUB_SCENE_RESOLUTION_X_POSITION
        obj_UI_start_scene_config_resolution_bar_mark[2] = BAR_MARK_CONFIG_SUB_SCENE_RESOLUTION_Y_POSITION

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_config_resolution_bar_mark,
            anim_UI_point_linear_start_scene_config_resolution_bar_mark_left_x
        )

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_resolution_bar_mark_twtich_left

    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["right"] == "Pressing" then
        SCENE_TIMER = 0
        
        play_obj_audio(audio_SFX_start_scene_right_1)

        if RES_PARTTEN ~= 4 then
            RES_PARTTEN = RES_PARTTEN + 1
        end

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_resolution_w_x_h[8] = RES_PARTTEN
        obj_UI_start_scene_config_resolution_bar_mark[1] = BAR_MARK_CONFIG_SUB_SCENE_RESOLUTION_X_POSITION
        obj_UI_start_scene_config_resolution_bar_mark[2] = BAR_MARK_CONFIG_SUB_SCENE_RESOLUTION_Y_POSITION

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_config_resolution_bar_mark,
            anim_UI_point_linear_start_scene_config_resolution_bar_mark_right_x
        )

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_resolution_bar_mark_twtich_right

    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
        set_current_resolution()

    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["HS"] == "Pressing" then
        SCENE_TIMER = 0

        play_obj_audio(audio_SFX_start_scene_exit_1)

        -- 初始化此出口所需属性
        obj_UI_start_scene_config_resolution_bar_mark[4] = 1
        obj_UI_start_scene_config_resolution_w_x_h[4] = 1
        obj_UI_start_scene_config_resolution_select_res_text[4] = 1
        obj_UI_start_scene_config_menu_dabo_trig[4] = 0.5
        obj_UI_start_scene_config_menu_text[4] = 0.5

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_config_resolution_bar_mark,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_resolution_w_x_h,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_resolution_select_res_text,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
    
        init_point_linear_anim_with(
            obj_UI_start_scene_config_menu_dabo_trig,
            anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_config_menu_text,
            anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity
        )

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_resolution_ease_out
    end
end 
function update_start_scene_config_resolution_bar_mark_twtich_left()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_resolution_bar_mark,
        anim_UI_point_linear_start_scene_config_resolution_bar_mark_left_x
    )


    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性 但是目前没有
        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_resolution_main
    end
end 
function update_start_scene_config_resolution_bar_mark_twtich_right()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_resolution_bar_mark,
        anim_UI_point_linear_start_scene_config_resolution_bar_mark_right_x
    )

    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性 但是目前没有
        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_resolution_main
    end
end 
function update_start_scene_config_resolution_ease_out()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_resolution_bar_mark,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_resolution_w_x_h,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_resolution_select_res_text,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_config_menu_dabo_trig,
        anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_config_menu_text,
        anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity
    )

    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性 但是目前没有
        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_config_main
        current_draw_block = draw_start_scene_config_sub_scene
    end
end 
-- record
function update_start_scene_record_ease_in()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_shutter,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_dabo_trig,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_game_duration_text,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_num_0,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_num_1,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_num_2,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_num_3,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_num_4,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_num_5,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_100h_plus_time_indi,
        anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity
    )

    point_linear_animator(
        audio_BGM_start_scene_NOC_high,
        anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0
    )
    point_linear_animator(
        audio_BGM_start_scene_NOC_low,
        anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume
    )

    update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)
    update_BGM_VOLUME(audio_BGM_start_scene_NOC_low)

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 初始化此出口所需属性 但是目前没有
        -- 初始化此出口所需要的动画机 但是目前没有

        -- 更新 current_update_block
        current_update_block = update_start_scene_record_main
    end
end
function update_start_scene_record_main()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    obj_UI_start_scene_record_num_0[8] = GAME_DURATION[1]
    obj_UI_start_scene_record_num_1[8] = GAME_DURATION[2]
    obj_UI_start_scene_record_num_2[8] = GAME_DURATION[3]
    obj_UI_start_scene_record_num_3[8] = GAME_DURATION[4]
    obj_UI_start_scene_record_num_4[8] = GAME_DURATION[5]
    obj_UI_start_scene_record_num_5[8] = GAME_DURATION[6]

    -- 场景出口
    if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["up"] == "Pressing" then
        SCENE_TIMER = 0

        play_obj_audio(audio_SFX_start_scene_up_1)

        -- 初始化此出口所需属性
        obj_UI_start_scene_record_dabo_trig[2] = 
        DABO_TIRG_RECORD_SUB_SCENE_Y_POSITION

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_record_dabo_trig,
            anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y
        )

        -- 更新 current_update_block
        current_update_block = update_start_scene_record_twitch_up
        

    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["down"] == "Pressing" then
        SCENE_TIMER = 0

        play_obj_audio(audio_SFX_start_scene_down_1)
        
        -- 初始化此出口所需属性
        obj_UI_start_scene_record_dabo_trig[2] = 
        DABO_TIRG_RECORD_SUB_SCENE_Y_POSITION

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_record_dabo_trig,
            anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y
        )

        -- 更新 current_update_block
        current_update_block = update_start_scene_record_twitch_down

    elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" or INPUT_SYS_CURRENT_COMMAND_STATE["L"]["HS"] == "Pressing" then
        SCENE_TIMER = 0

        play_obj_audio(audio_SFX_start_scene_exit_1)

        -- 初始化此出口所需属性
        obj_UI_start_scene_shutter[4] = 1
        obj_UI_start_scene_record_dabo_trig[4] = 1
        obj_UI_start_scene_record_dabo_trig[2] = 
        DABO_TIRG_RECORD_SUB_SCENE_Y_POSITION
        obj_UI_start_scene_record_game_duration_text[4] = 1
        obj_UI_start_scene_record_num_0[4] = 1
        obj_UI_start_scene_record_num_1[4] = 1
        obj_UI_start_scene_record_num_2[4] = 1
        obj_UI_start_scene_record_num_3[4] = 1
        obj_UI_start_scene_record_num_4[4] = 1
        obj_UI_start_scene_record_num_5[4] = 1
        obj_UI_start_scene_record_100h_plus_time_indi[4] = 1
        audio_BGM_start_scene_NOC_high[1] = 0
        audio_BGM_start_scene_NOC_low[1] = 1

        -- 初始化此出口所需要的动画机
        init_point_linear_anim_with(
            obj_UI_start_scene_shutter,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_record_dabo_trig,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_record_game_duration_text,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_record_num_0,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_record_num_1,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_record_num_2,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_record_num_3,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_record_num_4,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_record_num_5,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            obj_UI_start_scene_record_100h_plus_time_indi,
            anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
        )
        init_point_linear_anim_with(
            audio_BGM_start_scene_NOC_high,
            anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume
        )
        init_point_linear_anim_with(
            audio_BGM_start_scene_NOC_low,
            anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0
        )

        update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)
        update_BGM_VOLUME(audio_BGM_start_scene_NOC_low)

        -- 更新 current_update_block
        current_update_block = update_start_scene_record_ease_out
    end
end
function update_start_scene_record_twitch_up()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_record_dabo_trig,
        anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y
    )

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 更新 current_update_block
        current_update_block = update_start_scene_record_main
    end
end
function update_start_scene_record_twitch_down()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    point_linear_animator(
        obj_UI_start_scene_record_dabo_trig,
        anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y
    )

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 更新 current_update_block
        current_update_block = update_start_scene_record_main
    end
end
function update_start_scene_record_ease_out()
    SCENE_TIMER = SCENE_TIMER + 1
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    point_linear_animator(
        obj_UI_start_scene_breath_tag,
        anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity
    )
    frame_animator(
        obj_UI_start_scene_console_type_in_mark,
        anim_UI_frame_start_scene_console_type_in_mark_blink_opacity
    )

    -- 初始化此出口所需要的动画机
    point_linear_animator(
        obj_UI_start_scene_shutter,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_dabo_trig,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_game_duration_text,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_num_0,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_num_1,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_num_2,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_num_3,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_num_4,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_num_5,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        obj_UI_start_scene_record_100h_plus_time_indi,
        anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity
    )
    point_linear_animator(
        audio_BGM_start_scene_NOC_high,
        anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume
    )
    point_linear_animator(
        audio_BGM_start_scene_NOC_low,
        anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0
    )

    update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)
    update_BGM_VOLUME(audio_BGM_start_scene_NOC_low)

    -- 场景出口
    if SCENE_TIMER >= 5 then
        SCENE_TIMER = 0
        -- 更新 current_update_block
        current_update_block = update_start_scene_main
        current_draw_block = draw_start_scene_main
    end
end
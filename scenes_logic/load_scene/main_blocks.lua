-- 此功能也是一个场景离开时用的场景出口示例

function update_load_scene_load_pre_timer()
    -- 场景时间更新
    SCENE_TIMER = SCENE_TIMER + 1

    -- 场景出口
    if SCENE_TIMER >= 20 then 
        load_disclaimer_logos_scene_prep()
        -------------------------------------------------------------------------
        -- 以下直到end为止 是所有其他scene转load scene ease in之前所都必须的步骤
        -- 将load_disclaimer_logos_scene_prep() 替换为你所需要加载的scene对应的prep
        -------------------------------------------------------------------------
        load_scene_prep_routine()

    end
end
function update_load_scene_ease_in()
    SCENE_TIMER = SCENE_TIMER + 1

    -- debug
    -- print(obj_UI_load_scene_dabo_trig["FCT"][1],
    -- obj_UI_load_scene_type_in_mark["FCT"][4],
    -- obj_UI_load_scene_loading_text["FCT"][4],
    -- SCENE_TIMER)
    
    -- 动画机的运行 每个obj的FCT和SCENE timer保持一致
    frame_animator(obj_UI_load_scene_dabo_trig,anim_UI_frame_load_scene_dabo_trig_ease_in_x)
    frame_animator(obj_UI_load_scene_type_in_mark,anim_UI_frame_load_scene_type_in_mark_ease_in_opacity)
    frame_animator(obj_UI_load_scene_loading_text,anim_UI_frame_load_scene_loading_text_ease_in_opacity)

    if audio_UI_SFX_load_scene_general_start_load["audio"]:isPlaying() == false and 
    audio_UI_SFX_load_scene_general_loading["audio"]:isPlaying() == false  and
    LOADING_AUDIO_PLAYED_ONCE == false then
        play_obj_audio(audio_UI_SFX_load_scene_general_loading)
        LOADING_AUDIO_PLAYED_ONCE = true
    end


    -- 场景出口
    -- SCENE_TIMER >= 7 是为了使得audio_UI_SFX_load_scene_start_load正常播放完
    -- ******************************************
    -- ******************************************
    --  这是个将来需要研究的问题
    -- ******************************************
    -- ******************************************
    if audio_UI_SFX_load_scene_general_start_load["audio"]:isPlaying() == false and
    SCENE_TIMER >= 5 then

        -- 将SCENE_TIMER设为 0   
        -- 所有obj如果动画机正常运行应该处都处于正确的位置 不进行直接修改
        -- 如果出现了错误 请修改动画机
        SCENE_TIMER = 0

        -- 改变audio
        if audio_UI_SFX_load_scene_general_loading["audio"]:isPlaying() == false and
        LOADING_AUDIO_PLAYED_ONCE == false then
            play_obj_audio(audio_UI_SFX_load_scene_general_loading)
            LOADING_AUDIO_PLAYED_ONCE = true
        end

        -- 初始化update所需要的动画机  obj对应的FCT设为0
        init_frame_anim_with(obj_UI_load_scene_type_in_mark,anim_UI_frame_load_scene_type_in_mark_blink_opacity)

        -- 下一个场景为 update_load_scene_general
        current_update_block = update_load_scene_general

    end
end
function update_load_scene_general()
    SCENE_TIMER = SCENE_TIMER + 1
    
    -- -- debug
    -- print(UI_load_scene_type_in_mark["FCT"][4],
    -- SCENE_TIMER)

    -- 动画机的运行 每个obj的FCT和SCENE timer保持一致
    frame_animator(obj_UI_load_scene_type_in_mark,anim_UI_frame_load_scene_type_in_mark_blink_opacity)

    -- 加载图像的实际线程功能
    run_table_order_load()

    -- 场景出口
    if LOADING_FUNCTION_AMOUNT == 0 and SCENE_TIMER >= 60 then

        -- 将SCENE_TIMER设为 0
        -- 所有obj如果动画机正常运行应该处都处于正确的位置 不进行直接修改
        -- 如果出现了错误 请修改动画机
        SCENE_TIMER = 0

        -- 改变audio
        love.audio.stop()
        play_obj_audio(audio_UI_SFX_load_scene_general_end_load)

        -- load_scene的AE文件为准进行直接修改
        obj_UI_load_scene_type_in_mark[4] = 0

        -- 初始化update所需要的动画机  obj对应的FCT设为0
        init_frame_anim_with(obj_UI_load_scene_dabo_trig,anim_UI_frame_load_scene_dabo_trig_ease_out_x)
        init_frame_anim_with(obj_UI_load_scene_dabo_trig,anim_UI_frame_load_scene_dabo_trig_ease_out_opacity)
        init_frame_anim_with(obj_UI_load_scene_loading_text,anim_UI_frame_load_scene_loading_text_ease_out_x)
        init_frame_anim_with(obj_UI_load_scene_loading_text,anim_UI_frame_load_scene_loading_text_ease_out_opacity)

        -- 下一个场景为 update_load_scene_ease_out
        current_update_block = update_load_scene_ease_out

    end
end
function update_load_scene_ease_out()
    SCENE_TIMER = SCENE_TIMER + 1
    
    -- -- debug
    -- print(obj_UI_load_scene_dabo_trig["FCT"][1],
    -- obj_UI_load_scene_dabo_trig["FCT"][4],
    -- obj_UI_load_scene_loading_text["FCT"][4],
    -- SCENE_TIMER)

    -- 动画机的运行 每个obj的FCT和SCENE timer保持一致
    frame_animator(obj_UI_load_scene_dabo_trig,anim_UI_frame_load_scene_dabo_trig_ease_out_x)
    frame_animator(obj_UI_load_scene_dabo_trig,anim_UI_frame_load_scene_dabo_trig_ease_out_opacity)
    frame_animator(obj_UI_load_scene_loading_text,anim_UI_frame_load_scene_loading_text_ease_out_x)
    frame_animator(obj_UI_load_scene_loading_text,anim_UI_frame_load_scene_loading_text_ease_out_opacity)

    -- 已经加载完了图像 不运行加载图像的实际线程功能
    -- run_table_order_load()

    -- 场景出口
    if get_frame_anim_end_state(obj_UI_load_scene_dabo_trig,anim_UI_frame_load_scene_dabo_trig_ease_out_x) and 
    get_frame_anim_end_state(obj_UI_load_scene_dabo_trig,anim_UI_frame_load_scene_dabo_trig_ease_out_opacity) and
    get_frame_anim_end_state(obj_UI_load_scene_loading_text,anim_UI_frame_load_scene_loading_text_ease_out_x) and
    get_frame_anim_end_state(obj_UI_load_scene_loading_text,anim_UI_frame_load_scene_loading_text_ease_out_opacity) and
    SCENE_TIMER >= 5 then

        -- 将SCENE_TIMER设为 0
        -- 所有obj如果动画机正常运行应该处都处于正确的位置 不进行直接修改
        -- 如果出现了错误 请修改动画机
        SCENE_TIMER = 0

        -- 改变audio
        love.audio.stop()

        -- 初始化下一个场景所需要动画机器

        NEXT_PRESET()

        -- 下一个场景为 在prep预存的下一场景指针
        current_update_block = NEXT_UPDATE_BLOCK
        current_draw_block = NEXT_DRAW_BLOCK

        -- 初始化线程加载用function的输入
        -- 如果是一般的scene 需要使用 unload
        init_order_load_table()

    end
end

-- load_prep
function load_scene_prep_routine()

    -- 初始化/加载load_scene所需要的所有素材 对象 动画 图片 音频
    init_load_scene_obj()
    init_load_scene_anim()
    init_load_scene_image()
    init_load_scene_audio()

    -- 将SCENE_TIMER设为 0   所有obj的当前数据（ 场景时间 = 20 动画时间 = 0）load_scene的AE文件为准进行直接修改
    SCENE_TIMER = 0
    LOADING_AUDIO_PLAYED_ONCE = false
    obj_UI_load_scene_dabo_trig[4] = 1

    -- 初始化ease_in所需要的动画机  obj对应的FCT设为0
    ---------------------------------------------------------------------------------
    -- 这里使用init_frame_anim_with是因为frame animator是在运行完之后才加timer的
    -- 在这里运行确保在将SCENE_TIMER == 2的时候frame animator time为2的帧数能被实际运行
    -- 很重要 不要改
    ---------------------------------------------------------------------------------
    init_frame_anim_with(obj_UI_load_scene_dabo_trig,anim_UI_frame_load_scene_dabo_trig_ease_in_x)
    init_frame_anim_with(obj_UI_load_scene_type_in_mark,anim_UI_frame_load_scene_type_in_mark_ease_in_opacity)
    init_frame_anim_with(obj_UI_load_scene_loading_text,anim_UI_frame_load_scene_loading_text_ease_in_opacity)
    play_obj_audio(audio_UI_SFX_load_scene_general_start_load)

    -- 下一个场景为 update_load_scene_ease_in
    current_update_block = update_load_scene_ease_in
    current_draw_block = draw_load_scene_general
    
end
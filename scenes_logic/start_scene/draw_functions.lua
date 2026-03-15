function draw_start_scene_main()
    -- general
    draw_2d_image_table(obj_UI_start_scene_noise_bg,image_table_UI_start_scene_BG_loop)
    draw_2d_image(obj_UI_start_scene_main_logo,image_UI_start_scene_main_logo)
    draw_2d_image(obj_UI_start_scene_main_press_any_key,image_UI_start_scene_press_any_key)
    draw_2d_image(obj_UI_start_scene_breath_tag,image_UI_start_scene_breath_tag)
    draw_2d_image_table(obj_UI_start_scene_option_text,image_table_UI_start_scene_option_text)
    draw_2d_image(obj_UI_start_scene_console_dabo_trig,image_UI_start_scene_global_dabo_trig)
    draw_2d_image(obj_UI_start_scene_console_type_in_mark,image_UI_start_scene_global_type_in_mark)
    draw_2d_image_table(obj_UI_start_scene_down_console_text,image_table_UI_start_scene_down_console_text)
    draw_2d_image_table(obj_UI_start_scene_up_console_text,image_table_UI_start_scene_up_console_text)

    -- solid
    draw_solid(obj_UI_start_scene_solid_color)
end
function draw_start_scene_config_sub_scene()
    -- general part
    draw_2d_image_table(obj_UI_start_scene_noise_bg,image_table_UI_start_scene_BG_loop)
    draw_2d_image(obj_UI_start_scene_main_logo,image_UI_start_scene_main_logo)
    draw_2d_image(obj_UI_start_scene_main_press_any_key,image_UI_start_scene_press_any_key)
    draw_2d_image(obj_UI_start_scene_breath_tag,image_UI_start_scene_breath_tag)
    draw_2d_image_table(obj_UI_start_scene_option_text,image_table_UI_start_scene_option_text)
    draw_2d_image(obj_UI_start_scene_console_dabo_trig,image_UI_start_scene_global_dabo_trig)
    draw_2d_image(obj_UI_start_scene_console_type_in_mark,image_UI_start_scene_global_type_in_mark)
    draw_2d_image_table(obj_UI_start_scene_down_console_text,image_table_UI_start_scene_down_console_text)
    draw_2d_image_table(obj_UI_start_scene_up_console_text,image_table_UI_start_scene_up_console_text)

    -- config sub scene sp
    draw_2d_image(obj_UI_start_scene_shutter,image_UI_start_scene_shutter)
    draw_2d_image(obj_UI_start_scene_config_menu_dabo_trig,image_UI_start_scene_global_dabo_trig)
    draw_2d_image(obj_UI_start_scene_config_menu_text,image_UI_start_scene_config_menu_text)

    -- solid
    draw_solid(obj_UI_start_scene_solid_color)
end
function draw_start_scene_config_audio_sub_scene()
    -- general part
    draw_2d_image_table(obj_UI_start_scene_noise_bg,image_table_UI_start_scene_BG_loop)
    draw_2d_image(obj_UI_start_scene_main_logo,image_UI_start_scene_main_logo)
    draw_2d_image(obj_UI_start_scene_main_press_any_key,image_UI_start_scene_press_any_key)
    draw_2d_image(obj_UI_start_scene_breath_tag,image_UI_start_scene_breath_tag)
    draw_2d_image_table(obj_UI_start_scene_option_text,image_table_UI_start_scene_option_text)
    draw_2d_image(obj_UI_start_scene_console_dabo_trig,image_UI_start_scene_global_dabo_trig)
    draw_2d_image(obj_UI_start_scene_console_type_in_mark,image_UI_start_scene_global_type_in_mark)
    draw_2d_image_table(obj_UI_start_scene_down_console_text,image_table_UI_start_scene_down_console_text)
    draw_2d_image_table(obj_UI_start_scene_up_console_text,image_table_UI_start_scene_up_console_text)

    -- config sub scene sp
    draw_2d_image(obj_UI_start_scene_shutter,image_UI_start_scene_shutter)
    draw_2d_image(obj_UI_start_scene_config_menu_dabo_trig,image_UI_start_scene_global_dabo_trig)
    draw_2d_image(obj_UI_start_scene_config_menu_text,image_UI_start_scene_config_menu_text)

    -- config sub scene audio sp
    draw_2d_image(obj_UI_start_scene_config_audio_bar_mark,image_UI_start_scene_bar_mark)
    draw_2d_image(obj_UI_start_scene_config_audio_BGM_bar_gauge,image_UI_start_scene_config_audio_bar)
    draw_2d_image(obj_UI_start_scene_config_audio_SFX_bar_gauge,image_UI_start_scene_config_audio_bar)
    draw_start_scene_sp_audio_bar(
        obj_UI_start_scene_config_audio_BGM_bar_light,
        obj_UI_start_scene_config_audio_BGM_bar_alpha[1],
        image_UI_start_scene_config_audio_bar
    )
    draw_start_scene_sp_audio_bar(
        obj_UI_start_scene_config_audio_SFX_bar_light,
        obj_UI_start_scene_config_audio_SFX_bar_alpha[1],
        image_UI_start_scene_config_audio_bar
    )
    draw_2d_image(obj_UI_start_scene_config_audio_text,image_UI_start_scene_config_audio_text)

    -- solid
    draw_solid(obj_UI_start_scene_solid_color)
end
function draw_start_scene_config_controller_sub_scene()
    -- general part
    draw_2d_image_table(obj_UI_start_scene_noise_bg,image_table_UI_start_scene_BG_loop)
    draw_2d_image(obj_UI_start_scene_main_logo,image_UI_start_scene_main_logo)
    draw_2d_image(obj_UI_start_scene_breath_tag,image_UI_start_scene_breath_tag)
    draw_2d_image_table(obj_UI_start_scene_option_text,image_table_UI_start_scene_option_text)
    draw_2d_image(obj_UI_start_scene_console_dabo_trig,image_UI_start_scene_global_dabo_trig)
    draw_2d_image(obj_UI_start_scene_console_type_in_mark,image_UI_start_scene_global_type_in_mark)
    draw_2d_image_table(obj_UI_start_scene_down_console_text,image_table_UI_start_scene_down_console_text)
    draw_2d_image_table(obj_UI_start_scene_up_console_text,image_table_UI_start_scene_up_console_text)
    
    -- config sub scene sp
    draw_2d_image(obj_UI_start_scene_shutter,image_UI_start_scene_shutter)
    draw_2d_image(obj_UI_start_scene_config_menu_dabo_trig,image_UI_start_scene_global_dabo_trig)
    draw_2d_image(obj_UI_start_scene_config_menu_text,image_UI_start_scene_config_menu_text)

    -- config sub scene controller sp
    draw_2d_image(obj_UI_start_scene_config_controller_bar_mark_LP,image_UI_start_scene_bar_mark)
    draw_2d_image(obj_UI_start_scene_config_controller_bar_mark_RP,image_UI_start_scene_bar_mark)
    draw_2d_image(obj_UI_start_scene_config_controller_indi_text,image_UI_start_scene_controller_indi_text)
    
    -- solid
    draw_solid(obj_UI_start_scene_solid_color)
end
function draw_start_scene_config_resolution_sub_scene()
    -- general part
    draw_2d_image_table(obj_UI_start_scene_noise_bg,image_table_UI_start_scene_BG_loop)
    draw_2d_image(obj_UI_start_scene_main_logo,image_UI_start_scene_main_logo)
    draw_2d_image(obj_UI_start_scene_breath_tag,image_UI_start_scene_breath_tag)
    draw_2d_image_table(obj_UI_start_scene_option_text,image_table_UI_start_scene_option_text)
    draw_2d_image(obj_UI_start_scene_console_dabo_trig,image_UI_start_scene_global_dabo_trig)
    draw_2d_image(obj_UI_start_scene_console_type_in_mark,image_UI_start_scene_global_type_in_mark)
    draw_2d_image_table(obj_UI_start_scene_down_console_text,image_table_UI_start_scene_down_console_text)
    draw_2d_image_table(obj_UI_start_scene_up_console_text,image_table_UI_start_scene_up_console_text)
    
    -- config sub scene sp
    draw_2d_image(obj_UI_start_scene_shutter,image_UI_start_scene_shutter)
    draw_2d_image(obj_UI_start_scene_config_menu_dabo_trig,image_UI_start_scene_global_dabo_trig)
    draw_2d_image(obj_UI_start_scene_config_menu_text,image_UI_start_scene_config_menu_text)

    -- config sub scene resolution sp
    draw_2d_image(obj_UI_start_scene_config_resolution_bar_mark,image_UI_start_scene_bar_mark)
    draw_2d_image_table(obj_UI_start_scene_config_resolution_w_x_h,image_table_UI_start_scene_resolution_text)
    draw_2d_image(obj_UI_start_scene_config_resolution_select_res_text,image_UI_start_scene_select_res_text)
    
    -- solid
    draw_solid(obj_UI_start_scene_solid_color)
end
function draw_start_scene_record_sub_scene()
    -- general part
    draw_2d_image_table(obj_UI_start_scene_noise_bg,image_table_UI_start_scene_BG_loop)
    draw_2d_image(obj_UI_start_scene_main_logo,image_UI_start_scene_main_logo)
    draw_2d_image(obj_UI_start_scene_breath_tag,image_UI_start_scene_breath_tag)
    draw_2d_image_table(obj_UI_start_scene_option_text,image_table_UI_start_scene_option_text)
    draw_2d_image(obj_UI_start_scene_console_dabo_trig,image_UI_start_scene_global_dabo_trig)
    draw_2d_image(obj_UI_start_scene_console_type_in_mark,image_UI_start_scene_global_type_in_mark)
    draw_2d_image_table(obj_UI_start_scene_down_console_text,image_table_UI_start_scene_down_console_text)
    draw_2d_image_table(obj_UI_start_scene_up_console_text,image_table_UI_start_scene_up_console_text)

    -- resolution sub scene sp
    draw_2d_image(obj_UI_start_scene_shutter,image_UI_start_scene_shutter)
    draw_start_scene_sp_record_100h_plus_time_indi(
        obj_UI_start_scene_record_100h_plus_time_indi,
        image_UI_start_scene_time_indi_barcode
    )
    draw_2d_image(obj_UI_start_scene_record_dabo_trig,image_UI_start_scene_global_dabo_trig)
    draw_2d_image_table(obj_UI_start_scene_record_num_5,image_table_UI_start_scene_game_duration_number)
    draw_2d_image_table(obj_UI_start_scene_record_num_4,image_table_UI_start_scene_game_duration_number)
    draw_2d_image_table(obj_UI_start_scene_record_num_3,image_table_UI_start_scene_game_duration_number)
    draw_2d_image_table(obj_UI_start_scene_record_num_2,image_table_UI_start_scene_game_duration_number)
    draw_2d_image_table(obj_UI_start_scene_record_num_1,image_table_UI_start_scene_game_duration_number)
    draw_2d_image_table(obj_UI_start_scene_record_num_0,image_table_UI_start_scene_game_duration_number)
    draw_2d_image(obj_UI_start_scene_record_game_duration_text,image_UI_start_scene_game_duration_text)
    
    -- solid
    draw_solid(obj_UI_start_scene_solid_color)
end
function draw_start_scene_sp_audio_bar(obj_light,volume,image)
    local x = draw_resolution_correction(obj_light[1])
    local y = draw_resolution_correction(obj_light[2])
    local sx = draw_resolution_correction(obj_light[5])
    local sy = draw_resolution_correction(obj_light[6])

    love.graphics.setCanvas(CANVAS_BAR)
    love.graphics.draw(image)
    love.graphics.setBlendMode('multiply','premultiplied')
    love.graphics.draw(CANVAS_BAR_ALPHA_ONLY,volume)
    love.graphics.setBlendMode('alpha','alphamultiply')
    love.graphics.setCanvas()
    
    love.graphics.setColor(1,1,1,obj_light[4])
    love.graphics.draw(CANVAS_BAR,x,y,0,sx,sy)
    love.graphics.setColor(1,1,1,1)
end
function draw_start_scene_sp_record_100h_plus_time_indi(obj,image)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])

    local cto_25 = CTO_COUNT*25

    love.graphics.setCanvas(CANVAS_RECORD)
    love.graphics.draw(image)
    love.graphics.setBlendMode('multiply','premultiplied')
    love.graphics.draw(CANVAS_RECORD_ALPHA_ONLY,cto_25)
    love.graphics.setBlendMode('alpha','alphamultiply')
    love.graphics.setCanvas()

    love.graphics.setColor(1,1,1,obj[4]*0.25)
    love.graphics.draw(image,x,y,0,sx,sy)
    love.graphics.setColor(1,1,1,1)

    love.graphics.setColor(1,1,1,obj[4])
    love.graphics.draw(CANVAS_RECORD,x,y,0,sx,sy)
    love.graphics.setColor(1,1,1,1)
end
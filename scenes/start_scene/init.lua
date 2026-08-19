-- load
function load_start_scene_obj()
    CANVAS_BAR = love.graphics.newCanvas(232,16)
    CANVAS_BAR_ALPHA_ONLY = love.graphics.newCanvas(232,16)
    CANVAS_RECORD = love.graphics.newCanvas(320,40)
    CANVAS_RECORD_ALPHA_ONLY = love.graphics.newCanvas(320,40)
    -- x y z opacity sx sy r f
    -- solid color
    obj_UI_start_scene_solid_color = {0,0,0,1,1,1,0,0}
    obj_UI_start_scene_solid_color["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_solid_color["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_solid_color["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_solid_color["state"] = "default"
    obj_UI_start_scene_solid_color["rgb"] = {7/255,19/255,31/255}
    -- record_100h_plus_time_indi
    obj_UI_start_scene_record_100h_plus_time_indi = {600,460,nil,0,1,1,0,0}
    obj_UI_start_scene_record_100h_plus_time_indi["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_100h_plus_time_indi["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_100h_plus_time_indi["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_100h_plus_time_indi["state"] = "default"
    -- record_dabo_trig
    obj_UI_start_scene_record_dabo_trig = {550,500,nil,0,1,1,0,0}
    obj_UI_start_scene_record_dabo_trig["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_dabo_trig["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_dabo_trig["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_dabo_trig["state"] = "default"
    -- record_num
    obj_UI_start_scene_record_num_0 = {600,425,nil,0,1,1,0,0}
    obj_UI_start_scene_record_num_0["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_0["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_0["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_0["state"] = "default"
    obj_UI_start_scene_record_num_1 = {613,425,nil,0,1,1,0,0}
    obj_UI_start_scene_record_num_1["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_1["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_1["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_1["state"] = "default"
    obj_UI_start_scene_record_num_2 = {635,425,nil,0,1,1,0,0}
    obj_UI_start_scene_record_num_2["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_2["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_2["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_2["state"] = "default"
    obj_UI_start_scene_record_num_3 = {648,425,nil,0,1,1,0,0}
    obj_UI_start_scene_record_num_3["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_3["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_3["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_3["state"] = "default"
    obj_UI_start_scene_record_num_4 = {671,425,nil,0,1,1,0,0}
    obj_UI_start_scene_record_num_4["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_4["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_4["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_4["state"] = "default"
    obj_UI_start_scene_record_num_5 = {684,425,nil,0,1,1,0,0}
    obj_UI_start_scene_record_num_5["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_5["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_5["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_num_5["state"] = "default"
    -- record_game_duration_text
    obj_UI_start_scene_record_game_duration_text = {600,400,nil,0,1,1,0,0}
    obj_UI_start_scene_record_game_duration_text["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_game_duration_text["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_game_duration_text["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_record_game_duration_text["state"] = "default"
    -- config_resolution_bar_mark
    obj_UI_start_scene_config_resolution_bar_mark = {1000,530,nil,0,1,1,0,0}
    obj_UI_start_scene_config_resolution_bar_mark["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_resolution_bar_mark["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_resolution_bar_mark["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_resolution_bar_mark["state"] = "default"
    -- config_resolution_w_x_h
    obj_UI_start_scene_config_resolution_w_x_h = {1030,530,nil,0,1,1,0,0}
    obj_UI_start_scene_config_resolution_w_x_h["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_resolution_w_x_h["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_resolution_w_x_h["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_resolution_w_x_h["state"] = "default"
    -- config_resolution_select_res_text
    obj_UI_start_scene_config_resolution_select_res_text = {955,480,nil,0,1,1,0,0}
    obj_UI_start_scene_config_resolution_select_res_text["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_resolution_select_res_text["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_resolution_select_res_text["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_resolution_select_res_text["state"] = "default"
    -- config_controller_bar_mark
    obj_UI_start_scene_config_controller_bar_mark_LP = {1335,510,nil,0,1,1,0,0}
    obj_UI_start_scene_config_controller_bar_mark_LP["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_controller_bar_mark_LP["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_controller_bar_mark_LP["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_controller_bar_mark_LP["state"] = "default"
    obj_UI_start_scene_config_controller_bar_mark_RP = {1335,535,nil,0,1,1,0,0}
    obj_UI_start_scene_config_controller_bar_mark_RP["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_controller_bar_mark_RP["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_controller_bar_mark_RP["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_controller_bar_mark_RP["state"] = "default"
    -- config_controller_indi_text
    obj_UI_start_scene_config_controller_indi_text = {990,460,nil,0,1,1,0,0}
    obj_UI_start_scene_config_controller_indi_text["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_controller_indi_text["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_controller_indi_text["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_controller_indi_text["state"] = "default"
    -- config_audio_bar_mark
    obj_UI_start_scene_config_audio_bar_mark = {1296,400,nil,0,1,1,0,0}
    obj_UI_start_scene_config_audio_bar_mark["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_bar_mark["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_bar_mark["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_bar_mark["state"] = "default"
    -- config_audio_BGM_bar_ligh
    obj_UI_start_scene_config_audio_BGM_bar_light = {1055,400,nil,0,1,1,0,0}
    obj_UI_start_scene_config_audio_BGM_bar_light["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_BGM_bar_light["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_BGM_bar_light["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_BGM_bar_light["state"] = "default"
    -- SFX_bar_light
    obj_UI_start_scene_config_audio_SFX_bar_light = {1055,426,nil,0,1,1,0,0}
    obj_UI_start_scene_config_audio_SFX_bar_light["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_SFX_bar_light["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_SFX_bar_light["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_SFX_bar_light["state"] = "default"
    -- BGM_bar_alpha
    obj_UI_start_scene_config_audio_BGM_bar_alpha = {BGM_VOLUME*23,0,nil,0,1,1,0,0}
    obj_UI_start_scene_config_audio_BGM_bar_alpha["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_BGM_bar_alpha["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_BGM_bar_alpha["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_BGM_bar_alpha["state"] = "default"
    -- SFX_bar_alpha
    obj_UI_start_scene_config_audio_SFX_bar_alpha = {SFX_VOLUME*23,0,nil,0,1,1,0,0}
    obj_UI_start_scene_config_audio_SFX_bar_alpha["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_SFX_bar_alpha["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_SFX_bar_alpha["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_SFX_bar_alpha["state"] = "default"
    -- BGM_bar_gauge
    obj_UI_start_scene_config_audio_BGM_bar_gauge = {1055,400,nil,0,1,1,0,0}
    obj_UI_start_scene_config_audio_BGM_bar_gauge["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_BGM_bar_gauge["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_BGM_bar_gauge["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_BGM_bar_gauge["state"] = "default"
    -- SFX_bar_gauge
    obj_UI_start_scene_config_audio_SFX_bar_gauge = {1055,426,nil,0,1,1,0,0}
    obj_UI_start_scene_config_audio_SFX_bar_gauge["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_SFX_bar_gauge["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_SFX_bar_gauge["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_SFX_bar_gauge["state"] = "default"
    -- config_audio_text
    obj_UI_start_scene_config_audio_text = {995,400,nil,0,1,1,0,0}
    obj_UI_start_scene_config_audio_text["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_text["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_text["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_audio_text["state"] = "default"
    -- config_menu_dabo_trig
    obj_UI_start_scene_config_menu_dabo_trig = {590,390,nil,0,1,1,0,0}
    obj_UI_start_scene_config_menu_dabo_trig["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_menu_dabo_trig["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_menu_dabo_trig["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_menu_dabo_trig["state"] = "default"
    -- config_menu_text
    obj_UI_start_scene_config_menu_text = {640,390,nil,0,1,1,0,0}
    obj_UI_start_scene_config_menu_text["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_menu_text["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_menu_text["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_config_menu_text["state"] = "default"
    -- shutter
    obj_UI_start_scene_shutter = {0,0,nil,0,1,1,0,0}
    obj_UI_start_scene_shutter["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_shutter["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_shutter["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_shutter["state"] = "default"
    -- up_console_text
    obj_UI_start_scene_up_console_text = {130,50,nil,0,1,1,0,0}
    obj_UI_start_scene_up_console_text["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_up_console_text["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_up_console_text["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_up_console_text["state"] = "default"
    -- down_console_text
    obj_UI_start_scene_down_console_text = {130,75,nil,0,1,1,0,0}
    obj_UI_start_scene_down_console_text["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_down_console_text["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_down_console_text["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_down_console_text["state"] = "default"
    -- console_type_in_mark
    obj_UI_start_scene_console_type_in_mark = {1065,74,nil,0,1,1,0,0}
    obj_UI_start_scene_console_type_in_mark["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_console_type_in_mark["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_console_type_in_mark["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_console_type_in_mark["state"] = "default"
    -- console_dabo_trig
    obj_UI_start_scene_console_dabo_trig = {75,50,nil,0,1,1,0,0}
    obj_UI_start_scene_console_dabo_trig["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_console_dabo_trig["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_console_dabo_trig["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_console_dabo_trig["state"] = "default"
    -- option_text
    obj_UI_start_scene_option_text = {704,700,nil,0,1,1,0,0}
    obj_UI_start_scene_option_text["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_option_text["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_option_text["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_option_text["state"] = "default"
    -- breath_tag
    obj_UI_start_scene_breath_tag = {510,695,nil,0,1,1,0,0}
    obj_UI_start_scene_breath_tag["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_breath_tag["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_breath_tag["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_breath_tag["state"] = "default"
    -- logo
    obj_UI_start_scene_main_logo = {130,110,nil,1,0.9,0.9,0,0}
    obj_UI_start_scene_main_logo["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_main_logo["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_main_logo["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_main_logo["state"] = "default"
    -- press_any_key
    obj_UI_start_scene_main_press_any_key = {435,700,nil,1,0.8,0.8,0,0}
    obj_UI_start_scene_main_press_any_key["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_main_press_any_key["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_main_press_any_key["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_main_press_any_key["state"] = "default"
    -- noise_bg
    obj_UI_start_scene_noise_bg = {0,0,nil,1,1,1,0,0}
    obj_UI_start_scene_noise_bg["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_noise_bg["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_noise_bg["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_start_scene_noise_bg["state"] = "default"
end
function load_start_scene_anim()
    -- general_ease_in_0_1_opacity 
    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity = {}
    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity[0] = {0,5}
    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity[5] = {1,5}
    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity["prop"] = 4
    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity["length"] = 5
    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity["loop"] = false
    anim_UI_point_linear_start_scene_general_ease_in_0_1_opacity["fix_type"] = true
    -- general_ease_in_0p5_1_opacity
    anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity = {}
    anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity[0] = {0.5,5}
    anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity[5] = {1,5}
    anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity["prop"] = 4
    anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity["length"] = 5
    anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity["loop"] = false
    anim_UI_point_linear_start_scene_general_ease_in_0p5_1_opacity["fix_type"] = true
    -- general_ease_in_0_0p5_opacity
    anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity = {}
    anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity[0] = {0,5}
    anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity[5] = {0.5,5}
    anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity["prop"] = 4
    anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity["length"] = 5
    anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity["loop"] = false
    anim_UI_point_linear_start_scene_general_ease_in_0_0p5_opacity["fix_type"] = true
    -- general_ease_out_1_0_opacity
    anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity = {}
    anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity[0] = {1,5}
    anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity[5] = {0,5}
    anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity["prop"] = 4
    anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity["length"] = 5
    anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity["loop"] = false
    anim_UI_point_linear_start_scene_general_ease_out_1_0_opacity["fix_type"] = true
    -- general_ease_in_0_0p1_opacity
    anim_UI_point_linear_start_scene_general_ease_in_0_0p1_opacity = {}
    anim_UI_point_linear_start_scene_general_ease_in_0_0p1_opacity[0] = {0,5}
    anim_UI_point_linear_start_scene_general_ease_in_0_0p1_opacity[5] = {0.1,5}
    anim_UI_point_linear_start_scene_general_ease_in_0_0p1_opacity["prop"] = 4
    anim_UI_point_linear_start_scene_general_ease_in_0_0p1_opacity["length"] = 5
    anim_UI_point_linear_start_scene_general_ease_in_0_0p1_opacity["loop"] = false
    anim_UI_point_linear_start_scene_general_ease_in_0_0p1_opacity["fix_type"] = true
    -- general_ease_out_1_0p5_opacity
    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity = {}
    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity[0] = {1,5}
    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity[5] = {0.5,5}
    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity["prop"] = 4
    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity["length"] = 5
    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity["loop"] = false
    anim_UI_point_linear_start_scene_general_ease_out_1_0p5_opacity["fix_type"] = true
    -- general_ease_out_0p5_0_opacity
    anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity = {}
    anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity[0] = {0.5,5}
    anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity[5] = {0,5}
    anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity["prop"] = 4
    anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity["length"] = 5
    anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity["loop"] = false
    anim_UI_point_linear_start_scene_general_ease_out_0p5_0_opacity["fix_type"] = true
    -- solid_ease_in_opacity
    anim_UI_point_linear_start_scene_solid_ease_in_opacity = {}
    anim_UI_point_linear_start_scene_solid_ease_in_opacity[0] = {1,15}
    anim_UI_point_linear_start_scene_solid_ease_in_opacity[15] = {1,20}
    anim_UI_point_linear_start_scene_solid_ease_in_opacity[20] = {0.05,25}
    anim_UI_point_linear_start_scene_solid_ease_in_opacity[25] = {0.03,30}
    anim_UI_point_linear_start_scene_solid_ease_in_opacity[30] = {0,30}
    anim_UI_point_linear_start_scene_solid_ease_in_opacity["prop"] = 4
    anim_UI_point_linear_start_scene_solid_ease_in_opacity["length"] = 30
    anim_UI_point_linear_start_scene_solid_ease_in_opacity["loop"] = false
    anim_UI_point_linear_start_scene_solid_ease_in_opacity["fix_type"] = true
    -- breath_tag_breath_loop_opacity
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity = {}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[0] = {0.10,15}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[15] = {0.13,30}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[30] = {0.17,60}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[60] = {0.37,85}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[85] = {0.69,100}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[100] = {0.78,120}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[120] = {0.80,140}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[140] = {0.78,155}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[155] = {0.69,180}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[180] = {0.37,210}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[210] = {0.17,225}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[225] = {0.13,240}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity[240] = {0.10,240}
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity["prop"] = 4
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity["length"] = 240
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity["loop"] = true
    anim_UI_point_linear_start_scene_breath_tag_breath_loop_opacity["fix_type"] = true
    -- option_text_twitch_x
    anim_UI_point_linear_start_scene_option_text_twitch_x = {}
    anim_UI_point_linear_start_scene_option_text_twitch_x[0] = {704,1}
    anim_UI_point_linear_start_scene_option_text_twitch_x[1] = {684,2}
    anim_UI_point_linear_start_scene_option_text_twitch_x[2] = {684,3}
    anim_UI_point_linear_start_scene_option_text_twitch_x[3] = {724,4}
    anim_UI_point_linear_start_scene_option_text_twitch_x[4] = {684,5}
    anim_UI_point_linear_start_scene_option_text_twitch_x[5] = {704,5}
    anim_UI_point_linear_start_scene_option_text_twitch_x["prop"] = 1
    anim_UI_point_linear_start_scene_option_text_twitch_x["length"] = 5
    anim_UI_point_linear_start_scene_option_text_twitch_x["loop"] = false
    anim_UI_point_linear_start_scene_option_text_twitch_x["fix_type"] = false
    -- console_dabo_trig_twtich_x
    anim_UI_frame_start_scene_console_dabo_trig_twtich_x = {}
    anim_UI_frame_start_scene_console_dabo_trig_twtich_x[0] = {75,1}
    anim_UI_frame_start_scene_console_dabo_trig_twtich_x[1] = {90,4}
    anim_UI_frame_start_scene_console_dabo_trig_twtich_x[4] = {75,4}
    anim_UI_frame_start_scene_console_dabo_trig_twtich_x["prop"] = 1
    anim_UI_frame_start_scene_console_dabo_trig_twtich_x["length"] = 4
    anim_UI_frame_start_scene_console_dabo_trig_twtich_x["loop"] = false
    -- console_type_in_mark_blink_opacity
    anim_UI_frame_start_scene_console_type_in_mark_blink_opacity = {}
    anim_UI_frame_start_scene_console_type_in_mark_blink_opacity[0] = 0
    anim_UI_frame_start_scene_console_type_in_mark_blink_opacity[20] = 1
    anim_UI_frame_start_scene_console_type_in_mark_blink_opacity[40] = 0
    anim_UI_frame_start_scene_console_type_in_mark_blink_opacity["prop"] = 4
    anim_UI_frame_start_scene_console_type_in_mark_blink_opacity["length"] = 40
    anim_UI_frame_start_scene_console_type_in_mark_blink_opacity["loop"] = true
    -- config_menu_dabo_trig_up_0_y
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y = {}
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y[0] = {0,1}
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y[1] = {-3,3}
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y[3] = {2,5}
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y[5] = {0,5}
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y["prop"] = 2
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y["length"] = 5
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y["loop"] = false
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_up_0_y["fix_type"] = false
    -- config_menu_dabo_trig_down_0_y
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y = {}
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y[0] = {0,1}
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y[1] = {3,3}
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y[3] = {-2,5}
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y[5] = {0,5}
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y["prop"] = 2
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y["length"] = 5
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y["loop"] = false
    anim_UI_point_linear_start_scene_config_menu_dabo_trig_down_0_y["fix_type"] = false
    -- config_audio_general_bar_alpha_left_23_x
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_left_23_x = {}
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_left_23_x[0] = {0,1}
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_left_23_x[1] = {-15,5}
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_left_23_x[5] = {-23,5}
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_left_23_x["prop"] = 1
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_left_23_x["length"] = 5
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_left_23_x["loop"] = false
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_left_23_x["fix_type"] = false
    -- config_audio_general_bar_alpha_right_23_x
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_right_23_x = {}
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_right_23_x[0] = {0,1}
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_right_23_x[1] = {15,5}
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_right_23_x[5] = {23,5}
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_right_23_x["prop"] = 1
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_right_23_x["length"] = 5
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_right_23_x["loop"] = false
    anim_UI_point_linear_start_scene_config_audio_general_bar_alpha_right_23_x["fix_type"] = false
    -- config_audio_bar_mark_left_x
    anim_UI_point_linear_start_scene_config_audio_bar_mark_left_x = {}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_left_x[0] = {1296,1}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_left_x[1] = {1293,4}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_left_x[4] = {1296,4}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_left_x["prop"] = 1
    anim_UI_point_linear_start_scene_config_audio_bar_mark_left_x["length"] = 4
    anim_UI_point_linear_start_scene_config_audio_bar_mark_left_x["loop"] = false
    anim_UI_point_linear_start_scene_config_audio_bar_mark_left_x["fix_type"] = true
    -- config_audio_bar_mark_right_x
    anim_UI_point_linear_start_scene_config_audio_bar_mark_right_x = {}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_right_x[0] = {1296,1}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_right_x[1] = {1299,4}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_right_x[4] = {1296,4}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_right_x["prop"] = 1
    anim_UI_point_linear_start_scene_config_audio_bar_mark_right_x["length"] = 4
    anim_UI_point_linear_start_scene_config_audio_bar_mark_right_x["loop"] = false
    anim_UI_point_linear_start_scene_config_audio_bar_mark_right_x["fix_type"] = true
    -- config_audio_bar_mark_up_y
    anim_UI_point_linear_start_scene_config_audio_bar_mark_up_y = {}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_up_y[0] = {400,1}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_up_y[1] = {394,4}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_up_y[4] = {400,4}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_up_y["prop"] = 2
    anim_UI_point_linear_start_scene_config_audio_bar_mark_up_y["length"] = 4
    anim_UI_point_linear_start_scene_config_audio_bar_mark_up_y["loop"] = false
    anim_UI_point_linear_start_scene_config_audio_bar_mark_up_y["fix_type"] = false
    -- config_audio_bar_mark_down_y
    anim_UI_point_linear_start_scene_config_audio_bar_mark_down_y = {}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_down_y[0] = {400,1}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_down_y[1] = {406,4}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_down_y[4] = {400,4}
    anim_UI_point_linear_start_scene_config_audio_bar_mark_down_y["prop"] = 2
    anim_UI_point_linear_start_scene_config_audio_bar_mark_down_y["length"] = 4
    anim_UI_point_linear_start_scene_config_audio_bar_mark_down_y["loop"] = false
    anim_UI_point_linear_start_scene_config_audio_bar_mark_down_y["fix_type"] = false
    -- config_resolution_bar_mark_left_x 
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_left_x = {}
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_left_x[0] = {1000,1}
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_left_x[1] = {994,4}
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_left_x[4] = {1000,4}
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_left_x["prop"] = 1
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_left_x["length"] = 4
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_left_x["loop"] = false
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_left_x["fix_type"] = true
    -- config_resolution_bar_mark_right_x 
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_right_x = {}
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_right_x[0] = {1000,1}
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_right_x[1] = {1006,4}
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_right_x[4] = {1000,4}
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_right_x["prop"] = 1
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_right_x["length"] = 4
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_right_x["loop"] = false
    anim_UI_point_linear_start_scene_config_resolution_bar_mark_right_x["fix_type"] = true
    -- record_dabo_trig_up_y
    anim_UI_point_linear_start_scene_record_dabo_trig_up_y = {}
    anim_UI_point_linear_start_scene_record_dabo_trig_up_y[0] = {400,1}
    anim_UI_point_linear_start_scene_record_dabo_trig_up_y[1] = {455,3}
    anim_UI_point_linear_start_scene_record_dabo_trig_up_y[3] = {480,5}
    anim_UI_point_linear_start_scene_record_dabo_trig_up_y[5] = {475,5}
    anim_UI_point_linear_start_scene_record_dabo_trig_up_y["prop"] = 2
    anim_UI_point_linear_start_scene_record_dabo_trig_up_y["length"] = 5
    anim_UI_point_linear_start_scene_record_dabo_trig_up_y["loop"] = false
    anim_UI_point_linear_start_scene_record_dabo_trig_up_y["fix_type"] = true
    -- record_dabo_trig_down_y
    anim_UI_point_linear_start_scene_record_dabo_trig_down_y = {}
    anim_UI_point_linear_start_scene_record_dabo_trig_down_y[0] = {475,1}
    anim_UI_point_linear_start_scene_record_dabo_trig_down_y[1] = {420,3}
    anim_UI_point_linear_start_scene_record_dabo_trig_down_y[3] = {395,5}
    anim_UI_point_linear_start_scene_record_dabo_trig_down_y[5] = {400,5}
    anim_UI_point_linear_start_scene_record_dabo_trig_down_y["prop"] = 2
    anim_UI_point_linear_start_scene_record_dabo_trig_down_y["length"] = 5
    anim_UI_point_linear_start_scene_record_dabo_trig_down_y["loop"] = false
    anim_UI_point_linear_start_scene_record_dabo_trig_down_y["fix_type"] = true
end
function load_start_scene_audio()
    -- confirm
    audio_SFX_start_scene_confirm_0 = {1}
    audio_SFX_start_scene_confirm_0["LCT"] = {0}
    audio_SFX_start_scene_confirm_0["LCD"] = {0}
    audio_SFX_start_scene_confirm_0["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_confirm_0.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_confirm_0)
    audio_SFX_start_scene_confirm_1 = {1}
    audio_SFX_start_scene_confirm_1["LCT"] = {0}
    audio_SFX_start_scene_confirm_1["LCD"] = {0}
    audio_SFX_start_scene_confirm_1["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_confirm_1.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_confirm_1)
    audio_SFX_start_scene_confirm_2 = {1}
    audio_SFX_start_scene_confirm_2["LCT"] = {0}
    audio_SFX_start_scene_confirm_2["LCD"] = {0}
    audio_SFX_start_scene_confirm_2["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_confirm_2.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_confirm_2)
    audio_SFX_start_scene_confirm_3 = {1}
    audio_SFX_start_scene_confirm_3["LCT"] = {0}
    audio_SFX_start_scene_confirm_3["LCD"] = {0}
    audio_SFX_start_scene_confirm_3["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_confirm_3.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_confirm_3)
    -- exit
    audio_SFX_start_scene_exit_0 = {1}
    audio_SFX_start_scene_exit_0["LCT"] = {0}
    audio_SFX_start_scene_exit_0["LCD"] = {0}
    audio_SFX_start_scene_exit_0["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_exit_0.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_exit_0)
    audio_SFX_start_scene_exit_1 = {1}
    audio_SFX_start_scene_exit_1["LCT"] = {0}
    audio_SFX_start_scene_exit_1["LCD"] = {0}
    audio_SFX_start_scene_exit_1["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_exit_1.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_exit_1)
    -- up down left right
    audio_SFX_start_scene_up_0 = {1}
    audio_SFX_start_scene_up_0["LCT"] = {0}
    audio_SFX_start_scene_up_0["LCD"] = {0}
    audio_SFX_start_scene_up_0["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_up_0.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_up_0)
    audio_SFX_start_scene_up_1 = {1}
    audio_SFX_start_scene_up_1["LCT"] = {0}
    audio_SFX_start_scene_up_1["LCD"] = {0}
    audio_SFX_start_scene_up_1["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_up_1.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_up_1)
    audio_SFX_start_scene_down_0 = {1}
    audio_SFX_start_scene_down_0["LCT"] = {0}
    audio_SFX_start_scene_down_0["LCD"] = {0}
    audio_SFX_start_scene_down_0["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_down_0.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_down_0)
    audio_SFX_start_scene_down_1 = {1}
    audio_SFX_start_scene_down_1["LCT"] = {0}
    audio_SFX_start_scene_down_1["LCD"] = {0}
    audio_SFX_start_scene_down_1["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_down_1.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_down_1)
    audio_SFX_start_scene_left_0 = {1}
    audio_SFX_start_scene_left_0["LCT"] = {0}
    audio_SFX_start_scene_left_0["LCD"] = {0}
    audio_SFX_start_scene_left_0["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_left_0.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_left_0)
    audio_SFX_start_scene_left_1 = {1}
    audio_SFX_start_scene_left_1["LCT"] = {0}
    audio_SFX_start_scene_left_1["LCD"] = {0}
    audio_SFX_start_scene_left_1["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_left_1.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_left_1)
    audio_SFX_start_scene_right_0 = {1}
    audio_SFX_start_scene_right_0["LCT"] = {0}
    audio_SFX_start_scene_right_0["LCD"] = {0}
    audio_SFX_start_scene_right_0["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_right_0.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_right_0)
    audio_SFX_start_scene_right_1 = {1}
    audio_SFX_start_scene_right_1["LCT"] = {0}
    audio_SFX_start_scene_right_1["LCD"] = {0}
    audio_SFX_start_scene_right_1["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_right_1.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_right_1)
    -- other
    audio_SFX_start_scene_blazblue_click_echo = {1}
    audio_SFX_start_scene_blazblue_click_echo["LCT"] = {0}
    audio_SFX_start_scene_blazblue_click_echo["LCD"] = {0}
    audio_SFX_start_scene_blazblue_click_echo["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_blazblue_confirm_echo.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_blazblue_click_echo)
    audio_SFX_start_scene_scene_out = {1}
    audio_SFX_start_scene_scene_out["LCT"] = {0}
    audio_SFX_start_scene_scene_out["LCD"] = {0}
    audio_SFX_start_scene_scene_out["audio"] = love.audio.newSource("asset/start_scene/audio/SFX_scene_out.ogg","static")
    update_SFX_VOLUME(audio_SFX_start_scene_scene_out)
    audio_BGM_start_scene_NOC_high = {1}
    audio_BGM_start_scene_NOC_high["LCT"] = {0}
    audio_BGM_start_scene_NOC_high["LCD"] = {0}
    audio_BGM_start_scene_NOC_high["audio"] = love.audio.newSource("asset/start_scene/audio/BGM_NOC_high.ogg","stream")
    update_BGM_VOLUME(audio_BGM_start_scene_NOC_high)
    audio_BGM_start_scene_NOC_low = {0}
    audio_BGM_start_scene_NOC_low["LCT"] = {0}
    audio_BGM_start_scene_NOC_low["LCD"] = {0}
    audio_BGM_start_scene_NOC_low["audio"] = love.audio.newSource("asset/start_scene/audio/BGM_NOC_low.ogg","stream")
    update_BGM_VOLUME(audio_BGM_start_scene_NOC_low)
    -- audio anim
    anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume = {}
    anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume[0] = {0,5}
    anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume[5] = {1,5}
    anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume["prop"] = 1
    anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume["length"] = 5
    anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume["loop"] = false
    anim_UI_point_linear_start_scene_audio_ease_in_0_1_volume["fix_type"] = true
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0 = {}
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0[0] = {1,5}
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0[5] = {0,5}
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0["prop"] = 1
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0["length"] = 5
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0["loop"] = false
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_0["fix_type"] = true
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_1 = {}
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_1[0] = {1,40}
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_1[40] = {0,40}
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_1["prop"] = 1
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_1["length"] = 40
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_1["loop"] = false
    anim_UI_point_linear_start_scene_audio_ease_out_1_0_volume_1["fix_type"] = true
end
function unload_start_scene_all()
    for key in pairs(_G) do
        if string.find(key,"start_scene") or string.find(key,"CANVAS")
        then -- 检查变量名是否以 "prefix_" 开头
            _G[key] = nil -- 删除该变量
        end
    end
    unrequire_prefix("scenes.start_scene.")
end
function preset_start_scene()
    init_point_linear_anim_with(obj_UI_start_scene_solid_color,anim_UI_point_linear_start_scene_solid_ease_in_opacity)
    state_machine_UI_start_scene_noise_BG_static_loop(obj_UI_start_scene_noise_bg)
    play_obj_audio(audio_BGM_start_scene_NOC_high)
    play_obj_audio(audio_BGM_start_scene_NOC_low)
end

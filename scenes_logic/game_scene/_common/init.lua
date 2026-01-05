function load_game_scene_common_obj()
    -- CANVAS
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    DRAW_MAIN_CHARACTER_CANVAS = love.graphics.newCanvas(width,height)
    DRAW_CHARACTER_CANVAS = love.graphics.newCanvas(width,height)
    DRAW_SHADOW_CANVAS = love.graphics.newCanvas(width,height)

    load_game_scene_obj_char_LP()
    load_game_scene_obj_char_RP()
    load_game_scene_obj_stage()
    load_game_scene_announcer_HUD_obj()
end

function load_game_scene_common_anim()
    load_game_scene_anim_char_LP()
    load_game_scene_anim_char_RP()
    load_game_scene_anim_stage()
    load_game_scene_announcer_HUD_anim()
end
function load_game_scene_box_anchor_data()
    load_game_scene_box_anchor_data_LP()
    load_game_scene_box_anchor_data_RP()
end
function load_game_scene_common_audio()
    audio_SFX_game_scene_annoucer_ease_in = {1}
    audio_SFX_game_scene_annoucer_ease_in["LCT"] = {0}
    audio_SFX_game_scene_annoucer_ease_in["LCD"] = {0}
    audio_SFX_game_scene_annoucer_ease_in["audio"] = love.audio.newSource(ASSET_DATA[1]["audio_annoucer_ease_in"],"static")

    audio_SFX_game_scene_overdrive = {1}
    audio_SFX_game_scene_overdrive["LCT"] = {0}
    audio_SFX_game_scene_overdrive["LCD"] = {0}
    audio_SFX_game_scene_overdrive["audio"] = love.audio.newSource(ASSET_DATA[1]["audio_overdrive"],"static")


    update_SFX_VOLUME(audio_SFX_game_scene_annoucer_ease_in)
    update_SFX_VOLUME(audio_SFX_game_scene_overdrive)
end
function load_game_scene_common_shader(i)
    local switch = {
        [1] = function() shader_game_scene_fractal_noise = love.graphics.newShader("shaders/game_fractal_noise.glsl") end,
        [2] = function() shader_game_scene_radial_blur = love.graphics.newShader("shaders/radial_blur.glsl") end,
        [3] = function() shader_game_scene_shadow_radial_blur = love.graphics.newShader("shaders/shadow_radial_blur.glsl") end,
        [4] = function() shader_game_scene_brightness_contrast = love.graphics.newShader("shaders/brightness_contrast.glsl") end,
        [5] = function() shader_game_scene_gaussian_blur = love.graphics.newShader("shaders/gaussian_blur.glsl") end
    }
    local this_function = switch[i]
    if this_function then this_function() end
    -- shader_game_scene_fractal_noise = love.graphics.newShader("shaders/game_fractal_noise.glsl")
    -- shader_game_scene_radial_blur = love.graphics.newShader("shaders/radial_blur.glsl")
    -- shader_game_scene_shadow_radial_blur = love.graphics.newShader("shaders/shadow_radial_blur.glsl")
    -- shader_game_scene_brightness_contrast = love.graphics.newShader("shaders/brightness_contrast.glsl")
    -- shader_game_scene_gaussian_blur = love.graphics.newShader("shaders/gaussian_blur.glsl")
end

function load_game_scene_announcer_HUD_obj()
    obj_update_flow_controller_game_scene_common = {0, 0, nil, 0, 1, 1, 0, 0}
    obj_update_flow_controller_game_scene_common["FCT"] = {0,0,0,0,0,0,0,0}
    obj_update_flow_controller_game_scene_common["LCT"] = {0,0,0,0,0,0,0,0}
    obj_update_flow_controller_game_scene_common["LCD"] = {0,0,0,0,0,0,0,0}
    obj_update_flow_controller_game_scene_common["state"] = "before_ease_in"

    obj_UI_game_scene_black_solid = {0, 0, nil, 0, 1, 1, 0, 0}
    obj_UI_game_scene_black_solid["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_game_scene_black_solid["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_game_scene_black_solid["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_game_scene_black_solid["state"] = "default"
    obj_UI_game_scene_black_solid["rgb"] = {7/255,19/255,31/255}

    obj_UI_game_scene_movie_cover = {0, 0, nil, 0.8, 1, 1, 0, 0}
    obj_UI_game_scene_movie_cover["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_game_scene_movie_cover["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_game_scene_movie_cover["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_game_scene_movie_cover["state"] = "default"

    obj_annoucer_game_scene_act_common = {0, 200, nil, 0, 1, 1, 0, 0}
    obj_annoucer_game_scene_act_common["FCT"] = {0,0,0,0,0,0,0,0}
    obj_annoucer_game_scene_act_common["LCT"] = {0,0,0,0,0,0,0,0}
    obj_annoucer_game_scene_act_common["LCD"] = {0,0,0,0,0,0,0,0}
    obj_annoucer_game_scene_act_common["state"] = "default"

    obj_annoucer_game_scene_act_num = {675, 400, nil, 0, 1, 1, 0, 0}
    obj_annoucer_game_scene_act_num["FCT"] = {0,0,0,0,0,0,0,0}
    obj_annoucer_game_scene_act_num["LCT"] = {0,0,0,0,0,0,0,0}
    obj_annoucer_game_scene_act_num["LCD"] = {0,0,0,0,0,0,0,0}
    obj_annoucer_game_scene_act_num["state"] = "default"

    obj_annoucer_game_scene_lets_dance = {0, 0, nil, 0, 1, 1, 0, 0}
    obj_annoucer_game_scene_lets_dance["FCT"] = {0,0,0,0,0,0,0,0}
    obj_annoucer_game_scene_lets_dance["LCT"] = {0,0,0,0,0,0,0,0}
    obj_annoucer_game_scene_lets_dance["LCD"] = {0,0,0,0,0,0,0,0}
    obj_annoucer_game_scene_lets_dance["state"] = "default"

    obj_HUD_game_scene_ease_in = {0, 0, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_ease_in["FCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_ease_in["LCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_ease_in["LCD"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_ease_in["state"] = "default"

    obj_HUD_game_scene_timer = {780, 85, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_timer["FCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_timer["LCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_timer["LCD"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_timer["state"] = "default"

    obj_HUD_game_scene_health_bar_LP = {685, 65, nil, 0, -1, 1, 0, 0}
    obj_HUD_game_scene_health_bar_RP = {915, 65, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_health_bar_LP_fade = {685, 65, nil, 0, -1, 1, 0, 0}
    obj_HUD_game_scene_health_bar_RP_fade = {915, 65, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_heat_bar_LP = {678, 124, nil, 0, -1, 1, 0, 0}
    obj_HUD_game_scene_heat_bar_RP = {922, 124, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_ability_bar_LP = {670, 102, nil, 0, -1, 1, 0, 0}
    obj_HUD_game_scene_ability_bar_RP = {930, 102, nil, 0, 1, 1, 0, 0}

    obj_HUD_game_scene_overdrive_pie_LP = {131, 75, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_overdrive_pie_RP = {1469, 75, nil, 0, -1, 1, 0, 0}
    obj_HUD_game_scene_win_marks_LP = {750, 115, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_win_marks_RP = {850, 115, nil, 0, -1, 1, 0, 0}
    obj_HUD_game_scene_match_point_LP = {717, 85, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_match_point_RP = {883, 85, nil, 0, -1, 1, 0, 0}
    obj_HUD_game_scene_risk_LP = {255, 127, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_risk_RP = {1345, 127, nil, 0, -1, 1, 0, 0}

    obj_HUD_game_scene_overdrive_text_LP = {205, 102, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_overdrive_text_LP["FCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_overdrive_text_LP["LCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_overdrive_text_LP["LCD"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_overdrive_text_LP["state"] = "default"

    obj_HUD_game_scene_overdrive_text_RP = {1250, 102, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_overdrive_text_RP["FCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_overdrive_text_RP["LCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_overdrive_text_RP["LCD"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_overdrive_text_RP["state"] = "default"

    obj_HUD_game_scene_overdrive_timer_LP = {217, 149, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_overdrive_timer_LP["FCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_overdrive_timer_LP["LCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_overdrive_timer_LP["LCD"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_overdrive_timer_LP["state"] = "default"

    obj_HUD_game_scene_overdrive_timer_RP = {1265, 149, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_overdrive_timer_RP["FCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_overdrive_timer_RP["LCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_overdrive_timer_RP["LCD"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_overdrive_timer_RP["state"] = "default"

    obj_HUD_game_scene_background_gauge = {0, 0, nil, 0, 1, 1, 0, 0}
    obj_HUD_game_scene_background_gauge["FCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_background_gauge["LCT"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_background_gauge["LCD"] = {0,0,0,0,0,0,0,0}
    obj_HUD_game_scene_background_gauge["state"] = "default"
end
function load_game_scene_announcer_HUD_anim()
    anim_UI_point_linear_game_scene_solid_ease_in_opacity_0_1 = {}
    anim_UI_point_linear_game_scene_solid_ease_in_opacity_0_1[0] = {0, 5}
    anim_UI_point_linear_game_scene_solid_ease_in_opacity_0_1[5] = {1, 5}
    anim_UI_point_linear_game_scene_solid_ease_in_opacity_0_1["prop"] = 4
    anim_UI_point_linear_game_scene_solid_ease_in_opacity_0_1["length"] = 5
    anim_UI_point_linear_game_scene_solid_ease_in_opacity_0_1["loop"] = false
    anim_UI_point_linear_game_scene_solid_ease_in_opacity_0_1["fix_type"] = true

    anim_UI_point_linear_game_scene_solid_ease_out_opacity_1_0 = {}
    anim_UI_point_linear_game_scene_solid_ease_out_opacity_1_0[0] = {1, 5}
    anim_UI_point_linear_game_scene_solid_ease_out_opacity_1_0[5] = {0, 5}
    anim_UI_point_linear_game_scene_solid_ease_out_opacity_1_0["prop"] = 4
    anim_UI_point_linear_game_scene_solid_ease_out_opacity_1_0["length"] = 5
    anim_UI_point_linear_game_scene_solid_ease_out_opacity_1_0["loop"] = false
    anim_UI_point_linear_game_scene_solid_ease_out_opacity_1_0["fix_type"] = true

    anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1 = {}
    anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1[0] = {0, 10}
    anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1[10] = {1, 10}
    anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1["prop"] = 4
    anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1["length"] = 10
    anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1["loop"] = false
    anim_UI_point_linear_game_scene_timer_ease_in_opacity_0_1["fix_type"] = true

    anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0 = {}
    anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0[0] = {1, 10}
    anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0[10] = {0, 10}
    anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0["prop"] = 4
    anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0["length"] = 10
    anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0["loop"] = false
    anim_UI_point_linear_game_scene_timer_ease_out_opacity_1_0["fix_type"] = true

    anim_char_point_linear_overdrive_brightness_ease_in = {}
    anim_char_point_linear_overdrive_brightness_ease_in[0] = {0, 32}
    anim_char_point_linear_overdrive_brightness_ease_in[32] = {0.2, 32}
    anim_char_point_linear_overdrive_brightness_ease_in["prop"] = "brightness"
    anim_char_point_linear_overdrive_brightness_ease_in["length"] = 32
    anim_char_point_linear_overdrive_brightness_ease_in["loop"] = false
    anim_char_point_linear_overdrive_brightness_ease_in["fix_type"] = false

    anim_char_point_linear_overdrive_brightness_ease_out = {}
    anim_char_point_linear_overdrive_brightness_ease_out[0] = {0.2, 10}
    anim_char_point_linear_overdrive_brightness_ease_out[10] = {0, 10}
    anim_char_point_linear_overdrive_brightness_ease_out["prop"] = "brightness"
    anim_char_point_linear_overdrive_brightness_ease_out["length"] = 10
    anim_char_point_linear_overdrive_brightness_ease_out["loop"] = false
    anim_char_point_linear_overdrive_brightness_ease_out["fix_type"] = false
end

function unload_game_scene_all()
    for key in pairs(_G) do
        if string.find(key, "game_scene") or string.find(key, "CANVAS")
        then -- 检查变量名是否以 "prefix_" 开头
            _G[key] = nil -- 删除该变量
        end
    end
    unrequire_prefix("scenes_logic.game_scene.")
end
function preset_game_scene_training()
    obj_UI_game_scene_black_solid[4] = 1
    init_character_anim_with(obj_char_game_scene_char_LP,load_game_scene_anim_char_TRM_5_stand_idle(obj_char_game_scene_char_LP))
    init_character_anim_with(obj_char_game_scene_char_RP,load_game_scene_anim_char_TRM_5_stand_idle(obj_char_game_scene_char_RP))
end
function preset_game_scene_match()
end
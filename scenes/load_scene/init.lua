-- 只有load场景使用init前缀 
-- 其他场景有load和unload配套使用
function init_load_scene_obj()
    -- 场景object
    -- x y z opacity sx sy r f
    -- load_text
    obj_UI_load_scene_loading_text = {1350,800,nil,0,1,1,0,0}
    obj_UI_load_scene_loading_text["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_loading_text["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_loading_text["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_loading_text["state"] = "default"
    -- type_in_mark
    obj_UI_load_scene_type_in_mark = {1460,798,nil,0,1,1,0,0}
    obj_UI_load_scene_type_in_mark["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_type_in_mark["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_type_in_mark["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_type_in_mark["state"] = "default"
    -- dabo_trig
    obj_UI_load_scene_dabo_trig = {1280,800,nil,0,1,1,0,0}
    obj_UI_load_scene_dabo_trig["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_dabo_trig["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_dabo_trig["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_dabo_trig["state"] = "default"
end
function init_load_scene_anim()
    -- x y z opacity sx sy r f
    -- 1 2 3 4       5  6  7 8
    -- loading_text_ease_in_opacity
    anim_UI_frame_load_scene_loading_text_ease_in_opacity = {}
    anim_UI_frame_load_scene_loading_text_ease_in_opacity[0] = 0
    anim_UI_frame_load_scene_loading_text_ease_in_opacity[4] = 1
    anim_UI_frame_load_scene_loading_text_ease_in_opacity["prop"] = 4
    anim_UI_frame_load_scene_loading_text_ease_in_opacity["length"] = 4
    anim_UI_frame_load_scene_loading_text_ease_in_opacity["loop"] = false
    -- loading_text_ease_out_x
    anim_UI_frame_load_scene_loading_text_ease_out_x = {}
    anim_UI_frame_load_scene_loading_text_ease_out_x[0] = 1350
    anim_UI_frame_load_scene_loading_text_ease_out_x[1] = 1320
    anim_UI_frame_load_scene_loading_text_ease_out_x[3] = 1360
    anim_UI_frame_load_scene_loading_text_ease_out_x["prop"] = 1
    anim_UI_frame_load_scene_loading_text_ease_out_x["length"] = 3
    anim_UI_frame_load_scene_loading_text_ease_out_x["loop"] = false
    -- loading_text_ease_out_opacity
    anim_UI_frame_load_scene_loading_text_ease_out_opacity = {}
    anim_UI_frame_load_scene_loading_text_ease_out_opacity[0] = 1
    anim_UI_frame_load_scene_loading_text_ease_out_opacity[5] = 0
    anim_UI_frame_load_scene_loading_text_ease_out_opacity["prop"] = 4
    anim_UI_frame_load_scene_loading_text_ease_out_opacity["length"] = 5
    anim_UI_frame_load_scene_loading_text_ease_out_opacity["loop"] = false
    -- type_in_mark_ease_in_opacity
    anim_UI_frame_load_scene_type_in_mark_ease_in_opacity = {}
    anim_UI_frame_load_scene_type_in_mark_ease_in_opacity[0] = 0
    anim_UI_frame_load_scene_type_in_mark_ease_in_opacity[4] = 1
    anim_UI_frame_load_scene_type_in_mark_ease_in_opacity["prop"] = 4
    anim_UI_frame_load_scene_type_in_mark_ease_in_opacity["length"] = 4
    anim_UI_frame_load_scene_type_in_mark_ease_in_opacity["loop"] = false
    -- type_in_mark_blink_opacity
    anim_UI_frame_load_scene_type_in_mark_blink_opacity = {}
    anim_UI_frame_load_scene_type_in_mark_blink_opacity[0] = 1
    anim_UI_frame_load_scene_type_in_mark_blink_opacity[10] = 0
    anim_UI_frame_load_scene_type_in_mark_blink_opacity[20] = 1
    anim_UI_frame_load_scene_type_in_mark_blink_opacity["prop"] = 4
    anim_UI_frame_load_scene_type_in_mark_blink_opacity["length"] = 20
    anim_UI_frame_load_scene_type_in_mark_blink_opacity["loop"] = true
    -- dabo_trig_ease_in_x 
    anim_UI_frame_load_scene_dabo_trig_ease_in_x = {}
    anim_UI_frame_load_scene_dabo_trig_ease_in_x[0] = 1280
    anim_UI_frame_load_scene_dabo_trig_ease_in_x[2] = 1250
    anim_UI_frame_load_scene_dabo_trig_ease_in_x[4] = 1300
    anim_UI_frame_load_scene_dabo_trig_ease_in_x["prop"] = 1
    anim_UI_frame_load_scene_dabo_trig_ease_in_x["length"] = 4
    anim_UI_frame_load_scene_dabo_trig_ease_in_x["loop"] = false
    -- dabo_trig_ease_out_x
    anim_UI_frame_load_scene_dabo_trig_ease_out_x = {}
    anim_UI_frame_load_scene_dabo_trig_ease_out_x[0] = 1300
    anim_UI_frame_load_scene_dabo_trig_ease_out_x[1] = 1280
    anim_UI_frame_load_scene_dabo_trig_ease_out_x[3] = 1305
    anim_UI_frame_load_scene_dabo_trig_ease_out_x["prop"] = 1
    anim_UI_frame_load_scene_dabo_trig_ease_out_x["length"] = 3
    anim_UI_frame_load_scene_dabo_trig_ease_out_x["loop"] = false
    -- dabo_trig_ease_out_opacity
    anim_UI_frame_load_scene_dabo_trig_ease_out_opacity = {}
    anim_UI_frame_load_scene_dabo_trig_ease_out_opacity[0] = 1
    anim_UI_frame_load_scene_dabo_trig_ease_out_opacity[5] = 0
    anim_UI_frame_load_scene_dabo_trig_ease_out_opacity["prop"] = 4
    anim_UI_frame_load_scene_dabo_trig_ease_out_opacity["length"] = 5
    anim_UI_frame_load_scene_dabo_trig_ease_out_opacity["loop"] = false
end
function init_load_scene_image()
    image_UI_load_scene_dabo_trig = love.graphics.newImage("asset/load_scene/texture/dabo_trig.dds")
    image_UI_load_scene_loading_text = love.graphics.newImage("asset/load_scene/texture/loading_text.dds")
    image_UI_load_scene_type_in_mark = love.graphics.newImage("asset/load_scene/texture/type_in_mark.dds")
end
function init_load_scene_audio()
    -- end_load
    audio_UI_SFX_load_scene_general_end_load = {1}
    audio_UI_SFX_load_scene_general_end_load["LCT"] = {0}
    audio_UI_SFX_load_scene_general_end_load["LCD"] = {0}
    audio_UI_SFX_load_scene_general_end_load["audio"] = love.audio.newSource("asset/load_scene/audio/end_load.wav","static")
    update_SFX_VOLUME(audio_UI_SFX_load_scene_general_end_load)
    -- loading
    audio_UI_SFX_load_scene_general_loading = {1}
    audio_UI_SFX_load_scene_general_loading["LCT"] = {0}
    audio_UI_SFX_load_scene_general_loading["LCD"] = {0}
    audio_UI_SFX_load_scene_general_loading["audio"] = love.audio.newSource("asset/load_scene/audio/loading.wav","static")
    update_SFX_VOLUME(audio_UI_SFX_load_scene_general_loading)
    -- start_load
    audio_UI_SFX_load_scene_general_start_load = {1}
    audio_UI_SFX_load_scene_general_start_load["LCT"] = {0}
    audio_UI_SFX_load_scene_general_start_load["LCD"] = {0}
    audio_UI_SFX_load_scene_general_start_load["audio"] = love.audio.newSource("asset/load_scene/audio/start_load.wav","static")
    update_SFX_VOLUME(audio_UI_SFX_load_scene_general_start_load)
end

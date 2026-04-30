-- load
function load_disclaimer_and_logos_scene_obj()
    obj_UI_disclaimer_and_logos_scene_singular = {300,160,nil,0,1,1,0,0}
    obj_UI_disclaimer_and_logos_scene_singular["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_disclaimer_and_logos_scene_singular["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_disclaimer_and_logos_scene_singular["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_disclaimer_and_logos_scene_singular["state"] = "pre_disclaimer_ease_in"
end
function load_disclaimer_and_logos_scene_anim()
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1 = {}
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1[0] = {0,5}
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1[5] = {1,5}
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1["prop"] = 4
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1["length"] = 5
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1["loop"] = false
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1["fix_type"] = true

    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0 = {}
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0[0] = {1,5}
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0[5] = {0,5}
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0["prop"] = 4
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0["length"] = 5
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0["loop"] = false
    anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0["fix_type"] = true

end

function unload_disclaimer_and_logos_scene_all()
    for key in pairs(_G) do
        if string.find(key,"disclaimer_and_logos_scene") or string.find(key,"CANVAS")
        then -- 检查变量名是否以 "prefix_" 开头
            _G[key] = nil -- 删除该变量
        end
    end
    unrequire_prefix("scenes.disclaimer_and_logos_scene.")
end
function preset_disclaimer_and_logos_scene()
    -- 空功能用于填充标准化的load scene
end
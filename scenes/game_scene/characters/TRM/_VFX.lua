function insert_VFX_game_scene_char_TRM_2P_whiff(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["2P_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["2P_whiff_VFX"]
    end 

    obj["life"] = 8
    obj[1] = obj_char["x"] + obj_char[5]*(35)
    obj[2] = obj_char["y"] + obj_char[6]*(-230)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][3] = 1
    obj["animation"][6] = 2
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 8
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        -- obj[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- obj[2] = obj_char["y"] + obj_char[6]*(840)
        obj[1] = obj_char["x"] + obj_char[5]*(35)
        obj[2] = obj_char["y"] + obj_char[6]*(-230)
        obj[3] = obj_char[3]
        obj[4] = 1
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        if obj_char["state"] == "2P" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_6P_whiff(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["6P_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["6P_whiff_VFX"]
    end 

    obj["life"] = 15
    obj[1] = obj_char["x"] + obj_char[5]*(-294)
    obj[2] = obj_char["y"] + obj_char[6]*(-543)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][2] = 1
    obj["animation"][4] = 2
    obj["animation"][6] = 3
    obj["animation"][10] = 4
    obj["animation"][13] = 5
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 15
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        -- obj[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- obj[2] = obj_char["y"] + obj_char[6]*(840)
        obj[1] = obj_char["x"] + obj_char[5]*(-294)
        obj[2] = obj_char["y"] + obj_char[6]*(-543)
        obj[3] = obj_char[3]
        obj[4] = 1
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        if obj_char["state"] == "6P" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))

        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5P_whiff(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5P_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5P_whiff_VFX"]
    end 

    obj["life"] = 8
    obj[1] = obj_char["x"] + obj_char[5]*(56)
    obj[2] = obj_char["y"] + obj_char[6]*(-468)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][2] = 1
    obj["animation"][4] = 2
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 8
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        -- obj[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- obj[2] = obj_char["y"] + obj_char[6]*(840)
        obj[1] = obj_char["x"] + obj_char[5]*(56)
        obj[2] = obj_char["y"] + obj_char[6]*(-468)
        obj[3] = obj_char[3]
        obj[4] = 1
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        if obj_char["state"] == "5P" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_2S_whiff(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["2S_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["2S_whiff_VFX"]
    end 

    obj["life"] = 3
    obj[1] = obj_char["x"] + obj_char[5]*(166)
    obj[2] = obj_char["y"] + obj_char[6]*(-247)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][1] = 1
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 3
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        -- obj[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- obj[2] = obj_char["y"] + obj_char[6]*(840)
        obj[1] = obj_char["x"] + obj_char[5]*(166)
        obj[2] = obj_char["y"] + obj_char[6]*(-247)
        obj[3] = obj_char[3]
        obj[4] = 1
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        if obj_char["state"] == "2S" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_6S_whiff(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["6S_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["6S_whiff_VFX"]
    end 

    obj["life"] = 36
    obj[1] = obj_char["x"] + obj_char[5]*(-430)
    obj[2] = obj_char["y"] + obj_char[6]*(-520)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][2] = 1
    obj["animation"][5] = 2
    obj["animation"][11] = 3
    obj["animation"][15] = 4
    obj["animation"][19] = 5
    obj["animation"][24] = 6
    obj["animation"][29] = 7
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 36
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        obj[1] = obj_char["x"] + obj_char[5]*(-430)
        obj[2] = obj_char["y"] + obj_char[6]*(-520)
        obj[3] = obj_char[3]
        obj[4] = 1
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        if obj_char["state"] == "6S" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))

        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_cS_whiff(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["cS_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["cS_whiff_VFX"]
    end 

    obj["life"] = 19
    obj[1] = obj_char["x"] + obj_char[5]*(140)
    obj[2] = obj_char["y"] + obj_char[6]*(-440)
    obj[3] = obj_char[3]
    obj[4] = 0.65
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][6] = 1
    obj["animation"][9] = 2
    obj["animation"][12] = 3
    obj["animation"][15] = 4
    obj["animation"][18] = 5
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 19
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        -- obj[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- obj[2] = obj_char["y"] + obj_char[6]*(840)
        obj[1] = obj_char["x"] + obj_char[5]*(140)
        obj[2] = obj_char["y"] + obj_char[6]*(-440)
        obj[3] = obj_char[3]
        obj[4] = 1
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        if obj_char["state"] == "cS" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))

        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5H_whiff_at_the_ready_switch(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    local y = 0
    if obj_char["height_state"] == "stand" then
        y = -780
    elseif obj_char["height_state"] == "crouch" then
        y = -580
    elseif obj_char["height_state"] == "air" then
        y = -490
    elseif obj_char["height_state"] == "OTG" then
        y = -280
    end
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5H_switch_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5H_switch_whiff_VFX"]
    end 

    obj["life"] = 22
    obj[1] = obj_char["x"] + obj_char[5]*(-420)
    obj[2] = obj_char["y"] + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][2] = 1
    obj["animation"][4] = 2
    obj["animation"][6] = 3
    obj["animation"][8] = 4
    obj["animation"][12] = 5
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 22
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        frame_animator(obj,obj["animation"])
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.setColor(5/255,5/255,5/255,1)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_back_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5H_whiff_at_the_ready_shot_oroboros_blast(obj_char)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    local dx = 35
    local dy = -210
    local r = obj_char["shot_sys_oroboros_aim_r"]*obj_char[5]
    local rot_dx = dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.cos(r) - dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.sin(r)
    local rot_dy = dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.sin(r) + dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.cos(r)
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5H_shot_oroboros_blast_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5H_shot_oroboros_blast_whiff_VFX"]
    end 

    obj["life"] = 21
    obj[1] = obj_char["shot_sys_oroboros_ease_current"][1] + rot_dx
    obj[2] = obj_char["shot_sys_oroboros_ease_current"][2] + rot_dy
    obj[3] = obj_char[3]
    obj[4] = 0.65
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = r
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][8] = 1
    obj["animation"][13] = 2
    obj["animation"][17] = 3
    obj["animation"][19] = 4
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 21
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["shot_sys_state"] == "at_the_ready_shot" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        else
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5Launcher_whiff_slash(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5Launcher_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5Launcher_whiff_VFX"]
    end 

    obj["life"] = 3
    obj[1] = obj_char["x"] + obj_char[5]*(-285)
    obj[2] = obj_char["y"] + obj_char[6]*(-535)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][1] = 1
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 3
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        -- obj[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- obj[2] = obj_char["y"] + obj_char[6]*(840)
        obj[1] = obj_char["x"] + obj_char[5]*(-285)
        obj[2] = obj_char["y"] + obj_char[6]*(-535)
        obj[3] = obj_char[3]
        obj[4] = 1
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        if obj_char["state"] == "5Launcher" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5Launcher_whiff_glow(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5Launcher_glow_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5Launcher_glow_whiff_VFX"]
    end 

    obj["life"] = 18
    obj[1] = obj_char["x"] + obj_char[5]*(-380)
    obj[2] = obj_char["y"] + obj_char[6]*(-636)
    obj[3] = obj_char[3]
    obj[4] = 0.65
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    for i=0,17 do
        obj["animation"][i] = i
    end
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 18
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        -- obj[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- obj[2] = obj_char["y"] + obj_char[6]*(840)
        obj[1] = obj_char["x"] + obj_char[5]*(-380)
        obj[2] = obj_char["y"] + obj_char[6]*(-636)
        obj[3] = obj_char[3]
        obj[4] = 0.65
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        if obj_char["state"] == "5Launcher" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))

        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_front_table"],obj)
end

function insert_VFX_game_scene_char_TRM_jS_whiff(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["jS_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["jS_whiff_VFX"]
    end 

    obj["life"] = 13
    obj[1] = obj_char["x"] + obj_char[5]*(-160)
    obj[2] = obj_char["y"] + obj_char[6]*(-370)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][3] = 1
    obj["animation"][8] = 2
    obj["animation"][10] = 3
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 13
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj["FCT"][8] < 7 and obj_char["state"] == "jS" then
            obj[1] = obj_char["x"] + obj_char["velocity"][1] + obj_char[5]*(-120)
            obj[2] = obj_char["y"] + obj_char["velocity"][2] +obj_char[6]*(-370)
            obj[3] = obj_char[3]
            obj[4] = 1
            obj[5] = obj_char[5]
            obj[6] = obj_char[6]
            obj[7] = obj_char[7]
        elseif obj_char["state"] == "jS" then
            obj[1] = obj_char["x"] + obj_char["velocity"][1] + obj_char[5]*(-120)
            obj[2] = obj_char["y"] + obj_char["velocity"][2] + obj_char[6]*(-370)
            obj[3] = obj_char[3]
            obj[4] = 0.75
            obj[5] = obj_char[5]
            obj[6] = obj_char[6]
            obj[7] = obj_char[7]
        end
        if obj_char["state"] == "hitstop" then
            -- do nothing
        else
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))

        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_2P_move(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["2P_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["2P_move_VFX"]
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
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "2P" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw_sync"] = function()
        obj[1] = obj_char["x"] + obj_char[5]*(35)
        obj[2] = obj_char["y"] + obj_char[6]*(-230)
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        -- obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_6P_move(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["6P_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["6P_move_VFX"]
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
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "6P" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw_sync"] = function()
        obj[1] = obj_char["x"] + obj_char[5]*(-294)
        obj[2] = obj_char["y"] + obj_char[6]*(-543)
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        -- obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5P_move(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5P_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5P_move_VFX"]
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
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "5P" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw_sync"] = function()
        obj[1] = obj_char["x"] + obj_char[5]*(56)
        obj[2] = obj_char["y"] + obj_char[6]*(-468)
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        -- obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_2S_move(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["2S_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["2S_move_VFX"]
    end 

    obj["life"] = 6
    obj[1] = obj_char["x"] + obj_char[5]*(115)
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
    obj["animation"][2] = 1
    obj["animation"][4] = 2
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 6
    obj["animation"]["loop"] = false
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "2S" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw_sync"] = function()
        obj[1] = obj_char["x"] + obj_char[5]*(115)
        obj[2] = obj_char["y"] + obj_char[6]*(-247)
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        -- obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_6S_move(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["6S_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["6S_move_VFX"]
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
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "6S" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw_sync"] = function()
        obj[1] = obj_char["x"] + obj_char[5]*(-430)
        obj[2] = obj_char["y"] + obj_char[6]*(-520)
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        -- obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_cS_move(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["cS_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["cS_move_VFX"]
    end 

    obj["life"] = 19
    obj[1] = obj_char["x"] + obj_char[5]*(140)
    obj[2] = obj_char["y"] + obj_char[6]*(-440)
    obj[3] = obj_char[3]
    obj[4] = 0.25
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
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "cS" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw_sync"] = function()
        obj[1] = obj_char["x"] + obj_char[5]*(140)
        obj[2] = obj_char["y"] + obj_char[6]*(-440)
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        -- obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5H_move_at_the_ready_switch(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    local height_state_y_offset = {
        ["stand"] = -730,
        ["crouch"] = -530,
        ["air"] = -440,
        ["OTG"] = -230
    }
    obj["y_offset"] = height_state_y_offset[obj_char["height_state"]]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5H_switch_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5H_switch_move_VFX"]
    end 

    obj["life"] = 30
    obj[1] = obj_char["x"] + obj_char[5]*(-370)
    obj[2] = obj_char["y"] + obj_char[6]*obj["y_offset"]
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
    for i = 0,14 do
        obj["animation"][i*2] = i
    end
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 30
    obj["animation"]["loop"] = false
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        frame_animator(obj,obj["animation"])
        obj["life"] = obj["life"] - 1
    end
    obj["draw_sync"] = function()
        local height_state_y_offset = {
            ["stand"] = -730,
            ["crouch"] = -530,
            ["air"] = -440,
            ["OTG"] = -230
        }
        obj["y_offset"] = height_state_y_offset[obj_char["height_state"]]
        obj[1] = obj_char["x"] + obj_char[5]*(-370)
        obj[2] = obj_char["y"] + obj_char[6]*obj["y_offset"]
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.setColor(5/255,5/255,5/255,0.5)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_common_back_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5H_move_at_the_ready_shot_oroboros_blast(obj_char)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    local oroboros_pos = {obj_char["shot_sys_oroboros_ease_current"][1],obj_char["shot_sys_oroboros_ease_current"][2]}
    local rectile_pos = {obj_char["shot_sys_reticle_stage_pos_current"][1]+160,obj_char["shot_sys_reticle_stage_pos_current"][2]+160}
    local center_dx = 35
    local center_dy = -210
    local center_r = character_function_game_scene_TRM_shot_sys_at_the_ready_aim_r_calculation(obj_char,oroboros_pos,rectile_pos)
    local rot_dx = center_dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.cos(center_r) - center_dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.sin(center_r)
    local rot_dy = center_dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.sin(center_r) + center_dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.cos(center_r)
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5H_shot_oroboros_blast_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5H_shot_oroboros_blast_move_VFX"]
    end 

    obj["life"] = 15
    obj[1] = obj_char["shot_sys_oroboros_ease_current"][1] + rot_dx
    obj[2] = obj_char["shot_sys_oroboros_ease_current"][2] + rot_dy
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = center_r
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][1] = 1
    obj["animation"][3] = 2
    obj["animation"][6] = 3
    obj["animation"][10] = 4
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 15
    obj["animation"]["loop"] = false
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["shot_sys_state"] == "at_the_ready_shot" or obj_char["state"] == "wallbreak_hit" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        else
            obj["life"] = 0
        end
    end
    obj["draw_sync"] = function()
        local oroboros_pos = {obj_char["shot_sys_oroboros_ease_current"][1],obj_char["shot_sys_oroboros_ease_current"][2]}
        local rectile_pos = {obj_char["shot_sys_reticle_stage_pos_current"][1]+160,obj_char["shot_sys_reticle_stage_pos_current"][2]+160}
        local center_dx = 35
        local center_dy = -210
        local center_r = character_function_game_scene_TRM_shot_sys_at_the_ready_aim_r_calculation(obj_char,oroboros_pos,rectile_pos)
        local rot_dx = center_dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.cos(center_r) - center_dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.sin(center_r)
        local rot_dy = center_dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.sin(center_r) + center_dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.cos(center_r)
        obj[1] = obj_char["shot_sys_oroboros_ease_current"][1] + rot_dx
        obj[2] = obj_char["shot_sys_oroboros_ease_current"][2] + rot_dy
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = center_r
        obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.setColor(55/255,55/255,55/255,255/255)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_hit_blast(obj_char,obj_char_other_side)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}

    obj["life"] = 16
    obj[1] = obj_char["shot_sys_reticle"][1] - 230 + 160
    obj[2] = obj_char["shot_sys_reticle"][2] - 255 + 160
    obj[3] = 0
    obj[4] = 1
    obj[5] = 1
    obj[6] = 1
    obj[7] = 0
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][3] = 1
    obj["animation"][7] = 2
    obj["animation"][10] = 3
    obj["animation"][13] = 4
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 16
    obj["animation"]["loop"] = false
    init_frame_anim_without(obj,obj["animation"])
    if obj_char["x"] > obj_char_other_side["x"] then
        obj[1] = obj_char["shot_sys_reticle"][1] + 230 + 160
        obj[5] = -1
    elseif obj_char["x"] == obj_char_other_side["x"] then
        if math.random(0, 1) == 0 then
            obj[1] = obj_char["shot_sys_reticle"][1] + 230 + 160
            obj[5] = -1
        end
    end
    obj["update"] = function()
        frame_animator(obj,obj["animation"])
        obj["life"] = obj["life"] - 1
    end
    obj["draw_sync"] = function()
        if obj_char["x"] > obj_char_other_side["x"] then
            obj[1] = obj_char["shot_sys_reticle"][1] + 230 + 160
            obj[5] = -1
        elseif obj_char["x"] == obj_char_other_side["x"] then
            if math.random(0, 1) == 0 then
                obj[1] = obj_char["shot_sys_reticle"][1] + 230 + 160
                obj[5] = -1
            end
        end
        obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0
        -- obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.setColor(35/255,35/255,35/255,175/255)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_hit_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5Launcher_move_slash(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5Launcher_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5Launcher_move_VFX"]
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
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "5Launcher" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw_sync"] = function()
        obj[1] = obj_char["x"] + obj_char[5]*(-285)
        obj[2] = obj_char["y"] + obj_char[6]*(-535)
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        -- obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5Launcher_move_glow(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5Launcher_glow_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5Launcher_glow_move_VFX"]
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
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "5Launcher" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw_sync"] = function()
        obj[1] = obj_char["x"] + obj_char[5]*(-380)
        obj[2] = obj_char["y"] + obj_char[6]*(-636)
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        -- obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end

function insert_VFX_game_scene_char_TRM_jS_move(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["jS_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["jS_move_VFX"]
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
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw_sync"] = function()
        if obj["FCT"][8] < 7 and obj_char["state"] == "jS" then
            obj[1] = obj_char["x"] + obj_char[5]*(-120)
            obj[2] = obj_char["y"] + obj_char[6]*(-370)
            obj[3] = obj_char[3]
            obj[4] = 1
            obj[5] = obj_char[5]
            obj[6] = obj_char[6]
            obj[7] = obj_char[7]
        elseif obj_char["state"] == "jS" then
            obj[1] = obj_char["x"] + obj_char[5]*(-120)
            obj[2] = obj_char["y"] + obj_char[6]*(-370)
            obj[3] = obj_char[3]
            obj[4] = 0.75
            obj[5] = obj_char[5]
            obj[6] = obj_char[6]
            obj[7] = obj_char[7]
        end
        -- obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end

function insert_VFX_game_scene_char_TRM_6SP_P_curse_ball_spawner(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["6SP_P_curse_ball_spawner_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["6SP_P_curse_ball_spawner_move_VFX"]
    end 

    obj["life"] = 9
    obj[1] = obj_char["x"] + obj_char[5]*(180)
    obj[2] = obj_char["y"] + obj_char[6]*(110)
    obj[3] = obj_char[3]
    obj[4] = 0
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["x_offset"] = -95
    obj["y_offset"] = -395
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["x_point_linear_animation"] = {}
    obj["x_point_linear_animation"][0] = {-95,1}
    obj["x_point_linear_animation"][1] = {-98.6,2}
    obj["x_point_linear_animation"][2] = {-100.7,4}
    obj["x_point_linear_animation"][4] = {-102.9,6}
    obj["x_point_linear_animation"][6] = {-104.1,8}
    obj["x_point_linear_animation"][8] = {-104.7,9}
    obj["x_point_linear_animation"][9] = {-105,9}
    obj["x_point_linear_animation"]["prop"] = "x_offset"
    obj["x_point_linear_animation"]["length"] = 9
    obj["x_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj,obj["x_point_linear_animation"])
    obj["y_point_linear_animation"] = {}
    obj["y_point_linear_animation"][0] = {-395,1}
    obj["y_point_linear_animation"][1] = {-393.2,2}
    obj["y_point_linear_animation"][2] = {-392.2,4}
    obj["y_point_linear_animation"][4] = {-391.0,6}
    obj["y_point_linear_animation"][6] = {-390.5,8}
    obj["y_point_linear_animation"][8] = {-390.1,9}
    obj["y_point_linear_animation"][9] = {-390,9}
    obj["y_point_linear_animation"]["prop"] = "y_offset"
    obj["y_point_linear_animation"]["length"] = 9
    obj["y_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj,obj["y_point_linear_animation"])
    obj["opacity_point_linear_animation"] = {}
    obj["opacity_point_linear_animation"][0] = {0,1}
    obj["opacity_point_linear_animation"][1] = {0.44,2}
    obj["opacity_point_linear_animation"][2] = {0.57,3}
    obj["opacity_point_linear_animation"][3] = {0.60,4}
    obj["opacity_point_linear_animation"][4] = {0.57,5}
    obj["opacity_point_linear_animation"][5] = {0.51,8}
    obj["opacity_point_linear_animation"][8] = {0.12,9}
    obj["opacity_point_linear_animation"][9] = {0.,9}
    obj["opacity_point_linear_animation"]["prop"] = 4
    obj["opacity_point_linear_animation"]["length"] = 9
    obj["opacity_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj,obj["opacity_point_linear_animation"])
    obj["update"] = function()
        if obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            point_linear_animator(obj,obj["x_point_linear_animation"])
            point_linear_animator(obj,obj["y_point_linear_animation"])
            point_linear_animator(obj,obj["opacity_point_linear_animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw_sync"] = function()
        obj[1] = obj_char["x"] + obj_char[5]*(obj["x_offset"])
        obj[2] = obj_char["y"] + obj_char[6]*(obj["y_offset"])
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        -- obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_6SP_P_spawn_halo(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["6SP_P_curse_ball_spawn_halo_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["6SP_P_curse_ball_spawn_halo_move_VFX"]
    end 

    obj["life"] = 5
    obj[1] = obj_char["x"] + obj_char[5]*(-72.5)
    obj[2] = obj_char["y"] + obj_char[6]*(-352.5)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["x_offset"] = -72.5
    obj["y_offset"] = -352.5
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["x_point_linear_animation"] = {}
    obj["x_point_linear_animation"][0] = {-72.5,2}
    obj["x_point_linear_animation"][2] = {-72.5,5}
    obj["x_point_linear_animation"][5] = {-52.5,5}
    obj["x_point_linear_animation"]["prop"] = "x_offset"
    obj["x_point_linear_animation"]["length"] = 5
    obj["x_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj,obj["x_point_linear_animation"])
    obj["y_point_linear_animation"] = {}
    obj["y_point_linear_animation"][0] = {-352.5,2}
    obj["y_point_linear_animation"][2] = {-352.5,5}
    obj["y_point_linear_animation"][5] = {-355,5}
    obj["y_point_linear_animation"]["prop"] = "y_offset"
    obj["y_point_linear_animation"]["length"] = 5
    obj["y_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj,obj["y_point_linear_animation"])
    obj["frame_animation"] = {}
    obj["frame_animation"][0] = 0
    obj["frame_animation"][1] = 1
    obj["frame_animation"][2] = 2
    obj["frame_animation"][3] = 3
    obj["frame_animation"][4] = 4
    obj["frame_animation"]["prop"] = 8
    obj["frame_animation"]["length"] = 4
    obj["frame_animation"]["loop"] = false
    init_frame_anim_without(obj,obj["frame_animation"])
    obj["update"] = function()
        if obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            point_linear_animator(obj,obj["x_point_linear_animation"])
            point_linear_animator(obj,obj["y_point_linear_animation"])
            frame_animator(obj,obj["frame_animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw_sync"] = function()
        obj[1] = obj_char["x"] + obj_char[5]*(obj["x_offset"])
        obj[2] = obj_char["y"] + obj_char[6]*(obj["y_offset"])
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        -- obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end

function insert_VFX_game_scene_char_TRM_6SP_S_move(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["6SP_S_move_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["6SP_S_move_VFX"]
    end 

    obj["life"] = 21
    obj[1] = obj_char["x"] + obj_char[5]*(-63)
    obj[2] = obj_char["y"] + obj_char[6]*(-727)
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
    obj["animation"][7] = 3
    obj["animation"][10] = 4
    obj["animation"][13] = 5
    obj["animation"][17] = 6
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 21
    obj["animation"]["loop"] = false
    init_frame_anim_without(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "6SP_S" then
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj["life"] = 0
        end
    end
    obj["draw_sync"] = function()
        obj[1] = obj_char["x"] + obj_char[5]*(-63)
        obj[2] = obj_char["y"] + obj_char[6]*(-727)
        obj[3] = obj_char[3]
        obj[5] = obj_char[5]
        obj[6] = obj_char[6]
        obj[7] = obj_char[7]
        -- obj["draw_sync"] = function() end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,tostring(obj[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_2P_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["2P_move_VFX"]

    obj_VFX["life"] = 8
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(35)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(-230)
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][3] = 1
    obj_VFX["animation"][6] = 2
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 8
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if obj_char["state"] == "2P" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_char["x"] + obj_char[5]*(35)
        obj_VFX[2] = obj_char["y"] + obj_char[6]*(-230)
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_6P_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["6P_move_VFX"]

    obj_VFX["life"] = 15
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(-294)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(-543)
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][2] = 1
    obj_VFX["animation"][4] = 2
    obj_VFX["animation"][6] = 3
    obj_VFX["animation"][10] = 4
    obj_VFX["animation"][13] = 5
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 15
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if obj_char["state"] == "6P" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_char["x"] + obj_char[5]*(-294)
        obj_VFX[2] = obj_char["y"] + obj_char[6]*(-543)
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_5P_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["5P_move_VFX"]

    obj_VFX["life"] = 8
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(56)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(-468)
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][2] = 1
    obj_VFX["animation"][4] = 2
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 8
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if obj_char["state"] == "5P" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_char["x"] + obj_char[5]*(56)
        obj_VFX[2] = obj_char["y"] + obj_char[6]*(-468)
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_2S_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["2S_move_VFX"]

    obj_VFX["life"] = 6
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(115)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(-247)
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][2] = 1
    obj_VFX["animation"][4] = 2
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 6
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if obj_char["state"] == "2S" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_char["x"] + obj_char[5]*(115)
        obj_VFX[2] = obj_char["y"] + obj_char[6]*(-247)
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_6S_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["6S_move_VFX"]

    obj_VFX["life"] = 36
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(-430)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(-520)
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][2] = 1
    obj_VFX["animation"][5] = 2
    obj_VFX["animation"][11] = 3
    obj_VFX["animation"][15] = 4
    obj_VFX["animation"][19] = 5
    obj_VFX["animation"][24] = 6
    obj_VFX["animation"][29] = 7
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 36
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if obj_char["state"] == "6S" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_char["x"] + obj_char[5]*(-430)
        obj_VFX[2] = obj_char["y"] + obj_char[6]*(-520)
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_cS_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["cS_move_VFX"]

    obj_VFX["life"] = 19
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(140)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(-440)
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 0.25
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][6] = 1
    obj_VFX["animation"][9] = 2
    obj_VFX["animation"][12] = 3
    obj_VFX["animation"][15] = 4
    obj_VFX["animation"][18] = 5
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 19
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if obj_char["state"] == "cS" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_char["x"] + obj_char[5]*(140)
        obj_VFX[2] = obj_char["y"] + obj_char[6]*(-440)
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_5H_move_at_the_ready_switch(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["5H_switch_move_VFX"]
    local height_y_offset = {
        ["stand"] = -730,
        ["crouch"] = -530,
        ["air"] = -440,
        ["OTG"] = -230
    }
    obj_VFX["y_offset"] = height_y_offset[obj_char["height"]]

    obj_VFX["life"] = 30
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(-370)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*obj_VFX["y_offset"]
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    for i = 0,14 do
        obj_VFX["animation"][i*2] = i
    end
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 30
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        frame_animator(obj_VFX,obj_VFX["animation"])
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        local height_y_offset = {
            ["stand"] = -730,
            ["crouch"] = -530,
            ["air"] = -440,
            ["OTG"] = -230
        }
        obj_VFX["y_offset"] = height_y_offset[obj_char["height"]]
        obj_VFX[1] = obj_char["x"] + obj_char[5]*(-370)
        obj_VFX[2] = obj_char["y"] + obj_char[6]*obj_VFX["y_offset"]
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setColor(5/255,5/255,5/255,0.5)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_common_back_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_5H_move_at_the_ready_shot_oroboros_blast(obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["5H_shot_oroboros_blast_move_VFX"]
    local oroboros_pos = {obj_char["shot_sys_oroboros_ease_current"][1],obj_char["shot_sys_oroboros_ease_current"][2]}
    local rectile_pos = {obj_char["shot_sys_reticle_stage_pos_current"][1]+160,obj_char["shot_sys_reticle_stage_pos_current"][2]+160}
    local center_dx = 35
    local center_dy = -210
    local center_r = character_function_game_scene_TRM_shot_sys_at_the_ready_aim_r_calculation(obj_char,oroboros_pos,rectile_pos)
    local rot_dx = center_dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.cos(center_r) - center_dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.sin(center_r)
    local rot_dy = center_dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.sin(center_r) + center_dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.cos(center_r)

    obj_VFX["life"] = 15
    obj_VFX[1] = obj_char["shot_sys_oroboros_ease_current"][1] + rot_dx
    obj_VFX[2] = obj_char["shot_sys_oroboros_ease_current"][2] + rot_dy
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = center_r
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][1] = 1
    obj_VFX["animation"][3] = 2
    obj_VFX["animation"][6] = 3
    obj_VFX["animation"][10] = 4
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 15
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if obj_char["shot_sys_state"] == "at_the_ready_shot" or obj_char["state"] == "wallbreak_hit" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        else
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        local oroboros_pos = {obj_char["shot_sys_oroboros_ease_current"][1],obj_char["shot_sys_oroboros_ease_current"][2]}
        local rectile_pos = {obj_char["shot_sys_reticle_stage_pos_current"][1]+160,obj_char["shot_sys_reticle_stage_pos_current"][2]+160}
        local center_dx = 35
        local center_dy = -210
        local center_r = character_function_game_scene_TRM_shot_sys_at_the_ready_aim_r_calculation(obj_char,oroboros_pos,rectile_pos)
        local rot_dx = center_dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.cos(center_r) - center_dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.sin(center_r)
        local rot_dy = center_dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.sin(center_r) + center_dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.cos(center_r)
        obj_VFX[1] = obj_char["shot_sys_oroboros_ease_current"][1] + rot_dx
        obj_VFX[2] = obj_char["shot_sys_oroboros_ease_current"][2] + rot_dy
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = center_r
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setColor(55/255,55/255,55/255,255/255)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_hit_blast(hit_side_obj_char,hurt_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    obj_VFX["life"] = 16
    obj_VFX[1] = hit_side_obj_char["shot_sys_reticle"][1] - 230 + 160
    obj_VFX[2] = hit_side_obj_char["shot_sys_reticle"][2] - 255 + 160
    obj_VFX[3] = 0
    obj_VFX[4] = 1
    obj_VFX[5] = 1
    obj_VFX[6] = 1
    obj_VFX[7] = 0
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][3] = 1
    obj_VFX["animation"][7] = 2
    obj_VFX["animation"][10] = 3
    obj_VFX["animation"][13] = 4
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 16
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    if hit_side_obj_char["x"] > hurt_side_obj_char["x"] then
        obj_VFX[1] = hit_side_obj_char["shot_sys_reticle"][1] + 230 + 160
        obj_VFX[5] = -1
    elseif hit_side_obj_char["x"] == hurt_side_obj_char["x"] then
        if math.random(0, 1) == 0 then
            obj_VFX[1] = hit_side_obj_char["shot_sys_reticle"][1] + 230 + 160
            obj_VFX[5] = -1
        end
    end
    obj_VFX["update"] = function()
        frame_animator(obj_VFX,obj_VFX["animation"])
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        if hit_side_obj_char["x"] > hurt_side_obj_char["x"] then
            obj_VFX[1] = hit_side_obj_char["shot_sys_reticle"][1] + 230 + 160
            obj_VFX[5] = -1
        elseif hit_side_obj_char["x"] == hurt_side_obj_char["x"] then
            if math.random(0, 1) == 0 then
                obj_VFX[1] = hit_side_obj_char["shot_sys_reticle"][1] + 230 + 160
                obj_VFX[5] = -1
            end
        end
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0
        -- obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setColor(35/255,35/255,35/255,175/255)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(hit_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_5Launcher_move_slash(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["5Launcher_move_VFX"]

    obj_VFX["life"] = 3
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(-285)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(-535)
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][1] = 1
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 3
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if obj_char["state"] == "5Launcher" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_char["x"] + obj_char[5]*(-285)
        obj_VFX[2] = obj_char["y"] + obj_char[6]*(-535)
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_5Launcher_move_glow(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["5Launcher_glow_move_VFX"]

    obj_VFX["life"] = 18
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(-380)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(-636)
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 0.65
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    for i=0,17 do
        obj_VFX["animation"][i] = i
    end
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 18
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if obj_char["state"] == "5Launcher" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_char["x"] + obj_char[5]*(-380)
        obj_VFX[2] = obj_char["y"] + obj_char[6]*(-636)
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end

function insert_VFX_game_scene_char_TRM_jS_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["jS_move_VFX"]

    obj_VFX["life"] = 13
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(-160)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(-370)
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][3] = 1
    obj_VFX["animation"][8] = 2
    obj_VFX["animation"][10] = 3
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 13
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        if obj_VFX["FCT"][8] < 7 and obj_char["state"] == "jS" then
            obj_VFX[1] = obj_char["x"] + obj_char[5]*(-120)
            obj_VFX[2] = obj_char["y"] + obj_char[6]*(-370)
            obj_VFX[3] = obj_char[3]
            obj_VFX[4] = 1
            obj_VFX[5] = obj_char[5]
            obj_VFX[6] = obj_char[6]
            obj_VFX[7] = obj_char[7]
        elseif obj_char["state"] == "jS" then
            obj_VFX[1] = obj_char["x"] + obj_char[5]*(-120)
            obj_VFX[2] = obj_char["y"] + obj_char[6]*(-370)
            obj_VFX[3] = obj_char[3]
            obj_VFX[4] = 0.75
            obj_VFX[5] = obj_char[5]
            obj_VFX[6] = obj_char[6]
            obj_VFX[7] = obj_char[7]
        end
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end

function insert_VFX_game_scene_char_TRM_6SP_P_curse_ball_spawner(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["6SP_P_curse_ball_spawner_move_VFX"]

    obj_VFX["life"] = 9
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(180)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(110)
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 0
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["x_offset"] = -95
    obj_VFX["y_offset"] = -395
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["x_point_linear_animation"] = {}
    obj_VFX["x_point_linear_animation"][0] = {-95,1}
    obj_VFX["x_point_linear_animation"][1] = {-98.6,2}
    obj_VFX["x_point_linear_animation"][2] = {-100.7,4}
    obj_VFX["x_point_linear_animation"][4] = {-102.9,6}
    obj_VFX["x_point_linear_animation"][6] = {-104.1,8}
    obj_VFX["x_point_linear_animation"][8] = {-104.7,9}
    obj_VFX["x_point_linear_animation"][9] = {-105,9}
    obj_VFX["x_point_linear_animation"]["prop"] = "x_offset"
    obj_VFX["x_point_linear_animation"]["length"] = 9
    obj_VFX["x_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj_VFX,obj_VFX["x_point_linear_animation"])
    obj_VFX["y_point_linear_animation"] = {}
    obj_VFX["y_point_linear_animation"][0] = {-395,1}
    obj_VFX["y_point_linear_animation"][1] = {-393.2,2}
    obj_VFX["y_point_linear_animation"][2] = {-392.2,4}
    obj_VFX["y_point_linear_animation"][4] = {-391.0,6}
    obj_VFX["y_point_linear_animation"][6] = {-390.5,8}
    obj_VFX["y_point_linear_animation"][8] = {-390.1,9}
    obj_VFX["y_point_linear_animation"][9] = {-390,9}
    obj_VFX["y_point_linear_animation"]["prop"] = "y_offset"
    obj_VFX["y_point_linear_animation"]["length"] = 9
    obj_VFX["y_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj_VFX,obj_VFX["y_point_linear_animation"])
    obj_VFX["opacity_point_linear_animation"] = {}
    obj_VFX["opacity_point_linear_animation"][0] = {0,1}
    obj_VFX["opacity_point_linear_animation"][1] = {0.44,2}
    obj_VFX["opacity_point_linear_animation"][2] = {0.57,3}
    obj_VFX["opacity_point_linear_animation"][3] = {0.60,4}
    obj_VFX["opacity_point_linear_animation"][4] = {0.57,5}
    obj_VFX["opacity_point_linear_animation"][5] = {0.51,8}
    obj_VFX["opacity_point_linear_animation"][8] = {0.12,9}
    obj_VFX["opacity_point_linear_animation"][9] = {0.,9}
    obj_VFX["opacity_point_linear_animation"]["prop"] = 4
    obj_VFX["opacity_point_linear_animation"]["length"] = 9
    obj_VFX["opacity_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj_VFX,obj_VFX["opacity_point_linear_animation"])
    obj_VFX["update"] = function()
        if obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            point_linear_animator(obj_VFX,obj_VFX["x_point_linear_animation"])
            point_linear_animator(obj_VFX,obj_VFX["y_point_linear_animation"])
            point_linear_animator(obj_VFX,obj_VFX["opacity_point_linear_animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_char["x"] + obj_char[5]*(obj_VFX["x_offset"])
        obj_VFX[2] = obj_char["y"] + obj_char[6]*(obj_VFX["y_offset"])
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_6SP_P_spawn_halo(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["6SP_P_curse_ball_spawn_halo_move_VFX"]

    obj_VFX["life"] = 5
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(-72.5)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(-352.5)
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["x_offset"] = -72.5
    obj_VFX["y_offset"] = -352.5
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["x_point_linear_animation"] = {}
    obj_VFX["x_point_linear_animation"][0] = {-72.5,2}
    obj_VFX["x_point_linear_animation"][2] = {-72.5,5}
    obj_VFX["x_point_linear_animation"][5] = {-52.5,5}
    obj_VFX["x_point_linear_animation"]["prop"] = "x_offset"
    obj_VFX["x_point_linear_animation"]["length"] = 5
    obj_VFX["x_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj_VFX,obj_VFX["x_point_linear_animation"])
    obj_VFX["y_point_linear_animation"] = {}
    obj_VFX["y_point_linear_animation"][0] = {-352.5,2}
    obj_VFX["y_point_linear_animation"][2] = {-352.5,5}
    obj_VFX["y_point_linear_animation"][5] = {-355,5}
    obj_VFX["y_point_linear_animation"]["prop"] = "y_offset"
    obj_VFX["y_point_linear_animation"]["length"] = 5
    obj_VFX["y_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj_VFX,obj_VFX["y_point_linear_animation"])
    obj_VFX["frame_animation"] = {}
    obj_VFX["frame_animation"][0] = 0
    obj_VFX["frame_animation"][1] = 1
    obj_VFX["frame_animation"][2] = 2
    obj_VFX["frame_animation"][3] = 3
    obj_VFX["frame_animation"][4] = 4
    obj_VFX["frame_animation"]["prop"] = 8
    obj_VFX["frame_animation"]["length"] = 4
    obj_VFX["frame_animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["frame_animation"])
    obj_VFX["update"] = function()
        if obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            point_linear_animator(obj_VFX,obj_VFX["x_point_linear_animation"])
            point_linear_animator(obj_VFX,obj_VFX["y_point_linear_animation"])
            frame_animator(obj_VFX,obj_VFX["frame_animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_char["x"] + obj_char[5]*(obj_VFX["x_offset"])
        obj_VFX[2] = obj_char["y"] + obj_char[6]*(obj_VFX["y_offset"])
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_6SP_P_arua(hit_side_obj_char,hurt_side_obj_char)
    local obj_VFX = {0,0,0,0.75,0,0,0,0}
    local side = hit_side_obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["6SP_P_arua_move_VFX"]
    local obj_camera = obj_stage_game_scene_camera
    local shot_sys_curse_force_off_state = hit_side_obj_char["shot_sys_curse_force_off_state"]

    if hurt_side_obj_char["height"] == "air" then
        obj_VFX["y_offset"] = 375 + hurt_side_obj_char["pushbox"][4]/4*3
    elseif hurt_side_obj_char["height"] == "wallstick" then
        obj_VFX["y_offset"] = 350 + hurt_side_obj_char["pushbox"][4]/4*3
    else
        obj_VFX["y_offset"] = 400 + hurt_side_obj_char["pushbox"][4]/4*3
    end

    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["life"] = 42
    obj_VFX[1] = hurt_side_obj_char["x"] - 400
    obj_VFX[2] = math.min(hurt_side_obj_char["y"] - hurt_side_obj_char[6]*obj_VFX["y_offset"],-677.5)
    obj_VFX[3] = hurt_side_obj_char[3]
    obj_VFX[4] = 0.75
    obj_VFX[5] = 1
    obj_VFX[6] = 1
    obj_VFX[7] = 0
    obj_VFX[8] = 0
    obj_VFX["state"] = "loop"
    
    obj_VFX["frame_animation"] = {}
    for i = 0,149 do
        obj_VFX["frame_animation"][i*2] = i
    end
    obj_VFX["frame_animation"]["prop"] = 8
    obj_VFX["frame_animation"]["length"] = 300
    obj_VFX["frame_animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["frame_animation"])

    obj_VFX["opacity_point_linear_animation"] = {}
    obj_VFX["opacity_point_linear_animation"][0] = {0.75,20}
    obj_VFX["opacity_point_linear_animation"][20] = {0,20}
    obj_VFX["opacity_point_linear_animation"]["prop"] = 4
    obj_VFX["opacity_point_linear_animation"]["length"] = 20
    obj_VFX["opacity_point_linear_animation"]["loop"] = false
    -- init_point_linear_anim_without(obj_VFX,obj_VFX["opacity_point_linear_animation"])

    local function update_frame_animation()
        frame_animator(obj_VFX,obj_VFX["frame_animation"])
        if get_frame_anim_end_state(obj_VFX,obj_VFX["frame_animation"]) then
            obj_VFX["FCT"][8] = 120
            frame_animator(obj_VFX,obj_VFX["frame_animation"])
        end
    end

    obj_VFX["update"] = function()
        local switch = {
            -- ease_in 之前的状态 如果达到第10帧则为下一个动画的第0帧 
            ["loop"] = function()
                obj_VFX["life"] = 42
                update_frame_animation()
                if shot_sys_curse_force_off_state[hit_side_obj_char["state"]] or (not hit_side_obj_char["shot_sys_curse"]) then
                    obj_VFX["state"] = "end"
                    init_point_linear_anim_with(obj_VFX,obj_VFX["opacity_point_linear_animation"])
                end
                if hurt_side_obj_char["state"] == "wallbreak_hurt" then
                    obj_VFX[4] = 0
                    obj_VFX["state"] = "wallbreak"
                end
            end,
            ["end"] = function()
                obj_VFX["life"] = 42
                update_frame_animation()
                point_linear_animator(obj_VFX,obj_VFX["opacity_point_linear_animation"])
                if get_point_linear_anim_end_state(obj_VFX,obj_VFX["opacity_point_linear_animation"])
                or hurt_side_obj_char["state"] == "wallbreak_hurt" then
                    obj_VFX["life"] = 0
                end
            end,
            ["wallbreak"] = function()
                obj_VFX["life"] = 42
                if hurt_side_obj_char["state"] ~= "wallbreak_hit" and hurt_side_obj_char["state"] ~= "wallbreak_hurt" then
                    obj_VFX[4] = 1
                    obj_VFX["state"] = "loop"
                    init_frame_anim_with(obj_VFX,obj_VFX["frame_animation"])
                end
            end
        }
        local this_function = switch[obj_VFX["state"]]
        if this_function then this_function() end

        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        if hurt_side_obj_char["height"] == "air" then
            obj_VFX["y_offset"] = 375 + hurt_side_obj_char["pushbox"][4]/4*3
        elseif hurt_side_obj_char["height"] == "wallstick" then
            obj_VFX["y_offset"] = 350 + hurt_side_obj_char["pushbox"][4]/4*3
        else
            obj_VFX["y_offset"] = 400 + hurt_side_obj_char["pushbox"][4]/4*3
        end
        obj_VFX[1] = hurt_side_obj_char["x"] - 400
        obj_VFX[2] = math.min(hurt_side_obj_char["y"] - hurt_side_obj_char[6]*obj_VFX["y_offset"],-677.5)
        obj_VFX[3] = hurt_side_obj_char[3]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setColor(1,1,1,obj_VFX[4])
        love.graphics.setBlendMode("subtract")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(hurt_side_obj_char["VFX_status_back_table"],obj_VFX)
end

function insert_VFX_game_scene_char_TRM_6SP_S_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["6SP_S_move_VFX"]

    obj_VFX["life"] = 21
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(-63)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(-727)
    obj_VFX[3] = obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = obj_char[5]
    obj_VFX[6] = obj_char[6]
    obj_VFX[7] = obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][2] = 1
    obj_VFX["animation"][4] = 2
    obj_VFX["animation"][7] = 3
    obj_VFX["animation"][10] = 4
    obj_VFX["animation"][13] = 5
    obj_VFX["animation"][17] = 6
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 21
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if obj_char["state"] == "6SP_S" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do nothing
        else
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_char["x"] + obj_char[5]*(-63)
        obj_VFX[2] = obj_char["y"] + obj_char[6]*(-727)
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
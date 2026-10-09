function insert_VFX_game_scene_char_TRM_2P_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
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
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_6P_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
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
    local obj_camera = obj_stage_game_scene_camera
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
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_2S_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
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
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_6S_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["6S_move_VFX"]
    obj_VFX["life"] = 36
    obj_VFX[1] = obj_char["x"] + obj_char[5]*(-430)
    obj_VFX[2] = obj_char["y"] + obj_char[6]*(-510)
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
        obj_VFX[2] = obj_char["y"] + obj_char[6]*(-510)
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = obj_char[7]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
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
    local obj_camera = obj_stage_game_scene_camera
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
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_hit_blast(hit_side_obj_char,hurt_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(hit_side)
    local hit_side_image_sprite_sheet = hit_side_image_sprite_sheet_table["5H_hit_blast_move_VFX"]
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
        if math.random(0,1) == 0 then
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
            if math.random(0,1) == 0 then
                obj_VFX[1] = hit_side_obj_char["shot_sys_reticle"][1] + 230 + 160
                obj_VFX[5] = -1
            end
        end
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local image_sprite_sheet = hit_side_image_sprite_sheet
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
    local obj_camera = obj_stage_game_scene_camera
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
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_5Launcher_move_glow(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
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
    for i = 0,17 do
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
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_j5S_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table["j5S_move_VFX"]
    obj_VFX["life"] = 9
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
    obj_VFX["animation"][5] = 2
    obj_VFX["animation"][7] = 3
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 9
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
        if obj_VFX["FCT"][8] < 7 and obj_char["state"] == "j5S" then
            obj_VFX[1] = obj_char["x"] + obj_char[5]*(-120)
            obj_VFX[2] = obj_char["y"] + obj_char[6]*(-370)
            obj_VFX[3] = obj_char[3]
            obj_VFX[4] = 1
            obj_VFX[5] = obj_char[5]
            obj_VFX[6] = obj_char[6]
            obj_VFX[7] = obj_char[7]
        elseif obj_char["state"] == "j5S" then
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
    local obj_camera = obj_stage_game_scene_camera
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
    -- x_point_linear_animation
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
    -- y_point_linear_animation
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
    -- opacity_point_linear_animation
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
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_6SP_P_spawn_halo(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
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
    -- x_point_linear_animation
    obj_VFX["x_point_linear_animation"] = {}
    obj_VFX["x_point_linear_animation"][0] = {-72.5,2}
    obj_VFX["x_point_linear_animation"][2] = {-72.5,5}
    obj_VFX["x_point_linear_animation"][5] = {-52.5,5}
    obj_VFX["x_point_linear_animation"]["prop"] = "x_offset"
    obj_VFX["x_point_linear_animation"]["length"] = 5
    obj_VFX["x_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj_VFX,obj_VFX["x_point_linear_animation"])
    -- y_point_linear_animation
    obj_VFX["y_point_linear_animation"] = {}
    obj_VFX["y_point_linear_animation"][0] = {-352.5,2}
    obj_VFX["y_point_linear_animation"][2] = {-352.5,5}
    obj_VFX["y_point_linear_animation"][5] = {-355,5}
    obj_VFX["y_point_linear_animation"]["prop"] = "y_offset"
    obj_VFX["y_point_linear_animation"]["length"] = 5
    obj_VFX["y_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj_VFX,obj_VFX["y_point_linear_animation"])
    -- frame_animation
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
    local obj_camera = obj_stage_game_scene_camera
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_shot_sys_curse_ban_state = hit_side_obj_char["shot_sys_curse_ban_state"]
    local hit_side_image_sprite_sheet = common_game_scene_get_VFX_sprite_sheet_table(hit_side)["6SP_P_arua_move_VFX"]
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    if hurt_side_obj_char["height"] == "air" then
        obj_VFX["y_offset"] = 400 + hurt_side_obj_char["pushbox"][4]/4*3
    elseif hurt_side_obj_char["height"] == "wallstick" then
        obj_VFX["y_offset"] = 350 + hurt_side_obj_char["pushbox"][4]/4*3
    else
        obj_VFX["y_offset"] = 400 + hurt_side_obj_char["pushbox"][4]/4*3
    end
    obj_VFX["status_name"] = "TRM_6SP_P_arua"
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
    -- frame_animation
    obj_VFX["frame_animation"] = {}
    for i = 0,149 do
        obj_VFX["frame_animation"][i*2] = i
    end
    obj_VFX["frame_animation"]["prop"] = 8
    obj_VFX["frame_animation"]["length"] = 300
    obj_VFX["frame_animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["frame_animation"])
    -- opacity_ease_in_point_linear_animation
    obj_VFX["opacity_ease_in_point_linear_animation"] = {}
    obj_VFX["opacity_ease_in_point_linear_animation"][0] = {0,20}
    obj_VFX["opacity_ease_in_point_linear_animation"][20] = {0.75,20}
    obj_VFX["opacity_ease_in_point_linear_animation"]["prop"] = 4
    obj_VFX["opacity_ease_in_point_linear_animation"]["length"] = 20
    obj_VFX["opacity_ease_in_point_linear_animation"]["loop"] = false
    -- opacity_ease_out_point_linear_animation
    obj_VFX["opacity_ease_out_point_linear_animation"] = {}
    obj_VFX["opacity_ease_out_point_linear_animation"][0] = {0.75,20}
    obj_VFX["opacity_ease_out_point_linear_animation"][20] = {0,20}
    obj_VFX["opacity_ease_out_point_linear_animation"]["prop"] = 4
    obj_VFX["opacity_ease_out_point_linear_animation"]["length"] = 20
    obj_VFX["opacity_ease_out_point_linear_animation"]["loop"] = false
    local function update_frame_animation()
        frame_animator(obj_VFX,obj_VFX["frame_animation"])
        if get_frame_anim_end_state(obj_VFX,obj_VFX["frame_animation"]) then
            obj_VFX["FCT"][8] = 120
            frame_animator(obj_VFX,obj_VFX["frame_animation"])
        end
    end
    obj_VFX["update"] = function()
        local switch = {
            ["loop"] = function()
                update_frame_animation()
                if hit_side_shot_sys_curse_ban_state[hit_side_obj_char["state"]] or
                (not hit_side_obj_char["shot_sys_curse"]) then
                    obj_VFX["state"] = "end"
                    init_point_linear_anim_with(obj_VFX,obj_VFX["opacity_ease_out_point_linear_animation"])
                    play_obj_audio(hit_side_move_SFX_table["6SP_P_curse_end"])
                end
                if hurt_side_obj_char["state"] == "wallbreak_hurt" then
                    obj_VFX[4] = 0
                    obj_VFX["state"] = "wallbreak"
                end
            end,
            ["end"] = function()
                update_frame_animation()
                point_linear_animator(obj_VFX,obj_VFX["opacity_ease_out_point_linear_animation"])
                if get_point_linear_anim_end_state(obj_VFX,obj_VFX["opacity_ease_out_point_linear_animation"])
                or hurt_side_obj_char["state"] == "wallbreak_hurt" then
                    obj_VFX["life"] = 0
                end
            end,
            ["wallbreak"] = function()
                if hurt_side_obj_char["state"] ~= "wallbreak_hit" and
                hurt_side_obj_char["state"] ~= "wallbreak_hurt" then
                    obj_VFX[4] = 0
                    obj_VFX["state"] = "ease_in_after_wallbreak"
                    init_frame_anim_with(obj_VFX,obj_VFX["frame_animation"])
                    init_point_linear_anim_with(obj_VFX,obj_VFX["opacity_ease_in_point_linear_animation"])
                    obj_VFX["FCT"][8] = 60
                    obj_VFX[8] = 30
                end
            end,
            ["ease_in_after_wallbreak"] = function()
                update_frame_animation()
                point_linear_animator(obj_VFX,obj_VFX["opacity_ease_in_point_linear_animation"])
                if get_point_linear_anim_end_state(obj_VFX,obj_VFX["opacity_ease_in_point_linear_animation"]) then
                    obj_VFX["state"] = "loop"
                end
                if hit_side_shot_sys_curse_ban_state[hit_side_obj_char["state"]] or
                (not hit_side_obj_char["shot_sys_curse"]) then
                    obj_VFX["state"] = "end"
                    init_point_linear_anim_with(obj_VFX,obj_VFX["opacity_ease_out_point_linear_animation"])
                end
                if hurt_side_obj_char["state"] == "wallbreak_hurt" then
                    obj_VFX[4] = 0
                    obj_VFX["state"] = "wallbreak"
                end
            end
        }
        local this_function = switch[obj_VFX["state"]]
        if this_function then this_function() end
    end
    obj_VFX["draw_sync"] = function()
        if hurt_side_obj_char["height"] == "air" then
            obj_VFX["y_offset"] = 400 + hurt_side_obj_char["pushbox"][4]/4*3
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
        hit_side_image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,hit_side_image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setColor(1,1,1,obj_VFX[4])
        love.graphics.setBlendMode("subtract")
        love.graphics.draw(hit_side_image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(hurt_side_obj_char["VFX_status_back_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_4SP_S_at_the_steady_projectile_hit_blast(hit_side_obj_char,hurt_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local hit_side = obj_char["player_side"]
    local hit_side_image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(hit_side)
    local hit_side_image_sprite_sheet = hit_side_image_sprite_sheet_table["4SP_S_H_hit_blast_move_VFX"]
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
        if math.random(0,1) == 0 then
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
            if math.random(0,1) == 0 then
                obj_VFX[1] = hit_side_obj_char["shot_sys_reticle"][1] + 230 + 160
                obj_VFX[5] = -1
            end
        end
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local image_sprite_sheet = hit_side_image_sprite_sheet
        -- obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setColor(35/255,35/255,35/255,175/255)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(hit_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_6SP_S_move(obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
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
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
-- attachment
function insert_VFX_game_scene_char_TRM_oroboros_switch(obj_char,sprite_sheet)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local height_y_offset = {
        ["stand"] = -730,
        ["crouch"] = -530,
        ["air"] = -440,
        ["OTG"] = -230
    }
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table[sprite_sheet]
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
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,tostring(obj_VFX[8]))
        love.graphics.setColor(5/255,5/255,5/255,0.5)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_common_back_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_oroboros_blast(obj_char,sprite_sheet)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local oroboros_pos = {
        obj_char["shot_sys_oroboros_ease_current"][1],obj_char["shot_sys_oroboros_ease_current"][2]
    }
    local reticle_pos = {
        obj_char["shot_sys_reticle_stage_pos_current"][1] + 160,
        obj_char["shot_sys_reticle_stage_pos_current"][2] + 160
    }
    local center_dx = 35
    local center_dy = -210
    local center_r = character_function_game_scene_TRM_shot_sys_at_the_ready_aim_r_calculation(
        obj_char,oroboros_pos,reticle_pos
    )
    local rot_dx =
        center_dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.cos(center_r) -
        center_dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.sin(center_r)
    local rot_dy =
        center_dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.sin(center_r) +
        center_dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.cos(center_r)
    local side = obj_char["player_side"]
    local image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(side)
    local image_sprite_sheet = image_sprite_sheet_table[sprite_sheet]
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
        frame_animator(obj_VFX,obj_VFX["animation"])
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        local oroboros_pos = {
            obj_char["shot_sys_oroboros_ease_current"][1],obj_char["shot_sys_oroboros_ease_current"][2]
        }
        local reticle_pos = {
            obj_char["shot_sys_reticle_stage_pos_current"][1] + 160,
            obj_char["shot_sys_reticle_stage_pos_current"][2] + 160
        }
        local center_dx = 35
        local center_dy = -210
        local center_r = character_function_game_scene_TRM_shot_sys_at_the_ready_aim_r_calculation(
            obj_char,oroboros_pos,reticle_pos
        )
        local rot_dx =
            center_dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.cos(center_r) -
            center_dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.sin(center_r)
        local rot_dy =
            center_dx*obj_char["shot_sys_oroboros_ease_current"][3]*math.sin(center_r) +
            center_dy*obj_char["shot_sys_oroboros_ease_current"][4]*math.cos(center_r)
        obj_VFX[1] = obj_char["shot_sys_oroboros_ease_current"][1] + rot_dx
        obj_VFX[2] = obj_char["shot_sys_oroboros_ease_current"][2] + rot_dy
        obj_VFX[3] = obj_char[3]
        obj_VFX[5] = obj_char[5]
        obj_VFX[6] = obj_char[6]
        obj_VFX[7] = center_r
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setColor(55/255,55/255,55/255,255/255)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_oroboros_blast_trajectory(obj_char,blast_width)
    -- 未命中则不生成弹道
    if obj_char["shot_sys_aim_process"][1] < obj_char["shot_sys_aim_process"][3] then
        return
    end
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local blast_box_points = {0,0,0,0,0,0,0,0}
    local blast_canvas_table = {["L"] = CANVAS_CHAR_BLAST_TRAJECTORY_LP,["R"] = CANVAS_CHAR_BLAST_TRAJECTORY_RP}
    local function draw_blast_box(start_cood,end_cood,half_width)
        local box_dx = end_cood[1] - start_cood[1]
        local box_dy = end_cood[2] - start_cood[2]
        local box_scale = half_width/math.sqrt(box_dx^2 + box_dy^2)
        local box_offset_x = -box_dy*box_scale
        local box_offset_y = box_dx*box_scale
        blast_box_points[1] = start_cood[1] + box_offset_x
        blast_box_points[2] = start_cood[2] + box_offset_y
        blast_box_points[3] = end_cood[1] + box_offset_x
        blast_box_points[4] = end_cood[2] + box_offset_y
        blast_box_points[5] = end_cood[1] - box_offset_x
        blast_box_points[6] = end_cood[2] - box_offset_y
        blast_box_points[7] = start_cood[1] - box_offset_x
        blast_box_points[8] = start_cood[2] - box_offset_y
        love.graphics.polygon("fill",blast_box_points)
        love.graphics.polygon("line",blast_box_points)
    end
    obj_VFX["f"] = 0 -- 本VFX插入于VFX更新之后，首次绘制时帧数仍为0
    obj_VFX["life"] = 5
    obj_VFX["blast_width"] = blast_width
    obj_VFX["blast_start_distance"] = 240
    obj_VFX["blast_extend_distance"] = 1000
    obj_VFX["blast_draw_canvas"] = blast_canvas_table[obj_char["player_side"]]
    obj_VFX["update"] = function()
        obj_VFX["f"] = obj_VFX["f"] + 1
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[3] = obj_char[3]
        -- 只在首次绘制时确定弹道位置，之后仅随摄像机重新投影
        local oroboros_pos = {
            obj_char["shot_sys_oroboros_ease_current"][1],obj_char["shot_sys_oroboros_ease_current"][2]
        }
        local reticle_pos = {
            obj_char["shot_sys_reticle_stage_pos_current"][1] + 160,
            obj_char["shot_sys_reticle_stage_pos_current"][2] + 160
        }
        local blast_dx = reticle_pos[1] - oroboros_pos[1]
        local blast_dy = reticle_pos[2] - oroboros_pos[2]
        local blast_dist = math.sqrt(blast_dx^2 + blast_dy^2)
        if blast_dist > obj_VFX["blast_start_distance"] then
            local blast_start_offset = obj_VFX["blast_start_distance"]/blast_dist
            -- 延长线按原方向随机偏转(2度以上13度以内)
            local blast_extend_r = math.atan2(blast_dy,blast_dx) +
                math.rad(math.random(2,13))*((math.random(2) == 1) and 1 or -1)
            obj_VFX["blast_end_pos"] = reticle_pos
            obj_VFX["blast_start_pos"] = {
                oroboros_pos[1] + blast_dx*blast_start_offset,
                oroboros_pos[2] + blast_dy*blast_start_offset
            }
            obj_VFX["blast_extend_pos"] = {
                reticle_pos[1] + math.cos(blast_extend_r)*obj_VFX["blast_extend_distance"],
                reticle_pos[2] + math.sin(blast_extend_r)*obj_VFX["blast_extend_distance"]
            }
        end
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        obj_VFX["draw_sync"]()
        local blast_frame_alpha = 1 - (obj_VFX["f"]/5)^2
        if obj_VFX["blast_start_pos"] and blast_frame_alpha > 0 then
            local blast_scale = draw_resolution_correction(800)/(obj_VFX[3] - obj_camera[3])
            local blast_screen_width = draw_resolution_correction(obj_VFX["blast_width"])*blast_scale
            local blast_half_width = blast_screen_width/2
            local blast_mask_margin = 2 -- 遮罩需比梁体略大,以覆盖描边超出的部分
            local blast_mask_height = blast_screen_width + blast_mask_margin*2
            local blast_end_cood = draw_3d_point_to_2D(
                obj_camera,{obj_VFX["blast_end_pos"][1],obj_VFX["blast_end_pos"][2],obj_VFX[3]}
            )
            local blast_start_cood = draw_3d_point_to_2D(
                obj_camera,{obj_VFX["blast_start_pos"][1],obj_VFX["blast_start_pos"][2],obj_VFX[3]}
            )
            local blast_start_dx = blast_end_cood[1] - blast_start_cood[1]
            local blast_start_dy = blast_end_cood[2] - blast_start_cood[2]
            local blast_start_sx =
                math.sqrt(blast_start_dx^2 + blast_start_dy^2)/image_game_scene_alpha_gradient_mask:getWidth()
            local blast_extend_cood = draw_3d_point_to_2D(
                obj_camera,{obj_VFX["blast_extend_pos"][1],obj_VFX["blast_extend_pos"][2],obj_VFX[3]}
            )
            local blast_extend_dx = blast_end_cood[1] - blast_extend_cood[1]
            local blast_extend_dy = blast_end_cood[2] - blast_extend_cood[2]
            local blast_extend_sx =
                math.sqrt(blast_extend_dx^2 + blast_extend_dy^2)/image_game_scene_alpha_gradient_mask:getWidth()
            -- 先在canvas上把填充和描边一起画出(描边覆盖锯齿边界,与draw_char_select_scene_glow一致)
            love.graphics.setCanvas(obj_VFX["blast_draw_canvas"])
            love.graphics.clear(0,0,0,0)
            love.graphics.setBlendMode("alpha","alphamultiply")
            love.graphics.setColor(1,1,1,1)
            love.graphics.setLineStyle("smooth")
            love.graphics.setLineWidth(1.5) -- 线宽略大于1以覆盖锯齿边界
            draw_blast_box(blast_start_cood,blast_end_cood,blast_half_width)
            draw_blast_box(blast_extend_cood,blast_end_cood,blast_half_width)
            -- 再用alpha渐变遮罩乘算,给整条梁做淡入淡出
            love.graphics.setBlendMode("multiply","premultiplied")
            love.graphics.setColor(1,1,1,1)
            love.graphics.draw(
                image_game_scene_alpha_gradient_mask,blast_start_cood[1],blast_start_cood[2],
                math.atan2(blast_start_dy,blast_start_dx),blast_start_sx,blast_mask_height,0,0.5
            )
            love.graphics.draw(
                image_game_scene_alpha_gradient_mask,blast_extend_cood[1],blast_extend_cood[2],
                math.atan2(blast_extend_dy,blast_extend_dx),blast_extend_sx,blast_mask_height,0,0.5
            )
            love.graphics.setLineWidth(1)
            love.graphics.setCanvas()
            -- 透明度统一在canvas合成时应用
            love.graphics.setBlendMode("alpha","premultiplied")
            love.graphics.setColor(
                55/255*blast_frame_alpha,55/255*blast_frame_alpha,55/255*blast_frame_alpha,blast_frame_alpha
            )
            love.graphics.draw(obj_VFX["blast_draw_canvas"])
            love.graphics.setColor(1,1,1,1)
            love.graphics.setBlendMode("alpha","alphamultiply")
        end
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
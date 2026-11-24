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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        if obj_char["state"] == "2P" then
            frame_animator(
                obj_VFX,obj_VFX["animation"]
            )
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do_nothing
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        if obj_char["state"] == "6P" then
            frame_animator(
                obj_VFX,obj_VFX["animation"]
            )
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do_nothing
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        if obj_char["state"] == "5P" then
            frame_animator(
                obj_VFX,obj_VFX["animation"]
            )
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do_nothing
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        if obj_char["state"] == "2S" then
            frame_animator(
                obj_VFX,obj_VFX["animation"]
            )
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do_nothing
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        if obj_char["state"] == "6S" then
            frame_animator(
                obj_VFX,obj_VFX["animation"]
            )
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do_nothing
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        if obj_char["state"] == "cS" then
            frame_animator(
                obj_VFX,obj_VFX["animation"]
            )
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do_nothing
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_5H_at_the_ready_projectile_hit_blast(
    hit_side_obj_char,hurt_side_obj_char
)
    -- x_y_z_opacity_sx_sy_r_f
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
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
        frame_animator(
            obj_VFX,obj_VFX["animation"]
        )
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
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        if obj_char["state"] == "5Launcher" then
            frame_animator(
                obj_VFX,obj_VFX["animation"]
            )
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do_nothing
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        if obj_char["state"] == "5Launcher" then
            frame_animator(
                obj_VFX,obj_VFX["animation"]
            )
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do_nothing
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        if obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do_nothing
        else
            frame_animator(
                obj_VFX,obj_VFX["animation"]
            )
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
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
    init_point_linear_anim_without(
        obj_VFX,obj_VFX["x_point_linear_animation"]
    )
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
    init_point_linear_anim_without(
        obj_VFX,obj_VFX["y_point_linear_animation"]
    )
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
    init_point_linear_anim_without(
        obj_VFX,obj_VFX["opacity_point_linear_animation"]
    )
    obj_VFX["update"] = function()
        if obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do_nothing
        else
            point_linear_animator(
                obj_VFX,obj_VFX["x_point_linear_animation"]
            )
            point_linear_animator(
                obj_VFX,obj_VFX["y_point_linear_animation"]
            )
            point_linear_animator(
                obj_VFX,obj_VFX["opacity_point_linear_animation"]
            )
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
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
    init_point_linear_anim_without(
        obj_VFX,obj_VFX["x_point_linear_animation"]
    )
    -- y_point_linear_animation
    obj_VFX["y_point_linear_animation"] = {}
    obj_VFX["y_point_linear_animation"][0] = {-352.5,2}
    obj_VFX["y_point_linear_animation"][2] = {-352.5,5}
    obj_VFX["y_point_linear_animation"][5] = {-355,5}
    obj_VFX["y_point_linear_animation"]["prop"] = "y_offset"
    obj_VFX["y_point_linear_animation"]["length"] = 5
    obj_VFX["y_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(
        obj_VFX,obj_VFX["y_point_linear_animation"]
    )
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["frame_animation"]
    )
    obj_VFX["update"] = function()
        if obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do_nothing
        else
            point_linear_animator(
                obj_VFX,obj_VFX["x_point_linear_animation"]
            )
            point_linear_animator(
                obj_VFX,obj_VFX["y_point_linear_animation"]
            )
            frame_animator(
                obj_VFX,obj_VFX["frame_animation"]
            )
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_6SP_P_arua(hit_side_obj_char,hurt_side_obj_char)
    -- 6SP_P 诅咒光环(shaders/characters/TRM/6SP_P_arua.glsl)
    -- 粒子的发射 / 回收 / 绘制见 _character_function.lua 的 character_function_game_scene_TRM_6SP_P_arua_*
    -- 参数在 left.lua / right.lua 的 load_game_scene_config_char_LP / RP 里
    local obj_VFX = {0,0,0,0.75,0,0,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_shot_sys_curse_ban_state = hit_side_obj_char["shot_sys_curse_ban_state"]
    -- 画面由 shaders/characters/TRM/6SP_P_arua.glsl 程序化生成
    local hit_side_shader = common_game_scene_get_shader(hit_side)["6SP_P_arua"]
    local hit_side_config = common_game_scene_get_config(hit_side)
    local hit_side_move_SFX_table = common_game_scene_get_SFX_move(hit_side)
    if hurt_side_obj_char["height"] == "air" then
        obj_VFX["y_offset"] = 550
    elseif hurt_side_obj_char["height"] == "wallstick" then
        obj_VFX["y_offset"] = 550
    else
        obj_VFX["y_offset"] = 400
    end
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["life"] = 42
    obj_VFX[1] = hurt_side_obj_char["x"] - 400
    obj_VFX[2] = math.min(hurt_side_obj_char["y"] - hurt_side_obj_char[6]*obj_VFX["y_offset"],-677.5)
    obj_VFX[3] = hurt_side_obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = 1
    obj_VFX[6] = 1
    obj_VFX[7] = 0
    obj_VFX[8] = 0
    obj_VFX["state"] = "loop"
    obj_VFX["status_name"] = "TRM_6SP_P_arua"
    -- 参数和随机数发生器都用释放方(hit side)的 config
    obj_VFX["config"] = hit_side_config["6SP_P_arua"]
    obj_VFX["6SP_P_arua_RNG"] = hit_side_config["6SP_P_arua_RNG"]
    obj_VFX["6SP_P_arua_quad_image"] = hit_side_config["6SP_P_arua_quad_image"]
    -- 粒子数据贴图在 config 加载时已经建好(同一侧共用),释放时不新建
    obj_VFX["particle_image_data"] = hit_side_config["6SP_P_arua_particle_image_data"]
    obj_VFX["particle_image"] = hit_side_config["6SP_P_arua_particle_image"]
    -- draw 里复用的表(投影用的点、send 用的 vec2),不每帧新建
    obj_VFX["corner_point"] = {0,0,0}
    obj_VFX["area_origin"] = {0,0}
    obj_VFX["area_size"] = {0,0}
    -- config 里的 shader 参数在释放时送一次(shader 会一直保留 uniform 的值,不用每帧送)
    -- shader 子表里的每一项都必须是 shader 里用到的 uniform
    for name,value in pairs(obj_VFX["config"]["shader"]) do
        hit_side_shader:send(name,value)
    end
    -- shader 用的连续时间(单位:序列帧,1 序列帧 = 2 tick),只增不跳
    obj_VFX["shader_time"] = 0
    obj_VFX["emitting"] = true
    -- 每次释放随机一个噪波偏移,图案不重复
    obj_VFX["noise_offset"] = {obj_VFX["6SP_P_arua_RNG"]:random()*100,obj_VFX["6SP_P_arua_RNG"]:random()*100}
    -- 粒子出生范围的中心 = 原来那一帧 800x800 的中心
    character_function_game_scene_TRM_6SP_P_arua_reset_particles(obj_VFX,obj_VFX[1] + 400,obj_VFX[2] + 400)
    -- 每 tick:时间前进半个序列帧,跟着受击方位置发射 / 回收粒子
    local function update_particles()
        obj_VFX["shader_time"] = obj_VFX["shader_time"] + 0.5
        obj_VFX["draw_sync"]()
        character_function_game_scene_TRM_6SP_P_arua_update_particles(obj_VFX,obj_VFX[1] + 400,obj_VFX[2] + 400,0.5)
    end
    obj_VFX["update"] = function()
        local switch = {
            ["loop"] = function()
                update_particles()
                if hit_side_shot_sys_curse_ban_state[hit_side_obj_char["state"]]
                or (not hit_side_obj_char["shot_sys_curse"]) then
                    -- 结束:停止发射,等已有粒子自然死亡(最多一个 life)
                    obj_VFX["state"] = "end"
                    obj_VFX["emitting"] = false
                    play_obj_audio(hit_side_move_SFX_table["6SP_P_curse_end"])
                end
                if hurt_side_obj_char["state"] == "wallbreak_hurt" then
                    obj_VFX[4] = 0
                    obj_VFX["state"] = "wallbreak"
                end
            end,
            ["end"] = function()
                update_particles()
                -- 粒子全部死亡后关掉
                if #obj_VFX["particles"] == 0
                or hurt_side_obj_char["state"] == "wallbreak_hurt" then
                    obj_VFX["life"] = 0
                end
            end,
            ["wallbreak"] = function()
                if hurt_side_obj_char["state"] ~= "wallbreak_hit"
                and hurt_side_obj_char["state"] ~= "wallbreak_hurt" then
                    -- 破墙结束:重新显示,粒子从 0 开始自然发射出来
                    obj_VFX[4] = 0.75
                    obj_VFX["state"] = "ease_in_after_wallbreak"
                    -- 破墙后换了场地,旧粒子留在原来的世界坐标没有意义,全部在新位置重新出生
                    obj_VFX["draw_sync"]()
                    character_function_game_scene_TRM_6SP_P_arua_reset_particles(obj_VFX,obj_VFX[1] + 400,obj_VFX[2] + 400)
                end
            end,
            ["ease_in_after_wallbreak"] = function()
                update_particles()
                obj_VFX["state"] = "loop"
                if hit_side_shot_sys_curse_ban_state[hit_side_obj_char["state"]]
                or (not hit_side_obj_char["shot_sys_curse"]) then
                    obj_VFX["state"] = "end"
                    obj_VFX["emitting"] = false
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
            obj_VFX["y_offset"] = 550
        elseif hurt_side_obj_char["height"] == "wallstick" then
            obj_VFX["y_offset"] = 550
        else
            obj_VFX["y_offset"] = 400
        end
        obj_VFX[1] = hurt_side_obj_char["x"] - 400
        obj_VFX[2] = math.min(hurt_side_obj_char["y"] - hurt_side_obj_char[6]*obj_VFX["y_offset"],-677.5)
        obj_VFX[3] = hurt_side_obj_char[3]
    end
    obj_VFX["draw"] = function()
        obj_VFX["draw_sync"]()
        -- obj_VFX[4] 只当显示开关用(破墙期间 = 0 隐藏)
        if obj_VFX[4] == 0 then
            return
        end
        character_function_game_scene_TRM_6SP_P_arua_draw(obj_camera,obj_VFX,hit_side_shader)
    end
    table.insert(hurt_side_obj_char["VFX_status_back_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_4SP_S_H_at_the_steady_projectile_hit_blast(
    hit_side_obj_char,hurt_side_obj_char
)
    -- x_y_z_opacity_sx_sy_r_f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_image_sprite_sheet_table = common_game_scene_get_VFX_sprite_sheet_table(hit_side)
    local hit_side_image_sprite_sheet = hit_side_image_sprite_sheet_table["4SP_S_H_hit_blast_move_VFX"]
    -- 旋转角取 oroboros 指向 reticle 的方向
    local oroboros_pos = {
        hit_side_obj_char["shot_sys_oroboros_ease_current"][1],
        hit_side_obj_char["shot_sys_oroboros_ease_current"][2]
    }
    local reticle_pos = {
        hit_side_obj_char["shot_sys_reticle_stage_pos_current"][1] + 160,
        hit_side_obj_char["shot_sys_reticle_stage_pos_current"][2] + 160
    }
    -- 旋转锚点为命中点(reticle 中心), -260/-300 为未旋转时贴图左上角相对锚点的偏移
    local center_dx = -260
    local center_dy = -300
    local center_r = character_function_game_scene_TRM_shot_sys_at_the_ready_aim_r_calculation(
        hit_side_obj_char,oroboros_pos,reticle_pos
    )
    local rot_dx = center_dx*math.cos(center_r) - center_dy*math.sin(center_r)
    local rot_dy = center_dx*math.sin(center_r) + center_dy*math.cos(center_r)
    -- 反向情况(命中方在受击方右侧)贴图水平翻转, 偏移量的 x 分量同步取反
    local rot_dx_reverse = -center_dx*math.cos(center_r) - center_dy*math.sin(center_r)
    local rot_dy_reverse = -center_dx*math.sin(center_r) + center_dy*math.cos(center_r)
    obj_VFX["life"] = 17
    obj_VFX[1] = reticle_pos[1] + rot_dx
    obj_VFX[2] = reticle_pos[2] + rot_dy
    obj_VFX[3] = 0
    obj_VFX[4] = 1
    obj_VFX[5] = 1
    obj_VFX[6] = 1
    obj_VFX[7] = center_r
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][5] = 1
    obj_VFX["animation"][8] = 2
    obj_VFX["animation"][11] = 3
    obj_VFX["animation"][13] = 4
    obj_VFX["animation"][15] = 5
    obj_VFX["animation"][16] = 6
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 17
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        frame_animator(
            obj_VFX,obj_VFX["animation"]
        )
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        if hit_side_obj_char["x"] > hurt_side_obj_char["x"] then
            obj_VFX[1] = reticle_pos[1] + rot_dx_reverse
            obj_VFX[2] = reticle_pos[2] + rot_dy_reverse
            obj_VFX[5] = -1
        elseif hit_side_obj_char["x"] == hurt_side_obj_char["x"] then
            if math.random(0,1) == 0 then
                obj_VFX[1] = reticle_pos[1] + rot_dx_reverse
                obj_VFX[2] = reticle_pos[2] + rot_dy_reverse
                obj_VFX[5] = -1
            end
        end
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local image_sprite_sheet = hit_side_image_sprite_sheet
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
        love.graphics.setColor(35/255,35/255,35/255,225/255)
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        if obj_char["state"] == "6SP_S" then
            frame_animator(
                obj_VFX,obj_VFX["animation"]
            )
            obj_VFX["life"] = obj_VFX["life"] - 1
        elseif obj_char["state"] == "hitstop" or obj_char["state"] == "wallbreak_hit" then
            -- do_nothing
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_5UA_100_heat_follow_arua(obj_char)
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        frame_animator(
            obj_VFX,obj_VFX["animation"]
        )
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
        love.graphics.setColor(5/255,5/255,5/255,0.5)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_common_back_table"],obj_VFX)
end
function insert_VFX_game_scene_char_TRM_oroboros_blast(obj_char,sprite_sheet)
    -- x_y_z_opacity_sx_sy_r_f
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
    init_frame_anim_without(
        obj_VFX,obj_VFX["animation"]
    )
    obj_VFX["update"] = function()
        frame_animator(
            obj_VFX,obj_VFX["animation"]
        )
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
        draw_3d_image_sprite_batch(
            obj_camera,obj_VFX,image_sprite_sheet,obj_VFX[8]
        )
        love.graphics.setColor(55/255,55/255,55/255,255/255)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_common_front_table"],obj_VFX)
end
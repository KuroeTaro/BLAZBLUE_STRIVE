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
-- 6SP_P 诅咒光环(shaders/characters/TRM/6SP_P_arua.glsl)
-- 粒子固定在世界坐标里:每个粒子死亡后,在受击方当前位置附近随机找一个世界坐标重新出生,
-- 之后只在世界里上飘,角色走开了也留在原地,直到死亡。
-- 长度类参数以 400 世界单位为 1.0(原序列帧一帧 800x800,半径 = 1.0)。
-- shader 表里的每一项都会按同名 uniform 送进 shader。
VFX_CONFIG_GAME_SCENE_CHAR_TRM_6SP_P_ARUA = {
    -- 发射(Lua 端)
    emit_rate = 3.75,     -- 发射频率(每序列帧发射几个粒子,1 序列帧 = 2 tick;可以是小数)
                          -- 稳定时同时存在的粒子数 ≈ emit_rate * life
    max_particles = 128,  -- 同时存在的粒子上限(0 = 不限制;设成正数可以加回上限)
    prewarm = false,      -- true = 一出现就按稳定状态铺满;false = 从 0 个开始发射
    blend_mode = "alpha", -- 绘制混合模式:"alpha" / "add" / "subtract"
    spawn_r = 0.50,       -- 出生范围半径
    spawn_pow = 1.25,     -- 出生位置分布:<1 往外散,>1 往中心挤
    spawn_y = 0.175,      -- 出生范围中心的竖直偏移(正 = 往下)
    outer_shrink = 0.25,  -- 外圈粒子缩小比例
    shader = {
        -- 粒子
        life = 12,               -- 寿命(序列帧)
        rise = 0.4,              -- 一生上飘多远(rise*400/life = 每帧速度,现在约 3.6/帧,和参考一致)
        size_start = 0.4,        -- 出生时半径
        size_end = 0.4,          -- 死亡时半径
        shape = 0.25,            -- 越靠粒子中心越容易显示
        -- 内容运动:纹理跟着上飘
        content_follow = 0.42,   -- 纹理跟着上飘的比例(1 = 和粒子同速,0 = 固定在世界里)
        -- 形状噪波(决定 alpha)
        noise_scale = 4.75,      -- 频率(每 400 世界单位几个周期):越大碎片越细
        noise_octaves = 8,       -- 复杂度(层数 1-8,可以是小数)
        noise_roughness = 0.6,   -- 每层衰减:越大边缘越毛糙
        noise_contrast = 7.5,    -- 对比度
        noise_brightness = 0.0,  -- 亮度偏移:越大实心面积越多
        per_particle_noise = 1,  -- 1 = 每个粒子一张独立噪波(更耗);0 = 所有粒子共用一张
        -- 粒子边缘(不是圆形)
        edge_distort = 0.5,      -- 边缘扭曲幅度(相对粒子半径,0 = 纯圆)
        edge_scale = 10.0,       -- 边缘噪波频率
        edge_octaves = 3,        -- 边缘噪波复杂度
        edge_roughness = 0.5,    -- 边缘噪波每层衰减
        edge_cut = 1.2,          -- 外圈切除强度:越大外圈越干净
        edge_start = 0.3,        -- 从粒子半径的多少开始切除
        -- 生命周期
        th_born = 1.4,              -- 出生时阈值(高 = 几乎看不见)
        th_full = 0.38,             -- 完全显现时的阈值(越小越实)
        th_dead = 1.4,              -- 死亡时阈值
        appear = 0.25,              -- 生命前多少比例用来显现
        dissolve = 0.4,             -- 从生命的多少比例开始消散
        particle_fade_in = 0.15,    -- 单个粒子出生淡入(占寿命比例,>0)
        particle_fade_out = 0.25,   -- 单个粒子死亡淡出(占寿命比例,>0)
        particle_opacity = 0.825,   -- 单个粒子本身的不透明度(0-1),不是整体透明度
        -- alpha 软硬 / 烟丝
        edge_softness = 0.25,    -- 实心块边缘宽度:越大越软(>0)
        haze_strength = 0.4,     -- 半透明烟丝的不透明度
        haze_width = 1.6,        -- 烟丝比实心块多扩出去多少(>0)
        -- 整体
        -- tint = {0.84,0.96,0.77},          -- 颜色(RGB 0-1),乘在下面的亮度噪波上
        tint = {0.83,1.0,0.79},          -- 颜色(RGB 0-1),乘在下面的亮度噪波上
        -- 亮度噪波(只平移不变形,稳定往上移动;决定颜色深浅)
        lum_speed = 0.0275,      -- 向上移动速度(每序列帧,400 世界单位 = 1.0;0.025 ≈ 10/帧)
        lum_scale = 7.0,         -- 频率(每 400 世界单位几个周期):越大明暗变化越碎
        lum_octaves = 4,         -- 复杂度(层数 1-8,可以是小数)
        lum_roughness = 0.55,    -- 每层衰减:越大细节越多
        lum_contrast = 5.0,      -- 对比度:越大明暗分得越开
        lum_min = 0.0,           -- 最暗处亮度(0 = 黑)
        lum_max = 1.0,           -- 最亮处亮度(1 = tint 原色)
        lum_gamma = 2.0   -- 亮度曲线:1 = 线性;>1 中间调变暗、整体更暗(最亮处不变);<1 反之
    }
}
local TRM_6SP_P_ARUA_UNIT = 400
-- 用独立的随机数发生器,不动全局的 love.math.random
local rng_game_scene_char_TRM_6SP_P_arua = nil
local function get_rng_game_scene_char_TRM_6SP_P_arua()
    if not rng_game_scene_char_TRM_6SP_P_arua then
        rng_game_scene_char_TRM_6SP_P_arua = love.math.newRandomGenerator(os.time())
    end
    return rng_game_scene_char_TRM_6SP_P_arua
end
-- 在 (center_x,center_y) 附近给一个粒子分配新的世界坐标出生点
-- particle = {x,y,birth,seed,-,size_mul}
local function spawn_particle_game_scene_char_TRM_6SP_P_arua(particle,birth,center_x,center_y)
    local config = VFX_CONFIG_GAME_SCENE_CHAR_TRM_6SP_P_ARUA
    local rng = get_rng_game_scene_char_TRM_6SP_P_arua()
    local rr = rng:random()^config["spawn_pow"]
    local angle = rng:random()*math.pi*2
    local radius = config["spawn_r"]*rr*TRM_6SP_P_ARUA_UNIT
    particle[1] = center_x + math.cos(angle)*radius
    particle[2] = center_y + math.sin(angle)*radius + config["spawn_y"]*TRM_6SP_P_ARUA_UNIT
    particle[3] = birth
    particle[4] = rng:random()*1000
    particle[5] = 1
    particle[6] = 1 - config["outer_shrink"]*rr
end
-- 粒子上限:max_particles <= 0 或没填 = 不限制
local function get_max_particles_game_scene_char_TRM_6SP_P_arua()
    local max_count = VFX_CONFIG_GAME_SCENE_CHAR_TRM_6SP_P_ARUA["max_particles"]
    if not max_count or max_count <= 0 then
        return math.huge
    end
    return max_count
end
-- 粒子数据贴图(rgba32f,宽 = 容量,高 = 2):代替 uniform 数组,没有长度上限
-- 每个 obj_VFX 自己一张,容量不够时按 2 倍扩容
local function get_particle_data_game_scene_char_TRM_6SP_P_arua(obj_VFX,count)
    local data = obj_VFX["particle_data"]
    if not data or data["capacity"] < count then
        local capacity = data and data["capacity"] or 64
        while capacity < count do
            capacity = capacity*2
        end
        local image_data = love.image.newImageData(capacity,2,"rgba32f")
        local image = love.graphics.newImage(image_data)
        image:setFilter("nearest","nearest")
        data = {["capacity"] = capacity,["image_data"] = image_data,["image"] = image}
        obj_VFX["particle_data"] = data
    end
    return data
end
-- 清空并重新开始发射;prewarm 时按稳定状态预先铺满(出生时间按发射频率往前排)
local function reset_particles_game_scene_char_TRM_6SP_P_arua(obj_VFX,center_x,center_y)
    local config = VFX_CONFIG_GAME_SCENE_CHAR_TRM_6SP_P_ARUA
    local life = config["shader"]["life"]
    local rate = config["emit_rate"]
    local rng = get_rng_game_scene_char_TRM_6SP_P_arua()
    obj_VFX["particles"] = {}
    obj_VFX["emit_accumulator"] = 0
    if config["prewarm"] and rate > 0 then
        local count = math.min(math.floor(rate*life),get_max_particles_game_scene_char_TRM_6SP_P_arua())
        for i = 1,count do
            local particle = {}
            spawn_particle_game_scene_char_TRM_6SP_P_arua(
                particle,obj_VFX["shader_time"] - (i - rng:random())/rate,center_x,center_y
            )
            obj_VFX["particles"][i] = particle
        end
    end
end
-- 每 tick:移除寿命到了的粒子,再按发射频率在受击方当前位置发射新粒子
-- dt = 这一 tick 前进了多少序列帧
local function update_particles_game_scene_char_TRM_6SP_P_arua(obj_VFX,center_x,center_y,dt)
    local config = VFX_CONFIG_GAME_SCENE_CHAR_TRM_6SP_P_ARUA
    local life = config["shader"]["life"]
    local rate = config["emit_rate"]
    local time = obj_VFX["shader_time"]
    local particles = obj_VFX["particles"]
    for i = #particles,1,-1 do
        if time - particles[i][3] >= life then
            table.remove(particles,i)
        end
    end
    -- 结束阶段停止发射,已有粒子照常走完寿命
    if rate <= 0 or obj_VFX["emitting"] == false then
        return
    end
    local max_count = get_max_particles_game_scene_char_TRM_6SP_P_arua()
    local accumulator = obj_VFX["emit_accumulator"] + rate*dt
    while accumulator >= 1 do
        accumulator = accumulator - 1
        if #particles < max_count then
            local particle = {}
            -- 出生时间精确到 tick 内部,发射频率高时也不会扎堆
            spawn_particle_game_scene_char_TRM_6SP_P_arua(
                particle,time - accumulator/rate,center_x,center_y
            )
            particles[#particles + 1] = particle
        end
    end
    obj_VFX["emit_accumulator"] = accumulator
end
-- 6SP_P 诅咒光环用的 1x1 白图:shader 画在它上面,拉伸成所有粒子的包围盒
local function get_image_game_scene_char_TRM_6SP_P_arua_quad()
    if not image_game_scene_char_TRM_6SP_P_arua_quad then
        local image_data = love.image.newImageData(1,1)
        image_data:setPixel(0,0,1,1,1,1)
        image_game_scene_char_TRM_6SP_P_arua_quad = love.graphics.newImage(image_data)
    end
    return image_game_scene_char_TRM_6SP_P_arua_quad
end
local function draw_VFX_game_scene_char_TRM_6SP_P_arua(obj_camera,obj_VFX,shader)
    local shader_config = VFX_CONFIG_GAME_SCENE_CHAR_TRM_6SP_P_ARUA["shader"]
    local time = obj_VFX["shader_time"]
    local life = shader_config["life"]
    local unit = TRM_6SP_P_ARUA_UNIT
    local active = {}
    local min_x,min_y,max_x,max_y = math.huge,math.huge,-math.huge,-math.huge
    for _,particle in ipairs(obj_VFX["particles"]) do
        local age = (time - particle[3])/life
        if age >= 0 and age < 1 then
            local spread = 1 - (1 - age)*(1 - age)
            local size = (shader_config["size_start"]
                + (shader_config["size_end"] - shader_config["size_start"])*spread)*particle[6]*unit
            local x = particle[1]
            local y = particle[2] - shader_config["rise"]*unit*age
            min_x = math.min(min_x,x - size)
            min_y = math.min(min_y,y - size)
            max_x = math.max(max_x,x + size)
            max_y = math.max(max_y,y + size)
            active[#active + 1] = particle
        end
    end
    local count = #active
    if count == 0 then
        return
    end
    -- 写进数据贴图:第 0 行 x,y,birth,seed;第 1 行 size_mul
    local data = get_particle_data_game_scene_char_TRM_6SP_P_arua(obj_VFX,count)
    local image_data = data["image_data"]
    for i = 1,count do
        local particle = active[i]
        image_data:setPixel(i - 1,0,particle[1],particle[2],particle[3],particle[4])
        image_data:setPixel(i - 1,1,particle[6],0,0,0)
    end
    data["image"]:replacePixels(image_data)
    -- 包围盒投影到屏幕(和 draw_3d_image_sprite_batch 同一套透视)
    local scale = draw_resolution_correction(800)/(obj_VFX[3] - obj_camera[3])
    local corner = draw_3d_point_to_2D(obj_camera,{min_x,min_y,obj_VFX[3]})
    for name,value in pairs(shader_config) do
        if shader:hasUniform(name) then
            shader:send(name,value)
        end
    end
    shader:send("time",time)
    shader:send("particle_count",count)
    shader:send("particle_data",data["image"])
    shader:send("particle_data_width",data["capacity"])
    shader:send("area_origin",{min_x,min_y})
    shader:send("area_size",{max_x - min_x,max_y - min_y})
    shader:send("noise_offset",obj_VFX["noise_offset"])
    local previous_shader = love.graphics.getShader()
    love.graphics.setShader(shader)
    -- 不做整体透明度:透明度全部来自每个粒子自己(particle_fade_in / out、particle_opacity)
    local config = VFX_CONFIG_GAME_SCENE_CHAR_TRM_6SP_P_ARUA
    love.graphics.setColor(1,1,1,0.75)
    -- shader 输出 (tint*亮度噪波, alpha),默认 alpha 混合
    love.graphics.setBlendMode(config["blend_mode"])
    love.graphics.draw(
        get_image_game_scene_char_TRM_6SP_P_arua_quad(),
        corner[1],corner[2],0,
        (max_x - min_x)*scale,(max_y - min_y)*scale
    )
    love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1,1,1,1)
    love.graphics.setShader(previous_shader)
end
function insert_VFX_game_scene_char_TRM_6SP_P_arua(hit_side_obj_char,hurt_side_obj_char)
    local obj_VFX = {0,0,0,0.75,0,0,0,0}
    local obj_camera = obj_stage_game_scene_camera
    local hit_side = hit_side_obj_char["player_side"]
    local hit_side_shot_sys_curse_ban_state = hit_side_obj_char["shot_sys_curse_ban_state"]
    -- 画面由 shaders/characters/TRM/6SP_P_arua.glsl 程序化生成,不再用 6SP_P_arua_move_VFX 序列帧
    local hit_side_shader_table = {["L"] = shader_game_scene_LP,["R"] = shader_game_scene_RP}
    local hit_side_shader = hit_side_shader_table[hit_side] and hit_side_shader_table[hit_side]["6SP_P_arua"]
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
    obj_VFX[4] = 0.75
    obj_VFX[5] = 1
    obj_VFX[6] = 1
    obj_VFX[7] = 0
    obj_VFX[8] = 0
    obj_VFX["state"] = "loop"
    obj_VFX["status_name"] = "TRM_6SP_P_arua"
    -- shader 用的连续时间(单位:序列帧),只增不跳,循环 149 -> 60 时画面没有接缝
    obj_VFX["shader_time"] = 0
    obj_VFX["emitting"] = true
    -- 每次释放随机一个噪波偏移,图案不重复(噪波本身固定在世界里)
    local rng = get_rng_game_scene_char_TRM_6SP_P_arua()
    obj_VFX["noise_offset"] = {rng:random()*100,rng:random()*100}
    -- 粒子出生范围的中心 = 原来那一帧 800x800 的中心
    reset_particles_game_scene_char_TRM_6SP_P_arua(obj_VFX,obj_VFX[1] + 400,obj_VFX[2] + 400)
    -- frame_animation
    obj_VFX["frame_animation"] = {}
    for i = 0,149 do
        obj_VFX["frame_animation"][i*2] = i
    end
    obj_VFX["frame_animation"]["prop"] = 8
    obj_VFX["frame_animation"]["length"] = 300
    obj_VFX["frame_animation"]["loop"] = false
    init_frame_anim_without(
        obj_VFX,obj_VFX["frame_animation"]
    )
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
        obj_VFX["shader_time"] = obj_VFX["shader_time"] + 0.5
        obj_VFX["draw_sync"]()
        update_particles_game_scene_char_TRM_6SP_P_arua(obj_VFX,obj_VFX[1] + 400,obj_VFX[2] + 400,0.5)
        frame_animator(
            obj_VFX,obj_VFX["frame_animation"]
        )
        if get_frame_anim_end_state(
            obj_VFX,obj_VFX["frame_animation"]
        ) then
            obj_VFX["FCT"][8] = 120
            frame_animator(
                obj_VFX,obj_VFX["frame_animation"]
            )
        end
    end
    obj_VFX["update"] = function()
        local switch = {
            ["loop"] = function()
                update_frame_animation()
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
                update_frame_animation()
                -- 粒子全部死亡后关掉
                if #obj_VFX["particles"] == 0
                or hurt_side_obj_char["state"] == "wallbreak_hurt" then
                    obj_VFX["life"] = 0
                end
            end,
            ["wallbreak"] = function()
                if hurt_side_obj_char["state"] ~= "wallbreak_hit"
                and hurt_side_obj_char["state"] ~= "wallbreak_hurt" then
                    -- 破墙结束:重新显示,粒子从 0 开始自然发射出来(不做整体淡入)
                    obj_VFX[4] = 0.75
                    obj_VFX["state"] = "ease_in_after_wallbreak"
                    init_frame_anim_with(
                        obj_VFX,obj_VFX["frame_animation"]
                    )
                    obj_VFX["FCT"][8] = 60
                    obj_VFX[8] = 30
                    -- 破墙后换了场地,旧粒子留在原来的世界坐标没有意义,全部在新位置重新出生
                    obj_VFX["draw_sync"]()
                    reset_particles_game_scene_char_TRM_6SP_P_arua(obj_VFX,obj_VFX[1] + 400,obj_VFX[2] + 400)
                end
            end,
            ["ease_in_after_wallbreak"] = function()
                update_frame_animation()
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
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        obj_VFX["draw_sync"]()
        -- obj_VFX[4] 只当显示开关用(破墙期间 = 0 隐藏),不参与透明度
        if obj_VFX[4] == 0 or not hit_side_shader then
            return
        end
        draw_VFX_game_scene_char_TRM_6SP_P_arua(obj_camera,obj_VFX,hit_side_shader)
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
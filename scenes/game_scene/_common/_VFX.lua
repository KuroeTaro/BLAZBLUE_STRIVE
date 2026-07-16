function insert_VFX_game_scene_char_overdrive_badge(active_op_side_obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = common_game_scene_get_overdrive_badge_image_sprite_sheet_table(active_op_side_obj_char["player_side"])
    if active_op_side_obj_char["height"] == "air" then
        obj_VFX["y_offset"] = 715
    else
        obj_VFX["y_offset"] = 845
    end
    obj_VFX["life"] = 70
    obj_VFX[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(500)
    obj_VFX[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*(obj_VFX["y_offset"])
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = active_op_side_obj_char[5]
    obj_VFX[6] = active_op_side_obj_char[6]
    obj_VFX[7] = active_op_side_obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["f"] = -1
    obj_VFX["update"] = function()
        obj_VFX["f"] = obj_VFX["f"] + 1
        if obj_VFX["f"] >= 1 then
            obj_VFX["f"] = 0
            obj_VFX[8] = obj_VFX[8] + 1
        end
        obj_VFX["life"] = obj_VFX["life"] - 1
        if active_op_side_obj_char["state"] ~= "burst_overdrive" then
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(500)
        obj_VFX[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*(obj_VFX["y_offset"])
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]
        obj_VFX[6] = active_op_side_obj_char[6]
        obj_VFX[7] = active_op_side_obj_char[7]
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],obj_VFX)
end
function insert_VFX_game_scene_char_overdrive_airflow(active_op_side_obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    obj_VFX["y_offset"] = 0

    if active_op_side_obj_char["height"] == "air" then
        obj_VFX["y_offset"] = 745
    else
        obj_VFX["y_offset"] = 875
    end
    obj_VFX["life"] = 35
    obj_VFX[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(860)
    obj_VFX[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*obj_VFX["y_offset"]
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = active_op_side_obj_char[5]*2
    obj_VFX[6] = active_op_side_obj_char[6]*2
    obj_VFX[7] = active_op_side_obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["f"] = -1
    obj_VFX["update"] = function()
        obj_VFX["f"] = obj_VFX["f"] + 1
        if obj_VFX["f"] >= 1 then
            obj_VFX["f"] = 0
            obj_VFX[8] = obj_VFX[8] + 1
        end
        obj_VFX["life"] = obj_VFX["life"] - 1
        if active_op_side_obj_char["state"] ~= "burst_overdrive" then
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        if active_op_side_obj_char["height"] == "air" then
            obj_VFX["y_offset"] = 745
        else
            obj_VFX["y_offset"] = 875
        end
        obj_VFX[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(860)
        obj_VFX[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*obj_VFX["y_offset"]
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*2
        obj_VFX[6] = active_op_side_obj_char[6]*2
        obj_VFX[7] = active_op_side_obj_char[7]
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_overdrive_airflow
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],obj_VFX)
end
function insert_VFX_game_scene_char_overdrive_partical(active_op_side_obj_char,passive_op_side_obj_char)
    local side_table = {
        ["L"] = {0,0,1,1,1,1,0,0},
        ["R"] = {1600,0,1,1,1,1,0,0}
    }
    local obj_VFX = side_table[active_op_side_obj_char["player_side"]]
    local obj_camera = obj_stage_game_scene_camera

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}
    
    obj_VFX["life"] = 70
    obj_VFX["f"] = -1

    obj_VFX["update"] = function()
        obj_VFX["f"] = obj_VFX["f"] + 1
        if obj_VFX["f"] >= 1 then
            obj_VFX[8] = obj_VFX[8] + 1
            obj_VFX["f"] = 0
        end
        obj_VFX["life"] = obj_VFX["life"] - 1
        if active_op_side_obj_char["state"] ~= "burst_overdrive" then
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_overdrive_partical
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_2d_image_sprite_batch(obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],obj_VFX)
end
function insert_VFX_game_scene_char_overdrive_black_overlay(active_op_side_obj_char)
    local obj_VFX = {0,0,0,1,0,0,0,0}
    local obj_camera = obj_stage_game_scene_camera
    obj_VFX["y_offset"] = 0
    if active_op_side_obj_char["height"] == "air" then
        obj_VFX["y_offset"] = 245
    else
        obj_VFX["y_offset"] = 345
    end

    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["life"] = 42
    obj_VFX[1] = active_op_side_obj_char["x"]
    obj_VFX[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*obj_VFX["y_offset"]
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = 0
    obj_VFX[6] = 0
    obj_VFX[7] = 0
    obj_VFX[8] = 0
    obj_VFX["cood_res"] = draw_3d_point_to_2D(obj_camera,obj_VFX)
    obj_VFX["state"] = "ease_in"
    obj_VFX["blur_shader"] = shader_game_scene_gaussian_blur
    obj_VFX["blur_shader"]:send("Directions",16)
    obj_VFX["blur_shader"]:send("Quality",5)
    obj_VFX["blur_shader"]:send("Size",8)
    obj_VFX["blur_shader"]:send("resolution",{love.graphics.getWidth(),love.graphics.getHeight()})

    obj_VFX["opacity_ease_in_anim"] = {}
    obj_VFX["opacity_ease_in_anim"][0] = {0.00,1}
    obj_VFX["opacity_ease_in_anim"][1] = {0.04,3}
    obj_VFX["opacity_ease_in_anim"][3] = {0.08,7}
    obj_VFX["opacity_ease_in_anim"][7] = {0.14,14}
    obj_VFX["opacity_ease_in_anim"][14] = {0.18,18}
    obj_VFX["opacity_ease_in_anim"][18] = {0.20,28}
    obj_VFX["opacity_ease_in_anim"][28] = {0.22,29}
    obj_VFX["opacity_ease_in_anim"][29] = {0.36,30}
    obj_VFX["opacity_ease_in_anim"][30] = {0.44,31}
    obj_VFX["opacity_ease_in_anim"][31] = {0.48,33}
    obj_VFX["opacity_ease_in_anim"][33] = {0.50,33}
    obj_VFX["opacity_ease_in_anim"]["prop"] = 4
    obj_VFX["opacity_ease_in_anim"]["length"] = 33
    obj_VFX["opacity_ease_in_anim"]["loop"] = false
    obj_VFX["opacity_ease_in_anim"]["fix_type"] = true

    obj_VFX["opacity_ease_out_anim"] = {}
    obj_VFX["opacity_ease_out_anim"][0] = {0.50,10}
    obj_VFX["opacity_ease_out_anim"][10] = {0.00,10}
    obj_VFX["opacity_ease_out_anim"]["prop"] = 4
    obj_VFX["opacity_ease_out_anim"]["length"] = 10
    obj_VFX["opacity_ease_out_anim"]["loop"] = false
    obj_VFX["opacity_ease_out_anim"]["fix_type"] = true

    obj_VFX["size_anim"] = {}
    obj_VFX["size_anim"][0] = {200,28}
    obj_VFX["size_anim"][28] = {800,33}
    obj_VFX["size_anim"][33] = {2600,33} 
    obj_VFX["size_anim"]["prop"] = 5
    obj_VFX["size_anim"]["length"] = 33
    obj_VFX["size_anim"]["loop"] = false
    obj_VFX["size_anim"]["fix_type"] = true

    obj_VFX["draw_canvas"] = love.graphics.newCanvas(love.graphics.getWidth(),love.graphics.getHeight())

    init_point_linear_anim_without(obj_VFX,obj_VFX["size_anim"])
    init_point_linear_anim_without(obj_VFX,obj_VFX["opacity_ease_in_anim"])

    obj_VFX["update"] = function()
        local switch = {
            -- ease_in 之前的状�?如果达到�?0帧则为下一个动画的�?�?
            ["ease_in"] = function()
                point_linear_animator(obj_VFX,obj_VFX["size_anim"])
                point_linear_animator(obj_VFX,obj_VFX["opacity_ease_in_anim"])
                obj_VFX["life"] = 42
                if active_op_side_obj_char["overdrive_gauge"][3] == "off" then
                    obj_VFX["state"] = "ease_out"
                    obj_VFX["life"] = 10
                    obj_VFX[4] = 0.50
                    init_point_linear_anim_with(obj_VFX,obj_VFX["opacity_ease_out_anim"])
                end
            end,
            ["ease_out"] = function()
                point_linear_animator(obj_VFX,obj_VFX["opacity_ease_out_anim"])
                if get_point_linear_anim_end_state(obj_VFX,obj_VFX["opacity_ease_out_anim"]) then
                    obj_VFX["life"] = 0
                end
            end,
        }
        local this_function = switch[obj_VFX["state"]]
        if this_function then this_function() end

        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        if active_op_side_obj_char["height"] == "air" then
            obj_VFX["y_offset"] = 245
        else
            obj_VFX["y_offset"] = 345
        end
        obj_VFX[1] = active_op_side_obj_char["x"]
        obj_VFX[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*obj_VFX["y_offset"]
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        obj_VFX["draw_sync"]()
        love.graphics.setCanvas(obj_VFX["draw_canvas"])
        love.graphics.clear(0,0,0,0)
        love.graphics.setColor(0,0,0,obj_VFX[4])
        love.graphics.circle( "fill",obj_VFX["cood_res"][1],obj_VFX["cood_res"][2],draw_resolution_correction(obj_VFX[5]) )
        love.graphics.setColor(1,1,1,1)
        love.graphics.setCanvas()
        obj_VFX["blur_shader"]:send("Directions",16)
        obj_VFX["blur_shader"]:send("Quality",5)
        obj_VFX["blur_shader"]:send("Size",8)
        obj_VFX["blur_shader"]:send("resolution",{love.graphics.getWidth(),love.graphics.getHeight()})
        love.graphics.setShader(obj_VFX["blur_shader"])
        love.graphics.draw(obj_VFX["draw_canvas"]) -- 画到屏幕�?
        love.graphics.setShader()
    end
    table.insert(active_op_side_obj_char["VFX_black_overlay_table"],obj_VFX)
end

function insert_VFX_game_scene_char_RC_badge(active_op_side_obj_char,image_sprite_sheet)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    obj_VFX["y_offset"] = 0
    if active_op_side_obj_char["height"] == "air" then
        obj_VFX["y_offset"] = 750
    else
        obj_VFX["y_offset"] = 880
    end

    obj_VFX["life"] = 15
    obj_VFX[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(600)
    obj_VFX[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*(obj_VFX["y_offset"])
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = active_op_side_obj_char[5]
    obj_VFX[6] = active_op_side_obj_char[6]
    obj_VFX[7] = active_op_side_obj_char[7]
    obj_VFX[8] = -1
    obj_VFX["update"] = function()
        if active_op_side_obj_char["height"] == "air" then
            obj_VFX["y_offset"] = 750
        else
            obj_VFX["y_offset"] = 880
        end
        obj_VFX[8] = obj_VFX[8] + 1
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        if active_op_side_obj_char["height"] == "air" then
            obj_VFX["y_offset"] = 750
        else
            obj_VFX["y_offset"] = 880
        end
        obj_VFX[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(600)
        obj_VFX[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*(obj_VFX["y_offset"])
        obj_VFX["draw_sync"]  = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],obj_VFX)
end
function insert_VFX_game_scene_char_RC_partical(active_op_side_obj_char,color)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RC_partical
    obj_VFX["y_offset"] = 0
    if active_op_side_obj_char["height"] == "air" then
        obj_VFX["y_offset"] = 750
    else
        obj_VFX["y_offset"] = 850
    end
    
    obj_VFX["life"] = 40
    obj_VFX[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(600)
    obj_VFX[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*(obj_VFX["y_offset"])
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = 1
    obj_VFX[5] = active_op_side_obj_char[5]
    obj_VFX[6] = active_op_side_obj_char[6]
    obj_VFX[7] = active_op_side_obj_char[7]
    obj_VFX[8] = 0
    obj_VFX["f"] = -1
    obj_VFX["update"] = function()
        obj_VFX["f"] = obj_VFX["f"] + 1
        if obj_VFX["f"] >= 1 then
            obj_VFX[8] = obj_VFX[8] + 1
            obj_VFX["f"] = 0
        end
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        if active_op_side_obj_char["height"] == "air" then
            obj_VFX["y_offset"] = 750
        else
            obj_VFX["y_offset"] = 850
        end
        obj_VFX[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(600)
        obj_VFX[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*(obj_VFX["y_offset"])
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]
        obj_VFX[6] = active_op_side_obj_char[6]
        obj_VFX[7] = active_op_side_obj_char[7]
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],obj_VFX)
end
function insert_VFX_game_scene_char_RC_black_overlay(active_op_side_obj_char)
    local obj_VFX = {0,0,0,0,0,0,0,0}

    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["life"] = 95
    
    obj_VFX["opacity_anim"] = {}
    obj_VFX["opacity_anim"][0] = {0.00,20}
    obj_VFX["opacity_anim"][20] = {0.50,85}
    obj_VFX["opacity_anim"][85] = {0.50,95}
    obj_VFX["opacity_anim"][95] = {0,95}
    obj_VFX["opacity_anim"]["prop"] = 4
    obj_VFX["opacity_anim"]["length"] = 95
    obj_VFX["opacity_anim"]["loop"] = false
    obj_VFX["opacity_anim"]["fix_type"] = true
    init_point_linear_anim_without(obj_VFX,obj_VFX["opacity_anim"])
    obj_VFX["update"] = function()
        point_linear_animator(obj_VFX,obj_VFX["opacity_anim"])
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        -- obj_VFX["draw_sync"]()
        love.graphics.setColor(0,0,0,obj_VFX[4])
        love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(active_op_side_obj_char["VFX_black_overlay_table"],obj_VFX)
end

-- blast slash directional ray_impact
function insert_VFX_game_scene_char_blast_attack_socket_ver0(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    local hit_VFX_insert_function_argument = active_op_side_obj_char["hit_VFX_insert_function_argument"]
    local x = hit_VFX_insert_function_argument[1]
    local y = hit_VFX_insert_function_argument[2]
    local opacity = hit_VFX_insert_function_argument[3]
    local sx = hit_VFX_insert_function_argument[4]
    local sy = hit_VFX_insert_function_argument[5]
    local r = hit_VFX_insert_function_argument[6]
    local fix_pos = hit_VFX_insert_function_argument[7]
    local negative_side = hit_VFX_insert_function_argument[8]

    local center_x = x
    local center_y = y
    local center_r = active_op_side_obj_char[5]*r
    local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-220*sx
    local center_dy = 0
    if not fix_pos then
        if negative_side then
            center_x = math.max(-center_dx,x)
        else
            center_x = math.min(center_dx,x)
        end
    end
    center_y = center_y + center_dy
    
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 11
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
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
    obj_VFX["animation"][8] = 4
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 11
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        local center_x = x
        local center_y = y
        local center_r = active_op_side_obj_char[5]*r
        local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-220*sx
        local center_dy = 0
        if not fix_pos then
            if negative_side then
                center_x = math.max(-center_dx,x)
            else
                center_x = math.min(center_dx,x)
            end
        end
        center_y = center_y + center_dy

        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*sx
        obj_VFX[6] = active_op_side_obj_char[6]*sy
        obj_VFX[7] = center_r
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_blast_attack_socket_ver1(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    local hit_VFX_insert_function_argument = active_op_side_obj_char["hit_VFX_insert_function_argument"]
    local x = hit_VFX_insert_function_argument[1]
    local y = hit_VFX_insert_function_argument[2]
    local opacity = hit_VFX_insert_function_argument[3]
    local sx = hit_VFX_insert_function_argument[4]
    local sy = hit_VFX_insert_function_argument[5]
    local r = hit_VFX_insert_function_argument[6]
    local fix_pos = hit_VFX_insert_function_argument[7]
    local negative_side = hit_VFX_insert_function_argument[8]

    local center_x = x
    local center_y = y
    local center_r = active_op_side_obj_char[5]*r
    local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
    local center_dy = 0
    if not fix_pos then
        if negative_side then
            center_x = math.max(-center_dx,x)
        else
            center_x = math.min(center_dx,x)
        end
    end
    center_y = center_y + center_dy

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 21
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity*0.75
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
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
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        local center_x = x
        local center_y = y
        local center_r = active_op_side_obj_char[5]*r
        local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
        local center_dy = 0
        if not fix_pos then
            if negative_side then
                center_x = math.max(-center_dx,x)
            else
                center_x = math.min(center_dx,x)
            end
        end
        center_y = center_y + center_dy

        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*sx
        obj_VFX[6] = active_op_side_obj_char[6]*sy
        obj_VFX[7] = center_r
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)

    -- air_blow
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local center_x = x
    local center_y = y
    local center_r = active_op_side_obj_char[5]*r
    local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
    local center_dy = 0
    local sub_dx = -50*sx
    local sub_dy = -200*sy
    local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
    local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)
    if not fix_pos then
        if negative_side then
            center_x = math.max(-center_dx,x)
        else
            center_x = math.min(center_dx,x)
        end
    end
    center_y = center_y + center_dy

    obj_VFX["life"] = 16
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][1] = 1
    obj_VFX["animation"][2] = 2
    obj_VFX["animation"][3] = 3
    obj_VFX["animation"][4] = 4
    obj_VFX["animation"][6] = 5
    obj_VFX["animation"][8] = 6
    obj_VFX["animation"][10] = 7
    obj_VFX["animation"][11] = 8
    obj_VFX["animation"][12] = 9
    obj_VFX["animation"][15] = 10
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 16
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        local center_x = x
        local center_y = y
        local center_r = active_op_side_obj_char[5]*r
        local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
        local center_dy = 0
        local sub_dx = -50*sx
        local sub_dy = -200*sy
        local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
        local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)
        if not fix_pos then
            if negative_side then
                center_x = math.max(-center_dx,x)
            else
                center_x = math.min(center_dx,x)
            end
        end
        center_y = center_y + center_dy
        
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*sx
        obj_VFX[6] = active_op_side_obj_char[6]*sy
        obj_VFX[7] = center_r
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_counter_blast_attack_socket_ver0(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    local hit_counter_VFX_insert_function_argument = active_op_side_obj_char["hit_counter_VFX_insert_function_argument"]
    local x = hit_counter_VFX_insert_function_argument[1]
    local y = hit_counter_VFX_insert_function_argument[2]
    local opacity = hit_counter_VFX_insert_function_argument[3]
    local sx = hit_counter_VFX_insert_function_argument[4]
    local sy = hit_counter_VFX_insert_function_argument[5]
    local r = hit_counter_VFX_insert_function_argument[6]
    local fix_pos = hit_counter_VFX_insert_function_argument[7]
    local negative_side = hit_counter_VFX_insert_function_argument[8]

    local center_x = x
    local center_y = y
    local center_r = active_op_side_obj_char[5]*r
    local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-185*sx
    local center_dy = 0
    if not fix_pos then
        if negative_side then
            center_x = math.max(-center_dx,x)
        else
            center_x = math.min(center_dx,x)
        end
    end
    center_y = center_y + center_dy

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 27
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][2] = 1
    obj_VFX["animation"][4] = 2
    obj_VFX["animation"][6] = 3
    obj_VFX["animation"][8] = 4
    obj_VFX["animation"][10] = 5
    obj_VFX["animation"][11] = 6
    obj_VFX["animation"][12] = 7
    obj_VFX["animation"][13] = 8
    obj_VFX["animation"][14] = 9
    obj_VFX["animation"][16] = 10
    obj_VFX["animation"][18] = 11
    obj_VFX["animation"][21] = 12
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 27
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        local center_x = x
        local center_y = y
        local center_r = active_op_side_obj_char[5]*r
        local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-185*sx
        local center_dy = 0
        if not fix_pos then
            if negative_side then
                center_x = math.max(-center_dx,x)
            else
                center_x = math.min(center_dx,x)
            end
        end
        center_y = center_y + center_dy

        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*sx
        obj_VFX[6] = active_op_side_obj_char[6]*sy
        obj_VFX[7] = center_r
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0_counter
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_counter_blast_attack_socket_ver1(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    local hit_counter_VFX_insert_function_argument = active_op_side_obj_char["hit_counter_VFX_insert_function_argument"]
    local x = hit_counter_VFX_insert_function_argument[1]
    local y = hit_counter_VFX_insert_function_argument[2]
    local opacity = hit_counter_VFX_insert_function_argument[3]
    local sx = hit_counter_VFX_insert_function_argument[4]
    local sy = hit_counter_VFX_insert_function_argument[5]
    local r = hit_counter_VFX_insert_function_argument[6]
    local fix_pos = hit_counter_VFX_insert_function_argument[7]
    local negative_side = hit_counter_VFX_insert_function_argument[8]

    local center_x = x
    local center_y = y
    local center_r = active_op_side_obj_char[5]*r
    local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
    local center_dy = 0
    if not fix_pos then
        if negative_side then
            center_x = math.max(-center_dx,x)
        else
            center_x = math.min(center_dx,x)
        end
    end
    center_y = center_y + center_dy

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 21
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity*0.85
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
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
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        local center_x = x
        local center_y = y
        local center_r = active_op_side_obj_char[5]*r
        local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-220*sx
        local center_dy = 0
        if not fix_pos then
            if negative_side then
                center_x = math.max(-center_dx,x)
            else
                center_x = math.min(center_dx,x)
            end
        end
        center_y = center_y + center_dy

        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*sx
        obj_VFX[6] = active_op_side_obj_char[6]*sy
        obj_VFX[7] = center_r
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)

    -- air_blow
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local center_x = x
    local center_y = y
    local center_r = active_op_side_obj_char[5]*r
    local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
    local center_dy = 0
    local sub_dx = -50*sx
    local sub_dy = -200*sy
    local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
    local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)
    if not fix_pos then
        if negative_side then
            center_x = math.max(-center_dx,x)
        else
            center_x = math.min(center_dx,x)
        end
    end
    center_y = center_y + center_dy

    obj_VFX["life"] = 16
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = r
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][1] = 1
    obj_VFX["animation"][2] = 2
    obj_VFX["animation"][3] = 3
    obj_VFX["animation"][4] = 4
    obj_VFX["animation"][6] = 5
    obj_VFX["animation"][8] = 6
    obj_VFX["animation"][10] = 7
    obj_VFX["animation"][11] = 8
    obj_VFX["animation"][12] = 9
    obj_VFX["animation"][15] = 10
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 16
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        local center_x = x
        local center_y = y
        local center_r = active_op_side_obj_char[5]*r
        local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
        local center_dy = 0
        local sub_dx = -50*sx
        local sub_dy = -200*sy
        local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
        local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)
        if not fix_pos then
            if negative_side then
                center_x = math.max(-center_dx,x)
            else
                center_x = math.min(center_dx,x)
            end
        end
        center_y = center_y + center_dy
        
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*sx
        obj_VFX[6] = active_op_side_obj_char[6]*sy
        obj_VFX[7] = center_r
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
    
    -- counter_glow
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local center_x = x
    local center_y = y
    local center_r = active_op_side_obj_char[5]*r
    local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
    local center_dy = 0
    local sub_dx = 45*sx
    local sub_dy = 30*sy
    local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
    local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)
    if not fix_pos then
        if negative_side then
            center_x = math.max(-center_dx,x)
        else
            center_x = math.min(center_dx,x)
        end
    end
    center_y = center_y + center_dy

    obj_VFX["life"] = 5
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity*0.65
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["opacity_point_linear_animation"] = {}
    obj_VFX["opacity_point_linear_animation"][0] = {0.9*opacity,5}
    obj_VFX["opacity_point_linear_animation"][5] = {0,5}
    obj_VFX["opacity_point_linear_animation"]["prop"] = 4
    obj_VFX["opacity_point_linear_animation"]["length"] = 5
    obj_VFX["opacity_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj_VFX,obj_VFX["opacity_point_linear_animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            point_linear_animator(obj_VFX,obj_VFX["opacity_point_linear_animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        local center_x = x
        local center_y = y
        local center_r = active_op_side_obj_char[5]*r
        local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
        local center_dy = 0
        local sub_dx = 45*sx
        local sub_dy = 30*sy
        local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
        local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)
        if not fix_pos then
            if negative_side then
                center_x = math.max(-center_dx,x)
            else
                center_x = math.min(center_dx,x)
            end
        end
        center_y = center_y + center_dy
        
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*sx
        obj_VFX[6] = active_op_side_obj_char[6]*sy
        obj_VFX[7] = center_r
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image = image_VFX_game_scene_counter_glow
        obj_VFX["draw_sync"]()
        love.graphics.setBlendMode("add")
        love.graphics.setColor(1,1,1,obj_VFX[4])
        draw_3d_image(obj_camera,obj_VFX,image)
        love.graphics.setColor(1,1,1,1)
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_back_table"],obj_VFX)

    -- partical
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    obj_VFX["life"] = 30
    obj_VFX[1] = obj_camera["3d_pos_x"] + obj_camera["enclose_position_offset"][1] - 900
    obj_VFX[2] = obj_camera["3d_pos_y"] + obj_camera["enclose_position_offset"][2] - 550
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
    for i=0,29 do
        obj_VFX["animation"][i] = i
    end
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 30
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_camera["3d_pos_x"] + obj_camera["enclose_position_offset"][1] - 900
        obj_VFX[2] = obj_camera["3d_pos_y"] + obj_camera["enclose_position_offset"][2] - 550
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_partical_ver1_counter
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_block_blast_attack_socket_ver0(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    local hit_block_VFX_insert_function_argument = active_op_side_obj_char["hit_block_VFX_insert_function_argument"]
    local x = hit_block_VFX_insert_function_argument[1]
    local y = hit_block_VFX_insert_function_argument[2]
    local opacity = hit_block_VFX_insert_function_argument[3]
    local sx = hit_block_VFX_insert_function_argument[4]
    local sy = hit_block_VFX_insert_function_argument[5]
    local r = hit_block_VFX_insert_function_argument[6]
    local fix_pos = hit_block_VFX_insert_function_argument[7]
    local negative_side = hit_block_VFX_insert_function_argument[8]

    local center_x = x
    local center_y = y
    local center_r = active_op_side_obj_char[5]*r
    local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-220*sx
    local center_dy = 0
    if not fix_pos then
        if negative_side then
            center_x = math.max(-center_dx,x)
        else
            center_x = math.min(center_dx,x)
        end
    end
    center_y = center_y + center_dy
    
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 11
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
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
    obj_VFX["animation"][8] = 4
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 11
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        local center_x = x
        local center_y = y
        local center_r = active_op_side_obj_char[5]*r
        local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-220*sx
        local center_dy = 0
        if not fix_pos then
            if negative_side then
                center_x = math.max(-center_dx,x)
            else
                center_x = math.min(center_dx,x)
            end
        end
        center_y = center_y + center_dy

        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*sx
        obj_VFX[6] = active_op_side_obj_char[6]*sy
        obj_VFX[7] = center_r
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_block_blast_attack_socket_ver1(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    local hit_block_VFX_insert_function_argument = active_op_side_obj_char["hit_block_VFX_insert_function_argument"]
    local x = hit_block_VFX_insert_function_argument[1]
    local y = hit_block_VFX_insert_function_argument[2]
    local opacity = hit_block_VFX_insert_function_argument[3]
    local sx = hit_block_VFX_insert_function_argument[4]
    local sy = hit_block_VFX_insert_function_argument[5]
    local r = hit_block_VFX_insert_function_argument[6]
    local fix_pos = hit_block_VFX_insert_function_argument[7]
    local negative_side = hit_block_VFX_insert_function_argument[8]

    local center_x = x
    local center_y = y
    local center_r = active_op_side_obj_char[5]*r
    local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
    local center_dy = 0
    if not fix_pos then
        if negative_side then
            center_x = math.max(-center_dx,x)
        else
            center_x = math.min(center_dx,x)
        end
    end
    center_y = center_y + center_dy

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 21
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity*0.75
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
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
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        local center_x = x
        local center_y = y
        local center_r = active_op_side_obj_char[5]*r
        local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
        local center_dy = 0
        if not fix_pos then
            if negative_side then
                center_x = math.max(-center_dx,x)
            else
                center_x = math.min(center_dx,x)
            end
        end
        center_y = center_y + center_dy

        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*sx
        obj_VFX[6] = active_op_side_obj_char[6]*sy
        obj_VFX[7] = center_r
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)

    -- air_blow
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local center_x = x
    local center_y = y
    local center_r = active_op_side_obj_char[5]*r
    local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
    local center_dy = 0
    local sub_dx = -50*sx
    local sub_dy = -200*sy
    local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
    local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)
    if not fix_pos then
        if negative_side then
            center_x = math.max(-center_dx,x)
        else
            center_x = math.min(center_dx,x)
        end
    end
    center_y = center_y + center_dy

    obj_VFX["life"] = 16
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][1] = 1
    obj_VFX["animation"][2] = 2
    obj_VFX["animation"][3] = 3
    obj_VFX["animation"][4] = 4
    obj_VFX["animation"][6] = 5
    obj_VFX["animation"][8] = 6
    obj_VFX["animation"][10] = 7
    obj_VFX["animation"][11] = 8
    obj_VFX["animation"][12] = 9
    obj_VFX["animation"][15] = 10
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 16
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        local center_x = x
        local center_y = y
        local center_r = active_op_side_obj_char[5]*r
        local center_dx = math.abs(passive_op_side_obj_char["x"]-active_op_side_obj_char["x"])-310*sx
        local center_dy = 0
        local sub_dx = -50*sx
        local sub_dy = -200*sy
        local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
        local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)
        if not fix_pos then
            if negative_side then
                center_x = math.max(-center_dx,x)
            else
                center_x = math.min(center_dx,x)
            end
        end
        center_y = center_y + center_dy
        
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*sx
        obj_VFX[6] = active_op_side_obj_char[6]*sy
        obj_VFX[7] = center_r
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end

function insert_VFX_game_scene_char_blast_dynamic_ver0(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    local hit_VFX_insert_function_argument = active_op_side_obj_char["hit_VFX_insert_function_argument"]
    local hit_VFX_dynamic_spawn_pos = active_op_side_obj_char["hit_VFX_dynamic_spawn_pos"] 

    local center_x = hit_VFX_dynamic_spawn_pos[1]
    local center_y = hit_VFX_dynamic_spawn_pos[2]
    local opacity = hit_VFX_insert_function_argument[3]
    local sx = hit_VFX_insert_function_argument[4]
    local sy = hit_VFX_insert_function_argument[5]
    local r = hit_VFX_insert_function_argument[6]
    local fix_pos = hit_VFX_insert_function_argument[7]
    local negative_side = hit_VFX_insert_function_argument[8]

    local center_r = active_op_side_obj_char[5]*r
    center_x = center_x - 220*sx*active_op_side_obj_char[5]
    center_y = center_y - 255*sy*active_op_side_obj_char[6]
    
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 11
    obj_VFX[1] = center_x
    obj_VFX[2] = center_y
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
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
    obj_VFX["animation"][8] = 4
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 11
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_blast_dynamic_ver1(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    local hit_VFX_insert_function_argument = active_op_side_obj_char["hit_VFX_insert_function_argument"]
    local hit_VFX_dynamic_spawn_pos = active_op_side_obj_char["hit_VFX_dynamic_spawn_pos"] 

    local center_x = hit_VFX_dynamic_spawn_pos[1]
    local center_y = hit_VFX_dynamic_spawn_pos[2]
    local opacity = hit_VFX_insert_function_argument[3]
    local sx = hit_VFX_insert_function_argument[4]
    local sy = hit_VFX_insert_function_argument[5]
    local r = hit_VFX_insert_function_argument[6]
    local fix_pos = hit_VFX_insert_function_argument[7]
    local negative_side = hit_VFX_insert_function_argument[8]

    local center_r = active_op_side_obj_char[5]*r
    center_x = center_x - 305*sx*active_op_side_obj_char[5]
    center_y = center_y - 340*sy*active_op_side_obj_char[6]

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 21
    obj_VFX[1] = center_x
    obj_VFX[2] = center_y
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity*0.75
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
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
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)

    -- air_blow
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local center_x = hit_VFX_dynamic_spawn_pos[1]
    local center_y = hit_VFX_dynamic_spawn_pos[2]
    local center_r = active_op_side_obj_char[5]*r
    local sub_dx = -50*sx
    local sub_dy = -200*sy
    local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
    local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)
    center_x = center_x - 300*sx*active_op_side_obj_char[5]
    center_y = center_y - 300*sy*active_op_side_obj_char[6]

    obj_VFX["life"] = 16
    obj_VFX[1] = center_x + rot_dx
    obj_VFX[2] = center_y + rot_dy
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][1] = 1
    obj_VFX["animation"][2] = 2
    obj_VFX["animation"][3] = 3
    obj_VFX["animation"][4] = 4
    obj_VFX["animation"][6] = 5
    obj_VFX["animation"][8] = 6
    obj_VFX["animation"][10] = 7
    obj_VFX["animation"][11] = 8
    obj_VFX["animation"][12] = 9
    obj_VFX["animation"][15] = 10
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 16
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()        
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_counter_blast_dynamic_ver0(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    local hit_VFX_insert_function_argument = active_op_side_obj_char["hit_VFX_insert_function_argument"]
    local hit_VFX_dynamic_spawn_pos = active_op_side_obj_char["hit_VFX_dynamic_spawn_pos"] 

    local center_x = hit_VFX_dynamic_spawn_pos[1]
    local center_y = hit_VFX_dynamic_spawn_pos[2]
    local opacity = hit_VFX_insert_function_argument[3]
    local sx = hit_VFX_insert_function_argument[4]
    local sy = hit_VFX_insert_function_argument[5]
    local r = hit_VFX_insert_function_argument[6]
    local fix_pos = hit_VFX_insert_function_argument[7]
    local negative_side = hit_VFX_insert_function_argument[8]

    local center_r = active_op_side_obj_char[5]*r
    center_x = center_x - 180*sx*active_op_side_obj_char[5]
    center_y = center_y - 470*sy*active_op_side_obj_char[6]

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 27
    obj_VFX[1] = center_x
    obj_VFX[2] = center_y
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][2] = 1
    obj_VFX["animation"][4] = 2
    obj_VFX["animation"][6] = 3
    obj_VFX["animation"][8] = 4
    obj_VFX["animation"][10] = 5
    obj_VFX["animation"][11] = 6
    obj_VFX["animation"][12] = 7
    obj_VFX["animation"][13] = 8
    obj_VFX["animation"][14] = 9
    obj_VFX["animation"][16] = 10
    obj_VFX["animation"][18] = 11
    obj_VFX["animation"][21] = 12
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 27
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0_counter
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_counter_blast_dynamic_ver1(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    local hit_VFX_insert_function_argument = active_op_side_obj_char["hit_VFX_insert_function_argument"]
    local hit_VFX_dynamic_spawn_pos = active_op_side_obj_char["hit_VFX_dynamic_spawn_pos"] 

    local center_x = hit_VFX_dynamic_spawn_pos[1]
    local center_y = hit_VFX_dynamic_spawn_pos[2]
    local opacity = hit_VFX_insert_function_argument[3]
    local sx = hit_VFX_insert_function_argument[4]
    local sy = hit_VFX_insert_function_argument[5]
    local r = hit_VFX_insert_function_argument[6]
    local fix_pos = hit_VFX_insert_function_argument[7]
    local negative_side = hit_VFX_insert_function_argument[8]

    local center_r = active_op_side_obj_char[5]*r
    center_x = center_x - 180*sx*active_op_side_obj_char[5]
    center_y = center_y - 470*sy*active_op_side_obj_char[6]

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 21
    obj_VFX[1] = center_x
    obj_VFX[2] = center_y
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity*0.85
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
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
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)

    -- air_blow
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local sub_dx = -50*sx
    local sub_dy = -200*sy
    local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
    local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)

    obj_VFX["life"] = 16
    obj_VFX[1] = center_x + rot_dx
    obj_VFX[2] = center_y + rot_dy
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = r
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][1] = 1
    obj_VFX["animation"][2] = 2
    obj_VFX["animation"][3] = 3
    obj_VFX["animation"][4] = 4
    obj_VFX["animation"][6] = 5
    obj_VFX["animation"][8] = 6
    obj_VFX["animation"][10] = 7
    obj_VFX["animation"][11] = 8
    obj_VFX["animation"][12] = 9
    obj_VFX["animation"][15] = 10
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 16
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()        
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
    
    -- counter_glow
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local sub_dx = 45*sx
    local sub_dy = 30*sy
    local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
    local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)

    obj_VFX["life"] = 5
    obj_VFX[1] = center_x + rot_dx
    obj_VFX[2] = center_y + rot_dy
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity*0.65
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["opacity_point_linear_animation"] = {}
    obj_VFX["opacity_point_linear_animation"][0] = {0.9*opacity,5}
    obj_VFX["opacity_point_linear_animation"][5] = {0,5}
    obj_VFX["opacity_point_linear_animation"]["prop"] = 4
    obj_VFX["opacity_point_linear_animation"]["length"] = 5
    obj_VFX["opacity_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj_VFX,obj_VFX["opacity_point_linear_animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            point_linear_animator(obj_VFX,obj_VFX["opacity_point_linear_animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image = image_VFX_game_scene_counter_glow
        obj_VFX["draw_sync"]()
        love.graphics.setBlendMode("add")
        love.graphics.setColor(1,1,1,obj_VFX[4])
        draw_3d_image(obj_camera,obj_VFX,image)
        love.graphics.setColor(1,1,1,1)
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_back_table"],obj_VFX)

    -- partical
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    obj_VFX["life"] = 30
    obj_VFX[1] = obj_camera["3d_pos_x"] + obj_camera["enclose_position_offset"][1] - 900
    obj_VFX[2] = obj_camera["3d_pos_y"] + obj_camera["enclose_position_offset"][2] - 550
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
    for i=0,29 do
        obj_VFX["animation"][i] = i
    end
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 30
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_camera["3d_pos_x"] + obj_camera["enclose_position_offset"][1] - 900
        obj_VFX[2] = obj_camera["3d_pos_y"] + obj_camera["enclose_position_offset"][2] - 550
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_partical_ver1_counter
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_block_blast_dynamic_ver0(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    local hit_block_VFX_insert_function_argument = active_op_side_obj_char["hit_block_VFX_insert_function_argument"]
    local hit_VFX_dynamic_spawn_pos = active_op_side_obj_char["hit_VFX_dynamic_spawn_pos"] 

    local center_x = hit_VFX_dynamic_spawn_pos[1]
    local center_y = hit_VFX_dynamic_spawn_pos[2]
    local opacity = hit_block_VFX_insert_function_argument[3]
    local sx = hit_block_VFX_insert_function_argument[4]
    local sy = hit_block_VFX_insert_function_argument[5]
    local r = hit_block_VFX_insert_function_argument[6]
    local fix_pos = hit_block_VFX_insert_function_argument[7]
    local negative_side = hit_block_VFX_insert_function_argument[8]

    local center_r = active_op_side_obj_char[5]*r
    center_x = center_x - 220*sx*active_op_side_obj_char[5]
    center_y = center_y - 255*sy*active_op_side_obj_char[6]
    
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 11
    obj_VFX[1] = center_x
    obj_VFX[2] = center_y
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
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
    obj_VFX["animation"][8] = 4
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 11
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_block_blast_dynamic_ver1(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}

    local hit_block_VFX_insert_function_argument = active_op_side_obj_char["hit_block_VFX_insert_function_argument"]
    local hit_VFX_dynamic_spawn_pos = active_op_side_obj_char["hit_VFX_dynamic_spawn_pos"] 

    local center_x = hit_VFX_dynamic_spawn_pos[1]
    local center_y = hit_VFX_dynamic_spawn_pos[2]
    local opacity = hit_block_VFX_insert_function_argument[3]
    local sx = hit_block_VFX_insert_function_argument[4]
    local sy = hit_block_VFX_insert_function_argument[5]
    local r = hit_block_VFX_insert_function_argument[6]
    local fix_pos = hit_block_VFX_insert_function_argument[7]
    local negative_side = hit_block_VFX_insert_function_argument[8]

    local center_r = active_op_side_obj_char[5]*r
    center_x = center_x - 305*sx*active_op_side_obj_char[5]
    center_y = center_y - 340*sy*active_op_side_obj_char[6]

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 21
    obj_VFX[1] = center_x
    obj_VFX[2] = center_y
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity*0.75
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
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
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)

    -- air_blow
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local center_x = hit_VFX_dynamic_spawn_pos[1]
    local center_y = hit_VFX_dynamic_spawn_pos[2]
    local center_r = active_op_side_obj_char[5]*r
    local sub_dx = -50*sx
    local sub_dy = -200*sy
    local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
    local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)
    center_x = center_x - 300*sx*active_op_side_obj_char[5]
    center_y = center_y - 300*sy*active_op_side_obj_char[6]

    obj_VFX["life"] = 16
    obj_VFX[1] = center_x + rot_dx
    obj_VFX[2] = center_y + rot_dy
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = center_r
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][1] = 1
    obj_VFX["animation"][2] = 2
    obj_VFX["animation"][3] = 3
    obj_VFX["animation"][4] = 4
    obj_VFX["animation"][6] = 5
    obj_VFX["animation"][8] = 6
    obj_VFX["animation"][10] = 7
    obj_VFX["animation"][11] = 8
    obj_VFX["animation"][12] = 9
    obj_VFX["animation"][15] = 10
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 16
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()        
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end

function insert_VFX_game_scene_char_blast_special(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local x = -(active_op_side_obj_char["x"] - passive_op_side_obj_char["x"])*active_op_side_obj_char[5]
    local y = -((active_op_side_obj_char["y"] - passive_op_side_obj_char["y"])+100)*active_op_side_obj_char[6]
    local dx = -1410
    local dy = -200
    local center_black_offset = {}
    local center_white_offset = {}
    local r0 = (0.523+(math.random()*0.087))*active_op_side_obj_char[5]
    local r_table_cache = {
        r0,
        r0 + (1.570 + (math.random()-0.5)*0.174)*active_op_side_obj_char[5],
        r0 + (3.141 + (math.random()-0.5)*0.174)*active_op_side_obj_char[5],
        r0 + (4.712 + (math.random()-0.5)*0.174)*active_op_side_obj_char[5],
    }
    local rot_x_table_cache = {
        dx * active_op_side_obj_char[5] * math.cos(r_table_cache[1]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[1]),
        dx * active_op_side_obj_char[5] * math.cos(r_table_cache[2]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[2]),
        dx * active_op_side_obj_char[5] * math.cos(r_table_cache[3]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[3]),
        dx * active_op_side_obj_char[5] * math.cos(r_table_cache[4]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[4]),
    }
    local rot_y_table_cache = {
        dx * active_op_side_obj_char[5] * math.sin(r_table_cache[1]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[1]),
        dx * active_op_side_obj_char[5] * math.sin(r_table_cache[2]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[2]),
        dx * active_op_side_obj_char[5] * math.sin(r_table_cache[3]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[3]),
        dx * active_op_side_obj_char[5] * math.sin(r_table_cache[4]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[4]),
    }
    local obj_x_table = {
        active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[1],
        active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[2],
        active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[3],
        active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[4],
    }
    local obj_y_table = {
        active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[1],
        active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[2],
        active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[3],
        active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[4],
    }
    local obj_center = {
        active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x-500),
        active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y-500)
    }

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 27
    obj_VFX["r_cache"] = r_table_cache
    obj_VFX["x_table"] = obj_x_table
    obj_VFX["y_table"] = obj_y_table
    obj_VFX["center_table"] = obj_center

    -- x y z opacity sx sy r f
    obj_VFX["sub_obj"] = {
        [1] = {obj_x_table[1],obj_y_table[1],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[1],0},
        [2] = {obj_x_table[2],obj_y_table[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[2],0},
        [3] = {obj_x_table[3],obj_y_table[3],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[3],0},
        [4] = {obj_x_table[4],obj_y_table[4],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[4],0},
        [5] = {obj_center[1],obj_center[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],0,0},
    }

    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][7] = 1
    obj_VFX["animation"][10] = 2
    obj_VFX["animation"][14] = 3
    obj_VFX["animation"][17] = 4
    obj_VFX["animation"][20] = 5
    obj_VFX["animation"][23] = 6
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 27
    obj_VFX["animation"]["loop"] = false
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        local x = -(active_op_side_obj_char["x"] - passive_op_side_obj_char["x"])*active_op_side_obj_char[5]
        local y = -((active_op_side_obj_char["y"] - passive_op_side_obj_char["y"])+100)*active_op_side_obj_char[6]
        local dx = -1410
        local dy = -200
        local center_black_offset = {}
        local center_white_offset = {}
        local r0 = (0.523+(math.random()*0.087))*active_op_side_obj_char[5]
        local r_table_cache = {
            r0,
            r0 + (1.570 + (math.random()-0.5)*0.174)*active_op_side_obj_char[5],
            r0 + (3.141 + (math.random()-0.5)*0.174)*active_op_side_obj_char[5],
            r0 + (4.712 + (math.random()-0.5)*0.174)*active_op_side_obj_char[5],
        }
        local rot_x_table_cache = {
            dx * active_op_side_obj_char[5] * math.cos(r_table_cache[1]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[1]),
            dx * active_op_side_obj_char[5] * math.cos(r_table_cache[2]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[2]),
            dx * active_op_side_obj_char[5] * math.cos(r_table_cache[3]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[3]),
            dx * active_op_side_obj_char[5] * math.cos(r_table_cache[4]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[4]),
        }
        local rot_y_table_cache = {
            dx * active_op_side_obj_char[5] * math.sin(r_table_cache[1]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[1]),
            dx * active_op_side_obj_char[5] * math.sin(r_table_cache[2]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[2]),
            dx * active_op_side_obj_char[5] * math.sin(r_table_cache[3]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[3]),
            dx * active_op_side_obj_char[5] * math.sin(r_table_cache[4]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[4]),
        }
        local obj_x_table = {
            active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[1],
            active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[2],
            active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[3],
            active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[4],
        }
        local obj_y_table = {
            active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[1],
            active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[2],
            active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[3],
            active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[4],
        }
        local obj_center = {
            active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x-500),
            active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y-500),
        }

        obj_VFX["r_cache"] = r_table_cache
        obj_VFX["x_table"] = obj_x_table
        obj_VFX["y_table"] = obj_y_table
        obj_VFX["center_table"] = obj_center

        obj_VFX["sub_obj"] = {
            [1] = {obj_x_table[1],obj_y_table[1],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[1],0},
            [2] = {obj_x_table[2],obj_y_table[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[2],0},
            [3] = {obj_x_table[3],obj_y_table[3],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[3],0},
            [4] = {obj_x_table[4],obj_y_table[4],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[4],0},
            [5] = {obj_center[1],obj_center[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],0,0},
        }
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_special_lighting_0
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX["sub_obj"][1],image_sprite_sheet,""..obj_VFX[8].."")
        draw_3d_image_sprite_batch(obj_camera,obj_VFX["sub_obj"][3],image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_special_lighting_1
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX["sub_obj"][2],image_sprite_sheet,""..obj_VFX[8].."")
        draw_3d_image_sprite_batch(obj_camera,obj_VFX["sub_obj"][4],image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_special_radial
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX["sub_obj"][5],image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_hit_back_table"],obj_VFX)
end
function insert_VFX_game_scene_char_counter_blast_special(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local x = -(active_op_side_obj_char["x"] - passive_op_side_obj_char["x"])*active_op_side_obj_char[5]
    local y = -((active_op_side_obj_char["y"] - passive_op_side_obj_char["y"])+100)*active_op_side_obj_char[6]
    local dx = -1410
    local dy = -200
    local center_black_offset = {}
    local center_white_offset = {}
    local r0 = (0.523+(math.random()*0.087))*active_op_side_obj_char[5]
    local r_table_cache = {
        r0,
        r0 + (1.570 + (math.random()-0.5)*0.174)*active_op_side_obj_char[5],
        r0 + (3.141 + (math.random()-0.5)*0.174)*active_op_side_obj_char[5],
        r0 + (4.712 + (math.random()-0.5)*0.174)*active_op_side_obj_char[5],
    }
    local rot_x_table_cache = {
        dx * active_op_side_obj_char[5] * math.cos(r_table_cache[1]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[1]),
        dx * active_op_side_obj_char[5] * math.cos(r_table_cache[2]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[2]),
        dx * active_op_side_obj_char[5] * math.cos(r_table_cache[3]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[3]),
        dx * active_op_side_obj_char[5] * math.cos(r_table_cache[4]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[4]),
    }
    local rot_y_table_cache = {
        dx * active_op_side_obj_char[5] * math.sin(r_table_cache[1]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[1]),
        dx * active_op_side_obj_char[5] * math.sin(r_table_cache[2]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[2]),
        dx * active_op_side_obj_char[5] * math.sin(r_table_cache[3]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[3]),
        dx * active_op_side_obj_char[5] * math.sin(r_table_cache[4]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[4]),
    }
    local obj_x_table = {
        active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[1],
        active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[2],
        active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[3],
        active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[4],
    }
    local obj_y_table = {
        active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[1],
        active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[2],
        active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[3],
        active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[4],
    }
    local obj_center = {
        active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x-500),
        active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y-500)
    }

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 27
    obj_VFX["r_cache"] = r_table_cache
    obj_VFX["x_table"] = obj_x_table
    obj_VFX["y_table"] = obj_y_table
    obj_VFX["center_table"] = obj_center

    -- x y z opacity sx sy r f
    obj_VFX["sub_obj"] = {
        [1] = {obj_x_table[1],obj_y_table[1],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[1],0},
        [2] = {obj_x_table[2],obj_y_table[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[2],0},
        [3] = {obj_x_table[3],obj_y_table[3],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[3],0},
        [4] = {obj_x_table[4],obj_y_table[4],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[4],0},
        [5] = {obj_center[1],obj_center[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],0,0},
    }

    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][7] = 1
    obj_VFX["animation"][10] = 2
    obj_VFX["animation"][14] = 3
    obj_VFX["animation"][17] = 4
    obj_VFX["animation"][20] = 5
    obj_VFX["animation"][23] = 6
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 27
    obj_VFX["animation"]["loop"] = false
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        local x = -(active_op_side_obj_char["x"] - passive_op_side_obj_char["x"])*active_op_side_obj_char[5]
        local y = -((active_op_side_obj_char["y"] - passive_op_side_obj_char["y"])+100)*active_op_side_obj_char[6]
        local dx = -1410
        local dy = -200
        local center_black_offset = {}
        local center_white_offset = {}
        local r0 = (0.523+(math.random()*0.087))*active_op_side_obj_char[5]
        local r_table_cache = {
            r0,
            r0 + (1.570 + (math.random()-0.5)*0.174)*active_op_side_obj_char[5],
            r0 + (3.141 + (math.random()-0.5)*0.174)*active_op_side_obj_char[5],
            r0 + (4.712 + (math.random()-0.5)*0.174)*active_op_side_obj_char[5],
        }
        local rot_x_table_cache = {
            dx * active_op_side_obj_char[5] * math.cos(r_table_cache[1]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[1]),
            dx * active_op_side_obj_char[5] * math.cos(r_table_cache[2]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[2]),
            dx * active_op_side_obj_char[5] * math.cos(r_table_cache[3]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[3]),
            dx * active_op_side_obj_char[5] * math.cos(r_table_cache[4]) - dy * active_op_side_obj_char[6] * math.sin(r_table_cache[4]),
        }
        local rot_y_table_cache = {
            dx * active_op_side_obj_char[5] * math.sin(r_table_cache[1]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[1]),
            dx * active_op_side_obj_char[5] * math.sin(r_table_cache[2]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[2]),
            dx * active_op_side_obj_char[5] * math.sin(r_table_cache[3]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[3]),
            dx * active_op_side_obj_char[5] * math.sin(r_table_cache[4]) + dy * active_op_side_obj_char[6] * math.cos(r_table_cache[4]),
        }
        local obj_x_table = {
            active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[1],
            active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[2],
            active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[3],
            active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x) + rot_x_table_cache[4],
        }
        local obj_y_table = {
            active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[1],
            active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[2],
            active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[3],
            active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y) + rot_y_table_cache[4],
        }
        local obj_center = {
            active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x-500),
            active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y-500),
        }

        obj_VFX["r_cache"] = r_table_cache
        obj_VFX["x_table"] = obj_x_table
        obj_VFX["y_table"] = obj_y_table
        obj_VFX["center_table"] = obj_center

        obj_VFX["sub_obj"] = {
            [1] = {obj_x_table[1],obj_y_table[1],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[1],0},
            [2] = {obj_x_table[2],obj_y_table[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[2],0},
            [3] = {obj_x_table[3],obj_y_table[3],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[3],0},
            [4] = {obj_x_table[4],obj_y_table[4],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[4],0},
            [5] = {obj_center[1],obj_center[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],0,0},
        }
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_special_lighting_0
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX["sub_obj"][1],image_sprite_sheet,""..obj_VFX[8].."")
        draw_3d_image_sprite_batch(obj_camera,obj_VFX["sub_obj"][3],image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_special_lighting_1
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX["sub_obj"][2],image_sprite_sheet,""..obj_VFX[8].."")
        draw_3d_image_sprite_batch(obj_camera,obj_VFX["sub_obj"][4],image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_special_radial
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX["sub_obj"][5],image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_hit_back_table"],obj_VFX)

    -- partical
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    obj_VFX["life"] = 30
    obj_VFX[1] = obj_camera["3d_pos_x"] + obj_camera["enclose_position_offset"][1] - 900
    obj_VFX[2] = obj_camera["3d_pos_y"] + obj_camera["enclose_position_offset"][2] - 550
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
    for i=0,29 do
        obj_VFX["animation"][i] = i
    end
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 30
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(obj_VFX,obj_VFX["animation"])
            obj_VFX["life"] = obj_VFX["life"] - 1
        end
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = obj_camera["3d_pos_x"] + obj_camera["enclose_position_offset"][1] - 900
        obj_VFX[2] = obj_camera["3d_pos_y"] + obj_camera["enclose_position_offset"][2] - 550
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_partical_ver1_counter
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end

function insert_VFX_game_scene_char_block_ver0(active_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local VFX_spawn_anchor = common_game_scene_get_VFX_spawn_anchor(active_op_side_obj_char["player_side"])["block_ver0_spawn_anchor_pos"][active_op_side_obj_char["sprite_sheet"]]
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 21
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = 0.75
    obj_VFX[5] = active_op_side_obj_char[5]
    obj_VFX[6] = active_op_side_obj_char[6]
    obj_VFX[7] = 0
    obj_VFX[8] = 0
    obj_VFX["f"] = -1
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][10] = 1
    obj_VFX["animation"][12] = 2
    obj_VFX["animation"][16] = 3
    obj_VFX["animation"][18] = 4
    obj_VFX["animation"][21] = 4
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 21
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["update"] = function()
        frame_animator(obj_VFX,obj_VFX["animation"])
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
        obj_VFX[5] = active_op_side_obj_char[5]
        obj_VFX[6] = active_op_side_obj_char[6]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_block_ver0
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_block_ver1(active_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local VFX_spawn_anchor = common_game_scene_get_VFX_spawn_anchor(active_op_side_obj_char["player_side"])["block_ver1_spawn_anchor_pos"][active_op_side_obj_char["sprite_sheet"]]
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 31
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = 0.75
    obj_VFX[5] = active_op_side_obj_char[5]
    obj_VFX[6] = active_op_side_obj_char[6]
    obj_VFX[7] = 0
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][12] = 1
    obj_VFX["animation"][14] = 2
    obj_VFX["animation"][17] = 3
    obj_VFX["animation"][20] = 4
    obj_VFX["animation"][23] = 5
    obj_VFX["animation"][27] = 6
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 31
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
    obj_VFX["update"] = function()
        frame_animator(obj_VFX,obj_VFX["animation"])
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
        obj_VFX[5] = active_op_side_obj_char[5]
        obj_VFX[6] = active_op_side_obj_char[6]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_block_ver1
        obj_VFX["draw_sync"]()
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_block_RC_red(active_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local VFX_spawn_anchor = common_game_scene_get_VFX_spawn_anchor(active_op_side_obj_char["player_side"])["block_ver1_spawn_anchor_pos"][active_op_side_obj_char["sprite_sheet"]]
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 18
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = 0.75
    obj_VFX[5] = active_op_side_obj_char[5]
    obj_VFX[6] = active_op_side_obj_char[6]
    obj_VFX[7] = 0
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][1] = 1
    obj_VFX["animation"][3] = 2
    obj_VFX["animation"][5] = 3
    obj_VFX["animation"][8] = 4
    obj_VFX["animation"][11] = 5
    obj_VFX["animation"][14] = 6
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 18
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
    obj_VFX["update"] = function()
        frame_animator(obj_VFX,obj_VFX["animation"])
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
        obj_VFX[5] = active_op_side_obj_char[5]
        obj_VFX[6] = active_op_side_obj_char[6]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_block_ver1
        obj_VFX["draw_sync"]()
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_block_RC_yellow(active_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local VFX_spawn_anchor = common_game_scene_get_VFX_spawn_anchor(active_op_side_obj_char["player_side"])["block_ver1_spawn_anchor_pos"][active_op_side_obj_char["sprite_sheet"]]
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 31
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = 0.75
    obj_VFX[5] = active_op_side_obj_char[5]
    obj_VFX[6] = active_op_side_obj_char[6]
    obj_VFX[7] = 0
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][12] = 1
    obj_VFX["animation"][14] = 2
    obj_VFX["animation"][17] = 3
    obj_VFX["animation"][20] = 4
    obj_VFX["animation"][23] = 5
    obj_VFX["animation"][27] = 6
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 31
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
    obj_VFX["update"] = function()
        frame_animator(obj_VFX,obj_VFX["animation"])
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
        obj_VFX[5] = active_op_side_obj_char[5]
        obj_VFX[6] = active_op_side_obj_char[6]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_block_ver1
        obj_VFX["draw_sync"]()
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_FD_block(active_op_side_obj_char)
    local obj_VFX = {0,0,0,1,1,1,0,0}
    local FD_VFX_spawn_anchor_table = common_game_scene_get_VFX_spawn_anchor(active_op_side_obj_char["player_side"])["FD_block_spawn_anchor_pos"]
    local FD_VFX_spawn_anchor = FD_VFX_spawn_anchor_table[active_op_side_obj_char["height"]]

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 35
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(FD_VFX_spawn_anchor[1])
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(FD_VFX_spawn_anchor[2])
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = 0
    obj_VFX[5] = active_op_side_obj_char[5]
    obj_VFX[6] = active_op_side_obj_char[6]
    obj_VFX[7] = 0
    obj_VFX[8] = 0
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["animation"] = {}
    obj_VFX["animation"][0] = 0
    obj_VFX["animation"][12] = 1
    obj_VFX["animation"][14] = 2
    obj_VFX["animation"][17] = 3
    obj_VFX["animation"][20] = 4
    obj_VFX["animation"][23] = 5
    obj_VFX["animation"][27] = 6
    obj_VFX["animation"][31] = 7
    obj_VFX["animation"]["prop"] = 8
    obj_VFX["animation"]["length"] = 35
    obj_VFX["animation"]["loop"] = false
    init_frame_anim_without(obj_VFX,obj_VFX["animation"])
    obj_VFX["opacity_point_linear_animation"] = {}
    obj_VFX["opacity_point_linear_animation"][0] = {0.75,15}
    obj_VFX["opacity_point_linear_animation"][15] = {0.9,25}
    obj_VFX["opacity_point_linear_animation"][25] = {0.9,35}
    obj_VFX["opacity_point_linear_animation"][35] = {0,35}
    obj_VFX["opacity_point_linear_animation"]["prop"] = 4
    obj_VFX["opacity_point_linear_animation"]["length"] = 35
    obj_VFX["opacity_point_linear_animation"]["loop"] = false
    obj_VFX["opacity_point_linear_animation"]["fix_type"] = true
    init_point_linear_anim_without(obj_VFX,obj_VFX["opacity_point_linear_animation"])
    obj_VFX["update"] = function()
        frame_animator(obj_VFX,obj_VFX["animation"])
        point_linear_animator(obj_VFX,obj_VFX["opacity_point_linear_animation"])
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        FD_VFX_spawn_anchor = FD_VFX_spawn_anchor_table[active_op_side_obj_char["height"]]
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(FD_VFX_spawn_anchor[1])
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(FD_VFX_spawn_anchor[2])
        obj_VFX[5] = active_op_side_obj_char[5]
        obj_VFX[6] = active_op_side_obj_char[6]
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_block_FD
        obj_VFX["draw_sync"]()
        love.graphics.setColor(1,1,1,obj_VFX[4])
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        draw_3d_image(obj_camera,obj_VFX,image_VFX_game_scene_FD_bubble)
        love.graphics.setBlendMode("alpha")
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],obj_VFX)
end
function insert_VFX_game_scene_char_throw_tech(active_op_side_obj_char,passive_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    obj_VFX["life"] = 20
    obj_VFX[1] = (active_op_side_obj_char["x"] + passive_op_side_obj_char["x"])/2 + active_op_side_obj_char[5]*(x)
    obj_VFX[2] = (active_op_side_obj_char["y"] + passive_op_side_obj_char["y"])/2 + active_op_side_obj_char[6]*(y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = r
    obj_VFX[8] = 0
    obj_VFX["f"] = -1
    obj_VFX["update"] = function()
        obj_VFX["f"] = obj_VFX["f"] + 1
        if obj_VFX["f"] >= 2 then
            obj_VFX[8] = math.min(obj_VFX[8] + 1,24)
            obj_VFX["f"] = 0
        end
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = (active_op_side_obj_char["x"] + passive_op_side_obj_char["x"])/2 + active_op_side_obj_char[5]*(x)
        obj_VFX[2] = (active_op_side_obj_char["y"] + passive_op_side_obj_char["y"])/2 + active_op_side_obj_char[6]*(y)
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*sx
        obj_VFX[6] = active_op_side_obj_char[6]*sy
        obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_throw_tech
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_back_table"],obj_VFX)
end

-- smoke
function insert_VFX_game_scene_stage_smoke_dash_shot(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    obj_VFX["life"] = 30
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x-math.random()*150)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = r
    obj_VFX[8] = math.random(5)
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["opacity_point_linear_animation"] = {}
    obj_VFX["opacity_point_linear_animation"][0] = {1*opacity,30}
    obj_VFX["opacity_point_linear_animation"][30] = {0,30}
    obj_VFX["opacity_point_linear_animation"]["prop"] = 4
    obj_VFX["opacity_point_linear_animation"]["length"] = 30
    obj_VFX["opacity_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(obj_VFX,obj_VFX["opacity_point_linear_animation"])
    obj_VFX["f"] = -1
    obj_VFX["update"] = function()
        point_linear_animator(obj_VFX,obj_VFX["opacity_point_linear_animation"])
        obj_VFX["f"] = obj_VFX["f"] + 1
        if obj_VFX["f"] >= 3 then
            obj_VFX[8] = math.min(obj_VFX[8] + 1,24)
            if obj_VFX[8] == 6 then
                obj_VFX[8] = 0
            end
            obj_VFX["f"] = 0
        end
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        -- obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x-math.random()*150)
        -- obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
        -- obj_VFX[3] = active_op_side_obj_char[3]
        -- obj_VFX[5] = active_op_side_obj_char[5]*sx
        -- obj_VFX[6] = active_op_side_obj_char[6]*sy
        -- obj_VFX[8] = math.random(5)
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_dash_shot
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_front_table"],obj_VFX)
end
function insert_VFX_game_scene_stage_smoke_horizontal_shot(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    obj_VFX["life"] = 75
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = r
    obj_VFX[8] = 0
    obj_VFX["f"] = -1
    obj_VFX["update"] = function()
        obj_VFX["f"] = obj_VFX["f"] + 1
        if obj_VFX["f"] >= 3 then
            obj_VFX[8] = math.min(obj_VFX[8] + 1,24)
            obj_VFX["f"] = 0
        end
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        -- obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
        -- obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
        -- obj_VFX[3] = active_op_side_obj_char[3]
        -- obj_VFX[5] = active_op_side_obj_char[5]*sx
        -- obj_VFX[6] = active_op_side_obj_char[6]*sy
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_horizontal_shot
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],obj_VFX)
end
function insert_VFX_game_scene_stage_smoke_land_blow(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    obj_VFX["life"] = 63
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = r
    obj_VFX[8] = 0
    obj_VFX["f"] = -1
    obj_VFX["update"] = function()
        obj_VFX["f"] = obj_VFX["f"] + 1
        if obj_VFX["f"] >= 3 then
            obj_VFX[8] = math.min(obj_VFX[8] + 1,20)
            obj_VFX["f"] = 0
        end
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        -- obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
        -- obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
        -- obj_VFX[3] = active_op_side_obj_char[3]
        -- obj_VFX[5] = active_op_side_obj_char[5]*sx
        -- obj_VFX[6] = active_op_side_obj_char[6]*sy
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_land_blow
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],obj_VFX)
end
function insert_VFX_game_scene_stage_smoke_vertical_shot(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    obj_VFX["life"] = 72
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = r
    obj_VFX[8] = 0
    obj_VFX["f"] = -1
    obj_VFX["update"] = function()
        obj_VFX["f"] = obj_VFX["f"] + 1
        if obj_VFX["f"] >= 2 then
            obj_VFX[8] = math.min(obj_VFX[8] + 1,17)
            obj_VFX["f"] = 0
        end
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        -- obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
        -- obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
        -- obj_VFX[3] = active_op_side_obj_char[3]
        -- obj_VFX[5] = active_op_side_obj_char[5]*sx
        -- obj_VFX[6] = active_op_side_obj_char[6]*sy
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_vertical_shot
        image_sprite_sheet["sprite_batch"]:clear()
        obj_VFX["draw_sync"]()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],obj_VFX)
end

-- shockwave
function insert_VFX_game_scene_stage_4dash_air_backdash_shockwave(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    obj_VFX["life"] = 26
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = r
    obj_VFX[8] = 0
    obj_VFX["f"] = -1
    obj_VFX["update"] = function()
        obj_VFX["f"] = obj_VFX["f"] + 1
        if obj_VFX["f"] >= 2 then
            obj_VFX[8] = math.min(obj_VFX[8] + 1,12)
            obj_VFX["f"] = 0
        end
        obj_VFX["life"] = obj_VFX["life"] - 1
        if active_op_side_obj_char["state"] == "burst_RC_blue" then
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        -- obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
        -- obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
        -- obj_VFX[3] = active_op_side_obj_char[3]
        -- obj_VFX[5] = active_op_side_obj_char[5]*sx
        -- obj_VFX[6] = active_op_side_obj_char[6]*sy
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_dash_shockwave
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],obj_VFX)
end
function insert_VFX_game_scene_stage_6dash_air_dash_shockwave(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    obj_VFX["life"] = 26
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = r
    obj_VFX[8] = 0
    obj_VFX["f"] = -1
    obj_VFX["update"] = function()
        obj_VFX["f"] = obj_VFX["f"] + 1
        if obj_VFX["f"] >= 2 then
            obj_VFX[8] = math.min(obj_VFX[8]+1,12)
            obj_VFX["f"] = 0
        end
        obj_VFX[1] = obj_VFX[1] - 0.2*obj_VFX[5]
        obj_VFX["life"] = obj_VFX["life"] - 1
        if active_op_side_obj_char["state"] == "burst_RC_blue" then
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_dash_shockwave
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],obj_VFX)
end

-- burst
function insert_VFX_game_scne_stage_dash_cancel_blow(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    obj_VFX["life"] = 36
    obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
    obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    obj_VFX[3] = active_op_side_obj_char[3]
    obj_VFX[4] = opacity
    obj_VFX[5] = active_op_side_obj_char[5]*sx
    obj_VFX[6] = active_op_side_obj_char[6]*sy
    obj_VFX[7] = r
    obj_VFX[8] = 0
    obj_VFX["f"] = -1
    obj_VFX["update"] = function()
        obj_VFX["f"] = obj_VFX["f"] + 1
        if obj_VFX["f"] >= 2 then
            obj_VFX[8] = math.min(obj_VFX[8]+1,9)
            obj_VFX["f"] = 0
        end
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        obj_VFX[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
        obj_VFX[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
        obj_VFX[3] = active_op_side_obj_char[3]
        obj_VFX[5] = active_op_side_obj_char[5]*sx
        obj_VFX[6] = active_op_side_obj_char[6]*sy
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_dcc_blow
        obj_VFX["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj_VFX,image_sprite_sheet,""..obj_VFX[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],obj_VFX)
end
-- GP
function insert_VFX_game_scene_char_GP(active_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,1,1,1,0,0}
    obj_VFX["life"] = 42
    obj_VFX["update"] = function()
        obj_VFX["life"] = 42
        if active_op_side_obj_char["state"] ~= "hurtstop" then
            obj_VFX["life"] = 0
        end
    end
    obj_VFX["draw_sync"] = function()
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        local opacity_cache = active_op_side_obj_char[4]
        local contrast_cache = active_op_side_obj_char["contrast"]
        local brightness_cache = active_op_side_obj_char["brightness"]
        local side_table = {
            ["L"] = draw_game_scene_char_LP,
            ["R"] = draw_game_scene_char_RP
        }
        -- obj_VFX["draw_sync"]()
        active_op_side_obj_char[4] = 0.2
        active_op_side_obj_char["contrast"] = 1
        active_op_side_obj_char["brightness"] = 1
        love.graphics.setBlendMode("add")
        side_table[active_op_side_obj_char["player_side"]]()
        love.graphics.setBlendMode("alpha")
        active_op_side_obj_char[4] = opacity_cache
        active_op_side_obj_char["contrast"] = contrast_cache
        active_op_side_obj_char["brightness"] = brightness_cache
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],obj_VFX)
end

-- HUD
function insert_VFX_HUD_game_scene_counter_ver0_2(active_op_side_obj_char)
    local obj_VFX = {0,0,0,0,0.75,0.65,0,0}
    local side = active_op_side_obj_char["player_side"]
    local side_table = {
        ["L"] = 165,
        ["R"] = 1314
    }
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["image"] = image_VFX_game_scene_HUD_counter_ver0_2
    obj_VFX["life"] = 70

    obj_VFX[1] = side_table[side]
    obj_VFX[2] = 35

-- y_anim
    obj_VFX["y_anim"] = {}
    obj_VFX["y_anim"][0] = {0.00,1}
    obj_VFX["y_anim"][1] = {3.00,2}
    obj_VFX["y_anim"][2] = {-2.00,3}
    obj_VFX["y_anim"][3] = {1.00,5}
    obj_VFX["y_anim"][5] = {0.00,35}
    obj_VFX["y_anim"][35] = {0.00,40}
    obj_VFX["y_anim"][40] = {0.07,45}
    obj_VFX["y_anim"][45] = {0.45,47}
    obj_VFX["y_anim"][47] = {0.85,49}
    obj_VFX["y_anim"][49] = {1.87,50}
    obj_VFX["y_anim"][50] = {4.00,50}
    obj_VFX["y_anim"]["prop"] = 2
    obj_VFX["y_anim"]["length"] = 50
    obj_VFX["y_anim"]["loop"] = false
    obj_VFX["y_anim"]["fix_type"] = false
-- opacity_anim
    obj_VFX["opacity_anim"] = {}
    obj_VFX["opacity_anim"][0] = {0.00,1}
    obj_VFX["opacity_anim"][1] = {0.87,2}
    obj_VFX["opacity_anim"][2] = {1.00,5}
    obj_VFX["opacity_anim"][5] = {1.00,15}
    obj_VFX["opacity_anim"][15] = {0.99,25}
    obj_VFX["opacity_anim"][25] = {0.95,35}
    obj_VFX["opacity_anim"][35] = {0.84,40}
    obj_VFX["opacity_anim"][40] = {0.75,45}
    obj_VFX["opacity_anim"][45] = {0.57,47}
    obj_VFX["opacity_anim"][47] = {0.45,49}
    obj_VFX["opacity_anim"][49] = {0.25,50}
    obj_VFX["opacity_anim"][50] = {0.00,50}
    obj_VFX["opacity_anim"]["prop"] = 4
    obj_VFX["opacity_anim"]["length"] = 50
    obj_VFX["opacity_anim"]["loop"] = false
    obj_VFX["opacity_anim"]["fix_type"] = true
-- update
    obj_VFX["update"] = function()
        point_linear_animator(obj_VFX,obj_VFX["y_anim"])
        point_linear_animator(obj_VFX,obj_VFX["opacity_anim"])
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        -- obj_VFX["draw_sync"]()
        draw_2d_image(obj_VFX,obj_VFX["image"])
    end
    active_op_side_obj_char["VFX_HUD_table"] = {}
    table.insert(active_op_side_obj_char["VFX_HUD_table"],obj_VFX)
end
function insert_VFX_HUD_game_scene_counter_ver3(active_op_side_obj_char)
    -- x y z opacity sx sy r f
    local obj_VFX = {0,0,0,0,1,1,0,0}
    obj_VFX["x"] = 800
    obj_VFX["y"] = 600
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"]["y"] = 0
    obj_VFX["LCD"]["y"] = 0
    obj_VFX["image"] = image_VFX_game_scene_HUD_counter_ver3
    obj_VFX["life"] = 40
    obj_VFX[1] = obj_VFX["x"] - obj_VFX[5]*(600)
    obj_VFX[2] = obj_VFX["y"] - obj_VFX[6]*(200)

-- sx_anim
    obj_VFX["sx_anim"] = {}
    obj_VFX["sx_anim"][0] = {1.000,1}
    obj_VFX["sx_anim"][1] = {1.134,2}
    obj_VFX["sx_anim"][2] = {1.176,3}
    obj_VFX["sx_anim"][3] = {1.199,4}
    obj_VFX["sx_anim"][4] = {1.213,5}
    obj_VFX["sx_anim"][5] = {1.220,7}
    obj_VFX["sx_anim"][7] = {1.228,9}
    obj_VFX["sx_anim"][9] = {1.234,10}
    obj_VFX["sx_anim"][10] = {1.236,12}
    obj_VFX["sx_anim"][12] = {1.240,14}
    obj_VFX["sx_anim"][14] = {1.245,16}
    obj_VFX["sx_anim"][16] = {1.246,18}
    obj_VFX["sx_anim"][18] = {1.247,20}
    obj_VFX["sx_anim"][20] = {1.248,25}
    obj_VFX["sx_anim"][25] = {1.249,30}
    obj_VFX["sx_anim"][30] = {1.250,32}
    obj_VFX["sx_anim"][32] = {1.251,33}
    obj_VFX["sx_anim"][33] = {1.252,34}
    obj_VFX["sx_anim"][34] = {1.253,35}
    obj_VFX["sx_anim"][35] = {1.256,36}
    obj_VFX["sx_anim"][36] = {1.258,37}
    obj_VFX["sx_anim"][37] = {1.263,38}
    obj_VFX["sx_anim"][38] = {1.270,39}
    obj_VFX["sx_anim"][39] = {1.281,40}
    obj_VFX["sx_anim"][40] = {1.300,40}
    obj_VFX["sx_anim"]["prop"] = 5
    obj_VFX["sx_anim"]["length"] = 40
    obj_VFX["sx_anim"]["loop"] = false
    obj_VFX["sx_anim"]["fix_type"] = true
-- y_anim
    obj_VFX["y_anim"] = {}
    obj_VFX["y_anim"][0] = {600.00,1}
    obj_VFX["y_anim"][1] = {584.41,2}
    obj_VFX["y_anim"][2] = {575.88,3}
    obj_VFX["y_anim"][3] = {571.29,4}
    obj_VFX["y_anim"][4] = {568.60,5}
    obj_VFX["y_anim"][5] = {567.10,7}
    obj_VFX["y_anim"][7] = {565.20,9}
    obj_VFX["y_anim"][9] = {563.69,11}
    obj_VFX["y_anim"][11] = {562.51,14}
    obj_VFX["y_anim"][14] = {561.24,16}
    obj_VFX["y_anim"][16] = {560.69,20}
    obj_VFX["y_anim"][20] = {560.00,30}
    obj_VFX["y_anim"][30] = {560.00,40}
    obj_VFX["y_anim"][40] = {560.00,40}
    obj_VFX["y_anim"]["prop"] = "y"
    obj_VFX["y_anim"]["length"] = 40
    obj_VFX["y_anim"]["loop"] = false
    obj_VFX["y_anim"]["fix_type"] = true
-- opacity_anim
    obj_VFX["opacity_anim"] = {}
    obj_VFX["opacity_anim"][0] = {0.00,1}
    obj_VFX["opacity_anim"][1] = {0.58,2}
    obj_VFX["opacity_anim"][2] = {0.70,3}
    obj_VFX["opacity_anim"][3] = {0.77,4}
    obj_VFX["opacity_anim"][4] = {0.82,5}
    obj_VFX["opacity_anim"][5] = {0.85,6}
    obj_VFX["opacity_anim"][6] = {0.88,7}
    obj_VFX["opacity_anim"][7] = {0.90,9}
    obj_VFX["opacity_anim"][9] = {0.93,11}
    obj_VFX["opacity_anim"][11] = {0.95,13}
    obj_VFX["opacity_anim"][13] = {0.97,15}
    obj_VFX["opacity_anim"][15] = {0.98,20}
    obj_VFX["opacity_anim"][20] = {0.99,30}
    obj_VFX["opacity_anim"][30] = {1.00,31}
    obj_VFX["opacity_anim"][31] = {1.00,32}
    obj_VFX["opacity_anim"][32] = {0.99,33}
    obj_VFX["opacity_anim"][33] = {0.96,34}
    obj_VFX["opacity_anim"][34] = {0.93,35}
    obj_VFX["opacity_anim"][35] = {0.89,36}
    obj_VFX["opacity_anim"][36] = {0.82,37}
    obj_VFX["opacity_anim"][37] = {0.73,38}
    obj_VFX["opacity_anim"][38] = {0.60,39}
    obj_VFX["opacity_anim"][39] = {0.38,40}
    obj_VFX["opacity_anim"][40] = {0.00,40}
    obj_VFX["opacity_anim"]["prop"] = 4
    obj_VFX["opacity_anim"]["length"] = 40
    obj_VFX["opacity_anim"]["loop"] = false
    obj_VFX["opacity_anim"]["fix_type"] = true
-- update
    obj_VFX["update"] = function()
        point_linear_animator(obj_VFX,obj_VFX["sx_anim"])
        point_linear_animator(obj_VFX,obj_VFX["y_anim"])
        point_linear_animator(obj_VFX,obj_VFX["opacity_anim"])
        obj_VFX[1] = obj_VFX["x"] - obj_VFX[5]*(600)
        obj_VFX[2] = obj_VFX["y"] - obj_VFX[6]*(200)
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        -- obj_VFX[1] = obj_VFX["x"] - obj_VFX[5]*(600)
        -- obj_VFX[2] = obj_VFX["y"] - obj_VFX[6]*(200)
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        -- obj_VFX["draw_sync"]()
        love.graphics.setBlendMode("add")
        draw_2d_image(obj_VFX,obj_VFX["image"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_HUD_table"],obj_VFX)

-- black_overlay
    local obj_VFX = {0,0,0,0.5,0,0,0,0}
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    obj_VFX["FCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["life"] = 60
    obj_VFX["opacity_anim"] = {}
    obj_VFX["opacity_anim"][0] = {0.5,60}
    obj_VFX["opacity_anim"][60] = {0,60}
    obj_VFX["opacity_anim"]["prop"] = 4
    obj_VFX["opacity_anim"]["length"] = 60
    obj_VFX["opacity_anim"]["loop"] = false
    obj_VFX["opacity_anim"]["fix_type"] = true
    init_point_linear_anim_without(obj_VFX,obj_VFX["opacity_anim"])

    obj_VFX["update"] = function()
        point_linear_animator(obj_VFX,obj_VFX["opacity_anim"])
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        -- obj_VFX["draw_sync"]()
        love.graphics.setColor(0,0,0,obj_VFX[4])
        love.graphics.rectangle("fill",0,0,width,height)
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(active_op_side_obj_char["VFX_black_overlay_table"],obj_VFX)
end
function insert_VFX_HUD_game_scene_punish(active_op_side_obj_char)
    local obj_VFX = {0,0,0,0,0.75,0.65,0,0}
    local side = active_op_side_obj_char["player_side"]
    local side_table = {
        ["L"] = 165,
        ["R"] = 1314
    }
    obj_VFX["LCT"] = {0,0,0,0,0,0,0,0}
    obj_VFX["LCD"] = {0,0,0,0,0,0,0,0}
    obj_VFX["image"] = image_VFX_game_scene_HUD_punish
    obj_VFX["life"] = 70

    obj_VFX[1] = side_table[side]
    obj_VFX[2] = 35

-- y_anim
    obj_VFX["y_anim"] = {}
    obj_VFX["y_anim"][0] = {0.00,1}
    obj_VFX["y_anim"][1] = {3.00,2}
    obj_VFX["y_anim"][2] = {-2.00,3}
    obj_VFX["y_anim"][3] = {1.00,5}
    obj_VFX["y_anim"][5] = {0.00,35}
    obj_VFX["y_anim"][35] = {0.00,40}
    obj_VFX["y_anim"][40] = {0.07,45}
    obj_VFX["y_anim"][45] = {0.45,47}
    obj_VFX["y_anim"][47] = {0.85,49}
    obj_VFX["y_anim"][49] = {1.87,50}
    obj_VFX["y_anim"][50] = {4.00,50}
    obj_VFX["y_anim"]["prop"] = 2
    obj_VFX["y_anim"]["length"] = 50
    obj_VFX["y_anim"]["loop"] = false
    obj_VFX["y_anim"]["fix_type"] = false
-- opacity_anim
    obj_VFX["opacity_anim"] = {}
    obj_VFX["opacity_anim"][0] = {0.00,1}
    obj_VFX["opacity_anim"][1] = {0.87,2}
    obj_VFX["opacity_anim"][2] = {1.00,5}
    obj_VFX["opacity_anim"][5] = {1.00,15}
    obj_VFX["opacity_anim"][15] = {0.99,25}
    obj_VFX["opacity_anim"][25] = {0.95,35}
    obj_VFX["opacity_anim"][35] = {0.84,40}
    obj_VFX["opacity_anim"][40] = {0.75,45}
    obj_VFX["opacity_anim"][45] = {0.57,47}
    obj_VFX["opacity_anim"][47] = {0.45,49}
    obj_VFX["opacity_anim"][49] = {0.25,50}
    obj_VFX["opacity_anim"][50] = {0.00,50}
    obj_VFX["opacity_anim"]["prop"] = 4
    obj_VFX["opacity_anim"]["length"] = 50
    obj_VFX["opacity_anim"]["loop"] = false
    obj_VFX["opacity_anim"]["fix_type"] = true
-- update
    obj_VFX["update"] = function()
        point_linear_animator(obj_VFX,obj_VFX["y_anim"])
        point_linear_animator(obj_VFX,obj_VFX["opacity_anim"])
        obj_VFX["life"] = obj_VFX["life"] - 1
    end
    obj_VFX["draw_sync"] = function()
        -- obj_VFX["draw_sync"] = function() end
    end
    obj_VFX["draw"] = function()
        -- obj_VFX["draw_sync"]()
        draw_2d_image(obj_VFX,obj_VFX["image"])
    end
    active_op_side_obj_char["VFX_HUD_table"] = {}
    table.insert(active_op_side_obj_char["VFX_HUD_table"],obj_VFX)
end
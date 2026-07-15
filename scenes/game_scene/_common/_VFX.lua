function insert_VFX_game_scene_char_overdrive_badge(active_op_side_obj_char)
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = common_game_scene_get_overdrive_badge_image_sprite_sheet_table(active_op_side_obj_char["player_side"])
    if active_op_side_obj_char["height"] == "air" then
        VFX_obj["y_offset"] = 715
    else
        VFX_obj["y_offset"] = 845
    end
    VFX_obj["life"] = 70
    VFX_obj[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(500)
    VFX_obj[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*(VFX_obj["y_offset"])
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = 1
    VFX_obj[5] = active_op_side_obj_char[5]
    VFX_obj[6] = active_op_side_obj_char[6]
    VFX_obj[7] = active_op_side_obj_char[7]
    VFX_obj[8] = 0
    VFX_obj["f"] = -1
    VFX_obj["update"] = function()
        VFX_obj["f"] = VFX_obj["f"] + 1
        if VFX_obj["f"] >= 1 then
            VFX_obj["f"] = 0
            VFX_obj[8] = VFX_obj[8] + 1
        end
        VFX_obj["life"] = VFX_obj["life"] - 1
        if active_op_side_obj_char["state"] ~= "burst_overdrive" then
            VFX_obj["life"] = 0
        end
    end
    VFX_obj["draw_sync"] = function()
        VFX_obj[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(500)
        VFX_obj[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*(VFX_obj["y_offset"])
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]
        VFX_obj[6] = active_op_side_obj_char[6]
        VFX_obj[7] = active_op_side_obj_char[7]
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],VFX_obj)
end
function insert_VFX_game_scene_char_overdrive_airflow(active_op_side_obj_char)
    local VFX_obj = {0,0,0,1,1,1,0,0}
    VFX_obj["y_offset"] = 0

    if active_op_side_obj_char["height"] == "air" then
        VFX_obj["y_offset"] = 745
    else
        VFX_obj["y_offset"] = 875
    end
    VFX_obj["life"] = 35
    VFX_obj[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(860)
    VFX_obj[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*VFX_obj["y_offset"]
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = 1
    VFX_obj[5] = active_op_side_obj_char[5]*2
    VFX_obj[6] = active_op_side_obj_char[6]*2
    VFX_obj[7] = active_op_side_obj_char[7]
    VFX_obj[8] = 0
    VFX_obj["f"] = -1
    VFX_obj["update"] = function()
        VFX_obj["f"] = VFX_obj["f"] + 1
        if VFX_obj["f"] >= 1 then
            VFX_obj["f"] = 0
            VFX_obj[8] = VFX_obj[8] + 1
        end
        VFX_obj["life"] = VFX_obj["life"] - 1
        if active_op_side_obj_char["state"] ~= "burst_overdrive" then
            VFX_obj["life"] = 0
        end
    end
    VFX_obj["draw_sync"] = function()
        if active_op_side_obj_char["height"] == "air" then
            VFX_obj["y_offset"] = 745
        else
            VFX_obj["y_offset"] = 875
        end
        VFX_obj[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(860)
        VFX_obj[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*VFX_obj["y_offset"]
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*2
        VFX_obj[6] = active_op_side_obj_char[6]*2
        VFX_obj[7] = active_op_side_obj_char[7]
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_overdrive_airflow
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],VFX_obj)
end
function insert_VFX_game_scene_char_overdrive_partical(active_op_side_obj_char,passive_op_side_obj_char)
    local side_table = {
        ["L"] = {0,0,1,1,1,1,0,0},
        ["R"] = {1600,0,1,1,1,1,0,0}
    }
    local VFX_obj = side_table[active_op_side_obj_char["player_side"]]
    local obj_camera = obj_stage_game_scene_camera

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}
    
    VFX_obj["life"] = 70
    VFX_obj["f"] = -1

    VFX_obj["update"] = function()
        VFX_obj["f"] = VFX_obj["f"] + 1
        if VFX_obj["f"] >= 1 then
            VFX_obj[8] = VFX_obj[8] + 1
            VFX_obj["f"] = 0
        end
        VFX_obj["life"] = VFX_obj["life"] - 1
        if active_op_side_obj_char["state"] ~= "burst_overdrive" then
            VFX_obj["life"] = 0
        end
    end
    VFX_obj["draw_sync"] = function()
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_overdrive_partical
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_2d_image_sprite_batch(VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],VFX_obj)
end
function insert_VFX_game_scene_char_overdrive_black_overlay(active_op_side_obj_char)
    local VFX_obj = {0,0,0,1,0,0,0,0}
    local obj_camera = obj_stage_game_scene_camera
    VFX_obj["y_offset"] = 0
    if active_op_side_obj_char["height"] == "air" then
        VFX_obj["y_offset"] = 245
    else
        VFX_obj["y_offset"] = 345
    end

    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["life"] = 42
    VFX_obj[1] = active_op_side_obj_char["x"]
    VFX_obj[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*VFX_obj["y_offset"]
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = 1
    VFX_obj[5] = 0
    VFX_obj[6] = 0
    VFX_obj[7] = 0
    VFX_obj[8] = 0
    VFX_obj["cood_res"] = draw_3d_point_to_2D(obj_camera,VFX_obj)
    VFX_obj["state"] = "ease_in"
    VFX_obj["blur_shader"] = shader_game_scene_gaussian_blur
    VFX_obj["blur_shader"]:send("Directions",16)
    VFX_obj["blur_shader"]:send("Quality",5)
    VFX_obj["blur_shader"]:send("Size",8)
    VFX_obj["blur_shader"]:send("resolution",{love.graphics.getWidth(),love.graphics.getHeight()})

    VFX_obj["opacity_ease_in_anim"] = {}
    VFX_obj["opacity_ease_in_anim"][0] = {0.00,1}
    VFX_obj["opacity_ease_in_anim"][1] = {0.04,3}
    VFX_obj["opacity_ease_in_anim"][3] = {0.08,7}
    VFX_obj["opacity_ease_in_anim"][7] = {0.14,14}
    VFX_obj["opacity_ease_in_anim"][14] = {0.18,18}
    VFX_obj["opacity_ease_in_anim"][18] = {0.20,28}
    VFX_obj["opacity_ease_in_anim"][28] = {0.22,29}
    VFX_obj["opacity_ease_in_anim"][29] = {0.36,30}
    VFX_obj["opacity_ease_in_anim"][30] = {0.44,31}
    VFX_obj["opacity_ease_in_anim"][31] = {0.48,33}
    VFX_obj["opacity_ease_in_anim"][33] = {0.50,33}
    VFX_obj["opacity_ease_in_anim"]["prop"] = 4
    VFX_obj["opacity_ease_in_anim"]["length"] = 33
    VFX_obj["opacity_ease_in_anim"]["loop"] = false
    VFX_obj["opacity_ease_in_anim"]["fix_type"] = true

    VFX_obj["opacity_ease_out_anim"] = {}
    VFX_obj["opacity_ease_out_anim"][0] = {0.50,10}
    VFX_obj["opacity_ease_out_anim"][10] = {0.00,10}
    VFX_obj["opacity_ease_out_anim"]["prop"] = 4
    VFX_obj["opacity_ease_out_anim"]["length"] = 10
    VFX_obj["opacity_ease_out_anim"]["loop"] = false
    VFX_obj["opacity_ease_out_anim"]["fix_type"] = true

    VFX_obj["size_anim"] = {}
    VFX_obj["size_anim"][0] = {200,28}
    VFX_obj["size_anim"][28] = {800,33}
    VFX_obj["size_anim"][33] = {2600,33} 
    VFX_obj["size_anim"]["prop"] = 5
    VFX_obj["size_anim"]["length"] = 33
    VFX_obj["size_anim"]["loop"] = false
    VFX_obj["size_anim"]["fix_type"] = true

    VFX_obj["draw_canvas"] = love.graphics.newCanvas(love.graphics.getWidth(),love.graphics.getHeight())

    init_point_linear_anim_without(VFX_obj,VFX_obj["size_anim"])
    init_point_linear_anim_without(VFX_obj,VFX_obj["opacity_ease_in_anim"])

    VFX_obj["update"] = function()
        local switch = {
            -- ease_in 之前的状态 如果达到第10帧则为下一个动画的第0帧 
            ["ease_in"] = function()
                point_linear_animator(VFX_obj,VFX_obj["size_anim"])
                point_linear_animator(VFX_obj,VFX_obj["opacity_ease_in_anim"])
                VFX_obj["life"] = 42
                if active_op_side_obj_char["overdrive_gauge"][3] == "off" then
                    VFX_obj["state"] = "ease_out"
                    VFX_obj["life"] = 10
                    VFX_obj[4] = 0.50
                    init_point_linear_anim_with(VFX_obj,VFX_obj["opacity_ease_out_anim"])
                end
            end,
            ["ease_out"] = function()
                point_linear_animator(VFX_obj,VFX_obj["opacity_ease_out_anim"])
                if get_point_linear_anim_end_state(VFX_obj,VFX_obj["opacity_ease_out_anim"]) then
                    VFX_obj["life"] = 0
                end
            end,
        }
        local this_function = switch[VFX_obj["state"]]
        if this_function then this_function() end

        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        if active_op_side_obj_char["height"] == "air" then
            VFX_obj["y_offset"] = 245
        else
            VFX_obj["y_offset"] = 345
        end
        VFX_obj[1] = active_op_side_obj_char["x"]
        VFX_obj[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*VFX_obj["y_offset"]
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        VFX_obj["draw_sync"]()
        love.graphics.setCanvas(VFX_obj["draw_canvas"])
        love.graphics.clear(0,0,0,0)
        love.graphics.setColor(0,0,0,VFX_obj[4])
        love.graphics.circle( "fill",VFX_obj["cood_res"][1],VFX_obj["cood_res"][2],draw_resolution_correction(VFX_obj[5]) )
        love.graphics.setColor(1,1,1,1)
        love.graphics.setCanvas()
        VFX_obj["blur_shader"]:send("Directions",16)
        VFX_obj["blur_shader"]:send("Quality",5)
        VFX_obj["blur_shader"]:send("Size",8)
        VFX_obj["blur_shader"]:send("resolution",{love.graphics.getWidth(),love.graphics.getHeight()})
        love.graphics.setShader(VFX_obj["blur_shader"])
        love.graphics.draw(VFX_obj["draw_canvas"]) -- 画到屏幕上
        love.graphics.setShader()
    end
    table.insert(active_op_side_obj_char["VFX_black_overlay_table"],VFX_obj)
end

function insert_VFX_game_scene_char_RC_badge(active_op_side_obj_char,image_sprite_sheet)
    local VFX_obj = {0,0,0,1,1,1,0,0}
    VFX_obj["y_offset"] = 0
    if active_op_side_obj_char["height"] == "air" then
        VFX_obj["y_offset"] = 750
    else
        VFX_obj["y_offset"] = 880
    end

    VFX_obj["life"] = 15
    VFX_obj[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(600)
    VFX_obj[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*(VFX_obj["y_offset"])
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = 1
    VFX_obj[5] = active_op_side_obj_char[5]
    VFX_obj[6] = active_op_side_obj_char[6]
    VFX_obj[7] = active_op_side_obj_char[7]
    VFX_obj[8] = -1
    VFX_obj["update"] = function()
        if active_op_side_obj_char["height"] == "air" then
            VFX_obj["y_offset"] = 750
        else
            VFX_obj["y_offset"] = 880
        end
        VFX_obj[8] = VFX_obj[8] + 1
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        if active_op_side_obj_char["height"] == "air" then
            VFX_obj["y_offset"] = 750
        else
            VFX_obj["y_offset"] = 880
        end
        VFX_obj[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(600)
        VFX_obj[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*(VFX_obj["y_offset"])
        VFX_obj["draw_sync"]  = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],VFX_obj)
end
function insert_VFX_game_scene_char_RC_partical(active_op_side_obj_char,color)
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RC_partical
    VFX_obj["y_offset"] = 0
    if active_op_side_obj_char["height"] == "air" then
        VFX_obj["y_offset"] = 750
    else
        VFX_obj["y_offset"] = 850
    end
    
    VFX_obj["life"] = 40
    VFX_obj[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(600)
    VFX_obj[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*(VFX_obj["y_offset"])
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = 1
    VFX_obj[5] = active_op_side_obj_char[5]
    VFX_obj[6] = active_op_side_obj_char[6]
    VFX_obj[7] = active_op_side_obj_char[7]
    VFX_obj[8] = 0
    VFX_obj["f"] = -1
    VFX_obj["update"] = function()
        VFX_obj["f"] = VFX_obj["f"] + 1
        if VFX_obj["f"] >= 1 then
            VFX_obj[8] = VFX_obj[8] + 1
            VFX_obj["f"] = 0
        end
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        if active_op_side_obj_char["height"] == "air" then
            VFX_obj["y_offset"] = 750
        else
            VFX_obj["y_offset"] = 850
        end
        VFX_obj[1] = active_op_side_obj_char["x"] - active_op_side_obj_char[5]*(600)
        VFX_obj[2] = active_op_side_obj_char["y"] - active_op_side_obj_char[6]*(VFX_obj["y_offset"])
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]
        VFX_obj[6] = active_op_side_obj_char[6]
        VFX_obj[7] = active_op_side_obj_char[7]
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],VFX_obj)
end
function insert_VFX_game_scene_char_RC_black_overlay(active_op_side_obj_char)
    local VFX_obj = {0,0,0,0,0,0,0,0}

    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["life"] = 95
    
    VFX_obj["opacity_anim"] = {}
    VFX_obj["opacity_anim"][0] = {0.00,20}
    VFX_obj["opacity_anim"][20] = {0.50,85}
    VFX_obj["opacity_anim"][85] = {0.50,95}
    VFX_obj["opacity_anim"][95] = {0,95}
    VFX_obj["opacity_anim"]["prop"] = 4
    VFX_obj["opacity_anim"]["length"] = 95
    VFX_obj["opacity_anim"]["loop"] = false
    VFX_obj["opacity_anim"]["fix_type"] = true
    init_point_linear_anim_without(VFX_obj,VFX_obj["opacity_anim"])
    VFX_obj["update"] = function()
        point_linear_animator(VFX_obj,VFX_obj["opacity_anim"])
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        -- VFX_obj["draw_sync"]()
        love.graphics.setColor(0,0,0,VFX_obj[4])
        love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(active_op_side_obj_char["VFX_black_overlay_table"],VFX_obj)
end

-- blast slash directional ray_impact
function insert_VFX_game_scene_char_blast_attack_socket_ver0(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}

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

    VFX_obj["life"] = 11
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][3] = 2
    VFX_obj["animation"][6] = 3
    VFX_obj["animation"][8] = 4
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 11
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
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

        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*sx
        VFX_obj[6] = active_op_side_obj_char[6]*sy
        VFX_obj[7] = center_r
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_blast_attack_socket_ver1(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}

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

    VFX_obj["life"] = 16
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity*0.75
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][2] = 2
    VFX_obj["animation"][4] = 3
    VFX_obj["animation"][7] = 4
    VFX_obj["animation"][10] = 5
    VFX_obj["animation"][13] = 6
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 16
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
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

        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*sx
        VFX_obj[6] = active_op_side_obj_char[6]*sy
        VFX_obj[7] = center_r
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)

    -- air_blow
    local VFX_obj = {0,0,0,1,1,1,0,0}
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

    VFX_obj["life"] = 16
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][2] = 2
    VFX_obj["animation"][3] = 3
    VFX_obj["animation"][4] = 4
    VFX_obj["animation"][6] = 5
    VFX_obj["animation"][8] = 6
    VFX_obj["animation"][10] = 7
    VFX_obj["animation"][11] = 8
    VFX_obj["animation"][12] = 9
    VFX_obj["animation"][15] = 10
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 16
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
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
        
        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*sx
        VFX_obj[6] = active_op_side_obj_char[6]*sy
        VFX_obj[7] = center_r
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_counter_blast_attack_socket_ver0(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}

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

    VFX_obj["life"] = 27
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][2] = 1
    VFX_obj["animation"][4] = 2
    VFX_obj["animation"][6] = 3
    VFX_obj["animation"][8] = 4
    VFX_obj["animation"][10] = 5
    VFX_obj["animation"][11] = 6
    VFX_obj["animation"][12] = 7
    VFX_obj["animation"][13] = 8
    VFX_obj["animation"][14] = 9
    VFX_obj["animation"][16] = 10
    VFX_obj["animation"][18] = 11
    VFX_obj["animation"][21] = 12
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 27
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
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

        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*sx
        VFX_obj[6] = active_op_side_obj_char[6]*sy
        VFX_obj[7] = center_r
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0_counter
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_counter_blast_attack_socket_ver1(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}

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

    VFX_obj["life"] = 16
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity*0.85
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][2] = 2
    VFX_obj["animation"][4] = 3
    VFX_obj["animation"][7] = 4
    VFX_obj["animation"][10] = 5
    VFX_obj["animation"][13] = 6
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 16
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
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

        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*sx
        VFX_obj[6] = active_op_side_obj_char[6]*sy
        VFX_obj[7] = center_r
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)

    -- air_blow
    local VFX_obj = {0,0,0,1,1,1,0,0}
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

    VFX_obj["life"] = 16
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][2] = 2
    VFX_obj["animation"][3] = 3
    VFX_obj["animation"][4] = 4
    VFX_obj["animation"][6] = 5
    VFX_obj["animation"][8] = 6
    VFX_obj["animation"][10] = 7
    VFX_obj["animation"][11] = 8
    VFX_obj["animation"][12] = 9
    VFX_obj["animation"][15] = 10
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 16
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
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
        
        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*sx
        VFX_obj[6] = active_op_side_obj_char[6]*sy
        VFX_obj[7] = center_r
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
    
    -- counter_glow
    local VFX_obj = {0,0,0,1,1,1,0,0}
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

    VFX_obj["life"] = 5
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity*0.65
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["opacity_point_linear_animation"] = {}
    VFX_obj["opacity_point_linear_animation"][0] = {0.9*opacity,5}
    VFX_obj["opacity_point_linear_animation"][5] = {0,5}
    VFX_obj["opacity_point_linear_animation"]["prop"] = 4
    VFX_obj["opacity_point_linear_animation"]["length"] = 5
    VFX_obj["opacity_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(VFX_obj,VFX_obj["opacity_point_linear_animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            point_linear_animator(VFX_obj,VFX_obj["opacity_point_linear_animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
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
        
        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*sx
        VFX_obj[6] = active_op_side_obj_char[6]*sy
        VFX_obj[7] = center_r
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image = image_VFX_game_scene_counter_glow
        VFX_obj["draw_sync"]()
        love.graphics.setBlendMode("add")
        love.graphics.setColor(1,1,1,VFX_obj[4])
        draw_3d_image(obj_camera,VFX_obj,image)
        love.graphics.setColor(1,1,1,1)
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_back_table"],VFX_obj)

    -- partical
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    VFX_obj["life"] = 30
    VFX_obj[1] = obj_camera["3d_pos_x"] + obj_camera["enclose_position_offset"][1] - 900
    VFX_obj[2] = obj_camera["3d_pos_y"] + obj_camera["enclose_position_offset"][2] - 550
    VFX_obj[3] = 0
    VFX_obj[4] = 1
    VFX_obj[5] = 1
    VFX_obj[6] = 1
    VFX_obj[7] = 0
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    for i=0,29 do
        VFX_obj["animation"][i] = i
    end
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 30
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
        VFX_obj[1] = obj_camera["3d_pos_x"] + obj_camera["enclose_position_offset"][1] - 900
        VFX_obj[2] = obj_camera["3d_pos_y"] + obj_camera["enclose_position_offset"][2] - 550
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_partical_ver1_counter
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_block_blast_attack_socket_ver0(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}

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

    VFX_obj["life"] = 11
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][3] = 2
    VFX_obj["animation"][6] = 3
    VFX_obj["animation"][8] = 4
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 11
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
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

        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*sx
        VFX_obj[6] = active_op_side_obj_char[6]*sy
        VFX_obj[7] = center_r
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_block_blast_attack_socket_ver1(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}

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

    VFX_obj["life"] = 16
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity*0.75
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][2] = 2
    VFX_obj["animation"][4] = 3
    VFX_obj["animation"][7] = 4
    VFX_obj["animation"][10] = 5
    VFX_obj["animation"][13] = 6
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 16
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
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

        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x)
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y)
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*sx
        VFX_obj[6] = active_op_side_obj_char[6]*sy
        VFX_obj[7] = center_r
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)

    -- air_blow
    local VFX_obj = {0,0,0,1,1,1,0,0}
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

    VFX_obj["life"] = 16
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][2] = 2
    VFX_obj["animation"][3] = 3
    VFX_obj["animation"][4] = 4
    VFX_obj["animation"][6] = 5
    VFX_obj["animation"][8] = 6
    VFX_obj["animation"][10] = 7
    VFX_obj["animation"][11] = 8
    VFX_obj["animation"][12] = 9
    VFX_obj["animation"][15] = 10
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 16
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
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
        
        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(center_x) + rot_dx
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(center_y) + rot_dy
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*sx
        VFX_obj[6] = active_op_side_obj_char[6]*sy
        VFX_obj[7] = center_r
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end

function insert_VFX_game_scene_char_blast_dynamic_ver0(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}

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

    VFX_obj["life"] = 11
    VFX_obj[1] = center_x
    VFX_obj[2] = center_y
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][3] = 2
    VFX_obj["animation"][6] = 3
    VFX_obj["animation"][8] = 4
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 11
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_blast_dynamic_ver1(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}

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

    VFX_obj["life"] = 16
    VFX_obj[1] = center_x
    VFX_obj[2] = center_y
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity*0.75
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][2] = 2
    VFX_obj["animation"][4] = 3
    VFX_obj["animation"][7] = 4
    VFX_obj["animation"][10] = 5
    VFX_obj["animation"][13] = 6
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 16
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)

    -- air_blow
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local center_x = hit_VFX_dynamic_spawn_pos[1]
    local center_y = hit_VFX_dynamic_spawn_pos[2]
    local center_r = active_op_side_obj_char[5]*r
    local sub_dx = -50*sx
    local sub_dy = -200*sy
    local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
    local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)
    center_x = center_x - 300*sx*active_op_side_obj_char[5]
    center_y = center_y - 300*sy*active_op_side_obj_char[6]

    VFX_obj["life"] = 16
    VFX_obj[1] = center_x + rot_dx
    VFX_obj[2] = center_y + rot_dy
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][2] = 2
    VFX_obj["animation"][3] = 3
    VFX_obj["animation"][4] = 4
    VFX_obj["animation"][6] = 5
    VFX_obj["animation"][8] = 6
    VFX_obj["animation"][10] = 7
    VFX_obj["animation"][11] = 8
    VFX_obj["animation"][12] = 9
    VFX_obj["animation"][15] = 10
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 16
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()        
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_counter_blast_dynamic_ver0(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}

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

    VFX_obj["life"] = 27
    VFX_obj[1] = center_x
    VFX_obj[2] = center_y
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][2] = 1
    VFX_obj["animation"][4] = 2
    VFX_obj["animation"][6] = 3
    VFX_obj["animation"][8] = 4
    VFX_obj["animation"][10] = 5
    VFX_obj["animation"][11] = 6
    VFX_obj["animation"][12] = 7
    VFX_obj["animation"][13] = 8
    VFX_obj["animation"][14] = 9
    VFX_obj["animation"][16] = 10
    VFX_obj["animation"][18] = 11
    VFX_obj["animation"][21] = 12
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 27
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0_counter
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_counter_blast_dynamic_ver1(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}

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

    VFX_obj["life"] = 16
    VFX_obj[1] = center_x
    VFX_obj[2] = center_y
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity*0.85
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][2] = 2
    VFX_obj["animation"][4] = 3
    VFX_obj["animation"][7] = 4
    VFX_obj["animation"][10] = 5
    VFX_obj["animation"][13] = 6
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 16
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)

    -- air_blow
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local sub_dx = -50*sx
    local sub_dy = -200*sy
    local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
    local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)

    VFX_obj["life"] = 16
    VFX_obj[1] = center_x + rot_dx
    VFX_obj[2] = center_y + rot_dy
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][2] = 2
    VFX_obj["animation"][3] = 3
    VFX_obj["animation"][4] = 4
    VFX_obj["animation"][6] = 5
    VFX_obj["animation"][8] = 6
    VFX_obj["animation"][10] = 7
    VFX_obj["animation"][11] = 8
    VFX_obj["animation"][12] = 9
    VFX_obj["animation"][15] = 10
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 16
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()        
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
    
    -- counter_glow
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local sub_dx = 45*sx
    local sub_dy = 30*sy
    local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
    local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)

    VFX_obj["life"] = 5
    VFX_obj[1] = center_x + rot_dx
    VFX_obj[2] = center_y + rot_dy
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity*0.65
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["opacity_point_linear_animation"] = {}
    VFX_obj["opacity_point_linear_animation"][0] = {0.9*opacity,5}
    VFX_obj["opacity_point_linear_animation"][5] = {0,5}
    VFX_obj["opacity_point_linear_animation"]["prop"] = 4
    VFX_obj["opacity_point_linear_animation"]["length"] = 5
    VFX_obj["opacity_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(VFX_obj,VFX_obj["opacity_point_linear_animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            point_linear_animator(VFX_obj,VFX_obj["opacity_point_linear_animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image = image_VFX_game_scene_counter_glow
        VFX_obj["draw_sync"]()
        love.graphics.setBlendMode("add")
        love.graphics.setColor(1,1,1,VFX_obj[4])
        draw_3d_image(obj_camera,VFX_obj,image)
        love.graphics.setColor(1,1,1,1)
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_back_table"],VFX_obj)

    -- partical
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    VFX_obj["life"] = 30
    VFX_obj[1] = obj_camera["3d_pos_x"] + obj_camera["enclose_position_offset"][1] - 900
    VFX_obj[2] = obj_camera["3d_pos_y"] + obj_camera["enclose_position_offset"][2] - 550
    VFX_obj[3] = 0
    VFX_obj[4] = 1
    VFX_obj[5] = 1
    VFX_obj[6] = 1
    VFX_obj[7] = 0
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    for i=0,29 do
        VFX_obj["animation"][i] = i
    end
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 30
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
        VFX_obj[1] = obj_camera["3d_pos_x"] + obj_camera["enclose_position_offset"][1] - 900
        VFX_obj[2] = obj_camera["3d_pos_y"] + obj_camera["enclose_position_offset"][2] - 550
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_partical_ver1_counter
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_block_blast_dynamic_ver0(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}

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

    VFX_obj["life"] = 11
    VFX_obj[1] = center_x
    VFX_obj[2] = center_y
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][3] = 2
    VFX_obj["animation"][6] = 3
    VFX_obj["animation"][8] = 4
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 11
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_block_blast_dynamic_ver1(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}

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

    VFX_obj["life"] = 16
    VFX_obj[1] = center_x
    VFX_obj[2] = center_y
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity*0.75
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][2] = 2
    VFX_obj["animation"][4] = 3
    VFX_obj["animation"][7] = 4
    VFX_obj["animation"][10] = 5
    VFX_obj["animation"][13] = 6
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 16
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)

    -- air_blow
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local center_x = hit_VFX_dynamic_spawn_pos[1]
    local center_y = hit_VFX_dynamic_spawn_pos[2]
    local center_r = active_op_side_obj_char[5]*r
    local sub_dx = -50*sx
    local sub_dy = -200*sy
    local rot_dx = sub_dx * active_op_side_obj_char[5] * math.cos(center_r) - sub_dy * active_op_side_obj_char[6] * math.sin(center_r)
    local rot_dy = sub_dx * active_op_side_obj_char[5] * math.sin(center_r) + sub_dy * active_op_side_obj_char[6] * math.cos(center_r)
    center_x = center_x - 300*sx*active_op_side_obj_char[5]
    center_y = center_y - 300*sy*active_op_side_obj_char[6]

    VFX_obj["life"] = 16
    VFX_obj[1] = center_x + rot_dx
    VFX_obj[2] = center_y + rot_dy
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = center_r
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][2] = 2
    VFX_obj["animation"][3] = 3
    VFX_obj["animation"][4] = 4
    VFX_obj["animation"][6] = 5
    VFX_obj["animation"][8] = 6
    VFX_obj["animation"][10] = 7
    VFX_obj["animation"][11] = 8
    VFX_obj["animation"][12] = 9
    VFX_obj["animation"][15] = 10
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 16
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()        
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end

function insert_VFX_game_scene_char_blast_special(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
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

    VFX_obj["life"] = 27
    VFX_obj["r_cache"] = r_table_cache
    VFX_obj["x_table"] = obj_x_table
    VFX_obj["y_table"] = obj_y_table
    VFX_obj["center_table"] = obj_center

    -- x y z opacity sx sy r f
    VFX_obj["sub_obj"] = {
        [1] = {obj_x_table[1],obj_y_table[1],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[1],0},
        [2] = {obj_x_table[2],obj_y_table[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[2],0},
        [3] = {obj_x_table[3],obj_y_table[3],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[3],0},
        [4] = {obj_x_table[4],obj_y_table[4],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[4],0},
        [5] = {obj_center[1],obj_center[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],0,0},
    }

    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][7] = 1
    VFX_obj["animation"][10] = 2
    VFX_obj["animation"][14] = 3
    VFX_obj["animation"][17] = 4
    VFX_obj["animation"][20] = 5
    VFX_obj["animation"][23] = 6
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 27
    VFX_obj["animation"]["loop"] = false
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
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

        VFX_obj["r_cache"] = r_table_cache
        VFX_obj["x_table"] = obj_x_table
        VFX_obj["y_table"] = obj_y_table
        VFX_obj["center_table"] = obj_center

        VFX_obj["sub_obj"] = {
            [1] = {obj_x_table[1],obj_y_table[1],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[1],0},
            [2] = {obj_x_table[2],obj_y_table[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[2],0},
            [3] = {obj_x_table[3],obj_y_table[3],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[3],0},
            [4] = {obj_x_table[4],obj_y_table[4],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[4],0},
            [5] = {obj_center[1],obj_center[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],0,0},
        }
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_special_lighting_0
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj["sub_obj"][1],image_sprite_sheet,""..VFX_obj[8].."")
        draw_3d_image_sprite_batch(obj_camera,VFX_obj["sub_obj"][3],image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_special_lighting_1
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj["sub_obj"][2],image_sprite_sheet,""..VFX_obj[8].."")
        draw_3d_image_sprite_batch(obj_camera,VFX_obj["sub_obj"][4],image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_special_radial
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj["sub_obj"][5],image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_hit_back_table"],VFX_obj)
end
function insert_VFX_game_scene_char_counter_blast_special(active_op_side_obj_char,passive_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
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

    VFX_obj["life"] = 27
    VFX_obj["r_cache"] = r_table_cache
    VFX_obj["x_table"] = obj_x_table
    VFX_obj["y_table"] = obj_y_table
    VFX_obj["center_table"] = obj_center

    -- x y z opacity sx sy r f
    VFX_obj["sub_obj"] = {
        [1] = {obj_x_table[1],obj_y_table[1],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[1],0},
        [2] = {obj_x_table[2],obj_y_table[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[2],0},
        [3] = {obj_x_table[3],obj_y_table[3],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[3],0},
        [4] = {obj_x_table[4],obj_y_table[4],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[4],0},
        [5] = {obj_center[1],obj_center[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],0,0},
    }

    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][7] = 1
    VFX_obj["animation"][10] = 2
    VFX_obj["animation"][14] = 3
    VFX_obj["animation"][17] = 4
    VFX_obj["animation"][20] = 5
    VFX_obj["animation"][23] = 6
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 27
    VFX_obj["animation"]["loop"] = false
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
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

        VFX_obj["r_cache"] = r_table_cache
        VFX_obj["x_table"] = obj_x_table
        VFX_obj["y_table"] = obj_y_table
        VFX_obj["center_table"] = obj_center

        VFX_obj["sub_obj"] = {
            [1] = {obj_x_table[1],obj_y_table[1],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[1],0},
            [2] = {obj_x_table[2],obj_y_table[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[2],0},
            [3] = {obj_x_table[3],obj_y_table[3],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[3],0},
            [4] = {obj_x_table[4],obj_y_table[4],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],r_table_cache[4],0},
            [5] = {obj_center[1],obj_center[2],active_op_side_obj_char[3],1,active_op_side_obj_char[5],active_op_side_obj_char[6],0,0},
        }
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_special_lighting_0
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj["sub_obj"][1],image_sprite_sheet,""..VFX_obj[8].."")
        draw_3d_image_sprite_batch(obj_camera,VFX_obj["sub_obj"][3],image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_special_lighting_1
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj["sub_obj"][2],image_sprite_sheet,""..VFX_obj[8].."")
        draw_3d_image_sprite_batch(obj_camera,VFX_obj["sub_obj"][4],image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_special_radial
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj["sub_obj"][5],image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_hit_back_table"],VFX_obj)

    -- partical
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    VFX_obj["life"] = 30
    VFX_obj[1] = obj_camera["3d_pos_x"] + obj_camera["enclose_position_offset"][1] - 900
    VFX_obj[2] = obj_camera["3d_pos_y"] + obj_camera["enclose_position_offset"][2] - 550
    VFX_obj[3] = 0
    VFX_obj[4] = 1
    VFX_obj[5] = 1
    VFX_obj[6] = 1
    VFX_obj[7] = 0
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    for i=0,29 do
        VFX_obj["animation"][i] = i
    end
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 30
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        if active_op_side_obj_char["state"] ~= "hitstop" or passive_op_side_obj_char["state_cache"] == "wallstick" then
            frame_animator(VFX_obj,VFX_obj["animation"])
            VFX_obj["life"] = VFX_obj["life"] - 1
        end
    end
    VFX_obj["draw_sync"] = function()
        VFX_obj[1] = obj_camera["3d_pos_x"] + obj_camera["enclose_position_offset"][1] - 900
        VFX_obj[2] = obj_camera["3d_pos_y"] + obj_camera["enclose_position_offset"][2] - 550
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_partical_ver1_counter
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end

function insert_VFX_game_scene_char_block_ver0(active_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local VFX_spawn_anchor = common_game_scene_get_VFX_spawn_anchor(active_op_side_obj_char["player_side"])["block_ver0_spawn_anchor_pos"][active_op_side_obj_char["sprite_sheet"]]
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}

    VFX_obj["life"] = 21
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = 0.75
    VFX_obj[5] = active_op_side_obj_char[5]
    VFX_obj[6] = active_op_side_obj_char[6]
    VFX_obj[7] = 0
    VFX_obj[8] = 0
    VFX_obj["f"] = -1
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][10] = 1
    VFX_obj["animation"][12] = 2
    VFX_obj["animation"][16] = 3
    VFX_obj["animation"][18] = 4
    VFX_obj["animation"][21] = 4
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 21
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["update"] = function()
        frame_animator(VFX_obj,VFX_obj["animation"])
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
        VFX_obj[5] = active_op_side_obj_char[5]
        VFX_obj[6] = active_op_side_obj_char[6]
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_block_ver0
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_block_ver1(active_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local VFX_spawn_anchor = common_game_scene_get_VFX_spawn_anchor(active_op_side_obj_char["player_side"])["block_ver1_spawn_anchor_pos"][active_op_side_obj_char["sprite_sheet"]]
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}

    VFX_obj["life"] = 31
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = 0.75
    VFX_obj[5] = active_op_side_obj_char[5]
    VFX_obj[6] = active_op_side_obj_char[6]
    VFX_obj[7] = 0
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][12] = 1
    VFX_obj["animation"][14] = 2
    VFX_obj["animation"][17] = 3
    VFX_obj["animation"][20] = 4
    VFX_obj["animation"][23] = 5
    VFX_obj["animation"][27] = 6
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 31
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
    VFX_obj["update"] = function()
        frame_animator(VFX_obj,VFX_obj["animation"])
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
        VFX_obj[5] = active_op_side_obj_char[5]
        VFX_obj[6] = active_op_side_obj_char[6]
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_block_ver1
        VFX_obj["draw_sync"]()
        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_block_RC(active_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local VFX_spawn_anchor = common_game_scene_get_VFX_spawn_anchor(active_op_side_obj_char["player_side"])["block_ver1_spawn_anchor_pos"][active_op_side_obj_char["sprite_sheet"]]
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}

    VFX_obj["life"] = 18
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = 0.75
    VFX_obj[5] = active_op_side_obj_char[5]
    VFX_obj[6] = active_op_side_obj_char[6]
    VFX_obj[7] = 0
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][1] = 1
    VFX_obj["animation"][3] = 2
    VFX_obj["animation"][5] = 3
    VFX_obj["animation"][8] = 4
    VFX_obj["animation"][11] = 5
    VFX_obj["animation"][14] = 6
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 18
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
    VFX_obj["update"] = function()
        frame_animator(VFX_obj,VFX_obj["animation"])
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
        VFX_obj[5] = active_op_side_obj_char[5]
        VFX_obj[6] = active_op_side_obj_char[6]
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_block_ver1
        VFX_obj["draw_sync"]()
        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(VFX_spawn_anchor[1])
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(VFX_spawn_anchor[2])
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_FD_block(active_op_side_obj_char)
    local VFX_obj = {0,0,0,1,1,1,0,0}
    local FD_VFX_spawn_anchor_table = common_game_scene_get_VFX_spawn_anchor(active_op_side_obj_char["player_side"])["FD_block_spawn_anchor_pos"]
    local FD_VFX_spawn_anchor = FD_VFX_spawn_anchor_table[active_op_side_obj_char["height"]]

    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}

    VFX_obj["life"] = 35
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(FD_VFX_spawn_anchor[1])
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(FD_VFX_spawn_anchor[2])
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = 0
    VFX_obj[5] = active_op_side_obj_char[5]
    VFX_obj[6] = active_op_side_obj_char[6]
    VFX_obj[7] = 0
    VFX_obj[8] = 0
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["animation"] = {}
    VFX_obj["animation"][0] = 0
    VFX_obj["animation"][12] = 1
    VFX_obj["animation"][14] = 2
    VFX_obj["animation"][17] = 3
    VFX_obj["animation"][20] = 4
    VFX_obj["animation"][23] = 5
    VFX_obj["animation"][27] = 6
    VFX_obj["animation"][31] = 7
    VFX_obj["animation"]["prop"] = 8
    VFX_obj["animation"]["length"] = 35
    VFX_obj["animation"]["loop"] = false
    init_frame_anim_without(VFX_obj,VFX_obj["animation"])
    VFX_obj["opacity_point_linear_animation"] = {}
    VFX_obj["opacity_point_linear_animation"][0] = {0.75,15}
    VFX_obj["opacity_point_linear_animation"][15] = {0.9,25}
    VFX_obj["opacity_point_linear_animation"][25] = {0.9,35}
    VFX_obj["opacity_point_linear_animation"][35] = {0,35}
    VFX_obj["opacity_point_linear_animation"]["prop"] = 4
    VFX_obj["opacity_point_linear_animation"]["length"] = 35
    VFX_obj["opacity_point_linear_animation"]["loop"] = false
    VFX_obj["opacity_point_linear_animation"]["fix_type"] = true
    init_point_linear_anim_without(VFX_obj,VFX_obj["opacity_point_linear_animation"])
    VFX_obj["update"] = function()
        frame_animator(VFX_obj,VFX_obj["animation"])
        point_linear_animator(VFX_obj,VFX_obj["opacity_point_linear_animation"])
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        FD_VFX_spawn_anchor = FD_VFX_spawn_anchor_table[active_op_side_obj_char["height"]]
        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(FD_VFX_spawn_anchor[1])
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(FD_VFX_spawn_anchor[2])
        VFX_obj[5] = active_op_side_obj_char[5]
        VFX_obj[6] = active_op_side_obj_char[6]
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_block_FD
        VFX_obj["draw_sync"]()
        love.graphics.setColor(1,1,1,VFX_obj[4])
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        draw_3d_image(obj_camera,VFX_obj,image_VFX_game_scene_FD_bubble)
        love.graphics.setBlendMode("alpha")
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(active_op_side_obj_char["VFX_hit_front_table"],VFX_obj)
end
function insert_VFX_game_scene_char_throw_tech(active_op_side_obj_char,passive_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
    active_op_side_obj_char["VFX_hit_front_table"] = {}
    active_op_side_obj_char["VFX_hit_back_table"] = {}
    passive_op_side_obj_char["VFX_hit_front_table"] = {}
    passive_op_side_obj_char["VFX_hit_back_table"] = {}

    VFX_obj["life"] = 20
    VFX_obj[1] = (active_op_side_obj_char["x"] + passive_op_side_obj_char["x"])/2 + active_op_side_obj_char[5]*(x)
    VFX_obj[2] = (active_op_side_obj_char["y"] + passive_op_side_obj_char["y"])/2 + active_op_side_obj_char[6]*(y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = r
    VFX_obj[8] = 0
    VFX_obj["f"] = -1
    VFX_obj["update"] = function()
        VFX_obj["f"] = VFX_obj["f"] + 1
        if VFX_obj["f"] >= 2 then
            VFX_obj[8] = math.min(VFX_obj[8] + 1,24)
            VFX_obj["f"] = 0
        end
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        VFX_obj[1] = (active_op_side_obj_char["x"] + passive_op_side_obj_char["x"])/2 + active_op_side_obj_char[5]*(x)
        VFX_obj[2] = (active_op_side_obj_char["y"] + passive_op_side_obj_char["y"])/2 + active_op_side_obj_char[6]*(y)
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*sx
        VFX_obj[6] = active_op_side_obj_char[6]*sy
        VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_throw_tech
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_hit_back_table"],VFX_obj)
end

-- smoke
function insert_VFX_game_scene_stage_smoke_dash_shot(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
    VFX_obj["life"] = 30
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x-math.random()*150)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = r
    VFX_obj[8] = math.random(5)
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["opacity_point_linear_animation"] = {}
    VFX_obj["opacity_point_linear_animation"][0] = {1*opacity,30}
    VFX_obj["opacity_point_linear_animation"][30] = {0,30}
    VFX_obj["opacity_point_linear_animation"]["prop"] = 4
    VFX_obj["opacity_point_linear_animation"]["length"] = 30
    VFX_obj["opacity_point_linear_animation"]["loop"] = false
    init_point_linear_anim_without(VFX_obj,VFX_obj["opacity_point_linear_animation"])
    VFX_obj["f"] = -1
    VFX_obj["update"] = function()
        point_linear_animator(VFX_obj,VFX_obj["opacity_point_linear_animation"])
        VFX_obj["f"] = VFX_obj["f"] + 1
        if VFX_obj["f"] >= 3 then
            VFX_obj[8] = math.min(VFX_obj[8] + 1,24)
            if VFX_obj[8] == 6 then
                VFX_obj[8] = 0
            end
            VFX_obj["f"] = 0
        end
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        -- VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x-math.random()*150)
        -- VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
        -- VFX_obj[3] = active_op_side_obj_char[3]
        -- VFX_obj[5] = active_op_side_obj_char[5]*sx
        -- VFX_obj[6] = active_op_side_obj_char[6]*sy
        -- VFX_obj[8] = math.random(5)
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_dash_shot
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_front_table"],VFX_obj)
end
function insert_VFX_game_scene_stage_smoke_horizontal_shot(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
    VFX_obj["life"] = 75
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = r
    VFX_obj[8] = 0
    VFX_obj["f"] = -1
    VFX_obj["update"] = function()
        VFX_obj["f"] = VFX_obj["f"] + 1
        if VFX_obj["f"] >= 3 then
            VFX_obj[8] = math.min(VFX_obj[8] + 1,24)
            VFX_obj["f"] = 0
        end
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        -- VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
        -- VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
        -- VFX_obj[3] = active_op_side_obj_char[3]
        -- VFX_obj[5] = active_op_side_obj_char[5]*sx
        -- VFX_obj[6] = active_op_side_obj_char[6]*sy
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_horizontal_shot
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],VFX_obj)
end
function insert_VFX_game_scene_stage_smoke_land_blow(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
    VFX_obj["life"] = 63
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = r
    VFX_obj[8] = 0
    VFX_obj["f"] = -1
    VFX_obj["update"] = function()
        VFX_obj["f"] = VFX_obj["f"] + 1
        if VFX_obj["f"] >= 3 then
            VFX_obj[8] = math.min(VFX_obj[8] + 1,20)
            VFX_obj["f"] = 0
        end
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        -- VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
        -- VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
        -- VFX_obj[3] = active_op_side_obj_char[3]
        -- VFX_obj[5] = active_op_side_obj_char[5]*sx
        -- VFX_obj[6] = active_op_side_obj_char[6]*sy
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_land_blow
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],VFX_obj)
end
function insert_VFX_game_scene_stage_smoke_vertical_shot(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
    VFX_obj["life"] = 72
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = r
    VFX_obj[8] = 0
    VFX_obj["f"] = -1
    VFX_obj["update"] = function()
        VFX_obj["f"] = VFX_obj["f"] + 1
        if VFX_obj["f"] >= 2 then
            VFX_obj[8] = math.min(VFX_obj[8] + 1,17)
            VFX_obj["f"] = 0
        end
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        -- VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
        -- VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
        -- VFX_obj[3] = active_op_side_obj_char[3]
        -- VFX_obj[5] = active_op_side_obj_char[5]*sx
        -- VFX_obj[6] = active_op_side_obj_char[6]*sy
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_vertical_shot
        image_sprite_sheet["sprite_batch"]:clear()
        VFX_obj["draw_sync"]()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],VFX_obj)
end

-- shockwave
function insert_VFX_game_scene_stage_4dash_air_backdash_shockwave(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
    VFX_obj["life"] = 26
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = r
    VFX_obj[8] = 0
    VFX_obj["f"] = -1
    VFX_obj["update"] = function()
        VFX_obj["f"] = VFX_obj["f"] + 1
        if VFX_obj["f"] >= 2 then
            VFX_obj[8] = math.min(VFX_obj[8] + 1,12)
            VFX_obj["f"] = 0
        end
        VFX_obj["life"] = VFX_obj["life"] - 1
        if active_op_side_obj_char["state"] == "burst_RC_blue" then
            VFX_obj["life"] = 0
        end
    end
    VFX_obj["draw_sync"] = function()
        -- VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
        -- VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
        -- VFX_obj[3] = active_op_side_obj_char[3]
        -- VFX_obj[5] = active_op_side_obj_char[5]*sx
        -- VFX_obj[6] = active_op_side_obj_char[6]*sy
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_dash_shockwave
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],VFX_obj)
end
function insert_VFX_game_scene_stage_6dash_air_dash_shockwave(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
    VFX_obj["life"] = 26
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = r
    VFX_obj[8] = 0
    VFX_obj["f"] = -1
    VFX_obj["update"] = function()
        VFX_obj["f"] = VFX_obj["f"] + 1
        if VFX_obj["f"] >= 2 then
            VFX_obj[8] = math.min(VFX_obj[8]+1,12)
            VFX_obj["f"] = 0
        end
        VFX_obj[1] = VFX_obj[1] - 0.2*VFX_obj[5]
        VFX_obj["life"] = VFX_obj["life"] - 1
        if active_op_side_obj_char["state"] == "burst_RC_blue" then
            VFX_obj["life"] = 0
        end
    end
    VFX_obj["draw_sync"] = function()
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_dash_shockwave
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],VFX_obj)
end

-- burst
function insert_VFX_game_scne_stage_dash_cancel_blow(active_op_side_obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
    VFX_obj["life"] = 36
    VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
    VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
    VFX_obj[3] = active_op_side_obj_char[3]
    VFX_obj[4] = opacity
    VFX_obj[5] = active_op_side_obj_char[5]*sx
    VFX_obj[6] = active_op_side_obj_char[6]*sy
    VFX_obj[7] = r
    VFX_obj[8] = 0
    VFX_obj["f"] = -1
    VFX_obj["update"] = function()
        VFX_obj["f"] = VFX_obj["f"] + 1
        if VFX_obj["f"] >= 2 then
            VFX_obj[8] = math.min(VFX_obj[8]+1,9)
            VFX_obj["f"] = 0
        end
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        VFX_obj[1] = active_op_side_obj_char["x"] + active_op_side_obj_char[5]*(x)
        VFX_obj[2] = active_op_side_obj_char["y"] + active_op_side_obj_char[6]*(y)
        VFX_obj[3] = active_op_side_obj_char[3]
        VFX_obj[5] = active_op_side_obj_char[5]*sx
        VFX_obj[6] = active_op_side_obj_char[6]*sy
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_dcc_blow
        VFX_obj["draw_sync"]()
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,VFX_obj,image_sprite_sheet,""..VFX_obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(active_op_side_obj_char["VFX_common_back_table"],VFX_obj)
end
-- GP
function insert_VFX_game_scene_char_GP(active_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,1,1,1,0,0}
    VFX_obj["life"] = 42
    VFX_obj["update"] = function()
        VFX_obj["life"] = 42
        if active_op_side_obj_char["state"] ~= "hurtstop" then
            VFX_obj["life"] = 0
        end
    end
    VFX_obj["draw_sync"] = function()
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        local opacity_cache = active_op_side_obj_char[4]
        local contrast_cache = active_op_side_obj_char["contrast"]
        local brightness_cache = active_op_side_obj_char["brightness"]
        local side_table = {
            ["L"] = draw_game_scene_char_LP,
            ["R"] = draw_game_scene_char_RP
        }
        -- VFX_obj["draw_sync"]()
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
    table.insert(active_op_side_obj_char["VFX_common_back_table"],VFX_obj)
end

-- HUD
function insert_VFX_HUD_game_scene_counter_ver0_2(active_op_side_obj_char)
    local VFX_obj = {0,0,0,0,0.75,0.65,0,0}
    local side = active_op_side_obj_char["player_side"]
    local side_table = {
        ["L"] = 165,
        ["R"] = 1314
    }
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["image"] = image_VFX_game_scene_HUD_counter_ver0_2
    VFX_obj["life"] = 70

    VFX_obj[1] = side_table[side]
    VFX_obj[2] = 35

-- y_anim
    VFX_obj["y_anim"] = {}
    VFX_obj["y_anim"][0] = {0.00,1}
    VFX_obj["y_anim"][1] = {3.00,2}
    VFX_obj["y_anim"][2] = {-2.00,3}
    VFX_obj["y_anim"][3] = {1.00,5}
    VFX_obj["y_anim"][5] = {0.00,35}
    VFX_obj["y_anim"][35] = {0.00,40}
    VFX_obj["y_anim"][40] = {0.07,45}
    VFX_obj["y_anim"][45] = {0.45,47}
    VFX_obj["y_anim"][47] = {0.85,49}
    VFX_obj["y_anim"][49] = {1.87,50}
    VFX_obj["y_anim"][50] = {4.00,50}
    VFX_obj["y_anim"]["prop"] = 2
    VFX_obj["y_anim"]["length"] = 50
    VFX_obj["y_anim"]["loop"] = false
    VFX_obj["y_anim"]["fix_type"] = false
-- opacity_anim
    VFX_obj["opacity_anim"] = {}
    VFX_obj["opacity_anim"][0] = {0.00,1}
    VFX_obj["opacity_anim"][1] = {0.87,2}
    VFX_obj["opacity_anim"][2] = {1.00,5}
    VFX_obj["opacity_anim"][5] = {1.00,15}
    VFX_obj["opacity_anim"][15] = {0.99,25}
    VFX_obj["opacity_anim"][25] = {0.95,35}
    VFX_obj["opacity_anim"][35] = {0.84,40}
    VFX_obj["opacity_anim"][40] = {0.75,45}
    VFX_obj["opacity_anim"][45] = {0.57,47}
    VFX_obj["opacity_anim"][47] = {0.45,49}
    VFX_obj["opacity_anim"][49] = {0.25,50}
    VFX_obj["opacity_anim"][50] = {0.00,50}
    VFX_obj["opacity_anim"]["prop"] = 4
    VFX_obj["opacity_anim"]["length"] = 50
    VFX_obj["opacity_anim"]["loop"] = false
    VFX_obj["opacity_anim"]["fix_type"] = true
-- update
    VFX_obj["update"] = function()
        point_linear_animator(VFX_obj,VFX_obj["y_anim"])
        point_linear_animator(VFX_obj,VFX_obj["opacity_anim"])
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        -- VFX_obj["draw_sync"]()
        draw_2d_image(VFX_obj,VFX_obj["image"])
    end
    active_op_side_obj_char["VFX_HUD_table"] = {}
    table.insert(active_op_side_obj_char["VFX_HUD_table"],VFX_obj)
end
function insert_VFX_HUD_game_scene_counter_ver3(active_op_side_obj_char)
    -- x y z opacity sx sy r f
    local VFX_obj = {0,0,0,0,1,1,0,0}
    VFX_obj["x"] = 800
    VFX_obj["y"] = 600
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"]["y"] = 0
    VFX_obj["LCD"]["y"] = 0
    VFX_obj["image"] = image_VFX_game_scene_HUD_counter_ver3
    VFX_obj["life"] = 40
    VFX_obj[1] = VFX_obj["x"] - VFX_obj[5]*(600)
    VFX_obj[2] = VFX_obj["y"] - VFX_obj[6]*(200)

-- sx_anim
    VFX_obj["sx_anim"] = {}
    VFX_obj["sx_anim"][0] = {1.000,1}
    VFX_obj["sx_anim"][1] = {1.134,2}
    VFX_obj["sx_anim"][2] = {1.176,3}
    VFX_obj["sx_anim"][3] = {1.199,4}
    VFX_obj["sx_anim"][4] = {1.213,5}
    VFX_obj["sx_anim"][5] = {1.220,7}
    VFX_obj["sx_anim"][7] = {1.228,9}
    VFX_obj["sx_anim"][9] = {1.234,10}
    VFX_obj["sx_anim"][10] = {1.236,12}
    VFX_obj["sx_anim"][12] = {1.240,14}
    VFX_obj["sx_anim"][14] = {1.245,16}
    VFX_obj["sx_anim"][16] = {1.246,18}
    VFX_obj["sx_anim"][18] = {1.247,20}
    VFX_obj["sx_anim"][20] = {1.248,25}
    VFX_obj["sx_anim"][25] = {1.249,30}
    VFX_obj["sx_anim"][30] = {1.250,32}
    VFX_obj["sx_anim"][32] = {1.251,33}
    VFX_obj["sx_anim"][33] = {1.252,34}
    VFX_obj["sx_anim"][34] = {1.253,35}
    VFX_obj["sx_anim"][35] = {1.256,36}
    VFX_obj["sx_anim"][36] = {1.258,37}
    VFX_obj["sx_anim"][37] = {1.263,38}
    VFX_obj["sx_anim"][38] = {1.270,39}
    VFX_obj["sx_anim"][39] = {1.281,40}
    VFX_obj["sx_anim"][40] = {1.300,40}
    VFX_obj["sx_anim"]["prop"] = 5
    VFX_obj["sx_anim"]["length"] = 40
    VFX_obj["sx_anim"]["loop"] = false
    VFX_obj["sx_anim"]["fix_type"] = true
-- y_anim
    VFX_obj["y_anim"] = {}
    VFX_obj["y_anim"][0] = {600.00,1}
    VFX_obj["y_anim"][1] = {584.41,2}
    VFX_obj["y_anim"][2] = {575.88,3}
    VFX_obj["y_anim"][3] = {571.29,4}
    VFX_obj["y_anim"][4] = {568.60,5}
    VFX_obj["y_anim"][5] = {567.10,7}
    VFX_obj["y_anim"][7] = {565.20,9}
    VFX_obj["y_anim"][9] = {563.69,11}
    VFX_obj["y_anim"][11] = {562.51,14}
    VFX_obj["y_anim"][14] = {561.24,16}
    VFX_obj["y_anim"][16] = {560.69,20}
    VFX_obj["y_anim"][20] = {560.00,30}
    VFX_obj["y_anim"][30] = {560.00,40}
    VFX_obj["y_anim"][40] = {560.00,40}
    VFX_obj["y_anim"]["prop"] = "y"
    VFX_obj["y_anim"]["length"] = 40
    VFX_obj["y_anim"]["loop"] = false
    VFX_obj["y_anim"]["fix_type"] = true
-- opacity_anim
    VFX_obj["opacity_anim"] = {}
    VFX_obj["opacity_anim"][0] = {0.00,1}
    VFX_obj["opacity_anim"][1] = {0.58,2}
    VFX_obj["opacity_anim"][2] = {0.70,3}
    VFX_obj["opacity_anim"][3] = {0.77,4}
    VFX_obj["opacity_anim"][4] = {0.82,5}
    VFX_obj["opacity_anim"][5] = {0.85,6}
    VFX_obj["opacity_anim"][6] = {0.88,7}
    VFX_obj["opacity_anim"][7] = {0.90,9}
    VFX_obj["opacity_anim"][9] = {0.93,11}
    VFX_obj["opacity_anim"][11] = {0.95,13}
    VFX_obj["opacity_anim"][13] = {0.97,15}
    VFX_obj["opacity_anim"][15] = {0.98,20}
    VFX_obj["opacity_anim"][20] = {0.99,30}
    VFX_obj["opacity_anim"][30] = {1.00,31}
    VFX_obj["opacity_anim"][31] = {1.00,32}
    VFX_obj["opacity_anim"][32] = {0.99,33}
    VFX_obj["opacity_anim"][33] = {0.96,34}
    VFX_obj["opacity_anim"][34] = {0.93,35}
    VFX_obj["opacity_anim"][35] = {0.89,36}
    VFX_obj["opacity_anim"][36] = {0.82,37}
    VFX_obj["opacity_anim"][37] = {0.73,38}
    VFX_obj["opacity_anim"][38] = {0.60,39}
    VFX_obj["opacity_anim"][39] = {0.38,40}
    VFX_obj["opacity_anim"][40] = {0.00,40}
    VFX_obj["opacity_anim"]["prop"] = 4
    VFX_obj["opacity_anim"]["length"] = 40
    VFX_obj["opacity_anim"]["loop"] = false
    VFX_obj["opacity_anim"]["fix_type"] = true
-- update
    VFX_obj["update"] = function()
        point_linear_animator(VFX_obj,VFX_obj["sx_anim"])
        point_linear_animator(VFX_obj,VFX_obj["y_anim"])
        point_linear_animator(VFX_obj,VFX_obj["opacity_anim"])
        VFX_obj[1] = VFX_obj["x"] - VFX_obj[5]*(600)
        VFX_obj[2] = VFX_obj["y"] - VFX_obj[6]*(200)
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        -- VFX_obj[1] = VFX_obj["x"] - VFX_obj[5]*(600)
        -- VFX_obj[2] = VFX_obj["y"] - VFX_obj[6]*(200)
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        -- VFX_obj["draw_sync"]()
        love.graphics.setBlendMode("add")
        draw_2d_image(VFX_obj,VFX_obj["image"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(active_op_side_obj_char["VFX_HUD_table"],VFX_obj)

-- black_overlay
    local VFX_obj = {0,0,0,0.5,0,0,0,0}
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    VFX_obj["FCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["life"] = 60
    VFX_obj["opacity_anim"] = {}
    VFX_obj["opacity_anim"][0] = {0.5,60}
    VFX_obj["opacity_anim"][60] = {0,60}
    VFX_obj["opacity_anim"]["prop"] = 4
    VFX_obj["opacity_anim"]["length"] = 60
    VFX_obj["opacity_anim"]["loop"] = false
    VFX_obj["opacity_anim"]["fix_type"] = true
    init_point_linear_anim_without(VFX_obj,VFX_obj["opacity_anim"])

    VFX_obj["update"] = function()
        point_linear_animator(VFX_obj,VFX_obj["opacity_anim"])
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        -- VFX_obj["draw_sync"]()
        love.graphics.setColor(0,0,0,VFX_obj[4])
        love.graphics.rectangle("fill",0,0,width,height)
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(active_op_side_obj_char["VFX_black_overlay_table"],VFX_obj)
end
function insert_VFX_HUD_game_scene_punish(active_op_side_obj_char)
    local VFX_obj = {0,0,0,0,0.75,0.65,0,0}
    local side = active_op_side_obj_char["player_side"]
    local side_table = {
        ["L"] = 165,
        ["R"] = 1314
    }
    VFX_obj["LCT"] = {0,0,0,0,0,0,0,0}
    VFX_obj["LCD"] = {0,0,0,0,0,0,0,0}
    VFX_obj["image"] = image_VFX_game_scene_HUD_punish
    VFX_obj["life"] = 70

    VFX_obj[1] = side_table[side]
    VFX_obj[2] = 35

-- y_anim
    VFX_obj["y_anim"] = {}
    VFX_obj["y_anim"][0] = {0.00,1}
    VFX_obj["y_anim"][1] = {3.00,2}
    VFX_obj["y_anim"][2] = {-2.00,3}
    VFX_obj["y_anim"][3] = {1.00,5}
    VFX_obj["y_anim"][5] = {0.00,35}
    VFX_obj["y_anim"][35] = {0.00,40}
    VFX_obj["y_anim"][40] = {0.07,45}
    VFX_obj["y_anim"][45] = {0.45,47}
    VFX_obj["y_anim"][47] = {0.85,49}
    VFX_obj["y_anim"][49] = {1.87,50}
    VFX_obj["y_anim"][50] = {4.00,50}
    VFX_obj["y_anim"]["prop"] = 2
    VFX_obj["y_anim"]["length"] = 50
    VFX_obj["y_anim"]["loop"] = false
    VFX_obj["y_anim"]["fix_type"] = false
-- opacity_anim
    VFX_obj["opacity_anim"] = {}
    VFX_obj["opacity_anim"][0] = {0.00,1}
    VFX_obj["opacity_anim"][1] = {0.87,2}
    VFX_obj["opacity_anim"][2] = {1.00,5}
    VFX_obj["opacity_anim"][5] = {1.00,15}
    VFX_obj["opacity_anim"][15] = {0.99,25}
    VFX_obj["opacity_anim"][25] = {0.95,35}
    VFX_obj["opacity_anim"][35] = {0.84,40}
    VFX_obj["opacity_anim"][40] = {0.75,45}
    VFX_obj["opacity_anim"][45] = {0.57,47}
    VFX_obj["opacity_anim"][47] = {0.45,49}
    VFX_obj["opacity_anim"][49] = {0.25,50}
    VFX_obj["opacity_anim"][50] = {0.00,50}
    VFX_obj["opacity_anim"]["prop"] = 4
    VFX_obj["opacity_anim"]["length"] = 50
    VFX_obj["opacity_anim"]["loop"] = false
    VFX_obj["opacity_anim"]["fix_type"] = true
-- update
    VFX_obj["update"] = function()
        point_linear_animator(VFX_obj,VFX_obj["y_anim"])
        point_linear_animator(VFX_obj,VFX_obj["opacity_anim"])
        VFX_obj["life"] = VFX_obj["life"] - 1
    end
    VFX_obj["draw_sync"] = function()
        -- VFX_obj["draw_sync"] = function() end
    end
    VFX_obj["draw"] = function()
        -- VFX_obj["draw_sync"]()
        draw_2d_image(VFX_obj,VFX_obj["image"])
    end
    active_op_side_obj_char["VFX_HUD_table"] = {}
    table.insert(active_op_side_obj_char["VFX_HUD_table"],VFX_obj)
end
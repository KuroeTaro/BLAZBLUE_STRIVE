function insert_VFX_game_scene_char_overdrive_badge(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local image_sprite_sheet = nil
    if obj_char["player_side"] == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP_overdrive_badge
    elseif obj_char["player_side"] == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP_overdrive_badge
    end 
    
    obj["life"] = 70
    obj[1] = obj_char["x"] - obj_char[5]*(500)
    obj[2] = obj_char["y"] - obj_char[6]*(865)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]*2
    obj[6] = obj_char[6]*2
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["update"] = function()
        obj[1] = obj_char["x"] - obj_char[5]*(500)
        obj[2] = obj_char["y"] - obj_char[6]*(865)
        obj[3] = obj_char[3]
        obj[4] = 1
        obj[5] = obj_char[5]*2
        obj[6] = obj_char[6]*2
        obj[7] = obj_char[7]
        obj[8] = obj[8] + 1
        obj["life"] = obj["life"] - 1
        if obj_char["state"] ~= "burst_overdrive" then
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local camera = obj_stage_game_scene_camera
        local f = obj[8]
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(camera,obj,image_sprite_sheet,""..f.."")
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_back_table"],obj)
end
function insert_VFX_game_scene_char_overdrive_airflow(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    obj["life"] = 35
    obj[1] = obj_char["x"] - obj_char[5]*(860)
    obj[2] = obj_char["y"] - obj_char[6]*(845)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]*2
    obj[6] = obj_char[6]*2
    obj[7] = obj_char[7]
    obj[8] = 0
    obj["update"] = function()
        -- obj[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- obj[2] = obj_char["y"] + obj_char[6]*(840)
        obj[1] = obj_char["x"] - obj_char[5]*(860)
        obj[2] = obj_char["y"] - obj_char[6]*(845)
        obj[3] = obj_char[3]
        obj[4] = 1
        obj[5] = obj_char[5]*2
        obj[6] = obj_char[6]*2
        obj[7] = obj_char[7]
        obj[8] = obj[8] + 1
        obj["life"] = obj["life"] - 1
        if obj_char["state"] ~= "burst_overdrive" then
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_overdrive_airflow
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
    
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_back_table"],obj)
end
function insert_VFX_game_scene_char_overdrive_partical(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    if obj_char["player_side"] == "L" then
        obj["life"] = 80
        obj[1] = obj_camera[1] - 800
        obj[2] = obj_camera[2] - 450
        obj[3] = obj_camera[3] + 800
        obj[4] = 1
        obj[5] = 1
        obj[6] = 1
        obj[7] = 0
        obj[8] = 0
        obj["f"] = 0
    elseif obj_char["player_side"] == "R" then
        obj["life"] = 80
        obj[1] = obj_camera[1] + 800
        obj[2] = obj_camera[2] - 450
        obj[3] = obj_camera[3] + 800
        obj[4] = 1
        obj[5] = -1
        obj[6] = 1
        obj[7] = 0
        obj[8] = 0
        obj["f"] = -1
    end
    obj["update"] = function()
        obj["f"] = obj["f"] + 1
        if obj["f"] >= 2 then
            obj[8] = obj[8] + 1
            obj["f"] = 0
        end
        obj["life"] = obj["life"] - 1
        if obj_char["state"] ~= "burst_overdrive" then
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_overdrive_partical
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
    
        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_back_table"],obj)
end
function insert_VFX_game_scene_char_overdrive_black_overlay(obj_char)
    local obj = {0,0,0,1,0,0,0,0}
    local obj_camera = obj_stage_game_scene_camera
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["life"] = 42
    obj[1] = obj_char["x"]
    obj[2] = obj_char["y"] - obj_char[6]*(360)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = 0
    obj[6] = 0
    obj[7] = 0
    obj[8] = 0
    obj["cood_res"] = draw_3d_point_to_2D(obj_camera,obj_char)
    obj["state"] = "ease_in"
    obj["blur_shader"] = shader_game_scene_gaussian_blur
    obj["blur_shader"]:send("Directions",16)
    obj["blur_shader"]:send("Quality",5)
    obj["blur_shader"]:send("Size",8)
    obj["blur_shader"]:send("resolution",{love.graphics.getWidth(),love.graphics.getHeight()})

    obj["opacity_ease_in_anim"] = {}
    obj["opacity_ease_in_anim"][0] = {0.00,1}
    obj["opacity_ease_in_anim"][1] = {0.04,3}
    obj["opacity_ease_in_anim"][3] = {0.08,7}
    obj["opacity_ease_in_anim"][7] = {0.14,14}
    obj["opacity_ease_in_anim"][14] = {0.18,18}
    obj["opacity_ease_in_anim"][18] = {0.20,28}
    obj["opacity_ease_in_anim"][28] = {0.22,29}
    obj["opacity_ease_in_anim"][29] = {0.36,30}
    obj["opacity_ease_in_anim"][30] = {0.44,31}
    obj["opacity_ease_in_anim"][31] = {0.48,33}
    obj["opacity_ease_in_anim"][33] = {0.50,33}
    obj["opacity_ease_in_anim"]["prop"] = 4
    obj["opacity_ease_in_anim"]["length"] = 33
    obj["opacity_ease_in_anim"]["loop"] = false
    obj["opacity_ease_in_anim"]["fix_type"] = true

    obj["opacity_ease_out_anim"] = {}
    obj["opacity_ease_out_anim"][0] = {0.50,10}
    obj["opacity_ease_out_anim"][10] = {0.00,10}
    obj["opacity_ease_out_anim"]["prop"] = 4
    obj["opacity_ease_out_anim"]["length"] = 10
    obj["opacity_ease_out_anim"]["loop"] = false
    obj["opacity_ease_out_anim"]["fix_type"] = true

    obj["size_anim"] = {}
    obj["size_anim"][0] = {200,28}
    obj["size_anim"][28] = {800,33}
    obj["size_anim"][33] = {2600,33} 
    obj["size_anim"]["prop"] = 5
    obj["size_anim"]["length"] = 33
    obj["size_anim"]["loop"] = false
    obj["size_anim"]["fix_type"] = true

    obj["draw_canvas"] = love.graphics.newCanvas(love.graphics.getWidth(),love.graphics.getHeight())

    obj["update"] = function()
        obj[1] = obj_char["x"]
        obj[2] = obj_char["y"] - obj_char[6]*(300)
        obj[3] = obj_char[3]
        obj["cood_res"] = draw_3d_point_to_2D(obj_camera,obj)

        local switch = {
            -- ease_in 之前的状态 如果达到第10帧则为下一个动画的第0帧 
            ["ease_in"] = function()
                point_linear_animator(obj,obj["size_anim"])
                point_linear_animator(obj,obj["opacity_ease_in_anim"])
                obj["life"] = 42
                if obj_char["overdrive_gauge"][3] == "off" then
                    obj["state"] = "ease_out"
                    obj["life"] = 10
                    obj[4] = 0.50
                    init_point_linear_anim_with(obj,obj["opacity_ease_out_anim"])
                end
            end,
            ["ease_out"] = function()
                point_linear_animator(obj,obj["opacity_ease_out_anim"])
                if get_point_linear_anim_end_state(obj,obj["opacity_ease_out_anim"]) then
                    obj["life"] = 0
                end
            end,
        }
        local this_function = switch[obj["state"]]
        if this_function then this_function() end

        obj["life"] = obj["life"] - 1
    end

    obj["draw"] = function()
        love.graphics.setCanvas(obj["draw_canvas"])
        love.graphics.clear(0,0,0,0)
        love.graphics.setColor(0,0,0,obj[4])
        love.graphics.circle( "fill",obj["cood_res"][1],obj["cood_res"][2],draw_resolution_correction(obj[5]) )
        love.graphics.setColor(1,1,1,1)
        love.graphics.setCanvas()

        obj["blur_shader"]:send("Directions",16)
        obj["blur_shader"]:send("Quality",5)
        obj["blur_shader"]:send("Size",8)
        obj["blur_shader"]:send("resolution",{love.graphics.getWidth(),love.graphics.getHeight()})
        love.graphics.setShader(obj["blur_shader"])
        love.graphics.draw(obj["draw_canvas"]) -- 画到屏幕上
        love.graphics.setShader()

    end
    table.insert(obj_char["black_overlay_table"],obj)
end

-- blast slash directional ray_impact
function insert_VFX_game_scene_char_blast_ver0(obj_char,x,y,opacity,sx,sy,r,fix_pos,negative_side)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    local dx = math.abs(common_game_scene_change_character(obj_char["player_side"])["x"]-obj_char["x"])-220*sx
    if not fix_pos then
        if negative_side then
            x = math.max(-dx,x)
        else
            x = math.min(dx,x)
        end
    end
    r = obj_char[5]*r
    obj_char["VFX_hit_front_table"] = {}
    obj_char["VFX_hit_back_table"] = {}

    obj["life"] = 11
    obj[1] = obj_char["x"] + obj_char[5]*(x)
    obj[2] = obj_char["y"] + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = opacity
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][1] = 1
    obj["animation"][3] = 2
    obj["animation"][6] = 3
    obj["animation"][8] = 4
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 11
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with_out(obj,obj["animation"])
    obj["update"] = function()
        obj[4] = opacity
        obj[5] = obj_char[5]*sx
        obj[6] = obj_char[6]*sy
        obj[7] = r
        if obj_char["state"] == "hitstop" then
            -- do nothing
        else
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")

        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_hit_front_table"],obj)
end
function insert_VFX_game_scene_char_blast_ver1(obj_char,x,y,opacity,sx,sy,r,fix_pos,negative_side)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    local dx = math.abs(common_game_scene_change_character(obj_char["player_side"])["x"]-obj_char["x"])-310*sx
    if not fix_pos then
        if negative_side then
            x = math.max(-dx,x)
        else
            x = math.min(dx,x)
        end
    end
    r = obj_char[5]*r
    obj_char["VFX_hit_front_table"] = {}
    obj_char["VFX_hit_back_table"] = {}

    obj["life"] = 21
    obj[1] = obj_char["x"] + obj_char[5]*(x)
    obj[2] = obj_char["y"] + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = opacity*0.75
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
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
    obj["animation"]["fix_type"] = true
    init_frame_anim_with_out(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "hitstop" then
            -- do nothing
        else
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")

        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_hit_front_table"],obj)

    -- air_blow
    local obj = {0,0,0,1,1,1,0,0}
    local dx = -100
    local dy = -200
    local rot_dx = dx * obj_char[5] * math.cos(r) - dy * obj_char[6] * math.sin(r)
    local rot_dy = dx * obj_char[5] * math.sin(r) + dy * obj_char[6] * math.cos(r)
    obj["life"] = 16
    obj[1] = obj_char["x"] + obj_char[5]*(x) + rot_dx
    obj[2] = obj_char["y"] + obj_char[6]*(y) + rot_dy
    obj[3] = obj_char[3]
    obj[4] = opacity
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][1] = 1
    obj["animation"][2] = 2
    obj["animation"][3] = 3
    obj["animation"][4] = 4
    obj["animation"][6] = 5
    obj["animation"][8] = 6
    obj["animation"][10] = 7
    obj["animation"][11] = 8
    obj["animation"][12] = 9
    obj["animation"][15] = 10
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 16
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with_out(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "hitstop" then
            -- do nothing
        else
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")

        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_hit_front_table"],obj)
end
function insert_VFX_game_scene_char_counter_blast_ver0(obj_char,x,y,opacity,sx,sy,r,fix_pos,negative_side)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    local dx = math.abs(common_game_scene_change_character(obj_char["player_side"])["x"]-obj_char["x"])-185*sx
    if not fix_pos then
        if negative_side then
            x = math.max(-dx,x)
        else
            x = math.min(dx,x)
        end
    end
    r = obj_char[5]*r
    obj_char["VFX_hit_front_table"] = {}
    obj_char["VFX_hit_back_table"] = {}

    obj["life"] = 27
    obj[1] = obj_char["x"] + obj_char[5]*(x)
    obj[2] = obj_char["y"] + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = opacity
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
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
    obj["animation"][10] = 5
    obj["animation"][11] = 6
    obj["animation"][12] = 7
    obj["animation"][13] = 8
    obj["animation"][14] = 9
    obj["animation"][16] = 10
    obj["animation"][18] = 11
    obj["animation"][21] = 12
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 27
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with_out(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "hitstop" then
            -- do nothing
        else
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver0_counter
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")

        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_hit_front_table"],obj)
end
function insert_VFX_game_scene_char_counter_blast_ver1(obj_char,x,y,opacity,sx,sy,r,fix_pos,negative_side)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    local dx = math.abs(common_game_scene_change_character(obj_char["player_side"])["x"]-obj_char["x"])-310*sx
    if not fix_pos then
        if negative_side then
            x = math.max(-dx,x)
        else
            x = math.min(dx,x)
        end
    end
    r = obj_char[5]*r
    obj_char["VFX_hit_front_table"] = {}
    obj_char["VFX_hit_back_table"] = {}

    obj["life"] = 21
    obj[1] = obj_char["x"] + obj_char[5]*(x)
    obj[2] = obj_char["y"] + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = opacity*0.85
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
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
    obj["animation"]["fix_type"] = true
    init_frame_anim_with_out(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "hitstop" then
            -- do nothing
        else
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_blast_ver1
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")

        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_hit_front_table"],obj)

    -- air_blow
    local obj = {0,0,0,1,1,1,0,0}
    local dx = -100
    local dy = -200
    local rot_dx = dx * obj_char[5] * math.cos(r) - dy * obj_char[6] * math.sin(r)
    local rot_dy = dx * obj_char[5] * math.sin(r) + dy * obj_char[6] * math.cos(r)
    obj["life"] = 16
    obj[1] = obj_char["x"] + obj_char[5]*(x) + rot_dx
    obj[2] = obj_char["y"] + obj_char[6]*(y) + rot_dy
    obj[3] = obj_char[3]
    obj[4] = opacity
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][1] = 1
    obj["animation"][2] = 2
    obj["animation"][3] = 3
    obj["animation"][4] = 4
    obj["animation"][6] = 5
    obj["animation"][8] = 6
    obj["animation"][10] = 7
    obj["animation"][11] = 8
    obj["animation"][12] = 9
    obj["animation"][15] = 10
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 16
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with_out(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "hitstop" then
            -- do nothing
        else
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_blow
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")

        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_hit_front_table"],obj)
    
    -- counter_glow
    local obj = {0,0,0,1,1,1,0,0}
    local dx = 45
    local dy = 30
    local rot_dx = dx * obj_char[5] * math.cos(r) - dy * obj_char[6] * math.sin(r)
    local rot_dy = dx * obj_char[5] * math.sin(r) + dy * obj_char[6] * math.cos(r)
    obj["life"] = 5
    obj[1] = obj_char["x"] + obj_char[5]*(x) + rot_dx
    obj[2] = obj_char["y"] + obj_char[6]*(y) + rot_dy
    obj[3] = obj_char[3]
    obj[4] = opacity*0.65
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["opacity_point_linear_animation"] = {}
    obj["opacity_point_linear_animation"][0] = {0.9*opacity,5}
    obj["opacity_point_linear_animation"][5] = {0,5}
    obj["opacity_point_linear_animation"]["prop"] = 4
    obj["opacity_point_linear_animation"]["length"] = 5
    obj["opacity_point_linear_animation"]["loop"] = false
    init_point_linear_anim_with_out(obj,obj["opacity_point_linear_animation"])
    obj["update"] = function()
        if obj_char["state"] == "hitstop" then
            -- do nothing
        else
            point_linear_animator(obj,obj["opacity_point_linear_animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image = image_VFX_game_scene_counter_glow
        love.graphics.setColor(1,1,1,obj[4])
        draw_3d_image(obj_camera,obj,image)
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_hit_back_table"],obj)

    -- partical
    local obj = {0,0,0,1,1,1,0,0}
    local obj_camera = obj_stage_game_scene_camera
    obj["life"] = 30
    obj[1] = obj_camera["3d_pos_x"] - 900
    obj[2] = obj_camera["3d_pos_y"] - 550
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
    for i=0,29 do
        obj["animation"][i] = i
    end
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 30
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with_out(obj,obj["animation"])
    obj["update"] = function()
        if obj_char["state"] == "hitstop" then
            -- do nothing
        else
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_partical_ver1_counter
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")

        love.graphics.setBlendMode("add")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_hit_front_table"],obj)
end
function insert_VFX_game_scene_char_block_ver0(obj_char)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    local VFX_spawn_anchor_pos = common_game_scene_get_VFX_spawn_anchor_pos(obj_char["player_side"])["block_ver0_spawn_anchor_pos"][obj_char["sprite_sheet_state"]]
    obj_char["VFX_hit_front_table"] = {}
    obj_char["VFX_hit_back_table"] = {}

    obj["life"] = 11
    obj[1] = obj_char["x"] + obj_char[5]*(VFX_spawn_anchor_pos[1])
    obj[2] = obj_char["y"] + obj_char[6]*(VFX_spawn_anchor_pos[2])
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = 0
    obj[8] = 0
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][1] = 1
    obj["animation"][3] = 2
    obj["animation"][6] = 3
    obj["animation"][8] = 4
    obj["animation"][11] = 4
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 11
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with_out(obj,obj["animation"])
    obj[1] = obj_char["x"] + obj_char[5]*(VFX_spawn_anchor_pos[1])
    obj["update"] = function()
        if obj_char["state"] == "blockstop" then
            -- do nothing
        else
            obj[1] = obj_char["x"] + obj_char[5]*(VFX_spawn_anchor_pos[1])
            obj[2] = obj_char["y"] + obj_char[6]*(VFX_spawn_anchor_pos[2])
            obj[5] = obj_char[5]
            obj[6] = obj_char[6]
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_block_ver0
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")

        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_hit_front_table"],obj)
end
function insert_VFX_game_scene_char_block_ver1(obj_char)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    local VFX_spawn_anchor_pos = common_game_scene_get_VFX_spawn_anchor_pos(obj_char["player_side"])["block_ver1_spawn_anchor_pos"][obj_char["sprite_sheet_state"]]
    obj_char["VFX_hit_front_table"] = {}
    obj_char["VFX_hit_back_table"] = {}

    obj["life"] = 21
    obj[1] = obj_char["x"] + obj_char[5]*(VFX_spawn_anchor_pos[1])
    obj[2] = obj_char["y"] + obj_char[6]*(VFX_spawn_anchor_pos[2])
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = 0
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
    obj["animation"]["fix_type"] = true
    init_frame_anim_with_out(obj,obj["animation"])
    obj[1] = obj_char["x"] + obj_char[5]*(VFX_spawn_anchor_pos[1])
    obj["update"] = function()
        if obj_char["state"] == "blockstop" then
            -- do nothing
        else
            obj[1] = obj_char["x"] + obj_char[5]*(VFX_spawn_anchor_pos[1])
            obj[2] = obj_char["y"] + obj_char[6]*(VFX_spawn_anchor_pos[2])
            obj[5] = obj_char[5]
            obj[6] = obj_char[6]
            frame_animator(obj,obj["animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_block_ver1
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_hit_front_table"],obj)
end
function insert_VFX_game_scene_char_FD_block(obj_char)
    local obj = {0,0,0,1,1,1,0,0}
    local VFX_spawn_anchor_pos = {-300,-420}
    if obj_char["height_state"] == "air" then
        VFX_spawn_anchor_pos = {-300,-440}
    elseif obj_char["height_state"] == "stand" then
        VFX_spawn_anchor_pos = {-300,-540}
    end
    obj_char["VFX_hit_front_table"] = {}
    obj_char["VFX_hit_back_table"] = {}

    obj["life"] = 21
    obj[1] = obj_char["x"] + obj_char[5]*(VFX_spawn_anchor_pos[1])
    obj[2] = obj_char["y"] + obj_char[6]*(VFX_spawn_anchor_pos[2])
    obj[3] = obj_char[3]
    obj[4] = 0.75
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = 0
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
    obj["animation"][21] = 7
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 21
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with_out(obj,obj["animation"])
    obj["opacity_point_linear_animation"] = {}
    obj["opacity_point_linear_animation"][0] = {0.25,5}
    obj["opacity_point_linear_animation"][5] = {1,15}
    obj["opacity_point_linear_animation"][15] = {0,15}
    obj["opacity_point_linear_animation"]["prop"] = 4
    obj["opacity_point_linear_animation"]["length"] = 15
    obj["opacity_point_linear_animation"]["loop"] = false
    init_point_linear_anim_with_out(obj,obj["opacity_point_linear_animation"])
    obj[1] = obj_char["x"] + obj_char[5]*(VFX_spawn_anchor_pos[1])
    obj["update"] = function()
        if obj_char["state"] == "blockstop" then
            -- do nothing
        else
            obj[1] = obj_char["x"] + obj_char[5]*(VFX_spawn_anchor_pos[1])
            obj[2] = obj_char["y"] + obj_char[6]*(VFX_spawn_anchor_pos[2])
            obj[5] = obj_char[5]
            obj[6] = obj_char[6]
            frame_animator(obj,obj["animation"])
            point_linear_animator(obj,obj["opacity_point_linear_animation"])
            obj["life"] = obj["life"] - 1
        end
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_block_FD
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        draw_3d_image(obj_camera,obj,image_VFX_game_scene_FD_bubble)
    end
    table.insert(obj_char["VFX_hit_front_table"],obj)
end
function insert_VFX_game_scene_char_throw_tech(obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local obj = {0,0,0,1,1,1,0,0}
    obj_char["VFX_hit_front_table"] = {}
    obj_char["VFX_hit_back_table"] = {}

    obj["life"] = 20
    obj[1] = (obj_char["x"] + obj_char_other_side["x"])/2 + obj_char[5]*(x)
    obj[2] = (obj_char["y"] + obj_char_other_side["y"])/2 + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = opacity
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
    obj[8] = 0
    obj["f"] = 0
    obj["update"] = function()
        obj["f"] = obj["f"] + 1
        if obj["f"] >= 2 then
            obj[8] = math.min(obj[8] + 1,24)
            obj["f"] = 0
        end
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_throw_tech
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_hit_back_table"],obj)
end

-- smoke
function insert_VFX_game_scene_stage_smoke_dash_burst(obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    obj["life"] = 30
    obj[1] = obj_char["x"] + obj_char[5]*(x-math.random()*150)
    obj[2] = obj_char["y"] + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = opacity
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
    obj[8] = math.random(5)
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["opacity_point_linear_animation"] = {}
    obj["opacity_point_linear_animation"][0] = {1*opacity,30}
    obj["opacity_point_linear_animation"][30] = {0,30}
    obj["opacity_point_linear_animation"]["prop"] = 4
    obj["opacity_point_linear_animation"]["length"] = 30
    obj["opacity_point_linear_animation"]["loop"] = false
    init_point_linear_anim_with_out(obj,obj["opacity_point_linear_animation"])
    obj["8_change_countdown"] = 0
    obj["update"] = function()
        point_linear_animator(obj,obj["opacity_point_linear_animation"])
        if obj["8_change_countdown"] == 0 then
            obj["8_change_countdown"] = 2
            obj[8] = obj[8] + 1
            if obj[8] == 6 then
                obj[8] = 0
            end
        end
        obj["8_change_countdown"] = obj["8_change_countdown"] - 1
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_smoke_dash_burst
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_stage_smoke_horizontal_shot(obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    obj["life"] = 75
    obj[1] = obj_char["x"] + obj_char[5]*(x)
    obj[2] = obj_char["y"] + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = opacity
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
    obj[8] = 0
    obj["f"] = 0
    obj["update"] = function()
        obj["f"] = obj["f"] + 1
        if obj["f"] >= 3 then
            obj[8] = math.min(obj[8] + 1,24)
            obj["f"] = 0
        end
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_smoke_horizontal_shot
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_back_table"],obj)
end
function insert_VFX_game_scene_stage_smoke_land_blow(obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    obj["life"] = 63
    obj[1] = obj_char["x"] + obj_char[5]*(x)
    obj[2] = obj_char["y"] + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = opacity
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
    obj[8] = 0
    obj["f"] = 0
    obj["update"] = function()
        obj["f"] = obj["f"] + 1
        if obj["f"] >= 3 then
            obj[8] = math.min(obj[8] + 1,20)
            obj["f"] = 0
        end
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_smoke_land_blow
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_back_table"],obj)
end
function insert_VFX_game_scene_stage_smoke_vertical_shot(obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    obj["life"] = 72
    obj[1] = obj_char["x"] + obj_char[5]*(x)
    obj[2] = obj_char["y"] + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = opacity
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
    obj[8] = 0
    obj["f"] = 0
    obj["update"] = function()
        obj["f"] = obj["f"] + 1
        if obj["f"] >= 2 then
            obj[8] = math.min(obj[8] + 1,17)
            obj["f"] = 0
        end
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_smoke_vertical_shot
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_back_table"],obj)
end

-- shockwave
function insert_VFX_game_scene_stage_4dash_air_backdash_shockwave(obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    obj["life"] = 26
    obj[1] = obj_char["x"] + obj_char[5]*(x)
    obj[2] = obj_char["y"] + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = opacity
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
    obj[8] = 0
    obj["f"] = 0
    obj["update"] = function()
        obj["f"] = obj["f"] + 1
        if obj["f"] >= 2 then
            obj[8] = math.min(obj[8] + 1,12)
            obj["f"] = 0
        end
        -- obj[1] = obj[1] + obj[5]*10
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_dash_shockwave
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_back_table"],obj)
end
function insert_VFX_game_scene_stage_6dash_air_dash_shockwave(obj_char,x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    obj["life"] = 26
    obj[1] = obj_char["x"] + obj_char[5]*(x)
    obj[2] = obj_char["y"] + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = opacity
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
    obj[8] = 0
    if obj_char[5] == 1 then
        obj[1] = math.min(obj[1],1000)
    elseif obj_char[5] == -1 then
        obj[1] = math.max(obj[1],-1000)
    end
    obj["f"] = 0
    obj["update"] = function()
        obj["f"] = obj["f"] + 1
        if obj["f"] >= 2 then
            obj[8] = math.min(obj[8]+1,12)
            obj["f"] = 0
        end
        obj[1] = obj[1] - 0.2*obj[5]
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_air_dash_shockwave
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_back_table"],obj)
end

-- wallbreak
function insert_VFX_game_scene_stage_wallbreaks(x,y,opacity,sx,sy,r)
end

-- burst
function insert_VFX_game_scne_stage_dash_cancel_burst(x,y,opacity,sx,sy,r)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    obj["life"] = 20
    obj[1] = obj_char["x"] + obj_char[5]*(x)
    obj[2] = obj_char["y"] + obj_char[6]*(y)
    obj[3] = obj_char[3]
    obj[4] = opacity
    obj[5] = obj_char[5]*sx
    obj[6] = obj_char[6]*sy
    obj[7] = r
    obj[8] = 0
    obj["f"] = 0
    obj["update"] = function()
        obj["f"] = obj["f"] + 1
        if obj["f"] >= 2 then
            obj[8] = math.min(obj[8]+1,12)
            obj["f"] = 0
        end
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        local obj_camera = obj_stage_game_scene_camera
        local image_sprite_sheet = image_sprite_sheet_VFX_game_scene_dcc_burst
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end
    table.insert(obj_char["VFX_back_table"],obj)
end
-- GP
function insert_VFX_game_scene_char_GP(obj_char)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,1,1,1,0,0}
    obj["life"] = 42
    obj["update"] = function()
        obj["life"] = 42
        if obj_char["state"] ~= "hurtstop" then
            obj["life"] = 0
        end
    end
    obj["draw"] = function()
        local opacity_cache = obj_char[4]
        local contrast_cache = obj_char["contrast"]
        local brightness_cache = obj_char["brightness"]
        obj_char[4] = 0.2
        obj_char["contrast"] = 1
        obj_char["brightness"] = 1

        love.graphics.setBlendMode("add")
        if obj_char["player_side"] == "L" then
            draw_game_scene_char_LP()
        elseif obj_char["player_side"] == "R" then
            draw_game_scene_char_RP()
        end
        love.graphics.setBlendMode("alpha")

        obj_char[4] = opacity_cache
        obj_char["contrast"] = contrast_cache
        obj_char["brightness"] = brightness_cache
    end
    table.insert(obj_char["VFX_back_table"],obj)
end

-- HUD
function insert_VFX_HUD_game_scene_counter_ver0_2(obj_char)
    local side = obj_char["player_side"]
    local obj = {0,0,0,0,0.75,0.65,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["image"] = image_VFX_game_scene_HUD_counter_ver0_2
    obj["life"] = 70
    if side == "L" then
        obj[1] = 165
    elseif side == "R" then
        obj[1] = 1314
    end
    obj[2] = 35

-- y_anim
    obj["y_anim"] = {}
    obj["y_anim"][0] = {0.00,1}
    obj["y_anim"][1] = {3.00,2}
    obj["y_anim"][2] = {-2.00,3}
    obj["y_anim"][3] = {1.00,5}
    obj["y_anim"][5] = {0.00,35}
    obj["y_anim"][35] = {0.00,40}
    obj["y_anim"][40] = {0.07,45}
    obj["y_anim"][45] = {0.45,47}
    obj["y_anim"][47] = {0.85,49}
    obj["y_anim"][49] = {1.87,50}
    obj["y_anim"][50] = {4.00,50}
    obj["y_anim"]["prop"] = 2
    obj["y_anim"]["length"] = 50
    obj["y_anim"]["loop"] = false
    obj["y_anim"]["fix_type"] = false
-- opacity_anim
    obj["opacity_anim"] = {}
    obj["opacity_anim"][0] = {0.00,1}
    obj["opacity_anim"][1] = {0.87,2}
    obj["opacity_anim"][2] = {1.00,5}
    obj["opacity_anim"][5] = {1.00,15}
    obj["opacity_anim"][15] = {0.99,25}
    obj["opacity_anim"][25] = {0.95,35}
    obj["opacity_anim"][35] = {0.84,40}
    obj["opacity_anim"][40] = {0.75,45}
    obj["opacity_anim"][45] = {0.57,47}
    obj["opacity_anim"][47] = {0.45,49}
    obj["opacity_anim"][49] = {0.25,50}
    obj["opacity_anim"][50] = {0.00,50}
    obj["opacity_anim"]["prop"] = 4
    obj["opacity_anim"]["length"] = 50
    obj["opacity_anim"]["loop"] = false
    obj["opacity_anim"]["fix_type"] = true
-- update
    obj["update"] = function()
        point_linear_animator(obj,obj["y_anim"])
        point_linear_animator(obj,obj["opacity_anim"])
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        draw_2d_image(obj,obj["image"])
    end
    table.insert(obj_char["VFX_HUD_table"],obj)
end
function insert_VFX_HUD_game_scene_counter_ver3(obj_char)
    -- x y z opacity sx sy r f
    local obj = {0,0,0,0,1,1,0,0}
    obj["x"] = 800
    obj["y"] = 600
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["LCT"]["y"] = 0
    obj["LCD"]["y"] = 0
    obj["image"] = image_VFX_game_scene_HUD_counter_ver3
    obj["life"] = 40
    obj[1] = obj["x"] - obj[5]*(600)
    obj[2] = obj["y"] - obj[6]*(200)

-- sx_anim
    obj["sx_anim"] = {}
    obj["sx_anim"][0] = {1.000,1}
    obj["sx_anim"][1] = {1.134,2}
    obj["sx_anim"][2] = {1.176,3}
    obj["sx_anim"][3] = {1.199,4}
    obj["sx_anim"][4] = {1.213,5}
    obj["sx_anim"][5] = {1.220,7}
    obj["sx_anim"][7] = {1.228,9}
    obj["sx_anim"][9] = {1.234,10}
    obj["sx_anim"][10] = {1.236,12}
    obj["sx_anim"][12] = {1.240,14}
    obj["sx_anim"][14] = {1.245,16}
    obj["sx_anim"][16] = {1.246,18}
    obj["sx_anim"][18] = {1.247,20}
    obj["sx_anim"][20] = {1.248,25}
    obj["sx_anim"][25] = {1.249,30}
    obj["sx_anim"][30] = {1.250,32}
    obj["sx_anim"][32] = {1.251,33}
    obj["sx_anim"][33] = {1.252,34}
    obj["sx_anim"][34] = {1.253,35}
    obj["sx_anim"][35] = {1.256,36}
    obj["sx_anim"][36] = {1.258,37}
    obj["sx_anim"][37] = {1.263,38}
    obj["sx_anim"][38] = {1.270,39}
    obj["sx_anim"][39] = {1.281,40}
    obj["sx_anim"][40] = {1.300,40}
    obj["sx_anim"]["prop"] = 5
    obj["sx_anim"]["length"] = 40
    obj["sx_anim"]["loop"] = false
    obj["sx_anim"]["fix_type"] = true
-- y_anim
    obj["y_anim"] = {}
    obj["y_anim"][0] = {600.00,1}
    obj["y_anim"][1] = {584.41,2}
    obj["y_anim"][2] = {575.88,3}
    obj["y_anim"][3] = {571.29,4}
    obj["y_anim"][4] = {568.60,5}
    obj["y_anim"][5] = {567.10,7}
    obj["y_anim"][7] = {565.20,9}
    obj["y_anim"][9] = {563.69,11}
    obj["y_anim"][11] = {562.51,14}
    obj["y_anim"][14] = {561.24,16}
    obj["y_anim"][16] = {560.69,20}
    obj["y_anim"][20] = {560.00,30}
    obj["y_anim"][30] = {560.00,40}
    obj["y_anim"][40] = {560.00,40}
    obj["y_anim"]["prop"] = "y"
    obj["y_anim"]["length"] = 40
    obj["y_anim"]["loop"] = false
    obj["y_anim"]["fix_type"] = true
-- opacity_anim
    obj["opacity_anim"] = {}
    obj["opacity_anim"][0] = {0.00,1}
    obj["opacity_anim"][1] = {0.58,2}
    obj["opacity_anim"][2] = {0.70,3}
    obj["opacity_anim"][3] = {0.77,4}
    obj["opacity_anim"][4] = {0.82,5}
    obj["opacity_anim"][5] = {0.85,6}
    obj["opacity_anim"][6] = {0.88,7}
    obj["opacity_anim"][7] = {0.90,9}
    obj["opacity_anim"][9] = {0.93,11}
    obj["opacity_anim"][11] = {0.95,13}
    obj["opacity_anim"][13] = {0.97,15}
    obj["opacity_anim"][15] = {0.98,20}
    obj["opacity_anim"][20] = {0.99,30}
    obj["opacity_anim"][30] = {1.00,31}
    obj["opacity_anim"][31] = {1.00,32}
    obj["opacity_anim"][32] = {0.99,33}
    obj["opacity_anim"][33] = {0.96,34}
    obj["opacity_anim"][34] = {0.93,35}
    obj["opacity_anim"][35] = {0.89,36}
    obj["opacity_anim"][36] = {0.82,37}
    obj["opacity_anim"][37] = {0.73,38}
    obj["opacity_anim"][38] = {0.60,39}
    obj["opacity_anim"][39] = {0.38,40}
    obj["opacity_anim"][40] = {0.00,40}
    obj["opacity_anim"]["prop"] = 4
    obj["opacity_anim"]["length"] = 40
    obj["opacity_anim"]["loop"] = false
    obj["opacity_anim"]["fix_type"] = true
-- update
    obj["update"] = function()
        point_linear_animator(obj,obj["sx_anim"])
        point_linear_animator(obj,obj["y_anim"])
        point_linear_animator(obj,obj["opacity_anim"])
        obj[1] = obj["x"] - obj[5]*(600)
        obj[2] = obj["y"] - obj[6]*(200)
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        love.graphics.setBlendMode("add")
        draw_2d_image(obj,obj["image"])
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_HUD_table"],obj)

-- black_overlay
    local obj = {0,0,0,0.5,0,0,0,0}
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["life"] = 60
    obj["opacity_anim"] = {}
    obj["opacity_anim"][0] = {0.5,60}
    obj["opacity_anim"][60] = {0,60}
    obj["opacity_anim"]["prop"] = 4
    obj["opacity_anim"]["length"] = 60
    obj["opacity_anim"]["loop"] = false
    obj["opacity_anim"]["fix_type"] = true
    init_point_linear_anim_with_out(obj,obj["opacity_anim"])

    obj["update"] = function()
        point_linear_animator(obj,obj["opacity_anim"])
        obj["life"] = obj["life"] - 1
    end

    obj["draw"] = function()
        love.graphics.setColor(0,0,0,obj[4])
        love.graphics.rectangle("fill",0,0,width,height)
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["black_overlay_table"],obj)
end
function insert_VFX_HUD_game_scene_punish(obj_char)
    local side = obj_char["player_side"]
    local obj = {0,0,0,0,0.75,0.65,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["image"] = image_VFX_game_scene_HUD_punish
    obj["life"] = 70
    if side == "L" then
        obj[1] = 165
    elseif side == "R" then
        obj[1] = 1314
    end
    obj[2] = 35

-- y_anim
    obj["y_anim"] = {}
    obj["y_anim"][0] = {0.00,1}
    obj["y_anim"][1] = {3.00,2}
    obj["y_anim"][2] = {-2.00,3}
    obj["y_anim"][3] = {1.00,5}
    obj["y_anim"][5] = {0.00,35}
    obj["y_anim"][35] = {0.00,40}
    obj["y_anim"][40] = {0.07,45}
    obj["y_anim"][45] = {0.45,47}
    obj["y_anim"][47] = {0.85,49}
    obj["y_anim"][49] = {1.87,50}
    obj["y_anim"][50] = {4.00,50}
    obj["y_anim"]["prop"] = 2
    obj["y_anim"]["length"] = 50
    obj["y_anim"]["loop"] = false
    obj["y_anim"]["fix_type"] = false
-- opacity_anim
    obj["opacity_anim"] = {}
    obj["opacity_anim"][0] = {0.00,1}
    obj["opacity_anim"][1] = {0.87,2}
    obj["opacity_anim"][2] = {1.00,5}
    obj["opacity_anim"][5] = {1.00,15}
    obj["opacity_anim"][15] = {0.99,25}
    obj["opacity_anim"][25] = {0.95,35}
    obj["opacity_anim"][35] = {0.84,40}
    obj["opacity_anim"][40] = {0.75,45}
    obj["opacity_anim"][45] = {0.57,47}
    obj["opacity_anim"][47] = {0.45,49}
    obj["opacity_anim"][49] = {0.25,50}
    obj["opacity_anim"][50] = {0.00,50}
    obj["opacity_anim"]["prop"] = 4
    obj["opacity_anim"]["length"] = 50
    obj["opacity_anim"]["loop"] = false
    obj["opacity_anim"]["fix_type"] = true
-- update
    obj["update"] = function()
        point_linear_animator(obj,obj["y_anim"])
        point_linear_animator(obj,obj["opacity_anim"])
        obj["life"] = obj["life"] - 1
    end
    obj["draw"] = function()
        draw_2d_image(obj,obj["image"])
    end
    table.insert(obj_char["VFX_HUD_table"],obj)
end
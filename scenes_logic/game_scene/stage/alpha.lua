-- load
function load_game_scene_obj_stage()
    -- CANVAS
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    DRAW_STAGE_GLOW_CANVAS = love.graphics.newCanvas(width,height)
    DRAW_STAGE_RADIAL_BLUR_CANVAS = love.graphics.newCanvas(width,height)
    DRAW_STAGE_ALPHA_COMP_CANVAS = love.graphics.newCanvas(width,height)
    DRAW_STAGE_ALPHA_ONLY_CANVAS = love.graphics.newCanvas(width,height)

    obj_stage_game_scene_mid_collision_anchor = 0

    -- common
    -- stage_animation_container
    obj_stage_game_scene_main = {}
    obj_stage_game_scene_main["f"] = 0
    obj_stage_game_scene_main["current_animation"] = {}

    -- camera
    obj_stage_game_scene_camera = {0,0,-800}
    obj_stage_game_scene_camera["3d_pos_x"] = 0
    obj_stage_game_scene_camera["3d_pos_y"] = 0
    obj_stage_game_scene_camera["3d_pos_z"] = -800
    obj_stage_game_scene_camera["3d_pos_x_target"] = 0
    obj_stage_game_scene_camera["3d_pos_y_target"] = 0
    obj_stage_game_scene_camera["3d_pos_z_target"] = -800
    obj_stage_game_scene_camera["FCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_camera["LCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_camera["LCD"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_camera["state"] = "main"
    obj_stage_game_scene_camera["enclose_percentage"] = 0.0
    obj_stage_game_scene_camera["enclose_position_offset"] = {0,0,0}

    obj_stage_game_scene_camera["LCT"]["enclose_percentage"] = 0.0
    obj_stage_game_scene_camera["LCD"]["enclose_percentage"] = 0.0

    obj_stage_game_scene_camera["active_application_table"] = {}

    -- wallstick
    obj_stage_game_scene_wallstick = {}
    obj_stage_game_scene_wallstick = {1800,-450,0,0,1,1,0,0}
    obj_stage_game_scene_wallstick["FCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallstick["LCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallstick["LCD"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallstick["state"] = "off"
    obj_stage_game_scene_wallstick["sprite_sheet"] = 0

    -- wallbreak
    obj_stage_game_scene_wallbreak_after_debris = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_after_debris["FCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_after_debris["LCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_after_debris["LCD"] = {0,0,0,0,0,0,0,0}

    obj_stage_game_scene_wallbreak_dynamic = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_dynamic["FCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_dynamic["LCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_dynamic["LCD"] = {0,0,0,0,0,0,0,0}

    obj_stage_game_scene_wallbreak_transport_smoke = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_transport_smoke["FCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_transport_smoke["LCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_transport_smoke["LCD"] = {0,0,0,0,0,0,0,0}

    obj_stage_game_scene_wallbreak_transport_glow = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_transport_glow["FCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_transport_glow["LCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_transport_glow["LCD"] = {0,0,0,0,0,0,0,0}

    -- adjust_character_color
    obj_char_game_scene_char_LP["brightness"] = -0.05
    obj_char_game_scene_char_LP["brightness_const"] = -0.05
    obj_char_game_scene_char_LP["brightness_overdrive_const"] = 0.15
    obj_char_game_scene_char_LP["contrast"] = 0.8
    obj_char_game_scene_char_RP["brightness"] = -0.05
    obj_char_game_scene_char_RP["brightness_const"] = -0.05
    obj_char_game_scene_char_RP["contrast"] = 0.8
    obj_char_game_scene_char_RP["brightness_overdrive_const"] = 0.15
    if 	CHAR_SELECT_LR["L"] == 	CHAR_SELECT_LR["R"] then
        obj_char_game_scene_char_RP["brightness"] = -0.5
        obj_char_game_scene_char_RP["brightness_const"] = -0.5
        obj_char_game_scene_char_RP["brightness_overdrive_const"] = -0.3
        obj_char_game_scene_char_RP["contrast"] = 1
    end

    -- uncommon
    -- stage_objects
    obj_stage_game_scene_ground = {-4000,320,200,1,1,1,0,0}

    obj_stage_game_scene_glow_with_linear_fade_alpha = {0,0,-800,1,1,1,0,0}
    obj_stage_game_scene_glow_with_linear_fade_alpha["glow_3d_pos"] = {0,-2200,1600}

    obj_stage_game_scene_stair = {-4000,175,300,1,1,1,0,0}

    obj_stage_game_scene_tile_map = {-3600,-1850,800,1,1,1,0,0}
end
function load_game_scene_anim_stage()
    -- common
    -- camera_animation
    anim_camera_point_linear_game_scene_camera_enclosing = {}
    anim_camera_point_linear_game_scene_camera_enclosing[0] = {0.00,0}
    anim_camera_point_linear_game_scene_camera_enclosing["prop"] = "enclose_percentage"
    anim_camera_point_linear_game_scene_camera_enclosing["length"] = 0
    anim_camera_point_linear_game_scene_camera_enclosing["loop"] = false
    anim_camera_point_linear_game_scene_camera_enclosing["fix_type"] = true

    anim_camera_point_linear_game_scene_camera_shake_x = {}
    anim_camera_point_linear_game_scene_camera_shake_y = {}

    -- wallbreak_after_debris_opacity_anim
    anim_stage_wallbreak_after_debris_opacity = {}

    -- wallbreak_dynamic_opacity_anim
    anim_stage_wallbreak_dynamic_opacity = {}

    -- wallbreak_static_opacity_anim
    anim_stage_wallstick = {}
    for i = 0,19 do
        anim_stage_wallstick[i] = i
    end
    anim_stage_wallstick["prop"] = 8
    anim_stage_wallstick["length"] = 19
    anim_stage_wallstick["loop"] = false
    anim_stage_wallstick["fix_type"] = true

    -- wallbreak_transport_smoke_opacity_anim
    anim_stage_wallbreak_transport_smoke_opacity = {}

    -- wallbreak_transport_glow_opacity
    anim_stage_wallbreak_transport_glow = {}
    anim_stage_wallbreak_transport_glow[0] = {0,5}
    anim_stage_wallbreak_transport_glow[5] = {0.07,10}
    anim_stage_wallbreak_transport_glow[10] = {0.26,15}
    anim_stage_wallbreak_transport_glow[15] = {0.5,20}
    anim_stage_wallbreak_transport_glow[20] = {0.74,25}
    anim_stage_wallbreak_transport_glow[25] = {0.93,30}
    anim_stage_wallbreak_transport_glow[30] = {1,30}
    anim_stage_wallbreak_transport_glow["prop"] = 4
    anim_stage_wallbreak_transport_glow["length"] = 30
    anim_stage_wallbreak_transport_glow["loop"] = false
    anim_stage_wallbreak_transport_glow["fix_type"] = true

    -- stage_wallbreak_animation
    anim_stage_wallbreak_transport = {}
    anim_stage_wallbreak_transport["prop"] = "f"
    anim_stage_wallbreak_transport["length"] = 150

    -- uncommon
end
function order_load_game_scene_stage(load_order)
    local switch = 
    {
        [21] = function()
            image_sprite_sheet_stage_game_scene_wallbreak_after_debris = 
            sprite_sheet_load(
                "asset/game_scene/stage/alpha/wallbreak_after_debris.json",
                love.graphics.newImage(ASSET_DATA[4][1])
            )
            image_sprite_sheet_stage_game_scene_wallbreak_dynamic  = 
            sprite_sheet_load(
                "asset/game_scene/stage/alpha/wallbreak_dynamic.json",
                love.graphics.newImage(ASSET_DATA[4][2])
            )
            image_sprite_sheet_stage_game_scene_wallbreak_trans_smoke = 
            sprite_sheet_load(
                "asset/game_scene/stage/alpha/wallbreak_trans_smoke.json",
                love.graphics.newImage(ASSET_DATA[4][3])
            )
            image_stage_game_scene_wallbreak_transport_glow = love.graphics.newImage(ASSET_DATA[4][4])

            image_sprite_sheet_stage_game_scene_wallstick = {}
            image_sprite_sheet_stage_game_scene_wallstick[0] = 
            sprite_sheet_load(
                "asset/game_scene/stage/alpha/wallstick_ver0.json",
                love.graphics.newImage(ASSET_DATA[4][5])
            )
            image_sprite_sheet_stage_game_scene_wallstick[1] = 
            sprite_sheet_load(
                "asset/game_scene/stage/alpha/wallstick_ver1.json",
                love.graphics.newImage(ASSET_DATA[4][6])
            )

            image_stage_game_scene_ground = love.graphics.newImage(ASSET_DATA[4][7])
            image_stage_game_scene_stage_liner_fade_alpha = love.graphics.newImage(ASSET_DATA[4][8])
            image_stage_game_scene_stair = love.graphics.newImage(ASSET_DATA[4][9])
            image_stage_game_scene_tile_map = love.graphics.newImage(ASSET_DATA[4][10])

            image_sprite_batch_stage_game_scene_ground = love.graphics.newSpriteBatch(image_stage_game_scene_ground)
            image_sprite_batch_stage_game_scene_stair = love.graphics.newSpriteBatch(image_stage_game_scene_stair)

            image_sprite_batch_stage_game_scene_ground:clear()
            image_sprite_batch_stage_game_scene_ground:add(0,0)
            image_sprite_batch_stage_game_scene_ground:add(1600,0)
            image_sprite_batch_stage_game_scene_ground:add(1600*2,0)
            image_sprite_batch_stage_game_scene_ground:add(1600*3,0)
            image_sprite_batch_stage_game_scene_ground:add(1600*4,0)

            image_sprite_batch_stage_game_scene_stair:clear()
            image_sprite_batch_stage_game_scene_stair:add(0,0)
            image_sprite_batch_stage_game_scene_stair:add(1600,0)
            image_sprite_batch_stage_game_scene_stair:add(1600*2,0)
            image_sprite_batch_stage_game_scene_stair:add(1600*3,0)
            image_sprite_batch_stage_game_scene_stair:add(1600*4,0)
        end,
    }
    local this_function = switch[load_order]
    if this_function then this_function() end
end

-- state_machine
function update_stage_game_scene_wallbreak_static(obj)
    local switch = {
        ["off"] = function()

        end,
        ["on"] = function()
            frame_animator(obj,anim_stage_wallstick)
            if get_frame_anim_end_state(obj,anim_stage_wallstick) then
                obj[4] = 0
                obj[8] = 0
                obj["state"] = "off"
            end
        end,
    }
    local this_function = switch[obj["state"]]
    if this_function then this_function() end
end

-- update
function update_game_scene_stage()
    -- static stage no update need
    -- glow update no need for this stage

    -- camera update
    local obj_camera = obj_stage_game_scene_camera
    local obj_char_L = obj_char_game_scene_char_LP
    local obj_char_R = obj_char_game_scene_char_RP

    obj_stage_game_scene_mid_collision_anchor = (obj_char_L["x"] + obj_char_R["x"])/2

    -- x = 720 y = -800
    -- x = 1440 y = -970
    -- y = (x-720)*(-170)/720 -800
    obj_camera["3d_pos_z_target"] = (math.abs(obj_char_L["x"]-obj_char_R["x"])-720)*(-170)/720-800
    obj_camera["3d_pos_z_target"] = math.min(obj_camera["3d_pos_z_target"],-800)
    obj_camera["3d_pos_z_target"] = math.max(obj_camera["3d_pos_z_target"],-970)

    obj_camera["3d_pos_x_target"] = (obj_char_L["x"] + obj_char_R["x"])/2   -- 必须要保持两个pushbox宽度相同
    obj_camera["3d_pos_x_target"] = math.max(obj_camera["3d_pos_x_target"],-1350-(obj_camera["3d_pos_z_target"]+800)*1)
    obj_camera["3d_pos_x_target"] = math.min(obj_camera["3d_pos_x_target"],1350+(obj_camera["3d_pos_z_target"]+800)*1)

    obj_camera["3d_pos_y_target"] = math.min(obj_char_L["y"],obj_char_R["y"])+75
    obj_camera["3d_pos_y_target"] = math.min(obj_camera["3d_pos_y_target"],0)
    obj_camera["3d_pos_y_target"] = obj_camera["3d_pos_y_target"]+(800+obj_camera["3d_pos_z_target"])*0.5
    obj_camera["3d_pos_y_target"] = math.max(obj_camera["3d_pos_y_target"],-900)

    obj_camera["3d_pos_z_target"] = obj_camera["3d_pos_z_target"]-obj_camera["3d_pos_y_target"]*0.25
    -- camera smooth move
    local div_value = 3
    obj_camera["3d_pos_x"] = (obj_camera["3d_pos_x"]*(div_value-1)+obj_camera["3d_pos_x_target"])/div_value
    obj_camera["3d_pos_y"] = (obj_camera["3d_pos_y"]*(div_value-1)+obj_camera["3d_pos_y_target"])/div_value
    obj_camera["3d_pos_z"] = (obj_camera["3d_pos_z"]*(div_value-1)+obj_camera["3d_pos_z_target"])/div_value
    if math.abs(obj_camera["3d_pos_x"]-obj_camera["3d_pos_x_target"]) < 0.05 then
        obj_camera["3d_pos_x"] = obj_camera["3d_pos_x_target"]
    end
    if math.abs(obj_camera["3d_pos_y"]-obj_camera["3d_pos_y_target"]) < 0.05 then
        obj_camera["3d_pos_y"] = obj_camera["3d_pos_y_target"]
    end
    if math.abs(obj_camera["3d_pos_z"]-obj_camera["3d_pos_z_target"]) < 0.05 then
        obj_camera["3d_pos_z"] = obj_camera["3d_pos_z_target"]
    end

    update_game_scene_camera_application_table()
    local switch = {
        ["main"] = function()
            return
        end,
        ["active"] = function()
            point_linear_animator(obj_camera,anim_camera_point_linear_game_scene_camera_enclosing)
            point_linear_animator(obj_camera,anim_camera_point_linear_game_scene_camera_shake_x)
            point_linear_animator(obj_camera,anim_camera_point_linear_game_scene_camera_shake_y)
            if get_point_linear_anim_end_state(obj_camera,anim_camera_point_linear_game_scene_camera_enclosing)
            and get_point_linear_anim_end_state(obj_camera,anim_camera_point_linear_game_scene_camera_shake_x)
            and get_point_linear_anim_end_state(obj_camera,anim_camera_point_linear_game_scene_camera_shake_y) then
                obj_camera["state"] = "main"
                obj_camera["enclose_position_offset"] = {0,0,0}
            end
        end,
    }
    local this_function = switch[obj_camera["state"]]
    if this_function then this_function() end

    obj_camera[1] = obj_camera["3d_pos_x"]+obj_camera["enclose_position_offset"][1]*obj_camera["enclose_percentage"]
    obj_camera[2] = obj_camera["3d_pos_y"]+obj_camera["enclose_position_offset"][2]*obj_camera["enclose_percentage"]
    obj_camera[3] = obj_camera["3d_pos_z"]+obj_camera["enclose_position_offset"][3]*obj_camera["enclose_percentage"]+obj_camera[2]*0.25

    -- wallbreak_static_update
    update_stage_game_scene_wallbreak_static(obj_stage_game_scene_wallstick)
end
function update_game_scene_camera_application_table()
    if #obj_stage_game_scene_camera["active_application_table"] == 0 then
        return
    end
    if #obj_stage_game_scene_camera["active_application_table"] == 1 then
        obj_stage_game_scene_camera["active_application_table"][1]()
        obj_stage_game_scene_camera["active_application_table"] = {}
    elseif #obj_stage_game_scene_camera["active_application_table"] > 1 then
        -- nil shake 动画
        -- nil enclose 动画
        -- 更新状态
        obj_stage_game_scene_camera["active_application_table"] = {}
    end
end

-- draw
function draw_game_scene_stage_static()
    love.graphics.clear(125/255,125/255,125/255,1)

    local obj_camera = obj_stage_game_scene_camera
    local image_sprite_sheet = nil

    local obj = obj_stage_game_scene_tile_map
    draw_3d_image(obj_camera,obj,image_stage_game_scene_tile_map)
    obj = obj_stage_game_scene_stair
    draw_3d_image(obj_camera,obj,image_sprite_batch_stage_game_scene_stair)
    obj = obj_stage_game_scene_ground
    draw_3d_image(obj_camera,obj,image_sprite_batch_stage_game_scene_ground)

    -- common
    obj = obj_stage_game_scene_wallstick
    image_sprite_sheet = image_sprite_sheet_stage_game_scene_wallstick[obj["sprite_sheet"]]
    image_sprite_sheet["sprite_batch"]:clear()
    draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
    love.graphics.setBlendMode("add")
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    love.graphics.setBlendMode("alpha")
end
function draw_game_scene_stage_glow()
    local obj_camera = obj_stage_game_scene_camera
    local obj = obj_stage_game_scene_glow_with_linear_fade_alpha

    local x = obj["glow_3d_pos"][1]
    local y = obj["glow_3d_pos"][2]
    local z = obj["glow_3d_pos"][3]

    local camera_x = obj_camera[1]
    local camera_y = obj_camera[2]
    local camera_z = obj_camera[3]

    local scale = draw_resolution_correction(800)/(z-camera_z)

    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    local cood_res = {
        scale * (x - camera_x) + draw_resolution_correction(800),
        scale * (y - camera_y) + draw_resolution_correction(450)
    }

    love.graphics.setCanvas(DRAW_STAGE_ALPHA_ONLY_CANVAS)
    love.graphics.clear(0,0,0,0)
    love.graphics.rectangle("fill",0,0,width,height/2)
    love.graphics.draw(
        image_stage_game_scene_stage_liner_fade_alpha,
        0,-camera_y*0.5,0,
        draw_resolution_correction(1),
        draw_resolution_correction(1)
    )

    love.graphics.setCanvas(DRAW_STAGE_GLOW_CANVAS)
    love.graphics.clear(0,0,0,0)
    love.graphics.setShader(shader_game_scene_fractal_noise)
    shader_game_scene_fractal_noise:send("time",love.timer.getTime())
    shader_game_scene_fractal_noise:send("input_x",0)
    love.graphics.rectangle("fill",0,0,width,height)

    love.graphics.setCanvas(DRAW_STAGE_RADIAL_BLUR_CANVAS)
    love.graphics.clear(0,0,0,0)
    love.graphics.setShader(shader_game_scene_radial_blur)
    shader_game_scene_radial_blur:send("start_coods",cood_res)
    shader_game_scene_radial_blur:send("input_screen_coords",{width,height})
    love.graphics.draw(DRAW_STAGE_GLOW_CANVAS,0,0)
    love.graphics.setShader()

    love.graphics.setCanvas(DRAW_STAGE_ALPHA_COMP_CANVAS)
    love.graphics.clear(0,0,0,0)
    love.graphics.draw(DRAW_STAGE_RADIAL_BLUR_CANVAS)
    love.graphics.setBlendMode('multiply','premultiplied')
    love.graphics.draw(DRAW_STAGE_ALPHA_ONLY_CANVAS)
    love.graphics.setBlendMode('alpha','alphamultiply')
    love.graphics.setCanvas()

    love.graphics.setBlendMode("add")
    love.graphics.setColor(1,1,1,0.8)
    love.graphics.draw(DRAW_STAGE_ALPHA_COMP_CANVAS)
    love.graphics.setColor(1,1,1,1)
    love.graphics.setBlendMode("alpha")
end

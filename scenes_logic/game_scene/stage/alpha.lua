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

    obj_stage_game_scene_camera = {0, 0, -800}
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
    obj_stage_game_scene_camera["enclose_position_offset"] = {0, 0, 0}

    obj_stage_game_scene_camera["LCT"]["enclose_percentage"] = 0.0
    obj_stage_game_scene_camera["LCD"]["enclose_percentage"] = 0.0

    obj_stage_game_scene_camera["active_application_table"] = {}

    obj_stage_game_scene_ground = {-2400, 320, 200, 1, 1, 1, 0, 0}
    obj_stage_game_scene_stair = {-2400, 175, 300, 1, 1, 1, 0, 0}
    obj_stage_game_scene_glow = {0, 0, -800, 1, 1, 1, 0, 0}
    obj_stage_game_scene_glow["glow_3d_pos"] = {0,-2200,1600}
    obj_stage_game_scene_tile_map = {-3600, -1995, 800, 1, 1, 1, 0, 0}

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
end
function load_game_scene_anim_stage()
    anim_camera_point_linear_game_scene_camera_enclosing = {}
    anim_camera_point_linear_game_scene_camera_enclosing[0] = {0.00, 0}
    anim_camera_point_linear_game_scene_camera_enclosing["prop"] = "enclose_percentage"
    anim_camera_point_linear_game_scene_camera_enclosing["length"] = 0
    anim_camera_point_linear_game_scene_camera_enclosing["loop"] = false
    anim_camera_point_linear_game_scene_camera_enclosing["fix_type"] = true

    anim_camera_point_linear_game_scene_camera_shake_x = {}
    anim_camera_point_linear_game_scene_camera_shake_y = {}
end
function order_load_game_scene_stage(load_order)
    local switch = 
    {
        [21] = function()
            image_stage_game_scene_ground = love.graphics.newImage(ASSET_DATA[4][1])
            image_stage_game_scene_stair = love.graphics.newImage(ASSET_DATA[4][2])
            image_stage_game_scene_stage_liner_fade_alpha = love.graphics.newImage(ASSET_DATA[4][3])
            image_stage_game_scene_tile_map = love.graphics.newImage(ASSET_DATA[4][4])
        end,
    }
    local this_function = switch[load_order]
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
    obj_camera["3d_pos_x_target"] = math.max(obj_camera["3d_pos_x_target"],-850-(obj_camera["3d_pos_z_target"]+800)*1)
    obj_camera["3d_pos_x_target"] = math.min(obj_camera["3d_pos_x_target"],850+(obj_camera["3d_pos_z_target"]+800)*1)

    obj_camera["3d_pos_y_target"] = math.min(obj_char_L["y"],obj_char_R["y"])+75
    obj_camera["3d_pos_y_target"] = math.min(obj_camera["3d_pos_y_target"],0)
    obj_camera["3d_pos_y_target"] = obj_camera["3d_pos_y_target"]+(800+obj_camera["3d_pos_z_target"])*0.5

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

    local camera = obj_stage_game_scene_camera

    local obj = obj_stage_game_scene_tile_map
    local sprite_batch = nil
    draw_3d_image(camera,obj,image_stage_game_scene_tile_map)

    obj = obj_stage_game_scene_stair
    sprite_batch = love.graphics.newSpriteBatch(image_stage_game_scene_stair)
    sprite_batch:clear()
    sprite_batch:add(0, 0)
    sprite_batch:add(1600, 0)
    sprite_batch:add(3200, 0)
    draw_3d_image(camera,obj,sprite_batch)

    obj = obj_stage_game_scene_ground
    sprite_batch = love.graphics.newSpriteBatch(image_stage_game_scene_ground)
    sprite_batch:clear()
    sprite_batch:add(0, 0)
    sprite_batch:add(1600, 0)
    sprite_batch:add(3200, 0)
    draw_3d_image(camera,obj,sprite_batch)

end
function draw_game_scene_stage_glow()
    local camera = obj_stage_game_scene_camera
    local obj = obj_stage_game_scene_glow

    local x = obj["glow_3d_pos"][1]
    local y = obj["glow_3d_pos"][2]
    local z = obj["glow_3d_pos"][3]

    local camera_x = camera[1]
    local camera_y = camera[2]
    local camera_z = camera[3]

    local scale = draw_resolution_correction(800)/(z-camera_z)

    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    local cood_res = {
        scale * (x - camera_x) + draw_resolution_correction(800),
        scale * (y - camera_y) + draw_resolution_correction(450)
    }

    love.graphics.setCanvas(DRAW_STAGE_ALPHA_ONLY_CANVAS)
    love.graphics.clear(0,0,0,0)
    love.graphics.rectangle("fill", 0, 0, width, height/2)
    love.graphics.draw(
        image_stage_game_scene_stage_liner_fade_alpha,
        0,-camera_y*0.5,0,
        draw_resolution_correction(1),
        draw_resolution_correction(1)
    )

    love.graphics.setCanvas(DRAW_STAGE_GLOW_CANVAS)
    love.graphics.clear(0,0,0,0)
    love.graphics.setShader(shader_game_scene_fractal_noise)
    shader_game_scene_fractal_noise:send("time", love.timer.getTime())
    shader_game_scene_fractal_noise:send("input_x", 0)
    love.graphics.rectangle("fill", 0, 0, width, height)

    love.graphics.setCanvas(DRAW_STAGE_RADIAL_BLUR_CANVAS)
    love.graphics.clear(0,0,0,0)
    love.graphics.setShader(shader_game_scene_radial_blur)
    shader_game_scene_radial_blur:send("start_coods", cood_res)
    shader_game_scene_radial_blur:send("input_screen_coords", {width, height})
    love.graphics.draw(DRAW_STAGE_GLOW_CANVAS, 0, 0)
    love.graphics.setShader()

    love.graphics.setCanvas(DRAW_STAGE_ALPHA_COMP_CANVAS)
    love.graphics.clear(0,0,0,0)
    love.graphics.draw(DRAW_STAGE_RADIAL_BLUR_CANVAS)
    love.graphics.setBlendMode('multiply', 'premultiplied')
    love.graphics.draw(DRAW_STAGE_ALPHA_ONLY_CANVAS)
    love.graphics.setBlendMode('alpha', 'alphamultiply')
    love.graphics.setCanvas()

    love.graphics.setBlendMode("add")
    love.graphics.setColor(1, 1, 1, 0.8)
    love.graphics.draw(DRAW_STAGE_ALPHA_COMP_CANVAS)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setBlendMode("alpha")
end

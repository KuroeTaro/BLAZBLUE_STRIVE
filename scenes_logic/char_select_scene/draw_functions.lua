-- ease_in
function draw_char_select_scene_ease_in_0f_36f()
    -- draw_2d_image_table(
    --     obj_UI_char_select_scene_start_0f_110f,
    --     image_table_UI_char_select_scene_start_0_110f
    -- )
    local image_sprite_sheet = image_sprite_sheet_UI_char_select_scene_start_0_110f
    local obj = obj_UI_char_select_scene_start_0f_110f
    image_sprite_sheet["sprite_batch"]:clear()
    draw_2d_image_sprite_batch(obj,image_sprite_sheet,tostring(obj[8]))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    love.graphics.setBlendMode("add")
    -- draw_2d_image_table(
    --     obj_UI_char_select_scene_movie_cover,
    --     image_table_UI_char_select_scene_movie_cover
    -- )
    image_sprite_sheet = image_sprite_sheet_UI_char_select_scene_movie_cover
    obj = obj_UI_char_select_scene_movie_cover
    image_sprite_sheet["sprite_batch"]:clear()
    draw_2d_image_sprite_batch(obj,image_sprite_sheet,tostring(obj[8]))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])

    love.graphics.setBlendMode("alpha")
    draw_solid(obj_UI_char_select_scene_black_solid)
end
function draw_char_select_scene_ease_in_36f_40f()
    -- draw_2d_image_table(
    --     obj_UI_char_select_scene_start_0f_110f,
    --     image_table_UI_char_select_scene_start_0_110f
    -- )
    local image_sprite_sheet = image_sprite_sheet_UI_char_select_scene_start_0_110f
    local obj = obj_UI_char_select_scene_start_0f_110f
    image_sprite_sheet["sprite_batch"]:clear()
    draw_2d_image_sprite_batch(obj,image_sprite_sheet,tostring(obj[8]))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    love.graphics.setBlendMode("add")
    -- draw_2d_image_table(
    --     obj_UI_char_select_scene_movie_cover,
    --     image_table_UI_char_select_scene_movie_cover
    -- )
    image_sprite_sheet = image_sprite_sheet_UI_char_select_scene_movie_cover
    obj = obj_UI_char_select_scene_movie_cover
    image_sprite_sheet["sprite_batch"]:clear()
    draw_2d_image_sprite_batch(obj,image_sprite_sheet,tostring(obj[8]))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    love.graphics.setBlendMode("alpha")
end
function draw_char_select_scene_ease_in_40f_130f()
    -- draw_2d_image_table(
    --     obj_UI_char_select_scene_start_0f_110f,
    --     image_table_UI_char_select_scene_start_0_110f
    -- )
    local image_sprite_sheet = image_sprite_sheet_UI_char_select_scene_start_0_110f
    local obj = obj_UI_char_select_scene_start_0f_110f
    image_sprite_sheet["sprite_batch"]:clear()
    draw_2d_image_sprite_batch(obj,image_sprite_sheet,tostring(obj[8]))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    draw_2d_image(
        obj_UI_char_select_scene_icon_select_L,
        image_table_UI_char_select_scene_char_icon_alpha[obj_UI_char_select_scene_icon_select_L[8]]
    )

    if GAME_MODE ~= 0 then
        draw_2d_image(
            obj_UI_char_select_scene_icon_select_R,
            image_table_UI_char_select_scene_char_icon_alpha[obj_UI_char_select_scene_icon_select_R[8]]
        )
    end
    draw_char_select_scene_char_select_LR(1)
    draw_char_select_scene_char_select_LR(2)

    draw_2d_image(
        obj_UI_char_select_scene_bar_mark_L,
        image_UI_char_select_scene_bar_mark
    )

    draw_2d_image(
        obj_UI_char_select_scene_bar_mark_R,
        image_UI_char_select_scene_bar_mark
    )

    draw_2d_image(
        obj_UI_char_select_scene_control_method_L,
        image_UI_char_select_scene_control_method_L
    )

    draw_2d_image(
        obj_UI_char_select_scene_control_method_R,
        image_UI_char_select_scene_control_method_R
    )

    draw_char_select_scene_timer(
        obj_UI_char_select_scene_timer,
        image_table_UI_char_select_scene_number
    )

    draw_char_select_scene_glow(obj_UI_char_select_scene_glow)

    love.graphics.setBlendMode("add")
    draw_2d_image(
        obj_UI_char_select_scene_ring,
        image_UI_char_select_scene_ring
    )
    image_sprite_sheet = image_sprite_sheet_UI_char_select_scene_movie_cover
    obj = obj_UI_char_select_scene_movie_cover
    image_sprite_sheet["sprite_batch"]:clear()
    draw_2d_image_sprite_batch(obj,image_sprite_sheet,tostring(obj[8]))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    -- draw_2d_image_table(
    --     obj_UI_char_select_scene_movie_cover,
    --     image_table_UI_char_select_scene_movie_cover
    -- )
    love.graphics.setBlendMode("alpha")
end

-- main
function draw_char_select_scene_main()
    -- draw_2d_image_table(
    --     obj_UI_char_select_scene_start_0f_110f,
    --     image_table_UI_char_select_scene_start_0_110f
    -- )
    local image_sprite_sheet = image_sprite_sheet_UI_char_select_scene_start_0_110f
    local obj = obj_UI_char_select_scene_start_0f_110f
    image_sprite_sheet["sprite_batch"]:clear()
    draw_2d_image_sprite_batch(obj,image_sprite_sheet,tostring(obj[8]))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    draw_2d_image(
        obj_UI_char_select_scene_icon_select_L,
        image_table_UI_char_select_scene_char_icon_alpha[obj_UI_char_select_scene_icon_select_L[8]]
    )

    if GAME_MODE ~= 0 then
        draw_2d_image(
            obj_UI_char_select_scene_icon_select_R,
            image_table_UI_char_select_scene_char_icon_alpha[obj_UI_char_select_scene_icon_select_R[8]]
        )
    end

    draw_char_select_scene_char_select_LR(1)
    draw_char_select_scene_char_select_LR(2)

    draw_2d_image(
        obj_UI_char_select_scene_bar_mark_L,
        image_UI_char_select_scene_bar_mark
    )

    draw_2d_image(
        obj_UI_char_select_scene_bar_mark_R,
        image_UI_char_select_scene_bar_mark
    )

    draw_2d_image(
        obj_UI_char_select_scene_control_method_L,
        image_UI_char_select_scene_control_method_L
    )

    draw_2d_image(
        obj_UI_char_select_scene_control_method_R,
        image_UI_char_select_scene_control_method_R
    )

    draw_char_select_scene_timer(
        obj_UI_char_select_scene_timer,
        image_table_UI_char_select_scene_number
    )

    draw_char_select_scene_glow(obj_UI_char_select_scene_glow)

    love.graphics.setBlendMode("add")
    draw_2d_image(
        obj_UI_char_select_scene_ring,
        image_UI_char_select_scene_ring
    )
    -- draw_2d_image_table(
    --     obj_UI_char_select_scene_movie_cover,
    --     image_table_UI_char_select_scene_movie_cover
    -- )
    image_sprite_sheet = image_sprite_sheet_UI_char_select_scene_movie_cover
    obj = obj_UI_char_select_scene_movie_cover
    image_sprite_sheet["sprite_batch"]:clear()
    draw_2d_image_sprite_batch(obj,image_sprite_sheet,tostring(obj[8]))
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    love.graphics.setBlendMode("alpha")

    draw_solid(obj_UI_char_select_scene_black_solid)
end

-- common
function draw_char_select_scene_timer(obj,image_table)
    draw_2d_image_table({obj[1],obj[2],nil,1,1,1,0,obj["time"][1]},image_table)
    draw_2d_image_table({obj[1]+13,obj[2],nil,1,1,1,0,obj["time"][2]},image_table)
end
function draw_char_select_scene_glow(obj,f_shader,r_shader)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local opacity = obj[4]
    local r = obj[7]

    if opacity == 0 then
        return
    end

    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    local alpha_points = {}

    for i = 1,#obj["alpha_points"] do
        alpha_points[i] = draw_resolution_correction(obj["alpha_points"][i])
    end

    love.graphics.setCanvas(CANVAS_ALPHA_ONLY)
    love.graphics.clear(0,0,0,0)  
    love.graphics.polygon("fill",alpha_points)

    love.graphics.setCanvas(CANVAS)
    love.graphics.clear(0,0,0,0)  
    love.graphics.setShader(shader_char_select_scene_fractal_noise)
    shader_char_select_scene_fractal_noise:send("time",love.timer.getTime())
    love.graphics.rectangle("fill",0,0,width,height)

    love.graphics.setCanvas(CANVAS_RADIAL_BLUR)
    love.graphics.clear(0,0,0,0)  
    love.graphics.setShader(shader_char_select_scene_radial_blur)
    shader_char_select_scene_radial_blur:send(
        "start_coods",
        {
            draw_resolution_correction(-230),
            draw_resolution_correction(-120)
        }
    )
    shader_char_select_scene_radial_blur:send("input_screen_coords",{ width,height })
    love.graphics.setColor(1,1,1)
    love.graphics.draw(CANVAS)
    love.graphics.setShader()

    love.graphics.setCanvas(CANVAS_ALPHA_COMP)
    love.graphics.clear(0,0,0,0)  
    love.graphics.draw(CANVAS_RADIAL_BLUR)
    love.graphics.setBlendMode('multiply','premultiplied')
    love.graphics.draw(CANVAS_ALPHA_ONLY)
    love.graphics.setBlendMode('alpha','alphamultiply')
    love.graphics.setCanvas()

    love.graphics.setBlendMode("add")
    love.graphics.setColor(1,1,1,opacity)
    love.graphics.draw(CANVAS_ALPHA_COMP)
    love.graphics.setColor(1,1,1,1)
    love.graphics.setBlendMode("alpha")
end
function draw_char_select_scene_char_select_LR(id)
    local obj_UI_char_select_scene_char_select = nil
    local obj_UI_char_select_scene_char_select_text = nil
    local obj_UI_char_select_scene_char_select_char = nil
    local image_UI_char_select_scene_char_select_alpha = nil
    if id == 1 then
        obj_UI_char_select_scene_char_select = obj_UI_char_select_scene_char_select_left
        obj_UI_char_select_scene_char_select_text = obj_UI_char_select_scene_char_select_left_text
        obj_UI_char_select_scene_char_select_char = obj_UI_char_select_scene_char_select_left_char
        image_UI_char_select_scene_char_select_alpha = image_UI_char_select_scene_char_select_left_alpha
    else
        obj_UI_char_select_scene_char_select = obj_UI_char_select_scene_char_select_right
        obj_UI_char_select_scene_char_select_text = obj_UI_char_select_scene_char_select_right_text
        obj_UI_char_select_scene_char_select_char = obj_UI_char_select_scene_char_select_right_char
        image_UI_char_select_scene_char_select_alpha = image_UI_char_select_scene_char_select_right_alpha
    end
    
    local x = draw_resolution_correction(obj_UI_char_select_scene_char_select[1])
    local y = draw_resolution_correction(obj_UI_char_select_scene_char_select[2])
    local sx = draw_resolution_correction(obj_UI_char_select_scene_char_select[5])
    local sy = draw_resolution_correction(obj_UI_char_select_scene_char_select[6])
    local f = obj_UI_char_select_scene_char_select[8]
    local opacity = obj_UI_char_select_scene_char_select[4]

    if opacity == 0 then
        return
    end

    love.graphics.setCanvas(CANVAS_CHAR_COMP_LR)
    love.graphics.clear(24/255,30/255,39/255,1)
    love.graphics.draw(
        image_table_UI_char_select_scene_char_select_char_txt[f],
        obj_UI_char_select_scene_char_select_text[1],
        obj_UI_char_select_scene_char_select_text[2],
        obj_UI_char_select_scene_char_select_text[7],
        obj_UI_char_select_scene_char_select_text[3],
        obj_UI_char_select_scene_char_select_text[4]
    )
    love.graphics.draw(
        image_table_UI_char_select_scene_char_select_char[f],
        obj_UI_char_select_scene_char_select_char[1],
        obj_UI_char_select_scene_char_select_char[2],
        obj_UI_char_select_scene_char_select_char[7],
        obj_UI_char_select_scene_char_select_char[3],
        obj_UI_char_select_scene_char_select_char[4]
    )
    love.graphics.setBlendMode('multiply','premultiplied')
    love.graphics.draw(image_UI_char_select_scene_char_select_alpha,0,0,0,1,1)
    love.graphics.setBlendMode('alpha','alphamultiply')
    love.graphics.setCanvas()
    
    love.graphics.setColor(1,1,1,opacity)
    love.graphics.draw(CANVAS_CHAR_COMP_LR,x,y,0,sx,sy)
    love.graphics.setColor(1,1,1,1)
end
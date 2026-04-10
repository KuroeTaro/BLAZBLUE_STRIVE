function draw_game_scene_main()
    -- 绘制场景固定物
    draw_game_scene_stage_static() -- alpha 2 draw calls

    -- 更新角色的图像位置
    draw_game_scene_char_LP_logic_graphic_pos_sync()
    draw_game_scene_char_RP_logic_graphic_pos_sync()

    -- 绘制 overlay
    draw_game_scene_char_LP_black_overlay()
    draw_game_scene_char_RP_black_overlay()

    -- 绘制背侧VFX
    draw_game_scene_char_LP_VFX_back()
    draw_game_scene_char_RP_VFX_back()

    -- 绘制背侧挂件
    draw_game_scene_char_LP_attachment_back()
    draw_game_scene_char_RP_attachment_back()

    -- 绘制角色阴影
    draw_game_scene_char_LP_shadow()
    draw_game_scene_char_RP_shadow()

    -- 绘制角色
    love.graphics.setCanvas(DRAW_MAIN_CHARACTER_CANVAS)
    love.graphics.clear()
    if CHARACTER_VISUAL_FRONT == "L" then
        draw_game_scene_char_RP() -- IZAYA 2 draw calls 3
        draw_game_scene_char_LP()
    elseif CHARACTER_VISUAL_FRONT == "R" then
        draw_game_scene_char_LP()
        draw_game_scene_char_RP() -- IZAYA 2 draw calls 4
    end
    love.graphics.setCanvas()
    love.graphics.draw(DRAW_MAIN_CHARACTER_CANVAS)

    -- 绘制上帝光
    draw_game_scene_stage_glow() -- 5 draw calls 10

    -- 绘制静态HUD
    draw_2d_image(obj_HUD_game_scene_background_gauge,image_HUD_game_scene_background_gauge) -- 1 draw call 11

    -- 绘制HUD缓入动画
    local obj = obj_HUD_game_scene_ease_in
    local image_sprite_sheet = image_sprite_sheet_announcer_game_scene_HUD_ease_in
    if obj[4] ~= 0 then
        image_sprite_sheet["sprite_batch"]:clear()
        draw_2d_image_sprite_batch(obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        -- draw_2d_image_table(obj_HUD_game_scene_ease_in,image_table_announcer_game_scene_HUD_ease_in) -- 1 draw call 16
    end

    -- 绘制动态HUD
    image_sprite_sheet = image_sprite_sheet_HUD_game_scene_common
    image_sprite_sheet["sprite_batch"]:clear()
    local L_character = obj_char_game_scene_char_LP
    local R_character = obj_char_game_scene_char_RP
    -- health
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_health_bar_LP,
        image_sprite_sheet,
        "HUD_health_bar",
        L_character["health_gauge"][1]/L_character["health_gauge"][3]
    )
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_health_bar_RP,
        image_sprite_sheet,
        "HUD_health_bar",
        R_character["health_gauge"][1]/R_character["health_gauge"][3]
    )
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_health_bar_LP_fade,
        image_sprite_sheet,
        "HUD_health_bar",
        L_character["health_gauge"][2]/L_character["health_gauge"][3]
    )
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_health_bar_RP_fade,
        image_sprite_sheet,
        "HUD_health_bar",
        R_character["health_gauge"][2]/R_character["health_gauge"][3]
    )
    -- ability
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_ability_bar_LP,
        image_sprite_sheet,
        "HUD_ability_bar",
        L_character["ability_gauge"][1]/L_character["ability_gauge"][2]
    )
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_ability_bar_RP,
        image_sprite_sheet,
        "HUD_ability_bar",
        R_character["ability_gauge"][1]/R_character["ability_gauge"][2]
    )
    -- heat
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_heat_bar_LP,
        image_sprite_sheet,
        "HUD_heat_bar",
        L_character["heat_gauge"][1]/L_character["heat_gauge"][2]
    )
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_heat_bar_RP,
        image_sprite_sheet,
        "HUD_heat_bar",
        R_character["heat_gauge"][1]/R_character["heat_gauge"][2]
    )
    draw_game_scene_add_to_sprite_batch_heat_bar_extra(
        obj_HUD_game_scene_heat_bar_LP,
        image_sprite_sheet,
        "HUD_heat_mark",
        L_character["heat_gauge"][1]*4/L_character["heat_gauge"][2]
    )
    draw_game_scene_add_to_sprite_batch_heat_bar_extra(
        obj_HUD_game_scene_heat_bar_RP,
        image_sprite_sheet,
        "HUD_heat_mark",
        R_character["heat_gauge"][1]*4/R_character["heat_gauge"][2]
    )
    -- risk
    draw_game_scene_add_to_sprite_batch_risk_bars(
        obj_HUD_game_scene_risk_LP,
        image_sprite_sheet,
        "HUD_risk_bar",
        L_character["risk_gauge"][1]*3/L_character["risk_gauge"][2]
    )
    draw_game_scene_add_to_sprite_batch_risk_bars(
        obj_HUD_game_scene_risk_RP,
        image_sprite_sheet,
        "HUD_risk_bar",
        R_character["risk_gauge"][1]*3/R_character["risk_gauge"][2]
    )
    -- overdrive
    draw_game_scene_add_to_sprite_batch_overdrive_pie(
        obj_HUD_game_scene_overdrive_pie_LP,
        image_sprite_sheet,
        L_character["overdrive_gauge"][1]*6/L_character["overdrive_gauge"][2]
    )
    draw_game_scene_add_to_sprite_batch_overdrive_pie(
        obj_HUD_game_scene_overdrive_pie_RP,
        image_sprite_sheet,
        R_character["overdrive_gauge"][1]*6/R_character["overdrive_gauge"][2]
    )
    -- overdrive text
    draw_2d_image_sprite_batch(
        obj_HUD_game_scene_overdrive_text_LP,
        image_sprite_sheet,
        "HUD_overdrive_text"
    )
    draw_2d_image_sprite_batch(
        obj_HUD_game_scene_overdrive_text_RP,
        image_sprite_sheet,
        "HUD_overdrive_text"
    )
    -- match point
    draw_2d_image_sprite_batch(
        obj_HUD_game_scene_match_point_LP,
        image_sprite_sheet,
        "HUD_match_point"
    )
    draw_2d_image_sprite_batch(
        obj_HUD_game_scene_match_point_RP,
        image_sprite_sheet,
        "HUD_match_point"
    )
    -- round timer
    draw_game_scene_add_to_sprite_batch_round_timer(
        obj_HUD_game_scene_timer,
        image_sprite_sheet
    )
    -- win mark
    draw_game_scene_add_to_sprite_batch_round_win_marks(
        obj_HUD_game_scene_win_marks_LP,
        image_sprite_sheet,
        "HUD_win_mark",
        WIN_MARK["L"]
    )
    draw_game_scene_add_to_sprite_batch_round_win_marks(
        obj_HUD_game_scene_win_marks_RP,
        image_sprite_sheet,
        "HUD_win_mark",
        WIN_MARK["R"]
    )
    -- overdrive timer
    draw_game_scene_add_to_sprite_batch_overdrive_timer(
        obj_HUD_game_scene_overdrive_timer_LP,
        image_sprite_sheet,
        L_character["overdrive_timer"]
    )
    draw_game_scene_add_to_sprite_batch_overdrive_timer(
        obj_HUD_game_scene_overdrive_timer_RP,
        image_sprite_sheet,
        R_character["overdrive_timer"]
    )
    love.graphics.draw(image_sprite_sheet["sprite_batch"])

    draw_game_scene_char_LP_VFX_HUD()
    draw_game_scene_char_RP_VFX_HUD()

    -- 透过上帝光和HUD
    love.graphics.setColor(1,1,1,0.5)
    love.graphics.draw(DRAW_MAIN_CHARACTER_CANVAS) -- 1 draw call 13
    love.graphics.setColor(1,1,1,1)

    -- 绘制前侧挂件
    draw_game_scene_char_LP_attachment_front()
    draw_game_scene_char_RP_attachment_front()

    -- 绘制前侧VFX
    draw_game_scene_char_LP_VFX_front()
    draw_game_scene_char_RP_VFX_front()

    -- 绘制飞行道具
    draw_game_scene_char_LP_projectile()
    draw_game_scene_char_RP_projectile()

    -- 绘制ease_in annoucer 和 HUD ease in
    obj = obj_annoucer_game_scene_act_common
    if obj[4] ~= 0 then
        image_sprite_sheet = image_sprite_sheet_announcer_game_scene_act_common
        image_sprite_sheet["sprite_batch"]:clear()
        draw_game_scene_act_common(obj_annoucer_game_scene_act_common,image_sprite_sheet)
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end

    obj = obj_annoucer_game_scene_act_num
    if obj[4] ~= 0 then
        image_sprite_sheet = image_sprite_sheet_table_announcer_game_scene_act_number[ROUND_COUNTER]
        image_sprite_sheet["sprite_batch"]:clear()
        draw_2d_image_sprite_batch(obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end

    obj = obj_annoucer_game_scene_lets_dance
    if obj[4] ~= 0 then
        image_sprite_sheet = image_sprite_sheet_announcer_game_scene_lets_dance
        image_sprite_sheet["sprite_batch"]:clear()
        draw_2d_image_sprite_batch(obj,image_sprite_sheet,""..obj[8].."")
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
    end

    -- draw_game_scene_act_common(obj_annoucer_game_scene_act_common,image_table_announcer_game_scene_act_common)
    -- draw_2d_image_table(obj_annoucer_game_scene_act_num,image_table_announcer_game_scene_act_number[ROUND_COUNTER]) -- 1 draw call 15
    -- draw_2d_image_table(obj_annoucer_game_scene_lets_dance,image_table_announcer_game_scene_lets_dance) -- 1 draw call 17

    obj = obj_UI_game_scene_movie_cover
    image_sprite_sheet = image_sprite_sheet_UI_game_scene_movie_cover
    image_sprite_sheet["sprite_batch"]:clear()
    draw_2d_image_sprite_batch(obj,image_sprite_sheet,""..obj[8].."")
    love.graphics.setBlendMode("add")
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    love.graphics.setBlendMode("alpha")

    -- DEBUG
    draw_game_scene_char_LP_hurtbox()
    draw_game_scene_char_RP_hurtbox()
    draw_game_scene_char_LP_pushbox()
    draw_game_scene_char_RP_pushbox()
    draw_game_scene_char_LP_hitbox()
    draw_game_scene_char_RP_hitbox()

    -- 绘制ease in black solid
    draw_solid(obj_UI_game_scene_black_solid)
    
end

-- x y z opacity sx sy r f
function draw_game_scene_add_to_sprite_batch_bars(obj,image_sprite_sheet,quad_name,percentage)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local r = obj[7]
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local opacity = obj[4]

    local frame = image_sprite_sheet["frames"][quad_name]

    local quad = love.graphics.newQuad(
        frame[1],
        frame[2],
        frame[3]*percentage,
        frame[4],
        frame[5],
        frame[6]
    )
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    image_sprite_sheet["sprite_batch"]:add(quad,x,y,r,sx,sy)
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_add_to_sprite_batch_heat_bar_extra(obj,image_sprite_sheet,quad_name,mark_value)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local r = obj[7]
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local opacity = obj[4]

    x = x + 97*sx
    y = y + 11*sy

    local frame = image_sprite_sheet["frames"][quad_name]

    local quad = love.graphics.newQuad(
        frame[1],
        frame[2],
        frame[3],
        frame[4],
        frame[5],
        frame[6]
    )
    local offset_counter = 0
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    for i = 1,3,1 do 
        if mark_value >= 1 then
            image_sprite_sheet["sprite_batch"]:add(quad,x+offset_counter*97*sx,y,r,-sx,sy)
            mark_value = mark_value - 1
            offset_counter = offset_counter + 1
        else
            break
        end
    end
    if mark_value >= 1 then
        x = draw_resolution_correction(obj[1])
        y = draw_resolution_correction(obj[2])
        image_sprite_sheet["sprite_batch"]:add(quad,x+393*sx,y+6*sy,r,-sx,sy)
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_add_to_sprite_batch_risk_bars(obj,image_sprite_sheet,quad_name,risk_value)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local r = obj[7]
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local opacity = obj[4]

    local frame = image_sprite_sheet["frames"][quad_name]

    local quad = love.graphics.newQuad(
        frame[1],
        frame[2],
        frame[3],
        frame[4],
        frame[5],
        frame[6]
    )
    local offset_counter = 0
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    for i = 1,3,1 do 
        if risk_value >= 1 then
            image_sprite_sheet["sprite_batch"]:add(quad,x-offset_counter*30*sx,y,r,sx,sy)
            risk_value = risk_value - 1
            offset_counter = offset_counter + 1
        else
            image_sprite_sheet["sprite_batch"]:setColor(1,1,1,risk_value*opacity)
            image_sprite_sheet["sprite_batch"]:add(quad,x-offset_counter*30*sx,y,r,sx,sy)
            break
        end
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_add_to_sprite_batch_overdrive_pie(obj,image_sprite_sheet,overdrive_value)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local r = obj[7]
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local opacity = obj[4]

    local quad_name_table = {
        "HUD_OD_pie_0",
        "HUD_OD_pie_1",
        "HUD_OD_pie_2",
        "HUD_OD_pie_3",
        "HUD_OD_pie_4",
        "HUD_OD_pie_5"
    }
    local frames = {}
    for i = 1,6,1 do
        frames[i] = image_sprite_sheet["frames"][quad_name_table[i]]
    end
    local quads = {}
    for i = 1,6,1 do
        quads[i] = love.graphics.newQuad(
            frames[i][1],
            frames[i][2],
            frames[i][3],
            frames[i][4],
            frames[i][5],
            frames[i][6]
        )
    end

    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    for i = 1,6,1 do 
        if overdrive_value >= 1 then
            image_sprite_sheet["sprite_batch"]:add(quads[i],x,y,r,sx,sy)
            overdrive_value = overdrive_value - 1
        else
            image_sprite_sheet["sprite_batch"]:setColor(1,1,1,overdrive_value*opacity)
            image_sprite_sheet["sprite_batch"]:add(quads[i],x,y,r,sx,sy)
            break
        end
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_add_to_sprite_batch_round_timer(obj,image_sprite_sheet)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local r = obj[7]
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local opacity = obj[4]

    local quad_name_table = {
        "HUD_nums_0",
        "HUD_nums_1",
        "HUD_nums_2",
        "HUD_nums_3",
        "HUD_nums_4",
        "HUD_nums_5",
        "HUD_nums_6",
        "HUD_nums_7",
        "HUD_nums_8",
        "HUD_nums_9"
    }
    local frames = {}
    for i = 1,10,1 do
        frames[i] = image_sprite_sheet["frames"][quad_name_table[i]]
    end
    local quads = {}
    for i = 1,10,1 do
        quads[i] = love.graphics.newQuad(
            frames[i][1],
            frames[i][2],
            frames[i][3],
            frames[i][4],
            frames[i][5],
            frames[i][6]
        )
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    for i = 1,2,1 do 
        image_sprite_sheet["sprite_batch"]:add(
            quads[ROUND_TIMER[i]+1],
            x+draw_resolution_correction((i-1)*23),
            y,
            r,
            sx,
            sy
        )
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_add_to_sprite_batch_round_win_marks(obj,image_sprite_sheet,quad_name,mark_value)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local r = obj[7]
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local opacity = obj[4]

    local frame = image_sprite_sheet["frames"][quad_name]

    local quad = love.graphics.newQuad(
        frame[1],
        frame[2],
        frame[3],
        frame[4],
        frame[5],
        frame[6]
    )
    local offset_counter = 0
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    for i = 1,10,1 do 
        if mark_value >= 1 then
            image_sprite_sheet["sprite_batch"]:add(quad,x-offset_counter*15*sx,y+offset_counter*3*sy,r,sx,sy)
            mark_value = mark_value - 1
            offset_counter = offset_counter + 1
        else
            break
        end
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_add_to_sprite_batch_overdrive_timer(obj,image_sprite_sheet,time)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local r = obj[7]
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local opacity = obj[4]

    local quad_name_table = {
        "HUD_nums_0",
        "HUD_nums_1",
        "HUD_nums_2",
        "HUD_nums_3",
        "HUD_nums_4",
        "HUD_nums_5",
        "HUD_nums_6",
        "HUD_nums_7",
        "HUD_nums_8",
        "HUD_nums_9",
        "HUD_nums_colon"
    }
    local frames = {}
    for i = 1,11,1 do
        frames[i] = image_sprite_sheet["frames"][quad_name_table[i]]
    end
    local quads = {}
    for i = 1,11,1 do
        quads[i] = love.graphics.newQuad(
            frames[i][1],
            frames[i][2],
            frames[i][3],
            frames[i][4],
            frames[i][5],
            frames[i][6]
        )
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    for i = 1,2,1 do 
        image_sprite_sheet["sprite_batch"]:add(
            quads[time[i]+1],
            x+draw_resolution_correction((i-1)*27),
            y,
            r,
            sx,
            sy
        )
    end
    for i = 1,2,1 do 
        image_sprite_sheet["sprite_batch"]:add(
            quads[time[i+2]+1],
            x+draw_resolution_correction((i-1)*27+72),
            y,
            r,
            sx,
            sy
        )
    end
    image_sprite_sheet["sprite_batch"]:add(
        quads[11],
        x+draw_resolution_correction(49),
        y,
        r,
        sx,
        sy
    )
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_act_common(obj,image_sprite_sheet)
    local f = obj[8]
    local opacity = obj[4]

    if opacity == 0 then
        return
    end

    if image_sprite_sheet["frames"][""..f..""]== nil then
        f = 50
    end

    draw_2d_image_sprite_batch(obj,image_sprite_sheet,""..f.."")
end
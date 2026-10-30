function draw_game_scene_main()
    -- 绘制场景固定物
    draw_game_scene_stage_static() -- alpha 2 draw calls
    -- 更新角色的图像位置
    draw_game_scene_char_LP_logic_graphic_pos_sync()
    draw_game_scene_char_RP_logic_graphic_pos_sync()
    -- 绘制 overlay
    draw_game_scene_char_LP_black_overlay()
    draw_game_scene_char_RP_black_overlay()
    -- 绘制wallbreak_背景
    draw_game_scene_stage_wallbreak_at_character_back()
    -- 绘制角色阴影
    draw_game_scene_char_LP_shadow()
    draw_game_scene_char_RP_shadow()
    -- 绘制RC飞行道具
    draw_game_scene_char_LP_projectile_RC()
    draw_game_scene_char_RP_projectile_RC()
    -- 绘制背侧飞行道具
    draw_game_scene_char_LP_projectile_back()
    draw_game_scene_char_RP_projectile_back()
    -- 绘制背侧VFX
    draw_game_scene_char_LP_VFX_back()
    draw_game_scene_char_RP_VFX_back()
    -- 绘制背侧挂件
    draw_game_scene_char_LP_attachment_back()
    draw_game_scene_char_RP_attachment_back()
    -- 绘制角色
    love.graphics.setCanvas(DRAW_MAIN_CHARACTER_CANVAS)
    love.graphics.clear()
    local side_table = {
        ["L"] = function()
            draw_game_scene_char_RP()
            draw_game_scene_char_LP()
        end,
        ["R"] = function()
            draw_game_scene_char_LP()
            draw_game_scene_char_RP()
        end
    }
    side_table[CHARACTER_VISUAL_FRONT]()
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
    -- round_timer
    draw_game_scene_add_to_sprite_batch_round_timer(obj_HUD_game_scene_timer,image_sprite_sheet)
    -- match_point
    draw_2d_image_sprite_batch(obj_HUD_game_scene_match_point_LP,image_sprite_sheet,"HUD_match_point")
    draw_2d_image_sprite_batch(obj_HUD_game_scene_match_point_RP,image_sprite_sheet,"HUD_match_point")
    -- win_mark
    draw_game_scene_add_to_sprite_batch_round_win_marks(
        obj_HUD_game_scene_win_marks_LP,image_sprite_sheet,"HUD_win_mark",WIN_MARK["L"]
    )
    draw_game_scene_add_to_sprite_batch_round_win_marks(
        obj_HUD_game_scene_win_marks_RP,image_sprite_sheet,"HUD_win_mark",WIN_MARK["R"]
    )
    -- health
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_health_bar_LP,image_sprite_sheet,"HUD_health_bar",
        L_character["health_gauge"][1]/L_character["health_gauge"][3]
    )
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_health_bar_RP,image_sprite_sheet,"HUD_health_bar",
        R_character["health_gauge"][1]/R_character["health_gauge"][3]
    )
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_health_bar_LP_fade,image_sprite_sheet,"HUD_health_bar",
        L_character["health_gauge"][2]/L_character["health_gauge"][3]
    )
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_health_bar_RP_fade,image_sprite_sheet,"HUD_health_bar",
        R_character["health_gauge"][2]/R_character["health_gauge"][3]
    )
    -- ability
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_ability_bar_LP,image_sprite_sheet,"HUD_ability_bar",
        L_character["ability_gauge"][1]/L_character["ability_gauge"][2]
    )
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_ability_bar_RP,image_sprite_sheet,"HUD_ability_bar",
        R_character["ability_gauge"][1]/R_character["ability_gauge"][2]
    )
    -- heat
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_heat_bar_LP,image_sprite_sheet,"HUD_heat_bar",
        L_character["heat_gauge"][1]/L_character["heat_gauge"][2]
    )
    draw_game_scene_add_to_sprite_batch_bars(
        obj_HUD_game_scene_heat_bar_RP,image_sprite_sheet,"HUD_heat_bar",
        R_character["heat_gauge"][1]/R_character["heat_gauge"][2]
    )
    draw_game_scene_add_to_sprite_batch_heat_bar_extra(
        obj_HUD_game_scene_heat_bar_LP,image_sprite_sheet,"HUD_heat_mark",
        L_character["heat_gauge"][1]*4/L_character["heat_gauge"][2]
    )
    draw_game_scene_add_to_sprite_batch_heat_bar_extra(
        obj_HUD_game_scene_heat_bar_RP,image_sprite_sheet,"HUD_heat_mark",
        R_character["heat_gauge"][1]*4/R_character["heat_gauge"][2]
    )
    -- overdrive
    draw_game_scene_add_to_sprite_batch_overdrive_pie(
        obj_HUD_game_scene_overdrive_pie_LP,image_sprite_sheet,
        L_character["overdrive_gauge"][1]*6/L_character["overdrive_gauge"][2]
    )
    draw_game_scene_add_to_sprite_batch_overdrive_pie(
        obj_HUD_game_scene_overdrive_pie_RP,image_sprite_sheet,
        R_character["overdrive_gauge"][1]*6/R_character["overdrive_gauge"][2]
    )
    -- risk
    draw_game_scene_add_to_sprite_batch_risk_bars(
        obj_HUD_game_scene_risk_LP,image_sprite_sheet,"HUD_risk_bar",
        L_character["risk_gauge"][1]*3/L_character["risk_gauge"][2]
    )
    draw_game_scene_add_to_sprite_batch_risk_bars(
        obj_HUD_game_scene_risk_RP,image_sprite_sheet,"HUD_risk_bar",
        R_character["risk_gauge"][1]*3/R_character["risk_gauge"][2]
    )
    -- positive_bonus_text
    draw_2d_image_sprite_batch(obj_HUD_game_scene_positive_bonus_text_LP,image_sprite_sheet,"HUD_positive_bouns_text_LP")
    draw_2d_image_sprite_batch(obj_HUD_game_scene_positive_bonus_text_RP,image_sprite_sheet,"HUD_positive_bouns_text_RP")
    -- overdrive_text
    draw_2d_image_sprite_batch(obj_HUD_game_scene_overdrive_text_LP,image_sprite_sheet,"HUD_overdrive_text")
    draw_2d_image_sprite_batch(obj_HUD_game_scene_overdrive_text_RP,image_sprite_sheet,"HUD_overdrive_text")
    -- overdrive_timer
    draw_game_scene_add_to_sprite_batch_overdrive_timer(
        obj_HUD_game_scene_overdrive_timer_LP,image_sprite_sheet,L_character["overdrive_timer"]
    )
    draw_game_scene_add_to_sprite_batch_overdrive_timer(
        obj_HUD_game_scene_overdrive_timer_RP,image_sprite_sheet,R_character["overdrive_timer"]
    )
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    -- VFX_HUD
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
    draw_game_scene_char_LP_projectile_front()
    draw_game_scene_char_RP_projectile_front()
    -- 绘制wallbreak_前景
    draw_game_scene_stage_wallbreak_at_character_front()
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
-- x_y_z_opacity_sx_sy_r_f
function draw_game_scene_add_to_sprite_batch_bars(
    obj,image_sprite_sheet,quad_name,
    percentage
)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local r = obj[7]
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local opacity = obj[4]
    local frame = image_sprite_sheet["frames"][quad_name]
    local quad = love.graphics.newQuad(frame[1],frame[2],frame[3]*percentage,frame[4],frame[5],frame[6])
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    image_sprite_sheet["sprite_batch"]:add(quad,x,y,r,sx,sy)
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_add_to_sprite_batch_heat_bar_extra(
    obj,image_sprite_sheet,quad_name,
    mark_value
)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local r = obj[7]
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local opacity = obj[4]
    x = x + 97*sx
    y = y + 11*sy
    local frame = image_sprite_sheet["frames"][quad_name]
    local quad = love.graphics.newQuad(frame[1],frame[2],frame[3],frame[4],frame[5],frame[6])
    local offset_counter = 0
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    for i = 1,3,1 do
        if mark_value >= 1 then
            image_sprite_sheet["sprite_batch"]:add(quad,x + offset_counter*97*sx,y,r,-sx,sy)
            mark_value = mark_value - 1
            offset_counter = offset_counter + 1
        else
            break
        end
    end
    if mark_value >= 1 then
        x = draw_resolution_correction(obj[1])
        y = draw_resolution_correction(obj[2])
        image_sprite_sheet["sprite_batch"]:add(quad,x + 393*sx,y + 6*sy,r,-sx,sy)
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_add_to_sprite_batch_risk_bars(
    obj,image_sprite_sheet,quad_name,
    risk_value
)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local r = obj[7]
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local opacity = obj[4]
    local frame = image_sprite_sheet["frames"][quad_name]
    local quad = love.graphics.newQuad(frame[1],frame[2],frame[3],frame[4],frame[5],frame[6])
    local offset_counter = 0
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    for i = 1,3,1 do
        if risk_value >= 1 then
            image_sprite_sheet["sprite_batch"]:add(quad,x - offset_counter*30*sx,y,r,sx,sy)
            risk_value = risk_value - 1
            offset_counter = offset_counter + 1
        else
            image_sprite_sheet["sprite_batch"]:setColor(1,1,1,risk_value*opacity)
            image_sprite_sheet["sprite_batch"]:add(quad,x - offset_counter*30*sx,y,r,sx,sy)
            break
        end
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_add_to_sprite_batch_overdrive_pie(
    obj,image_sprite_sheet,
    overdrive_value
)
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
        quads[i] = love.graphics.newQuad(frames[i][1],frames[i][2],frames[i][3],frames[i][4],frames[i][5],frames[i][6])
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
        quads[i] = love.graphics.newQuad(frames[i][1],frames[i][2],frames[i][3],frames[i][4],frames[i][5],frames[i][6])
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    for i = 1,2,1 do
        image_sprite_sheet["sprite_batch"]:add(
            quads[ROUND_TIMER[i] + 1],x + draw_resolution_correction((i - 1)*23),y,r,sx,sy
        )
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_add_to_sprite_batch_round_win_marks(
    obj,image_sprite_sheet,quad_name,mark_value
)
    local x = draw_resolution_correction(obj[1])
    local y = draw_resolution_correction(obj[2])
    local r = obj[7]
    local sx = draw_resolution_correction(obj[5])
    local sy = draw_resolution_correction(obj[6])
    local opacity = obj[4]
    local frame = image_sprite_sheet["frames"][quad_name]
    local quad = love.graphics.newQuad(frame[1],frame[2],frame[3],frame[4],frame[5],frame[6])
    local offset_counter = 0
    local full_count = math.floor(mark_value)
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    for i = 1,10,1 do
        if full_count >= 1 then
            image_sprite_sheet["sprite_batch"]:add(quad,x - offset_counter*15*sx,y + offset_counter*3*sy,r,sx,sy)
            full_count = full_count - 1
            offset_counter = offset_counter + 1
        else
            break
        end
    end
    -- 小数部分:整格都画完之后,按剩余值在 batch 里补一个半透明的 sprite
    local remain = mark_value - math.floor(mark_value)
    if remain > 0 and offset_counter < 10 then
        image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity*remain)
        image_sprite_sheet["sprite_batch"]:add(quad,x - offset_counter*15*sx,y + offset_counter*3*sy,r,sx,sy)
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_add_to_sprite_batch_overdrive_timer(
    obj,image_sprite_sheet,time
)
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
        quads[i] = love.graphics.newQuad(frames[i][1],frames[i][2],frames[i][3],frames[i][4],frames[i][5],frames[i][6])
    end
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,opacity)
    for i = 1,2,1 do
        image_sprite_sheet["sprite_batch"]:add(quads[time[i] + 1],x + draw_resolution_correction((i - 1)*27),y,r,sx,sy)
    end
    for i = 1,2,1 do
        image_sprite_sheet["sprite_batch"]:add(
            quads[time[i + 2] + 1],x + draw_resolution_correction((i - 1)*27 + 72),y,r,sx,sy
        )
    end
    image_sprite_sheet["sprite_batch"]:add(quads[11],x + draw_resolution_correction(49),y,r,sx,sy)
    image_sprite_sheet["sprite_batch"]:setColor(1,1,1,1)
end
function draw_game_scene_act_common(obj,image_sprite_sheet)
    local f = obj[8]
    local opacity = obj[4]
    if opacity == 0 then
        return
    end
    if image_sprite_sheet["frames"][""..f..""] == nil then
        f = 50
    end
    draw_2d_image_sprite_batch(obj,image_sprite_sheet,""..f.."")
end
-- glsl 程序化粒子
-- DRAW_VFX_PARTICAL_3D_CANVAS 固定贴在 (0,0),不随摄像机移动。
-- 每次绘制都把摄像机位置与特效平面 z 送进 shader,由 shader 重建世界空间粒子场,
-- 因此摄像机横移/推拉时粒子会产生真实视差,而画面四周永远是满的。
-- obj_VFX[3] 是特效所在的世界平面 z
-- time 是逻辑帧计数(顿帧时调用方不推进它,闪烁也会跟着冻结)
-- opacity 是整体不透明度(亮度包络)
-- 这版 LOVE 的 Shader:send 不接受「多个数字」形式,vec 必须给表;
-- 下面两张表复用同一份,避免每帧新建(项目开了 nuGC)
function draw_VFX_game_scene_partical_3d_canvas(obj_VFX,shader,time,opacity)
    local obj_camera = obj_stage_game_scene_camera
    local camera_pos = {obj_camera[1],obj_camera[2],obj_camera[3]}
    local width,height = DRAW_VFX_PARTICAL_3D_CANVAS:getDimensions()
    local partical_3d_res = {width,height}
    love.graphics.setCanvas(DRAW_VFX_PARTICAL_3D_CANVAS)
    love.graphics.clear(0,0,0,0)
    love.graphics.setShader(shader)
    shader:send("time",time)
    shader:send("opacity",opacity)
    shader:send("camera_pos",camera_pos)
    shader:send("anchor_z",obj_VFX[3])
    shader:send("resolution",partical_3d_res)
    love.graphics.rectangle("fill",0,0,width,height)
    love.graphics.setShader()
    love.graphics.setCanvas()
    love.graphics.setBlendMode("add")
    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(DRAW_VFX_PARTICAL_3D_CANVAS)
    love.graphics.setBlendMode("alpha")
end
-- partical_ver1_counter:12 帧渐入 + 24 帧渐出,总共 36 帧
-- (_VFX.lua 里 counter 粒子 VFX 的 life / 帧动画长度也同步改成 36)
function draw_VFX_game_scene_partical_3d_counter_opacity(frame)
    return math.min(1.00,math.max(0.00,(24 - frame)/24))*0.425
end
-- overdrive_badge_partical:徽章收缩聚集 / 放大爆发 + 冲击波
-- 粒子部分:一张预生成的 quad mesh(数量见 OVERDRIVE_BADGE_PARTICAL_CONFIG),
--   位置/尺寸/拖尾全部由 shaders/overdrive_badge_particle.glsl 的顶点着色器
--   按粒子编号 + 帧号算出来,所以只占一次 draw call,CPU 侧没有逐粒子开销。
-- 顶点数据直接塞进 LOVE 的默认顶点格式(VertexPosition = 角点、VertexTexCoord.x = 粒子编号),
-- 不使用自定义 attribute,所以 11.x / 12.0 都不会有顶点格式的弃用警告,
-- 也不依赖 12.0 里自定义 attribute 的绑定位置。
-- 冲击波部分:shaders/overdrive_badge_partical_3d.glsl 全屏逐像素求值。
-- center / radius 每帧用 3D 投影重算,所以两者都跟着角色位置与镜头推拉走;
-- 直接以 add 混合画在屏幕上,和原 badge 同属角色背侧层。
-- 所有可调数值都来自 _overdrive_badge_partical_config.lua,这里只负责送 uniform。
-- 三张表复用同一份,避免每帧新建(项目开了 nuGC)
local VFX_GAME_SCENE_BADGE_CENTER = {0,0}
local VFX_GAME_SCENE_BADGE_RESOLUTION = {0,0}
local VFX_GAME_SCENE_BADGE_PARTICLE_MESH = nil
local VFX_GAME_SCENE_BADGE_PARTICLE_MESH_COUNT = 0
function common_game_scene_get_overdrive_badge_particle_mesh()
    local config = OVERDRIVE_BADGE_PARTICAL_CONFIG
    local particle_count = config.particle_count
    if VFX_GAME_SCENE_BADGE_PARTICLE_MESH ~= nil
    and VFX_GAME_SCENE_BADGE_PARTICLE_MESH_COUNT == particle_count then
        return VFX_GAME_SCENE_BADGE_PARTICLE_MESH
    end
    -- 每颗粒子两个三角形:角点顺序 (0,0)(1,0)(1,1) / (0,0)(1,1)(0,1)
    local corner_table = {
        {0,0},{1,0},{1,1},
        {0,0},{1,1},{0,1}
    }
    local vertices = {}
    local write = 0
    for i = 0,particle_count - 1,1 do
        for c = 1,6,1 do
            write = write + 1
            -- x,y = 角点(0/1),u = 粒子编号,v = 0,颜色固定白
            vertices[write] = {corner_table[c][1],corner_table[c][2],i,0,1,1,1,1}
        end
    end
    VFX_GAME_SCENE_BADGE_PARTICLE_MESH =
    love.graphics.newMesh(vertices,"triangles","static")
    VFX_GAME_SCENE_BADGE_PARTICLE_MESH_COUNT = particle_count
    return VFX_GAME_SCENE_BADGE_PARTICLE_MESH
end
function draw_VFX_game_scene_overdrive_badge_partical(
    obj_VFX,shockwave_shader,particle_shader,frame,opacity
)
    local obj_camera = obj_stage_game_scene_camera
    local width,height = love.graphics.getDimensions()
    local projection = draw_resolution_correction(800)/(obj_VFX[3] - obj_camera[3])
    local coords = draw_3d_point_to_2D(obj_camera,obj_VFX)
    VFX_GAME_SCENE_BADGE_CENTER[1] = coords[1]
    VFX_GAME_SCENE_BADGE_CENTER[2] = coords[2]
    VFX_GAME_SCENE_BADGE_RESOLUTION[1] = width
    VFX_GAME_SCENE_BADGE_RESOLUTION[2] = height
    local radius = 500*projection
    local config = OVERDRIVE_BADGE_PARTICAL_CONFIG
    local particle_mesh = common_game_scene_get_overdrive_badge_particle_mesh()
    love.graphics.setBlendMode("add")
    love.graphics.setColor(1,1,1,1)
    -- 粒子:收缩段(phase 0)与爆发段(phase 1)在 28-29 帧重叠
    if frame <= 29 or frame >= 28 then
        particle_shader:send("time",frame)
        particle_shader:send("opacity",opacity)
        particle_shader:send("center",VFX_GAME_SCENE_BADGE_CENTER)
        particle_shader:send("radius",radius)
        particle_shader:send("scale_anim",obj_VFX["scale_anim"])
        particle_shader:send("size_scale",config.size_scale)
        particle_shader:send("spin_scale",config.spin_scale)
        particle_shader:send("trail_scale",config.trail_scale)
        particle_shader:send("start_radius_min",config.converge_start_min)
        particle_shader:send("start_radius_max",config.converge_start_max)
        particle_shader:send("target_radius_ratio",config.converge_target)
        love.graphics.setShader(particle_shader)
        if frame <= 29 then
            particle_shader:send("phase",0)
            love.graphics.draw(particle_mesh)
        end
        if frame >= 28 then
            particle_shader:send("phase",1)
            love.graphics.draw(particle_mesh)
        end
    end
    -- 冲击波 / 中心闪光 / 蓄力光
    love.graphics.setShader(shockwave_shader)
    shockwave_shader:send("time",frame)
    shockwave_shader:send("opacity",opacity)
    shockwave_shader:send("center",VFX_GAME_SCENE_BADGE_CENTER)
    shockwave_shader:send("radius",radius)
    shockwave_shader:send("resolution",VFX_GAME_SCENE_BADGE_RESOLUTION)
    shockwave_shader:send("shockwave_radius_start",config.shockwave_radius_start)
    shockwave_shader:send("shockwave_radius_grow",config.shockwave_radius_grow)
    shockwave_shader:send("shockwave_width_base",config.shockwave_width_base)
    shockwave_shader:send("shockwave_width_grow",config.shockwave_width_grow)
    shockwave_shader:send("shockwave_brightness",config.shockwave_brightness)
    love.graphics.rectangle("fill",0,0,width,height)
    love.graphics.setColor(1,1,1,1)
    love.graphics.setBlendMode("alpha")
    love.graphics.setShader()
end
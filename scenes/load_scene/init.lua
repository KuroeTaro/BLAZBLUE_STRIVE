-- 只有load场景使用init前缀
-- 其他场景有load和unload配套使用
function init_load_scene_obj()
    -- 场景object
    -- x_y_z_opacity_sx_sy_r_f
    -- load_text
    obj_UI_load_scene_loading_text = {1350,800,nil,0,1,1,0,0}
    obj_UI_load_scene_loading_text["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_loading_text["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_loading_text["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_loading_text["state"] = "default"
    -- type_in_mark
    obj_UI_load_scene_type_in_mark = {1460,798,nil,0,1,1,0,0}
    obj_UI_load_scene_type_in_mark["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_type_in_mark["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_type_in_mark["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_type_in_mark["state"] = "default"
    -- dabo_trig
    obj_UI_load_scene_dabo_trig = {1280,800,nil,0,1,1,0,0}
    obj_UI_load_scene_dabo_trig["FCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_dabo_trig["LCT"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_dabo_trig["LCD"] = {0,0,0,0,0,0,0,0}
    obj_UI_load_scene_dabo_trig["state"] = "default"
end
function init_load_scene_anim()
    -- x_y_z_opacity_sx_sy_r_f
    -- 1 2 3 4       5  6  7 8
    -- loading_text_ease_in_opacity
    anim_UI_frame_load_scene_loading_text_ease_in_opacity = {}
    anim_UI_frame_load_scene_loading_text_ease_in_opacity[0] = 0
    anim_UI_frame_load_scene_loading_text_ease_in_opacity[4] = 1
    anim_UI_frame_load_scene_loading_text_ease_in_opacity["prop"] = 4
    anim_UI_frame_load_scene_loading_text_ease_in_opacity["length"] = 4
    anim_UI_frame_load_scene_loading_text_ease_in_opacity["loop"] = false
    -- loading_text_ease_out_x
    anim_UI_frame_load_scene_loading_text_ease_out_x = {}
    anim_UI_frame_load_scene_loading_text_ease_out_x[0] = 1350
    anim_UI_frame_load_scene_loading_text_ease_out_x[1] = 1320
    anim_UI_frame_load_scene_loading_text_ease_out_x[3] = 1360
    anim_UI_frame_load_scene_loading_text_ease_out_x["prop"] = 1
    anim_UI_frame_load_scene_loading_text_ease_out_x["length"] = 3
    anim_UI_frame_load_scene_loading_text_ease_out_x["loop"] = false
    -- loading_text_ease_out_opacity
    anim_UI_frame_load_scene_loading_text_ease_out_opacity = {}
    anim_UI_frame_load_scene_loading_text_ease_out_opacity[0] = 1
    anim_UI_frame_load_scene_loading_text_ease_out_opacity[5] = 0
    anim_UI_frame_load_scene_loading_text_ease_out_opacity["prop"] = 4
    anim_UI_frame_load_scene_loading_text_ease_out_opacity["length"] = 5
    anim_UI_frame_load_scene_loading_text_ease_out_opacity["loop"] = false
    -- type_in_mark_ease_in_opacity
    anim_UI_frame_load_scene_type_in_mark_ease_in_opacity = {}
    anim_UI_frame_load_scene_type_in_mark_ease_in_opacity[0] = 0
    anim_UI_frame_load_scene_type_in_mark_ease_in_opacity[4] = 1
    anim_UI_frame_load_scene_type_in_mark_ease_in_opacity["prop"] = 4
    anim_UI_frame_load_scene_type_in_mark_ease_in_opacity["length"] = 4
    anim_UI_frame_load_scene_type_in_mark_ease_in_opacity["loop"] = false
    -- type_in_mark_blink_opacity
    anim_UI_frame_load_scene_type_in_mark_blink_opacity = {}
    anim_UI_frame_load_scene_type_in_mark_blink_opacity[0] = 1
    anim_UI_frame_load_scene_type_in_mark_blink_opacity[10] = 0
    anim_UI_frame_load_scene_type_in_mark_blink_opacity[20] = 1
    anim_UI_frame_load_scene_type_in_mark_blink_opacity["prop"] = 4
    anim_UI_frame_load_scene_type_in_mark_blink_opacity["length"] = 20
    anim_UI_frame_load_scene_type_in_mark_blink_opacity["loop"] = true
    -- dabo_trig_ease_in_x
    anim_UI_frame_load_scene_dabo_trig_ease_in_x = {}
    anim_UI_frame_load_scene_dabo_trig_ease_in_x[0] = 1280
    anim_UI_frame_load_scene_dabo_trig_ease_in_x[2] = 1250
    anim_UI_frame_load_scene_dabo_trig_ease_in_x[4] = 1300
    anim_UI_frame_load_scene_dabo_trig_ease_in_x["prop"] = 1
    anim_UI_frame_load_scene_dabo_trig_ease_in_x["length"] = 4
    anim_UI_frame_load_scene_dabo_trig_ease_in_x["loop"] = false
    -- dabo_trig_ease_out_x
    anim_UI_frame_load_scene_dabo_trig_ease_out_x = {}
    anim_UI_frame_load_scene_dabo_trig_ease_out_x[0] = 1300
    anim_UI_frame_load_scene_dabo_trig_ease_out_x[1] = 1280
    anim_UI_frame_load_scene_dabo_trig_ease_out_x[3] = 1305
    anim_UI_frame_load_scene_dabo_trig_ease_out_x["prop"] = 1
    anim_UI_frame_load_scene_dabo_trig_ease_out_x["length"] = 3
    anim_UI_frame_load_scene_dabo_trig_ease_out_x["loop"] = false
    -- dabo_trig_ease_out_opacity
    anim_UI_frame_load_scene_dabo_trig_ease_out_opacity = {}
    anim_UI_frame_load_scene_dabo_trig_ease_out_opacity[0] = 1
    anim_UI_frame_load_scene_dabo_trig_ease_out_opacity[5] = 0
    anim_UI_frame_load_scene_dabo_trig_ease_out_opacity["prop"] = 4
    anim_UI_frame_load_scene_dabo_trig_ease_out_opacity["length"] = 5
    anim_UI_frame_load_scene_dabo_trig_ease_out_opacity["loop"] = false
end
function init_load_scene_image()
    image_UI_load_scene_dabo_trig = love.graphics.newImage("asset/load_scene/texture/dabo_trig.dds")
    image_UI_load_scene_loading_text = love.graphics.newImage("asset/load_scene/texture/loading_text.dds")
    image_UI_load_scene_type_in_mark = love.graphics.newImage("asset/load_scene/texture/type_in_mark.dds")
end
function init_load_scene_audio()
    -- end_load
    audio_UI_SFX_load_scene_general_end_load = {1}
    audio_UI_SFX_load_scene_general_end_load["LCT"] = {0}
    audio_UI_SFX_load_scene_general_end_load["LCD"] = {0}
    audio_UI_SFX_load_scene_general_end_load["audio"] = love.audio.newSource(
        "asset/load_scene/audio/end_load.ogg","static"
    )
    update_SFX_VOLUME(audio_UI_SFX_load_scene_general_end_load)
    -- loading
    audio_UI_SFX_load_scene_general_loading = {1}
    audio_UI_SFX_load_scene_general_loading["LCT"] = {0}
    audio_UI_SFX_load_scene_general_loading["LCD"] = {0}
    audio_UI_SFX_load_scene_general_loading["audio"] = love.audio.newSource(
        "asset/load_scene/audio/loading.ogg","static"
    )
    update_SFX_VOLUME(audio_UI_SFX_load_scene_general_loading)
    -- start_load
    audio_UI_SFX_load_scene_general_start_load = {1}
    audio_UI_SFX_load_scene_general_start_load["LCT"] = {0}
    audio_UI_SFX_load_scene_general_start_load["LCD"] = {0}
    audio_UI_SFX_load_scene_general_start_load["audio"] = love.audio.newSource(
        "asset/load_scene/audio/start_load.ogg","static"
    )
    update_SFX_VOLUME(audio_UI_SFX_load_scene_general_start_load)
end
-- 资产暖机:每次 load_scene 把所有 order 跑完之后,统一在这里预热一次
--   项目里的美术资产命名有规律,所以这里按「名字前缀 + 类型」找,不做全量 typeOf 扫描:
--     · shader*   -> Shader,或 shader 表(shader_game_scene_LP / RP 这种一张表里装多个)
--     · image*    -> Image / SpriteBatch / 序列帧表 { sprite_batch = ..., frames = ... }
--                    (还有 image_sprite_sheet_table_* 这种一层套一层的,往里探两层)
--     · *CANVAS  -> Canvas(DRAW_MAIN_CHARACTER_CANVAS 之类)
--   预热方式:
--     · Shader:1x1 贴图 + 8x8 canvas 空绘制一次(编译 / 链接 / 首次采样都跑过)
--     · 贴图 / 图集 texture / Canvas:缩到很小画一次,让驱动把整张纹理传上显存
--   单个资产出错只 pcall 跳过,不影响加载;结束时图形状态全部还原。
function set_load_scene_asset_warm_up()
    local warm_up_canvas = love.graphics.newCanvas(8,8)
    local warm_up_image = love.graphics.newImage(love.image.newImageData(1,1))
    local texture_count = 0
    local shader_count = 0

    local function draw_texture(texture)
        if texture == nil then
            return
        end
        pcall(function()
            love.graphics.setCanvas(warm_up_canvas)
            love.graphics.setBlendMode("replace")
            love.graphics.setColor(1,1,1,1)
            love.graphics.setShader()
            -- 缩到很小画一次:只为让驱动把整张纹理传上显存
            love.graphics.draw(texture,0,0,0,0.05,0.05)
        end)
        texture_count = texture_count + 1
    end

    local function draw_shader(shader)
        if shader == nil then
            return
        end
        pcall(function()
            love.graphics.setCanvas(warm_up_canvas)
            love.graphics.clear(0,0,0,1)
            love.graphics.setBlendMode("replace")
            love.graphics.setColor(1,1,1,1)
            love.graphics.setShader(shader)
            love.graphics.draw(warm_up_image,0,0)
            love.graphics.setShader()
        end)
        shader_count = shader_count + 1
    end

    -- image* 的 userdata:可能是 Image,也可能是 image_sprite_batch_* 这种单独的 SpriteBatch
    local function draw_image_object(value)
        if type(value) ~= "userdata" or value.typeOf == nil then
            return
        end
        if value:typeOf("SpriteBatch") then
            draw_texture(value:getTexture())
        elseif value:typeOf("Image") then
            draw_texture(value)
        end
    end

    -- image* 的表:序列帧表(可能一层套一层),只探两层,顺便防环
    local visited_table = {}
    local function draw_image_table(value,depth)
        if type(value) ~= "table" or depth <= 0 or visited_table[value] then
            return
        end
        visited_table[value] = true
        draw_image_object(value["sprite_batch"])
        draw_image_object(value["image"])
        for _, child in pairs(value) do
            if type(child) == "table" then
                draw_image_table(child,depth - 1)
            end
        end
    end

    -- shader* 的表:一张表里装多个 shader(shader_game_scene_LP / RP)
    local function draw_shader_table(value,depth)
        if type(value) ~= "table" or depth <= 0 or visited_table[value] then
            return
        end
        visited_table[value] = true
        for _, child in pairs(value) do
            if type(child) == "userdata" then
                draw_shader(child)
            elseif type(child) == "table" then
                draw_shader_table(child,depth - 1)
            end
        end
    end

    for name, value in pairs(_G) do
        if type(name) == "string" then
            if string.sub(name,1,6) == "shader" then
                -- shader*
                if type(value) == "userdata" then
                    draw_shader(value)
                elseif type(value) == "table" then
                    draw_shader_table(value,2)
                end
            elseif string.sub(name,1,5) == "image" then
                -- image*
                if type(value) == "userdata" then
                    draw_image_object(value)
                elseif type(value) == "table" then
                    draw_image_table(value,2)
                end
            elseif string.find(name,"CANVAS") ~= nil then
                -- *CANVAS
                if type(value) == "userdata" then
                    draw_texture(value)
                end
            end
        end
    end

    -- 收尾:图形状态还原
    love.graphics.setShader()
    love.graphics.setCanvas()
    love.graphics.setColor(1,1,1,1)
    love.graphics.setBlendMode("alpha")
    return texture_count,shader_count
end

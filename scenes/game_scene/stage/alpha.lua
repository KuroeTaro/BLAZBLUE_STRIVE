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
    -- main
    obj_stage_game_scene_main = {0,0,0,1,1,1,0,0}
    obj_stage_game_scene_main["f"] = 0
    obj_stage_game_scene_main["state"] = "main"
    obj_stage_game_scene_main["wallbreak_hit_side_obj_char"] = nil
    obj_stage_game_scene_main["wallbreak_hurt_side_obj_char"] = nil
    obj_stage_game_scene_main["camera_active_application_table"] = {}
    obj_stage_game_scene_main["wallstick_char_obj_active_application_table"] = {}
    obj_stage_game_scene_main["wallstick_stage_obj_active_application_table"] = {}
    obj_stage_game_scene_main["wallbreak_active_application_table"] = {}

    -- camera
    obj_stage_game_scene_camera = {0,-365,-800}
    obj_stage_game_scene_camera["3d_pos_x"] = 0
    obj_stage_game_scene_camera["3d_pos_y"] = -365
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

    -- wallstick
    obj_stage_game_scene_wallstick = {}
    obj_stage_game_scene_wallstick = {1800,-450,0,0,0,1,0,0}
    obj_stage_game_scene_wallstick["FCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallstick["LCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallstick["LCD"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallstick["state"] = "off"
    obj_stage_game_scene_wallstick["sprite_sheet"] = 0

    -- wallbreak
    obj_stage_game_scene_wallbreak_after_debris = {0,-865,0,0,0,1,0,0}
    obj_stage_game_scene_wallbreak_after_debris["FCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_after_debris["LCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_after_debris["LCD"] = {0,0,0,0,0,0,0,0}

    obj_stage_game_scene_wallbreak_dynamic = {0,-610,0,0,0,1,0,0}
    obj_stage_game_scene_wallbreak_dynamic["FCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_dynamic["LCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_dynamic["LCD"] = {0,0,0,0,0,0,0,0}

    obj_stage_game_scene_wallbreak_smoke = {0,-25,0,0,0,1.3,0,0}
    obj_stage_game_scene_wallbreak_smoke["FCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_smoke["LCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_smoke["LCD"] = {0,0,0,0,0,0,0,0}

    obj_stage_game_scene_wallbreak_glow = {0,-630,0,0,0,2,0,0}
    obj_stage_game_scene_wallbreak_glow["FCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_glow["LCT"] = {0,0,0,0,0,0,0,0}
    obj_stage_game_scene_wallbreak_glow["LCD"] = {0,0,0,0,0,0,0,0}

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
    obj_stage_game_scene_ground = {-4000,-45,200,1,1,1,0,0}

    obj_stage_game_scene_glow_with_linear_fade_alpha = {0,0,-800,1,1,1,0,0}
    obj_stage_game_scene_glow_with_linear_fade_alpha["glow_3d_pos"] = {0,-2565,1600}

    obj_stage_game_scene_stair = {-4000,-190,300,1,1,1,0,0}

    obj_stage_game_scene_tile_map = {-4000,-2215,800,1,1,1,0,0}
end
function load_game_scene_anim_stage()
    -- common
    -- stage
    anim_stage_game_scene_wallbreak_main = {}
    anim_stage_game_scene_wallbreak_main[0] = function()
    end
    anim_stage_game_scene_wallbreak_main[105] = function()
        load_game_scene_wallbreak_mid_init_LP()
        load_game_scene_wallbreak_mid_init_RP()
    end
    anim_stage_game_scene_wallbreak_main[150] = function()
    end
    anim_stage_game_scene_wallbreak_main["prop_f"] = "f"
    anim_stage_game_scene_wallbreak_main["anim_length"] = 150

    -- camera_animation
    anim_stage_point_linear_game_scene_camera_enclosing = {}
    anim_stage_point_linear_game_scene_camera_enclosing[0] = {0.00,0}
    anim_stage_point_linear_game_scene_camera_enclosing["prop"] = "enclose_percentage"
    anim_stage_point_linear_game_scene_camera_enclosing["length"] = 0
    anim_stage_point_linear_game_scene_camera_enclosing["loop"] = false
    anim_stage_point_linear_game_scene_camera_enclosing["fix_type"] = true

    anim_stage_point_linear_game_scene_camera_shake_x = {}
    anim_stage_point_linear_game_scene_camera_shake_y = {}

    -- wallstick
    anim_state_frame_game_scene_wallstick_frame = {}
    for i = 0,19 do
        anim_state_frame_game_scene_wallstick_frame[i] = i
    end
    anim_state_frame_game_scene_wallstick_frame["prop"] = 8
    anim_state_frame_game_scene_wallstick_frame["length"] = 19
    anim_state_frame_game_scene_wallstick_frame["loop"] = false

    -- wallbreak
    -- camera_animation
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x = {}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x["prop"] = "3d_pos_x"
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x["length"] = 150
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x["loop"] = false
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x["fix_type"] = true

    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y = {}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y["prop"] = "3d_pos_y"
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y["length"] = 150
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y["loop"] = false
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y["fix_type"] = true

    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z = {}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z["prop"] = "3d_pos_z"
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z["length"] = 150
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z["loop"] = false
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z["fix_type"] = true

    -- wallbreak_hit_side_character
    anim_stage_frame_game_scene_char_hit_side_wallbreak_shadow_opeacity = {}
    anim_stage_frame_game_scene_char_hit_side_wallbreak_shadow_opeacity[0] = 0
    anim_stage_frame_game_scene_char_hit_side_wallbreak_shadow_opeacity[105] = 0.5
    anim_stage_frame_game_scene_char_hit_side_wallbreak_shadow_opeacity[150] = 0.5
    anim_stage_frame_game_scene_char_hit_side_wallbreak_shadow_opeacity["prop"] = "shadow_opacity"
    anim_stage_frame_game_scene_char_hit_side_wallbreak_shadow_opeacity["length"] = 150
    anim_stage_frame_game_scene_char_hit_side_wallbreak_shadow_opeacity["loop"] = false

    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x = {}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x["prop"] = "x"
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x["length"] = 150
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x["loop"] = false
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x["fix_type"] = true

    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y = {}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y["prop"] = "y"
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y["length"] = 150
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y["loop"] = false
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y["fix_type"] = true

    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame = {}
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame["prop"] = 8
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame["length"] = 150
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame["loop"] = false

    anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state = {}
    anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state["prop"] = "sprite_sheet_state"
    anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state["length"] = 150
    anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state["loop"] = false

    anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos = {}
    anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos["prop"] = "anchor_pos"
    anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos["length"] = 150
    anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos["loop"] = false

    -- wallbreak_hurt_side_character
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x = {}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x["prop"] = "x"
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x["length"] = 150
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x["loop"] = false
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x["fix_type"] = true

    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y = {}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y["prop"] = "y"
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y["length"] = 150
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y["loop"] = false
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y["fix_type"] = true

    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame = {}
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame["prop"] = 8
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame["length"] = 150
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame["loop"] = false

    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_shadow_opeacity = {}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_shadow_opeacity[0] = {0.5,10}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_shadow_opeacity[10] = {0,104}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_shadow_opeacity[104] = {0,105}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_shadow_opeacity[105] = {0.5,150}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_shadow_opeacity[150] = {0.5,150}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_shadow_opeacity["prop"] = "shadow_opacity"
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_shadow_opeacity["length"] = 150
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_shadow_opeacity["loop"] = false
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_shadow_opeacity["fix_type"] = true

    -- wallbreak_after_debris_opacity_anim after_debris 105f-150f
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity = {}
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity[0] = {0,104}
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity[104] = {0,105}
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity[105] = {1,120}
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity[120] = {1,150}
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity[150] = {0,150}
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity["prop"] = 4
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity["length"] = 150
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity["loop"] = false
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity["fix_type"] = true
    -- wallbreak_after_debris_frame_anim
    anim_stage_frame_game_scene_wallbreak_after_debris_frame = {}
    anim_stage_frame_game_scene_wallbreak_after_debris_frame[0] = 0
    for i = 0,14 do
        anim_stage_frame_game_scene_wallbreak_after_debris_frame[i*3+105] = i
    end
    anim_stage_frame_game_scene_wallbreak_after_debris_frame[150] = 14
    anim_stage_frame_game_scene_wallbreak_after_debris_frame["prop"] = 8
    anim_stage_frame_game_scene_wallbreak_after_debris_frame["length"] = 150
    anim_stage_frame_game_scene_wallbreak_after_debris_frame["loop"] = false

    -- wallbreak_dynamic_frame_anim_opacity
    anim_stage_frame_game_scene_wallbreak_dynamic_opacity = {}
    anim_stage_frame_game_scene_wallbreak_dynamic_opacity[0] = 1
    anim_stage_frame_game_scene_wallbreak_dynamic_opacity[60] = 0
    anim_stage_frame_game_scene_wallbreak_dynamic_opacity[150] = 0
    anim_stage_frame_game_scene_wallbreak_dynamic_opacity["prop"] = 4
    anim_stage_frame_game_scene_wallbreak_dynamic_opacity["length"] = 150
    anim_stage_frame_game_scene_wallbreak_dynamic_opacity["loop"] = false
    -- wallbreak_dynamic_frame_anim_frame
    anim_stage_frame_game_scene_wallbreak_dynamic_frame = {}
    for i = 0,29 do
        anim_stage_frame_game_scene_wallbreak_dynamic_frame[i*2] = i
    end
    anim_stage_frame_game_scene_wallbreak_dynamic_frame[60] = 29
    anim_stage_frame_game_scene_wallbreak_dynamic_frame[150] = 29
    anim_stage_frame_game_scene_wallbreak_dynamic_frame["prop"] = 8
    anim_stage_frame_game_scene_wallbreak_dynamic_frame["length"] = 150
    anim_stage_frame_game_scene_wallbreak_dynamic_frame["loop"] = false

    -- wallbreak_smoke_opacity_anim
    anim_stage_point_linear_game_scene_wallbreak_smoke_opacity = {}
    anim_stage_point_linear_game_scene_wallbreak_smoke_opacity[0] = {0,45}
    anim_stage_point_linear_game_scene_wallbreak_smoke_opacity[45] = {0,55}
    anim_stage_point_linear_game_scene_wallbreak_smoke_opacity[55] = {1,105}
    anim_stage_point_linear_game_scene_wallbreak_smoke_opacity[105] = {1,120}
    anim_stage_point_linear_game_scene_wallbreak_smoke_opacity[120] = {0,150}
    anim_stage_point_linear_game_scene_wallbreak_smoke_opacity[150] = {0,150}
    anim_stage_point_linear_game_scene_wallbreak_smoke_opacity["prop"] = 4
    anim_stage_point_linear_game_scene_wallbreak_smoke_opacity["length"] = 150
    anim_stage_point_linear_game_scene_wallbreak_smoke_opacity["loop"] = false
    anim_stage_point_linear_game_scene_wallbreak_smoke_opacity["fix_type"] = true
    -- wallbreak_smoke_frame_anim
    anim_stage_frame_game_scene_wallbreak_smoke_frame = {}
    anim_stage_frame_game_scene_wallbreak_smoke_frame[0] = 0
    for i = 0,24 do
        anim_stage_frame_game_scene_wallbreak_smoke_frame[i*3+45] = i
    end
    anim_stage_frame_game_scene_wallbreak_smoke_frame[120] = 24
    anim_stage_frame_game_scene_wallbreak_smoke_frame[150] = 24
    anim_stage_frame_game_scene_wallbreak_smoke_frame["prop"] = 8
    anim_stage_frame_game_scene_wallbreak_smoke_frame["length"] = 150
    anim_stage_frame_game_scene_wallbreak_smoke_frame["loop"] = false

    -- wallbreak_glow_opacity
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity = {}
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity[0] = {0,5}
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity[5] = {0.035,10}
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity[10] = {0.13,15}
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity[15] = {0.25,20}
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity[20] = {0.37,25}
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity[25] = {0.46,30}
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity[30] = {0.5,59}
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity[59] = {0.5,60}
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity[60] = {0,150}
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity[150] = {0,150}
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity["prop"] = 4
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity["length"] = 150
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity["loop"] = false
    anim_stage_point_linear_game_scene_wallbreak_glow_opacity["fix_type"] = true

    -- uncommon
end
function order_load_game_scene_stage(load_order)
    local switch = 
    {
        [21] = function()
            image_sprite_sheet_stage_game_scene_wallbreak_after_debris = 
            common_sprite_sheet_load(
                "asset/game_scene/stage/alpha/wallbreak_after_debris.json",
                love.graphics.newImage(ASSET_DATA[4][1])
            )
            image_sprite_sheet_stage_game_scene_wallbreak_dynamic  = 
            common_sprite_sheet_load(
                "asset/game_scene/stage/alpha/wallbreak_dynamic.json",
                love.graphics.newImage(ASSET_DATA[4][2])
            )
            image_stage_game_scene_wallbreak_glow = love.graphics.newImage(ASSET_DATA[4][3])
            image_sprite_sheet_stage_game_scene_wallbreak_smoke = 
            common_sprite_sheet_load(
                "asset/game_scene/stage/alpha/wallbreak_smoke.json",
                love.graphics.newImage(ASSET_DATA[4][4])
            )

            image_sprite_sheet_stage_game_scene_wallstick = {}
            image_sprite_sheet_stage_game_scene_wallstick[0] = 
            common_sprite_sheet_load(
                "asset/game_scene/stage/alpha/wallstick_ver0.json",
                love.graphics.newImage(ASSET_DATA[4][5])
            )
            image_sprite_sheet_stage_game_scene_wallstick[1] = 
            common_sprite_sheet_load(
                "asset/game_scene/stage/alpha/wallstick_ver1.json",
                love.graphics.newImage(ASSET_DATA[4][6])
            )

            -- stage_VFX
                -- shockwave
            image_sprite_sheet_VFX_game_scene_air_dash_shockwave =
            common_sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/alpha/air_dash_shockwave.json",
                love.graphics.newImage(ASSET_DATA[4]["air_dash_shockwave"])
            )
                -- smoke
            image_sprite_sheet_VFX_game_scene_dash_shot = 
            common_sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/alpha/dash_shot.json",
                love.graphics.newImage(ASSET_DATA[4]["dash_shot"])
            )
            image_sprite_sheet_VFX_game_scene_horizontal_shot = 
            common_sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/alpha/horizontal_shot.json",
                love.graphics.newImage(ASSET_DATA[4]["horizontal_shot"])
            )
            image_sprite_sheet_VFX_game_scene_land_blow = 
            common_sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/alpha/land_blow.json",
                love.graphics.newImage(ASSET_DATA[4]["land_blow"])
            )
            image_sprite_sheet_VFX_game_scene_vertical_shot = 
            common_sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/alpha/vertical_shot.json",
                love.graphics.newImage(ASSET_DATA[4]["vertical_shot"])
            )
                -- spark
            image_sprite_sheet_VFX_game_scene_dcc_blow = 
            common_sprite_sheet_load(
                "asset/game_scene/VFX/stage_VFX/alpha/dcc_blow.json",
                love.graphics.newImage(ASSET_DATA[4]["dcc_blow"])
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
function load_game_scene_stage_apply_wallbreak_start_init(hurt_side_obj_char,hit_side_obj_char)
    local adv = hurt_side_obj_char["wallhurt_wallbreak_adv"]
    local wallstick_on_side = hurt_side_obj_char["wallhurt_wallstick_on_side"]
    local hurt_side_anchor_data = common_game_scene_get_anchor(hurt_side_obj_char["player_side"])
    
    -- character_init
    hit_side_obj_char["state"] = "wallbreak_hit"
    hurt_side_obj_char["state"] = "wallbreak_hurt"
    hurt_side_obj_char["y"] = math.min(hurt_side_obj_char["y"],-265)
    if adv then
        hurt_side_obj_char["sprite_sheet_state"] = "0_wallbreak_hurt_adv"
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[hurt_side_obj_char["sprite_sheet_state"]]
    else
        hurt_side_obj_char["sprite_sheet_state"] = "0_wallbreak_hurt_non_adv"
        hurt_side_obj_char["anchor_pos"] = hurt_side_anchor_data[hurt_side_obj_char["sprite_sheet_state"]]
    end
    hurt_side_obj_char["pushbox"] = {0,-100,120,200}
    load_game_scene_wallbreak_start_init_LP()
    load_game_scene_wallbreak_start_init_RP()
    -- stage_init
    obj_stage_game_scene_main["f"] = 0
    obj_stage_game_scene_main["state"] = "wallbreak"
    obj_stage_game_scene_main["wallbreak_hit_side_obj_char"] = hit_side_obj_char
    obj_stage_game_scene_main["wallbreak_hurt_side_obj_char"] = hurt_side_obj_char
    obj_stage_game_scene_camera["3d_pos_y"] = hurt_side_obj_char["y"] - 50
    obj_stage_game_scene_camera["state"] = "wallbreak"
    obj_stage_game_scene_wallstick[4] = 0
    obj_stage_game_scene_wallstick["state"] = "off"
    obj_stage_game_scene_wallbreak_after_debris[1] = -1590*wallstick_on_side
    obj_stage_game_scene_wallbreak_after_debris[5] = wallstick_on_side
    obj_stage_game_scene_wallbreak_dynamic[1] = 1850*wallstick_on_side
    obj_stage_game_scene_wallbreak_dynamic[2] = hurt_side_obj_char["y"] - 525
    obj_stage_game_scene_wallbreak_dynamic[5] = wallstick_on_side
    obj_stage_game_scene_wallbreak_smoke[1] = -1150*wallstick_on_side+800
    obj_stage_game_scene_wallbreak_smoke[5] = 1.35*wallstick_on_side
    obj_stage_game_scene_wallbreak_glow[1] = 1960*wallstick_on_side
    obj_stage_game_scene_wallbreak_glow[2] = hurt_side_obj_char["y"] - 545
    obj_stage_game_scene_wallbreak_glow[5] = 2*wallstick_on_side
    -- update_animation
    load_game_scene_anim_stage_camera_wallbreak(obj_stage_game_scene_camera,hurt_side_obj_char,adv)
    load_game_scene_anim_point_linear_character_hit_side_wallbreak(hit_side_obj_char,wallstick_on_side)
    load_game_scene_anim_point_linear_character_hurt_side_wallbreak(hurt_side_obj_char,wallstick_on_side,adv)
    -- init_animation
    -- stage
    init_stage_anim_with(obj_stage_game_scene_main,anim_stage_game_scene_wallbreak_main)
    -- camera
    init_point_linear_anim_with(obj_stage_game_scene_camera,anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x)
    init_point_linear_anim_with(obj_stage_game_scene_camera,anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y)
    init_point_linear_anim_with(obj_stage_game_scene_camera,anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z)
    -- character
    -- hit_side
    init_frame_anim_with(hit_side_obj_char,anim_stage_frame_game_scene_char_hit_side_wallbreak_shadow_opeacity)
    init_point_linear_anim_with(hit_side_obj_char,anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x)
    init_point_linear_anim_with(hit_side_obj_char,anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y)
    init_frame_anim_with(hit_side_obj_char,anim_stage_frame_game_scene_char_hit_side_wallbreak_frame)
    init_frame_anim_with(hit_side_obj_char,anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state)
    init_frame_anim_with(hit_side_obj_char,anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos)
    -- hurt_side
    init_point_linear_anim_with(hurt_side_obj_char,anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_shadow_opeacity)
    init_point_linear_anim_with(hurt_side_obj_char,anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x)
    init_point_linear_anim_with(hurt_side_obj_char,anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y)
    init_frame_anim_with(hurt_side_obj_char,anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame)
    -- wallbreak_objects
    init_point_linear_anim_with(obj_stage_game_scene_wallbreak_after_debris,anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity)
    init_frame_anim_with(obj_stage_game_scene_wallbreak_after_debris,anim_stage_frame_game_scene_wallbreak_after_debris_frame)
    init_frame_anim_with(obj_stage_game_scene_wallbreak_dynamic,anim_stage_frame_game_scene_wallbreak_dynamic_opacity)
    init_frame_anim_with(obj_stage_game_scene_wallbreak_dynamic,anim_stage_frame_game_scene_wallbreak_dynamic_frame)
    init_point_linear_anim_with(obj_stage_game_scene_wallbreak_smoke,anim_stage_point_linear_game_scene_wallbreak_smoke_opacity)
    init_frame_anim_with(obj_stage_game_scene_wallbreak_smoke,anim_stage_frame_game_scene_wallbreak_smoke_frame)
    init_point_linear_anim_with(obj_stage_game_scene_wallbreak_glow,anim_stage_point_linear_game_scene_wallbreak_glow_opacity)
end
function load_game_scene_stage_apply_wallbreak_end_init(hurt_side_obj_char,hit_side_obj_char)
    local adv = hurt_side_obj_char["wallhurt_wallbreak_adv"]

    -- character
    hit_side_obj_char["state"] = "5_stand_idle"
    hit_side_obj_char["character_animation"] = hit_side_obj_char["init_animation_load_function"](hit_side_obj_char)
    if adv then
        hurt_side_obj_char["state"] = "knockdown"
        hurt_side_obj_char["character_animation"] = 
        load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_wallbreak(hit_side_obj_char)
    else
        hurt_side_obj_char["state"] = "5_stand_idle"
        hurt_side_obj_char["character_animation"] = 
        hurt_side_obj_char["init_animation_load_function"](hurt_side_obj_char)
    end
    load_game_scene_wallbreak_end_init_LP()
    load_game_scene_wallbreak_end_init_RP()
    init_character_anim_with(hit_side_obj_char,hit_side_obj_char["character_animation"])
    init_character_anim_with(hurt_side_obj_char,hurt_side_obj_char["character_animation"])
    -- stage
    obj_stage_game_scene_main["f"] = 0
    obj_stage_game_scene_main["state"] = "main"
    obj_stage_game_scene_main["wallbreak_hit_side_obj_char"] = hit_side_obj_char
    obj_stage_game_scene_main["wallbreak_hurt_side_obj_char"] = hurt_side_obj_char
    obj_stage_game_scene_camera["state"] = "main"
    obj_stage_game_scene_wallstick[4] = 0
    obj_stage_game_scene_wallstick["state"] = "off"
    obj_stage_game_scene_wallbreak_after_debris[4] = 0
    obj_stage_game_scene_wallbreak_dynamic[4] = 0
    obj_stage_game_scene_wallbreak_smoke[4] = 0
    obj_stage_game_scene_wallbreak_glow[4] = 0
end
-- update
function update_game_scene_stage()
    -- static stage no update need
    -- glow update no need for this stage
    
    -- camera_update
    state_machine_stage_game_scene_camera()
    -- wallstick_update
    state_machine_stage_game_scene_wallstick()
end
function update_game_scene_stage_camera_pos_sub()
    local obj_camera = obj_stage_game_scene_camera
    local obj_char_L = obj_char_game_scene_char_LP
    local obj_char_R = obj_char_game_scene_char_RP

    obj_stage_game_scene_mid_collision_anchor = (obj_char_L["x"] + obj_char_R["x"])/2

    obj_camera["3d_pos_z_target"] = (math.abs(obj_char_L["x"]-obj_char_R["x"])-720)*(-170)/720-800
    obj_camera["3d_pos_z_target"] = math.min(obj_camera["3d_pos_z_target"],-800)
    obj_camera["3d_pos_z_target"] = math.max(obj_camera["3d_pos_z_target"],-970)

    obj_camera["3d_pos_x_target"] = (obj_char_L["x"] + obj_char_R["x"])/2   -- 必须要保持两个pushbox宽度相同
    obj_camera["3d_pos_x_target"] = math.max(obj_camera["3d_pos_x_target"],-1350-(obj_camera["3d_pos_z_target"]+800)*1)
    obj_camera["3d_pos_x_target"] = math.min(obj_camera["3d_pos_x_target"],1350+(obj_camera["3d_pos_z_target"]+800)*1)

    obj_camera["3d_pos_y_target"] = math.min(obj_char_L["y"],obj_char_R["y"])+75
    obj_camera["3d_pos_y_target"] = math.min(obj_camera["3d_pos_y_target"],-365)
    obj_camera["3d_pos_y_target"] = obj_camera["3d_pos_y_target"]+(800+obj_camera["3d_pos_z_target"])*0.5
    obj_camera["3d_pos_y_target"] = math.max(obj_camera["3d_pos_y_target"],-900)
    -- camera_smooth_move
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
end
function update_game_scene_stage_wallbreak()
    local obj_stage_main = obj_stage_game_scene_main
    local hurt_side_obj_char = obj_stage_main["wallbreak_hurt_side_obj_char"]
    local hit_side_obj_char = obj_stage_main["wallbreak_hit_side_obj_char"]
    -- stage
    stage_animator(obj_stage_game_scene_main,anim_stage_game_scene_wallbreak_main)
    -- camera
    point_linear_animator(obj_stage_game_scene_camera,anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x)
    point_linear_animator(obj_stage_game_scene_camera,anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y)
    point_linear_animator(obj_stage_game_scene_camera,anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z)
    -- character
    -- hurt_side
    point_linear_animator(hurt_side_obj_char,anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_shadow_opeacity)
    point_linear_animator(hurt_side_obj_char,anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x)
    point_linear_animator(hurt_side_obj_char,anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y)
    frame_animator(hurt_side_obj_char,anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame)
    -- hit_side
    frame_animator(hit_side_obj_char,anim_stage_frame_game_scene_char_hit_side_wallbreak_shadow_opeacity)
    point_linear_animator(hit_side_obj_char,anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x)
    point_linear_animator(hit_side_obj_char,anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y)
    frame_animator(hit_side_obj_char,anim_stage_frame_game_scene_char_hit_side_wallbreak_frame)
    frame_animator(hit_side_obj_char,anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state)
    frame_animator(hit_side_obj_char,anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos)
    -- wallbreak_objects
    point_linear_animator(obj_stage_game_scene_wallbreak_after_debris,anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity)
    frame_animator(obj_stage_game_scene_wallbreak_after_debris,anim_stage_frame_game_scene_wallbreak_after_debris_frame)
    frame_animator(obj_stage_game_scene_wallbreak_dynamic,anim_stage_frame_game_scene_wallbreak_dynamic_opacity)
    frame_animator(obj_stage_game_scene_wallbreak_dynamic,anim_stage_frame_game_scene_wallbreak_dynamic_frame)
    point_linear_animator(obj_stage_game_scene_wallbreak_smoke,anim_stage_point_linear_game_scene_wallbreak_smoke_opacity)
    frame_animator(obj_stage_game_scene_wallbreak_smoke,anim_stage_frame_game_scene_wallbreak_smoke_frame)
    point_linear_animator(obj_stage_game_scene_wallbreak_glow,anim_stage_point_linear_game_scene_wallbreak_glow_opacity)
    -- state_machine
    state_machine_stage_game_scene_camera()
end

-- state_machine
function state_machine_stage_game_scene_camera()
    local obj_camera = obj_stage_game_scene_camera
    local obj_char_L = obj_char_game_scene_char_LP
    local obj_char_R = obj_char_game_scene_char_RP

    local switch = {
        ["main"] = function()
            update_game_scene_stage_camera_pos_sub()
            obj_camera[1] = obj_camera["3d_pos_x"]+obj_camera["enclose_position_offset"][1]*obj_camera["enclose_percentage"]
            obj_camera[2] = obj_camera["3d_pos_y"]+obj_camera["enclose_position_offset"][2]*obj_camera["enclose_percentage"]
            obj_camera[3] = obj_camera["3d_pos_z"]+obj_camera["enclose_position_offset"][3]*obj_camera["enclose_percentage"]
        end,
        ["active"] = function()
            update_game_scene_stage_camera_pos_sub()
            point_linear_animator(obj_camera,anim_stage_point_linear_game_scene_camera_enclosing)
            point_linear_animator(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
            point_linear_animator(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y)
            if get_point_linear_anim_end_state(obj_camera,anim_stage_point_linear_game_scene_camera_enclosing)
            and get_point_linear_anim_end_state(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
            and get_point_linear_anim_end_state(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y) then
                obj_camera["state"] = "main"
                obj_camera["enclose_position_offset"] = {0,0,0}
            end
            obj_camera[1] = obj_camera["3d_pos_x"]+obj_camera["enclose_position_offset"][1]*obj_camera["enclose_percentage"]
            obj_camera[2] = obj_camera["3d_pos_y"]+obj_camera["enclose_position_offset"][2]*obj_camera["enclose_percentage"]
            obj_camera[3] = obj_camera["3d_pos_z"]+obj_camera["enclose_position_offset"][3]*obj_camera["enclose_percentage"]
        end,
        ["wallbreak"] = function()
            obj_camera[1] = obj_camera["3d_pos_x"]
            obj_camera[2] = obj_camera["3d_pos_y"]
            obj_camera[3] = obj_camera["3d_pos_z"]
        end
    }
    local this_function = switch[obj_camera["state"]]
    if this_function then this_function() end
end
function state_machine_stage_game_scene_wallstick()
    local obj_stage_wallstick = obj_stage_game_scene_wallstick
    local switch = {
        ["off"] = function()

        end,
        ["on"] = function()
            frame_animator(obj_stage_wallstick,anim_state_frame_game_scene_wallstick_frame)
            if get_frame_anim_end_state(obj_stage_wallstick,anim_state_frame_game_scene_wallstick_frame) then
                obj_stage_wallstick[4] = 0
                obj_stage_wallstick[8] = 0
                obj_stage_wallstick["state"] = "off"
            end
        end,
    }
    local this_function = switch[obj_stage_wallstick["state"]]
    if this_function then this_function() end
end

-- draw
function draw_game_scene_stage_static()
    love.graphics.clear(125/255,125/255,125/255,1)

    local obj_camera = obj_stage_game_scene_camera
    local image_sprite_sheet = nil
    local obj = nil

    obj = obj_stage_game_scene_tile_map
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
    love.graphics.setColor(1,1,1,0.675)
    love.graphics.draw(DRAW_STAGE_ALPHA_COMP_CANVAS)
    love.graphics.setColor(1,1,1,1)
    love.graphics.setBlendMode("alpha")
end
function draw_game_scene_stage_wallbreak_at_character_back()
    -- local obj_camera = obj_stage_game_scene_camera
    -- local obj = nil
    
    -- obj = obj_stage_game_scene_wallbreak_glow
    -- love.graphics.setBlendMode("add")
    -- draw_3d_image(obj_camera,obj,image_stage_game_scene_wallbreak_glow)
    -- love.graphics.setBlendMode("alpha")
end
function draw_game_scene_stage_wallbreak_at_character_front()
    local obj_camera = obj_stage_game_scene_camera
    local image_sprite_sheet = nil
    local obj = nil

    obj = obj_stage_game_scene_wallbreak_glow
    love.graphics.setBlendMode("add")
    draw_3d_image(obj_camera,obj,image_stage_game_scene_wallbreak_glow)
    love.graphics.setBlendMode("alpha")

    obj = obj_stage_game_scene_wallbreak_after_debris
    image_sprite_sheet = image_sprite_sheet_stage_game_scene_wallbreak_after_debris
    image_sprite_sheet["sprite_batch"]:clear()
    draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
    love.graphics.setBlendMode("add")
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    love.graphics.setBlendMode("alpha")

    obj = obj_stage_game_scene_wallbreak_dynamic
    image_sprite_sheet = image_sprite_sheet_stage_game_scene_wallbreak_dynamic
    image_sprite_sheet["sprite_batch"]:clear()
    draw_3d_image_sprite_batch(obj_camera,obj,image_sprite_sheet,""..obj[8].."")
    love.graphics.setBlendMode("add")
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
    love.graphics.setBlendMode("alpha")

    obj = obj_stage_game_scene_wallbreak_smoke
    image_sprite_sheet = image_sprite_sheet_stage_game_scene_wallbreak_smoke
    image_sprite_sheet["sprite_batch"]:clear()
    draw_2d_image_sprite_batch(obj,image_sprite_sheet,""..obj[8].."")
    love.graphics.draw(image_sprite_sheet["sprite_batch"])
end

-- stage_animation_load_function
function load_game_scene_anim_stage_camera_wallbreak(obj_camera,hurt_side_obj_char,adv)
    local x_dst = 2290
    local obj_camera_start_x = obj_camera["3d_pos_x"]
    local wallstick_on_side = hurt_side_obj_char["wallhurt_wallstick_on_side"]

    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x = {}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[0] = {wallstick_on_side*1910.0,1}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[1] = {wallstick_on_side*(1910.1+5.0),2}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[2] = {wallstick_on_side*(1910.4+4.6),3}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[3] = {wallstick_on_side*(1911.0-5.0),4}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[4] = {wallstick_on_side*(1911.7-4.6),5}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[5] = {wallstick_on_side*(1912.7+5.0),6}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[6] = {wallstick_on_side*(1914.0+4.5),7}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[7] = {wallstick_on_side*(1915.6-5.0),8}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[8] = {wallstick_on_side*(1917.6-4.4),9}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[9] = {wallstick_on_side*(1919.8+5.0),10}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[10] = {wallstick_on_side*(1922.4+4.2),11}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[11] = {wallstick_on_side*(1925.2-5.0),12}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[12] = {wallstick_on_side*(1928.3-3.7),13}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[13] = {wallstick_on_side*(1931.6+5.0),14}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[14] = {wallstick_on_side*(1935.1+2.5),15}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[15] = {wallstick_on_side*1938.8,30}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[30] = {wallstick_on_side*2011.9,45}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[45] = {wallstick_on_side*2106.9,60}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[60] = {wallstick_on_side*2215.7,70}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[70] = {wallstick_on_side*2293.9,80}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[80] = {wallstick_on_side*2375.0,104}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[104] = {wallstick_on_side*2375.0,105}
    if adv then
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[105] = {-wallstick_on_side*(950.0),106}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[106] = {-wallstick_on_side*(754.3),108}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[108] = {-wallstick_on_side*(537.0),111}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[111] = {-wallstick_on_side*(342.7),115}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[115] = {-wallstick_on_side*(174.9),120}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[120] = {-wallstick_on_side*(36.9),125}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[125] = {-wallstick_on_side*(-54.7),130}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[130] = {-wallstick_on_side*(-115.3),135}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[135] = {-wallstick_on_side*(-153.3),140}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[140] = {-wallstick_on_side*(-173.8),145}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[145] = {-wallstick_on_side*(-180),150}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[150] = {-wallstick_on_side*(-180),150}
    else
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[105] = {-wallstick_on_side*(950.0),106}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[106] = {-wallstick_on_side*(785.5),108}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[108] = {-wallstick_on_side*(602.8),111}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[111] = {-wallstick_on_side*(439.5),115}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[115] = {-wallstick_on_side*(298.4),120}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[120] = {-wallstick_on_side*(182.3),125}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[125] = {-wallstick_on_side*(105.4),130}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[130] = {-wallstick_on_side*(54.4),135}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[135] = {-wallstick_on_side*(22.4),140}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[140] = {-wallstick_on_side*(5.3),145}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[145] = {-wallstick_on_side*(0),150}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[150] = {-wallstick_on_side*(0),150}
    end
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x["prop"] = "3d_pos_x"
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x["length"] = 150
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x["loop"] = false
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x["fix_type"] = true

    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y = {}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[0] = {hurt_side_obj_char["y"]-50,1}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[1] = {hurt_side_obj_char["y"]-50,2}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[2] = {hurt_side_obj_char["y"]-50-5.0,3}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[3] = {hurt_side_obj_char["y"]-50-4.6,4}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[4] = {hurt_side_obj_char["y"]-50+5.0,5}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[5] = {hurt_side_obj_char["y"]-50+4.5,6}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[6] = {hurt_side_obj_char["y"]-50-5.0,7}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[7] = {hurt_side_obj_char["y"]-50-4.4,8}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[8] = {hurt_side_obj_char["y"]-50+5.0,9}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[9] = {hurt_side_obj_char["y"]-50+4.3,10}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[10] = {hurt_side_obj_char["y"]-50-5.0,11}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[11] = {hurt_side_obj_char["y"]-50-4.0,12}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[12] = {hurt_side_obj_char["y"]-50+5.0,13}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[13] = {hurt_side_obj_char["y"]-50+3.3,14}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[14] = {hurt_side_obj_char["y"]-50+1.7,15}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[15] = {hurt_side_obj_char["y"]-50,104}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[104] = {hurt_side_obj_char["y"]-50,105}
    if adv then
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[105] = {-415.0,106}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[106] = {-412.0,108}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[108] = {-408.8,111}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[111] = {-405.9,115}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[115] = {-408.4,120}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[120] = {-401.3,125}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[125] = {-399.9,130}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[130] = {-399.0,135}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[135] = {-398.5,140}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[140] = {-398.1,145}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[145] = {-398.05,150}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[150] = {-398.05,150}
    else
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[105] = {-415,106}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[106] = {-406.3,108}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[108] = {-396.7,111}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[111] = {-388.1,115}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[115] = {-380.7,120}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[120] = {-374.6,125}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[125] = {-370.5,130}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[130] = {-367.9,135}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[135] = {-366.2,140}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[140] = {-365.3,145}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[145] = {-365,150}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[150] = {-365,150}
    end
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y["prop"] = "3d_pos_y"
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y["length"] = 150
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y["loop"] = false
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y["fix_type"] = true

    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z = {}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[0] = {-650,104}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[104] = {-650,105}
    if adv then
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[105] = {-866.1+200.0,106}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[106] = {-866.1+165.4,108}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[108] = {-866.1+126.9,111}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[111] = {-866.1+92.5,115}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[115] = {-866.1+62.8,120}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[120] = {-866.1+38.4,125}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[125] = {-866.1+22.2,130}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[130] = {-866.1+11.5,135}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[135] = {-866.1+4.7,140}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[140] = {-866.1+1.1,145}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[145] = {-866.1+0.0,150}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[150] = {-866.1+0.0,150}
    else
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[105] = {-800+200.0,106}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[106] = {-800+165.4,108}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[108] = {-800+126.9,111}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[111] = {-800+92.5,115}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[115] = {-800+62.8,120}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[120] = {-800+38.4,125}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[125] = {-800+22.2,130}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[130] = {-800+11.5,135}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[135] = {-800+4.7,140}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[140] = {-800+1.1,145}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[145] = {-800+0.0,150}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[150] = {-800+0.0,150}
    end
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z["prop"] = "3d_pos_z"
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z["length"] = 150
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z["loop"] = false
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z["fix_type"] = true
end
-- frame_and_point_linear_animation
function load_game_scene_anim_point_linear_character_hit_side_wallbreak(hit_side_obj_char,wallstick_on_side)
    local hit_side_wallbreak_hit_anchor = common_game_scene_get_anchor(hit_side_obj_char["player_side"])["0_wallbreak_hit"]
    -- 105f-150f
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x = {}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x[0] = {hit_side_obj_char["x"],104}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x[104] = {hit_side_obj_char["x"],105}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x[105] = {-wallstick_on_side*1500,125}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x[125] = {-wallstick_on_side*630,126}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x[126] = {-wallstick_on_side*586.8,128}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x[128] = {-wallstick_on_side*481.1,131}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x[131] = {-wallstick_on_side*406.0,135}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x[135] = {-wallstick_on_side*355.7,140}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x[140] = {-wallstick_on_side*327.4,145}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x[145] = {-wallstick_on_side*320,150}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x[150] = {-wallstick_on_side*320,150}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x["prop"] = "x"
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x["length"] = 150
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x["loop"] = false
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_x["fix_type"] = true

    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y = {}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y[0] = {hit_side_obj_char["y"],104}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y[104] = {hit_side_obj_char["y"],105}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y[105] = {0,150}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y[150] = {0,150}
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y["prop"] = "y"
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y["length"] = 150
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y["loop"] = false
    anim_stage_point_linear_game_scene_char_hit_side_wallbreak_y["fix_type"] = true

    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame = {}
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame[0] = hit_side_obj_char[8]
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame[105] = 0
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame[113] = 1
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame[121] = 2
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame[125] = 3
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame[130] = 4
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame[136] = 5
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame[144] = 6
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame[148] = 7
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame[150] = 7
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame["prop"] = 8
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame["length"] = 150
    anim_stage_frame_game_scene_char_hit_side_wallbreak_frame["loop"] = false

    anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state = {}
    anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state[0] = hit_side_obj_char["sprite_sheet_state"]
    anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state[105] = "0_wallbreak_hit"
    anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state[150] = "0_wallbreak_hit"
    anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state["prop"] = "sprite_sheet_state"
    anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state["length"] = 150
    anim_stage_frame_game_scene_char_hit_side_wallbreak_sprite_sheet_state["loop"] = false

    anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos = {}
    anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos[0] = hit_side_obj_char["anchor_pos"]
    anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos[105] = hit_side_wallbreak_hit_anchor
    anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos[150] = hit_side_wallbreak_hit_anchor
    anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos["prop"] = "anchor_pos"
    anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos["length"] = 150
    anim_stage_frame_game_scene_char_hit_side_wallbreak_anchor_pos["loop"] = false
end
function load_game_scene_anim_point_linear_character_hurt_side_wallbreak(hurt_side_obj_char,wallstick_on_side,adv)
    -- wallbreak_x
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x = {}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[0] = {wallstick_on_side*2100.0,30}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[30] = {wallstick_on_side*2270.0,35}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[35] = {wallstick_on_side*2307.8,40}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[40] = {wallstick_on_side*2361.6,45}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[45] = {wallstick_on_side*2439.8,49}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[49] = {wallstick_on_side*2533.1,52}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[52] = {wallstick_on_side*2641.0,54}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[54] = {wallstick_on_side*2764.4,55}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[55] = {wallstick_on_side*2850.0,104}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[104] = {wallstick_on_side*2850.0,105}
    if adv then
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[105] = {-wallstick_on_side*1200.0,125}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[125] = {wallstick_on_side*320.0,126}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[126] = {wallstick_on_side*362.2,128}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[128] = {wallstick_on_side*445.9,131}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[131] = {wallstick_on_side*547.4,135}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[135] = {wallstick_on_side*638.4,140}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[140] = {wallstick_on_side*680.0,150}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[150] = {wallstick_on_side*680.0,150}
    else
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[105] = {-wallstick_on_side*1220.0,125}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[125] = {-wallstick_on_side*0.0,130}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[130] = {wallstick_on_side*205.0,130}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[131] = {wallstick_on_side*228.9,133}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[133] = {wallstick_on_side*258.7,135}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[135] = {wallstick_on_side*278.5,140}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[140] = {wallstick_on_side*307.5,145}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[145] = {wallstick_on_side*320.0,150}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x[150] = {wallstick_on_side*320.0,150}
    end
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x["prop"] = "x"
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x["length"] = 150
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x["loop"] = false
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_x["fix_type"] = true

    -- wallbreak_y
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y = {}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[0] = {hurt_side_obj_char["y"],104}
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[104] = {hurt_side_obj_char["y"],105}
    if adv then
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[105] = {-455.0,110}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[110] = {-444.2,116}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[116] = {-391.0,119}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[119] = {-335.7,121}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[121] = {-278.7,123}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[123] = {-189.6,124}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[124] = {-117.3,125}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[125] = {0.0,126}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[126] = {-6.5,129}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[129] = {-55.6,130}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[130] = {62.0,131}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[131] = {-55.6,134}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[134] = {-6.5,135}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[135] = {0.0,138}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[138] = {-20.0,140}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[140] = {0.0,150}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[150] = {0.0,150}
    else
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[105] = {-455.0,110}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[110] = {-446.8258,115}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[115] = {-416.4536,117}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[117] = {-335.7,119}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[119] = {-278.7,121}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[121] = {-189.6,123}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[123] = {-117.3,124}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[124] = {-67.7,125}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[125] = {0.0,150}
        anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y[150] = {0.0,150}
    end
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y["prop"] = "y"
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y["length"] = 150
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y["loop"] = false
    anim_stage_point_linear_game_scene_char_hurt_side_wallbreak_y["fix_type"] = true

    -- wallbreak_frame
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame = {}
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[0] = 0
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[4] = 1
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[9] = 2
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[15] = 1
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[21] = 2
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[27] = 1
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[33] = 2
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[39] = 1
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[43] = 3
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[47] = 4
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[52] = 6
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[104] = 6
    if adv then
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[105] = 5
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[110] = 6
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[115] = 5
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[120] = 6
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[125] = 7
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[128] = 8
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[130] = 9
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[133] = 10
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[135] = 11
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[138] = 12
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[140] = 13
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[143] = 14
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[150] = 14
    else
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[105] = 5
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[110] = 6
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[115] = 5
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[120] = 6
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[125] = 7
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[126] = 8
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[128] = 9
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[130] = 10
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[136] = 11
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[143] = 12
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[148] = 13
        anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame[150] = 14
    end
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame["prop"] = 8
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame["length"] = 150
    anim_stage_frame_game_scene_char_hurt_side_wallbreak_frame["loop"] = false
end
-- camera 150f
-- char_hurt_side 150f
-- char_hit_side 105f-150f
-- after_debris 105f-150f
-- dynamic 0f-60f
-- smoke 45f-120f
-- glow 0f-30f

-- 0 30 45 60 105 120 150
-- 0
    -- camera
    -- char_hurt_side
    -- dynamic
    -- glow
-- 30
    -- camera
    -- char_hurt_side
    -- dynamic
-- 45
    -- camera
    -- char_hurt_side
    -- dynamic
    -- smoke
-- 60
    -- camera
    -- char_hurt_side
    -- smoke
-- 105
    -- camera
    -- char_hurt_side
    -- char_hit_side
    -- after_debris
    -- smoke
-- 120
    -- camera
    -- char_hurt_side
    -- char_hit_side
    -- after_debris
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
    obj_stage_game_scene_main["camera_active_application_table"] = {}
    obj_stage_game_scene_main["wallstick_char_obj_active_application_table"] = {}
    obj_stage_game_scene_main["wallstick_stage_obj_active_application_table"] = {}
    obj_stage_game_scene_main["wallbreak_active_application_table"] = {}

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
    anim_state_frame_game_scene_wallstick_frame["fix_type"] = true

    -- wallbreak
    -- camera_animation
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x = {}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y = {} 

    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z = {}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[0] = {-800+0.0,1}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[1] = {-800+24.5,3}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[3] = {-800+50.9,6}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[6] = {-800+72.7,10}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[10] = {-800+91.3,15}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[15] = {-800+100.0,30}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[30] = {-800+127.4,40}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[40] = {-800+155.2,50}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[50] = {-800+197.6,54}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[54] = {-800+223.0,57}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[57] = {-800+249.6,59}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[59] = {-800+277.0,60}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[60] = {-800+300.0,104}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z[104] = {-800+300.0,105}
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
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z["prop"] = "3d_pos_z"
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z["length"] = 150
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z["loop"] = false
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_z["fix_type"] = true
    -- wallbreak_after_debris_opacity_anim
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity = {}
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity[0] = {1,20}
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity[20] = {1,50}
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity[50] = {0,50}
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity["prop"] = 4
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity["length"] = 50
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity["loop"] = false
    anim_stage_point_linear_game_scene_wallbreak_after_debris_opacity["fix_type"] = true
    -- wallbreak_after_debris_frame_anim
    anim_stage_frame_game_scene_wallbreak_after_debris_frame = {}
    for i = 0,24 do
        anim_stage_frame_game_scene_wallbreak_after_debris_frame[i*2] = i
    end
    anim_stage_frame_game_scene_wallbreak_after_debris_frame["prop"] = 8
    anim_stage_frame_game_scene_wallbreak_after_debris_frame["length"] = 50
    anim_stage_frame_game_scene_wallbreak_after_debris_frame["loop"] = false
    anim_stage_frame_game_scene_wallbreak_after_debris_frame["fix_type"] = true
    -- wallbreak_dynamic_frame_anim
    anim_stage_frame_game_scene_wallbreak_dynamic_frame = {}
    for i = 0,29 do
        anim_stage_frame_game_scene_wallbreak_dynamic_frame[i*2] = i
    end
    anim_stage_frame_game_scene_wallbreak_dynamic_frame["prop"] = 8
    anim_stage_frame_game_scene_wallbreak_dynamic_frame["length"] = 60
    anim_stage_frame_game_scene_wallbreak_dynamic_frame["loop"] = false
    anim_stage_frame_game_scene_wallbreak_dynamic_frame["fix_type"] = true
    -- wallbreak_transport_smoke_opacity_anim
    anim_stage_point_linear_game_scene_wallbreak_transport_smoke_opacity = {}
    anim_stage_point_linear_game_scene_wallbreak_transport_smoke_opacity[0] = {0,10}
    anim_stage_point_linear_game_scene_wallbreak_transport_smoke_opacity[10] = {1,60}
    anim_stage_point_linear_game_scene_wallbreak_transport_smoke_opacity[60] = {1,75}
    anim_stage_point_linear_game_scene_wallbreak_transport_smoke_opacity[75] = {0,75}
    anim_stage_point_linear_game_scene_wallbreak_transport_smoke_opacity["prop"] = 4
    anim_stage_point_linear_game_scene_wallbreak_transport_smoke_opacity["length"] = 75
    anim_stage_point_linear_game_scene_wallbreak_transport_smoke_opacity["loop"] = false
    anim_stage_point_linear_game_scene_wallbreak_transport_smoke_opacity["fix_type"] = true
    -- wallbreak_transport_smoke_frame_anim
    anim_stage_frame_game_scene_wallbreak_transport_smoke_frame = {}
    for i = 0,24 do
        anim_stage_frame_game_scene_wallbreak_transport_smoke_frame[i*3] = i
    end
    anim_stage_frame_game_scene_wallbreak_transport_smoke_frame["prop"] = 8
    anim_stage_frame_game_scene_wallbreak_transport_smoke_frame["length"] = 75
    anim_stage_frame_game_scene_wallbreak_transport_smoke_frame["loop"] = false
    anim_stage_frame_game_scene_wallbreak_transport_smoke_frame["fix_type"] = true
    -- wallbreak_transport_glow_opacity
    anim_stage_point_linear_game_scene_wallbreak_transport_glow_opacity = {}
    anim_stage_point_linear_game_scene_wallbreak_transport_glow_opacity[0] = {0,5}
    anim_stage_point_linear_game_scene_wallbreak_transport_glow_opacity[5] = {0.07,10}
    anim_stage_point_linear_game_scene_wallbreak_transport_glow_opacity[10] = {0.26,15}
    anim_stage_point_linear_game_scene_wallbreak_transport_glow_opacity[15] = {0.5,20}
    anim_stage_point_linear_game_scene_wallbreak_transport_glow_opacity[20] = {0.74,25}
    anim_stage_point_linear_game_scene_wallbreak_transport_glow_opacity[25] = {0.93,30}
    anim_stage_point_linear_game_scene_wallbreak_transport_glow_opacity[30] = {1,30}
    anim_stage_point_linear_game_scene_wallbreak_transport_glow_opacity["prop"] = 4
    anim_stage_point_linear_game_scene_wallbreak_transport_glow_opacity["length"] = 30
    anim_stage_point_linear_game_scene_wallbreak_transport_glow_opacity["loop"] = false
    anim_stage_point_linear_game_scene_wallbreak_transport_glow_opacity["fix_type"] = true
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

-- update
function update_game_scene_stage()
    -- static stage no update need
    -- glow update no need for this stage

    -- application_table
    update_game_scene_stage_application_table_validation()
    update_game_scene_wallstick_stage_obj_application_table()
    update_game_scene_wallstick_char_obj_application_table()
    update_game_scene_camera_application_table()
    -- camera_update
    state_machine_stage_game_scene_camera()
    -- wallstick_update
    state_machine_stage_game_scene_wallstick()
end
function update_game_scene_stage_application_table_validation()
    local obj_stage_main = obj_stage_game_scene_main
    local char_LP = obj_char_game_scene_char_LP
    local char_RP = obj_char_game_scene_char_RP
    if #obj_stage_main["wallstick_stage_obj_active_application_table"] > 1
    or #obj_stage_main["wallstick_char_obj_active_application_table"] > 1
    or (#obj_stage_main["wallstick_stage_obj_active_application_table"] > 0 and (char_LP["wallstick_on"] ~= 0 or char_RP["wallstick_on"] ~= 0))
    or (#obj_stage_main["wallstick_char_obj_active_application_table"] > 0 and (char_LP["state"] == "wallbreak" or char_RP["state"] == "wallbreak"))
    then
        print("Did you code a guarantee projectile that active after the owner was hurt?")
        print("or you made a extremely fucking wired hurt animation that could cause both characters to be in wallstick state at the same frame?")
        print("These texts only show when you have a sync wallstick or wallbreak process that cause more than 1 wallstick or wallbreak effect at the same frame.")
        print("You could do that but I won't code a wallstick with it since this would cause a sync wallstick or wallbreak.")
        print("That is a issue even arcsys deal it shity.")
        print("I would just ban the wallbreak/wallstick process with it. BTW I don't like guarantee projectile either")
        print("if you want do make the sync wallstick and wallbreak effect, this is a place to mod it.WALL#00000000")
    end
end
function update_game_scene_wallstick_stage_obj_application_table()
    local obj_stage_main = obj_stage_game_scene_main
    local char_LP = obj_char_game_scene_char_LP
    local char_RP = obj_char_game_scene_char_RP
    if #obj_stage_main["wallstick_stage_obj_active_application_table"] == 0 then
        return
    end
    if #obj_stage_main["wallstick_stage_obj_active_application_table"] == 1 then
        obj_stage_main["wallstick_stage_obj_active_application_table"][1]()
        obj_stage_main["wallstick_stage_obj_active_application_table"] = {}
    elseif #obj_stage_main["wallstick_stage_obj_active_application_table"] > 1 then
        obj_stage_main["wallstick_stage_obj_active_application_table"] = {}
        print("if you want do make the sync wallstick and wallbreak effect, this is a place to mod it.WALL#00000001")
    end
end
function update_game_scene_wallstick_char_obj_application_table()
    local obj_stage_main = obj_stage_game_scene_main
    local char_LP = obj_char_game_scene_char_LP
    local char_RP = obj_char_game_scene_char_RP
    if #obj_stage_main["wallstick_char_obj_active_application_table"] == 0 then
        char_LP["collision_move_available_cache"] = char_LP["collision_move_available"]
        char_RP["collision_move_available_cache"] = char_RP["collision_move_available"]
        return
    end
    if #obj_stage_main["wallstick_char_obj_active_application_table"] == 1 then
        char_LP["collision_move_available_cache"] = char_LP["collision_move_available"]
        char_RP["collision_move_available_cache"] = char_RP["collision_move_available"]
        obj_stage_main["wallstick_char_obj_active_application_table"][1]()
        obj_stage_main["wallstick_char_obj_active_application_table"] = {}
    elseif #obj_stage_main["wallstick_char_obj_active_application_table"] > 1 then
        obj_stage_main["wallstick_char_obj_active_application_table"] = {}
        print("if you want do make the sync wallstick and wallbreak effect, this is a place to mod it.WALL#00000002")
    end
end
function update_game_scene_camera_application_table()
    local obj_stage_main = obj_stage_game_scene_main
    local obj_camera = obj_stage_game_scene_camera
    if #obj_stage_main["camera_active_application_table"] == 0 then
        return
    end
    if #obj_stage_main["camera_active_application_table"] == 1 then
        obj_stage_main["camera_active_application_table"][1]()
        obj_stage_main["camera_active_application_table"] = {}
    elseif #obj_stage_main["camera_active_application_table"] > 1 then
        -- 更新状态
        obj_stage_main["camera_active_application_table"] = {}
    end
end
-- state_machine
function state_machine_stage_game_scene_camera()
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

    local switch = {
        ["main"] = function()
            return
        end,
        ["active"] = function()
            point_linear_animator(obj_camera,anim_stage_point_linear_game_scene_camera_enclosing)
            point_linear_animator(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
            point_linear_animator(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y)
            if get_point_linear_anim_end_state(obj_camera,anim_stage_point_linear_game_scene_camera_enclosing)
            and get_point_linear_anim_end_state(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
            and get_point_linear_anim_end_state(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y) then
                obj_camera["state"] = "main"
                obj_camera["enclose_position_offset"] = {0,0,0}
            end
        end,
        ["wallbreak_shake"] = function()
            point_linear_animator(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
            point_linear_animator(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y)
            if get_point_linear_anim_end_state(obj_camera,anim_stage_point_linear_game_scene_camera_shake_x)
            and get_point_linear_anim_end_state(obj_camera,anim_stage_point_linear_game_scene_camera_shake_y) then
                obj_camera["state"] = "main"
            end
        end,
    }
    local this_function = switch[obj_camera["state"]]
    if this_function then this_function() end

    obj_camera[1] = obj_camera["3d_pos_x"]+obj_camera["enclose_position_offset"][1]*obj_camera["enclose_percentage"]
    obj_camera[2] = obj_camera["3d_pos_y"]+obj_camera["enclose_position_offset"][2]*obj_camera["enclose_percentage"]
    obj_camera[3] = obj_camera["3d_pos_z"]+obj_camera["enclose_position_offset"][3]*obj_camera["enclose_percentage"]+obj_camera[2]*0.25
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

-- stage_animation_load_function
function load_game_scene_anim_stage_camera_wallbreak(obj_camera,hurt_side_char,wallside,adv)
    local obj_camera_start_x = obj_camera["3d_pos_x"]
    local function x_persentage_to_value(x_percentage)
        return obj_camera_start_x*(1-x_percentage)+wallside*(2100+940)*x_percentage
    end
    
    -- 3d_pos_x
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x = {}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[0] = {x_persentage_to_value(0.0/940),1}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[1] = {x_persentage_to_value(99.0/940),3}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[3] = {x_persentage_to_value(197.5/940),6}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[6] = {x_persentage_to_value(277.7/940),10}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[10] = {x_persentage_to_value(338.9/940),15}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[15] = {x_persentage_to_value(380.0/940),30}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[30] = {x_persentage_to_value(477.3/940),40}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[40] = {x_persentage_to_value(563.7/940),50}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[50] = {x_persentage_to_value(638.2/940),54}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[54] = {x_persentage_to_value(750.1/940),57}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[57] = {x_persentage_to_value(817.1/940),59}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[59] = {x_persentage_to_value(883.1/940),60}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[60] = {x_persentage_to_value(940.0/940),104}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[104] = {x_persentage_to_value(940.0/940),105}
    if adv then
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[105] = {-wallside*(950.0),106}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[106] = {-wallside*(754.3),108}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[108] = {-wallside*(537.0),111}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[111] = {-wallside*(342.7),115}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[115] = {-wallside*(174.9),120}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[120] = {-wallside*(36.9),125}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[125] = {wallside*(-54.7),130}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[130] = {-wallside*(-115.3),135}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[135] = {-wallside*(-153.3),140}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[140] = {-wallside*(-173.8),145}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[145] = {-wallside*(-180),150}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[150] = {-wallside*(-180),150}
    else
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[105] = {-wallside*(950.0),106}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[106] = {-wallside*(785.5),108}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[108] = {-wallside*(602.8),111}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[111] = {-wallside*(439.5),115}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[115] = {-wallside*(298.4),120}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[120] = {-wallside*(182.3),125}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[125] = {-wallside*(105.4),130}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[130] = {-wallside*(54.4),135}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[135] = {-wallside*(22.4),140}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[140] = {-wallside*(5.3),145}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[145] = {-wallside*(0),150}
        anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x[150] = {-wallside*(0),150}
    end
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x["prop"] = "3d_pos_x"
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x["length"] = 150
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x["loop"] = false
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_x["fix_type"] = true

    -- 3d_pos_y
    local y_dst = hurt_side_char["y"]
    local obj_camera_start_y = obj_camera["3d_pos_y"]
    local function y_persentage_to_value(y_percentage)
        return obj_camera_start_y*(1-y_percentage)+y_dst*y_percentage
    end
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y = {}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[0] = {y_persentage_to_value(0.0/100),1}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[1] = {y_persentage_to_value(31.9/100),3}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[3] = {y_persentage_to_value(61.2/100),6}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[6] = {y_persentage_to_value(82.5/100),10}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[10] = {y_persentage_to_value(95.6/100),15}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[15] = {y_persentage_to_value(100.0/100),30}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[104] = {y_persentage_to_value(100.0/100),105}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[105] = {-50,106}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[106] = {-41.3,108}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[108] = {-31.7,111}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[111] = {-23.1,115}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[115] = {-15.7,120}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[120] = {-9.6,125}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[125] = {-5.5,130}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[130] = {-2.9,135}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[135] = {-1.2,140}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[140] = {-0.3,145}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[145] = {0,150}
    anim_stage_point_linear_game_scene_camera_wallbreak_3d_pos_y[150] = {0,150}
end
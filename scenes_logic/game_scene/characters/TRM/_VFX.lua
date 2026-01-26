function insert_VFX_game_scene_char_TRM_2P_whiff(obj_char)
    local obj = {0, 0, 0, 1, 1, 1, 0, 0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["2P_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["2P_whiff_VFX"]
    end 

    obj["life"] = 8
    obj[1] = obj_char["x"] + obj_char[5]*(35)
    obj[2] = obj_char["y"] + obj_char[6]*(-230)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = -1
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][3] = 1
    obj["animation"][6] = 2
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 8
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with(obj,obj["animation"])
    obj["update"] = function(self)
        -- self[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- self[2] = obj_char["y"] + obj_char[6]*(840)
        self[1] = obj_char["x"] + obj_char[5]*(35)
        self[2] = obj_char["y"] + obj_char[6]*(-230)
        self[3] = obj_char[3]
        self[4] = 1
        self[5] = obj_char[5]
        self[6] = obj_char[6]
        self[7] = obj_char[7]
        if obj_char["state"] == "2P" then
            frame_animator(self,self["animation"])
            self["life"] = self["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            self["life"] = 0
        end
    end
    obj["draw"] = function(self)
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,self,image_sprite_sheet,tostring(self[8]))

        love.graphics.setColor(1,1,1,self[4])
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_6P_whiff(obj_char)
    local obj = {0, 0, 0, 1, 1, 1, 0, 0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["6P_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["6P_whiff_VFX"]
    end 

    obj["life"] = 17
    obj[1] = obj_char["x"] + obj_char[5]*(-294)
    obj[2] = obj_char["y"] + obj_char[6]*(-543)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = -1
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][2] = 1
    obj["animation"][4] = 2
    obj["animation"][7] = 3
    obj["animation"][12] = 4
    obj["animation"][15] = 5
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 17
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with(obj,obj["animation"])
    obj["update"] = function(self)
        -- self[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- self[2] = obj_char["y"] + obj_char[6]*(840)
        self[1] = obj_char["x"] + obj_char[5]*(-294)
        self[2] = obj_char["y"] + obj_char[6]*(-543)
        self[3] = obj_char[3]
        self[4] = 1
        self[5] = obj_char[5]
        self[6] = obj_char[6]
        self[7] = obj_char[7]
        if obj_char["state"] == "6P" then
            frame_animator(self,self["animation"])
            self["life"] = self["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            self["life"] = 0
        end
    end
    obj["draw"] = function(self)
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,self,image_sprite_sheet,tostring(self[8]))

        love.graphics.setBlendMode("add")
        love.graphics.setColor(1,1,1,obj[4])
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5P_whiff(obj_char)
    local obj = {0, 0, 0, 1, 1, 1, 0, 0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5P_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5P_whiff_VFX"]
    end 

    obj["life"] = 8
    obj[1] = obj_char["x"] + obj_char[5]*(56)
    obj[2] = obj_char["y"] + obj_char[6]*(-468)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = -1
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][2] = 1
    obj["animation"][4] = 2
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 8
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with(obj,obj["animation"])
    obj["update"] = function(self)
        -- self[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- self[2] = obj_char["y"] + obj_char[6]*(840)
        self[1] = obj_char["x"] + obj_char[5]*(56)
        self[2] = obj_char["y"] + obj_char[6]*(-468)
        self[3] = obj_char[3]
        self[4] = 1
        self[5] = obj_char[5]
        self[6] = obj_char[6]
        self[7] = obj_char[7]
        if obj_char["state"] == "5P" then
            frame_animator(self,self["animation"])
            self["life"] = self["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            self["life"] = 0
        end
    end
    obj["draw"] = function(self)
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,self,image_sprite_sheet,tostring(self[8]))

        love.graphics.setColor(1,1,1,self[4])
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_2S_whiff(obj_char)
    local obj = {0, 0, 0, 1, 1, 1, 0, 0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["2S_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["2S_whiff_VFX"]
    end 

    obj["life"] = 3
    obj[1] = obj_char["x"] + obj_char[5]*(166)
    obj[2] = obj_char["y"] + obj_char[6]*(-247)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = -1
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][1] = 1
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 3
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with(obj,obj["animation"])
    obj["update"] = function(self)
        -- self[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- self[2] = obj_char["y"] + obj_char[6]*(840)
        self[1] = obj_char["x"] + obj_char[5]*(166)
        self[2] = obj_char["y"] + obj_char[6]*(-247)
        self[3] = obj_char[3]
        self[4] = 1
        self[5] = obj_char[5]
        self[6] = obj_char[6]
        self[7] = obj_char[7]
        if obj_char["state"] == "2S" then
            frame_animator(self,self["animation"])
            self["life"] = self["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            self["life"] = 0
        end
    end
    obj["draw"] = function(self)
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,self,image_sprite_sheet,tostring(self[8]))

        love.graphics.setColor(1,1,1,obj[4])
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_6S_whiff(obj_char)
    local obj = {0, 0, 0, 1, 1, 1, 0, 0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["6S_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["6S_whiff_VFX"]
    end 

    obj["life"] = 36
    obj[1] = obj_char["x"] + obj_char[5]*(-430)
    obj[2] = obj_char["y"] + obj_char[6]*(-520)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = -1
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][2] = 1
    obj["animation"][5] = 2
    obj["animation"][11] = 3
    obj["animation"][15] = 4
    obj["animation"][19] = 5
    obj["animation"][24] = 6
    obj["animation"][29] = 7
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 36
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with(obj,obj["animation"])
    obj["update"] = function(self)
        self[1] = obj_char["x"] + obj_char[5]*(-430)
        self[2] = obj_char["y"] + obj_char[6]*(-520)
        self[3] = obj_char[3]
        self[4] = 1
        self[5] = obj_char[5]
        self[6] = obj_char[6]
        self[7] = obj_char[7]
        if obj_char["state"] == "6S" then
            frame_animator(self,self["animation"])
            self["life"] = self["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            self["life"] = 0
        end
    end
    obj["draw"] = function(self)
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,self,image_sprite_sheet,tostring(self[8]))

        love.graphics.setBlendMode("add")
        love.graphics.setColor(1,1,1,obj[4])
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_cS_whiff(obj_char)
    local obj = {0, 0, 0, 1, 1, 1, 0, 0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["cS_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["cS_whiff_VFX"]
    end 

    obj["life"] = 19
    obj[1] = obj_char["x"] + obj_char[5]*(140)
    obj[2] = obj_char["y"] + obj_char[6]*(-440)
    obj[3] = obj_char[3]
    obj[4] = 0.65
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = -1
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][6] = 1
    obj["animation"][9] = 2
    obj["animation"][12] = 3
    obj["animation"][15] = 4
    obj["animation"][18] = 5
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 19
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with(obj,obj["animation"])
    obj["update"] = function(self)
        -- self[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- self[2] = obj_char["y"] + obj_char[6]*(840)
        self[1] = obj_char["x"] + obj_char[5]*(140)
        self[2] = obj_char["y"] + obj_char[6]*(-440)
        self[3] = obj_char[3]
        self[4] = 1
        self[5] = obj_char[5]
        self[6] = obj_char[6]
        self[7] = obj_char[7]
        if obj_char["state"] == "cS" then
            frame_animator(self,self["animation"])
            self["life"] = self["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            self["life"] = 0
        end
    end
    obj["draw"] = function(self)
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,self,image_sprite_sheet,tostring(self[8]))

        love.graphics.setBlendMode("add")
        love.graphics.setColor(1,1,1,obj[4])
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5Launcher(obj_char)
    local obj = {0, 0, 0, 1, 1, 1, 0, 0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5Launcher_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5Launcher_whiff_VFX"]
    end 

    obj["life"] = 3
    obj[1] = obj_char["x"] + obj_char[5]*(-285)
    obj[2] = obj_char["y"] + obj_char[6]*(-535)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = -1
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][1] = 1
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 3
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with(obj,obj["animation"])
    obj["update"] = function(self)
        -- self[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- self[2] = obj_char["y"] + obj_char[6]*(840)
        self[1] = obj_char["x"] + obj_char[5]*(-285)
        self[2] = obj_char["y"] + obj_char[6]*(-535)
        self[3] = obj_char[3]
        self[4] = 1
        self[5] = obj_char[5]
        self[6] = obj_char[6]
        self[7] = obj_char[7]
        if obj_char["state"] == "5Launcher" then
            frame_animator(self,self["animation"])
            self["life"] = self["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            self["life"] = 0
        end
    end
    obj["draw"] = function(self)
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,self,image_sprite_sheet,tostring(self[8]))

        love.graphics.setColor(1,1,1,obj[4])
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
function insert_VFX_game_scene_char_TRM_5Launcher_glow(obj_char)
    local obj = {0, 0, 0, 1, 1, 1, 0, 0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["5Launcher_glow_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["5Launcher_glow_whiff_VFX"]
    end 

    obj["life"] = 18
    obj[1] = obj_char["x"] + obj_char[5]*(-380)
    obj[2] = obj_char["y"] + obj_char[6]*(-636)
    obj[3] = obj_char[3]
    obj[4] = 0.65
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = -1
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    for i=0,17 do
        obj["animation"][i] = i
    end
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 18
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with(obj,obj["animation"])
    obj["update"] = function(self)
        -- self[1] = obj_char["x"] + obj_char[5]*(-860)/2
        -- self[2] = obj_char["y"] + obj_char[6]*(840)
        self[1] = obj_char["x"] + obj_char[5]*(-380)
        self[2] = obj_char["y"] + obj_char[6]*(-636)
        self[3] = obj_char[3]
        self[4] = 1
        self[5] = obj_char[5]
        self[6] = obj_char[6]
        self[7] = obj_char[7]
        if obj_char["state"] == "5Launcher" then
            frame_animator(self,self["animation"])
            self["life"] = self["life"] - 1
        elseif obj_char["state"] == "hitstop" then
            -- do nothing
        else
            self["life"] = 0
        end
    end
    obj["draw"] = function(self)
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,self,image_sprite_sheet,tostring(self[8]))

        love.graphics.setBlendMode("add")
        love.graphics.setColor(1,1,1,obj[4])
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_front_table"],obj)
end

function insert_VFX_game_scene_char_TRM_jS_whiff(obj_char)
    local obj = {0, 0, 0, 1, 1, 1, 0, 0}
    local image_sprite_sheet = nil
    local side = obj_char["player_side"]
    if side == "L" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_LP["jS_whiff_VFX"]
    elseif side == "R" then
        image_sprite_sheet = image_sprite_sheet_VFX_game_scene_RP["jS_whiff_VFX"]
    end 

    obj["life"] = 13
    obj[1] = obj_char["x"] + obj_char[5]*(-160)
    obj[2] = obj_char["y"] + obj_char[6]*(-370)
    obj[3] = obj_char[3]
    obj[4] = 1
    obj[5] = obj_char[5]
    obj[6] = obj_char[6]
    obj[7] = obj_char[7]
    obj[8] = -1
    obj["FCT"] = {0,0,0,0,0,0,0,0}
    obj["LCT"] = {0,0,0,0,0,0,0,0}
    obj["LCD"] = {0,0,0,0,0,0,0,0}
    obj["animation"] = {}
    obj["animation"][0] = 0
    obj["animation"][4] = 1
    obj["animation"][8] = 2
    obj["animation"][10] = 3
    obj["animation"]["prop"] = 8
    obj["animation"]["length"] = 13
    obj["animation"]["loop"] = false
    obj["animation"]["fix_type"] = true
    init_frame_anim_with(obj,obj["animation"])
    obj["update"] = function(self)
        if obj["FCT"][8] < 7 and obj_char["state"] == "jS" then
            self[1] = obj_char["x"] + obj_char[5]*(-160)
            self[2] = obj_char["y"] + obj_char[6]*(-370)
            self[3] = obj_char[3]
            self[4] = 1
            self[5] = obj_char[5]
            self[6] = obj_char[6]
            self[7] = obj_char[7]
        elseif obj_char["state"] == "jS" then
            self[1] = obj_char["x"] + obj_char[5]*(-60)
            self[2] = obj_char["y"] + obj_char[6]*(-250)
            self[3] = obj_char[3]
            self[4] = 1
            self[5] = obj_char[5]
            self[6] = obj_char[6]
            self[7] = obj_char[7]
        end
        if obj_char["state"] == "hitstop" then
            -- do nothing
        else
            frame_animator(self,self["animation"])
            self["life"] = self["life"] - 1
        end
    end
    obj["draw"] = function(self)
        local obj_camera = obj_stage_game_scene_camera
        image_sprite_sheet["sprite_batch"]:clear()
        draw_3d_image_sprite_batch(obj_camera,self,image_sprite_sheet,tostring(self[8]))

        love.graphics.setBlendMode("add")
        love.graphics.setColor(1,1,1,obj[4])
        love.graphics.draw(image_sprite_sheet["sprite_batch"])
        love.graphics.setColor(1,1,1,1)
        love.graphics.setBlendMode("alpha")
    end
    table.insert(obj_char["VFX_front_table"],obj)
end
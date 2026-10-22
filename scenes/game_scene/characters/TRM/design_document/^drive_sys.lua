-- drive_sys
function character_function_game_scene_TRM_drive_sys_off_init(obj_char)
    -- state
    obj_char["drive_sys_state"] = "off"
    obj_char["drive_sys_f"] = 0
    obj_char["drive_sys_timer"] = 0
    obj_char["drive_sys_projectile"] = nil
    return
end
function character_function_game_scene_TRM_drive_sys_start_pos(obj_char)
    local anchor_pos = obj_char["shot_sys_oroboros_anchor_pos"]
    return {
        obj_char["x"] + obj_char[5]*anchor_pos[1],
        obj_char["y"] + obj_char[6]*anchor_pos[2]
    }
end
function character_function_game_scene_TRM_drive_sys_end_pos(obj_char,start_pos)
    local direction_input = obj_char["direction_input"]
    local chain_angle_table = {
        [5] = 0,
        [6] = 0,
        [9] = -math.pi/4,
        [3] = math.pi/4,
        [8] = -math.pi/2,
        [2] = math.pi/2,
        [7] = -math.pi*3/4,
        [1] = math.pi*3/4,
        [4] = math.pi
    }
    local chain_length_table = {
        [5] = 700,
        [6] = 700,
        [9] = 560,
        [3] = 560,
        [8] = 460,
        [2] = 460,
        [7] = 560,
        [1] = 560,
        [4] = 620
    }
    local chain_angle = chain_angle_table[direction_input] or 0
    local chain_length = chain_length_table[direction_input] or 700
    if obj_char[5] < 0 then
        chain_angle = math.pi - chain_angle
    end
    return {
        start_pos[1] + math.cos(chain_angle)*chain_length,
        start_pos[2] + math.sin(chain_angle)*chain_length
    }
end
function character_function_game_scene_TRM_drive_sys_bite_hit_init(obj_char)
    -- state
    obj_char["drive_sys_state"] = "bite_hit"
    obj_char["drive_sys_f"] = 0
    obj_char["drive_sys_timer"] = 0
    return
end
function character_function_game_scene_TRM_drive_sys_bite_miss_init(obj_char)
    -- state
    obj_char["drive_sys_state"] = "bite_miss"
    obj_char["drive_sys_f"] = 0
    obj_char["drive_sys_timer"] = 0
    return
end
function character_function_game_scene_TRM_drive_sys_pull_back_init(obj_char)
    -- state
    obj_char["drive_sys_state"] = "pull_back"
    obj_char["drive_sys_f"] = 0
    obj_char["drive_sys_timer"] = 0
    return
end
function character_function_game_scene_TRM_drive_sys_on_fly_init(
    obj_char,opponent_obj_char,start_pos,end_pos
)
    -- state
    obj_char["drive_sys_state"] = "on_fly"
    obj_char["drive_sys_f"] = 1
    obj_char["drive_sys_timer"] = 0
    -- draw_correction
    obj_char["drive_sys_chain_link_scale"] = 0.72
    obj_char["drive_sys_chain_head_scale"] = 1.00
    obj_char["drive_sys_chain_fade_length"] = 240
    -- insert_projectile
    obj_char["drive_sys_projectile"] = insert_projectile_game_scene_char_TRM_SP_H_chain(
        obj_char,opponent_obj_char,start_pos,end_pos
    )
    return
end
-- state_machine
function character_function_game_scene_TRM_drive_sys_state_machine(
    self_side_obj_char,opponent_side_obj_char
)
    -- state
    local drive_sys_state = self_side_obj_char["drive_sys_state"] or "off"
    local obj_projectile = self_side_obj_char["drive_sys_projectile"]
    -- state_machine
    local switch =
    {
        ["off"] = function()
            return
        end,
        ["on_fly"] = function()
            -- state_number
            self_side_obj_char["drive_sys_timer"] = self_side_obj_char["drive_sys_timer"] + 1
            if not obj_projectile then
                character_function_game_scene_TRM_drive_sys_off_init(self_side_obj_char)
                return
            end
            -- bite_hit
            if obj_projectile["chain_hitted"] then
                character_function_game_scene_TRM_drive_sys_bite_hit_init(self_side_obj_char)
                return
            end
            -- bite_miss
            if obj_projectile["chain_elapsed"] >= obj_projectile["chain_extend_frames"] then
                character_function_game_scene_TRM_drive_sys_bite_miss_init(self_side_obj_char)
                return
            end
        end,
        ["bite_hit"] = function()
            -- state_number
            self_side_obj_char["drive_sys_timer"] = self_side_obj_char["drive_sys_timer"] + 1
            -- off
            if (not obj_projectile) or obj_projectile["chain_length"] <= 0 then
                character_function_game_scene_TRM_drive_sys_off_init(self_side_obj_char)
                return
            end
        end,
        ["bite_miss"] = function()
            -- state_number
            self_side_obj_char["drive_sys_timer"] = self_side_obj_char["drive_sys_timer"] + 1
            -- pull_back
            if obj_projectile and obj_projectile["chain_retract_from"] then
                character_function_game_scene_TRM_drive_sys_pull_back_init(self_side_obj_char)
                return
            end
            -- off
            if (not obj_projectile) or obj_projectile["chain_length"] <= 0 then
                character_function_game_scene_TRM_drive_sys_off_init(self_side_obj_char)
                return
            end
        end,
        ["pull_back"] = function()
            -- state_number
            self_side_obj_char["drive_sys_timer"] = self_side_obj_char["drive_sys_timer"] + 1
            -- off
            if (not obj_projectile) or obj_projectile["chain_length"] <= 0 then
                character_function_game_scene_TRM_drive_sys_off_init(self_side_obj_char)
                return
            end
        end
    }
    local this_function = switch[drive_sys_state]
    if this_function then this_function() end
    return
end
-- 绘制：几何全部读飞行道具，drive_sys 只负责画
function character_function_game_scene_TRM_drive_sys_draw(
    obj_char,image_sprite_sheet_table,obj_camera
)
    local drive_sys_state = obj_char["drive_sys_state"] or "off"
    if drive_sys_state == "off" then
        return
    end
    local obj_projectile = obj_char["drive_sys_projectile"]
    if not obj_projectile then
        return
    end
    local length = obj_projectile["chain_length"]
    if length <= 1 then
        return
    end
    local z = obj_projectile[3]
    local depth_scale = draw_resolution_correction(800)/(z - obj_camera[3])
    local origin_x = obj_projectile["x"]
    local origin_y = obj_projectile["y"]
    local angle = obj_projectile["chain_angle"]
    local dir_x = math.cos(angle)
    local dir_y = math.sin(angle)
    -- chain_link
    local chain_sheet = image_sprite_sheet_table["SP_H_chain_projectile"]
    local chain_frame = chain_sheet["frames"]["0"]
    local chain_quad = love.graphics.newQuad(
        chain_frame[1],chain_frame[2],chain_frame[3],chain_frame[4],chain_frame[5],chain_frame[6]
    )
    local link_scale = obj_char["drive_sys_chain_link_scale"]*depth_scale
    local link_world_length = chain_frame[3]*obj_char["drive_sys_chain_link_scale"]
    local link_count = math.max(1,math.ceil(length/link_world_length))
    local link_spacing = length/link_count
    chain_sheet["sprite_batch"]:clear()
    for i = 0,link_count - 1 do
        local distance = (i + 0.5)*link_spacing
        local link_screen = draw_3d_point_to_2D(
            obj_camera,{origin_x + dir_x*distance,origin_y + dir_y*distance,z}
        )
        chain_sheet["sprite_batch"]:add(
            chain_quad,link_screen[1],link_screen[2],angle,
            link_scale,link_scale,chain_frame[3]/2,chain_frame[4]/2
        )
    end
    -- 起始端线性渐变（shader）
    if not shader_game_scene_drive_chain_fade then
        shader_game_scene_drive_chain_fade = love.graphics.newShader("shaders/drive_chain_fade.glsl")
    end
    local shader = shader_game_scene_drive_chain_fade
    local chain_start_screen = draw_3d_point_to_2D(obj_camera,{origin_x,origin_y,z})
    shader:send("chain_start",{chain_start_screen[1],chain_start_screen[2]})
    shader:send("chain_dir",{dir_x,dir_y})
    shader:send("fade_length",obj_char["drive_sys_chain_fade_length"]*depth_scale)
    love.graphics.setShader(shader)
    love.graphics.draw(chain_sheet["sprite_batch"])
    love.graphics.setShader()
    -- oroboros_head
    local head_sheet = image_sprite_sheet_table["SP_H_oroboros_projectile"]
    local head_frame = head_sheet["frames"][tostring(obj_char["drive_sys_f"])]
    local head_screen = draw_3d_point_to_2D(
        obj_camera,{origin_x + dir_x*length,origin_y + dir_y*length,z}
    )
    local head_scale = obj_char["drive_sys_chain_head_scale"]*depth_scale
    local head_angle = angle
    local head_scale_x = head_scale
    if dir_x < 0 then
        head_angle = angle + math.pi
        head_scale_x = -head_scale
    end
    local head_quad = love.graphics.newQuad(
        head_frame[1],head_frame[2],head_frame[3],head_frame[4],head_frame[5],head_frame[6]
    )
    head_sheet["sprite_batch"]:clear()
    head_sheet["sprite_batch"]:add(
        head_quad,head_screen[1],head_screen[2],head_angle,
        head_scale_x,head_scale,head_frame[3]/2,head_frame[4]/2
    )
    love.graphics.draw(head_sheet["sprite_batch"])
    return
end

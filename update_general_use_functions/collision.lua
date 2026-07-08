-- 所有pushbox hitbox hurtbox的长宽都必须是双数 要能被2整除 使得box的每个判定均匀的分布在最小单位
-- 所有pushbox 必须在对象的左右中央 下方锚点在0上
function collision_box_to_real_world_box(obj,box)
    local res = {
        box[1]*obj[5] + obj["x"],
        box[2]*obj[6] + obj["y"],
        box[3],
        box[4]
    }
    return res
end
function collision_box_aabb_detection(box_a,box_b)
    local box_a_L = box_a[1]-box_a[3]/2 -- 300 - 65 = 235
    local box_a_R = box_a[1]+box_a[3]/2 -- 365
    local box_a_T = box_a[2]-box_a[4]/2 -- 155 - 210 = -55
    local box_a_B = box_a[2]+box_a[4]/2 -- 155 + 210 = 365 

    local box_b_L = box_b[1]-box_b[3]/2 -- 320 - 65 = 255
    local box_b_R = box_b[1]+box_b[3]/2 -- 385
    local box_b_T = box_b[2]-box_b[4]/2 -- -55
    local box_b_B = box_b[2]+box_b[4]/2 -- 365

    local x_overlap = ( box_a_R >= box_b_L and box_b_R >= box_a_L )
    local y_overlap = ( box_a_T <= box_b_B and box_b_T <= box_a_B )

    return (x_overlap and y_overlap)   
end

function collision_test_char_on_ground(obj)
    local box = collision_box_to_real_world_box(obj,obj["pushbox"])
    local stage_B_collision = 0
    local box_B_collision = 0
    box_B_collision = box[2]+box[4]/2+obj["collision_ground_height_offset"]
    return box_B_collision >= stage_B_collision
end
function collision_test_cS_distance_check(obj_char,max_distance)
    -- local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    -- if math.abs(obj_char_other_side["x"] - obj_char["x"]) < max_distance+200 then
    --     return true
    -- end
    -- return false
    
    local hurtbox = {}
    local hurtbox_front_x = 0
    local hurtbox_edge_x = 0
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local num_hurtbox_table = #obj_char_other_side["hurtbox_table"]
    if #obj_char_other_side["hurtbox_table"] == 0 then return true end
    for i=1,num_hurtbox_table do
        hurtbox = obj_char_other_side["hurtbox_table"][i]
        hurtbox_front_x = hurtbox[1] * obj_char_other_side[5] + obj_char_other_side["x"]
        -- hurtbox_front_x 是hurtbox中心，加减width/2得到前后边界
        hurtbox_edge_x1 = hurtbox_front_x + (hurtbox[3]/2) * obj_char_other_side[5]
        hurtbox_edge_x2 = hurtbox_front_x - (hurtbox[3]/2) * obj_char_other_side[5]
        if math.abs(hurtbox_edge_x1 - obj_char["x"]) < max_distance or math.abs(hurtbox_edge_x2 - obj_char["x"]) < max_distance then
            return true
        end
    end
    return false
end
function collision_pushbox_relocate_y(obj)
    local box = collision_box_to_real_world_box(obj,obj["pushbox"])
    local stage_B_collision = 0
    local box_B_collision = 0
    box_B_collision = box[2]+box[4]/2+obj["collision_ground_height_offset"]
    obj["y"] = math.min(box_B_collision,stage_B_collision)-obj["collision_ground_height_offset"]
end
function collision_pushbox_stage_relocate_x(obj)
    local box = collision_box_to_real_world_box(obj,obj["pushbox"])
    local left_stage_collision = -2100.0
    local right_stage_collision = 2100.0
    if box[1] - box[3]/2 <= left_stage_collision then
        obj["x"] = left_stage_collision + box[3]/2
        obj["collision_move_available"] = {0,1}
    elseif box[1] + box[3]/2 >= right_stage_collision then
        obj["x"] = right_stage_collision - box[3]/2
        obj["collision_move_available"] = {1,0}
    else
        obj["collision_move_available"] = {1,1}
    end
end
function collision_pushbox_state_relocate_in_character_x(obj_char_LP,obj_char_RP,mid_anchor)
    local box_L = collision_box_to_real_world_box(obj_char_LP,obj_char_LP["pushbox"])
    local box_R = collision_box_to_real_world_box(obj_char_RP,obj_char_RP["pushbox"])
    local obj_camera = obj_stage_game_scene_camera
    if obj_char_LP["x"] < obj_char_RP["x"] then
        if (box_R[1] + box_R[3]/2)-(box_L[1] - box_L[3]/2) > 1840 then
            obj_char_LP["x"] = mid_anchor - 920 + box_L[3]/2
            obj_char_RP["x"] = mid_anchor + 920 - box_R[3]/2
        end
    elseif obj_char_LP["x"] > obj_char_RP["x"] then
        if (box_L[1] + box_L[3]/2)-(box_R[1] - box_R[3]/2) > 1840 then
            obj_char_LP["x"] = mid_anchor + 920 - box_L[3]/2
            obj_char_RP["x"] = mid_anchor - 920 + box_R[3]/2
        end
    end
end
function collision_pushbox_dynamic_normal_aabb_relocate_x(obj_char_LP,obj_char_RP)
    local box_L = collision_box_to_real_world_box(obj_char_LP,obj_char_LP["pushbox"])
    local box_R = collision_box_to_real_world_box(obj_char_RP,obj_char_RP["pushbox"])

    if (not obj_char_LP["pushbox_other_side_char_active"])
    or (not obj_char_RP["pushbox_other_side_char_active"]) then
        return
    end
    if collision_box_aabb_detection(box_L,box_R) then
        local collision_state = table.concat({
            obj_char_LP["collision_move_available"][1],
            obj_char_LP["collision_move_available"][2],
            obj_char_RP["collision_move_available"][1],
            obj_char_RP["collision_move_available"][2]
        })
        local switch = {
            ["1111"] = function()
                local branch_flag = -1
                if box_L[1] == box_R[1] then
                    if math.random() < 0.5 then
                        branch_flag = 1
                    else
                        branch_flag = 0
                    end
                end
                if box_L[1] < box_R[1] or branch_flag == 1 then
                    local mid = (box_L[1]+box_L[3]/2+box_R[1]-box_R[3]/2)/2
                    obj_char_LP["x"] = mid-box_L[3]/2
                    obj_char_RP["x"] = mid+box_R[3]/2
                elseif box_L[1] > box_R[1] or branch_flag == 0 then
                    local mid = (box_R[1]+box_R[3]/2+box_L[1]-box_L[3]/2)/2
                    obj_char_LP["x"] = mid+box_L[3]/2
                    obj_char_RP["x"] = mid-box_R[3]/2
                end
            end,
            ["0111"] = function()
                obj_char_RP["x"] = box_L[1]+box_L[3]/2+box_R[3]/2
            end,
            ["1101"] = function()
                obj_char_LP["x"] = box_R[1]+box_R[3]/2+box_L[3]/2
            end,
            ["0101"] = function()
                if obj_char_LP["wallhurt_wallstick_on_side"] ~= 0 then
                    obj_char_RP["x"] = box_L[1]+box_L[3]/2+box_R[3]/2
                    return
                end
                if obj_char_RP["wallhurt_wallstick_on_side"] ~= 0 then
                    obj_char_LP["x"] = box_R[1]+box_R[3]/2+box_L[3]/2
                    return
                end

                if COLLSION_CONER_OUT_STATE[obj_char_LP["state"]] then
                    obj_char_RP["x"] = box_L[1]+box_L[3]/2+box_R[3]/2
                    return
                end
                if COLLSION_CONER_OUT_STATE[obj_char_RP["state"]] then
                    obj_char_LP["x"] = box_R[1]+box_R[3]/2+box_L[3]/2
                    return
                end

                if obj_char_LP["y"] < obj_char_RP["y"] then
                    obj_char_LP["x"] = box_R[1]+box_R[3]/2+box_L[3]/2
                    return
                else
                    obj_char_RP["x"] = box_L[1]+box_L[3]/2+box_R[3]/2
                    return
                end
            end,
            ["1011"] = function()
                obj_char_RP["x"] = box_L[1]-box_L[3]/2-box_R[3]/2
            end,
            ["1110"] = function()
                obj_char_LP["x"] = box_R[1]-box_R[3]/2-box_L[3]/2
            end,
            ["1010"] = function()
                if obj_char_LP["wallhurt_wallstick_on_side"] ~= 0 then
                    obj_char_RP["x"] = box_L[1]-box_L[3]/2-box_R[3]/2
                    return
                end
                if obj_char_RP["wallhurt_wallstick_on_side"] ~= 0 then
                    obj_char_LP["x"] = box_R[1]-box_R[3]/2-box_L[3]/2
                    return
                end

                if COLLSION_CONER_OUT_STATE[obj_char_LP["state"]] then
                    obj_char_RP["x"] = box_L[1]-box_L[3]/2-box_R[3]/2
                    return
                end
                if COLLSION_CONER_OUT_STATE[obj_char_RP["state"]] then
                    obj_char_LP["x"] = box_R[1]-box_R[3]/2-box_L[3]/2
                    return
                end

                if obj_char_LP["y"] < obj_char_RP["y"] then
                    obj_char_LP["x"] = box_R[1]-box_R[3]/2-box_L[3]/2
                    return
                else
                    obj_char_RP["x"] = box_L[1]-box_L[3]/2-box_R[3]/2
                    return
                end

                if obj_char_LP["y"] < obj_char_RP["y"] then
                    obj_char_LP["x"] = box_R[1]-box_R[3]/2-box_L[3]/2
                    return
                else
                    obj_char_RP["x"] = box_L[1]-box_L[3]/2-box_R[3]/2
                    return
                end
            end
        }
        local this_function = switch[collision_state]
        if this_function then this_function() end
    end
end

function collision_uncondicational_hurtbox_test(hit_obj,hurt_obj)
    for i=1,#hit_obj["hitbox_table"] do
        local current_hitbox = collision_box_to_real_world_box(hit_obj,hit_obj["hitbox_table"][i])
        local current_hurtbox = collision_box_to_real_world_box(hurt_obj,hurt_obj["pushbox"])
        if collision_box_aabb_detection(current_hitbox,current_hurtbox) then
            return true
        end
    end
    return false
end
function collision_strike_hurtbox_test(hit_obj,hurt_obj)
    if hit_obj["hit_type"] ~= "strike" or hurt_obj["strike_inv"] == true or hit_obj["strike_active"] == false then
        return false
    end
    for i=1,#hit_obj["hitbox_table"] do
        local current_hitbox = collision_box_to_real_world_box(hit_obj,hit_obj["hitbox_table"][i])
        for j=1,#hurt_obj["hurtbox_table"] do
            local current_hurtbox = collision_box_to_real_world_box(hurt_obj,hurt_obj["hurtbox_table"][j])
            if collision_box_aabb_detection(current_hitbox,current_hurtbox) then
                collision_strike_assign_hit_VFX_dynamic_spawn_pos(hit_obj,current_hitbox,current_hurtbox)
                return true
            end
        end
    end
    return false
end
function collision_strike_assign_hit_VFX_dynamic_spawn_pos(hit_obj,current_hitbox,current_hurtbox)
    hit_obj["hit_VFX_dynamic_spawn_pos"] = {
        (current_hitbox[1]+current_hurtbox[1])/2,
        (current_hitbox[2]+current_hurtbox[2])/2
    }
end
function collision_throw_hurtbox_test(hit_obj,hurt_obj)
    if hit_obj["hit_type"] ~= "throw" 
    or hurt_obj["throw_inv"] == true 
    or hit_obj["throw_active"] == false 
    or collision_throw_air_or_not_test(hit_obj,hurt_obj)
    or math.abs(hit_obj["x"]-hurt_obj["x"]) > hit_obj["default_throw_distance"] then
        return false
    end
    for i=1,#hit_obj["hitbox_table"] do
        local current_hitbox = collision_box_to_real_world_box(hit_obj,hit_obj["hitbox_table"][i])
        for j=1,#hurt_obj["hurtbox_table"] do
            local current_hurtbox = collision_box_to_real_world_box(hurt_obj,hurt_obj["hurtbox_table"][j])
            if collision_box_aabb_detection(current_hitbox,current_hurtbox) then
                return true
            end
        end
    end
    return false
end
function collision_throw_air_or_not_test(hit_obj,hurt_obj)
    if hit_obj["height"] == "air" and hurt_obj["height"] ~= "air" then
        return true
    elseif hurt_obj["height"] == "air" and hit_obj["height"] ~= "air" then
        return true
    else
        return false
    end
end
function collision_projectile_hurtbox_test(hit_obj,hurt_obj)
    -- none strike throw burst projectile
    if hit_obj["hit_type"] == "none" then
        return false
    end
    if hit_obj["hit_type"] == "strike" and (hurt_obj["strike_inv"] == true or hit_obj["strike_active"] == false) then
        return false
    end
    if hit_obj["hit_type"] == "throw" and (hurt_obj["throw_inv"] == true or hit_obj["throw_active"] == false) then
        return false
    end
    if hit_obj["hit_type"] == "projectile" and (hurt_obj["projectile_inv"] == true or hit_obj["projectile_active"] == false) then
        return false
    end
    for i=1,#hit_obj["hitbox_table"] do
        local current_hitbox = collision_box_to_real_world_box(hit_obj,hit_obj["hitbox_table"][i])
        for j=1,#hurt_obj["hurtbox_table"] do
            local current_hurtbox = collision_box_to_real_world_box(hurt_obj,hurt_obj["hurtbox_table"][j])
            if collision_box_aabb_detection(current_hitbox,current_hurtbox) then
                return true
            end
        end
    end
end
function collision_strike_hitbox_clash_test()
end
function collision_projectile_clash_test(obj_A,obj_B)
end

-- optimal CCD algo but not 100% currect
-------------------------------------------------------------------------------------------------
    -- function pushbox_dynamic_CCD(obj_A,obj_B,time_enter,time_exit)
    --     local box_A_start = collision_box_to_real_world_box(obj_A,"pushbox")
    --     local box_B_start = collision_box_to_real_world_box(obj_B,"pushbox")
    --     local velocity_A = obj_A["velocity"]
    --     local velocity_B = obj_B["velocity"]
    --     local box_A_end = {
    --         box_A_start[1] + velocity_A[1],
    --         box_A_start[2] + velocity_A[2],
    --         box_A_start[3],
    --         box_A_start[4],
    --     }
    --     local box_B_end = {
    --         box_B_start[1] + velocity_B[1],
    --         box_B_start[2] + velocity_B[2],
    --         box_B_start[3],
    --         box_B_start[4],
    --     }

    --     local velocity_rel_x = velocity_A[1] - velocity_B[1]
    --     local velocity_rel_y = velocity_A[2] - velocity_B[2]

    --     local time_enter = 0
    --     local time_exit = 1

    --     -- X轴投影计算
    --     if velocity_rel_x ~= 0 then
    --         local overlap_start = (
    --             (box_B_start[1]-box_B_start[3]/2) - 
    --             (box_A_start[1]+box_A_start[3]/2)
    --         )/velocity_rel_x
    --         local overlap_end = (
    --             (box_B_start[1]+box_B_start[3]/2) - 
    --             (box_A_start[1]+box_A_start[3]/2)
    --         )/velocity_rel_x
            
    --         if velocity_rel_x > 0 then
    --             time_enter = math.max(time_enter,overlap_start)
    --             time_exit = math.min(time_exit,overlap_end)
    --         else
    --             time_enter = math.max(time_enter,overlap_end)
    --             time_exit = math.min(time_exit,overlap_start)
    --         end
    --     else
    --         -- X轴无相对速度，直接判断是否重叠
    --         if (box_A_start[1]+box_A_start[3]/2) < (box_B_start[1]-box_B_start[3]/2)
    --         or (box_A_start[1]-box_A_start[3]/2) > (box_A_start[1]+box_A_start[3]/2)
    --         then
    --             return nil -- 无碰撞
    --         end
    --     end

    --     -- Y轴投影计算
    --     if velocity_rel_y ~= 0 then
    --         local overlap_start = (
    --             (box_B_start[2]-box_B_start[4]/2) - 
    --             (box_A_start[2]+box_A_start[4]/2)
    --         )/velocity_rel_y
    --         local overlap_end = (
    --             (box_B_start[2]+box_B_start[4]/2) - 
    --             (box_A_start[2]+box_A_start[4]/2)
    --         )/velocity_rel_y
            
    --         if velocity_rel_y > 0 then
    --             time_enter = math.max(time_enter,overlap_start)
    --             time_exit = math.min(time_exit,overlap_end)
    --         else
    --             time_enter = math.max(time_enter,overlap_end)
    --             time_exit = math.min(time_exit,overlap_start)
    --         end
    --     else
    --         -- Y轴无相对速度，直接判断是否重叠
    --         if (box_A_start[2]+box_A_start[4]/2) < (box_B_start[2]-box_B_start[4]/2)
    --         or (box_A_start[2]-box_A_start[4]/2) > (box_A_start[2]+box_A_start[4]/2)
    --         then
    --             return nil -- 无碰撞
    --         end
    --     end

    --     -- 判断有效时间区间
    --     if time_enter > time_exit or time_exit < 0 or time_enter > 1 then
    --         return nil -- 无碰撞
    --     end

    --     -- 返回最早碰撞时间和碰撞点
    --     local t = math.max(time_enter,0)
    --     obj_A["x"] = round(obj_A["x"] + velocity_A * t)
    --     obj_B["x"] = obj_A["x"] + box_A_end[3]/2 + box_B_end[3]/2
    --     local res_velocity = (obj_A["velocity"][1] + obj_B["velocity"][1])/2
    --     obj_A["velocity"][1] = res_velocity
    --     obj_B["velocity"][1] = res_velocity

    -- end

-- capsule collision detection and relocation
-- -------------------------------------------------------------------------------------------------
    -- function collision_box_to_capsule(box)
    --     local res = {
    --         box[1],     -- x
    --         box[2],     -- y
    --         box[4],     -- height
    --         box[3]/2    -- r
    --     }
    --     return res
    -- end
    -- function collision_capsule_detection(capsule_a,capsule_b)
    --     -- x,y,height,r
    --     local dx = capsule_a[1] - capsule_b[1]
    --     local r = capsule_a[4] + capsule_b[4]
    --     if dx > r then
    --         return false
    --     end

    --     local capsule_a_top = capsule_a[2]-capsule_a[3]/2+capsule_a[4] 
    --     local capsule_a_bottom = capsule_a[2]+capsule_a[3]/2-capsule_a[4] 
    --     local capsule_b_top = capsule_b[2]-capsule_b[3]/2+capsule_b[4] 
    --     local capsule_b_bottom = capsule_b[2]+capsule_b[3]/2-capsule_b[4]

    --     local gap = 0
    --     if capsule_a_bottom < capsule_b_top then
    --         gap = capsule_b_top-capsule_a_bottom
    --     elseif capsule_b_bottom < capsule_a_top then
    --         gap = capsule_a_top-capsule_b_bottom
    --     end

    --     return dx*dx+gap*gap<=r*r
    -- end
    -- function collision_capsule_x_relocate_distance(capsule_a,capsule_b)
    --     local r = capsule_a[4] + capsule_b[4]
    --     local capsule_a_top = capsule_a[2]-capsule_a[3]/2+capsule_a[4] 
    --     local capsule_a_bottom = capsule_a[2]+capsule_a[3]/2-capsule_a[4] 
    --     local capsule_b_top = capsule_b[2]-capsule_b[3]/2+capsule_b[4] 
    --     local capsule_b_bottom = capsule_b[2]+capsule_b[3]/2-capsule_b[4]

    --     local gap = 0
    --     if capsule_a_bottom < capsule_b_top then
    --         gap = capsule_b_top-capsule_a_bottom
    --     elseif capsule_b_bottom < capsule_a_top then
    --         gap = capsule_a_top-capsule_b_bottom
    --     end

    --     return math.sqrt(r*r-gap*gap)
    -- end
    -- function collision_pushbox_dynamic_normal_aabb_relocate_x(obj_char_LP,obj_char_RP)
    --     local box_L = collision_box_to_real_world_box(obj_char_LP,obj_char_LP["pushbox"])
    --     local box_R = collision_box_to_real_world_box(obj_char_RP,obj_char_RP["pushbox"])
    --     local capsule_L = collision_box_to_capsule(box_L)
    --     local capsule_R = collision_box_to_capsule(box_R)
    --     local distance = collision_capsule_x_relocate_distance(capsule_L,capsule_R)
    --     if (not obj_char_LP["pushbox_other_side_char_active"])
    --     or (not obj_char_RP["pushbox_other_side_char_active"]) then
    --         return
    --     end
    --     if collision_capsule_detection(capsule_L,capsule_R) then
    --         local collision_state = table.concat({
    --             obj_char_LP["collision_move_available"][1],
    --             obj_char_LP["collision_move_available"][2],
    --             obj_char_RP["collision_move_available"][1],
    --             obj_char_RP["collision_move_available"][2]
    --         })
    --         local switch = {
    --             ["1111"] = function()
    --                 local branch_flag = -1
    --                 if capsule_L[1] == capsule_R[1] then
    --                     if math.random() < 0.5 then
    --                         branch_flag = 1
    --                     else
    --                         branch_flag = 0
    --                     end
    --                 end
    --                 if capsule_L[1] < capsule_R[1] or branch_flag == 1 then
    --                     local mid = (box_L[1]+box_L[3]/2+box_R[1]-box_R[3]/2)/2
    --                     obj_char_LP["x"] = mid-distance/2
    --                     obj_char_RP["x"] = mid+distance/2
    --                 elseif capsule_L[1] > capsule_R[1] or branch_flag == 0 then
    --                     local mid = (box_R[1]+box_R[3]/2+box_L[1]-box_L[3]/2)/2
    --                     obj_char_LP["x"] = mid+distance/2
    --                     obj_char_RP["x"] = mid-distance/2
    --                 end
    --             end,
    --             ["0111"] = function()
    --                 obj_char_RP["x"] = box_L[1]+distance
    --             end,
    --             ["1101"] = function()
    --                 obj_char_LP["x"] = box_R[1]+distance
    --             end,
    --             ["0101"] = function()
    --                 if obj_char_LP["wallhurt_wallstick_on_side"] ~= 0 then
    --                     obj_char_RP["x"] = box_L[1]+distance
    --                     return
    --                 end
    --                 if obj_char_RP["wallhurt_wallstick_on_side"] ~= 0 then
    --                     obj_char_LP["x"] = box_R[1]+distance
    --                     return
    --                 end

    --                 if COLLSION_CONER_OUT_STATE[obj_char_LP["state"]] then
    --                     obj_char_RP["x"] = box_L[1]+distance
    --                     return
    --                 end
    --                 if COLLSION_CONER_OUT_STATE[obj_char_RP["state"]] then
    --                     obj_char_LP["x"] = box_R[1]+distance
    --                     return
    --                 end

    --                 if obj_char_LP["y"] < obj_char_RP["y"] then
    --                     obj_char_LP["x"] = box_R[1]+distance
    --                     return
    --                 else
    --                     obj_char_RP["x"] = box_L[1]+distance
    --                     return
    --                 end
    --             end,
    --             ["1011"] = function()
    --                 obj_char_RP["x"] = box_L[1]-distance
    --             end,
    --             ["1110"] = function()
    --                 obj_char_LP["x"] = box_R[1]-distance
    --             end,
    --             ["1010"] = function()
    --                 if obj_char_LP["wallhurt_wallstick_on_side"] ~= 0 then
    --                     obj_char_RP["x"] = box_L[1]-distance
    --                     return
    --                 end
    --                 if obj_char_RP["wallhurt_wallstick_on_side"] ~= 0 then
    --                     obj_char_LP["x"] = box_R[1]-distance
    --                     return
    --                 end

    --                 if COLLSION_CONER_OUT_STATE[obj_char_LP["state"]] then
    --                     obj_char_RP["x"] = box_L[1]-distance
    --                     return
    --                 end
    --                 if COLLSION_CONER_OUT_STATE[obj_char_RP["state"]] then
    --                     obj_char_LP["x"] = box_R[1]-distance
    --                     return
    --                 end

    --                 if obj_char_LP["y"] < obj_char_RP["y"] then
    --                     obj_char_LP["x"] = box_R[1]-distance
    --                     return
    --                 else
    --                     obj_char_RP["x"] = box_L[1]-distance
    --                     return
    --                 end

    --                 if obj_char_LP["y"] < obj_char_RP["y"] then
    --                     obj_char_LP["x"] = box_R[1]-distance
    --                     return
    --                 else
    --                     obj_char_RP["x"] = box_L[1]-distance
    --                     return
    --                 end
    --             end
    --         }
    --         local this_function = switch[collision_state]
    --         if this_function then this_function() end
    --     end
    -- end
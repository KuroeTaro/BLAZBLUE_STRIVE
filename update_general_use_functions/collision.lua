-- 所有pushbox hitbox hurtbox的长宽都必须是双数 要能被2整除 使得box的每个判定均匀的分布在最小单位
-- 所有pushbox 必须在对象的左右中央 下方锚点在0上
function collision_box_to_real_world_box(obj,box_name,box)
    if box_name == "pushbox" then
        local res = {
            obj[box_name][1]*obj[5] + obj["x"],
            obj[box_name][2]*obj[6] + obj["y"],
            obj[box_name][3],
            obj[box_name][4]
        }
        return res
    else
        local res = {
            box[1]*obj[5] + obj["x"],
            box[2]*obj[6] + obj["y"],
            box[3],
            box[4]
        }
        return res
    end
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

function test_char_on_ground(obj)
    local box = collision_box_to_real_world_box(obj,"pushbox")
    local stage_B_collision = 365
    local box_B_collision = 0
    box_B_collision = box[2]+box[4]/2+obj["collision_test_ground_height_offset"]
    return box_B_collision >= stage_B_collision
end
function test_cS_distance_check(obj_char,max_distance)
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    local hurtbox = {}
    local hurtbox_front_x = 0
    local hurtbox_edge_x = 0
    for i=1,#obj_char_other_side["hurtbox_table"] do
        hurtbox = obj_char_other_side["hurtbox_table"][i]
        hurtbox_front_x = hurtbox[1] * obj_char_other_side[5] + obj_char_other_side["x"]
        -- hurtbox_front_x 是hurtbox中心，加减width/2得到前后边界
        hurtbox_edge_x = hurtbox_front_x + (hurtbox[3]/2) * obj_char_other_side[5]
        if math.abs(hurtbox_edge_x - obj_char["x"]) < max_distance then
            return true
        end
    end
    return false
end
function pushbox_relocate_y(obj)
    local box = collision_box_to_real_world_box(obj,"pushbox")
    local stage_B_collision = 365
    local box_B_collision = 0
    box_B_collision = box[2]+box[4]/2
    obj["y"] = math.min(box_B_collision,stage_B_collision)
end
function pushbox_stage_relocate_x(obj)
    local box = collision_box_to_real_world_box(obj,"pushbox")
    local left_stage_collision = -1600.0
    local right_stage_collision = 1600.0
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
function pushbox_state_relocate_in_character_x(obj_char_LP,obj_char_RP,mid_anchor)
    local box_L = collision_box_to_real_world_box(obj_char_LP,"pushbox")
    local box_R = collision_box_to_real_world_box(obj_char_RP,"pushbox")
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
function pushbox_dynamic_normal_aabb_relocate_x(obj_char_LP,obj_char_RP)
    local box_L = collision_box_to_real_world_box(obj_char_LP,"pushbox")
    local box_R = collision_box_to_real_world_box(obj_char_RP,"pushbox")
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
        if collision_state == "1111" then
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

        elseif collision_state == "0111" then
            obj_char_RP["x"] = box_L[1]+box_L[3]/2+box_R[3]/2
        elseif collision_state == "1101" then
            obj_char_LP["x"] = box_R[1]+box_R[3]/2+box_L[3]/2
        elseif collision_state == "0101" then
            if obj_char_LP[5] == -1 then
                obj_char_LP["x"] = box_R[1]+box_R[3]/2+box_L[3]/2
            elseif obj_char_LP[5] == 1 then
                obj_char_RP["x"] = box_L[1]+box_L[3]/2+box_R[3]/2
            end
        elseif collision_state == "1011" then
            obj_char_RP["x"] = box_L[1]-box_L[3]/2-box_R[3]/2

        elseif collision_state == "1110" then
            obj_char_LP["x"] = box_R[1]-box_R[3]/2-box_L[3]/2

        elseif collision_state == "1010" then
            if obj_char_LP[5] == 1 then
                obj_char_LP["x"] = box_R[1]-box_R[3]/2-box_L[3]/2
            elseif obj_char_LP[5] == -1 then
                obj_char_RP["x"] = box_L[1]-box_L[3]/2-box_R[3]/2
            end
        end
    end
end

function strike_hurtbox_test(hit_obj,hurt_obj)
    if hit_obj["hit_type_state"] ~= "strike" or hurt_obj["strike_inv"] == true or hit_obj["strike_active"] == false then
        return false
    end
    for i=1,#hit_obj["hitbox_table"] do
        local current_hitbox = collision_box_to_real_world_box(hit_obj,"hitbox",hit_obj["hitbox_table"][i])
        for j=1,#hurt_obj["hurtbox_table"] do
            local current_hurtbox = collision_box_to_real_world_box(hurt_obj,"hurtbox",hurt_obj["hurtbox_table"][j])
            if collision_box_aabb_detection(current_hitbox,current_hurtbox) then
                return true
            end
        end
    end
    return false
end
function throw_hurtbox_test(hit_obj,hurt_obj)
    if hit_obj["hit_type_state"] ~= "throw" 
    or hurt_obj["throw_inv"] == true 
    or hit_obj["throw_active"] == false 
    or throw_air_or_not_test(hit_obj,hurt_obj)
    or math.abs(hit_obj["x"]-hurt_obj["x"]) > hit_obj["default_throw_distance"] then
        return false
    end
    for i=1,#hit_obj["hitbox_table"] do
        local current_hitbox = collision_box_to_real_world_box(hit_obj,"hitbox",hit_obj["hitbox_table"][i])
        for j=1,#hurt_obj["hurtbox_table"] do
            local current_hurtbox = collision_box_to_real_world_box(hurt_obj,"hurtbox",hurt_obj["hurtbox_table"][j])
            if collision_box_aabb_detection(current_hitbox,current_hurtbox) then
                return true
            end
        end
    end
    return false
end
function throw_air_or_not_test(hit_obj,hurt_obj)
    if hit_obj["height_state"] == "air" and hurt_obj["height_state"] ~= "air" then
        return true
    elseif hurt_obj["height_state"] == "air" and hit_obj["height_state"] ~= "air" then
        return true
    else
        return false
    end
end
function projectile_hurtbox_test(hit_obj,hurt_obj)
end
function strike_hitbox_clash_test()
end

function trestcS_distance_check

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
    --             time_enter = math.max(time_enter, overlap_start)
    --             time_exit = math.min(time_exit, overlap_end)
    --         else
    --             time_enter = math.max(time_enter, overlap_end)
    --             time_exit = math.min(time_exit, overlap_start)
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
    --             time_enter = math.max(time_enter, overlap_start)
    --             time_exit = math.min(time_exit, overlap_end)
    --         else
    --             time_enter = math.max(time_enter, overlap_end)
    --             time_exit = math.min(time_exit, overlap_start)
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
    --     local t = math.max(time_enter, 0)
    --     obj_A["x"] = round(obj_A["x"] + velocity_A * t)
    --     obj_B["x"] = obj_A["x"] + box_A_end[3]/2 + box_B_end[3]/2
    --     local res_velocity = (obj_A["velocity"][1] + obj_B["velocity"][1])/2
    --     obj_A["velocity"][1] = res_velocity
    --     obj_B["velocity"][1] = res_velocity

    -- end
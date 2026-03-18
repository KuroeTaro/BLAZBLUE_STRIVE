-- frame_animator的示例
-- obj = {175,125,nil,0,1,1,0,0}
-- obj["width"] = 1248
-- obj["height"] = 648
-- obj["LCT"] = {0,0,0,0,0,0,0,0}
-- obj["LCD"] = {0,0,0,0,0,0,0,0}

-- anim = {}
---- anim[0] = 42 初始化当前值为特定值
---- anim[0] = nil 保持当前值不变
----               不写anim[0] = nil 也可以保持初始值不变
-- anim[1] = 1280
-- anim[3] = 1305
-- anim["prop"] = 1
-- anim["length"] = 3
-- anim["loop"] = false

-- 声明的时候需要先init_point_linear_anim_with
-- 确保动画机在声明时第0帧已经被运行(一般为保持当前值不变，初始化当前值)
-- 此时LCT对应的数是1 这只能说明第1帧是下一个要被运行的帧数 并没有被实际运行
-- 如果LCT = anim_length + 1 则说明动画的最后一帧已经被执行完成 可以以此为依据跳出当前代码块或者状态机状态
-- 和frame_animator一样 
-- 

-- function frame_animator(obj,anim)
--     local prop = anim["prop"]
--     local FCT = obj["FCT"][prop]
--     local anim_length = anim["length"]
--     if anim[FCT] then 
--         obj[prop] = anim[FCT]
--     end    
    
--     if FCT <= anim_length then
--         obj["FCT"][prop] = FCT + 1
--     end

--     if anim["loop"] and obj["FCT"][prop] > anim_length  then
--         obj["FCT"][prop] = 0
--     end
-- end

function frame_animator(obj,anim)
    local anim_change_prop = anim["prop"]
    local anim_length = anim["length"]
    local anim_loop = anim["loop"]
    local current_value = obj[anim_change_prop]
    local current_time = obj["FCT"][anim_change_prop]

    if current_time <= anim_length then
        current_time = current_time + 1
    end
    if anim_loop and current_time > anim_length  then
        current_time = -1
    end

    local key_frame_bool = anim[current_time]

    if key_frame_bool then 
        current_value = key_frame_bool
    end    

    obj[anim_change_prop] = current_value
    obj["FCT"][anim_change_prop] = current_time

end
function init_frame_anim_with(obj,anim)
    obj["FCT"][anim["prop"]] = -1 
    frame_animator(obj,anim)
end
function init_frame_anim_with_out(obj,anim)
    obj["FCT"][anim["prop"]] = -1 
end
function get_frame_anim_end_state(obj,anim)
    if obj["FCT"][anim["prop"]] >= anim["length"] then
        return true
    else
        return false
    end
end


-- point_linear_animator的示例
-- obj = {175,125,nil,0,1,1,0,0}
-- obj["width"] = 1248
-- obj["height"] = 648
-- obj["LCT"] = {0,0,0,0,0,0,0,0}
-- obj["LCD"] = {0,0,0,0,0,0,0,0}

-- anim = {}
-- anim[0] = {0,5}
-- anim[5] = {1,12}
-- anim[12] = {-9,12}
-- anim["prop"] = 4
-- anim["length"] = 12
-- anim["loop"] = false
-- anim[x][1]表示当前点位置  anim[x][2]表示下一个点所在时间

-- 和其他动画机一样 声明的时候需要先init_point_linear_anim_with
-- 确保动画机在声明时第0帧已经被运行
-- 此时LCT对应的数是1 这只能说明第1帧是下一个要被运行的帧数 并没有被实际运行
-- 如果LCT = anim_length + 1 则说明动画的最后一帧已经被执行完成 可以以此为依据跳出当前代码块或者状态机状态
-- 和frame_animator一样 
-- 

-- 音频object 使用 不透明度作为音量

function point_linear_animator(obj,anim)
    local anim_change_prop = anim["prop"]
    local anim_length = anim["length"]
    local anim_loop = anim["loop"]
    local current_value = obj[anim_change_prop]
    local current_time = obj["LCT"][anim_change_prop]
    local current_delta = obj["LCD"][anim_change_prop]

    if current_time <= anim_length then
        current_value =  current_value + current_delta
		current_time = current_time + 1
    end

    if current_time > anim_length and anim_loop then
        current_time = -1
    end

    local key_frame_bool = anim[current_time]

    if key_frame_bool ~= nil then 
        local next_frame_time = key_frame_bool[2]
        local next_frame_value = anim[next_frame_time][1]
        local current_frame_time = current_time
        local current_frame_value = anim[current_frame_time][1]
        local delta_time = next_frame_time - current_frame_time
        local delta_value = next_frame_value - current_frame_value
        if next_frame_time - current_frame_time ~= 0 then
            current_delta = delta_value/delta_time
        else
            current_delta = 0
        end
    end

    if  key_frame_bool ~= nil and anim["fix_type"] then 
        current_value = key_frame_bool[1]
    end

    obj[anim_change_prop] = current_value
    obj["LCT"][anim_change_prop] = current_time
    obj["LCD"][anim_change_prop] = current_delta
end
function init_point_linear_anim_with(obj,anim)
    obj["LCT"][anim["prop"]] = -1
    obj["LCD"][anim["prop"]] = 0
    point_linear_animator(obj,anim)
end
function init_point_linear_anim_with_out(obj,anim)
    obj["LCT"][anim["prop"]] = -1 
    obj["LCD"][anim["prop"]] = 0
end
function get_point_linear_anim_end_state(obj,anim)
    if obj["LCT"][anim["prop"]] >= anim["length"] then
        return true
    else
        return false
    end
end

function init_character_anim_with(obj,anim)
    obj[anim["prop_f"]] = -1
    character_animator(obj,anim)
end
function init_character_anim_without(obj,anim)
    obj[anim["prop_f"]] = -1
end
function character_animator(obj,anim)
    obj[anim["prop_f"]] = obj[anim["prop_f"]] + 1
    local key_frame_funciton = anim[obj[anim["prop_f"]]]
    if key_frame_funciton then 
        key_frame_funciton()
    end
end
function get_character_anim_end_state(obj_char,prop_f,prop_anim_length)
    return obj_char[prop_f] >= obj_char[prop_anim_length] 
end
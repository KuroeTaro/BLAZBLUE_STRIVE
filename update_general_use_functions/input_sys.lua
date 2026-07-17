function init_input()
    INPUT_SYS_CURRENT_COMMAND = {}
    INPUT_SYS_CURRENT_COMMAND_STATE = {}
    INPUT_SYS_CURRENT_COMMAND["L"] = {}
    INPUT_SYS_CURRENT_COMMAND_STATE["L"] = {}
    INPUT_SYS_CURRENT_COMMAND["R"] = {}
    INPUT_SYS_CURRENT_COMMAND_STATE["R"] = {}
    INPUT_SYS_CURRENT_CONTROLLER = {}
    -- string:keyboard ("keyboard",nil) 
    -- joystick:joystick ("joystick",joystick) 
    -- table:network ("network",table)
    INPUT_SYS_CURRENT_CONTROLLER["L"] = {nil,nil} 
    INPUT_SYS_CURRENT_CONTROLLER["R"] = {nil,nil}
    INPUT_SYS_JOYSTICK_STATE = {0,0,0,0}
    INPUT_SYS_CURRENT_JOYSTICK_TABLE = love.joystick.getJoysticks()
    INPUT_SYS_LAST_JOYSTICK_ID = {}
    INPUT_SYS_LAST_JOYSTICK_ID["L"] = nil
    INPUT_SYS_LAST_JOYSTICK_ID["R"] = nil
    --加载手柄按键 键盘按键 手柄z轴 对于指令的表
    -- SP + 1/4/7 = 拉盾
    -- SP + 3/6/9 + P = SPM1
    -- SP + 2/5/8 + P = SPM2
    -- SP + 3/6/9 + K = SPM3
    -- SP + 2/5/8 + K = SPM4
    -- SP + 3/6/9 + S = SPM5
    -- SP + 2/5/8 + S = SPM6
    -- SP + 3/6/9 + H = SPM7
    -- SP + 2/5/8 + H = SPM8
    -- SP + 3/6/9 + Launcher = 26D
    -- SP + 2/5/8 + Launcher = 24D
    INPUT_SYS_COMMAND_TABLE = {
        "up","down","left","right",
        "P","S","H","K",
        "SP","Launcher","back","start",
        "RC","dash","burst","UA",
        "correction_up","correction_down",
        "correction_left","correction_right"
    }
    INPUT_SYS_BUTTON_TABLE = {
        "dpup","dpdown","dpleft","dpright",
        "x","y","b","a",
        "leftshoulder","rightshoulder","back","start"
    }
    INPUT_SYS_AXIS_TABLE = {"triggerleft","triggerright","leftx","lefty","rightx","righty"}
    INPUT_SYS_STICK_TABLE = {"leftstick","rightstick"}
    INPUT_SYS_KEY_TABLE = {
        "w","s","a","d",
        "j","i","l","k",
        "lshift","o","escape","return",
        "u","h","r","space",
        "t","g","b","n"
    }
    for i=1,20 do
        INPUT_SYS_CURRENT_COMMAND_STATE["L"][INPUT_SYS_COMMAND_TABLE[i]] = "Released"
        INPUT_SYS_CURRENT_COMMAND_STATE["R"][INPUT_SYS_COMMAND_TABLE[i]] = "Released"
    end
    --初始化现指令数组
    for i = 1,20 do
        INPUT_SYS_CURRENT_COMMAND["L"][INPUT_SYS_COMMAND_TABLE[i]] = 0
        INPUT_SYS_CURRENT_COMMAND["R"][INPUT_SYS_COMMAND_TABLE[i]] = 0
    end
end
function update_input()
    --加载手柄
    update_controller()
    --获得所有指令的现在布尔值和上一帧布尔值
    --并且赋值到INPUT_SYS_CURRENT_COMMAND和perCommand
    get_input_sys_current_command(
        INPUT_SYS_CURRENT_COMMAND["L"],
        INPUT_SYS_CURRENT_CONTROLLER["L"]
    )
    get_input_sys_current_command(
        INPUT_SYS_CURRENT_COMMAND["R"],
        INPUT_SYS_CURRENT_CONTROLLER["R"]
    )
    --输入状态机
    state_machine_input(INPUT_SYS_CURRENT_COMMAND_STATE["L"],INPUT_SYS_CURRENT_COMMAND["L"])
    state_machine_input(INPUT_SYS_CURRENT_COMMAND_STATE["R"],INPUT_SYS_CURRENT_COMMAND["R"])
end
--将手柄按键的值转化为指令表内的数值
function get_joystick_buttom_command(js,button_name)
    local result = nil
    if js ~= nil then
        result = js:isGamepadDown(button_name)
    else result = false end 
    return result 
end 
--将手柄扳机的值转化为指令表内的数值
function get_joystick_axis_command(js,axis_name)
    local result = nil
    if js ~= nil then 
        result = js:getGamepadAxis(axis_name)
    else result = 0.0 end
    return result
end 
function get_joystick_id(js)
    if js == nil then return nil end
    if js.getID then
        local ok, id = pcall(function() return js:getID() end)
        if ok and id ~= nil then return id end
    end
    return nil
end
function update_try_keyboard_assign(side)
    if (get_input_sys_anykey_keyboard() or INPUT_SYS_CURRENT_JOYSTICK_TABLE[1] == nil)then
        INPUT_SYS_CURRENT_CONTROLLER[side] = {"keyboard",nil}
    end
end
function update_try_keyboard_reassign(side,reassigned_controller)
    if (get_input_sys_anykey_keyboard() or INPUT_SYS_CURRENT_JOYSTICK_TABLE[1] == nil)
    and reassigned_controller[1] ~= "keyboard"
    then
        INPUT_SYS_CURRENT_CONTROLLER[side] = {"keyboard",nil}
    end
end
function update_try_joystick_assign_iterate(side)
    -- 检测手柄的按钮 如果有手柄按键按下则设定手柄为本侧控制器
    for i=1,#INPUT_SYS_CURRENT_JOYSTICK_TABLE,1 do
        if get_input_sys_anykey_joystick(INPUT_SYS_CURRENT_JOYSTICK_TABLE[i]) then
            INPUT_SYS_CURRENT_CONTROLLER[side] = {"joystick",INPUT_SYS_CURRENT_JOYSTICK_TABLE[i]}
            INPUT_SYS_LAST_JOYSTICK_ID[side] = get_joystick_id(INPUT_SYS_CURRENT_JOYSTICK_TABLE[i])
            break
        end
    end
end
function update_try_joystick_reassign_iterate(side,reassigned_controller_id)
    -- 检测手柄的按钮 如果有手柄按键按下则设定手柄为本侧控制器
    for i=1,#INPUT_SYS_CURRENT_JOYSTICK_TABLE,1 do
        local current_controller_id = get_joystick_id(INPUT_SYS_CURRENT_JOYSTICK_TABLE[i])
        if get_input_sys_anykey_joystick(INPUT_SYS_CURRENT_JOYSTICK_TABLE[i]) and current_controller_id ~= reassigned_controller_id then
            INPUT_SYS_CURRENT_CONTROLLER[side] = {"joystick",INPUT_SYS_CURRENT_JOYSTICK_TABLE[i]}
            INPUT_SYS_LAST_JOYSTICK_ID[side] = current_controller_id
            return
        end
    end
end
function update_try_joystick_reconnect_iterate(side)
    local current_contoller = INPUT_SYS_CURRENT_CONTROLLER[side]
    local last_controller_ID = INPUT_SYS_LAST_JOYSTICK_ID[side]
    if (last_controller_ID and current_contoller[1] ~= "joystick") == false then
        return
    end
    for i=1,#INPUT_SYS_CURRENT_JOYSTICK_TABLE,1 do
        if get_joystick_id(INPUT_SYS_CURRENT_JOYSTICK_TABLE[i]) == last_controller_ID then
            INPUT_SYS_CURRENT_CONTROLLER[side] = {
                "joystick", INPUT_SYS_CURRENT_JOYSTICK_TABLE[i]
            }
            return
        end
    end
end
function update_try_joystick_reconnect_offline()
    update_try_joystick_reconnect_iterate("L")
    update_try_joystick_reconnect_iterate("R")
end
function update_try_joystick_reconnect_online()
    update_try_joystick_reconnect_iterate(NETWORK_MATCH_SIDE)
end
--加载手柄
function update_controller()
    INPUT_SYS_CURRENT_JOYSTICK_TABLE = love.joystick.getJoysticks()
    if GAME_MODE == 2 then
        -- 如果掉线 尝试控制器重连
        update_try_joystick_reconnect_online()
        INPUT_SYS_CURRENT_CONTROLLER[NETWORK_OTHER_SIDE] = {"network",ROLLBACK_INPUT_TABLE}
        -- 检测键盘的按键 如果有键盘按键按下则设定键盘为本侧控制器
        update_try_keyboard_assign(NETWORK_MATCH_SIDE)
        -- 检查手柄的按键 如果有手柄按键按下则设定手柄为本侧控制器
        update_try_joystick_assign_iterate(NETWORK_MATCH_SIDE)
    else
        -- 如果掉线 尝试控制器重连
        update_try_joystick_reconnect_offline()
        local L_controller = INPUT_SYS_CURRENT_CONTROLLER["L"]
        local R_controller = INPUT_SYS_CURRENT_CONTROLLER["R"]
        local reassigned_controller_id = get_joystick_id(R_controller[2])
        if L_controller[1] == nil then
            -- 检测键盘的按键 如果有键盘按键按下则设定键盘为本侧控制器
            update_try_keyboard_reassign("L",R_controller)
            -- 检测手柄的按钮 如果有手柄按键按下则设定手柄为本侧控制器
            update_try_joystick_reassign_iterate("L",reassigned_controller_id)
        elseif L_controller[1] == "joystick" and L_controller[2]:isConnected() == false then
            L_controller[1] = nil
            L_controller[2] = nil
            -- 检测键盘的按键 如果有键盘按键按下则设定键盘为本侧控制器
            update_try_keyboard_reassign("L",R_controller)
            -- 检测手柄的按钮 如果有手柄按键按下则设定手柄为本侧控制器
            update_try_joystick_reassign_iterate("L",reassigned_controller_id)
        end
        L_controller = INPUT_SYS_CURRENT_CONTROLLER["L"]
        R_controller = INPUT_SYS_CURRENT_CONTROLLER["R"]
        local reassigned_controller_id = get_joystick_id(L_controller[2])
        if R_controller[1] == nil then
            update_try_keyboard_reassign("R",L_controller)
            -- 检测手柄的按钮 如果有手柄按键按下则设定手柄为本侧控制器
            update_try_joystick_reassign_iterate("R",reassigned_controller_id)
        elseif R_controller[1] == "joystick" and R_controller[2]:isConnected() == false then
            R_controller[1] = nil
            R_controller[2] = nil
            -- 检测键盘的按键 如果有键盘按键按下则设定键盘为本侧控制器
            update_try_keyboard_reassign("R",L_controller)
            -- 检测手柄的按钮 如果有手柄按键按下则设定手柄为本侧控制器
            update_try_joystick_reassign_iterate("R",reassigned_controller_id)
        end
    end
    -- legacy
    INPUT_SYS_JOYSTICK_STATE[2] = INPUT_SYS_JOYSTICK_STATE[0]
    INPUT_SYS_JOYSTICK_STATE[3] = INPUT_SYS_JOYSTICK_STATE[1]
    if INPUT_SYS_CURRENT_JOYSTICK_TABLE[1] == nil then 
        INPUT_SYS_JOYSTICK_STATE[0] = 0
    else 
        INPUT_SYS_JOYSTICK_STATE[0] = 1
    end 
    if INPUT_SYS_CURRENT_JOYSTICK_TABLE[2] == nil then 
        INPUT_SYS_JOYSTICK_STATE[1] = 0
    else 
        INPUT_SYS_JOYSTICK_STATE[1] = 1
    end 
end
--获得所有指令的现在布尔值和上一帧布尔值（键盘）
function get_input_sys_current_command(INPUT_SYS_CURRENT_COMMAND,INPUT_SYS_CURRENT_CONTROLLER)
    if INPUT_SYS_CURRENT_CONTROLLER[1] == "keyboard" then
        for i = 1,20 do
            if love.keyboard.isDown(INPUT_SYS_KEY_TABLE[i]) then
                INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[i]] = 1
            else INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[i]] = 0
            end
        end
    elseif INPUT_SYS_CURRENT_CONTROLLER[1] == "joystick" then
        for i = 1,12 do
            if get_joystick_buttom_command(INPUT_SYS_CURRENT_CONTROLLER[2],INPUT_SYS_BUTTON_TABLE[i]) then
                INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[i]] = 1
            else INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[i]] = 0
            end
        end
        for i = 1,2 do
            if get_joystick_axis_command(INPUT_SYS_CURRENT_CONTROLLER[2],INPUT_SYS_AXIS_TABLE[i]) > 0.2 then
                INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[i+12]] = 1
            else INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[i+12]] = 0
            end
        end
        -- 使用左摇杆
            -- 不使用可删除
        if get_joystick_axis_command(INPUT_SYS_CURRENT_CONTROLLER[2],INPUT_SYS_AXIS_TABLE[3]) > 0.5 then
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[4]] = 1
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[3]] = 0
        elseif get_joystick_axis_command(INPUT_SYS_CURRENT_CONTROLLER[2],INPUT_SYS_AXIS_TABLE[3]) < -0.5 then
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[3]] = 1
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[4]] = 0
        end
        if get_joystick_axis_command(INPUT_SYS_CURRENT_CONTROLLER[2],INPUT_SYS_AXIS_TABLE[4]) > 0.5 then
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[2]] = 1
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[1]] = 0
        elseif get_joystick_axis_command(INPUT_SYS_CURRENT_CONTROLLER[2],INPUT_SYS_AXIS_TABLE[4]) < -0.5 then
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[1]] = 1
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[2]] = 0
        end
        -- 使用右摇杆特殊输入
        if get_joystick_axis_command(INPUT_SYS_CURRENT_CONTROLLER[2],INPUT_SYS_AXIS_TABLE[5]) > 0.5 then
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[20]] = 1
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[19]] = 0
        elseif get_joystick_axis_command(INPUT_SYS_CURRENT_CONTROLLER[2],INPUT_SYS_AXIS_TABLE[5]) < -0.5 then
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[19]] = 1
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[20]] = 0
        else
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[19]] = 0
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[20]] = 0
        end
        if get_joystick_axis_command(INPUT_SYS_CURRENT_CONTROLLER[2],INPUT_SYS_AXIS_TABLE[6]) > 0.5 then
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[18]] = 1
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[17]] = 0
        elseif get_joystick_axis_command(INPUT_SYS_CURRENT_CONTROLLER[2],INPUT_SYS_AXIS_TABLE[6]) < -0.5 then
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[17]] = 1
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[18]] = 0
        else
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[17]] = 0
            INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[18]] = 0
        end
        for i = 1,2 do
            if get_joystick_buttom_command(INPUT_SYS_CURRENT_CONTROLLER[2],INPUT_SYS_STICK_TABLE[i]) then
                INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[i+14]] = 1
            else INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[i+14]] = 0
            end
        end
    elseif INPUT_SYS_CURRENT_CONTROLLER[1] == "network" then
        -- rollback netcode predict part gose
    end
end
--输入状态机
function state_machine_input(INPUT_SYS_CURRENT_COMMAND_STATE,INPUT_SYS_CURRENT_COMMAND)
    for i=1,20 do
        local switch = 
        {
            ["Released"] = function()
                if INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[i]] == 1 then 
                    INPUT_SYS_CURRENT_COMMAND_STATE[INPUT_SYS_COMMAND_TABLE[i]] = "Pressing"
                end
            end,
            ["Releasing"] = function()
                if INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[i]] == 1 then 
                    INPUT_SYS_CURRENT_COMMAND_STATE[INPUT_SYS_COMMAND_TABLE[i]] = "Pressing"
                else
                    INPUT_SYS_CURRENT_COMMAND_STATE[INPUT_SYS_COMMAND_TABLE[i]] = "Released"
                end
            end,
            ["Pressing"] = function()
                if INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[i]] == 1 then 
                    INPUT_SYS_CURRENT_COMMAND_STATE[INPUT_SYS_COMMAND_TABLE[i]] = "Holding"
                else
                    INPUT_SYS_CURRENT_COMMAND_STATE[INPUT_SYS_COMMAND_TABLE[i]] = "Releasing"
                end
            end,
            ["Holding"] = function()
                if INPUT_SYS_CURRENT_COMMAND[INPUT_SYS_COMMAND_TABLE[i]] == 0 then 
                    INPUT_SYS_CURRENT_COMMAND_STATE[INPUT_SYS_COMMAND_TABLE[i]] = "Releasing"
                end
            end
        }
        local this_function = switch[INPUT_SYS_CURRENT_COMMAND_STATE[INPUT_SYS_COMMAND_TABLE[i]]]
        if this_function then this_function() end
    end
end
-- 加载后input_sys_cahce重新缓存
function load_input_sys_cache_manual_release(input,obj_char,button_name)
    input[button_name] = "Released"
end
function load_input_sys_cache_recache(input,obj_char)
    for i=1,20 do
        if input[INPUT_SYS_COMMAND_TABLE[i]] == "Pressing" then
            obj_char["input_sys_cache"][INPUT_SYS_COMMAND_TABLE[i]] = true
        end
    end
end
function load_input_sys_cache_negative_edge_recache(input,obj_char)
    for i=1,20 do
        if input[INPUT_SYS_COMMAND_TABLE[i]] == "Pressing" then
            obj_char["input_sys_cache_negative_edge"][INPUT_SYS_COMMAND_TABLE[i]] = true
        end
    end
end
-- 绘制input_sys
function draw_input_sys(x_offset,y_offset)
    for i,v in ipairs(INPUT_SYS_COMMAND_TABLE) do
        love.graphics.print(v,0+x_offset,i*15-15+y_offset)
        love.graphics.print(INPUT_SYS_CURRENT_COMMAND_STATE["L"][v],100+x_offset,i*15-15+y_offset)
        love.graphics.print(INPUT_SYS_CURRENT_COMMAND_STATE["R"][v],160+x_offset,i*15-15+y_offset)
    end 
end
-- 获得input
function get_input_sys_anykey_keyboard()
    for i = 1,20 do
        if love.keyboard.isDown(INPUT_SYS_KEY_TABLE[i]) then
            return true
        end
    end
    return false
end
function get_input_sys_anykey_joystick(joystick)
    for i = 1,12 do
        if get_joystick_buttom_command(joystick,INPUT_SYS_BUTTON_TABLE[i]) then
            return true
        end
    end
    for i = 1,2 do
        if get_joystick_axis_command(joystick,INPUT_SYS_AXIS_TABLE[i]) > 0.2 then
            return true
        end
    end
    for i = 3,6 do
        if get_joystick_axis_command(joystick,INPUT_SYS_AXIS_TABLE[i]) > 0.5 
        or get_joystick_axis_command(joystick,INPUT_SYS_AXIS_TABLE[i]) < -0.5 then
            return true
        end
    end
    for i = 1,2 do
        if get_joystick_buttom_command(joystick[2],INPUT_SYS_STICK_TABLE[i]) then
            return true
        end
    end
    return false
end
function test_input_sys_press_or_hold(input)
    if input == "Pressing" or input == "Holding" then
        return true
    else
        return false
    end
end
function test_input_sys_press(input)
    if input == "Pressing" then
        return true
    else
        return false
    end
end
function test_input_sys_hold(input)
    if input == "Holding" then
        return true
    else
        return false
    end
end
function test_input_sys_release(input)
    if input == "Releasing" then
        return true
    else
        return false
    end
end

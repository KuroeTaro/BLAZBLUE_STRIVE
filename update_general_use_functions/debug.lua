function set_pause()
    local switch = 
    {
        ["Released"] = function()
            if love.keyboard.isDown("f1") or test_input_sys_press(INPUT_SYS_CURRENT_COMMAND_STATE["L"]["back"]) then
                if DEBUG_PAUSE == false then
                    DEBUG_PAUSE = true
                elseif DEBUG_PAUSE == true then
                    DEBUG_PAUSE = false
                end
                DEBUG_PAUSE_STATE = "Pressing"
            end
        end,
        ["Releasing"] = function()
            if love.keyboard.isDown("f1") or test_input_sys_press(INPUT_SYS_CURRENT_COMMAND_STATE["L"]["back"]) then
                DEBUG_PAUSE_STATE = "Pressing"
            else
                DEBUG_PAUSE_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if love.keyboard.isDown("f1") or test_input_sys_press(INPUT_SYS_CURRENT_COMMAND_STATE["L"]["back"]) then
                DEBUG_PAUSE_STATE = "Holding"
            else
                DEBUG_PAUSE_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if (not love.keyboard.isDown("f1")) or (not test_input_sys_press(INPUT_SYS_CURRENT_COMMAND_STATE["L"]["back"])) then
                DEBUG_PAUSE_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_PAUSE_STATE]
    if this_function then this_function() end
end
function set_jump_breakpoint()
    local switch = 
    {
        ["Jumping"] = function()
            DEBUG_PAUSE = true
            DEBUG_JUMPING_BREAKPOINT_STATE = "Holding"
        end,
        ["Stop"] = function()
            if love.keyboard.isDown("f12") and DEBUG_PAUSE then
                DEBUG_PAUSE = false
                DEBUG_JUMPING_BREAKPOINT_STATE = "Jumping"
            end
        end,
        ["Holding"] = function()
            if (not love.keyboard.isDown("f12")) then
                DEBUG_JUMPING_BREAKPOINT_STATE = "Stop"
            end
        end
    }
    local this_function = switch[DEBUG_JUMPING_BREAKPOINT_STATE]
    if this_function then this_function() end
end
function set_show_hitbox()
    local switch = 
    {
        ["Released"] = function()
            if love.keyboard.isDown("f2") then 
                DEBUG_HITBOX_SHOWS_STATE = "Pressing"
                if DEBUG_HITBOX_SHOWS == false then 
                    DEBUG_HITBOX_SHOWS = true
                elseif DEBUG_HITBOX_SHOWS == true then 
                    DEBUG_HITBOX_SHOWS = false
                end
            end
        end,
        ["Releasing"] = function()
            if love.keyboard.isDown("f2") then 
                DEBUG_HITBOX_SHOWS_STATE = "Pressing"
            else
                DEBUG_HITBOX_SHOWS_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if love.keyboard.isDown("f2") then 
                DEBUG_HITBOX_SHOWS_STATE = "Holding"
            else
                DEBUG_HITBOX_SHOWS_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if not love.keyboard.isDown("f2") then 
                DEBUG_HITBOX_SHOWS_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_HITBOX_SHOWS_STATE]
    if this_function then this_function() end
end
function set_show_info()
    local switch = 
    {
        ["Released"] = function()
            if love.keyboard.isDown("f3") then
                DEBUG_INFO_SHOWS_STATE = "Pressing"
                if DEBUG_INFO_SHOWS == false then
                    DEBUG_INFO_SHOWS = true
                elseif DEBUG_INFO_SHOWS == true then
                    DEBUG_INFO_SHOWS = false
                end
            end
        end,
        ["Releasing"] = function()
            if love.keyboard.isDown("f3") then
                DEBUG_INFO_SHOWS_STATE = "Pressing"
            else
                DEBUG_INFO_SHOWS_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if love.keyboard.isDown("f3") then
                DEBUG_INFO_SHOWS_STATE = "Holding"
            else
                DEBUG_INFO_SHOWS_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if not love.keyboard.isDown("f3") then
                DEBUG_INFO_SHOWS_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_INFO_SHOWS_STATE]
    if this_function then this_function() end
end
function set_toggle()
    local switch = 
    {
        ["Released"] = function()
            if love.keyboard.isDown("0") then
                DEBUG_TRAINNING_TOGGLE_STATE = "Pressing"
                if DEBUG_TRAINNING_TOGGLE == false then
                    DEBUG_TRAINNING_TOGGLE = true
                elseif DEBUG_TRAINNING_TOGGLE == true then
                    DEBUG_TRAINNING_TOGGLE = false
                end
            end
        end,
        ["Releasing"] = function()
            if love.keyboard.isDown("0") then
                DEBUG_TRAINNING_TOGGLE_STATE = "Pressing"
            else
                DEBUG_TRAINNING_TOGGLE_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if love.keyboard.isDown("0") then
                DEBUG_TRAINNING_TOGGLE_STATE = "Holding"
            else
                DEBUG_TRAINNING_TOGGLE_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if not love.keyboard.isDown("0") then
                DEBUG_TRAINNING_TOGGLE_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_TRAINNING_TOGGLE_STATE]
    if this_function then this_function() end
end
function set_counter()
    local switch = 
    {
        ["Released"] = function()
            if love.keyboard.isDown("1") then
                DEBUG_TRAINNING_COUNTER_STATE = "Pressing"
                if DEBUG_TRAINNING_COUNTER == false then
                    DEBUG_TRAINNING_COUNTER = true
                elseif DEBUG_TRAINNING_COUNTER == true then
                    DEBUG_TRAINNING_COUNTER = false
                end
            end
        end,
        ["Releasing"] = function()
            if love.keyboard.isDown("1") then
                DEBUG_TRAINNING_COUNTER_STATE = "Pressing"
            else
                DEBUG_TRAINNING_COUNTER_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if love.keyboard.isDown("1") then
                DEBUG_TRAINNING_COUNTER_STATE = "Holding"
            else
                DEBUG_TRAINNING_COUNTER_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if not love.keyboard.isDown("1") then
                DEBUG_TRAINNING_COUNTER_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_TRAINNING_COUNTER_STATE]
    if this_function then this_function() end
end
function set_height()
    local switch = 
    {
        ["Released"] = function()
            if love.keyboard.isDown("2") then
                DEBUG_TRAINNING_HEIGHT_STATE = "Pressing"
                if DEBUG_TRAINNING_HEIGHT == 5 then
                    DEBUG_TRAINNING_HEIGHT = 8
                elseif DEBUG_TRAINNING_HEIGHT == 8 then
                    DEBUG_TRAINNING_HEIGHT = 2
                else
                    DEBUG_TRAINNING_HEIGHT = 5
                end
            end
        end,
        ["Releasing"] = function()
            if love.keyboard.isDown("2") then
                DEBUG_TRAINNING_HEIGHT_STATE = "Pressing"
            else
                DEBUG_TRAINNING_HEIGHT_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if love.keyboard.isDown("2") then
                DEBUG_TRAINNING_HEIGHT_STATE = "Holding"
            else
                DEBUG_TRAINNING_HEIGHT_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if not love.keyboard.isDown("2") then
                DEBUG_TRAINNING_HEIGHT_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_TRAINNING_HEIGHT_STATE]
    if this_function then this_function() end
end
function set_block()
    local switch = 
    {
        ["Released"] = function()
            if love.keyboard.isDown("3") then
                DEBUG_TRAINNING_BLOCK_STATE = "Pressing"
                if DEBUG_TRAINNING_BLOCK == 0 then
                    DEBUG_TRAINNING_BLOCK = 1
                elseif DEBUG_TRAINNING_BLOCK == 1 then
                    DEBUG_TRAINNING_BLOCK = 2
                else
                    DEBUG_TRAINNING_BLOCK = 0
                end
            end
        end,
        ["Releasing"] = function()
            if love.keyboard.isDown("3") then
                DEBUG_TRAINNING_BLOCK_STATE = "Pressing"
            else
                DEBUG_TRAINNING_BLOCK_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if love.keyboard.isDown("3") then
                DEBUG_TRAINNING_BLOCK_STATE = "Holding"
            else
                DEBUG_TRAINNING_BLOCK_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if not love.keyboard.isDown("3") then
                DEBUG_TRAINNING_BLOCK_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_TRAINNING_BLOCK_STATE]
    if this_function then this_function() end
end
function set_recovery()
    local switch = 
    {
        ["Released"] = function()
            if love.keyboard.isDown("4") then
                DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS_STATE = "Pressing"
                if DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS == 5 then
                    DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS = 8
                elseif DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS == 8 then
                    DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS = 6
                else
                    DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS = 5
                end
            end
        end,
        ["Releasing"] = function()
            if love.keyboard.isDown("4") then
                DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS_STATE = "Pressing"
            else
                DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if love.keyboard.isDown("4") then
                DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS_STATE = "Holding"
            else
                DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if not love.keyboard.isDown("4") then
                DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS_STATE]
    if this_function then this_function() end
end
function set_throw_clash()
    local switch = 
    {
        ["Released"] = function()
            if love.keyboard.isDown("5") then
                DEBUG_TRAINNING_THROW_CLASH_STATE = "Pressing"
                if DEBUG_TRAINNING_THROW_CLASH == false then
                    DEBUG_TRAINNING_THROW_CLASH = true
                elseif DEBUG_TRAINNING_THROW_CLASH == true then
                    DEBUG_TRAINNING_THROW_CLASH = false
                end
            end
        end,
        ["Releasing"] = function()
            if love.keyboard.isDown("5") then
                DEBUG_TRAINNING_THROW_CLASH_STATE = "Pressing"
            else
                DEBUG_TRAINNING_THROW_CLASH_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if love.keyboard.isDown("5") then
                DEBUG_TRAINNING_THROW_CLASH_STATE = "Holding"
            else
                DEBUG_TRAINNING_THROW_CLASH_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if not love.keyboard.isDown("5") then
                DEBUG_TRAINNING_THROW_CLASH_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_TRAINNING_THROW_CLASH_STATE]
    if this_function then this_function() end
end
function set_spawn_pos()
    local switch = 
    {
        ["Released"] = function()
            if test_input_sys_press(INPUT_SYS_CURRENT_COMMAND_STATE["L"]["start"]) then
                DEBUG_TRAINNING_SPAWN_STATE = "Pressing"
            end
        end,
        ["Releasing"] = function()
            if test_input_sys_press(INPUT_SYS_CURRENT_COMMAND_STATE["L"]["start"]) then
                DEBUG_TRAINNING_SPAWN_STATE = "Pressing"
            else
                DEBUG_TRAINNING_SPAWN_STATE = "Released"
            end
        end,
        ["Pressing"] = function()
            if test_input_sys_press(INPUT_SYS_CURRENT_COMMAND_STATE["L"]["start"]) then
                DEBUG_TRAINNING_SPAWN_STATE = "Holding"
            else
                DEBUG_TRAINNING_SPAWN_STATE = "Releasing"
            end
        end,
        ["Holding"] = function()
            if not test_input_sys_press(INPUT_SYS_CURRENT_COMMAND_STATE["L"]["start"]) then
                DEBUG_TRAINNING_SPAWN_STATE = "Releasing"
            end
        end
    }
    local this_function = switch[DEBUG_TRAINNING_SPAWN_STATE]
    if this_function then this_function() end
end





function update_character_frame_info(obj_char)
    -- none startup active recovery
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    if obj_char["move_state"] == "none" and obj_char_other_side["move_state"] ~= "none" then
        obj_char["frame_adv"] = obj_char["frame_adv"] + 1
        return
    end
    if obj_char["game_speed"] == 0 or obj_char_other_side["game_speed"] == 0 then
        return
    end

    -- obj_char["startup_frame"] = 0
    -- obj_char["active_frame"] = 0
    -- obj_char["recovery_frame"] = 0
    -- obj_char["frame_adv"] = 0
    if obj_char["move_state"] == "startup" then
        obj_char["startup_frame"] = obj_char["startup_frame"] + 1
    end
    if obj_char["move_state"] == "active" 
    and obj_char["state"] ~= "hitstop" 
    and obj_char["state"] ~= "hurtstop" 
    and obj_char["state"] ~= "blockstop" 
    then
        obj_char["active_frame"] = obj_char["active_frame"] + 1
    end
    if obj_char["move_state"] == "recovery" then
        obj_char["recovery_frame"] = obj_char["recovery_frame"] + 1
    end

    if obj_char["state"] == "hitstop" or obj_char["state"] == "hurtstop" or obj_char["state"] == "blockstop" then
        obj_char["last_hitstop_frame"] = obj_char["last_hitstop_frame"] + 1
    end
end



function draw_debug_info_all(x_offset,y_offset)
    draw_input_sys(x_offset,y_offset)
    love.graphics.print( "FRAMES_DRAWN",0+x_offset,315+y_offset)
    love.graphics.print( "GRAPHICIAL_FPS",0+x_offset,315+15*1+y_offset)
    love.graphics.print( "SCENE_TIMER",0+x_offset,315+15*2+y_offset)
    love.graphics.print( FRAMES_DRAWN,110+x_offset,315+y_offset)
    love.graphics.print( FPS,110+x_offset,315+15*1+y_offset)
    love.graphics.print( SCENE_TIMER,110+x_offset,315+15*2+y_offset)
    -- 获取统计信息
    local stats = love.graphics.getStats()
    -- 显示统计信息
    love.graphics.print("Draw Calls: " .. stats.drawcalls,250+x_offset,150+y_offset)
    love.graphics.print("Canvas Switches: " .. stats.canvasswitches,250+x_offset,30+y_offset)
    love.graphics.print("Texture Memory: " .. stats.texturememory / 1024 / 1024 .. " MB",250+x_offset,50+y_offset)
    -- love.graphics.print("Images Loaded: " .. stats.images,250+x_offset,70+y_offset)
    -- love.graphics.print("Global variables: " .. globalCount,250+x_offset,90+y_offset)

    -- 绘制角色帧数
    if obj_char_game_scene_char_LP and obj_char_game_scene_char_RP then
        love.graphics.print("LP_current_f : " .. obj_char_game_scene_char_LP["f"],0+x_offset,315+15*3+y_offset)
        love.graphics.print("LP_startup   : " .. obj_char_game_scene_char_LP["startup_frame"],0+x_offset,315+15*4+y_offset)
        love.graphics.print("LP_active    : " .. obj_char_game_scene_char_LP["active_frame"],0+x_offset,315+15*5+y_offset)
        love.graphics.print("LP_recovery  : " .. obj_char_game_scene_char_LP["recovery_frame"],0+x_offset,315+15*6+y_offset)
        love.graphics.print("LP_frame_adv : " .. obj_char_game_scene_char_LP["frame_adv"],0+x_offset,315+15*7+y_offset)
        love.graphics.print("LP_move_state: " .. obj_char_game_scene_char_LP["move_state"],0+x_offset,315+15*8+y_offset)
        love.graphics.print("LP_GS_ctd	  : " .. obj_char_game_scene_char_LP["game_speed_abnormal_realtime_countdown"],0+x_offset,315+15*9+y_offset)
        love.graphics.print("LP_GS		  : " .. obj_char_game_scene_char_LP["game_speed"],0+x_offset,315+15*10+y_offset)
        love.graphics.print("LP_GS_sub_f  : " .. obj_char_game_scene_char_LP["game_speed_subframe"],0+x_offset,315+15*11+y_offset)
        love.graphics.print("LP_last_hitstop_frame  : " .. obj_char_game_scene_char_LP["last_hitstop_frame"],0+x_offset,315+15*12+y_offset)
        love.graphics.print("LP_direction_input : " .. obj_char_game_scene_char_LP["direction_input"],0+x_offset,315+15*13+y_offset)
        love.graphics.print("RP_current_f : " .. obj_char_game_scene_char_RP["f"],300+x_offset,315+15*3+y_offset)
        love.graphics.print("RP_startup   : " .. obj_char_game_scene_char_RP["startup_frame"],300+x_offset,315+15*4+y_offset)
        love.graphics.print("RP_active    : " .. obj_char_game_scene_char_RP["active_frame"],300+x_offset,315+15*5+y_offset)
        love.graphics.print("RP_recovery  : " .. obj_char_game_scene_char_RP["recovery_frame"],300+x_offset,315+15*6+y_offset)
        love.graphics.print("RP_frame_adv : " .. obj_char_game_scene_char_RP["frame_adv"],300+x_offset,315+15*7+y_offset)
        love.graphics.print("RP_move_state: " .. obj_char_game_scene_char_RP["move_state"],300+x_offset,315+15*8+y_offset)
        love.graphics.print("RP_GS_ctd	  : " .. obj_char_game_scene_char_RP["game_speed_abnormal_realtime_countdown"],300+x_offset,315+15*9+y_offset)
        love.graphics.print("RP_GS		  : " .. obj_char_game_scene_char_RP["game_speed"],300+x_offset,315+15*10+y_offset)
        love.graphics.print("RP_GS_sub_f  : " .. obj_char_game_scene_char_RP["game_speed_subframe"],300+x_offset,315+15*11+y_offset)
        love.graphics.print("RP_last_hitstop_frame  : " .. obj_char_game_scene_char_RP["last_hitstop_frame"],300+x_offset,315+15*12+y_offset)
        love.graphics.print("RP_direction_input : " .. obj_char_game_scene_char_RP["direction_input"],300+x_offset,315+15*13+y_offset)
    end

    love.graphics.print("DEBUG_TRAINNING_COUNTER : " .. tostring(DEBUG_TRAINNING_COUNTER),250+x_offset,170+15*0+y_offset)
    love.graphics.print("DEBUG_TRAINNING_HEIGHT : " .. DEBUG_TRAINNING_HEIGHT,250+x_offset,170+15*1+y_offset)
    love.graphics.print("DEBUG_TRAINNING_BLOCK : " .. DEBUG_TRAINNING_BLOCK,250+x_offset,170+15*2+y_offset)
    love.graphics.print("DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS : " .. DEBUG_TRAINNING_WALLSTICK_SOFT_RECOVER_POS,250+x_offset,170+15*3+y_offset)
    love.graphics.print("DEBUG_TRAINNING_THROW_CLASH : " .. tostring(DEBUG_TRAINNING_THROW_CLASH),250+x_offset,170+15*4+y_offset)
    love.graphics.print("DEBUG_TRAINNING_SPAWN_POS : " .. DEBUG_TRAINNING_SPAWN_POS,250+x_offset,170+15*5+y_offset)
    love.graphics.print("DEBUG_TRAINNING_SPAWN_SIDE : " .. DEBUG_TRAINNING_SPAWN_SIDE,250+x_offset,170+15*6+y_offset)
end
-- common
function state_machine_UI_char_select_scene_movie_cover_loop(obj)
    local speed = 2
    obj["FCT"][8] = obj["FCT"][8] + 1
    if obj["FCT"][8] > speed then
        obj[8] = obj[8] + 1
        obj["FCT"][8] = 0
    end
    if obj[8] > 9 then
        obj[8] = 0
    end
end
function state_machine_UI_char_select_scene_start_0f_110f(obj)
    local speed = 0
    if obj[8] >= 110 then
        return
    end
    obj["FCT"][8] = obj["FCT"][8] + 1
    if obj["FCT"][8] > speed then
        obj[8] = obj[8] + 1
        obj["FCT"][8] = 0
    end
end
function state_machine_UI_char_select_scene_timer(obj)
    if obj["time"][1] == 0 and obj["time"][2] == 0 then
        return
    end
    obj["time"][3] = obj["time"][3]-1
    if obj["time"][3] == -1 then 
        obj["time"][2] = obj["time"][2]-1
        obj["time"][3] = 60
    end
    if obj["time"][2] == -1 then 
        obj["time"][1] = obj["time"][1]-1
        obj["time"][2] = 9
    end
    if obj["time"][1] == -1 then 
        obj["time"][1] = 0
    end
end
function state_machine_UI_char_select_scene_ring_blink(obj)
    obj[4] = 0.8+math.random(-1,1)*0.03
end

-- match
function state_machine_UI_char_select_scene_char_select(input_id)
    local obj = nil
    local obj_char = nil
    local obj_text = nil
    local obj_icon_cover = nil
    local obj_bar_mark = nil
    local obj_control_method = nil
    local ui_mapping = {
        ["L"] = {
            ["obj"]            = obj_UI_char_select_scene_char_select_left,
            ["char"]           = obj_UI_char_select_scene_char_select_char_left,
            ["text"]           = obj_UI_char_select_scene_char_select_text_left,
            ["icon_cover"]     = obj_UI_char_select_scene_icon_select_left,
            ["bar_mark"]       = obj_UI_char_select_scene_bar_mark_left,
            ["control_method"] = obj_UI_char_select_scene_control_method_left
        },
        ["R"] = { -- 假设非 L 即为 R
            ["obj"]            = obj_UI_char_select_scene_char_select_right,
            ["char"]           = obj_UI_char_select_scene_char_select_char_right,
            ["text"]           = obj_UI_char_select_scene_char_select_text_right,
            ["icon_cover"]     = obj_UI_char_select_scene_icon_select_right,
            ["bar_mark"]       = obj_UI_char_select_scene_bar_mark_right,
            ["control_method"] = obj_UI_char_select_scene_control_method_right
        }
    }

    obj = ui_mapping[input_id]["obj"]
    obj_char = ui_mapping[input_id]["char"]
    obj_text = ui_mapping[input_id]["text"]
    obj_icon_cover = ui_mapping[input_id]["icon_cover"]
    obj_bar_mark = ui_mapping[input_id]["bar_mark"]
    obj_control_method = ui_mapping[input_id]["control_method"]

    local switch = {
        ["idle"] = function()
            if INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["K"] == "Pressing" then
                play_obj_audio(audio_SFX_char_select_scene_confirm_3)
                obj["select_state"] = "selecting"

                obj[4] = 1
                obj_bar_mark[4] = 0
                obj_control_method[4] = 0

                init_point_linear_anim_with(
                    obj,
                    anim_UI_point_linear_char_select_scene_char_select_selecting_ease_out_opacity_1_0p25
                )
                init_point_linear_anim_with(
                    obj_bar_mark,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1
                )
                init_point_linear_anim_with(
                    obj_control_method,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1
                )
            end
        end,
        ["selecting"] = function()
            point_linear_animator(
                obj,
                anim_UI_point_linear_char_select_scene_char_select_selecting_ease_out_opacity_1_0p25
            )
            point_linear_animator(
                obj_bar_mark,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1
            )
            point_linear_animator(
                obj_control_method,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1
            )
            if get_point_linear_anim_end_state(obj,anim_UI_point_linear_char_select_scene_char_select_selecting_ease_out_opacity_1_0p25)
            and get_point_linear_anim_end_state(obj_bar_mark,anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1)
            and get_point_linear_anim_end_state(obj_control_method,anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1)
            then
                obj["select_state"] = "selected"
            elseif INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["H"] == "Pressing" then
                play_obj_audio(audio_SFX_char_select_scene_exit_2)
                obj["select_state"] = "unselecting"

                obj[4] = 0.25
                obj_bar_mark[4] = 1
                obj_control_method[4] = 1

                init_point_linear_anim_with(
                    obj,
                    anim_UI_point_linear_char_select_scene_char_select_unselecting_ease_in_opacity_0p25_1
                )
                init_point_linear_anim_with(
                    obj_bar_mark,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0
                )
                init_point_linear_anim_with(
                    obj_control_method,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0
                )
            elseif INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["K"] == "Pressing" then
                play_obj_audio(audio_SFX_char_select_scene_confirm_4)
                obj["select_state"] = "locking"

                obj[4] = 0.25
                obj_bar_mark[4] = 1
                obj_control_method[4] = 1
                init_point_linear_anim_with(
                    obj,
                    anim_UI_point_linear_char_select_scene_char_select_locking_opacity_0p25_0p5
                )
                init_point_linear_anim_with(
                    obj_bar_mark,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0
                )
                init_point_linear_anim_with(
                    obj_control_method,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0
                )
            end
        end,
        ["selected"] = function()
            if INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["H"] == "Pressing" then
                play_obj_audio(audio_SFX_char_select_scene_exit_2)
                obj["select_state"] = "unselecting"

                obj[4] = 0.25
                obj_bar_mark[4] = 1
                obj_control_method[4] = 1

                init_point_linear_anim_with(
                    obj,
                    anim_UI_point_linear_char_select_scene_char_select_unselecting_ease_in_opacity_0p25_1
                )
                init_point_linear_anim_with(
                    obj_bar_mark,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0
                )
                init_point_linear_anim_with(
                    obj_control_method,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0
                )
            elseif INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["K"] == "Pressing" then
                play_obj_audio(audio_SFX_char_select_scene_confirm_4)
                obj["select_state"] = "locking"

                obj[4] = 0.25
                obj_bar_mark[4] = 1
                obj_control_method[4] = 1
                init_point_linear_anim_with(
                    obj,
                    anim_UI_point_linear_char_select_scene_char_select_locking_opacity_0p25_0p5
                )
                init_point_linear_anim_with(
                    obj_bar_mark,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0
                )
                init_point_linear_anim_with(
                    obj_control_method,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0
                )
            end
        end,
        ["unselecting"] = function()
            point_linear_animator(
                obj,
                anim_UI_point_linear_char_select_scene_char_select_unselecting_ease_in_opacity_0p25_1
            )
            point_linear_animator(
                obj_bar_mark,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0
            )
            point_linear_animator(
                obj_control_method,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0
            )
            if get_point_linear_anim_end_state(obj,anim_UI_point_linear_char_select_scene_char_select_unselecting_ease_in_opacity_0p25_1)
            and get_point_linear_anim_end_state(obj_bar_mark,anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0)
            and get_point_linear_anim_end_state(obj_control_method,anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0)
            then
                obj["select_state"] = "idle"
            elseif INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["K"] == "Pressing" then
                play_obj_audio(audio_SFX_char_select_scene_confirm_3)
                obj["select_state"] = "selecting"

                obj[4] = 1
                obj_bar_mark[4] = 0
                obj_control_method[4] = 0

                init_point_linear_anim_with(
                    obj,
                    anim_UI_point_linear_char_select_scene_char_select_selecting_ease_out_opacity_1_0p25
                )
                init_point_linear_anim_with(
                    obj_bar_mark,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1
                )
                init_point_linear_anim_with(
                    obj_control_method,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1
                )
            end
        end,
        ["locking"] = function()
            point_linear_animator(
                obj,
                anim_UI_point_linear_char_select_scene_char_select_locking_opacity_0p25_0p5
            )
            point_linear_animator(
                obj_bar_mark,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0
            )
            point_linear_animator(
                obj_control_method,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0
            )
            if get_point_linear_anim_end_state(obj,anim_UI_point_linear_char_select_scene_char_select_locking_opacity_0p25_0p5)
            and get_point_linear_anim_end_state(obj_bar_mark,anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0)
            and get_point_linear_anim_end_state(obj_control_method,anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0)
            then
                obj["select_state"] = "locked"
            end
        end,
        ["locked"] = function()
        end,
        ["unlocking"] = function()
            point_linear_animator(
                obj,
                anim_UI_point_linear_char_select_scene_char_select_unlocking_opacity_0p5_0p25
            )
            point_linear_animator(
                obj_bar_mark,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_unlocking_ease_in_opacity_0_1
            )
            point_linear_animator(
                obj_control_method,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_unlocking_ease_in_opacity_0_1
            )

            if get_point_linear_anim_end_state(obj,anim_UI_point_linear_char_select_scene_char_select_unlocking_opacity_0p5_0p25)
            and get_point_linear_anim_end_state(obj_bar_mark,anim_UI_point_linear_char_select_scene_control_method_bar_mark_unlocking_ease_in_opacity_0_1)
            and get_point_linear_anim_end_state(obj_control_method,anim_UI_point_linear_char_select_scene_control_method_bar_mark_unlocking_ease_in_opacity_0_1)
            then
                obj["select_state"] = "selected"
            end
        end,
    }

    state_machine_UI_char_select_scene_char_select_ease(obj,obj_char,obj_text,obj_icon_cover,input_id)
    state_machine_UI_char_select_scene_char_select_bar_mark_select(obj,obj_bar_mark,input_id)

    local this_function = switch[obj["select_state"]]
    if this_function then this_function() end
end
function state_machine_UI_char_select_scene_char_select_ease(obj,obj_char,obj_text,obj_icon_cover,input_id)
    local switch = {
        ["ease_in"] = function()
            point_linear_animator(
                obj_char,
                anim_UI_point_linear_char_select_scene_char_select_char_ease_in_x
            )
            point_linear_animator(
                obj_text,
                anim_UI_point_linear_char_select_scene_char_select_text_ease_in_x
            )
            point_linear_animator(
                obj_icon_cover,
                anim_UI_point_linear_char_select_scene_icon_select_ease_in_opacity_0_0p5
            )
            if INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["left"] == "Pressing" 
            and (obj["select_state"] == "idle" or obj["select_state"] == "unselecting")
            then
                play_obj_audio(audio_SFX_char_select_scene_left_2)
                obj["ease_state"] = "ease_out"

                common_char_select_scene_reset_char_text_ease_out(obj_char,obj_text,obj_icon_cover,input_id)

                CHAR_SELECT_LR[input_id] = CHAR_SELECT_LR[input_id] - 1
                if CHAR_SELECT_LR[input_id] == 0 then
                    CHAR_SELECT_LR[input_id] = 8
                end

                init_point_linear_anim_with(
                    obj_char,
                    anim_UI_point_linear_char_select_scene_char_select_char_ease_out_x
                )
                init_point_linear_anim_with(
                    obj_text,
                    anim_UI_point_linear_char_select_scene_char_select_text_ease_out_x
                )
            elseif INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["right"] == "Pressing"
            and (obj["select_state"] == "idle" or obj["select_state"] == "unselecting")
            then
                play_obj_audio(audio_SFX_char_select_scene_right_2)
                obj["ease_state"] = "ease_out"

                common_char_select_scene_reset_char_text_ease_out(obj_char,obj_text,obj_icon_cover,input_id)

                CHAR_SELECT_LR[input_id] = CHAR_SELECT_LR[input_id] + 1
                if CHAR_SELECT_LR[input_id] == 9 then
                    CHAR_SELECT_LR[input_id] = 1
                end

                init_point_linear_anim_with(
                    obj_char,
                    anim_UI_point_linear_char_select_scene_char_select_char_ease_out_x
                )
                init_point_linear_anim_with(
                    obj_text,
                    anim_UI_point_linear_char_select_scene_char_select_text_ease_out_x
                )
            end
        end,
        ["ease_out"] = function()
            point_linear_animator(
                obj_char,
                anim_UI_point_linear_char_select_scene_char_select_char_ease_out_x
            )
            point_linear_animator(
                obj_text,
                anim_UI_point_linear_char_select_scene_char_select_text_ease_out_x
            )
            point_linear_animator(
                obj_icon_cover,
                anim_UI_point_linear_char_select_scene_icon_select_ease_out_opacity_0p5_0
            )

            if get_point_linear_anim_end_state(obj_char,anim_UI_point_linear_char_select_scene_char_select_char_ease_out_x)
            and get_point_linear_anim_end_state(obj_text,anim_UI_point_linear_char_select_scene_char_select_text_ease_out_x)
            and get_point_linear_anim_end_state(obj_icon_cover,anim_UI_point_linear_char_select_scene_icon_select_ease_out_opacity_0p5_0)
            then
                obj["ease_state"] = "ease_in"

                common_char_select_scene_reset_char_text_ease_in(obj_char,obj_text,obj_icon_cover,input_id)

                obj[8] = CHAR_SELECT_LR[input_id]

                init_point_linear_anim_with(
                    obj_char,
                    anim_UI_point_linear_char_select_scene_char_select_char_ease_in_x
                )
                init_point_linear_anim_with(
                    obj_text,
                    anim_UI_point_linear_char_select_scene_char_select_text_ease_in_x
                )
            elseif INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["left"] == "Pressing" 
            and (obj["select_state"] == "idle" or obj["select_state"] == "unselecting")
            then
                play_obj_audio(audio_SFX_char_select_scene_left_2)
                obj["ease_state"] = "ease_out"

                common_char_select_scene_reset_char_text_ease_out(obj_char,obj_text,obj_icon_cover,input_id)

                CHAR_SELECT_LR[input_id] = CHAR_SELECT_LR[input_id] - 1
                if CHAR_SELECT_LR[input_id] == 0 then
                    CHAR_SELECT_LR[input_id] = 8
                end

                init_point_linear_anim_with(
                    obj_char,
                    anim_UI_point_linear_char_select_scene_char_select_char_ease_out_x
                )
                init_point_linear_anim_with(
                    obj_text,
                    anim_UI_point_linear_char_select_scene_char_select_text_ease_out_x
                )

            elseif INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["right"] == "Pressing"
            and (obj["select_state"] == "idle" or obj["select_state"] == "unselecting")
            then
                play_obj_audio(audio_SFX_char_select_scene_right_2)
                obj["ease_state"] = "ease_out"

                common_char_select_scene_reset_char_text_ease_out(obj_char,obj_text,obj_icon_cover,input_id)

                CHAR_SELECT_LR[input_id] = CHAR_SELECT_LR[input_id] + 1
                if CHAR_SELECT_LR[input_id] == 9 then
                    CHAR_SELECT_LR[input_id] = 1
                end

                init_point_linear_anim_with(
                    obj_char,
                    anim_UI_point_linear_char_select_scene_char_select_char_ease_out_x
                )
                init_point_linear_anim_with(
                    obj_text,
                    anim_UI_point_linear_char_select_scene_char_select_text_ease_out_x
                )
            end
        end,
    }
    local this_function = switch[obj["ease_state"]]
    if this_function then this_function() end
end
function state_machine_UI_char_select_scene_char_select_bar_mark_select(obj,obj_bar_mark,input_id)
    local switch = {
        ["idle"] = function()
            if INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["up"] == "Pressing"
            and (obj["select_state"] == "selecting" or obj["select_state"] == "selected")
            then
                play_obj_audio(audio_SFX_char_select_scene_up_2)
                obj_bar_mark["state"] = "up_twitch"
                if CONTROL_METHOD[input_id] == 1 then
                    local y_offset_table = {["L"] = 469, ["R"] = 699}
                    obj_bar_mark[2] = y_offset_table[input_id]
                    CONTROL_METHOD[input_id] = 0
                end
                init_point_linear_anim_with(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_up_y)

            elseif INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["down"] == "Pressing"
            and (obj["select_state"] == "selecting" or obj["select_state"] == "selected")
            then
                play_obj_audio(audio_SFX_char_select_scene_down_2)
                obj_bar_mark["state"] = "down_twitch"
                if CONTROL_METHOD[input_id] == 0 then
                    local y_offset_table = {["L"] = 509, ["R"] = 739}
                    obj_bar_mark[2] = y_offset_table[input_id]
                    CONTROL_METHOD[input_id] = 1
                end
                init_point_linear_anim_with(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_down_y)
            end
        end,
        ["up_twitch"] = function()
            point_linear_animator(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_up_y)
            if get_point_linear_anim_end_state(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_up_y)then
                obj_bar_mark["state"] = "idle"
            elseif INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["up"] == "Pressing"
            and (obj["select_state"] == "selecting" or obj["select_state"] == "selected")
            then
                play_obj_audio(audio_SFX_char_select_scene_up_2)
                obj_bar_mark["state"] = "up_twitch"
                if CONTROL_METHOD[input_id] == 1 then
                    local y_offset_table = {["L"] = 469, ["R"] = 699}
                    obj_bar_mark[2] = y_offset_table[input_id]
                    CONTROL_METHOD[input_id] = 0
                end
                init_point_linear_anim_with(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_up_y)

            elseif INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["down"] == "Pressing"
            and (obj["select_state"] == "selecting" or obj["select_state"] == "selected")
            then
                play_obj_audio(audio_SFX_char_select_scene_down_2)
                obj_bar_mark["state"] = "down_twitch"
                if CONTROL_METHOD[input_id] == 0 then
                    local y_offset_table = {["L"] = 509, ["R"] = 739}
                    obj_bar_mark[2] = y_offset_table[input_id]
                    CONTROL_METHOD[input_id] = 1
                end
                init_point_linear_anim_with(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_down_y)
            end
        end,
        ["down_twitch"] = function()
            point_linear_animator(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_down_y)
            if get_point_linear_anim_end_state(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_down_y)then
                obj_bar_mark["state"] = "idle"
            elseif INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["up"] == "Pressing"
            and (obj["select_state"] == "selecting" or obj["select_state"] == "selected")
            then
                play_obj_audio(audio_SFX_char_select_scene_up_2)
                obj_bar_mark["state"] = "up_twitch"
                if CONTROL_METHOD[input_id] == 1 then
                    local y_offset_table = {["L"] = 469, ["R"] = 699}
                    obj_bar_mark[2] = y_offset_table[input_id]
                    CONTROL_METHOD[input_id] = 0
                end
                init_point_linear_anim_with(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_up_y)

            elseif INPUT_SYS_CURRENT_COMMAND_STATE[input_id]["down"] == "Pressing"
            and (obj["select_state"] == "selecting" or obj["select_state"] == "selected")
            then
                play_obj_audio(audio_SFX_char_select_scene_down_2)
                obj_bar_mark["state"] = "down_twitch"
                if CONTROL_METHOD[input_id] == 0 then
                    local y_offset_table = {["L"] = 509, ["R"] = 739}
                    obj_bar_mark[2] = y_offset_table[input_id]
                    CONTROL_METHOD[input_id] = 1
                end
                init_point_linear_anim_with(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_down_y)
            end
        end,
    }
    local this_function = switch[obj_bar_mark["state"]]
    if this_function then this_function() end
end

-- train
function state_machine_UI_char_select_scene_char_select_train_dummy()
    local obj = obj_UI_char_select_scene_char_select_right
    local obj_char = obj_UI_char_select_scene_char_select_char_right
    local obj_text = obj_UI_char_select_scene_char_select_text_right
    local obj_icon_cover = obj_UI_char_select_scene_icon_select_left
    local obj_bar_mark = obj_UI_char_select_scene_bar_mark_right
    local obj_control_method = obj_UI_char_select_scene_control_method_right

    local switch = {
        ["idle"] = function()
            if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                play_obj_audio(audio_SFX_char_select_scene_confirm_3)
                obj["select_state"] = "selecting"

                obj[4] = 1
                obj_bar_mark[4] = 0
                obj_control_method[4] = 0

                init_point_linear_anim_with(
                    obj,
                    anim_UI_point_linear_char_select_scene_char_select_selecting_ease_out_opacity_1_0p25
                )
                init_point_linear_anim_with(
                    obj_bar_mark,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1
                )
                init_point_linear_anim_with(
                    obj_control_method,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1
                )
            end

        end,
        ["selecting"] = function()
            point_linear_animator(
                obj,
                anim_UI_point_linear_char_select_scene_char_select_selecting_ease_out_opacity_1_0p25
            )
            point_linear_animator(
                obj_bar_mark,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1
            )
            point_linear_animator(
                obj_control_method,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1
            )
            if get_point_linear_anim_end_state(obj,anim_UI_point_linear_char_select_scene_char_select_selecting_ease_out_opacity_1_0p25)
            and get_point_linear_anim_end_state(obj_bar_mark,anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1)
            and get_point_linear_anim_end_state(obj_control_method,anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1)
            then
                obj["select_state"] = "selected"

            elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["H"] == "Pressing" then
                play_obj_audio(audio_SFX_char_select_scene_exit_2)
                obj["select_state"] = "unselecting"

                obj[4] = 0.25
                obj_bar_mark[4] = 1
                obj_control_method[4] = 1

                init_point_linear_anim_with(
                    obj,
                    anim_UI_point_linear_char_select_scene_char_select_unselecting_ease_in_opacity_0p25_1
                )
                init_point_linear_anim_with(
                    obj_bar_mark,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0
                )
                init_point_linear_anim_with(
                    obj_control_method,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0
                )

            elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                play_obj_audio(audio_SFX_char_select_scene_confirm_4)
                obj["select_state"] = "locking"

                obj[4] = 0.25
                obj_bar_mark[4] = 1
                obj_control_method[4] = 1
                init_point_linear_anim_with(
                    obj,
                    anim_UI_point_linear_char_select_scene_char_select_locking_opacity_0p25_0p5
                )
                init_point_linear_anim_with(
                    obj_bar_mark,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0
                )
                init_point_linear_anim_with(
                    obj_control_method,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0
                )

            end
        end,
        ["selected"] = function()
            if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["H"] == "Pressing" then
                play_obj_audio(audio_SFX_char_select_scene_exit_2)
                obj["select_state"] = "unselecting"

                obj[4] = 0.25
                obj_bar_mark[4] = 1
                obj_control_method[4] = 1

                init_point_linear_anim_with(
                    obj,
                    anim_UI_point_linear_char_select_scene_char_select_unselecting_ease_in_opacity_0p25_1
                )
                init_point_linear_anim_with(
                    obj_bar_mark,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0
                )
                init_point_linear_anim_with(
                    obj_control_method,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0
                )

            elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                play_obj_audio(audio_SFX_char_select_scene_confirm_4)
                obj["select_state"] = "locking"

                obj[4] = 0.25
                obj_bar_mark[4] = 1
                obj_control_method[4] = 1
                init_point_linear_anim_with(
                    obj,
                    anim_UI_point_linear_char_select_scene_char_select_locking_opacity_0p25_0p5
                )
                init_point_linear_anim_with(
                    obj_bar_mark,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0
                )
                init_point_linear_anim_with(
                    obj_control_method,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0
                )

            end
        end,
        ["unselecting"] = function()
            point_linear_animator(
                obj,
                anim_UI_point_linear_char_select_scene_char_select_unselecting_ease_in_opacity_0p25_1
            )
            point_linear_animator(
                obj_bar_mark,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0
            )
            point_linear_animator(
                obj_control_method,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0
            )

            if get_point_linear_anim_end_state(obj,anim_UI_point_linear_char_select_scene_char_select_unselecting_ease_in_opacity_0p25_1)
            and get_point_linear_anim_end_state(obj_bar_mark,anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0)
            and get_point_linear_anim_end_state(obj_control_method,anim_UI_point_linear_char_select_scene_control_method_bar_mark_unselecting_ease_out_opacity_1_0)
            then
                obj["select_state"] = "idle"

            elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                play_obj_audio(audio_SFX_char_select_scene_confirm_3)
                obj["select_state"] = "selecting"

                obj[4] = 1
                obj_bar_mark[4] = 0
                obj_control_method[4] = 0

                init_point_linear_anim_with(
                    obj,
                    anim_UI_point_linear_char_select_scene_char_select_selecting_ease_out_opacity_1_0p25
                )
                init_point_linear_anim_with(
                    obj_bar_mark,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1
                )
                init_point_linear_anim_with(
                    obj_control_method,
                    anim_UI_point_linear_char_select_scene_control_method_bar_mark_selecting_ease_in_opacity_0_1
                )

            end

        end,
        ["locking"] = function()
            point_linear_animator(
                obj,
                anim_UI_point_linear_char_select_scene_char_select_locking_opacity_0p25_0p5
            )
            point_linear_animator(
                obj_bar_mark,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0
            )
            point_linear_animator(
                obj_control_method,
                anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0
            )

            if get_point_linear_anim_end_state(obj,anim_UI_point_linear_char_select_scene_char_select_locking_opacity_0p25_0p5)
            and get_point_linear_anim_end_state(obj_bar_mark,anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0)
            and get_point_linear_anim_end_state(obj_control_method,anim_UI_point_linear_char_select_scene_control_method_bar_mark_locking_ease_out_opacity_1_0)
            then
                obj["select_state"] = "locked"
            end

        end,
        ["locked"] = function()
        end,
    }

    state_machine_UI_char_select_scene_char_select_ease_train_dummy(obj,obj_char,obj_text,obj_icon_cover)
    state_machine_UI_char_select_scene_char_select_bar_mark_select_train_dummy(obj,obj_bar_mark)

    local this_function = switch[obj["select_state"]]
    if this_function then this_function() end
end
function state_machine_UI_char_select_scene_char_select_ease_train_dummy(obj,obj_char,obj_text,obj_icon_cover)
    local switch = {
        ["ease_in"] = function()
            point_linear_animator(
                obj_char,
                anim_UI_point_linear_char_select_scene_char_select_char_ease_in_x
            )
            point_linear_animator(
                obj_text,
                anim_UI_point_linear_char_select_scene_char_select_text_ease_in_x
            )
            point_linear_animator(
                obj_icon_cover,
                anim_UI_point_linear_char_select_scene_icon_select_ease_in_opacity_0_0p5
            )

            if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["left"] == "Pressing" 
            and (obj["select_state"] == "idle" or obj["select_state"] == "unselecting")
            then
                play_obj_audio(audio_SFX_char_select_scene_left_2)
                obj["ease_state"] = "ease_out"

                common_char_select_scene_reset_char_text_ease_out(obj_char,obj_text,obj_icon_cover,"R")

                CHAR_SELECT_LR["R"] = CHAR_SELECT_LR["R"] - 1
                if CHAR_SELECT_LR["R"] == 0 then
                    CHAR_SELECT_LR["R"] = 8
                end

                init_point_linear_anim_with(
                    obj_char,
                    anim_UI_point_linear_char_select_scene_char_select_char_ease_out_x
                )
                init_point_linear_anim_with(
                    obj_text,
                    anim_UI_point_linear_char_select_scene_char_select_text_ease_out_x
                )

            elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["right"] == "Pressing"
            and (obj["select_state"] == "idle" or obj["select_state"] == "unselecting")
            then
                play_obj_audio(audio_SFX_char_select_scene_right_2)
                obj["ease_state"] = "ease_out"

                common_char_select_scene_reset_char_text_ease_out(obj_char,obj_text,obj_icon_cover,"R")

                CHAR_SELECT_LR["R"] = CHAR_SELECT_LR["R"] + 1
                if CHAR_SELECT_LR["R"] == 9 then
                    CHAR_SELECT_LR["R"] = 1
                end

                init_point_linear_anim_with(
                    obj_char,
                    anim_UI_point_linear_char_select_scene_char_select_char_ease_out_x
                )
                init_point_linear_anim_with(
                    obj_text,
                    anim_UI_point_linear_char_select_scene_char_select_text_ease_out_x
                )
            end
        end,
        ["ease_out"] = function()
            point_linear_animator(
                obj_char,
                anim_UI_point_linear_char_select_scene_char_select_char_ease_out_x
            )
            point_linear_animator(
                obj_text,
                anim_UI_point_linear_char_select_scene_char_select_text_ease_out_x
            )
            point_linear_animator(
                obj_icon_cover,
                anim_UI_point_linear_char_select_scene_icon_select_ease_out_opacity_0p5_0
            )

            if get_point_linear_anim_end_state(obj_char,anim_UI_point_linear_char_select_scene_char_select_char_ease_out_x)
            and get_point_linear_anim_end_state(obj_text,anim_UI_point_linear_char_select_scene_char_select_text_ease_out_x)
            and get_point_linear_anim_end_state(obj_icon_cover,anim_UI_point_linear_char_select_scene_icon_select_ease_out_opacity_0p5_0)
            then
                obj["ease_state"] = "ease_in"

                common_char_select_scene_reset_char_text_ease_in(obj_char,obj_text,obj_icon_cover,"R")

                obj[8] = CHAR_SELECT_LR["R"]

                init_point_linear_anim_with(
                    obj_char,
                    anim_UI_point_linear_char_select_scene_char_select_char_ease_in_x
                )
                init_point_linear_anim_with(
                    obj_text,
                    anim_UI_point_linear_char_select_scene_char_select_text_ease_in_x
                )
            elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["left"] == "Pressing" 
            and (obj["select_state"] == "idle" or obj["select_state"] == "unselecting")
            then
                play_obj_audio(audio_SFX_char_select_scene_left_2)
                obj["ease_state"] = "ease_out"

                common_char_select_scene_reset_char_text_ease_out(obj_char,obj_text,obj_icon_cover,"R")

                CHAR_SELECT_LR["R"] = CHAR_SELECT_LR["R"] - 1
                if CHAR_SELECT_LR["R"] == 0 then
                    CHAR_SELECT_LR["R"] = 8
                end

                init_point_linear_anim_with(
                    obj_char,
                    anim_UI_point_linear_char_select_scene_char_select_char_ease_out_x
                )
                init_point_linear_anim_with(
                    obj_text,
                    anim_UI_point_linear_char_select_scene_char_select_text_ease_out_x
                )

            elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["right"] == "Pressing"
            and (obj["select_state"] == "idle" or obj["select_state"] == "unselecting")
            then
                play_obj_audio(audio_SFX_char_select_scene_right_2)
                obj["ease_state"] = "ease_out"

                common_char_select_scene_reset_char_text_ease_out(obj_char,obj_text,obj_icon_cover,"R")

                CHAR_SELECT_LR["R"] = CHAR_SELECT_LR["R"] + 1
                if CHAR_SELECT_LR["R"] == 9 then
                    CHAR_SELECT_LR["R"] = 1
                end

                init_point_linear_anim_with(
                    obj_char,
                    anim_UI_point_linear_char_select_scene_char_select_char_ease_out_x
                )
                init_point_linear_anim_with(
                    obj_text,
                    anim_UI_point_linear_char_select_scene_char_select_text_ease_out_x
                )
            end
        end,
    }
    local this_function = switch[obj["ease_state"]]
    if this_function then this_function() end
end
function state_machine_UI_char_select_scene_char_select_bar_mark_select_train_dummy(obj,obj_bar_mark)
    local switch = {
        ["idle"] = function()
            if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["up"] == "Pressing" 
            and (obj["select_state"] == "selecting" or obj["select_state"] == "selected")
            then
                play_obj_audio(audio_SFX_char_select_scene_up_2)
                obj_bar_mark["state"] = "up_twitch"
                if CONTROL_METHOD["R"] == 1 then
                    obj_bar_mark[2] = 699
                    CONTROL_METHOD["R"] = 0
                end
                init_point_linear_anim_with(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_up_y)

            elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["down"] == "Pressing"
            and (obj["select_state"] == "selecting" or obj["select_state"] == "selected")
            then
                play_obj_audio(audio_SFX_char_select_scene_down_2)
                obj_bar_mark["state"] = "down_twitch"
                if CONTROL_METHOD["R"] == 0 then
                    obj_bar_mark[2] = 739
                    CONTROL_METHOD["R"] = 1
                end
                init_point_linear_anim_with(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_down_y)
            end
        end,
        ["up_twitch"] = function()
            point_linear_animator(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_up_y)
            if get_point_linear_anim_end_state(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_up_y)then
                obj_bar_mark["state"] = "idle"
            elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["up"] == "Pressing"
            and (obj["select_state"] == "selecting" or obj["select_state"] == "selected")
            then
                play_obj_audio(audio_SFX_char_select_scene_up_2)
                obj_bar_mark["state"] = "up_twitch"
                if CONTROL_METHOD["R"] == 1 then
                    obj_bar_mark[2] = 699
                    CONTROL_METHOD["R"] = 0
                end
                init_point_linear_anim_with(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_up_y)

            elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["down"] == "Pressing"
            and (obj["select_state"] == "selecting" or obj["select_state"] == "selected")
            then
                play_obj_audio(audio_SFX_char_select_scene_down_2)
                obj_bar_mark["state"] = "down_twitch"
                if CONTROL_METHOD["R"] == 0 then
                    obj_bar_mark[2] = 739
                    CONTROL_METHOD["R"] = 1
                end
                init_point_linear_anim_with(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_down_y)
            end
        end,
        ["down_twitch"] = function()
            point_linear_animator(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_down_y)
            if get_point_linear_anim_end_state(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_down_y)then
                obj_bar_mark["state"] = "idle"
            elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["up"] == "Pressing"
            and (obj["select_state"] == "selecting" or obj["select_state"] == "selected")
            then
                play_obj_audio(audio_SFX_char_select_scene_up_2)
                obj_bar_mark["state"] = "up_twitch"
                if CONTROL_METHOD["R"] == 1 then
                    obj_bar_mark[2] = 699
                    CONTROL_METHOD["R"] = 0
                end
                init_point_linear_anim_with(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_up_y)

            elseif INPUT_SYS_CURRENT_COMMAND_STATE["L"]["down"] == "Pressing"
            and (obj["select_state"] == "selecting" or obj["select_state"] == "selected")
            then
                play_obj_audio(audio_SFX_char_select_scene_down_2)
                obj_bar_mark["state"] = "down_twitch"
                if CONTROL_METHOD["R"] == 0 then
                    obj_bar_mark[2] = 739
                    CONTROL_METHOD["R"] = 1
                end
                init_point_linear_anim_with(obj_bar_mark,anim_UI_point_linear_char_select_scene_bar_mark_down_y)
            end
        end,
    }
    local this_function = switch[obj_bar_mark["state"]]
    if this_function then this_function() end
end
-- state machine 只在持续更新同一个object时使用
-- 格式参考input state machine
-- 控制 disclaimer and logos scene 唯一一个 obj 更新的状态机
function state_machine_UI_disclaimer_and_logos_scene_singular(obj)
    local switch = {
        ["pre_disclaimer_ease_in"] = function()
            -- 如果按D或者scene timer 到达10f则进入ease_in
            if SCENE_TIMER >= 10 or INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                -- 设置ease in 动画
                init_point_linear_anim_with(obj,anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1)
                obj["state"] = "disclaimer_ease_in"
                SCENE_TIMER = 0
            end
        end,
        ["disclaimer_ease_in"] = function()
            -- 保持运行 ease in 动画
            local anim = anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1
            point_linear_animator(obj,anim)
            -- 如果运行完毕 跳到update状态 结束的第0帧数就跳转到 update
            if get_point_linear_anim_end_state(obj,anim)then
                obj["state"] = "disclaimer_update"
                SCENE_TIMER = 0
            end
            -- 如果在ease in 就按下了D 则设置不透明度为1 设置ease out动画 并且转跳到ease out
            if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                obj[4] = 1
                init_point_linear_anim_with(obj,anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0)
                obj["state"] = "disclaimer_ease_out"
                SCENE_TIMER = 0
            end
        end,
        ["disclaimer_update"] = function()
            -- 如果按下D或者已经进入update状态120帧 就转跳到 ease out
            -- 设置不透明度为1 设置ease out 动画 跳转到ease out
            if SCENE_TIMER >= 120 or INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                obj[4] = 1
                init_point_linear_anim_with(obj,anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0)
                obj["state"] = "disclaimer_ease_out"
                SCENE_TIMER = 0
            end
        end,
        ["disclaimer_ease_out"] = function()
            -- 保持运行falsh out 动画
            local anim = anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0
            point_linear_animator(obj,anim)
            -- 如果动画运行完成或者按下D键 设置新的ease in 动画
            -- 将position对应disclaimer的值改为logo的值
            -- 改变绘图f为1 也就是kuroe taro s handicraft logo
            -- 跳转到kuroe_taro_s_handicraft_logo_ease_in状态
            if get_point_linear_anim_end_state(obj,anim)or INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                obj[1] = 620
                obj[2] = 255
                obj[4] = 0
                obj[8] = 1
                init_point_linear_anim_with(obj,anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1)
                obj["state"] = "kuroe_taro_s_handicraft_logo_ease_in"
                SCENE_TIMER = 0
            end
        end,
        ["kuroe_taro_s_handicraft_logo_ease_in"] = function()
            -- 保持运行falsh in 动画
            local anim = anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1
            point_linear_animator(obj,anim)
            -- 如果ease in 动画运行完成 跳转到 update
            if get_point_linear_anim_end_state(obj,anim)then
                obj["state"] = "kuroe_taro_s_handicraft_logo_update"
                SCENE_TIMER = 0
            end
            -- 按下d键 跳转到 ease out
            -- 设置ease out 动画
            if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                obj[4] = 1
                init_point_linear_anim_with(obj,anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0)
                obj["state"] = "kuroe_taro_s_handicraft_logo_ease_out"
                SCENE_TIMER = 0
            end
        end,
        ["kuroe_taro_s_handicraft_logo_update"] = function()
            -- 如果ease in 动画运行完成或按下d键 跳转到 ease out
            -- 设置ease out 动画
            if SCENE_TIMER >= 120 or INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                obj[4] = 1
                init_point_linear_anim_with(obj,anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0)
                obj["state"] = "kuroe_taro_s_handicraft_logo_ease_out"
                SCENE_TIMER = 0
            end
        end,
        ["kuroe_taro_s_handicraft_logo_ease_out"] = function()
            -- 保持运行ease out 动画
            local anim = anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0
            point_linear_animator(obj,anim)
            -- 如果运行完成或者按下d键 跳转到新的ease in
            -- 初始化透明度 因为坐标相同所以不改 图片改为 love2d logo
            -- 设置为新的ease in 动画
            if get_point_linear_anim_end_state(obj,anim)or INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                obj[4] = 0
                obj[8] = 2
                init_point_linear_anim_with(obj,anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1)
                obj["state"] = "love_logo_ease_in"
                SCENE_TIMER = 0
            end
        end,
        ["love_logo_ease_in"] = function()
            -- 保持运行 easei in 动画
            local anim = anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_in_opacity_0_1
            point_linear_animator(obj,anim)
            -- 如果动画运行完成 则跳转到update
            if get_point_linear_anim_end_state(obj,anim)then
                obj["state"] = "love_logo_update"
                SCENE_TIMER = 0
            end
            -- 如果按下d 跳转到ease out
            -- 设置ease out 动画
            if INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                obj[4] = 1
                init_point_linear_anim_with(obj,anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0)
                obj["state"] = "love_logo_ease_out"
                SCENE_TIMER = 0
            end
        end,
        ["love_logo_update"] = function()
            -- 如果按下d 或者在update保持了120帧 跳转到 ease out
            -- 设置ease out 动画
            if SCENE_TIMER >= 120 or INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                obj[4] = 1
                init_point_linear_anim_with(obj,anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0)
                obj["state"] = "love_logo_ease_out"
                SCENE_TIMER = 0
            end
        end,
        ["love_logo_ease_out"] = function()
            -- 保持运行 ease out 动画
            local anim = anim_UI_point_linear_disclaimer_and_logos_scene_singular_ease_out_opacity_1_0
            point_linear_animator(obj,anim)
            -- 跳转到end 用于检测
            if get_point_linear_anim_end_state(obj,anim)or INPUT_SYS_CURRENT_COMMAND_STATE["L"]["K"] == "Pressing" then
                obj[4] = 0
                obj["state"] = "end"
                SCENE_TIMER = 0
            end
        end,
        ["end"] = function()
        end
    }
    local this_function = switch[obj["state"]]
    if this_function then this_function() end
end

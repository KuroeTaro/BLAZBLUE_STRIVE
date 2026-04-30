function state_machine_UI_game_scene_HUD_ACT_common(obj,length)
    local speed = 0
    if obj[8] >= length - 1 then
        return
    end
    obj["FCT"][8] = obj["FCT"][8] + 1
    if obj["FCT"][8] > speed then
        obj[8] = obj[8] + 1
        obj["FCT"][8] = 0
    end
end
function state_machine_UI_game_scene_movie_cover_loop(obj)
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
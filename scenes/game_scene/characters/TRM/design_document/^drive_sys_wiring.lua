-- ===== left.lua: update_game_scene_char_LP_attachment =====
function update_game_scene_char_LP_attachment()
    state_machine_char_game_scene_char_LP_shot_sys()
    state_machine_char_game_scene_char_LP_shot_sys_reticle()
    state_machine_char_game_scene_char_LP_shot_sys_oroboros()
    character_function_game_scene_TRM_drive_sys_state_machine(
        obj_char_game_scene_char_LP,obj_char_game_scene_char_RP
    )
end


-- ===== left.lua: draw_game_scene_char_LP（放在 shot_sys_oroboros_front 之前）=====
    -- draw_drive_sys
    character_function_game_scene_TRM_drive_sys_draw(
        obj_char,common_game_scene_get_projectile_sprite_sheet_table(obj_char["player_side"]),obj_camera
    )

-- ===== right.lua: update_game_scene_char_RP_attachment =====
function update_game_scene_char_RP_attachment()
    state_machine_char_game_scene_char_RP_shot_sys()
    state_machine_char_game_scene_char_RP_shot_sys_reticle()
    state_machine_char_game_scene_char_RP_shot_sys_oroboros()
    character_function_game_scene_TRM_drive_sys_state_machine(
        obj_char_game_scene_char_RP,obj_char_game_scene_char_LP
    )
end


-- ===== right.lua: draw_game_scene_char_RP（放在 shot_sys_oroboros_front 之前）=====
    -- draw_drive_sys
    character_function_game_scene_TRM_drive_sys_draw(
        obj_char,common_game_scene_get_projectile_sprite_sheet_table(obj_char["player_side"]),obj_camera
    )
    res[16] = function()
        -- draw_correction
        hit_side_obj_char[8] = 3
        -- drive_sys
        local drive_sys_start_pos = character_function_game_scene_TRM_drive_sys_start_pos(hit_side_obj_char)
        local drive_sys_end_pos = character_function_game_scene_TRM_drive_sys_end_pos(
            hit_side_obj_char,drive_sys_start_pos
        )
        character_function_game_scene_TRM_drive_sys_on_fly_init(
            hit_side_obj_char,hurt_side_obj_char,drive_sys_start_pos,drive_sys_end_pos
        )
    end

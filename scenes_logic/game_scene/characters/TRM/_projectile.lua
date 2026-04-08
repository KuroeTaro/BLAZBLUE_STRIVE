function insert_projectile_game_scene_char_TRM_5H_shot(obj_char)
    local obj = {0,0,0,0,0,0,0,0}
    local obj_char_other_side = common_game_scene_change_character(obj_char["player_side"])
    obj["x"] = 0
    obj["y"] = 0
    obj["type"] = "projectile"
    obj["life"] = 42
    obj["animation"] = {}
    obj["sprite_sheet_state"] = nil

    obj["camera_enclosing_anim"] = nil
    obj["camera_x_shake_anim"] = nil
    obj["camera_y_shake_anim"] = nil

    obj["stand_block_animation"] = nil
    obj["crouch_block_animation"] = nil
    obj["air_block_animation"] = nil
    obj["stand_hurt_animation"] = nil
    obj["crouch_hurt_animation"] = nil
    obj["air_hurt_animation"] = nil
    obj["OTG_hurt_animation"] = nil
    obj["hit_hurt_blockstop_countdown"] = nil

    obj["hit_VFX_insert_function"] = nil
    obj["block_VFX_insert_function"] = nil

    obj["hit_counter_ver_function"] = nil

    obj["update"] = function()
    end
    obj["draw"] = function()
    end
    obj["enemy_interact_function"] = function()
        -- strike_clash
        -- projectile_and_projectile_interaction
        -- interaction_with_enemy
            -- normal_hit
            -- if hit
                -- insert_hit_VFX
                -- if block
                    -- set_state_and_state_cache
                    -- set_insert_camera_anim
                    -- set_play_character_shake_animation
                    -- set_play_block_animaiton_by_height_and_input
                    -- set_hit_hurt_blockstop_countdown
                    -- insert_block_VFX
                    -- insert_FD_block_VFX
                    -- return
                -- if GP
                    -- set_state_and_state_cache
                    -- set_insert_camera_anim
                    -- set_play_character_shake_animation
                    -- set_hit_hurt_blockstop_countdown
                    -- insert_VFX_game_scene_char_GP
                    -- return
                -- if parry
                    -- obj_char["parry_function"]
                    -- return
                -- if idle_and_unblock
                    -- set_state_and_state_cache
                    -- set_nil_camera_enclose
                    -- hit_counter_ver_function
                    -- insert_camera_shake_enclose
                    -- set_play_character_shake_animation
                    -- set_play_hurt_animaiton_by_height
                    -- hit_hurt_blockstop_countdown
                    -- return
                -- else
                    -- return
        -- interaction_with_enemy
            -- normal_hit
            -- if hit
        if collision_strike_hurtbox_test(obj,obj_char_other_side) then

        end
                -- insert_hit_VFX
                -- if block
                    -- set_state_and_state_cache
                    -- set_insert_camera_anim
                    -- set_play_character_shake_animation
                    -- set_play_block_animaiton_by_height_and_input
                    -- set_hit_hurt_blockstop_countdown
                    -- insert_block_VFX
                    -- insert_FD_block_VFX
                    -- return
                -- if GP
                    -- set_state_and_state_cache
                    -- set_insert_camera_anim
                    -- set_play_character_shake_animation
                    -- set_hit_hurt_blockstop_countdown
                    -- insert_VFX_game_scene_char_GP
                    -- return
                -- if parry
                    -- obj_char["parry_function"]
                    -- return
                -- if idle_and_unblock
                    -- set_state_and_state_cache
                    -- set_nil_camera_enclose
                    -- hit_counter_ver_function
                    -- insert_camera_shake_enclose
                    -- set_play_character_shake_animation
                    -- set_play_hurt_animaiton_by_height
                    -- hit_hurt_blockstop_countdown
                    -- return
                -- else
                    -- return
    end
    -- obj["friendly_interact_function"] = function()

    -- end
end
# -*- coding: utf-8 -*-
"""
fix_section_placement.py
========================
把 game_scene 角色动画文件里放错注释节的属性移动到正确的节下方
(以 obj_char_game_scene_char_LP 初始化为基准)。

每个替换都断言 old 文本在文件中出现次数 == expect_count, 全部通过才写回文件。
"""

import io

ANIM = r"h:/_love/BLAZBLUE_STRIVE/scenes/game_scene/characters/TRM/_anim.lua"
COMMON = r"h:/_love/BLAZBLUE_STRIVE/scenes/game_scene/_common/_anim.lua"


def read(p):
    with io.open(p, "r", encoding="utf-8") as f:
        return f.read()


def write(p, t):
    with io.open(p, "w", encoding="utf-8", newline="") as f:
        f.write(t)


# ---------------------------------------------------------------------------
# (文件, 期望出现次数, old, new)
# ---------------------------------------------------------------------------
EDITS = [
    # ---- TRM/_anim.lua ----
    # E1 4_6Launcher_success res[27] hit_cancel: enemy_friend_interaction -> state
    (ANIM, 1,
     """    res[27] = function()
        -- enemy_friend_interaction
        hit_side_obj_char["hit_cancel"] = true
        -- insert_VFX
        hit_side_obj_char["hit_VFX_insert_function"](hit_side_obj_char,hurt_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_move_SFX_table["4_6Launcher_hit"])
        -- draw_correction
        hit_side_obj_char[8] = 5
    end""",
     """    res[27] = function()
        -- state
        hit_side_obj_char["hit_cancel"] = true
        -- insert_VFX
        hit_side_obj_char["hit_VFX_insert_function"](hit_side_obj_char,hurt_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_move_SFX_table["4_6Launcher_hit"])
        -- draw_correction
        hit_side_obj_char[8] = 5
    end"""),

    # E2 j4_6Launcher_success res[12] hit_cancel: enemy_friend_interaction -> state
    (ANIM, 1,
     """    res[12] = function()
        -- enemy_friend_interaction
        hit_side_obj_char["hit_cancel"] = true
        -- insert_VFX
        hit_side_obj_char["hit_VFX_insert_function"](hit_side_obj_char,hurt_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_move_SFX_table["j4_6Launcher_hit"])
        -- draw_correction
        hit_side_obj_char[8] = 4
    end""",
     """    res[12] = function()
        -- state
        hit_side_obj_char["hit_cancel"] = true
        -- insert_VFX
        hit_side_obj_char["hit_VFX_insert_function"](hit_side_obj_char,hurt_side_obj_char)
        -- play_SFX
        play_obj_audio(hit_side_move_SFX_table["j4_6Launcher_hit"])
        -- draw_correction
        hit_side_obj_char[8] = 4
    end"""),

    # E3 6SP_S res[7] 节名拼写: input_sys -> input_sys_cache
    (ANIM, 1,
     """    res[7] = function()
        -- input_sys
        hit_side_obj_char["input_sys_state_negative_edge"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_negative_edge_init(hit_side)(hit_side_obj_char)
    end""",
     """    res[7] = function()
        -- input_sys_cache
        hit_side_obj_char["input_sys_state_negative_edge"] = "save" -- none save load
        common_game_scene_get_input_sys_cache_negative_edge_init(hit_side)(hit_side_obj_char)
    end"""),

    # E4 5H_shot_sys_at_the_ready_ease_in res[12]: 取消注释的 -- shot_sys 节头
    (ANIM, 1,
     """    res[12] = function()
        -- -- input_sys_cache
        -- obj_char["input_sys_state_negative_edge"] = "load" -- none save load
        -- common_game_scene_get_input_sys_cache_negative_edge_state_machine(obj_char["player_side"])()
        -- -- shot_sys
        obj_char["shot_sys_fire_cancel"] = true
    end""",
     """    res[12] = function()
        -- -- input_sys_cache
        -- obj_char["input_sys_state_negative_edge"] = "load" -- none save load
        -- common_game_scene_get_input_sys_cache_negative_edge_state_machine(obj_char["player_side"])()
        -- shot_sys
        obj_char["shot_sys_fire_cancel"] = true
    end"""),

    # E5 6SP_S res[14] shot_sys_state: sub_obj_table -> shot_sys
    (ANIM, 1,
     """    res[14] = function()
        -- sub_obj_table
        character_function_game_scene_TRM_shot_sys_at_the_ready_ease_in_init(hit_side_obj_char,hurt_side_obj_char)
        hit_side_obj_char["shot_sys_state"] = "at_the_ready_ease_in"
    end""",
     """    res[14] = function()
        -- shot_sys
        character_function_game_scene_TRM_shot_sys_at_the_ready_ease_in_init(hit_side_obj_char,hurt_side_obj_char)
        hit_side_obj_char["shot_sys_state"] = "at_the_ready_ease_in"
    end"""),

    # E6 7_8_9_jump_air_to_stand_idle res[0]: air_move 从 state_number 移到 state
    (ANIM, 1,
     """        obj_char["idle_cancel"] = false
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["velocity_cache"] = {0,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        obj_char["air_move"]["jump"][1] = obj_char["air_move"]["jump"][2]
        obj_char["air_move"]["air_dash"][1] = obj_char["air_move"]["air_dash"][2]
        -- enemy_friend_interaction""",
     """        obj_char["idle_cancel"] = false
        obj_char["air_move"]["jump"][1] = obj_char["air_move"]["jump"][2]
        obj_char["air_move"]["air_dash"][1] = obj_char["air_move"]["air_dash"][2]
        -- state_number
        obj_char["velocity"] = {0,0}
        obj_char["velocity_cache"] = {0,0}
        obj_char["friction"] = 1
        obj_char["gravity"] = 2.5
        -- enemy_friend_interaction"""),

    # E7 5H_reticle_at_the_ready_ease_in: 各 res 块补 -- shot_sys
    (ANIM, 1,
     """    res[0] = function()
        obj_char["shot_sys_reticle"][4] = 0.2
        obj_char["shot_sys_reticle"][8] = 0
        obj_char["shot_sys_reticle_sprite_sheet"] = "5H_reticle_unlocked"
        -- play_SFX
        play_obj_audio(move_SFX_table["5H_reticle_ease_in"])
    end
    res[1] = function()
        obj_char["shot_sys_reticle"][4] = 0.4
    end
    res[2] = function()
        obj_char["shot_sys_reticle"][4] = 0.6
    end
    res[3] = function()
        obj_char["shot_sys_reticle"][4] = 0.8
    end
    res[4] = function()
        obj_char["shot_sys_reticle"][4] = 1
    end""",
     """    res[0] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][4] = 0.2
        obj_char["shot_sys_reticle"][8] = 0
        obj_char["shot_sys_reticle_sprite_sheet"] = "5H_reticle_unlocked"
        -- play_SFX
        play_obj_audio(move_SFX_table["5H_reticle_ease_in"])
    end
    res[1] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][4] = 0.4
    end
    res[2] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][4] = 0.6
    end
    res[3] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][4] = 0.8
    end
    res[4] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][4] = 1
    end"""),

    # E8 5H_reticle_at_the_ready_locking_and_unlocking
    (ANIM, 1,
     """    res[0] = function()
        obj_char["shot_sys_reticle_sprite_sheet"] = sprite_sheet
        obj_char["shot_sys_reticle"][4] = 1
        obj_char["shot_sys_reticle"][8] = 0
        -- play_SFX
        if sprite_sheet == "5H_reticle_locking" then
            play_obj_audio(move_SFX_table["5H_reticle_locking"])
        end
    end
    res[1] = function()
        obj_char["shot_sys_reticle"][8] = 1
    end
    res[3] = function()
        obj_char["shot_sys_reticle"][8] = 2
    end
    res[5] = function()
        obj_char["shot_sys_reticle"][8] = 3
    end
    res[7] = function()
        obj_char["shot_sys_reticle"][8] = 4
    end""",
     """    res[0] = function()
        -- shot_sys
        obj_char["shot_sys_reticle_sprite_sheet"] = sprite_sheet
        obj_char["shot_sys_reticle"][4] = 1
        obj_char["shot_sys_reticle"][8] = 0
        -- play_SFX
        if sprite_sheet == "5H_reticle_locking" then
            play_obj_audio(move_SFX_table["5H_reticle_locking"])
        end
    end
    res[1] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][8] = 1
    end
    res[3] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][8] = 2
    end
    res[5] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][8] = 3
    end
    res[7] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][8] = 4
    end"""),

    # E9 5H_reticle_at_the_ready_locked
    (ANIM, 1,
     """    for i = 0,19 do
        res[i*2] = function()
            obj_char["shot_sys_reticle"][8] = i
        end
    end
    res[0] = function()
        obj_char["shot_sys_reticle_sprite_sheet"] = "5H_reticle_locked"
        obj_char["shot_sys_reticle"][4] = 1
        obj_char["shot_sys_reticle"][8] = 0
    end
    res[40] = function()
        obj_char["shot_sys_reticle_f_8"] = 0
        obj_char["shot_sys_reticle"][8] = 0
    end""",
     """    for i = 0,19 do
        res[i*2] = function()
            -- shot_sys
            obj_char["shot_sys_reticle"][8] = i
        end
    end
    res[0] = function()
        -- shot_sys
        obj_char["shot_sys_reticle_sprite_sheet"] = "5H_reticle_locked"
        obj_char["shot_sys_reticle"][4] = 1
        obj_char["shot_sys_reticle"][8] = 0
    end
    res[40] = function()
        -- shot_sys
        obj_char["shot_sys_reticle_f_8"] = 0
        obj_char["shot_sys_reticle"][8] = 0
    end"""),

    # E10 5H_reticle_at_the_ready_ease_out
    (ANIM, 1,
     """    res[0] = function()
        obj_char["shot_sys_reticle_sprite_sheet"] = "5H_reticle_ease_out"
        obj_char["shot_sys_reticle"][4] = 1
        obj_char["shot_sys_reticle"][8] = 0
        -- play_SFX
        play_obj_audio(move_SFX_table["5H_reticle_ease_out"])
    end
    res[2] = function()
        obj_char["shot_sys_reticle"][8] = 1
    end
    res[4] = function()
        obj_char["shot_sys_reticle"][8] = 2
    end""",
     """    res[0] = function()
        -- shot_sys
        obj_char["shot_sys_reticle_sprite_sheet"] = "5H_reticle_ease_out"
        obj_char["shot_sys_reticle"][4] = 1
        obj_char["shot_sys_reticle"][8] = 0
        -- play_SFX
        play_obj_audio(move_SFX_table["5H_reticle_ease_out"])
    end
    res[2] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][8] = 1
    end
    res[4] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][8] = 2
    end"""),

    # E11 5H_reticle_at_the_ready_shot
    (ANIM, 1,
     """    res[0] = function()
        obj_char["shot_sys_reticle_sprite_sheet"] = "5H_reticle_shot"
        obj_char["shot_sys_reticle"][4] = 1
        obj_char["shot_sys_reticle"][8] = 0
    end
    res[2] = function()
        obj_char["shot_sys_reticle"][8] = 1
    end
    res[4] = function()
        obj_char["shot_sys_reticle"][8] = 2
    end
    res[6] = function()
        obj_char["shot_sys_reticle"][8] = 3
    end""",
     """    res[0] = function()
        -- shot_sys
        obj_char["shot_sys_reticle_sprite_sheet"] = "5H_reticle_shot"
        obj_char["shot_sys_reticle"][4] = 1
        obj_char["shot_sys_reticle"][8] = 0
    end
    res[2] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][8] = 1
    end
    res[4] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][8] = 2
    end
    res[6] = function()
        -- shot_sys
        obj_char["shot_sys_reticle"][8] = 3
    end"""),

    # ---- _common/_anim.lua ----
    # E12 hard_knockdown_{down,head_down,up} res[6]: velocity 移到 state_number (3处相同)
    (COMMON, 3,
     """    res[6] = function()
        -- state
        hurt_side_obj_char["velocity"][2] = -5.0
        hurt_side_obj_char["height"] = "OTG" -- stand crouch air OTG wallstick
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][2]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end""",
     """    res[6] = function()
        -- state_number
        hurt_side_obj_char["velocity"][2] = -5.0
        -- state
        hurt_side_obj_char["height"] = "OTG" -- stand crouch air OTG wallstick
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][2]
        hurt_side_obj_char["hurtbox_table"] = hurt_side_hurtbox_data[sprite_sheet][2]
        -- draw_correction
        hurt_side_obj_char[8] = 2
    end"""),

    # E13 general_hurt_soft_recovery_ground res[13]: friction 移到 state_number
    (COMMON, 1,
     """    res[13] = function()
        -- state
        hurt_side_obj_char["height"] = "crouch" -- stand crouch air OTG wallstick
        hurt_side_obj_char["friction"] = 7
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][4]
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end""",
     """    res[13] = function()
        -- state
        hurt_side_obj_char["height"] = "crouch" -- stand crouch air OTG wallstick
        -- state_number
        hurt_side_obj_char["friction"] = 7
        -- collide
        hurt_side_obj_char["pushbox"] = hurt_side_pushbox_data[sprite_sheet][4]
        -- draw_correction
        hurt_side_obj_char[8] = 4
    end"""),

    # E14 general_hurt_hard_knockdown_wallstick_ground res[70]: pushbox 移到 collide
    (COMMON, 1,
     """    res[70] = function()
        -- state
        obj_char["y"] = 0
        obj_char["pushbox"] = pushbox_data[sprite_sheet][3]
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][3]
        obj_char[8] = 3
        -- insert_VFX""",
     """    res[70] = function()
        -- state
        obj_char["y"] = 0
        -- collide
        obj_char["pushbox"] = pushbox_data[sprite_sheet][3]
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][3]
        obj_char[8] = 3
        -- insert_VFX"""),

    # E15 general_hurt_hard_knockdown_wallstick_ground res[72]: pushbox 移到 collide
    (COMMON, 1,
     """    res[72] = function()
        -- state
        obj_char["pushbox"] = pushbox_data[sprite_sheet][4]
        -- collide
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][4]
        obj_char[8] = 4
    end""",
     """    res[72] = function()
        -- collide
        obj_char["pushbox"] = pushbox_data[sprite_sheet][4]
        obj_char["hurtbox_table"] = hurtbox_data[sprite_sheet][4]
        obj_char[8] = 4
    end"""),

    # E16 general_hurt_wallbreak res[0]: wallhurt_* 补 enemy_friend_interaction 节头
    (COMMON, 1,
     """    res[0] = function()
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = adv
        if not obj_projectile then""",
     """    res[0] = function()
        -- enemy_friend_interaction
        hurt_side_obj_char["wallhurt_wallstickable"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_with_wallstick"] = true
        hurt_side_obj_char["wallhurt_wallbreakable_without_wallstick"] = false
        hurt_side_obj_char["wallhurt_wallbreak_adv"] = adv
        if not obj_projectile then"""),
]


def main():
    # 先整体校验: 统计每个文件里所有 old 的出现次数
    cache = {}
    problems = []
    for (path, expect, old, new) in EDITS:
        if path not in cache:
            cache[path] = read(path)
        text = cache[path]
        cnt = text.count(old)
        if cnt != expect:
            problems.append((path, expect, cnt, old[:60].replace("\n", "\\n")))

    if problems:
        print("ABORT - 断言失败, 未写入任何文件:")
        for (p, e, c, snip) in problems:
            print(f"  {p}  expect={e} actual={c}  old~[{snip}...]")
        return 1

    # 应用替换
    for (path, expect, old, new) in EDITS:
        text = cache[path]
        cache[path] = text.replace(old, new)

    for (path, text) in cache.items():
        write(path, text)
        print(f"OK wrote {path}")

    print("全部替换完成")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

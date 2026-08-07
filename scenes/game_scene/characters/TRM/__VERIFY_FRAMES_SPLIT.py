# Verify new order_load_game_scene_char_{L,R}P_frames layout:
#  - every batch < 10
#  - sprite set matches ORIGINAL exactly (plus overdrive_badge via direct assign)
import re
import sys

LEFT = r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\left.lua"
RIGHT = r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\right.lua"

ORIGINAL = [
    # universal
    "0_air_Launcher_teched","0_air_Launcher_teching","0_crouch_hurt","0_general_hurt_falled_knockout",
    "0_general_hurt_hard_knockdown_down","0_general_hurt_hard_knockdown_head_down","0_general_hurt_hard_knockdown_up",
    "0_general_hurt_hard_knockdown_wallstick_ground","0_general_hurt_hard_recovery_down","0_general_hurt_hard_recovery_up",
    "0_general_hurt_hard_recovery_wallstick_ground","0_general_hurt_launched_float","0_general_hurt_launched_groundbounce",
    "0_general_hurt_launched_high","0_general_hurt_launched_low","0_general_hurt_launched_mid_hori_heavy",
    "0_general_hurt_launched_mid_up","0_general_hurt_launched_rolling","0_general_hurt_launched_rotate",
    "0_general_hurt_launched_wallbounce","0_general_hurt_semi_launched_mid","0_general_hurt_semi_launched_rotate",
    "0_general_hurt_soft_knockdown_wallstick_air","0_general_hurt_soft_recovery_ground","0_general_hurt_soft_recovery_wallstick_air",
    "0_ground_Launcher_teched","0_ground_Launcher_teching","0_stand_hurt_high","0_stand_hurt_low","0_stand_hurt_mid",
    "0_wallbreak_hit","0_wallbreak_hurt_adv","0_wallbreak_hurt_non_adv","1_2_3_crouch","1_2_3_crouch_to_stand_idle",
    "1_2_3_crouch_turn","1_4_7_air_block","1_4_7_air_block_guard_crash","1_crouch_block","1_crouch_block_guard_crash",
    "4_stand_block_guard_crash","4_stand_block_high","4_stand_block_mid","4_walk","4_walk_to_stand_idle",
    "4dash_air_backdash","4dash_backdash","5_stand_idle","5_stand_dash_skid","5_stand_turn","6_walk","6_walk_to_stand_idle",
    "6dash_air_dash","6dash_dash","7_8_9[Launcher]_follow_jump","7_8_9_jump_air_to_stand_idle","7_8_9_pre_jump",
    "7_jump","8_jump","9_jump",
    # attack
    "burst_overdrive_ground","burst_overdrive_RC_air","burst_RC_ground","2P","6P","5P","2K","6K","5K","2S","6S","cS","fS",
    "5H","5H_oroboros_ease_in_mid","5H_oroboros_ease_out_mid","5H_oroboros_loop_back","5H_oroboros_loop_front",
    "5H_oroboros_loop_mid","5H_oroboros_shot","5H_reticle_ease_out","5H_reticle_locked","5H_reticle_locking",
    "5H_reticle_shot","5H_reticle_unlocked","5H_reticle_unlocking","2Launcher","4_6Launcher","4_6Launcher_success",
    "5Launcher","j5P","j5K","j2K","j5S","j5Launcher","j4_6Launcher","j4_6Launcher_success",
    "4SP_P","6SP_P","6SP_S",
    # move_VFX
    "2P","6P","5P","2S","6S","cS","5H_shot_oroboros_blast","5H_switch","5Launcher","5Launcher_glow","j5S",
    "6SP_P_arua","6SP_P_curse_ball_spawn_halo","6SP_P_curse_ball_spawner","6SP_S",
    # projectile
    "5H_hit","5H_miss","6SP_P_curse_ball_blast","6SP_P_curse_ball_loop",
    # overdrive_badge (direct assign, not in load_name_table)
    "overdrive_badge",
]
ORIG_SET = set(ORIGINAL)
print(f"original unique count: {len(ORIG_SET)}  (raw {len(ORIGINAL)})")


def extract_batches(path, func_name):
    with open(path, "r", encoding="utf-8") as f:
        text = f.read()
    start = text.index("function " + func_name)
    body = text[start:]
    end_match = re.search(r"\nfunction order_load_game_scene_char_", body[1:])
    if end_match:
        body = body[: end_match.start() + 1]
    cases = re.split(r"\[(\d+)\] = function\(\)", body)[1:]
    batches = {}
    for i in range(0, len(cases), 2):
        num = int(cases[i])
        case = cases[i + 1]
        m = re.search(r"local load_name_table = \{(.*?)\}", case, re.S)
        names = re.findall(r'"([^"]+)"', m.group(1)) if m else []
        batches[num] = names
    return batches


def check(label, path, func_name):
    batches = extract_batches(path, func_name)
    print(f"== {label} ==")
    all_names = []
    too_big = []
    for num in sorted(batches):
        b = batches[num]
        if len(b) >= 10:
            too_big.append((num, len(b)))
        all_names.extend(b)
        if b:
            print(f"  [{num}] ({len(b)}): {', '.join(b)}")
    new_set = set(all_names)
    print(f"  cases: {len(batches)} ({min(batches)}..{max(batches)})  raw total: {len(all_names)}  unique: {len(new_set)}")
    print(f"  max batch: {max((len(v) for v in batches.values()), default=0)}  batches>=10: {too_big}")
    print(f"  MISSING vs original: {sorted(ORIG_SET - new_set)}")
    print(f"  EXTRA  vs original: {sorted(new_set - ORIG_SET)}")
    print(f"  all batches < 10: {not too_big}")
    return batches


check("LP", LEFT, "order_load_game_scene_char_LP_frames")
check("RP", RIGHT, "order_load_game_scene_char_RP_frames")

# compare LP/RP sprite multisets
def names_of(path, func_name):
    batches = extract_batches(path, func_name)
    return sorted(n for b in batches.values() for n in b)

lp = names_of(LEFT, "order_load_game_scene_char_LP_frames")
rp = names_of(RIGHT, "order_load_game_scene_char_RP_frames")
print("== LP vs RP ==")
print("  sprite lists identical:", lp == rp)
sys.exit(0)

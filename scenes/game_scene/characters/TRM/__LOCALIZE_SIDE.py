# Reuse an already-declared local `side`/`hit_side`/`hurt_side`/`self_side`
# instead of repeating `obj_char["player_side"]`-style table lookups.
#
# e.g.
#   local side = obj_char["player_side"]
#   local stage_interactive_SFX_table =
#       common_game_scene_get_SFX_stage_interactive(obj_char["player_side"])
# becomes
#   local stage_interactive_SFX_table =
#       common_game_scene_get_SFX_stage_interactive(side)
#
# Scope-aware: only rewrites within a top-level function where the matching
# local has been declared earlier in that function. Declaration lines and
# comment lines are left untouched.
import re
import sys

FILES = [
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\_common\_anim.lua",
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\_common\_projectile.lua",
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\_anim.lua",
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\_projectile.lua",
]

decl_re = re.compile(r'^\s*local\s+(\w+)\s*=\s*(\w+)\["player_side"\]')
func_re = re.compile(r"^function\s+")


def transform(path: str) -> int:
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    obj_to_local = {}  # obj name -> local var name holding its side
    out = []
    replaced = 0
    for line in lines:
        if func_re.match(line):
            obj_to_local = {}
        m = decl_re.match(line)
        if m:
            local_name, obj = m.group(1), m.group(2)
            obj_to_local[obj] = local_name
            out.append(line)  # declaration stays as-is
            continue
        if line.lstrip().startswith("--"):
            out.append(line)  # never touch comments
            continue
        new_line = line
        for obj, local_name in obj_to_local.items():
            needle = obj + '["player_side"]'
            cnt = new_line.count(needle)
            if cnt:
                new_line = new_line.replace(needle, local_name)
                replaced += cnt
        out.append(new_line)

    with open(path, "w", encoding="utf-8") as f:
        f.writelines(out)
    return replaced


if __name__ == "__main__":
    total = 0
    for p in FILES:
        n = transform(p)
        total += n
        print(f"replaced {n:4d}  in {p}")
    print(f"TOTAL {total}")
    sys.exit(0)

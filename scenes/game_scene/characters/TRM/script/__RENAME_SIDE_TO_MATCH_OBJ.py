# Rename the `side` local to match the object it derives from, per the project
# convention:
#   hit_side_obj_char["player_side"]   -> local hit_side
#   hurt_side_obj_char["player_side"]  -> local hurt_side
#   self_side_obj_char["player_side"]  -> local self_side
#   opponent_side_obj_char["player_side"] -> local opponent_side
#   obj_char["player_side"]            -> local side  (unchanged)
#
# Scope-aware: only renames inside the top-level function that declares
# `local side = <obj>["player_side"]`. Word-boundary replace on `side` so
# `hit_side`, `hurt_side`, `player_side`, `_side`, etc. are untouched.
import re
import sys

FILES = [
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\_anim.lua",
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\_VFX.lua",
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\_common\common_functions.lua",
]

OBJ_TO_LOCAL = {
    "hit_side_obj_char": "hit_side",
    "hurt_side_obj_char": "hurt_side",
    "self_side_obj_char": "self_side",
    "opponent_side_obj_char": "opponent_side",
}

decl_re = re.compile(
    r'^\s*local side = (hit_side_obj_char|hurt_side_obj_char|'
    r'self_side_obj_char|opponent_side_obj_char)\["player_side"\]'
)
func_re = re.compile(r"^function\s+")


def transform(path: str) -> int:
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    out = []
    rename_from = None  # identifier to rename (always "side")
    rename_to = None    # new name (hit_side / hurt_side / ...)
    replaced = 0
    for line in lines:
        if func_re.match(line):
            rename_from = rename_to = None
        m = decl_re.match(line)
        if m:
            rename_from = "side"
            rename_to = OBJ_TO_LOCAL[m.group(1)]
        if rename_from is not None and not line.lstrip().startswith("--"):
            new_line = re.sub(r"\b" + rename_from + r"\b", rename_to, line)
            if new_line != line:
                replaced += 1
                line = new_line
        out.append(line)

    with open(path, "w", encoding="utf-8") as f:
        f.writelines(out)
    return replaced


if __name__ == "__main__":
    total = 0
    for p in FILES:
        n = transform(p)
        total += n
        print(f"renamed {n:4d} lines in {p}")
    print(f"TOTAL {total}")
    sys.exit(0)

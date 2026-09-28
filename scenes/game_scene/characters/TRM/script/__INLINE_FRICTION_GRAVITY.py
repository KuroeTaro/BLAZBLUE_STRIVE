# Inline `local friction` / `local gravity` into direct assignments
#   (TRM/_anim.lua), and reuse the existing `local hurt_side` instead of
#   repeating `hurt_side_obj_char["player_side"]` (TRM/_projectile.lua).
import re
import sys


ANIM_PATH = r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\_anim.lua"
PROJECTILE_PATH = r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\_projectile.lua"


def transform_anim(path: str) -> tuple[int, int]:
    """Remove `local friction`/`local gravity` and inline the value at each
    `["friction"] = friction` / `["gravity"] = gravity` usage site."""
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    func_re = re.compile(r"^function\s+load_game_scene_anim_char_TRM_")
    friction_decl = re.compile(r"^(\s*)local friction = (.+?)\s*$")
    gravity_decl = re.compile(r"^(\s*)local gravity = (.+?)\s*$")
    friction_use = re.compile(r'^(\s*.*\["friction"\] = )friction(\s*)$')
    gravity_use = re.compile(r'^(\s*.*\["gravity"\] = )gravity(\s*)$')

    out = []
    cur_friction = None
    cur_gravity = None
    removed = 0
    replaced = 0
    for line in lines:
        if func_re.match(line):
            cur_friction = None
            cur_gravity = None
        m = friction_decl.match(line)
        if m:
            cur_friction = m.group(2).strip()
            removed += 1
            continue
        m = gravity_decl.match(line)
        if m:
            cur_gravity = m.group(2).strip()
            removed += 1
            continue
        m = friction_use.match(line)
        if m and cur_friction is not None:
            line = f"{m.group(1)}{cur_friction}{m.group(2)}\n"
            replaced += 1
            out.append(line)
            continue
        m = gravity_use.match(line)
        if m and cur_gravity is not None:
            line = f"{m.group(1)}{cur_gravity}{m.group(2)}\n"
            replaced += 1
            out.append(line)
            continue
        out.append(line)

    with open(path, "w", encoding="utf-8") as f:
        f.writelines(out)
    return removed, replaced


def transform_projectile(path: str) -> int:
    """Reuse the existing `local hurt_side` instead of the repeated
    `hurt_side_obj_char["player_side"]` lookups inside each function."""
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    func_re = re.compile(r"^function\s+")
    hurt_side_decl = re.compile(r"^\s*local hurt_side\s*=")
    hurt_side_use = re.compile(r'hurt_side_obj_char\["player_side"\]')

    out = []
    in_hurt_side_scope = False
    replaced = 0
    for line in lines:
        if func_re.match(line):
            in_hurt_side_scope = False
        if hurt_side_decl.match(line):
            in_hurt_side_scope = True
            out.append(line)  # keep the declaration untouched
            continue
        if in_hurt_side_scope and hurt_side_use.search(line):
            line = hurt_side_use.sub("hurt_side", line)
            replaced += 1
        out.append(line)

    with open(path, "w", encoding="utf-8") as f:
        f.writelines(out)
    return replaced


if __name__ == "__main__":
    removed_anim, replaced_anim = transform_anim(ANIM_PATH)
    print(f"TRM/_anim.lua        : removed {removed_anim} declarations, "
          f"inlined {replaced_anim} usages")
    replaced_proj = transform_projectile(PROJECTILE_PATH)
    print(f"TRM/_projectile.lua  : reused local hurt_side {replaced_proj} times")
    sys.exit(0)

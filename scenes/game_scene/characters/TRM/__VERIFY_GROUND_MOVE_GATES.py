import io
import re
import sys

FILES = {
    "LP": "scenes/game_scene/characters/TRM/left.lua",
    "RP": "scenes/game_scene/characters/TRM/right.lua",
}
ARGS = "(self_side_input,opponent_side_input,self_side_obj_char,opponent_side_obj_char)"

CALL = re.compile(
    r"state_gate_game_scene_char_(?P<side>LP|RP)_common_ground_to_"
    r"(?P<gate>UA_move|special_move|normal_move)(?P<hold>_hold_ver)?" + re.escape(ARGS)
)

problems = 0

for side, rel in FILES.items():
    text = io.open(rel, "r", encoding="utf-8", newline="").read()
    lines = re.split(r"\r?\n", text)

    # 定义区结束于 attack_move_hold_ver 的结尾，之后才是从门里的调用点
    defs_end = text.index("function state_gate_game_scene_char_%s_common_air_to_dash_move(" % side)
    defs_end_line = text.count("\n", 0, defs_end)

    triples = {"": 0, "_hold_ver": 0}
    pairs = {"": 0, "_hold_ver": 0}
    bare = []
    loose_normal = []
    wrapper = []

    for index, line in enumerate(lines):
        match = CALL.search(line)
        if not match:
            continue
        if line.startswith("function "):
            continue
        gate = match.group("gate")
        hold = match.group("hold") or ""
        if index < defs_end_line:
            wrapper.append((index + 1, gate, hold))
            continue
        if gate == "special_move":
            window = lines[max(0, index - 5):index]
            if not any("common_ground_to_UA_move" in item for item in window):
                bare.append(index + 1)
                continue
            after = lines[index:index + 4]
            if any("common_ground_to_normal_move" in item for item in after):
                triples[hold] += 1
            else:
                pairs[hold] += 1
        elif gate == "normal_move":
            window = lines[max(0, index - 8):index]
            if not any("common_ground_to_UA_move" in item for item in window):
                loose_normal.append(index + 1)

    print("===== %s (%s) =====" % (side, rel))
    print("  triples UA->special->normal : press=%d hold=%d" % (triples[""], triples["_hold_ver"]))
    print("  pairs   UA->special        : press=%d hold=%d" % (pairs[""], pairs["_hold_ver"]))
    print("  bare special calls (no UA) : %s" % bare)
    print("  normal without UA+special  : %s" % loose_normal)
    print("  wrapper-internal calls     : %s" % wrapper)

    if bare or loose_normal:
        problems += 1

print("PROBLEMS" if problems else "ALL_OK")
sys.exit(1 if problems else 0)

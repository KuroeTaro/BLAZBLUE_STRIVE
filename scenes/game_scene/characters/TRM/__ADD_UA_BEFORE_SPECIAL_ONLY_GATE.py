import io
import re
import sys

TARGETS = [
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\left.lua",
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\right.lua",
]

APPLY = "--apply" in sys.argv

ARGS = "(self_side_input,opponent_side_input,self_side_obj_char,opponent_side_obj_char)"

# 注意：下面按行匹配，line 里已不含换行符，所以模式不要吃掉 eol
CALL = re.compile(
    r'^(?P<indent>[ \t]*)if state_gate_game_scene_char_(?P<side>LP|RP)_common_ground_to_special_move'
    r'(?P<hold>_hold_ver)?' + re.escape(ARGS) + r' then$',
    re.MULTILINE,
)


def build_ua_block(indent, side, hold, eol):
    name = "state_gate_game_scene_char_%s_common_ground_to_UA_move%s" % (side, hold)
    return (indent + "if " + name + ARGS + " then" + eol
            + indent + "    return true" + eol
            + indent + "end" + eol)


def process(path):
    with io.open(path, "r", encoding="utf-8", newline="") as handle:
        text = handle.read()

    # 保留原换行符（CRLF/LF 混用时逐行取原 eol）
    parts = re.split(r"(\r?\n)", text)
    content = parts[0::2]
    eols = parts[1::2]

    inserted = []
    skipped = []
    out = []

    for index, line in enumerate(content):
        match = CALL.match(line)
        eol = eols[index] if index < len(eols) else ""
        if not match:
            out.append(line + eol)
            continue
        # 已经是 UA/special/normal 三元组的一环：
        #   or 链形态 -> 上一行是 UA
        #   常规形态   -> 上三行是 UA + return true + end
        if index >= 1 and "common_ground_to_UA_move" in content[index - 1]:
            skipped.append(index + 1)
            out.append(line + eol)
            continue
        if (index >= 3
                and "common_ground_to_UA_move" in content[index - 3]
                and content[index - 2].strip() == "return true"
                and content[index - 1].strip() == "end"):
            skipped.append(index + 1)
            out.append(line + eol)
            continue
        inserted.append(index + 1)
        out.append(build_ua_block(match.group("indent"), match.group("side"), match.group("hold") or "", eol))
        out.append(line + eol)

    print("%s: insert UA before %d special-only call sites %s" % (path, len(inserted), inserted))
    print("%s: skip %d already-tripled special calls %s" % (path, len(skipped), skipped))

    if APPLY:
        with io.open(path, "w", encoding="utf-8", newline="") as handle:
            handle.write("".join(out))
        print("  written")


for target in TARGETS:
    process(target)

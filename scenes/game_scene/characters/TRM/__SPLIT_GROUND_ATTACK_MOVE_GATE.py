import io
import re
import sys

TARGETS = [
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\left.lua",
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\right.lua",
]

APPLY = "--apply" in sys.argv

CALL = re.compile(
    r'(?P<indent>[ \t]*)if state_gate_game_scene_char_(?P<side>LP|RP)_common_ground_to_attack_move'
    r'(?P<hold>_hold_ver)?\(self_side_input,opponent_side_input,self_side_obj_char,opponent_side_obj_char\) then(?P<eol>\r?\n)'
)

VELOCITY_BODY = 'if self_side_obj_char["velocity"][1]*self_side_obj_char[5] < 0 then'

ARGS = "(self_side_input,opponent_side_input,self_side_obj_char,opponent_side_obj_char)"


def build_replacement(text, match):
    indent = match.group("indent")
    side = match.group("side")
    hold = match.group("hold") or ""
    eol = match.group("eol")
    tail = text[match.end():match.end() + 200]
    body_line = tail.split(eol, 1)[0]
    shared_body = body_line.lstrip(" \t").startswith(VELOCITY_BODY) and len(body_line) > len(indent)

    names = [
        "state_gate_game_scene_char_%s_common_ground_to_%s%s" % (side, name, hold)
        for name in ("UA_move", "special_move", "normal_move")
    ]

    if shared_body:
        # 该处 body 带 velocity correction，用 or 链让三个分支共用同一段 body，
        # 与旧 attack_move 的行为完全一致（短路求值，顺序 UA -> special -> normal）。
        out = ""
        for index, name in enumerate(names):
            out += indent + ("if " if index == 0 else "or ") + name + ARGS + ("" if index < 2 else " then") + eol
        return out

    # 最后一个分支不写 body/end，直接继承原本 attack_move 的 body（return true + end），
    # 因此替换后语句数守恒：1 个 if 行 -> 3 个 if 行 + 2 组 (return true + end)。
    out = ""
    for index, name in enumerate(names):
        out += indent + "if " + name + ARGS + " then" + eol
        if index < len(names) - 1:
            out += indent + "    return true" + eol
            out += indent + "end" + eol
    return out


def process(path):
    with io.open(path, "r", encoding="utf-8", newline="") as handle:
        text = handle.read()

    hits = []

    def repl(match):
        hits.append(match.start() + len(match.group("indent")))
        return build_replacement(text, match)

    new_text = CALL.sub(repl, text)

    line_numbers = []
    for offset in hits:
        line_numbers.append(text.count("\n", 0, offset) + 1)

    print("%s: %d call sites -> %s" % (path, len(hits), line_numbers))

    if APPLY:
        with io.open(path, "w", encoding="utf-8", newline="") as handle:
            handle.write(new_text)
        print("  written")


for target in TARGETS:
    process(target)

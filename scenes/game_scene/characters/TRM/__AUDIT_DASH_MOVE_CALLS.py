import io
import re
import collections

REL = "scenes/game_scene/characters/TRM/left.lua"
text = io.open(REL, "r", encoding="utf-8", newline="").read()
lines = re.split(r"\r?\n", text)

func_re = re.compile(r"^function (state_gate_game_scene_char_LP_\w+)\(")
call_re = re.compile(
    r"state_gate_game_scene_char_LP_common_ground_to_dash_move_PP(?P<ver>_hold_ver_all|_hold_ver_6dash_only|_hold_ver_4dash_to_walk)?\("
)

current = "<top>"
buckets = collections.OrderedDict()
totals = collections.Counter()

for index, line in enumerate(lines):
    m = func_re.match(line)
    if m:
        current = m.group(1)
        continue
    m = call_re.search(line)
    if not m or line.startswith("function "):
        continue
    ver = m.group("ver") or "(base)"
    totals[ver] += 1
    bucket = buckets.setdefault(current, collections.Counter())
    bucket[ver] += 1

print("=== 每个 from_ 门里调用的 dash_move 变体 ===")
for name, counter in buckets.items():
    detail = ", ".join("%s=%d" % (k, v) for k, v in sorted(counter.items()))
    print("  %-58s %s" % (name, detail))

print()
print("=== 总计 ===")
for key in sorted(totals):
    print("  %-24s %d" % (key, totals[key]))
print("  合计 %d" % sum(totals.values()))

print()
print("=== 每个变体的定义体（去掉签名） ===")
for index, line in enumerate(lines):
    if call_re.match(line) or line.startswith("function state_gate_game_scene_char_LP_common_ground_to_dash_move"):
        if line.startswith("function"):
            print("--- line %d: %s" % (index + 1, line))

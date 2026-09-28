import re

PATH = r"H:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\left.lua"

with open(PATH, encoding="utf-8", newline="") as f:
    src = f.read()
lines = src.split("\n")

func_re = re.compile(r'^function (state_gate_game_scene_char_LP_from_[A-Za-z0-9_]+)\(')

funcs = []
for i, l in enumerate(lines):
    m = func_re.match(l.rstrip("\r"))
    if m:
        funcs.append((i, m.group(1)))
funcs.append((len(lines), None))

CATS = {
    "dash": r'common_(?:ground|air)_to_dash_move',
    "normal": r'common_ground_to_normal_move',
    "special": r'common_ground_to_special_move',
    "UA": r'common_ground_to_UA_move',
    "air_atk": r'common_air_to_attack_move',
    "air_sp": r'common_air_to_special_move',
    "burst": r'common_to_burst_',
}

rows = []
for k in range(len(funcs) - 1):
    start, name = funcs[k]
    end = funcs[k + 1][0]
    body = "\n".join(lines[start + 1:end])
    cats = {c: len(re.findall(pat, body)) for c, pat in CATS.items()}
    inline_states = re.findall(r'self_side_obj_char\["state"\]\s*=\s*"([^"]+)"', body)
    input_checks = len(re.findall(r'test_input_sys_(?:press|press_or_hold)\(self_side_input\[', body))
    anims = len(re.findall(r'load_game_scene_anim_char_TRM_', body))
    rows.append((start + 1, name, cats, inline_states, input_checks, anims))

print(f"{'line':>5} {'function':<58} {'inp':>3} {'states':>6} {'cats'}")
print("-" * 130)
for line, name, cats, states, inp, anims in rows:
    used = ",".join(c for c, n in cats.items() if n) or "-"
    sset = sorted(set(states))
    print(f"{line:>5} {name[38:]:<58} {inp:>3} {len(states):>6} [{used}]  {sset}")

print()
print("=== from_* with hand-written input checks but NO special/UA delegation ===")
for line, name, cats, states, inp, anims in rows:
    if inp > 0 and cats["special"] == 0 and cats["UA"] == 0:
        print(f"  L{line:<5} {name[38:]:<40} states={sorted(set(states))}")

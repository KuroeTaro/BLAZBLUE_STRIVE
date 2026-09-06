# -*- coding: utf-8 -*-
"""Classify each dispatch state: has from-gate content? has anim loader? etc."""
import io, os, re, json

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TRM = os.path.join(ROOT, "scenes", "game_scene", "characters", "TRM")

with io.open(os.path.join(ROOT, "tools", "state_machine_analysis.json"), encoding="utf-8") as f:
    data = json.load(f)["LP"]

dispatch = data["dispatch_states"]

# from-gate function content (non-empty means has self logic)
gate_content = {}
for fn in data["functions"]:
    if fn["kind"] == "from":
        gate_content.setdefault(fn["state"], False)
        if fn["self_writes"] or fn["opp_writes"] or fn["calls"] or fn["any_lit"] or fn["nonlit_self_write"]:
            gate_content[fn["state"]] = True

# anim loaders present in _anim.lua
text = io.open(os.path.join(TRM, "_anim.lua"), encoding="utf-8").read()
loaders = set(re.findall(r"function load_game_scene_anim_char_TRM_([A-Za-z0-9_]+)\(", text))

no_from = [s for s in dispatch if s not in gate_content]
empty_from = [s for s in dispatch if s in gate_content and not gate_content[s]]
nonempty_from = [s for s in dispatch if s in gate_content and gate_content[s]]
no_anim = [s for s in dispatch if s not in loaders]

print("dispatch states:", len(dispatch))
print("no from_ gate at all:", len(no_from), no_from)
print("empty from_ gate  :", len(empty_from), empty_from)
print("has logic from_   :", len(nonempty_from))
print("no anim loader    :", len(no_anim), no_anim)

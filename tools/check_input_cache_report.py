# -*- coding: utf-8 -*-
"""Clean categorized report:
- input_sys_state='save'  blocks: distance to anim end, split res[0] vs non-res[0]
- hurt_state_target='idle' blocks: distance to anim end, split res[0] vs non-res[0]
Marker: OK if dist==5, else VIOLATION.
"""
import io
import os
import re

ROOT = r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene"
FILES = [
    r"_common\_anim.lua",
    r"_common\_projectile.lua",
    r"characters\TRM\_anim.lua",
    r"characters\TRM\_projectile.lua",
]
MARKER_INPUT = re.compile(r"^\s*--\s*input_sys_cache\s*$")
MARKER_COLLIDE = re.compile(r"^\s*--\s*collide\s*$")
FUNC_RE = re.compile(r"^function\s+(\w[\w.:]*)\s*\(")
RES_ANIM_LEN_RE = re.compile(r'res\["anim_length"\]\s*=\s*(\d+)')
RES_FRAME_RE = re.compile(r'^\s*res\[(\d+)\]\s*=\s*function\(\)')
INPUT_SAVE_RE = re.compile(r'\["input_sys_state"\]\s*=\s*"save"')
INPUT_LOAD_RE = re.compile(r'\["input_sys_state"\]\s*=\s*"load"')
HURT_IDLE_RE = re.compile(r'\["hurt_state_target"\]\s*=\s*"idle"')

def parse_file(path):
    with io.open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()
    blocks = []
    cur_func = None
    func_anim_len = None
    cur_block = None
    def flush():
        if cur_block is not None and cur_func:
            blocks.append(cur_block)
    i, n = 0, len(lines)
    while i < n:
        line = lines[i]
        stripped = line.strip()
        if not stripped.startswith("--") and not stripped.startswith("return"):
            m = FUNC_RE.match(line)
            if m and not line.startswith(" "):
                flush()
                cur_func = m.group(1)
                func_anim_len = None
                cur_block = None
                i += 1
                continue
        if cur_func is None:
            i += 1
            continue
        if func_anim_len is None:
            m = RES_ANIM_LEN_RE.search(line)
            if m:
                func_anim_len = int(m.group(1))
        m = RES_FRAME_RE.match(line)
        if m:
            flush()
            cur_block = {
                "func": cur_func, "file": os.path.basename(path),
                "frame": int(m.group(1)), "anim_len": func_anim_len,
                "line": i + 1, "input_state": None,
                "has_hurt_idle": False, "input_cache_lines": [],
                "collide_lines": [],
            }
            i += 1
            continue
        if cur_block is not None:
            if MARKER_INPUT.match(line):
                cur_block["input_cache_lines"].append(i + 1)
            if MARKER_COLLIDE.match(line):
                cur_block["collide_lines"].append(i + 1)
            m = INPUT_SAVE_RE.search(line)
            if m: cur_block["input_state"] = "save"
            m = INPUT_LOAD_RE.search(line)
            if m: cur_block["input_state"] = "load"
            if HURT_IDLE_RE.search(line):
                cur_block["has_hurt_idle"] = True
        i += 1
    flush()
    return blocks

def fmt(b, dist):
    mark = "OK" if dist == 5 else "VIOLATION"
    return (f"    [{mark}] res[{b['frame']:>3}] anim_len={b['anim_len']:>3} "
            f"dist={dist:>3}  line {b['line']}  ({b['func']})")

def report(title, blocks, dist_fn, res0_only):
    print("=" * 90)
    print(title)
    print("=" * 90)
    viol, ok, no_len = [], [], []
    for b in blocks:
        if b["anim_len"] is None:
            no_len.append(b)
            continue
        dist = b["anim_len"] - b["frame"]
        if res0_only != (b["frame"] == 0):
            continue
        (ok if dist == 5 else viol).append((b, dist))
    if viol:
        print(f"  -- VIOLATIONS (dist != 5): {len(viol)}")
        for b, d in sorted(viol, key=lambda x: x[0]["file"]):
            print(fmt(b, d))
    if ok:
        print(f"  -- conforming (dist==5): {len(ok)}")
        for b, d in ok:
            print(fmt(b, d))
    if no_len:
        print(f"  -- NO anim_length (skipped): {len(no_len)}")
        for b in no_len:
            print(f"    res[{b['frame']}] line {b['line']} ({b['func']})")
    print()

def main():
    all_blocks = []
    for rel in FILES:
        path = os.path.join(ROOT, rel)
        if os.path.exists(path):
            all_blocks.extend(parse_file(path))

    save_blocks = [b for b in all_blocks if b["input_state"] == "save"]
    idle_blocks = [b for b in all_blocks if b["has_hurt_idle"]]

    report("TASK 2a: input_sys_state='save' — NON-res[0] (recovery/end saves)", save_blocks, None, False)
    report("TASK 2b: input_sys_state='save' — res[0] (start-of-animation saves)", save_blocks, None, True)
    report("TASK 2c: hurt_state_target='idle' — NON-res[0] (recovery-to-idle)", idle_blocks, None, False)
    report("TASK 2d: hurt_state_target='idle' — res[0] (neutral/block/hurt start)", idle_blocks, None, True)

    # Task 1 quick check
    print("=" * 90)
    print("TASK 1: '-- input_sys_cache' below '-- collide' in same block")
    print("=" * 90)
    t1 = [b for b in all_blocks
          if b["input_cache_lines"] and b["collide_lines"]
          and min(b["input_cache_lines"]) > min(b["collide_lines"])]
    print(f"  -> {len(t1)} block(s)")
    for b in t1:
        print(f"    res[{b['frame']}] line {b['line']} ({b['func']}) "
              f"collide@{min(b['collide_lines'])} input_sys_cache@{min(b['input_cache_lines'])}")
    print()

if __name__ == "__main__":
    main()

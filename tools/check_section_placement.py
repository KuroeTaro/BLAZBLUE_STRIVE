# -*- coding: utf-8 -*-
"""
check_section_placement.py
==========================
检查 game_scene 角色文件里, 每个角色属性赋值(obj_char["xxx"] = ...)是否放在
正确的 `-- 注释节` 下方.  以 obj_char_game_scene_char_LP 的初始化
(load_game_scene_obj_char_LP) 中的分节为基准.

用法:
    python tools/check_section_placement.py [--dump] [--proj]

--dump   输出候选节注释行 与 (属性 -> 出现过的节) 全表, 供人工核对
--proj   是否也扫描 _projectile.lua / _VFX.lua (默认只扫角色动画/状态文件)
"""

import re
import sys
import io
from collections import defaultdict, Counter

BASE = r"h:/_love/BLAZBLUE_STRIVE/scenes/game_scene/characters/TRM"

LEFT = BASE + "/left.lua"
RIGHT = BASE + "/right.lua"
ANIM = BASE + "/_anim.lua"
PROJ = BASE + "/_projectile.lua"
VFX = BASE + "/_VFX.lua"
CHAR_FUNC = BASE + "/_character_function.lua"

# ---------------------------------------------------------------------------
# Lua 词法扫描: 逐字符, 跟踪行号, 返回 token 列表
# token: (line, kind, value)
#   kind: 'name' | 'number' | 'string' | 'comment' | 'punct'
# ---------------------------------------------------------------------------
def scan_lua(text):
    tokens = []
    i = 0
    n = len(text)
    line = 1
    while i < n:
        c = text[i]
        if c == "\n":
            line += 1
            i += 1
            continue
        if c in " \t\r":
            i += 1
            continue
        # line comment  --
        if c == "-" and i + 1 < n and text[i+1] == "-":
            j = i + 2
            # long comment --[[ ]] or --[=[ ]=]
            if j < n and text[j] == "[":
                eq = 0
                k = j + 1
                while k < n and text[k] == "=":
                    eq += 1
                    k += 1
                if k < n and text[k] == "[":
                    endpat = "]" + "="*eq + "]"
                    k += 1
                    start_line = line
                    while k < n and text[k:k+len(endpat)] != endpat:
                        if text[k] == "\n":
                            line += 1
                        k += 1
                    if k < n:
                        k += len(endpat)
                    tokens.append((start_line, "comment", "LONG"))
                    i = k
                    continue
            # normal line comment
            j = i + 2
            while j < n and text[j] != "\n":
                j += 1
            tokens.append((line, "comment", text[i+2:j]))
            i = j
            continue
        # long string [[ ]] / [=[ ]=]
        if c == "[":
            eq = 0
            k = i + 1
            while k < n and text[k] == "=":
                eq += 1
                k += 1
            if k < n and text[k] == "[":
                endpat = "]" + "="*eq + "]"
                k += 1
                start_line = line
                while k < n and text[k:k+len(endpat)] != endpat:
                    if text[k] == "\n":
                        line += 1
                    k += 1
                if k < n:
                    k += len(endpat)
                tokens.append((start_line, "string", "LONGSTR"))
                i = k
                continue
        # quoted string
        if c == '"' or c == "'":
            q = c
            j = i + 1
            start_line = line
            while j < n:
                if text[j] == "\\":
                    j += 2
                    continue
                if text[j] == q:
                    j += 1
                    break
                if text[j] == "\n":
                    line += 1
                j += 1
            tokens.append((start_line, "string", text[i:j]))
            i = j
            continue
        # name / number
        if c.isalpha() or c == "_":
            j = i + 1
            while j < n and (text[j].isalnum() or text[j] == "_"):
                j += 1
            tokens.append((line, "name", text[i:j]))
            i = j
            continue
        if c.isdigit() or (c == "." and i+1 < n and text[i+1].isdigit()):
            j = i + 1
            while j < n and (text[j].isalnum() or text[j] in "._"):
                j += 1
            tokens.append((line, "number", text[i:j]))
            i = j
            continue
        # punctuation / other
        tokens.append((line, "punct", c))
        i += 1
    return tokens


# ---------------------------------------------------------------------------
# 逐行解析一个文件: 得到每行的 (起始深度, 是否纯节注释, 节名, 行内赋值)
# ---------------------------------------------------------------------------
KEYWORDS_BLOCK = {"function", "then", "do", "repeat"}   # openers
KEYWORDS_END = {"end", "until"}                          # closers

# 动画/初始化文件中使用的节名 (标准化后的规范名)
KNOWN_SECTIONS = {
    "pre_set", "state", "state_number", "enemy_friend_interaction",
    "frame_data", "input_sys_cache", "game_speed", "collide",
    "sub_obj_table", "shot_sys", "oroboros", "draw_correction",
    "camera_animation_load", "visual_front", "update", "VFX", "SFX",
    "insert_VFX", "play_SFX", "direction_input", "animation_end",
    "animation", "common", "uncommon", "enemy_interact_function",
    "pushbox_interact_function", "projectile_clashed_function",
    "projectile_active", "projectile_init_fix", "risk_gauge", "block_test",
    "counter", "update/update_sub_frame/draw", "camera",
    "update_function", "5H_shot_sys", "5H_shot_sys_oroboros",
    "5H_shot_sys_oroboros_sub_obj", "5H_shot_sys_oroboros_sub_obj_update_value",
    "5H_shot_sys_reticle", "do nothing",
    "input_sys",
}

# 节名标准化: 初始化文件里的节名 -> 动画文件里的规范名
SECTION_NORM = {
    "state": "state",
    "state_number": "state_number",
    "enemy_friend_interaction": "enemy_friend_interaction",
    "direction_input": "direction_input",
    "frame_data": "frame_data",
    "input_sys_cache": "input_sys_cache",
    "game_speed": "game_speed",
    "collide": "collide",
    "sub_obj_table": "sub_obj_table",
    "VFX": "VFX",
    "SFX": "SFX",
    "update_function": "update",
    "5H_shot_sys": "shot_sys",
    "5H_shot_sys_oroboros": "oroboros",
    "5H_shot_sys_oroboros_sub_obj": "oroboros",
    "5H_shot_sys_oroboros_sub_obj_update_value": "oroboros",
    "5H_shot_sys_reticle": "shot_sys",
    "draw_correction": "draw_correction",
    "camera": "camera_animation_load",
    "camera_animation_load": "camera_animation_load",
    "visual_front": "visual_front",
    "update": "update",
    "pre_set": "pre_set",
    "shot_sys": "shot_sys",
    "oroboros": "oroboros",
    "insert_VFX": "insert_VFX",
    "play_SFX": "play_SFX",
    "animation_end": "animation_end",
    "animation": "animation",
    "common": "common",
    "uncommon": "uncommon",
    "enemy_interact_function": "enemy_interact_function",
    "pushbox_interact_function": "pushbox_interact_function",
    "projectile_clashed_function": "projectile_clashed_function",
    "projectile_active": "projectile_active",
    "projectile_init_fix": "projectile_init_fix",
    "risk_gauge": "risk_gauge",
    "block_test": "block_test",
    "counter": "counter",
    "update/update_sub_frame/draw": "update/update_sub_frame/draw",
    "do nothing": "do nothing",
}


def section_norm(name):
    return SECTION_NORM.get(name, name)


ASSIGN_RE = re.compile(
    r"^\s*([A-Za-z_][A-Za-z0-9_]*)\s*\[\s*"
    r"(?:\"([^\"]+)\"|'([^']+)'|(\d+))"
    r"\s*\]"
    r"(?:\s*\[\s*(?:\"[^\"]*\"|'[^']*'|\d+)\s*\])*"   # 允许链式子索引 [a][b]...
    r"\s*="
)

FUNC_START_RE = re.compile(r"^\s*(?:local\s+)?function\s+([A-Za-z_][A-Za-z0-9_]*)")
RES_ASSIGN_RE = re.compile(r"^\s*res\s*\[\s*([^\]]+)\s*\]\s*=\s*function\b")
RETURN_RES_RE = re.compile(r"^\s*return\s+res\b")


def parse_lines(tokens):
    """
    返回:
      lines: list of dict
        { line, depth, func, res_key, is_section, section, assigns: [(var, key), ...], is_func_start, is_res_start }
    """
    # 先按行聚合 tokens
    lines = []
    cur = []
    cur_line = None
    for (ln, kind, val) in tokens:
        if cur_line is None:
            cur_line = ln
        if ln != cur_line:
            lines.append((cur_line, cur))
            cur = []
            cur_line = ln
        cur.append((kind, val))
    if cur:
        lines.append((cur_line, cur))

    depth = 0
    result = []
    # 收集每行的关键词
    for (ln, toks) in lines:
        code_tokens = []
        if not toks:
            result.append(dict(line=ln, depth=depth, func=None, res_key=None,
                               is_section=False, section=None, assigns=[],
                               is_func_start=False, is_res_start=False))
            continue
        # 纯注释行?
        if all(k == "comment" for (k, v) in toks):
            comment_text = " ".join(v for (k, v) in toks if k == "comment")
            comment_text = comment_text.strip()
            # 节名 = 第一个词 (允许数字开头如 5H_shot_sys, 但不能以 _ 开头)
            m = re.match(r"^([A-Za-z0-9][A-Za-z0-9_]*)(.*)$", comment_text)
            sec = None
            if m and m.group(1) in KNOWN_SECTIONS:
                sec = m.group(1)
            result.append(dict(line=ln, depth=depth, func=None, res_key=None,
                               is_section=(sec is not None), section=sec,
                               assigns=[], is_func_start=False, is_res_start=False))
        else:
            # 行内: 找函数头 / res 块 / 赋值
            code_tokens = [(k, v) for (k, v) in toks if k != "comment"]
            func = None
            res_key = None
            is_func_start = False
            is_res_start = False
            assigns = []
            # 重建行文本(去掉注释, 保留字符串原始内容, 供赋值正则匹配)
            text = ""
            for (k, v) in code_tokens:
                if k == "comment":
                    continue
                if k == "string":
                    text += v + " "
                else:
                    text += v + " "
            # function 头
            mf = re.match(r"^\s*(?:local\s+)?function\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(", text)
            if mf:
                func = mf.group(1)
                is_func_start = True
            else:
                mr = re.match(r"^\s*res\s*\[\s*([^\]]+)\s*\]\s*=\s*function\s*\(", text)
                if mr:
                    res_key = mr.group(1).strip().strip('"').strip("'")
                    is_res_start = True
            # 赋值
            for am in ASSIGN_RE.finditer(text):
                var = am.group(1)
                key = am.group(2) or am.group(3) or am.group(4)
                if key is not None:
                    assigns.append((var, key))
            result.append(dict(line=ln, depth=depth, func=func, res_key=res_key,
                               is_section=False, section=None, assigns=assigns,
                               is_func_start=is_func_start, is_res_start=is_res_start))
        # 更新深度
        for (k, v) in code_tokens:
            if k == "name":
                if v in KEYWORDS_BLOCK:
                    depth += 1
                elif v in KEYWORDS_END:
                    depth -= 1
        if depth < 0:
            depth = 0
    return result


# ---------------------------------------------------------------------------
# 从初始化函数构建 属性 -> 规范节 映射
# ---------------------------------------------------------------------------
def build_canonical(left_text):
    toks = scan_lua(left_text)
    lines = parse_lines(toks)
    canon = {}
    # 找到 load_game_scene_obj_char_LP 函数体
    in_init = False
    init_depth = None
    cur_section = None
    for entry in lines:
        if entry["is_func_start"] and entry["func"] == "load_game_scene_obj_char_LP":
            in_init = True
            init_depth = entry["depth"]  # 函数声明所在深度
            cur_section = None
            continue
        if not in_init:
            continue
        # 函数结束 (depth 回到函数声明深度)
        if entry["depth"] <= init_depth and entry["is_func_start"] is False:
            # 函数体内第一行 depth == init_depth+1
            break
        if entry["is_section"]:
            cur_section = section_norm(entry["section"])
            continue
        if entry["depth"] != init_depth + 1:
            continue
        for (var, key) in entry["assigns"]:
            if var == "obj_char_game_scene_char_LP":
                if key not in canon:
                    canon[key] = cur_section
    return canon


# ---------------------------------------------------------------------------
# 扫描一个文件, 收集 (属性 -> [(文件, 函数, 行, 节, 变量) ...])
# ---------------------------------------------------------------------------
def scan_file(path, canon, char_vars, anim_only=True):
    """
    扫描文件.  anim_only=True 时, 只统计 load_game_scene_anim_char_*
    函数的 res[N] = function() 块内的赋值 (这些块才有属性分节纪律).
    其它位置(状态机/state_gate/update函数)的赋值不参与判定, 避免误报.
    """
    with io.open(path, "r", encoding="utf-8") as f:
        text = f.read()
    toks = scan_lua(text)
    lines = parse_lines(toks)
    cur_func = None
    in_anim_func = False      # 当前是否在 load_game_scene_anim_char_* 函数内
    res_block = False          # 当前是否在 res[N] = function() 块内 (第一层嵌套)
    func_depth = 0
    res_depth = 0
    observed = defaultdict(list)   # prop -> list of (line, section, var)
    section_by_depth = defaultdict(lambda: None)

    for entry in lines:
        if entry["is_func_start"]:
            cur_func = entry["func"]
            in_anim_func = cur_func.startswith("load_game_scene_anim_char_")
            func_depth = entry["depth"]   # 函数声明所在深度
            res_block = False
            section_by_depth.clear()
            continue
        if not in_anim_func:
            continue
        # 离开 res 块: 深度回到函数体深度(即 res 块已结束)
        if res_block and entry["depth"] <= func_depth + 1 and not entry["is_res_start"]:
            if not (entry["is_section"] or entry["assigns"]):
                # 空行/其他, 保持
                pass
            else:
                res_block = False
        if entry["is_res_start"]:
            res_block = True
            res_depth = entry["depth"]
            continue
        if entry["is_section"]:
            section_by_depth[entry["depth"]] = entry["section"]
            continue
        if not res_block:
            continue
        # 只在 res 块内层(第一层)统计赋值
        if entry["depth"] != res_depth + 1:
            continue
        for (var, key) in entry["assigns"]:
            if var not in char_vars:
                continue
            sec = section_by_depth.get(entry["depth"])
            # 若该深度无节, 向上找最近祖先深度
            if sec is None:
                d = entry["depth"] - 1
                while d >= 0:
                    sec = section_by_depth.get(d)
                    if sec is not None:
                        break
                    d -= 1
            observed[key].append((cur_func, entry["line"], sec, var))
    return observed


def main():
    dump = "--dump" in sys.argv
    with_proj = "--proj" in sys.argv
    debug_func = None
    for a in sys.argv:
        if a.startswith("--debug-func="):
            debug_func = a.split("=", 1)[1]

    with io.open(LEFT, "r", encoding="utf-8") as f:
        left_text = f.read()
    canon = build_canonical(left_text)

    if dump:
        print("=== CANONICAL (obj_char_game_scene_char_LP init) ===")
        for k in sorted(canon, key=lambda x: (canon[x] is None, canon[x], x)):
            sec = canon[k] if canon[k] is not None else "(top)"
            print(f"  {sec:<28} {k}")
        print()

    # 注意: obj 是 oroboros 子对象, 不是角色本体, 排除
    char_vars = {
        "obj_char", "hit_side_obj_char", "hurt_side_obj_char",
        "self_side_obj_char", "obj_char_game_scene_char_LP",
        "obj_char_game_scene_char_RP",
    }

    targets = [("_anim.lua", ANIM), ("left.lua", LEFT), ("right.lua", RIGHT)]
    if with_proj:
        targets += [("_projectile.lua", PROJ), ("_VFX.lua", VFX)]
    # 公共角色动画 (game_scene/_common/_anim.lua)
    COMMON_ANIM = BASE.replace("/characters/TRM", "/_common/_anim.lua")
    targets += [("_common/_anim.lua", COMMON_ANIM)]

    if debug_func:
        with io.open(ANIM, "r", encoding="utf-8") as f:
            text = f.read()
        toks = scan_lua(text)
        lines = parse_lines(toks)
        cur = None
        for e in lines:
            if e["is_func_start"]:
                cur = e["func"]
            if cur == debug_func:
                tag = "SECTION" if e["is_section"] else ("RES" if e["is_res_start"] else "     ")
                print(f"  d={e['depth']} {tag} L{e['line']:<6} sec={e['section']} assigns={e['assigns']}")
        return

    # 收集所有文件的观测
    all_observed = defaultdict(list)  # (file, prop) -> [...]
    file_observed = {}
    for (name, path) in targets:
        obs = scan_file(path, canon, char_vars)
        file_observed[name] = obs
        for prop, entries in obs.items():
            for (func, line, sec, var) in entries:
                all_observed[(name, prop)].append((func, line, sec, var))

    if dump:
        print("=== OBSERVED sections per property (all files) ===")
        props = sorted(all_observed.keys(), key=lambda x: x[1])
        for (fname, prop) in props:
            secs = sorted(set(e[2] for e in all_observed[(fname, prop)]))
            print(f"  [{fname}] {prop:<40} sections={secs}")
        print()

    # 白名单: 这些属性在动画里固定放在 draw_correction (obj[8]等), 或状态相关
    WHITELIST = {
        "1", "2", "3", "4", "5", "6", "7", "8",        # obj[N] 图形属性 -> draw_correction
        "anchor_pos",                                    # draw_correction
        "f",                                             # 逻辑帧, 常放 state
        "FCT", "LCT", "LCD",
        "x", "y",                                       # 位置属性, 初始在 top
        "f_8", "f_4",                                    # oroboros 子对象帧
    }
    # 允许的属性->节(额外可接受)
    EXTRA_OK = {
        "f": {"state", "state_number", "draw_correction", None},
        "8": {"draw_correction", None},
        "anchor_pos": {"draw_correction", None},
    }

    print("========= MISMATCH REPORT =========")
    mismatch_count = 0
    unknown_props = set()
    for (fname, prop) in sorted(all_observed.keys(), key=lambda x: (x[1], x[0])):
        entries = all_observed[(fname, prop)]
        if prop in WHITELIST:
            continue
        canonical_sec = canon.get(prop, "?UNKNOWN?")
        if canonical_sec == "?UNKNOWN?":
            unknown_props.add(prop)
            continue
        # 找到与规范不符的条目
        bad = []
        for (func, line, sec, var) in entries:
            if sec == canonical_sec:
                continue
            # 额外允许
            if prop in EXTRA_OK and sec in EXTRA_OK[prop]:
                continue
            bad.append((func, line, sec, var))
        if bad:
            mismatch_count += len(bad)
            print(f"\n  PROP '{prop}'  (canonical: {canonical_sec})")
            for (func, line, sec, var) in bad:
                print(f"    [{fname}] line {line}  func={func}  var={var}  section={sec}")

    print("\n========= UNKNOWN PROPS (not in init) — 需人工核对 =========")
    for prop in sorted(unknown_props):
        seen = set()
        for (f, p) in all_observed:
            for e in all_observed[(f, p)]:
                if p == prop:
                    seen.add(e[2])
        secs = sorted(seen, key=lambda x: (x is None, x))
        print(f"  {prop:<45} sections={secs}")

    print(f"\n=== mismatch entries: {mismatch_count} ===")


if __name__ == "__main__":
    main()

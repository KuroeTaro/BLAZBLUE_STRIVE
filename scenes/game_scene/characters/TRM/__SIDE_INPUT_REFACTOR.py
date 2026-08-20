# __SIDE_INPUT_REFACTOR.py
# 在 game_scene 范围内，把「有两个 side_obj_char + 一个裸 input」的函数统一改为带 side 前缀的 input：
#
#   A) 参数（函数有两个 side_obj_char 参数 + input 参数）：
#      function f(input,self_side_obj_char,opponent_side_obj_char)
#        -> function f(self_side_input,opponent_side_input,self_side_obj_char,opponent_side_obj_char)
#
#   B) 本地变量（函数有两个 side_obj_char 本地变量 + input 本地变量）：
#      local input = INPUT_SYS_CURRENT_COMMAND_STATE["L"]
#        -> local self_side_input    = INPUT_SYS_CURRENT_COMMAND_STATE["L"]
#           local opponent_side_input = INPUT_SYS_CURRENT_COMMAND_STATE["R"]
#
#   函数体内的 \binput\b 一并改名为 self_side_input；
#   调用点 (self_side_input,self_side_obj_char,opponent_side_obj_char) 会补上 opponent_side_input。
#
# 只直接修改 left.lua 和 _character_function.lua；
# right.lua 由 __REPLACE_SCRIPT.py 从 left.lua 重新生成（脚本已同步增加 opponent_side_input 规则）。
import re
import sys

FILES = [
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\left.lua",
    r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\_character_function.lua",
]

SIDE_OBJ_NAMES = (
    "self_side_obj_char", "opponent_side_obj_char",
    "hit_side_obj_char", "hurt_side_obj_char",
)
SIDE_PREFIX = {
    "self_side_obj_char": "self_side",
    "opponent_side_obj_char": "opponent_side",
    "hit_side_obj_char": "hit_side",
    "hurt_side_obj_char": "hurt_side",
}
# input 对应的「本侧」对象，与「对称侧」对象
INPUT_SIDE_OBJ = "self_side_obj_char"
OPPONENT_SIDE_OBJ = "opponent_side_obj_char"

func_def_re = re.compile(r'^function\s+(\w+)\(')
openers_re = re.compile(r'\b(function|if|for|while|repeat)\b')
closers_re = re.compile(r'\b(end|until)\b')
input_word_re = re.compile(r'\binput\b')
local_input_re = re.compile(
    r'^(\s*)local\s+input\s*=\s*INPUT_SYS_CURRENT_COMMAND_STATE\["([LR])"\]\s*(.*)$'
)
local_side_obj_re = re.compile(
    r'^\s*local\s+(self_side_obj_char|opponent_side_obj_char|hit_side_obj_char|hurt_side_obj_char)\s*='
)
sig_side_obj_re = re.compile(r'\b(self_side_obj_char|opponent_side_obj_char|hit_side_obj_char|hurt_side_obj_char)\b')
# 改名后，在「定义/调用点」把对称 side 的 input 参数补上。
# 必须匹配完整三连 (self_side_input,self_side_obj_char,opponent_side_obj_char)，
# 避免误改 load_input_sys_cache_manual_release(self_side_input,self_side_obj_char,"up") 之类。
insert_call_pattern = (
    SIDE_PREFIX[INPUT_SIDE_OBJ] + "_input," + INPUT_SIDE_OBJ + "," + OPPONENT_SIDE_OBJ
)
insert_call_replacement = (
    SIDE_PREFIX[INPUT_SIDE_OBJ] + "_input," + SIDE_PREFIX[OPPONENT_SIDE_OBJ] + "_input,"
    + INPUT_SIDE_OBJ + "," + OPPONENT_SIDE_OBJ
)


def strip_lua(line: str) -> str:
    """去掉行内注释与字符串字面量（保持长度），用于关键词计数。"""
    out = []
    i = 0
    n = len(line)
    while i < n:
        c = line[i]
        if c == '-' and i + 1 < n and line[i + 1] == '-':
            break
        if c == '"' or c == "'":
            quote = c
            out.append(c)
            i += 1
            while i < n:
                out.append(line[i])
                if line[i] == '\\' and i + 1 < n:
                    out.append(line[i + 1])
                    i += 2
                    continue
                if line[i] == quote:
                    i += 1
                    break
                i += 1
            continue
        out.append(c)
        i += 1
    return ''.join(out)


def split_top_level_functions(lines):
    """返回 [(start_idx, end_idx, func_name)]，end_idx 为函数结束（含结尾 end）。"""
    blocks = []
    n = len(lines)
    i = 0
    while i < n:
        m = func_def_re.match(lines[i])
        if not m:
            i += 1
            continue
        name = m.group(1)
        # 签名：从本行 '(' 开始，括号配平为止（支持跨行签名）
        j = i
        depth = 0
        started = False
        while j < n:
            s = strip_lua(lines[j])
            for ch in s:
                if ch == '(':
                    depth += 1
                    started = True
                elif ch == ')':
                    depth -= 1
                    if started and depth == 0:
                        break
            if started and depth == 0:
                break
            j += 1
        body_start = j + 1
        # 函数体：从 function 关键字开始计数，depth 回到 0 即函数结束
        depth = 1
        k = body_start
        while k < n:
            s = strip_lua(lines[k])
            depth += len(openers_re.findall(s))
            depth -= len(closers_re.findall(s))
            if depth <= 0:
                break
            k += 1
        blocks.append((i, k, name))
        i = k + 1
    return blocks


def collect_sig(lines, start_idx, body_start_idx):
    """拼接签名文本（从 function 行到 body 前一行）。"""
    return "\n".join(lines[start_idx:body_start_idx])


def transform_file(path: str, dry: bool = False) -> int:
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    blocks = split_top_level_functions(lines)
    changed_functions = 0
    # 逆序处理：Part B 会插入新行，逆序时插入只影响「已处理过」的（更靠后）块，
    # 不会偏移尚未处理块的原始下标，检测读到的一律是原始内容。
    for (s, e, name) in reversed(blocks):
        # 重新定位 body_start（与 split 里一致）
        depth_paren = 0
        started = False
        j = s
        while j < e:
            st = strip_lua(lines[j])
            for ch in st:
                if ch == '(':
                    depth_paren += 1
                    started = True
                elif ch == ')':
                    depth_paren -= 1
                    if started and depth_paren == 0:
                        break
            if started and depth_paren == 0:
                break
            j += 1
        body_start = j + 1

        sig_text = "".join(lines[s:body_start])
        sig_side_objs = set(sig_side_obj_re.findall(sig_text))

        # 函数体内的 side_obj_char 本地变量（看声明区即可，扫前 40 行足够）
        body_side_objs = set()
        has_local_input = False
        local_input_line_idx = None
        local_input_side = None
        scan_end = min(e, body_start + 40)
        for idx in range(body_start, scan_end):
            m = local_input_re.match(lines[idx])
            if m:
                has_local_input = True
                local_input_line_idx = idx
                local_input_side = m.group(2)
            m2 = local_side_obj_re.match(lines[idx])
            if m2:
                body_side_objs.add(m2.group(1))

        is_part_a = (
            input_word_re.search(sig_text)
            and INPUT_SIDE_OBJ in sig_side_objs
            and OPPONENT_SIDE_OBJ in sig_side_objs
        )
        is_part_b = (
            has_local_input
            and INPUT_SIDE_OBJ in body_side_objs
            and OPPONENT_SIDE_OBJ in body_side_objs
        )
        if not (is_part_a or is_part_b):
            continue

        changed_functions += 1
        if dry:
            kind = ("A" if is_part_a else "") + ("B" if is_part_b else "")
            print(f"  [{kind}] {name}  lines {s+1}..{e+1}")
            continue

        idx = s
        while idx <= e:
            line = lines[idx]
            if line.lstrip().startswith('--'):
                idx += 1
                continue
            if is_part_b and idx == local_input_line_idx:
                indent, side, rest = local_input_re.match(line).group(1, 2, 3)
                other = "R" if side == "L" else "L"
                lines[idx] = "{}local {} = INPUT_SYS_CURRENT_COMMAND_STATE[\"{}\"]{}\n".format(
                    indent, SIDE_PREFIX[INPUT_SIDE_OBJ] + "_input", side, rest
                )
                opponent_line = "{}local {} = INPUT_SYS_CURRENT_COMMAND_STATE[\"{}\"]{}\n".format(
                    indent, SIDE_PREFIX[OPPONENT_SIDE_OBJ] + "_input", other, rest
                )
                lines.insert(idx + 1, opponent_line)
                e += 1
                idx += 2
                continue
            new_line = input_word_re.sub(SIDE_PREFIX[INPUT_SIDE_OBJ] + "_input", line)
            new_line = new_line.replace(insert_call_pattern, insert_call_replacement)
            lines[idx] = new_line
            idx += 1

    if not dry:
        with open(path, "w", encoding="utf-8") as f:
            f.writelines(lines)
    print(f"transformed {changed_functions:4d} functions in {path}")
    return changed_functions


if __name__ == "__main__":
    dry = "--dry" in sys.argv
    total = 0
    for p in FILES:
        total += transform_file(p, dry=dry)
    print(f"TOTAL {total}")
    sys.exit(0)

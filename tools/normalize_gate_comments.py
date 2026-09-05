# -*- coding: utf-8 -*-
"""
对 TRM/left.lua 做注释规范化（left.lua 为源文件，right.lua 由其经 __REPLACE_SCRIPT.py 生成）：

[1] 删除重复的分组头：load 函数里出现两次相邻的 `-- sub_obj_table`，删掉第二个。
[2] 修正拼写：`-- darw_front` -> `-- draw_front`；`-- retcile` -> `-- reticle`。
[3] 删除正序 draw 循环里误复制的 `-- 反向遍历，便于删除元素`（正向遍历不删除元素）。
[4] shot_sys_aim_process 的注释与数组元素数不符：初始化数组为 4 元素，注释改为 4 项说明
    （删掉“上一帧是否高于瞄准命中最低数值”），与 load 顶部同名行的注释保持一致。
[5] 状态门（state_gate_game_scene_char_LP_*）内“表示状态名”的注释统一加下划线前缀 `_`，
    使其与 `-- _PRC / -- _2P / -- _5_stand_idle` 等既有写法一致。
    仅处理内容为单个状态 token（属于主状态机 state 词表）的整行注释；
    hit_cancel / idle_cancel / special / animation_end / air / stand_idle 等
    “窗口/功能块”注释不在词表中，保持原样。

只改动注释，不改变任何运行逻辑。
用法: python tools/normalize_gate_comments.py
"""
import re
import io
import sys

LEFT_PATH = r"H:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\left.lua"

# 期望的 aim_process 4 项注释（与 load 顶部行一致）
AIM_PROCESS_COMMENT = "-- 当前值 当前速度 瞄准命中最低值 瞄准命中最高保存值"


def read_lines(path):
    with io.open(path, "r", encoding="utf-8") as f:
        return f.readlines()


def write_lines(path, lines):
    with io.open(path, "w", encoding="utf-8") as f:
        f.writelines(lines)


def build_state_vocab(lines):
    """从主角色状态机的 switch 里收集全部状态名。"""
    start = None
    end = None
    for i, line in enumerate(lines):
        if line.startswith("function state_machine_char_game_scene_char_LP()"):
            start = i
        elif start is not None and line.startswith("function state_machine_char_game_scene_char_LP_shot_sys()"):
            end = i
            break
    if start is None or end is None:
        raise RuntimeError("找不到主状态机函数范围，无法构建状态词表")
    body = "".join(lines[start:end])
    return set(re.findall(r'\["([^"]+)"\]\s*=\s*function\(', body))


def strip_eol(line):
    """返回 (内容, 行尾符)。"""
    if line.endswith("\r\n"):
        return line[:-2], "\r\n"
    if line.endswith("\n"):
        return line[:-1], "\n"
    return line, ""


def fix_dup_sub_obj_table(lines):
    """[1] 删除相邻的第二个 `-- sub_obj_table` 分组头。"""
    out = []
    changed = []
    i = 0
    while i < len(lines):
        content, eol = strip_eol(lines[i])
        # 模式：上一行是 ...VFX_black_overlay_table] = {}，本行 -- sub_obj_table，下一行 -- VFX
        if (content.strip() == "-- sub_obj_table"
                and i + 1 < len(lines)
                and strip_eol(lines[i + 1])[0].strip() == "-- VFX"
                and i - 1 >= 0
                and "VFX_black_overlay_table" in lines[i - 1]):
            changed.append((i + 1, content, None))  # 删除本行
            i += 1
            continue
        out.append(lines[i])
        i += 1
    return out, changed


def fix_typos(lines):
    """[2] 拼写修正。返回 (lines, [(line_no, old, new), ...])"""
    subs = {
        "-- darw_front": "-- draw_front",
        "-- retcile": "-- reticle",
    }
    changed = []
    for idx, line in enumerate(lines):
        content, eol = strip_eol(line)
        stripped = content.strip()
        if stripped in subs:
            # 只替换行内从 `--` 注释开始的那部分，保留行首缩进
            comment_at = content.find(stripped)
            new = content[:comment_at] + subs[stripped] + content[comment_at + len(stripped):]
            changed.append((idx + 1, content, new))
            lines[idx] = new + eol
    return lines, changed


def fix_forward_draw_loop_comments(lines):
    """[3] 正序 draw 循环去掉误复制的删除注释。"""
    changed = []
    pat = re.compile(r"^(\s*for i = 1,.*?do)\s+-- 反向遍历，便于删除元素\s*$")
    for idx, line in enumerate(lines):
        content, eol = strip_eol(line)
        m = pat.match(content)
        if m:
            changed.append((idx + 1, content, m.group(1)))
            lines[idx] = m.group(1) + eol
    return lines, changed


def fix_aim_process_comment(lines):
    """[4] aim_process 长注释改为 4 项说明。"""
    changed = []
    long = "-- 当前值 当前速度 瞄准命中最低值 瞄准命中最高保存值 上一帧是否高于瞄准命中最低数值"
    for idx, line in enumerate(lines):
        content, eol = strip_eol(line)
        if long in content:
            new = content.replace(long, AIM_PROCESS_COMMENT, 1)
            changed.append((idx + 1, content, new))
            lines[idx] = new + eol
    return lines, changed


def gate_ranges(lines):
    """返回 state_gate_game_scene_char_LP_* 函数体的 [start, end) 行区间列表（0-based）。"""
    ranges = []
    i = 0
    n = len(lines)
    while i < n:
        if lines[i].startswith("function state_gate_game_scene_char_LP_"):
            start = i
            j = i + 1
            while j < n and strip_eol(lines[j])[0] != "end":
                j += 1
            ranges.append((start, j))  # 不含收尾 end
            i = j + 1
        else:
            i += 1
    return ranges


def normalize_gate_state_comments(lines, vocab):
    """[5] 在 gate 函数体内，把内容为单个状态名的整行注释补上 `_` 前缀。"""
    token_re = re.compile(r"^(\s*)-- ([0-9A-Za-z][0-9A-Za-z_]*)\s*$")
    changed = []
    for start, end in gate_ranges(lines):
        for idx in range(start + 1, end):
            content, eol = strip_eol(lines[idx])
            m = token_re.match(content)
            if m and m.group(2) in vocab:
                new_content = m.group(1) + "-- _" + m.group(2)
                changed.append((idx + 1, content, new_content))
                lines[idx] = new_content + eol
    return lines, changed


def report(title, changes):
    print("\n== %s : %d 处 ==" % (title, len(changes)))
    for line_no, old, new in changes:
        if new is None:
            print("  L%d  - %s   [删除整行]" % (line_no, old))
        else:
            print("  L%d  - %s" % (line_no, old))
            print("  L%d  + %s" % (line_no, new))


def main():
    lines = read_lines(LEFT_PATH)
    original_count = len(lines)
    all_reports = []

    lines, c1 = fix_dup_sub_obj_table(lines)
    all_reports.append(("[1] 重复分组头删除", c1))

    lines, c2 = fix_typos(lines)
    all_reports.append(("[2] 拼写修正", c2))

    lines, c3 = fix_forward_draw_loop_comments(lines)
    all_reports.append(("[3] 正序draw循环错注释删除", c3))

    lines, c4 = fix_aim_process_comment(lines)
    all_reports.append(("[4] aim_process 注释改4项", c4))

    vocab = build_state_vocab(lines)
    lines, c5 = normalize_gate_state_comments(lines, vocab)
    all_reports.append(("[5] gate 状态名注释补下划线", c5))

    for title, changes in all_reports:
        report(title, changes)

    write_lines(LEFT_PATH, lines)
    print("\n行数: %d -> %d" % (original_count, len(lines)))
    print("已写入: %s" % LEFT_PATH)

    # 复核：gate 函数体内是否仍有未加下划线的状态名注释
    leftover = []
    token_re = re.compile(r"^(\s*)-- ([0-9A-Za-z][0-9A-Za-z_]*)\s*$")
    for start, end in gate_ranges(lines):
        for idx in range(start + 1, end):
            content, _ = strip_eol(lines[idx])
            m = token_re.match(content)
            if m and m.group(2) in vocab:
                leftover.append((idx + 1, content))
    if leftover:
        print("警告：仍有 %d 处 gate 内状态名注释未加下划线：" % len(leftover))
        for ln, c in leftover:
            print("  L%d  %s" % (ln, c))
    else:
        print("复核通过：gate 内已无未加下划线的状态名注释。")


if __name__ == "__main__":
    sys.exit(main())

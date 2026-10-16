# -*- coding: utf-8 -*-
"""
检查 / 规范 Lua 注释中的空格：英文「标签型」注释内的空格统一替换为下划线。

处理范围：scenes/ 与 update_general_use_functions/ 下所有 .lua 文件。

规则：
[1] 行注释 `--` 之后的内容（去掉首尾空白）若仅由 ASCII 字母/数字/下划线组成的单词构成、
    词与词之间是**单个**普通空格，则视为「英文标签型注释」，
    把词间空格替换为下划线（例：`-- apply heat gain` -> `-- apply_heat_gain`）。
[2] 以下注释一律保持原样（不改动），并在报告里分类统计 / 单列：
    含非 ASCII（中文等）的注释；
    含运算符 / 括号 / 引号 / 逗号等标点的注释（代码片段、被注释掉的代码）；
    含纯数字词的注释（帧数 / 数值列表，如 `-- 0 30 45 60 105 120 150`）；
    以 Lua 代码关键字开头的注释（被注释掉的代码，如 `-- return false`）；
    `--` 之后缩进 ≥2 个空格或含制表符的注释（表格列头 / 被注释掉的缩进代码）；
    标签内容含连续多个空格的注释（需人工确认，列在 C 段）；
    长注释 `--[[ ]]`、空注释、纯符号注释、已经不含空格的注释。
说明：
- 该变换是等长替换（空格 -> 下划线），不会改变任何行的长度与对齐，也不改变运行逻辑；
- 只改动注释内容，代码/字符串/长字符串一律不碰（基于 Lua 词法扫描定位注释）。

用法:
    python tools/check_comment_underscore.py          # 只检查并输出报告
    python tools/check_comment_underscore.py --fix    # 检查并修复
输出: 控制台摘要 + tools/comment_underscore_report.txt 详细报告

--fix 的安全性：修复前后对比 token 序列（kind + text）：非注释 token 必须完全一致，
注释 token 必须满足「去掉空格与下划线后内容相同」（即只做了空格 <-> 下划线互换），
不一致则抛错中止。
"""
import io
import os
import re
import sys

ROOT = r"H:\_love\BLAZBLUE_STRIVE"
REPORT_PATH = os.path.join(ROOT, "tools", "comment_underscore_report.txt")
TARGET_DIRS = ("scenes", "update_general_use_functions")
SKIP_DIRS = {".git", "build", "node_modules", "__pycache__"}

# 单词 = ASCII 字母/数字/下划线
WORD = r"[A-Za-z0-9_]+"
LABEL_RE = re.compile(WORD + r"(?: " + WORD + r")+\Z")          # 标签型：单空格分隔
LABEL_MULTI_SPACE_RE = re.compile(WORD + r"(?:  +" + WORD + r")+\Z")  # 同上但含连续多空格
SINGLE_WORD_RE = re.compile(WORD + r"\Z")
WORD_SPACE_RE = re.compile(r"(?<=[A-Za-z0-9_]) (?=[A-Za-z0-9_])")
HAS_LETTER_RE = re.compile(r"[A-Za-z]")

# 出现在注释里的标点 -> 视为代码片段 / 非标签注释
PUNCT = set("()[]{}\"'`~!@#$%^&*+-=/\\|<>,.;:?")

# 以这些词开头 -> 视为被注释掉的代码（`do` / `if` / `not` 等可能出现在标签里，不列入）
CODE_STARTERS = {
    "return", "local", "function", "end", "else", "elseif", "for", "while",
    "repeat", "until", "break", "goto", "then",
}

LONG_BRACKET_RE = re.compile(r"\[(=*)\[")
NAME_RE = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")
NUM_RE = re.compile(r"0[xX][0-9a-fA-F]+|\d+\.?\d*([eE][+-]?\d+)?|\.\d+")
KEYWORDS = set(
    "and break do else elseif end false for function goto if in local nil not or "
    "repeat return then true until while".split()
)
SYMBOLS = ["...", "..", "::", "==", "~=", "<=", ">=", "//", "<<", ">>", "->"]

REASON_OK = "已符合（无空格）"
REASON_CJK = "含非 ASCII（中文等）"
REASON_CODE = "含运算符/标点（代码片段）"
REASON_NUMERIC = "含纯数字词（帧数/数值列表）"
REASON_KEYWORD = "以代码关键字开头（被注释掉的代码）"
REASON_LONG = "长注释"
REASON_OTHER = "其他（空注释/纯符号/无法归类）"

NOTE_ALIGN = "AlignIndent"
NOTE_MULTI_SPACE = "MultiSpace"


def tokenize(src):
    """返回 [(kind, text, start, end)]，kind: name/keyword/number/string/longstring/comment/symbol"""
    tokens = []
    i = 0
    n = len(src)
    while i < n:
        c = src[i]

        if c in " \t\r\n\v\f":
            i += 1
            continue

        # 注释（必须先于 `-` 符号判断）
        if c == "-" and src.startswith("--", i):
            j = i + 2
            m = LONG_BRACKET_RE.match(src, j)
            if m:
                close = "]" + m.group(1) + "]"
                k = src.find(close, m.end())
                k = n if k < 0 else k + len(close)
            else:
                k = src.find("\n", i)
                k = n if k < 0 else k
            tokens.append(("comment", src[i:k], i, k))
            i = k
            continue

        # 短字符串
        if c in "\"'":
            j = i + 1
            while j < n:
                if src[j] == "\\":
                    j += 2
                    continue
                if src[j] == c:
                    j += 1
                    break
                if src[j] == "\n":
                    break
                j += 1
            tokens.append(("string", src[i:j], i, j))
            i = j
            continue

        # 长字符串
        if c == "[":
            m = LONG_BRACKET_RE.match(src, i)
            if m:
                close = "]" + m.group(1) + "]"
                k = src.find(close, m.end())
                k = n if k < 0 else k + len(close)
                tokens.append(("longstring", src[i:k], i, k))
                i = k
                continue

        # 数字
        if c.isdigit() or (c == "." and i + 1 < n and src[i + 1].isdigit()):
            m = NUM_RE.match(src, i)
            if m and m.end() > i:
                tokens.append(("number", m.group(0), i, m.end()))
                i = m.end()
                continue

        # 名字 / 关键字
        m = NAME_RE.match(src, i)
        if m:
            text = m.group(0)
            kind = "keyword" if text in KEYWORDS else "name"
            tokens.append((kind, text, i, m.end()))
            i = m.end()
            continue

        # 符号
        for sym in SYMBOLS:
            if src.startswith(sym, i):
                tokens.append(("symbol", sym, i, i + len(sym)))
                i += len(sym)
                break
        else:
            tokens.append(("symbol", c, i, i + 1))
            i += 1

    return tokens


def line_starts_of(src):
    starts = [0]
    for i, ch in enumerate(src):
        if ch == "\n":
            starts.append(i + 1)
    return starts


def classify_comment(text):
    """返回 (是否需替换, 需人工确认原因 或 None, 排除原因 或 None)。"""
    if text.startswith("--[[") or text.startswith("--[="):
        return False, None, REASON_LONG
    body = text[2:]
    if body.endswith("\r"):
        body = body[:-1]
    label = body.strip(" \t")
    if not label:
        return False, None, REASON_OTHER

    if SINGLE_WORD_RE.match(label):
        return False, None, REASON_OK

    is_label = LABEL_RE.match(label)
    is_multi_space = LABEL_MULTI_SPACE_RE.match(label)
    if not is_label and not is_multi_space:
        if any(ord(ch) > 127 for ch in label):
            return False, None, REASON_CJK
        if any(ch in PUNCT for ch in label):
            return False, None, REASON_CODE
        return False, None, REASON_OTHER

    # 到这里说明「只有单词 + 空格」，再逐个排除不是标签的情形
    words = label.split()
    if not all(HAS_LETTER_RE.search(w) for w in words):
        return False, None, REASON_NUMERIC
    if words[0] in CODE_STARTERS:
        return False, None, REASON_KEYWORD
    if is_multi_space:
        return False, NOTE_MULTI_SPACE, None

    lead = body[:len(body) - len(body.lstrip(" \t"))]
    if "\t" in body or len(lead) > 1:
        return False, NOTE_ALIGN, None
    return True, None, None


def check_source(src):
    """返回 (rows, notes, exclusions)：
    rows  = [(行号, 列号, 旧注释, 新注释)]   需替换
    notes = [(行号, 列号, 注释文本, 原因)]   需人工确认
    excluded = {原因: 次数}
    """
    starts = line_starts_of(src)
    rows, notes = [], []
    excluded = {}
    line = 1
    for kind, text, start, _end in tokenize(src):
        while line < len(starts) and starts[line] <= start:
            line += 1
        if kind != "comment":
            continue
        need, note, reason = classify_comment(text)
        col = start - starts[line - 1] + 1
        if need:
            new_text = WORD_SPACE_RE.sub("_", text)
            rows.append((line, col, text, new_text))
        elif note:
            notes.append((line, col, text, note))
        else:
            excluded[reason] = excluded.get(reason, 0) + 1
    return rows, notes, excluded


def fix_source(src):
    """把标签型注释内的空格替换为下划线，返回 (新文本, 改动条数)。"""
    tokens = tokenize(src)
    out = []
    pos = 0
    changes = 0
    for kind, text, start, end in tokens:
        if kind != "comment":
            continue
        need, _note, _reason = classify_comment(text)
        if not need:
            continue
        out.append(src[pos:start])
        out.append(WORD_SPACE_RE.sub("_", text))
        pos = end
        changes += 1
    out.append(src[pos:])
    return "".join(out), changes


def canon_comment(text):
    """注释的规范化比较键：去掉空格与下划线，用于证明只做了空格 <-> 下划线互换。"""
    return text.replace(" ", "").replace("_", "")


def tokens_equivalent(a, b):
    ta, tb = tokenize(a), tokenize(b)
    if len(ta) != len(tb):
        return False
    for (_ka, text_a, _sa, _ea), (_kb, text_b, _sb, _eb) in zip(ta, tb):
        if _ka != _kb:
            return False
        if _ka == "comment":
            if canon_comment(text_a) != canon_comment(text_b):
                return False
        elif text_a != text_b:
            return False
    return True


def collect_files():
    paths = []
    for target in TARGET_DIRS:
        base = os.path.join(ROOT, target)
        for dirpath, dirnames, filenames in os.walk(base):
            dirnames[:] = sorted(d for d in dirnames if d not in SKIP_DIRS)
            for name in sorted(filenames):
                if name.endswith(".lua"):
                    paths.append(os.path.join(dirpath, name))
    return paths


def main():
    do_fix = "--fix" in sys.argv
    files = collect_files()
    results = {}   # rel -> [(行, 列, 旧, 新)]
    note_rows = []
    excl_total = {}
    fixed_files = 0
    replaced_total = 0

    for path in files:
        rel = os.path.relpath(path, ROOT).replace("\\", "/")
        with io.open(path, "r", encoding="utf-8", newline="") as f:
            src = f.read()

        if do_fix:
            fixed, changes = fix_source(src)
            if changes:
                if not tokens_equivalent(src, fixed):
                    raise RuntimeError("token 序列不一致，已中止：%s" % path)
                with io.open(path, "w", encoding="utf-8", newline="") as f:
                    f.write(fixed)
                fixed_files += 1
                replaced_total += changes
                src = fixed

        rows, notes, excluded = check_source(src)
        for line, col, old, new in rows:
            results.setdefault(rel, []).append((line, col, old, new))
        for line, col, text, note in notes:
            note_rows.append((rel, line, col, text, note))
        for reason, count in excluded.items():
            excl_total[reason] = excl_total.get(reason, 0) + count

    total_rows = sum(len(v) for v in results.values())

    lines = []
    lines.append("Lua 注释下划线检查报告（英文标签型注释内的空格 -> 下划线）")
    lines.append("规则：`--` 注释内容若由 ASCII 单词（字母/数字/下划线）构成且词间为单个空格，"
                 "则词间空格替换为下划线")
    lines.append("      其余注释（含非 ASCII / 运算符标点 / 纯数字词 / 代码关键字开头 / "
                 "缩进对齐 / 长注释）保持原样")
    lines.append("检查范围：%d 个 Lua 文件（%s）" % (len(files), "、".join(d + "/" for d in TARGET_DIRS)))
    if do_fix:
        lines.append("已修复文件：%d 个（替换 %d 处；全部通过 token 序列一致性校验）"
                     % (fixed_files, replaced_total))
        lines.append("下表为修复后的复核结果（A 段应为空）")
    lines.append("")
    lines.append("=" * 104)
    lines.append("A. 需要替换（英文标签型注释含空格）  (%d 处)" % total_rows)
    lines.append("=" * 104)
    lines.append("")
    if not results:
        lines.append("  （无）")
        lines.append("")
    for rel in sorted(results):
        rows = results[rel]
        lines.append("  %s  (%d 处)" % (rel, len(rows)))
        for line, col, old, new in rows:
            lines.append("      %6d:%-4d  %s  ->  %s" % (line, col, old.strip(), new.strip()))
        lines.append("")

    lines.append("=" * 104)
    lines.append("B. 保持原样（分类统计）")
    lines.append("=" * 104)
    lines.append("")
    for reason in (REASON_OK, REASON_CJK, REASON_CODE, REASON_LONG,
                   REASON_NUMERIC, REASON_KEYWORD, REASON_OTHER):
        lines.append("  %s：%d 处" % (reason, excl_total.get(reason, 0)))
    lines.append("")

    if note_rows:
        lines.append("=" * 104)
        lines.append("C. 需人工确认（未替换）  (%d 处)" % len(note_rows))
        lines.append("=" * 104)
        lines.append("")
        lines.append("  [%s] `--` 后缩进 ≥2 空格或含制表符：表格列头 / 被注释掉的缩进代码"
                     % NOTE_ALIGN)
        lines.append("  [%s] 标签内容含连续多个空格：对齐写法，无法确认为单个标签"
                     % NOTE_MULTI_SPACE)
        lines.append("")
        for rel, line, col, text, note in note_rows:
            lines.append("  %s  %6d:%-4d  [%s]  %s" % (rel, line, col, note, text.strip()))
        lines.append("")

    lines.append("TOTAL: A=%d  C=%d" % (total_rows, len(note_rows)))

    with io.open(REPORT_PATH, "w", encoding="utf-8", newline="") as f:
        f.write("\n".join(lines) + "\n")

    print("检查文件：%d 个" % len(files))
    if do_fix:
        print("已修复文件：%d 个（替换 %d 处）" % (fixed_files, replaced_total))
    print("A. 需要替换：%d 处" % total_rows)
    for rel in sorted(results):
        print("    %s：%d 处" % (rel, len(results[rel])))
    for reason in (REASON_OK, REASON_CJK, REASON_CODE, REASON_LONG,
                   REASON_NUMERIC, REASON_KEYWORD, REASON_OTHER):
        print("B. %s：%d 处" % (reason, excl_total.get(reason, 0)))
    print("C. 需人工确认：%d 处" % len(note_rows))
    print("报告：%s" % os.path.relpath(REPORT_PATH, ROOT).replace("\\", "/"))


if __name__ == "__main__":
    main()

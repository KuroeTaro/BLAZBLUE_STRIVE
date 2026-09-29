# -*- coding: utf-8 -*-
"""
检查全项目 Lua 文件的运算符空格格式。

排除文件：dkjson.lua / lovebird.lua / lume.lua / lurker.lua（第三方库）

规则：
[1] `+` `-`（二元运算符）左右各需恰好一个空格；
    若运算符右侧紧接着换行，则右侧不加空格（即不留行尾空格）。
[2] `*` `/` 左右不能有空格。
[3] `=` 与 `==`（各自视为一个整体）左右各需恰好一个空格；
    右侧紧接着换行时不加空格（与规则 [4] 一致）。
[4] 任何一行都不允许以空白字符结尾（行尾不留空格 / 制表符）。
[5] 代码行内不允许出现「无意义的连续多个空格」（两个及以上空格/制表符）；
    即行内、非缩进、非行尾的多空格。字符串/注释内容与 ALIGN_KEEP 保留行除外。

说明：
- 只检查代码中的运算符。字符串字面量、长字符串、注释（`--` 行注释与 `--[[ ]]` 长注释）
  内部的符号属于内容，一律不检查。
- 一元 `+` `-`（如 `-1`、`{-1,-2}`、`a * -b`、`return -x`）不适用规则 [1]，直接跳过。
- 运算符位于行尾续写时，左侧按“缩进”看待，不要求恰好一个空格。
- 规则 [3] 只针对单个 `=` 与 `==`；`~=` `<=` `>=` 不在范围内。
- 规则 [4] 不处理长字符串内部的行尾空白（改了会改变字符串内容），只在报告中列出。
- ALIGN_KEEP 中登记的「已批准对齐行」不修改，只在报告中单列展示。
- 规则 [5] 不算入单个制表符分隔（如 `if \tX`）——那类只在报告末尾作为附注列出。

用法:
    python tools/check_operator_spacing.py          # 只检查并输出报告
    python tools/check_operator_spacing.py --fix    # 检查并修复（只改空白）
输出:
    控制台摘要 + tools/operator_spacing_report.txt 详细报告

--fix 的安全性：修复前会对比修复前后的 token 序列（kind + text），
若不一致则抛错中止；一致说明只改动了 token 之间的空白，语义不变。
"""
import io
import os
import re
import sys

ROOT = r"H:\_love\BLAZBLUE_STRIVE"
REPORT_PATH = os.path.join(ROOT, "tools", "operator_spacing_report.txt")
EXCLUDE_BASENAMES = {"dkjson.lua", "lovebird.lua", "lume.lua", "lurker.lua"}
SKIP_DIRS = {".git", "build", "node_modules", "__pycache__"}

# 已批准保留 `=` 列对垂的行（1-based，含端点）。
# 除这些行外，其余位置（包括其它对齐写法）一律按规则修正。
ALIGN_KEEP = {
    "scenes/char_select_scene/state_machine.lua": [(54, 58), (62, 66)],
}
KEPT_DETAIL = "保留对齐（已批准，不修改）"
NOTE_TAB_DETAIL = "行内单个制表符分隔（附注，需人工确认）"


def align_keep_lines(rel_path):
    """返回该文件需要保留 `=` 列对齐的行号集合（无则空集）。"""
    out = set()
    for lo, hi in ALIGN_KEEP.get(rel_path, ()):
        out.update(range(lo, hi + 1))
    return out

KEYWORDS = set(
    "and break do else elseif end false for function goto if in local nil not or "
    "repeat return then true until while".split()
)

# 多字符符号必须排在对应的单字符符号之前
SYMBOLS = [
    "...", "..", "::", "==", "~=", "<=", ">=", "<<", ">>", "//",
    "+", "-", "*", "/", "%", "^", "#", "&", "|", "<", ">", "=",
    "(", ")", "{", "}", "[", "]", ";", ":", ",", ".",
]

NUM_RE = re.compile(
    r"0[xX][0-9a-fA-F]*(?:\.[0-9a-fA-F]*)?(?:[pP][+-]?[0-9]+)?"
    r"|\d*\.?\d+(?:[eE][+-]?[0-9]+)?"
)
NAME_RE = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")
LONG_BRACKET_RE = re.compile(r"\[(=*)\[")

# 可以出现在“值”末尾的 token —— 用于判定 `+` `-` 是二元还是一元
VALUE_END_SYMBOLS = {")", "]", "}", "..."}
VALUE_END_KINDS = {"name", "number", "string", "longstring"}


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


def is_binary_operator(tokens, idx):
    """通过前一个有效 token 判断 `+`/`-` 是二元还是一元。"""
    j = idx - 1
    while j >= 0 and tokens[j][0] == "comment":
        j -= 1
    if j < 0:
        return False
    kind, text = tokens[j][0], tokens[j][1]
    if kind in VALUE_END_KINDS:
        return True
    if kind == "symbol":
        return text in VALUE_END_SYMBOLS
    return False


def line_of(src, line_starts, index):
    lo, hi = 0, len(line_starts) - 1
    while lo < hi:
        mid = (lo + hi + 1) // 2
        if line_starts[mid] <= index:
            lo = mid
        else:
            hi = mid - 1
    return lo + 1, index - line_starts[lo] + 1


def _space_run_left(src, i):
    """返回运算符左侧连续空格数量（仅空格，不含制表符）。"""
    k = i
    while k - 1 >= 0 and src[k - 1] == " ":
        k -= 1
    return i - k


def _left_is_indent(src, i):
    """运算符左侧是否只有缩进（行首到运算符之间全是空格）。"""
    k = i
    while k - 1 >= 0 and src[k - 1] == " ":
        k -= 1
    return k == 0 or src[k - 1] in "\r\n"


def _space_run_right(src, i):
    """返回运算符右侧连续空格/制表符数量。"""
    k = i
    n = len(src)
    while k < n and src[k] in " \t":
        k += 1
    return k - i


def _check_one_space(src, line_starts, start, end, rule, violations, keep=False):
    """规则 [1]/[3]：运算符左右各需恰好 1 个空格（右侧为换行时不要求）。"""
    line, col = line_of(src, line_starts, start)

    # ---- 左侧 ----
    if start > 0 and src[start - 1] == "\t":
        violations.append((line, col, rule, "左侧是制表符，应为 1 个空格"))
    elif start == 0 or src[start - 1] not in " \r\n":
        violations.append((line, col, rule, "左侧缺少空格，应为 1 个空格"))
    elif src[start - 1] == " " and not _left_is_indent(src, start):
        if _space_run_left(src, start) != 1:
            detail = KEPT_DETAIL if keep else "左侧多于 1 个空格"
            violations.append((line, col, rule, detail))

    # ---- 右侧 ----
    if end < len(src):
        if src[end] in "\r\n":
            return  # 行尾续写，不要求空格
        if src[end] == "\t":
            violations.append((line, col, rule, "右侧是制表符，应为 1 个空格"))
        elif src[end] != " ":
            violations.append((line, col, rule, "右侧缺少空格，应为 1 个空格"))
        else:
            run = _space_run_right(src, end)
            after = src[end + run] if end + run < len(src) else ""
            if after in "\r\n" or after == "":
                violations.append((line, col, rule, "行尾多余空格，应删除"))
            elif run != 1:
                violations.append((line, col, rule, "右侧多于 1 个空格"))


def _check_tight(src, line_starts, start, end, rule, violations):
    """规则 [2]：运算符左右不能有空格。"""
    line, col = line_of(src, line_starts, start)

    # ---- 左侧 ----
    if start > 0 and src[start - 1] in " \t":
        if _left_is_indent(src, start):
            violations.append((line, col, rule, "运算符独占行首（缩进），需人工确认"))
        else:
            violations.append((line, col, rule, "左侧不应有空格"))

    # ---- 右侧 ----
    if end < len(src) and src[end] in " \t":
        run = _space_run_right(src, end)
        after = src[end + run] if end + run < len(src) else ""
        if after in "\r\n" or after == "":
            violations.append((line, col, rule, "行尾多余空格，应删除"))
        else:
            violations.append((line, col, rule, "右侧不应有空格"))


def _string_ranges(tokens):
    """字符串 / 长字符串占据的区间（内容不可改动）。"""
    return [(t[2], t[3]) for t in tokens if t[0] in ("string", "longstring")]


TRAILING_WS_RE = re.compile(r"[ \t]+(?=\r\n|\n|\r|\Z)")


def check_trailing_space(src, tokens, line_starts):
    """规则 [4]：行尾不允许残留空白（长字符串内部除外，单独列出）。"""
    protected = _string_ranges(tokens)
    out = []
    for m in TRAILING_WS_RE.finditer(src):
        s = m.start()
        line, col = line_of(src, line_starts, s)
        if any(ps <= s < pe for ps, pe in protected):
            out.append((line, col, 4, "长字符串内部的行尾空白（属字符串内容，未处理）"))
        else:
            out.append((line, col, 4, "行尾残留空白，应删除"))
    return out


INNER_WS_RE = re.compile(r"[ \t]+")


def _inner_ws_runs(src, tokens, line_starts, keep_lines):
    """产出「行内、非缩进、非行尾、非字符串/注释内容、非保留对齐」的空白段。

    产出元组：(s, e, line, col, run)，s/e 为源码下标，run 为空白文本。
    检查与修复共用同一套排除条件，避免两边判定不一致。
    """
    protected = _string_ranges(tokens)
    protected += [(t[2], t[3]) for t in tokens if t[0] == "comment"]

    for m in INNER_WS_RE.finditer(src):
        s, e = m.start(), m.end()
        if s == 0 or src[s - 1] in "\r\n":
            continue  # 行首缩进
        if e >= len(src) or src[e] in "\r\n":
            continue  # 行尾留白，归规则 [4]
        if any(ps <= s < pe for ps, pe in protected):
            continue  # 字符串 / 注释内容

        line, col = line_of(src, line_starts, s)
        if line in keep_lines:
            continue  # 已批准保留的对齐
        yield s, e, line, col, m.group(0)


def check_inner_whitespace(src, tokens, line_starts, keep_lines):
    """规则 [5]：行内无意义的连续多个空格（≥2 个字符）。

    行内孤立的单个制表符不算规则 [5]，单独作为附注返回。
    """
    out = []
    for _s, _e, line, col, run in _inner_ws_runs(src, tokens, line_starts, keep_lines):
        if len(run) >= 2:
            out.append((line, col, 5, "行内无意义的连续多个空格（%d 个字符）" % len(run)))
        elif run == "\t":
            out.append((line, col, 5, NOTE_TAB_DETAIL))
    return out


def inner_ws_edits(src, tokens, line_starts, keep_lines):
    """规则 [5] 的修复：把行内连续多个空格塔缩为 1 个空格。"""
    return [(s, e, " ")
            for s, e, _line, _col, run in _inner_ws_runs(src, tokens, line_starts, keep_lines)
            if len(run) >= 2]


def check_source(src, rel_path=None):
    """返回违规列表 [(line, col, rule, detail)]。"""
    tokens = tokenize(src)
    line_starts = [0]
    for m in re.finditer("\n", src):
        line_starts.append(m.end())
    keep_lines = align_keep_lines(rel_path) if rel_path else set()

    violations = []

    for idx, (kind, text, start, end) in enumerate(tokens):
        if kind != "symbol":
            continue

        if text in ("+", "-"):
            if not is_binary_operator(tokens, idx):
                continue
            _check_one_space(src, line_starts, start, end, 1, violations)
        elif text in ("=", "=="):
            line, _c = line_of(src, line_starts, start)
            _check_one_space(src, line_starts, start, end, 3, violations,
                             keep=line in keep_lines)
        elif text in ("*", "/", "//"):
            _check_tight(src, line_starts, start, end, 2, violations)

    violations.extend(check_trailing_space(src, tokens, line_starts))
    violations.extend(check_inner_whitespace(src, tokens, line_starts, keep_lines))
    violations.sort(key=lambda v: (v[0], v[1], v[2]))
    return violations


def desired_spacing(src, tokens, idx, keep_align=False):
    """返回该运算符需要施加的空白编辑 [(start, end, replacement)]。"""
    kind, text, start, end = tokens[idx]
    if kind != "symbol":
        return []

    n = len(src)
    edits = []

    # 左侧空白区间 [ls, start)
    ls = start
    while ls - 1 >= 0 and src[ls - 1] in " \t":
        ls -= 1
    left_is_indent = ls == 0 or src[ls - 1] in "\r\n"

    # 右侧空白区间 [end, re)
    re = end
    while re < n and src[re] in " \t":
        re += 1
    after = src[re] if re < n else ""

    if text in ("*", "/", "//"):
        if not left_is_indent and src[ls:start] != "":
            edits.append((ls, start, ""))
        if src[end:re] != "":
            edits.append((end, re, ""))
        return edits

    if text in ("+", "-") and not is_binary_operator(tokens, idx):
        return []
    if text not in ("+", "-", "=", "=="):
        return []

    # 规则 [1]/[3]：左右各 1 个空格（右侧为换行时不加）
    if not left_is_indent:
        cur = src[ls:start]
        if cur == "":
            edits.append((ls, start, " "))          # 缺空格 -> 补 1 个
        elif cur == " ":
            pass                                    # 已符合
        elif keep_align and set(cur) == {" "}:
            pass                                    # 已批准保留的对齐写法
        else:
            edits.append((ls, start, " "))          # 制表符 / 多空格 -> 1 个空格
    want = "" if after in ("\r", "\n", "") else " "
    if src[end:re] != want:
        edits.append((end, re, want))

    return edits


def trailing_space_edits(src, tokens):
    """规则 [4]：删除行尾空白（长字符串内部除外）。"""
    protected = _string_ranges(tokens)
    edits = []
    for m in TRAILING_WS_RE.finditer(src):
        s, e = m.start(), m.end()
        if any(ps <= s < pe for ps, pe in protected):
            continue
        edits.append((s, e, ""))
    return edits


def fix_source(src, tokens, rel_path=None):
    """应用空白规范化，返回 (新源码, 是否有改动)。"""
    line_starts = [0]
    for m in re.finditer("\n", src):
        line_starts.append(m.end())
    keep_lines = align_keep_lines(rel_path) if rel_path else set()

    edits = []
    for idx in range(len(tokens)):
        line, _c = line_of(src, line_starts, tokens[idx][2])
        edits.extend(desired_spacing(src, tokens, idx, keep_align=line in keep_lines))
    edits.extend(trailing_space_edits(src, tokens))

    # 规则 [5]：与规则 [1]~[4] 命中同一区间时，以规则 [1]~[4] 为准
    occupied = set((s, e) for s, e, _rep in edits)
    edits.extend(e for e in inner_ws_edits(src, tokens, line_starts, keep_lines)
                 if (e[0], e[1]) not in occupied)

    if not edits:
        return src, False

    # 去重后按起点排序（长区间在前）；允许“被同内容区间完全覆盖”的重复
    ordered = sorted(set(edits), key=lambda e: (e[0], -e[1]))
    applied = []
    for e in ordered:
        covering = [a for a in applied if a[0] <= e[0] and e[1] <= a[1]]
        if covering:
            if any(a[2] != e[2] for a in covering):
                raise RuntimeError("修复区间内容冲突：%r" % (e,))
            continue
        if any(e[0] < a[1] and a[0] < e[1] for a in applied):
            raise RuntimeError("修复区间重叠：%r" % (e,))
        applied.append(e)

    applied.sort(key=lambda e: e[0])
    out = []
    pos = 0
    for s, e, rep in applied:
        out.append(src[pos:s])
        out.append(rep)
        pos = e
    out.append(src[pos:])
    return "".join(out), True


def tokens_equal(a, b):
    """证明只改了空白：非注释 token 需 kind+text 全等；注释因行尾空白被删除而放宽为只比对 kind。"""
    ta = [(k, t if k != "comment" else "") for k, t, _s, _e in tokenize(a)]
    tb = [(k, t if k != "comment" else "") for k, t, _s, _e in tokenize(b)]
    return ta == tb


def collect_files():
    paths = []
    for dirpath, dirnames, filenames in os.walk(ROOT):
        dirnames[:] = sorted(d for d in dirnames if d not in SKIP_DIRS)
        for name in sorted(filenames):
            if not name.endswith(".lua"):
                continue
            if name in EXCLUDE_BASENAMES:
                continue
            paths.append(os.path.join(dirpath, name))
    return paths


def main():
    do_fix = "--fix" in sys.argv
    files = collect_files()
    results = {}
    kept_rows = []
    note_rows = []
    fixed_files = 0
    for path in files:
        rel = os.path.relpath(path, ROOT).replace("\\", "/")
        with io.open(path, "r", encoding="utf-8", newline="") as f:
            src = f.read()

        if do_fix:
            fixed, changed = fix_source(src, tokenize(src), rel)
            if changed:
                if not tokens_equal(src, fixed):
                    raise RuntimeError("token 序列不一致，已中止：%s" % path)
                fixed_files += 1
                with io.open(path, "w", encoding="utf-8", newline="") as f:
                    f.write(fixed)
                src = fixed

        found = check_source(src, rel)
        real = [v for v in found if v[3] not in (KEPT_DETAIL, NOTE_TAB_DETAIL)]
        src_lines = src.splitlines()
        for v in found:
            if v[3] == KEPT_DETAIL:
                kept_rows.append((rel, v[0], v[1], src_lines[v[0] - 1]))
            elif v[3] == NOTE_TAB_DETAIL:
                note_rows.append((rel, v[0], v[1], src_lines[v[0] - 1]))
        if real:
            results[path] = (src, real)

    counts = {}
    for _s, v in results.values():
        for _x in v:
            counts[_x[2]] = counts.get(_x[2], 0) + 1
    rule1, rule2 = counts.get(1, 0), counts.get(2, 0)
    rule3, rule4 = counts.get(3, 0), counts.get(4, 0)
    rule5 = counts.get(5, 0)

    rule_desc = [
        "规则 [1] `+` `-`（二元）左右各 1 个空格；右侧为换行时不加空格",
        "规则 [2] `*` `/` 左右不能有空格",
        "规则 [3] `=` `==` 左右各 1 个空格；右侧为换行时不加空格",
        "规则 [4] 行尾不允许残留空白（空格 / 制表符）",
        "规则 [5] 行内不允许无意义的连续多个空格（≥2 个字符；字符串/注释内容除外）",
    ]
    count_desc = ("违规文件：%d 个 | 规则[1]：%d 处 | 规则[2]：%d 处 | 规则[3]：%d 处 | 规则[4]：%d 处"
                  " | 规则[5]：%d 处") % (len(results), rule1, rule2, rule3, rule4, rule5)

    lines = []
    lines.append("Lua 格式检查报告（运算符空格 + 行尾空白）")
    lines.extend(rule_desc)
    lines.append("检查范围：%d 个 Lua 文件（已排除 dkjson / lovebird / lume / lurker）" % len(files))
    if do_fix:
        lines.append("已修复文件：%d 个（全部通过 token 序列一致性校验）" % fixed_files)
    lines.append(count_desc)
    lines.append("")
    if kept_rows:
        lines.append("保留 `=` 列对齐（已批准，不修改）：%d 处" % len(kept_rows))
        for rel, line, col, content in kept_rows:
            lines.append("    %s:%d:%d  %s" % (rel, line, col, content))
        lines.append("")
    if note_rows:
        lines.append("附注：行内单个制表符分隔（不计入违规）：%d 处" % len(note_rows))
        for rel, line, col, content in note_rows:
            lines.append("    %s:%d:%d  %s" % (rel, line, col, content))
        lines.append("")

    for path in sorted(results):
        src, found = results[path]
        rel = os.path.relpath(path, ROOT).replace("\\", "/")
        src_lines = src.splitlines()
        lines.append("%s  (%d 处)" % (rel, len(found)))
        for line, col, rule, detail in found:
            content = src_lines[line - 1] if line - 1 < len(src_lines) else ""
            caret = " " * (col - 1) + "^"
            lines.append("    %d:%d  [规则%d] %s" % (line, col, rule, detail))
            lines.append("        %s" % content)
            lines.append("        %s" % caret)
        lines.append("")

    with io.open(REPORT_PATH, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    # 控制台摘要
    print("检查范围：%d 个 Lua 文件（已排除 dkjson / lovebird / lume / lurker）" % len(files))
    if do_fix:
        print("已修复文件：%d 个（全部通过 token 序列一致性校验）" % fixed_files)
    print(count_desc)
    if kept_rows:
        print("保留 `=` 列对齐（已批准，不修改）：%d 处" % len(kept_rows))
    if note_rows:
        print("附注：行内单个制表符分隔（不计入违规）：%d 处" % len(note_rows))
    by_dir = {}
    for path in results:
        rel = os.path.relpath(path, ROOT).replace("\\", "/")
        d = os.path.dirname(rel)
        by_dir[d] = by_dir.get(d, 0) + len(results[path][1])
    for d in sorted(by_dir, key=lambda x: -by_dir[x]):
        print("  %-58s %4d" % (d + "/", by_dir[d]))
    print("详细报告：%s" % os.path.relpath(REPORT_PATH, ROOT))


if __name__ == "__main__":
    main()

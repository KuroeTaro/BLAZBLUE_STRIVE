# -*- coding: utf-8 -*-
"""
函数调用「实参表换行格式」检查报告 —— 扫 scenes/game_scene 下全部 Lua 文件。

判定口径（**核心**）:
  **按独特函数各自自洽** —— 同一个函数的所有换行调用点，必须使用同一种缩进规则；
  不同函数之间各用各的规则是允许的，不要求全局统一。
  缩进规则 = 首行是否止于 `(` + 续行缩进增量 + `)` 的位置/缩进
            （「每参一行 / 每行多参」不计入规则 —— 那是贪心填充的结果，
              实参一长就会自然退化，不算规则不一致）

  例外 = 同一函数混用了 >=2 种缩进规则。

参考基准（不做强制，只在报告里作对照）:
  tools/wrap_arg_lists.py R1/R1.4（2026-09-29 用户裁决）:
    R1   0 参 / 1 参 -> 恒单行（1 参仅当实参表自身放不下 --max-len 才回退三行）
         >=2 参 -> 单行放得下（<= --max-len）就单行，否则换行
    R1.4 换行形态 -> 首行止于 `(`；续行缩进 +1 单位；贪心填到 --max-len；`)` 独占一行

本工具**只读**，不改任何代码；产出 tools/call_wrap_report.txt。

其它口径:
  - 只统计带括号的调用（声明形参表、`f{...}`/`f"..."` 语法糖不计）
  - 「单行」= 实参表（被调表达式 + 括号内）全部落在同一行
  - 「自身长度」= 调用起始列 + 实参表折叠成单行后的字符数（判断"放得下吗"）
  - 「物理行」= 该调用所涉行的实际最长字符数（含同行的兄弟表达式）
  - 被调表达式按完整前缀归类（`math.min` / `obj_VFX["draw_sync"]` / `f(x)` 分开算）

用法:
    python tools/check_call_wrap.py                # 生成报告
    python tools/check_call_wrap.py --max-len 120  # 改单行上限
"""
import collections
import io
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import check_operator_spacing as C  # noqa: E402

ROOT = C.ROOT
SCENE_DIR = os.path.join(ROOT, "scenes", "game_scene")
REPORT_PATH = os.path.join(ROOT, "tools", "call_wrap_report.txt")
MAX_LEN = 120

VALUE_END_KINDS = {"name", "number", "string", "longstring"}
VALUE_END_SYMBOLS = {")", "]", "}", "..."}
NO_SPACE_AFTER = {"(", "[", "{", ".", ":", ",", ";"}
NO_SPACE_BEFORE = {")", "]", "}", ",", ";", ".", ":"}

ARG_BUCKETS = ["0", "1", "2", "3", "4", "5", "6", "7+"]
SHAPES = ["single", "OC-", "OCV", "OCG", "Oc-", "OcV", "OcG",
          "oCV", "oCG", "oC-", "ocV", "ocG", "oc-", "OCc"]
SHAPE_NAME = {
    "single": "单行",
    "OC-": "R1.4 三行(单实参)",
    "OCV": "R1.4: 首行止于`(` + 每参一行 + `)`独占",
    "OCG": "R1.4: 首行止于`(` + 每行多参 + `)`独占",
    "Oc-": "首行止于`(` + `)`贴末参",
    "OcV": "首行止于`(` + 每参一行 + `)`贴末参",
    "OcG": "首行止于`(` + 每行多参 + `)`贴末参",
    "oCV": "首参留在`(`行 + `)`独占",
    "oCG": "首参留在`(`行 + `)`独占(违 R1.4)",
    "oC-": "首参留在`(`行 + `)`独占",
    "ocV": "首参留在`(`行 + `)`贴末参",
    "ocG": "首参留在`(`行 + `)`贴末参",
    "oc-": "首参留在`(`行 + `)`贴末参",
    "OCc": "首行止于`(` + `)`独占",
}


def sig(tokens, idx):
    """上一个非注释 token 的下标。"""
    j = idx
    while j >= 0 and tokens[j][0] == "comment":
        j -= 1
    return j


def is_declaration_paren(tokens, open_idx):
    """`(` 是否开在函数定义的形参表上。"""
    j = sig(tokens, open_idx - 1)
    if j < 0:
        return False
    if tokens[j][0] == "keyword" and tokens[j][1] == "function":
        return True
    k = j
    while k - 1 >= 0 and tokens[k - 1][1] == ".":
        k -= 2
    k = sig(tokens, k - 1)
    return k >= 0 and tokens[k][0] == "keyword" and tokens[k][1] == "function"


def is_call_paren(tokens, open_idx):
    """`(` 是否为调用实参表（前一 token 是"值结尾"）。"""
    j = sig(tokens, open_idx - 1)
    if j < 0:
        return False
    kind, text = tokens[j][0], tokens[j][1]
    if kind in VALUE_END_KINDS:
        return True
    return kind == "symbol" and text in VALUE_END_SYMBOLS


def match_paren(tokens, open_idx):
    depth = 0
    for k in range(open_idx, len(tokens)):
        kind, text = tokens[k][0], tokens[k][1]
        if kind != "symbol":
            continue
        if text in "({[":
            depth += 1
        elif text in ")}]":
            depth -= 1
            if depth == 0:
                return k
    return None


def split_args(tokens, open_idx, close_idx):
    """按顶层逗号切实参；逗号须同时在"括号深度 0"与"语句块深度 0"。

    语句块深度用于跳过匿名 `function ... end` 实参体内的逗号。
    """
    args = []
    bracket = 0
    block = 0
    pending_do = False
    start = open_idx + 1
    saw_any = False
    for k in range(open_idx + 1, close_idx):
        kind, text = tokens[k][0], tokens[k][1]
        if kind == "keyword":
            if text in ("for", "while"):
                block += 1
                pending_do = True
            elif text == "do":
                if pending_do:
                    pending_do = False
                else:
                    block += 1
            elif text in ("function", "if"):
                block += 1
            elif text in ("end", "until"):
                block -= 1
            if block < 0:
                block = 0
            saw_any = True
            continue
        if kind == "comment":
            continue
        if kind == "symbol":
            if text in "({[":
                bracket += 1
            elif text in ")}]":
                bracket -= 1
            elif text == "," and bracket == 0 and block == 0:
                args.append((start, k - 1))
                start = k + 1
                saw_any = False
                continue
        saw_any = True
    if (saw_any or args) and start < close_idx:
        args.append((start, close_idx - 1))
    return args


def joined_text(tokens, a, b):
    """把 tokens[a..b] 折叠成单行文本（按仓库的逗号后不加空格等习惯）。"""
    out = []
    prev = None
    for k in range(a, b + 1):
        kind, text = tokens[k][0], tokens[k][1]
        if kind == "comment":
            continue
        if prev is not None:
            pkind, ptext = prev
            if ptext in NO_SPACE_AFTER or text in NO_SPACE_BEFORE:
                pass
            elif ptext in ("-", "#"):
                pass
            elif text == "(" and pkind in VALUE_END_KINDS:
                pass
            elif text == "[" and (pkind in VALUE_END_KINDS or ptext in (")", "]")):
                pass
            elif text in ("..", ":") or ptext == ":":
                pass
            else:
                out.append(" ")
        out.append(text)
        prev = (kind, text)
    return "".join(out)


def call_expr_start(tokens, open_idx):
    """回溯到「被调表达式」的第一个 token（处理 a.b[c]( 链）。"""
    def scroll_open(j, close_ch, open_ch):
        depth = 0
        k = j
        while k >= 0:
            t = tokens[k][1]
            if t == close_ch:
                depth += 1
            elif t == open_ch:
                depth -= 1
            if depth == 0:
                return k
            k -= 1
        return j

    j = sig(tokens, open_idx - 1)
    while j >= 0:
        kind, text = tokens[j][0], tokens[j][1]
        if text == "]":
            j = sig(tokens, scroll_open(j, "]", "[") - 1)
            continue
        if text == ")":
            j = sig(tokens, scroll_open(j, ")", "(") - 1)
            continue
        if kind in VALUE_END_KINDS:
            p = sig(tokens, j - 1)
            if p >= 0 and tokens[p][1] in (".", ":"):
                j = sig(tokens, p - 1)
                continue
        break
    return j


def line_starts_of(src):
    starts = [0]
    for m in re.finditer("\n", src):
        starts.append(m.end())
    return starts


def line_of(starts, index):
    lo, hi = 0, len(starts) - 1
    while lo < hi:
        mid = (lo + hi + 1) // 2
        if starts[mid] <= index:
            lo = mid
        else:
            hi = mid - 1
    return lo + 1, index - starts[lo] + 1


def indent_units(indent):
    """缩进折算成"4 空格 = 1 单位"。"""
    return sum(4 if ch == "\t" else 1 for ch in indent)


def analyze_file(path, rel):
    with io.open(path, "r", encoding="utf-8") as f:
        src = f.read()
    lines = src.split("\n")
    starts = line_starts_of(src)
    tokens = C.tokenize(src)
    records = []
    for i, tok in enumerate(tokens):
        if tok[0] != "symbol" or tok[1] != "(":
            continue
        if is_declaration_paren(tokens, i) or not is_call_paren(tokens, i):
            continue
        close = match_paren(tokens, i)
        if close is None:
            continue
        args = split_args(tokens, i, close)
        doc = {"path": rel, "arg_count": len(args), "lineno": line_of(starts, tok[2])[0]}
        open_line = doc["lineno"]
        close_line = line_of(starts, tokens[close][2])[0]
        span = {line_of(starts, tokens[k][2])[0]
                for k in range(i, close + 1) if tokens[k][0] != "comment"}
        doc["multiline"] = len(span) > 1
        doc["open_break"] = not any(
            tokens[k][0] != "comment" and line_of(starts, tokens[k][2])[0] == open_line
            for k in range(i + 1, close + 1)
        )
        doc["close_alone"] = not any(
            tokens[k][0] != "comment" and line_of(starts, tokens[k][2])[0] == close_line
            for k in range(i + 1, close)
        )
        arg_lines = [line_of(starts, tokens[a][2])[0] for a, b in args if a <= b]
        doc["distinct_arg_lines"] = len(set(arg_lines))
        base = indent_units(lines[open_line - 1][: len(lines[open_line - 1])
                                                 - len(lines[open_line - 1].lstrip(" \t"))])
        doc["deltas"] = sorted({indent_units(
            lines[l - 1][: len(lines[l - 1]) - len(lines[l - 1].lstrip(" \t"))]) - base
            for l in set(arg_lines)} - {0}) if arg_lines else []
        doc["close_delta"] = indent_units(
            lines[close_line - 1][: len(lines[close_line - 1])
                                  - len(lines[close_line - 1].lstrip(" \t"))]) - base
        if not doc["multiline"]:
            doc["close_delta"] = 0
        doc["cont_uses_tab"] = any(
            "\t" in lines[l - 1][: len(lines[l - 1]) - len(lines[l - 1].lstrip(" \t"))]
            for l in set(arg_lines)
        )
        doc["arg_is_multiline"] = False
        if len(args) == 1:
            a, b = args[0]
            doc["arg_is_multiline"] = len({
                line_of(starts, tokens[k][2])[0]
                for k in range(a, b + 1) if tokens[k][0] != "comment"}) > 1
        doc["comma_space"] = False
        if not doc["multiline"]:
            doc["comma_space"] = bool(
                re.search(r",[ \t]+\S", src[tokens[i][2]: tokens[close][3]]))
        es = call_expr_start(tokens, i)
        _, expr_col = line_of(starts, tokens[es][2])
        body = joined_text(tokens, es, close)
        doc["callee"] = joined_text(tokens, es, sig(tokens, i - 1))
        doc["joined"] = body
        doc["own_len"] = (expr_col - 1) + len(body)
        doc["actual_max_line_len"] = max(len(lines[l - 1].rstrip("\r")) for l in span)
        ml = max(sorted(span), key=lambda l: len(lines[l - 1].rstrip("\r")))
        doc["max_line_no"] = ml
        doc["max_line_tokens"] = sum(
            1 for k in range(i, close + 1)
            if tokens[k][0] != "comment" and line_of(starts, tokens[k][2])[0] == ml)
        doc["max_line_is_open_line"] = (ml == open_line)
        doc["shape"] = shape_of(doc)
        records.append(doc)
    return records


def shape_of(doc):
    if not doc["multiline"]:
        return "single"
    parts = ["O" if doc["open_break"] else "o", "C" if doc["close_alone"] else "c"]
    if doc["arg_count"] >= 2:
        parts.append("V" if doc["distinct_arg_lines"] == doc["arg_count"] else "G")
    else:
        parts.append("-")
    return "".join(parts)


def bucket(n):
    return str(n) if n <= 6 else "7+"


R1_4_RULE = (True, (4,), True, 0)


def indent_rule(doc):
    """换行调用点的「缩进规则」签名。

    只取真正属于"规则"的三件事：首行是否止于 `(`、续行缩进增量、`)` 的位置与缩进。
    「每参一行 / 每行多参」不入签名 —— 那是贪心填充的结果，实参一长就会自然退化。
    """
    if not doc["multiline"]:
        return None
    return (doc["open_break"], tuple(doc["deltas"]), doc["close_alone"],
            doc["close_delta"])


def rule_label(sig):
    if sig is None:
        return "单行"
    open_break, deltas, close_alone, close_delta = sig
    parts = ["首行止于`(`" if open_break else "首参留在`(`行"]
    parts.append("续行+" + (",".join(str(d) for d in deltas) if deltas else "?"))
    parts.append("`)`独占" if close_alone else "`)`贴末参")
    parts.append("`)`回原缩进" if close_delta == 0 else "`)`缩进%+d" % close_delta)
    return " / ".join(parts)


def collect_files():
    files = []
    for dirpath, dirnames, filenames in os.walk(SCENE_DIR):
        dirnames[:] = [d for d in dirnames if d not in C.SKIP_DIRS]
        for fn in sorted(filenames):
            if fn.endswith(".lua") and fn not in C.EXCLUDE_BASENAMES:
                p = os.path.join(dirpath, fn)
                files.append((p, os.path.relpath(p, ROOT).replace("\\", "/")))
    return files


def build_report(recs, max_len):
    out = []
    w = out.append
    total = len(recs)
    multi = [r for r in recs if r["multiline"]]
    single = [r for r in recs if not r["multiline"]]
    w("函数调用换行格式检查报告（max-len=%d，范围 scenes/game_scene）" % max_len)
    w("调用=%d（单行=%d，多行=%d）" % (total, len(single), len(multi)))
    w("判定口径：**按独特函数各自自洽** —— 同一函数的全部换行调用点必须使用同一种缩进规则；")
    w("          不同函数之间各用各的规则是允许的，不要求全局统一。")
    w("          缩进规则 = 首行是否止于 `(` + 续行缩进增量 + `)` 位置/缩进")
    w("全局形态 R1.4（tools/wrap_arg_lists.py，2026-09-29 用户裁决）仅作参考基准。")

    # ---- 一、按实参个数的形态分布 ----
    counts = collections.defaultdict(collections.Counter)
    for r in recs:
        counts[bucket(r["arg_count"])][r["shape"]] += 1
    w("")
    w("=" * 100)
    w("一、按实参个数的换行形态分布")
    w("=" * 100)
    w("参数数".ljust(8) + "总计".rjust(7) + "".join(s.rjust(8) for s in SHAPES))
    for b in ARG_BUCKETS:
        if b not in counts:
            continue
        c = counts[b]
        w(b.ljust(8) + str(sum(c.values())).rjust(7)
          + "".join(str(c.get(s, 0)).rjust(8) for s in SHAPES))

    # ---- 二、主流形态 ----
    w("")
    w("=" * 100)
    w("二、每个实参个数下的主流形态（>=60% 视为规律）")
    w("=" * 100)
    for b in ARG_BUCKETS:
        if b not in counts:
            continue
        c = counts[b]
        tot = sum(c.values())
        for shape, n in c.most_common(2):
            pct = 100.0 * n / tot
            flag = "规律" if n == c.most_common(1)[0][1] and pct >= 60 else "    "
            w("  %-4s 参 %5d/%5d = %5.1f%%  %-7s %-8s %s"
              % (b, n, tot, pct, shape, flag, SHAPE_NAME.get(shape, "")))
            if n == c.most_common(1)[0][1] and pct < 60:
                w("       ^ 未过 60%%，见次高项")

    # ---- 三、每个独特函数的固有缩进规则（自洽性 = 核心判定） ----
    per_callee = collections.defaultdict(list)
    for r in recs:
        per_callee[r["callee"]].append(r)

    ruled = collections.OrderedDict()       # callee -> {rule: [recs]}
    for name in sorted(per_callee):
        sites = [r for r in per_callee[name] if r["multiline"]]
        if not sites:
            continue
        g = collections.OrderedDict()
        for r in sites:
            g.setdefault(indent_rule(r), []).append(r)
        ruled[name] = g

    judgeable = collections.OrderedDict(
        (n, g) for n, g in ruled.items() if sum(len(v) for v in g.values()) >= 2)
    singletons = collections.OrderedDict(
        (n, g) for n, g in ruled.items() if sum(len(v) for v in g.values()) == 1)
    consistent = collections.OrderedDict((n, g) for n, g in judgeable.items() if len(g) == 1)
    inconsistent = collections.OrderedDict((n, g) for n, g in judgeable.items() if len(g) > 1)

    w("")
    w("=" * 100)
    w("三、每个独特函数的固有缩进规则（自洽性 —— 核心判定）")
    w("=" * 100)
    w("  独特函数总数                            : %4d" % len(per_callee))
    w("    有换行调用点                          : %4d" % len(ruled))
    w("      换行点 >=2（可判自洽）              : %4d" % len(judgeable))
    w("        - 完全自洽                        : %4d%s"
      % (len(consistent),
         "  (%.1f%%)" % (100.0 * len(consistent) / len(judgeable)) if judgeable else ""))
    w("        - 不自洽（特例）                  : %4d%s"
      % (len(inconsistent),
         "  (%.1f%%)" % (100.0 * len(inconsistent) / len(judgeable)) if judgeable else ""))
    w("      换行点 ==1（无从比较，不判）        : %4d" % len(singletons))
    w("    只有单行调用点（无缩进规则可查）      : %4d"
      % (len(per_callee) - len(ruled)))

    dist = collections.OrderedDict()
    for name, g in judgeable.items():
        sig = list(g)[0]
        dist.setdefault(sig, []).append(name)
    w("")
    w("  可判自洽的 %d 个函数，各自采用的缩进规则分布:" % len(judgeable))
    for sig in sorted(dist, key=lambda s: (-len(dist[s]), rule_label(s))):
        names = dist[sig]
        mark = "  <= 全局 R1.4" if sig == R1_4_RULE else ""
        w("    %-52s %4d 个函数%s" % (rule_label(sig), len(names), mark))

    # ---- 四、不自洽函数明细（特例） ----
    w("")
    w("=" * 100)
    w("四、不自洽函数明细（%d 个）—— 同一函数混用了多种缩进规则" % len(inconsistent))
    w("=" * 100)
    if not inconsistent:
        w("  （无）")
    for name in sorted(inconsistent,
                       key=lambda n: (-sum(len(v) for v in inconsistent[n].values()), n)):
        g = inconsistent[name]
        w("")
        w("  %s   换行点=%d，规则=%d 种"
          % (name, sum(len(v) for v in g.values()), len(g)))
        for sig in sorted(g, key=lambda s: (-len(g[s]), rule_label(s))):
            items = g[sig]
            w("    [%2d 处] %s" % (len(items), rule_label(sig)))
            for r in sorted(items, key=lambda x: (x["path"], x["lineno"]))[:5]:
                w("             %s:%d  参=%d  形态=%s"
                  % (r["path"], r["lineno"], r["arg_count"], r["shape"]))
            if len(items) > 5:
                w("             ... 另 %d 处" % (len(items) - 5))

    # ---- 五、同一函数的「单行阈值」自洽性 ----
    thr = []
    for name in sorted(per_callee):
        items = per_callee[name]
        singles = [r for r in items if not r["multiline"]]
        wrapped = [r for r in items if r["multiline"] and not r["arg_is_multiline"]]
        if not singles or not wrapped:
            continue
        max_single = max(r["own_len"] for r in singles)
        bad = [r for r in wrapped if r["own_len"] < max_single]
        if bad:
            thr.append((name, max_single, min(r["own_len"] for r in wrapped), bad,
                        len(singles), len(wrapped)))
    thr.sort(key=lambda x: (-len(x[3]), x[0]))
    w("")
    w("=" * 100)
    w("五、同一函数「单行阈值」不自洽（%d 个）—— 同一函数既把长的留单行、又把短的换了行" % len(thr))
    w("=" * 100)
    w("  判定：该函数存在某处单行调用的自身长度 > 某处换行调用的自身长度（排除实参本身多作者）")
    if not thr:
        w("  （无）")
    for name, max_single, min_wrapped, bad, n_single, n_wrap in thr:
        w("")
        w("  %s   单行点=%d（最长 %d）  换行点=%d（最短 %d）"
          % (name, n_single, max_single, n_wrap, min_wrapped))
        for r in sorted(bad, key=lambda x: (x["path"], x["lineno"]))[:6]:
            w("      %s:%d  参=%d 自身=%d（本可单行）形态=%s"
              % (r["path"], r["lineno"], r["arg_count"], r["own_len"], r["shape"]))
            w("          %s" % (r["joined"][:100]))
        if len(bad) > 6:
            w("      ... 另 %d 处" % (len(bad) - 6))

    # ---- 六、自洽但非 R1.4 的函数（合法，登记） ----
    others = [(n, list(g)[0], len(g[list(g)[0]])) for n, g in consistent.items()
              if list(g)[0] != R1_4_RULE]
    others.sort(key=lambda x: (-x[2], x[0]))
    w("")
    w("=" * 100)
    w("六、自洽、但固有规则不是全局 R1.4 的函数（%d 个，合法，仅登记）" % len(others))
    w("=" * 100)
    if not others:
        w("  （无）")
    for name, sig, n in others:
        w("  %-52s 换行点=%d  %s" % (name, n, rule_label(sig)))

    # ---- 七、全局形态一致性（参考） ----
    w("")
    w("=" * 100)
    w("七、全局形态一致性（参考，不计入违例）")
    w("=" * 100)
    n_open = sum(1 for r in multi if r["open_break"])
    n_close = sum(1 for r in multi if r["close_alone"])
    n_close_ind = sum(1 for r in multi if r["close_delta"] == 0)
    n_d4 = sum(1 for r in multi if r["deltas"] and all(d == 4 for d in r["deltas"]))
    w("  首行止于 `(`                      : %4d / %4d" % (n_open, len(multi)))
    w("  `)` 独占一行                      : %4d / %4d" % (n_close, len(multi)))
    w("  `)` 缩进 == `(` 行缩进            : %4d / %4d" % (n_close_ind, len(multi)))
    w("  续行缩进 == `(` 行缩进 + 4 空格    : %4d / %4d" % (n_d4, len(multi)))
    w("  逗号后带空格（全部调用范围）       : %4d"
      % sum(1 for r in recs if r["comma_space"]))

    # ---- 八、长度类例外（参考） ----
    d1 = [r for r in recs if r["multiline"] and r["own_len"] <= max_len
          and r["arg_count"] >= 1 and not r["arg_is_multiline"]]
    d2 = [r for r in recs if not r["multiline"]
          and r["actual_max_line_len"] > max_len]
    d2a = [r for r in d2 if r["own_len"] > max_len]
    d2b = [r for r in d2 if r["own_len"] <= max_len]
    d3 = [r for r in multi if r["shape"] not in ("OCV", "OCG", "OC-")]
    d4 = [r for r in multi if not r["deltas"] or any(d != 4 for d in r["deltas"])]
    d5 = [r for r in multi if r["close_delta"] != 0]
    d6 = [r for r in d1 if r["arg_count"] == 1]
    d8 = [r for r in multi if r["actual_max_line_len"] > max_len]
    d8a = [r for r in d8 if r["max_line_tokens"] <= 1]
    d8b = [r for r in d8 if r["max_line_tokens"] > 1]

    w("")
    w("=" * 100)
    w("八、长度类例外（参考）—— 与「函数自洽」无关，只看行长")
    w("=" * 100)
    w("D1  欠换行：单行放得下却换了行                        : %d 处" % len(d1))
    w("D2  单行但整行超过 max-len                            : %d 处" % len(d2))
    w("    D2a 该调用自身就超过（真 R1 违例，换行可修）       : %d 处" % len(d2a))
    w("    D2b 自身放得下，被同行兄弟表达式/索引链撑长       : %d 处" % len(d2b))
    w("D3  多行但首行未止于 `(`                              : %d 处" % len(d3))
    w("D4  多行但续行缩进 != +4                              : %d 处" % len(d4))
    w("D5  多行但 `)` 缩进 != `(` 行缩进                     : %d 处" % len(d5))
    w("D6  单实参却换行且该实参非多行结构（违 R1）           : %d 处" % len(d6))
    w("D8  已换行但仍有一行超过 max-len                      : %d 处" % len(d8))
    w("    D8a 最长行只 1 个 token（长字符串/称名，重排无用）: %d 处" % len(d8a))
    w("    D8b 最长行多个 token（贪心溢出，可再换行）        : %d 处" % len(d8b))

    def dump(items, note, sort_key, limit=None):
        w("")
        w("-" * 100)
        w("%s（%d 处）" % (note, len(items)))
        w("-" * 100)
        for r in sorted(items, key=sort_key)[:limit or len(items)]:
            w("  %s:%d  参=%d  自身=%d  物理行=%d  形态=%s"
              % (r["path"], r["lineno"], r["arg_count"], r["own_len"],
                 r["actual_max_line_len"], r["shape"]))
            w("      %s" % (r["joined"][:110]))

    dump(d1, "D1 明细：单行放得下却换了行（应合并）",
         lambda x: (x["path"], x["lineno"]))
    dump(d2a, "D2a 明细：调用自身超过 max-len 仍单行",
         lambda x: -x["own_len"])
    dump(d2b, "D2b 明细：整行超长但与实参表换行无关",
         lambda x: -x["actual_max_line_len"])
    dump(d3, "D3 明细：首行未止于 `(`",
         lambda x: (x["path"], x["lineno"]))
    dump(d4, "D4 明细：续行缩进异常",
         lambda x: (x["path"], x["lineno"]))
    dump(d5, "D5 明细：`)` 缩进异常",
         lambda x: (x["path"], x["lineno"]))
    dump(d8b, "D8b 明细：贪心填充溢出",
         lambda x: -x["actual_max_line_len"])
    dump(d8a, "D8a 明细：长字符串字面量 / 称名过长",
         lambda x: -x["actual_max_line_len"])

    # ---- 九、各独特函数的形态一览 ----
    w("")
    w("=" * 100)
    w("九、各独特函数的形态一览（换行点 >=20 或总调用 >=20）")
    w("=" * 100)
    per = collections.defaultdict(collections.Counter)
    for r in recs:
        per[r["callee"]][r["shape"]] += 1
    rows = [(n, c, sum(c.values())) for n, c in per.items() if sum(c.values()) >= 20]
    rows.sort(key=lambda x: (-x[2], x[0]))
    for name, c, tot in rows:
        n_multi = sum(v for k, v in c.items() if k != "single")
        g = ruled.get(name)
        rule = rule_label(list(g)[0]) if g and len(g) == 1 else (
            "混用 %d 种规则" % len(g) if g else "-")
        w("  %-52s 总%5d 换行%4d  %s" % (name, tot, n_multi, rule))
        w("      %s" % ", ".join("%s:%d" % kv for kv in c.most_common()))
    w("")
    w("（不同被调表达式名共 %d 个）" % len(per))
    return "\n".join(out) + "\n"


def main():
    max_len = MAX_LEN
    argv = sys.argv[1:]
    if "--max-len" in argv:
        max_len = int(argv[argv.index("--max-len") + 1])

    recs = []
    for path, rel in collect_files():
        recs.extend(analyze_file(path, rel))

    report = build_report(recs, max_len)
    # 与其它 *_report.txt 一致：UTF-8 无 BOM + CRLF
    with io.open(REPORT_PATH, "w", encoding="utf-8", newline="\r\n") as f:
        f.write(report)

    multi = sum(1 for r in recs if r["multiline"])
    print("检查范围：%d 个 Lua 文件" % len(collect_files()))
    print("调用=%d（单行=%d，多行=%d）" % (len(recs), len(recs) - multi, multi))
    print("报告已写入：%s" % os.path.relpath(REPORT_PATH, ROOT).replace("\\", "/"))


if __name__ == "__main__":
    main()

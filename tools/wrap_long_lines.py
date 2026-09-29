# -*- coding: utf-8 -*-
"""
按本项目**已有**的续行规范，对超长的单行代码做折行。

规范来自对本仓库的实测统计（不是猜的）：

| 断点 | 续行缩进 | 现有实例数 |
|------|----------|-----------|
| `(` 参数表换行 | 每个实参一行，缩进 **+4**；`)` 单独一行回到语句缩进 | 1186 |
| `{` 表构造换行 | 元素缩进 **+4**；`}` 回到语句缩进 | 323 |
| `=` 后换行 | 续行与语句**同缩进**（+0） | 244 |
| `and` / `or` 后换行 | 续行与语句**同缩进**（+0） | 20 |
| 其它二元运算符后换行 | 续行与语句**同缩进**（+0） | — |

折行优先级（先调用参数、再赋值、再 and/or、再二元运算符、再表构造）：
- 「先拆调用参数」可保留 `X = func(` 与 `function name(` 在同一行，
  这样仓库里按行匹配 `name(` 的工具仍能命中，改动最小。

安全性：
- 只在 token 之间的空白处插入「换行 + 缩进」，绝不增删字符、绝不进入字符串/注释内部；
- 每个文件写入前校验「前后 token 序列（kind + text）完全一致」，不一致即抛错中止；
- 若某些行确实无法折到阈值内，只记录在报告里，不做破坏性处理。

用法:
    python tools/wrap_long_lines.py                    # 只报告（默认阈值 120）
    python tools/wrap_long_lines.py --fix              # 实际折行
    python tools/wrap_long_lines.py --fix --max-len 120
    python tools/wrap_long_lines.py --show 6           # 额外打印 6 组 before/after 样例
"""
import io
import os
import re
import sys
import collections

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import check_operator_spacing as C  # noqa: E402

REPORT_PATH = os.path.join(C.ROOT, "tools", "long_line_wrap_report.txt")

OPEN_BR = {"(", "[", "{"}
CLOSE_BR = {")", "]", "}"}
BIN_ALWAYS = {"*", "/", "//", "..", "==", "~=", "<", "<=", ">", ">=", "%", "^"}
BARE_CR = re.compile(r"\r(?!\n)")


# ---------------------------------------------------------------- 基础工具

def iter_lines(src):
    """产出每行的 (start, end)，end 不含换行符。"""
    i = 0
    n = len(src)
    while i < n:
        j = src.find("\n", i)
        if j < 0:
            yield i, n
            return
        end = j
        if end > i and src[end - 1] == "\r":
            end -= 1
        yield i, end
        i = j + 1


def match_bracket(toks, p):
    """返回与 toks[p] 的开括号配对的闭括号下标。"""
    d = 0
    for i in range(p, len(toks)):
        tx = toks[i][1]
        if tx in OPEN_BR:
            d += 1
        elif tx in CLOSE_BR:
            d -= 1
            if d == 0:
                return i
    return None


def is_binop(tokens, gidx):
    t = tokens[gidx][1]
    if t in BIN_ALWAYS:
        return True
    if t in ("+", "-"):
        return C.is_binary_operator(tokens, gidx)
    return False


def depths(toks):
    """每个 token 相对行首的括号嵌套深度（开括号本身算当前层）。"""
    out = []
    d = 0
    for _kind, text, _s, _e, _g in toks:
        if text in CLOSE_BR:
            d = max(0, d - 1)
        out.append(d)
        if text in OPEN_BR:
            d += 1
    return out


def render(toks, gaps, i, j, indent):
    parts = [indent, toks[i][1]]
    for k in range(i + 1, j + 1):
        parts.append(gaps[k])
        parts.append(toks[k][1])
    return "".join(parts)


# ---------------------------------------------------------------- 折行规则
# 每条规则返回 [(起点下标, 终点下标, 该段缩进)]，无法适用时返回 None。

def rule_call(tokens, toks, dep, i, j, base, ind4):
    for p in range(i + 1, j + 1):
        if toks[p][1] != "(" or dep[p] != 0:
            continue
        m = match_bracket(toks, p)
        if m is None or m > j:
            continue
        commas = [q for q in range(p + 1, m) if toks[q][1] == "," and dep[q] == 1]
        if not commas:
            continue
        segs = [(i, p, base)]
        start = p + 1
        for q in commas:
            if q > start:
                segs.append((start, q, ind4))
            start = q + 1
        if m > start:
            segs.append((start, m - 1, ind4))
        segs.append((m, j, base))
        return segs
    return None


def rule_assign(tokens, toks, dep, i, j, base, ind4):
    if toks[i][1] == "for":
        return None
    for k in range(i + 1, j + 1):
        if toks[k][1] == "=" and dep[k] == 0 and k < j:
            segs = [(i, k, base), (k + 1, j, base)]
            return segs
    return None


def rule_and_or(tokens, toks, dep, i, j, base, ind4):
    cands = [(dep[k], abs(k - (i + j) / 2.0), k)
             for k in range(i + 1, j) if toks[k][1] in ("and", "or")]
    if not cands:
        return None
    cands.sort()
    depth0 = [c for c in cands if c[0] == 0]
    ks = sorted(c[2] for c in (depth0 if depth0 else cands))
    segs = []
    start = i
    for k in ks:
        segs.append((start, k, base))
        start = k + 1
    segs.append((start, j, base))
    return segs if len(segs) > 1 else None


def rule_binop(tokens, toks, dep, i, j, base, ind4):
    cands = []
    for k in range(i + 1, j):
        if is_binop(tokens, toks[k][4]):
            cands.append((dep[k], abs(k - (i + j) / 2.0), k))
    if not cands:
        return None
    cands.sort()
    k = cands[0][2]
    return [(i, k, base), (k + 1, j, base)]


def rule_table(tokens, toks, dep, i, j, base, ind4):
    for p in range(i, j + 1):
        if toks[p][1] != "{" or dep[p] != 0:
            continue
        m = match_bracket(toks, p)
        if m is None or m > j:
            continue
        commas = [q for q in range(p + 1, m) if toks[q][1] == "," and dep[q] == 1]
        if not commas:
            continue
        segs = []
        if p >= i:
            segs.append((i, p, base))
        start = p + 1
        for q in commas:
            if q > start:
                segs.append((start, q, ind4))
            start = q + 1
        if m > start:
            segs.append((start, m - 1, ind4))
        segs.append((m, j, base))
        return segs if len(segs) > 1 else None
    return None


RULES = (rule_call, rule_assign, rule_and_or, rule_binop, rule_table)


def emit(tokens, toks, gaps, dep, i, j, indent, max_len, out, level=0):
    line = render(toks, gaps, i, j, indent)
    if len(line) <= max_len or j <= i or level > 10:
        out.append(line)
        return
    segs = None
    for rule in RULES:
        segs = rule(tokens, toks, dep, i, j, indent, indent + ("\t" if "\t" in indent else "    "))
        if segs:
            break
    if not segs:
        out.append(line)          # 无法继续切分，保留原样（由报告列出）
        return
    for a, b, ind in segs:
        emit(tokens, toks, gaps, dep, a, b, ind, max_len, out, level + 1)


def wrap_line(src, tokens, toks, base, max_len):
    n = len(toks)
    gaps = [""] * n
    for k in range(1, n):
        gaps[k] = src[toks[k - 1][3]:toks[k][2]]
    dep = depths(toks)
    out = []
    emit(tokens, toks, gaps, dep, 0, n - 1, base, max_len, out)
    return out


# ---------------------------------------------------------------- 单文件处理

def wrap_source(src, max_len):
    tokens = C.tokenize(src)
    lines = list(iter_lines(src))
    line_starts = [s for s, _e in lines]

    tok_on_line = collections.defaultdict(list)
    protected = set()
    comment_lines = set()
    for gidx, (kind, text, start, end) in enumerate(tokens):
        ln, _col = C.line_of(src, line_starts, start)
        if "\n" in text:
            a, _ = C.line_of(src, line_starts, start)
            b, _ = C.line_of(src, line_starts, min(end, len(src) - 1))
            for x in range(a + 1, b + 1):
                protected.add(x)
            if kind == "comment":
                comment_lines.add(ln)
            continue
        if kind == "comment":
            comment_lines.add(ln)
        tok_on_line[ln].append((kind, text, start, end, gidx))

    replacements = []
    stats = collections.Counter()
    leftovers = []
    n_crlf_breaks = 0
    n_lf_breaks = 0

    for ln, (ls, le) in enumerate(lines, 1):
        text = src[ls:le]
        if len(text) <= max_len:
            continue
        if ln in protected:
            stats["长字符串内部"] += 1
            continue
        toks = tok_on_line.get(ln)
        if not toks:
            stats["无 token"] += 1
            continue
        if any("\n" in t[1] for t in toks):
            stats["含跨行 token"] += 1
            continue

        # 行尾注释：折行后挂到最后一行，注释文本原样保留
        tail = ""
        if toks[-1][0] == "comment":
            if len(toks) < 2:
                stats["整行注释"] += 1
                continue
            tail = src[toks[-1][2]:toks[-1][3]]
            if tail.endswith("\r"):
                tail = tail[:-1]          # 行注释 token 含 \r\n 的 \r，不能带进折行结果
            sep = src[toks[-2][3]:toks[-1][2]]
            toks = toks[:-1]
        elif any(t[0] == "comment" for t in toks):
            stats["注释在行中"] += 1
            continue

        base = text[:len(text) - len(text.lstrip(" \t"))]
        eol = "\r\n" if src[le:le + 2] == "\r\n" else "\n"   # 跟随原行的行尾符，不制造混合行尾
        new_lines = wrap_line(src, tokens, toks, base, max_len)
        if tail:
            new_lines[-1] = new_lines[-1] + sep + tail
        new_text = eol.join(new_lines)
        if len(new_lines) > 1:
            if eol == "\r\n":
                n_crlf_breaks += len(new_lines) - 1
            else:
                n_lf_breaks += len(new_lines) - 1
        if new_text == text:
            if tail:
                why = "超长来自行尾注释，不动注释"
            elif any(t[0] in ("string", "longstring") and len(t[1]) > 60 for t in toks):
                why = "超长来自长字符串字面量，拆开会改字符串内容"
            else:
                why = "无可用断点（长索引链等）"
            stats["无法折行"] += 1
            leftovers.append((ln, len(text), why, text))
            continue
        replacements.append((ls, le, new_text))
        stats["已折行"] += 1
        for nl in new_lines:
            if len(nl) > max_len:
                leftovers.append((ln, len(nl), "折行后该段本身过长", nl))
                break

    new_src = src
    for s, e, rep in sorted(replacements, key=lambda x: -x[0]):
        new_src = new_src[:s] + rep + new_src[e:]

    return new_src, stats, replacements, leftovers, (n_crlf_breaks, n_lf_breaks)


def main():
    argv = sys.argv[1:]
    do_fix = "--fix" in argv
    max_len = 120
    if "--max-len" in argv:
        max_len = int(argv[argv.index("--max-len") + 1])
    show = 0
    if "--show" in argv:
        show = int(argv[argv.index("--show") + 1])
    grep = None
    if "--grep" in argv:
        grep = argv[argv.index("--grep") + 1]

    files = C.collect_files()
    total_stats = collections.Counter()
    changed_files = 0
    report = []
    report.append("超长行折行报告（阈值 %d 字符）" % max_len)
    report.append("")

    samples = []
    pending = []
    for path in files:
        rel = os.path.relpath(path, C.ROOT).replace("\\", "/")
        with io.open(path, "r", encoding="utf-8", newline="") as f:
            src = f.read()
        new_src, stats, reps, leftovers, breaks = wrap_source(src, max_len)
        if not stats:
            continue

        total_stats.update(stats)
        report.append("%s  —— 已折行 %d 行" % (rel, stats.get("已折行", 0)))
        for k in ("无法折行", "整行注释", "注释在行中", "长字符串内部", "无 token", "含跨行 token"):
            if stats.get(k):
                report.append("      跳过(%s)：%d" % (k, stats[k]))
        for ln, ln_len, why, text in leftovers[:20]:
            report.append("      ↳ 仍超长 %d 字符 @ 原第 %d 行 [%s]: %s" % (ln_len, ln, why, text.strip()[:100]))
        report.append("")

        if reps and show and len(samples) < show:
            for s, e, rep in reps:
                if len(samples) >= show:
                    break
                if grep and grep not in src[s:e]:
                    continue
                samples.append((rel, src[s:e], rep))

        if do_fix and reps:
            # 先全部校验，全部通过后才统一写回（避免中途失败留下半成品）
            if not C.tokens_equal(src, new_src):
                raise RuntimeError("token 序列不一致，已中止（未写入任何文件）：%s" % path)
            if ([t[1] for t in C.tokenize(src) if t[0] == "comment"]
                    != [t[1] for t in C.tokenize(new_src) if t[0] == "comment"]):
                raise RuntimeError("注释文本被改动，已中止（未写入任何文件）：%s" % path)
            if src.count("\n") - src.count("\r\n") + breaks[1] != new_src.count("\n") - new_src.count("\r\n"):
                raise RuntimeError("LF-only 换行数不符合预期，已中止（未写入任何文件）：%s" % path)
            if src.count("\r\n") + breaks[0] != new_src.count("\r\n"):
                raise RuntimeError("CRLF 换行数不符合预期，已中止（未写入任何文件）：%s" % path)
            if len(BARE_CR.findall(new_src)) != len(BARE_CR.findall(src)):
                raise RuntimeError("出现孤立 CR，已中止（未写入任何文件）：%s" % path)
            _, stats2, _, _, _ = wrap_source(new_src, max_len)
            if stats2.get("已折行"):
                raise RuntimeError("折行未收敛（不幂等）：%s" % path)
            pending.append((path, new_src))

    if do_fix:
        for path, new_src in pending:
            with io.open(path, "w", encoding="utf-8", newline="") as f:
                f.write(new_src)
    changed_files = len(pending)

    lines = []
    lines.append("超长行折行报告（阈值 %d 字符）" % max_len)
    lines.append("已折行文件：%d 个" % changed_files if do_fix else "（本次为试算，未写回文件）")
    lines.append("统计：" + ", ".join("%s=%d" % (k, v) for k, v in sorted(total_stats.items())))
    lines.append("")
    lines.extend(report)
    with io.open(REPORT_PATH, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print("阈值：%d 字符 | 试算/写回：%s" % (max_len, "写回" if do_fix else "仅试算"))
    print("已折行文件：%d 个" % changed_files)
    print("统计：" + ", ".join("%s=%d" % (k, v) for k, v in sorted(total_stats.items())))
    print("详细报告：%s" % os.path.relpath(REPORT_PATH, C.ROOT))

    for rel, before, after in samples:
        print("\n--- %s ---" % rel)
        print("BEFORE:")
        print(before)
        print("AFTER:")
        print(after)


if __name__ == "__main__":
    main()

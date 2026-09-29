# -*- coding: utf-8 -*-
"""
按新规则重排「实参表 / 形参表」的换行与缩进 —— 调用与声明同一套规则。

规则（2026-09-29 用户裁决）:
  R1   0 个参数     -> 恒单行：f()
       1 个参数     -> 恒单行；只有参数表自身放不下 --max-len 才回退经典三行
       >=2 个参数   -> 单行能放下（<= --max-len）就单行；放不下才换行
  R1.4 换行形态（①与②的折中）:
       - **逗号后面不加空格**：同一行的实参用 `,` 直接相连（`f(a,b)`）
       - 超过 --max-len 时就**从左括号开始换行一次**：首行只到 `(`
       - 参数从下一行开始，续行缩进 = `(` 所在行 + 1 个单位（该行用 tab 则用 tab）
       - 参数行**贪心填到 120**（`, ` 无空格相连），到 120 就再换行
       - **最后单独一行放 `)`**，缩进 = `(` 所在行的行首缩进
       - 多行实参（表 / 匿名函数 / 嵌套调用）必须独占自己的行
  R4   多行实参内部各行，随「它第一行」的缩进同步位移（相对结构不变）
  R5   `=` / `and` / `or` / 二元运算符的续行缩进 +0 —— 本工具不动
  R6   递归**所有深度**（--max-depth 默认 12，实际按需）
  R7   具名声明与其调用同规则；匿名函数只在「函数体多行」时才纳入
  R8   只动 token 之间的空白；写前校验 token 序列 / 注释文本 / 行尾符 / 幂等 / 去空白后一致

跳过（逐条记入报告）:
  - 参数表范围内含**行注释**（`--`）：重排会把后续 token 吞进注释
  - 有形参但为空的位置（`f(a,,b)` 之类，语法异常）
  - 单行体匿名函数（R7.2 不纳入）

用法:
    python tools/wrap_arg_lists.py                    # 只报告
    python tools/wrap_arg_lists.py --fix              # 写回
    python tools/wrap_arg_lists.py --show 6           # 打印 before/after 样例
    python tools/wrap_arg_lists.py --grep SUBSTR      # 只看含 SUBSTR 的样例
    python tools/wrap_arg_lists.py --max-len 120      # 单行上限
    python tools/wrap_arg_lists.py --comma-scope all  # 连表元素/local/for 的逗号也不加空格
    python tools/wrap_arg_lists.py --max-depth 12     # 递归深度（默认 12 ≈ 全部）
"""
import io
import os
import re
import sys
import collections

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import check_operator_spacing as C  # noqa: E402
import wrap_long_lines as W  # noqa: E402
import vertical_function_params as V  # noqa: E402

REPORT_PATH = os.path.join(C.ROOT, "tools", "wrap_arg_lists_report.txt")
BARE_CR = re.compile(r"\r(?!\n)")
BLOCK_COMMENT_OPEN = re.compile(r"^--\[=*\[")

# 出现在 `function` 之前时，说明是函数表达式而非语句级声明
EXPR_PREV = {"=", ",", "(", "[", "{", "return"}

BLOCK_OPEN = ("function", "if", "for", "while", "do", "repeat")


def is_line_comment(text):
    t = text[:-1] if text.endswith("\r") else text
    return t.startswith("--") and not BLOCK_COMMENT_OPEN.match(t)


# ---------------------------------------------------------------- 基础工具

def prev_tok(toks, i):
    j = i - 1
    while j >= 0 and toks[j][0] == "comment":
        j -= 1
    return j if j >= 0 else None


def chain_root(toks, j):
    """从名字 j 往前跳过 `. name` / `: name` 链，返回链前一个 token 下标。"""
    while j - 2 >= 0 and toks[j - 1][1] in (".", ":") and toks[j - 2][0] == "name":
        j -= 2
    return prev_tok(toks, j)


def line_bounds(src, starts, off):
    """返回 off 所在行的 (start, end)，end 不含行尾符。"""
    ln, _col = C.line_of(src, starts, off)
    b = starts[ln - 1]
    e = src.find("\n", b)
    if e < 0:
        e = len(src)
    if e > b and src[e - 1] == "\r":
        e -= 1
    return b, e


def lead_ws(src, b):
    i = b
    while i < len(src) and src[i] in " \t":
        i += 1
    return src[b:i]


def unit_of(indent):
    return "\t" if "\t" in indent else "    "


def body_end(toks, m):
    """形参表结束下标 m 之后，匹配该函数体的 `end` 的下标。"""
    blocks = []
    for q in range(m + 1, len(toks)):
        if toks[q][0] != "keyword":
            continue
        t = toks[q][1]
        if t in ("for", "while"):
            blocks.append("loop")
        elif t == "do":
            if not (blocks and blocks[-1] == "loop"):
                blocks.append("do")
        elif t in ("if", "function", "repeat"):
            blocks.append(t)
        elif t == "end":
            if not blocks:
                return q
            blocks.pop()
        elif t == "until":
            if blocks:
                blocks.pop()
    return None


# ---------------------------------------------------------------- 收集参数表

def collect_frames(toks):
    """收集所有 `(...)`：{kind: call/decl/anon/group, p, m, depth, commas, args}。"""
    frames = []
    stack = []
    blocks = []
    pending_loop_do = 0
    fn_level = 0

    for i, (kind, text, _st, _en) in enumerate(toks):
        if kind == "comment":
            continue
        if kind == "keyword":
            if text == "function":
                blocks.append("function")
                fn_level += 1
                continue
            if text == "if":
                blocks.append("if")
                continue
            if text in ("for", "while"):
                blocks.append("loop")
                pending_loop_do += 1
                continue
            if text == "do":
                if pending_loop_do:
                    pending_loop_do -= 1
                else:
                    blocks.append("do")
                continue
            if text == "repeat":
                blocks.append("repeat")
                continue
            if text == "end":
                if blocks and blocks.pop() == "function":
                    fn_level -= 1
                continue
            if text == "until":
                if blocks:
                    blocks.pop()
                continue

        if text in W.OPEN_BR:
            # 注意：**所有**开括号都要压栈（`[` `{` 也要），否则实参里的
            # `obj["key"]` 这类索引的 `]` 会把外层 `(` 从栈里弹掉，
            # 导致整个调用被漏掉（它就会保留着旧的"一行一个参数"形态）。
            cls = "group"
            if text == "(":
                j = prev_tok(toks, i)
                if j is not None:
                    if toks[j][0] == "keyword" and toks[j][1] == "function":
                        cls = "anon"
                    elif toks[j][0] == "name":
                        root = chain_root(toks, j)
                        if (root is not None and toks[root][0] == "keyword"
                                and toks[root][1] == "function"):
                            cls = "anon" if prev_tok(toks, root) in EXPR_PREV else "decl"
                        else:
                            cls = "call"
                    elif toks[j][1] in (")", "]"):
                        cls = "call"
            fr = {"kind": cls, "p": i, "m": None, "fn": fn_level,
                  "depth": sum(1 for g in stack
                               if g["kind"] != "group" and g["fn"] == fn_level)}
            stack.append(fr)
            continue

        if text in W.CLOSE_BR:
            if not stack:
                continue
            g = stack.pop()
            if text == ")" and g["kind"] != "group":
                g["m"] = i
                frames.append(g)

    return frames


def split_args(toks, p, m):
    """返回 (顶层逗号下标列表, 每个参数的 token 区间列表)。"""
    depth = 0
    commas = []
    for q in range(p + 1, m):
        t = toks[q][1]
        if t in W.OPEN_BR:
            depth += 1
        elif t in W.CLOSE_BR:
            depth -= 1
        elif t == "," and depth == 0:
            commas.append(q)
    idx = [p] + commas + [m]
    ranges = []
    for k in range(len(idx) - 1):
        a0, a1 = idx[k] + 1, idx[k + 1] - 1
        ranges.append((a0, a1) if a0 <= a1 else None)
    return commas, ranges


# ---------------------------------------------------------------- 布局

def add_gap(edits, src, s, e, rep):
    if src[s:e] != rep:
        edits.append((s, e, rep))


def plan(src, toks, starts, f, max_len, protected):
    """返回 (edits, verdict)。edits 是对 token 间空白的替换（纯空白）。"""
    p, m = f["p"], f["m"]
    if m == p + 1:
        return [], "skip:0params"

    commas, ranges = split_args(toks, p, m)

    # 逗号后不加空格（同一行内）：与布局无关，先算好，所有分支都要带上
    comma_edits = []
    for q in commas:
        s, e = toks[q][3], toks[q + 1][2]
        if s < e and "\n" not in src[s:e]:
            comma_edits.append((s, e, ""))

    # 含行注释的重排会吞掉后续 token，跳过（但逗号规则仍然生效）
    for q in range(p, m + 1):
        if toks[q][0] == "comment" and is_line_comment(toks[q][1]):
            return comma_edits, "skip:line-comment"

    if any(r is None for r in ranges):
        return comma_edits, "skip:empty-arg"

    if f["kind"] == "anon":
        end = body_end(toks, m)
        if end is None or "\n" not in src[toks[m][3]:toks[end][2]]:
            return comma_edits, "skip:anon-short-body"

    ls, _le = line_bounds(src, starts, toks[p][2])
    _ls2, le2 = line_bounds(src, starts, toks[m][3])
    indent = lead_ws(src, ls)
    ind4 = indent + unit_of(indent)
    prefix = src[ls:toks[p][3]]
    suffix = src[toks[m][3]:le2]
    eol = V.eol_at(src, toks[p][2])

    texts = [src[toks[a][2]:toks[b][3]] for a, b in ranges]
    multi = ["\n" in t for t in texts]

    # ---- R1：单行放得下就单行 ----
    # 「放得下」= 合并后**整条物理行**（含 `)` 之后的尾巴）不超过 --max-len，
    # 这样不会为了收窄参数表反而制造超长行。
    if not any(multi):
        one = prefix + "(" + ",".join(texts) + suffix
        if "\n" not in one and len(one) <= max_len:
            edits = []
            add_gap(edits, src, toks[p][3], toks[p + 1][2], "")
            for q in commas:
                add_gap(edits, src, toks[q][3], toks[q + 1][2], "")
            add_gap(edits, src, toks[m - 1][3], toks[m][2], "")
            return edits, "collapse"

    own = prefix + "(" + ",".join(texts) + ")"

    # ---- 只有一个参数：不主动换行（R1） ----
    # 多行实参、或参数表自身放得下 -> 一律不动（行超长是 `)` 之后的尾巴造成的）
    if len(ranges) == 1:
        if any(multi) or len(own) <= max_len:
            return comma_edits, "keep:1arg"
        # 参数表自身就放不下 -> 回退经典三行形态
        edits = []
        add_gap(edits, src, toks[p][3], toks[p + 1][2], eol + ind4)
        add_gap(edits, src, toks[m - 1][3], toks[m][2], eol + indent)
        return edits, "wrap:1arg"

    # ---- 是否值得拆：只看**参数表自身跨度** ----
    # 若自身跨度已经放得下，行超长是 `)` 之后的尾巴（`or xxx(...)`、行尾注释）造成的，
    # 交给 `tools/wrap_long_lines.py` 的运算符/赋值规则处理，本工具不动，
    # 否则同一条长行上的两个短调用会互相拆对方（来回震荡）。
    if not any(multi) and len(own) <= max_len:
        return comma_edits, "keep:line-long-by-suffix"

    # R1.4：从左括号开始换行一次 -> 参数行填到 120 再换行 -> 最后单独一行放 `)`
    # 逗号后面不加空格，所以行宽 = 起始位置 + 各实参文本 + 各自的尾逗号。
    n_args = len(texts)
    widths = [len(t.split("\n")[0].rstrip("\r")) + 1 for t in texts]
    lines = []
    cur = []
    curw = len(ind4)
    for i in range(n_args):
        w = widths[i]
        if multi[i] and cur:
            lines.append(cur)
            cur = []
            curw = len(ind4)
        if cur and curw + w > max_len:
            lines.append(cur)
            cur = []
            curw = len(ind4)
        cur.append(i)
        curw += w
        if multi[i]:
            lines.append(cur)
            cur = []
            curw = len(ind4)
    if cur:
        lines.append(cur)

    line_of = {}
    for li, l in enumerate(lines):
        for i in l:
            line_of[i] = li

    edits = []
    add_gap(edits, src, toks[p][3], toks[p + 1][2], eol + ind4)
    for k, q in enumerate(commas):
        add_gap(edits, src, toks[q][3], toks[q + 1][2],
                "" if line_of[k] == line_of[k + 1] else eol + ind4)
    add_gap(edits, src, toks[m - 1][3], toks[m][2], eol + indent)

    # R4：多行实参内部各行随「它首行所在的物理行」缩进同步位移
    for i, t in enumerate(texts):
        if not multi[i]:
            continue
        # 所有实参都从续行开始（`(` 后已换行），锚点就是续行缩进 ind4
        anchor = ind4
        a, b = ranges[i]
        old_ls, _ = line_bounds(src, starts, toks[a][2])
        old_ind = lead_ws(src, old_ls)
        if old_ind == anchor:
            continue
        pos = src.find("\n", toks[a][2])
        while pos >= 0 and pos < toks[b][3]:
            ls2 = pos + 1
            we = ls2
            while we < len(src) and src[we] in " \t":
                we += 1
            w = src[ls2:we]
            if w.startswith(old_ind) and not any(s < ls2 < e for s, e in protected):
                edits.append((ls2, we, anchor + w[len(old_ind):]))
            nxt = src.find("\n", ls2)
            if nxt < 0:
                break
            pos = nxt

    verdict = "wrap" if len(lines) > 1 or not any(multi) else "wrap(multi-arg)"
    return edits, verdict


def comma_all_edits(src):
    """把所有逗号后面的同行空格删掉（--comma-scope all 时启用）。"""
    toks = C.tokenize(src)
    edits = []
    for i, (kind, text, _s, e) in enumerate(toks):
        if text != ",":
            continue
        j = i + 1
        if j >= len(toks):
            continue
        s2 = toks[j][2]
        if s2 > e and "\n" not in src[e:s2]:
            edits.append((e, s2, ""))
    return edits


def process(src, max_len, max_depth, comma_scope="args", max_rounds=8):
    """迭代到稳定：每轮按 depth 0..max_depth 由外向内重排，直到不再变化。

    层与层之间会互相影响（外层收窄/换行会移动内层 `(` 所在行），
    所以必须反复跑几轮；最后一轮「无改动」时统计各 frame 的判定，作为稳定态快照。
    """
    stats = collections.Counter()
    for _rnd in range(max_rounds):
        round_changed = False
        if comma_scope == "all":
            ce = comma_all_edits(src)
            if ce:
                src, _n = V.apply_edits(src, ce)
                stats["comma-all"] += len(ce)
        verdicts = collections.Counter()
        for depth in range(max_depth + 1):
            toks = C.tokenize(src)
            starts = [s for s, _e in W.iter_lines(src)]
            protected = [(t[2], t[3]) for t in toks
                         if t[0] in ("longstring", "comment")]
            edits = []
            for f in collect_frames(toks):
                if f["m"] is None or f["depth"] != depth:
                    continue
                e, verdict = plan(src, toks, starts, f, max_len, protected)
                verdicts[verdict] += 1
                if e:
                    round_changed = True
                    stats["changed"] += 1
                    stats["changed:@" + f["kind"]] += 1
                    if (verdict == "wrap"
                            and "\n" not in src[toks[f["p"]][3]:toks[f["p"] + 1][2]]):
                        stats["wrap-from-hug"] += 1
                    edits.extend(e)
            if edits:
                src, _n = V.apply_edits(src, edits)
        if not round_changed:
            stats.update(verdicts)
            return src, stats
    stats["NOT-CONVERGED"] += 1
    return src, stats


# ---------------------------------------------------------------- 主流程

def main():
    argv = sys.argv[1:]
    do_fix = "--fix" in argv
    show = int(argv[argv.index("--show") + 1]) if "--show" in argv else 0
    grep = argv[argv.index("--grep") + 1] if "--grep" in argv else None
    max_len = int(argv[argv.index("--max-len") + 1]) if "--max-len" in argv else 120
    max_depth = int(argv[argv.index("--max-depth") + 1]) if "--max-depth" in argv else 12
    comma_scope = argv[argv.index("--comma-scope") + 1] if "--comma-scope" in argv else "args"

    files = C.collect_files()
    total = collections.Counter()
    pending = []
    report = []
    samples = []
    skipped = []

    for path in files:
        rel = os.path.relpath(path, C.ROOT).replace("\\", "/")
        with io.open(path, "r", encoding="utf-8", newline="") as f:
            src = f.read()
        new_src, stats = process(src, max_len, max_depth, comma_scope)
        if not stats:
            continue
        total.update(stats)

        if show and len(samples) < show and new_src != src:
            toks = C.tokenize(src)
            starts = [s for s, _e in W.iter_lines(src)]
            protected = [(t[2], t[3]) for t in toks if t[0] in ("longstring", "comment")]
            for f in collect_frames(toks):
                if f["m"] is None or f["depth"] != 0:
                    continue
                e, verdict = plan(src, toks, starts, f, max_len, protected)
                if not e:
                    continue
                ls, _le = line_bounds(src, starts, toks[f["p"]][2])
                _l2, le2 = line_bounds(src, starts, toks[f["m"]][3])
                before = src[ls:le2]
                if grep and grep not in before:
                    continue
                after, _ = V.apply_edits(before, [(s - ls, ee - ls, r) for s, ee, r in e])
                samples.append((rel, verdict, before, after))
                break

        if new_src != src:
            if not C.tokens_equal(src, new_src):
                raise RuntimeError("token 序列不一致，已中止（未写入任何文件）：%s" % path)
            if ([t[1] for t in C.tokenize(src) if t[0] == "comment"]
                    != [t[1] for t in C.tokenize(new_src) if t[0] == "comment"]):
                raise RuntimeError("注释文本被改动，已中止（未写入任何文件）：%s" % path)
            if re.sub(r"\s", "", src) != re.sub(r"\s", "", new_src):
                raise RuntimeError("出现非空白改动，已中止（未写入任何文件）：%s" % path)
            if len(BARE_CR.findall(new_src)) != len(BARE_CR.findall(src)):
                raise RuntimeError("出现孤立 CR，已中止（未写入任何文件）：%s" % path)
            _s2, stats2 = process(new_src, max_len, max_depth, comma_scope)
            if stats2.get("changed"):
                raise RuntimeError("未收敛（不幂等）：%s" % path)
            pending.append((path, new_src))

    if do_fix:
        for path, new_src in pending:
            with io.open(path, "w", encoding="utf-8", newline="") as f:
                f.write(new_src)

    lines = []
    lines.append("实参/形参表重排报告（max-len=%d, max-depth=%d, comma-scope=%s）"
                 % (max_len, max_depth, comma_scope))
    lines.append("已改文件：%d 个" % len(pending) if do_fix else "（本次为试算，未写回）")
    lines.append("统计：" + ", ".join("%s=%d" % (k, v) for k, v in sorted(total.items())))
    lines.append("")
    lines.extend(report)
    lines.extend(skipped)
    with io.open(REPORT_PATH, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print("试算/写回：%s | max-len=%d | max-depth=%d | comma-scope=%s"
          % ("写回" if do_fix else "仅试算", max_len, max_depth, comma_scope))
    print("已改文件：%d 个" % len(pending))
    print("统计：" + ", ".join("%s=%d" % (k, v) for k, v in sorted(total.items())))
    print("详细报告：%s" % os.path.relpath(REPORT_PATH, C.ROOT))

    for rel, verdict, before, after in samples:
        print("\n--- %s  [%s] ---" % (rel, verdict))
        print("BEFORE:")
        print(before.replace("\r\n", "\n"))
        print("AFTER:")
        print(after.replace("\r\n", "\n"))


if __name__ == "__main__":
    main()

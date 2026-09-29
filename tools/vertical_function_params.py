# -*- coding: utf-8 -*-
"""
【已废弃 2026-09-29】已被 `tools/wrap_arg_lists.py` 取代（形参表与实参表同一套规则）。
**不要再跑本工具**，它会把已经收成一行的形参表重新竖排。保留代码仅作历史参考。

把 `function` 声明的形参表统一改成竖排（每个形参一行）。

规则（沿用本仓库既有 `(` 续行规范，见 docs / repo memory）：
    function name(
        param1,
        param2
    )
- 形参缩进 = 语句缩进 **+4**；`)` 回到语句缩进单独一行。
- 只处理**具名声明**：`function name(...)`、`local function name(...)`、
  `function a.b.c(...)`、`function a:b(...)`。
- **不处理**：无形参的 `function foo()`、**只有一个形参**的声明（用户 2026-09-29 追加规则：
  单参数不换行，见 `tools/rejoin_single_args.py`）、匿名函数表达式
  （`function(...)` 回调、`x = function(i) ... end`）——它们不是声明，竖排会很难看。
- 已经是竖排的（`(` 后即换行）跳过，因此可重复执行（幂等）。

安全性：与 `tools/wrap_long_lines.py` 同一套保障
- 只在 token 之间的空白处插入「换行 + 缩进」，不增删字符；
- 插入的换行跟随该行原有行尾符（CRLF 文件不会变混合行尾）；
- 写入前校验：token 序列一致 + 注释文本一致 + CRLF/LF 增量吻合 + 无孤立 CR；
- 折行后复跑应无任何可改项（幂等）。

用法:
    python tools/vertical_function_params.py                # 只报告
    python tools/vertical_function_params.py --fix          # 实际写回
    python tools/vertical_function_params.py --show 4       # 打印 before/after 样例
    python tools/vertical_function_params.py --min-params 1 # 连单形参也竖排（旧行为）
"""
import io
import os
import re
import sys
import collections

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import check_operator_spacing as C  # noqa: E402
import wrap_long_lines as W  # noqa: E402

REPORT_PATH = os.path.join(C.ROOT, "tools", "vertical_params_report.txt")
BARE_CR = re.compile(r"\r(?!\n)")

# 出现在 `function` 之前时，说明这是函数表达式而非声明
EXPR_PREV = {"=", ",", "(", "[", "{", "return"}


def eol_at(src, offset):
    """返回 offset 所在行的行尾符。"""
    nl = src.find("\n", offset)
    if nl < 0:
        return "\n"
    return "\r\n" if nl > 0 and src[nl - 1] == "\r" else "\n"


def line_text_of(src, starts, offset):
    ln, _col = C.line_of(src, starts, offset)
    begin = starts[ln - 1]
    end = src.find("\n", begin)
    if end < 0:
        end = len(src)
    text = src[begin:end]
    if text.endswith("\r"):
        text = text[:-1]
    return text


def collect_edits(src, min_params=2):
    """返回 (edits, stats, records)。

    edits   = [(start, end, replacement)]
    records = [(decl_start, decl_end, local_edits)]，用于生成 before/after 样例。
    min_params < 2 时单形参声明也会被竖排（旧行为）。
    """
    tokens = C.tokenize(src)
    starts = [s for s, _e in W.iter_lines(src)]
    edits = []
    records = []
    stats = collections.Counter()

    for i, (kind, text, start, _end) in enumerate(tokens):
        if kind != "keyword" or text != "function":
            continue

        # 下一个有效 token 必须是名字，否则是匿名函数表达式
        j = i + 1
        while j < len(tokens) and tokens[j][0] == "comment":
            j += 1
        if j >= len(tokens) or tokens[j][0] != "name":
            stats["匿名函数(跳过)"] += 1
            continue

        # name ( . name | : name )*
        k = j + 1
        while (k + 1 < len(tokens) and tokens[k][1] in (".", ":")
               and tokens[k + 1][0] == "name"):
            k += 2
        if k >= len(tokens) or tokens[k][1] != "(":
            stats["非声明(跳过)"] += 1
            continue

        # 前一个有效 token 若是 = , ( [ { return，则是函数表达式
        p = i - 1
        while p >= 0 and tokens[p][0] == "comment":
            p -= 1
        if p >= 0 and tokens[p][1] in EXPR_PREV:
            stats["函数表达式(跳过)"] += 1
            continue

        paren = k
        close = W.match_bracket(tokens, paren)
        if close is None or close <= paren:
            stats["括号不匹配(跳过)"] += 1
            continue
        if close == paren + 1:
            stats["无形参(跳过)"] += 1
            continue
        if "\n" in src[tokens[paren][3]:tokens[paren + 1][2]]:
            stats["已竖排(跳过)"] += 1
            continue

        # 顶层逗号
        depth = 0
        commas = []
        for q in range(paren + 1, close):
            tx = tokens[q][1]
            if tx in W.OPEN_BR:
                depth += 1
            elif tx in W.CLOSE_BR:
                depth -= 1
            elif tx == "," and depth == 0:
                commas.append(q)

        if len(commas) + 1 < min_params:
            stats["参数不足(跳过)"] += 1
            continue

        base = line_text_of(src, starts, start)
        base = base[:len(base) - len(base.lstrip(" \t"))]
        ind4 = base + ("\t" if "\t" in base else "    ")
        eol = eol_at(src, start)

        this = []
        this.append((tokens[paren][3], tokens[paren + 1][2], eol + ind4))
        for q in commas:
            this.append((tokens[q][3], tokens[q + 1][2], eol + ind4))
        this.append((tokens[close - 1][3], tokens[close][2], eol + base))

        edits.extend(this)
        records.append((tokens[i][2], tokens[close][3], this))
        stats["已竖排"] += 1

    return edits, stats, records


def apply_edits(src, edits):
    """去重 + 排序 + 应用；区间冲突则抛错。"""
    ordered = sorted(set(edits), key=lambda e: (e[0], -e[1]))
    applied = []
    for e in ordered:
        covering = [a for a in applied if a[0] <= e[0] and e[1] <= a[1]]
        if covering:
            if any(a[2] != e[2] for a in covering):
                raise RuntimeError("编辑区间内容冲突：%r" % (e,))
            continue
        if any(e[0] < a[1] and a[0] < e[1] for a in applied):
            raise RuntimeError("编辑区间重叠：%r" % (e,))
        applied.append(e)

    applied.sort(key=lambda e: e[0])
    out = []
    pos = 0
    for s, e, rep in applied:
        out.append(src[pos:s])
        out.append(rep)
        pos = e
    out.append(src[pos:])
    return "".join(out), len(applied)


def main():
    argv = sys.argv[1:]
    do_fix = "--fix" in argv
    show = 0
    if "--show" in argv:
        show = int(argv[argv.index("--show") + 1])
    min_params = int(argv[argv.index("--min-params") + 1]) if "--min-params" in argv else 2

    files = C.collect_files()
    total = collections.Counter()
    pending = []
    report = []
    samples = []

    for path in files:
        rel = os.path.relpath(path, C.ROOT).replace("\\", "/")
        with io.open(path, "r", encoding="utf-8", newline="") as f:
            src = f.read()
        edits, stats, records = collect_edits(src, min_params)
        if not stats:
            continue
        new_src, n_applied = apply_edits(src, edits)
        total.update(stats)

        if stats.get("已竖排"):
            report.append("%s  —— 竖排 %d 个函数声明（%d 处空白编辑）"
                          % (rel, stats["已竖排"], n_applied))
            if show and len(samples) < show and records:
                a, b, local = records[0]
                shifted = [(s - a, e - a, rep) for s, e, rep in local]
                after, _ = apply_edits(src[a:b], shifted)
                samples.append((rel, src[a:b], after))

        if new_src != src:
            # 先全部校验，全部通过后才统一写回
            if not C.tokens_equal(src, new_src):
                raise RuntimeError("token 序列不一致，已中止（未写入任何文件）：%s" % path)
            if ([t[1] for t in C.tokenize(src) if t[0] == "comment"]
                    != [t[1] for t in C.tokenize(new_src) if t[0] == "comment"]):
                raise RuntimeError("注释文本被改动，已中止（未写入任何文件）：%s" % path)
            if len(BARE_CR.findall(new_src)) != len(BARE_CR.findall(src)):
                raise RuntimeError("出现孤立 CR，已中止（未写入任何文件）：%s" % path)
            if (new_src.count("\r\n") < src.count("\r\n")
                    or (new_src.count("\n") - new_src.count("\r\n")) < (src.count("\n") - src.count("\r\n"))):
                raise RuntimeError("行尾符减少，已中止（未写入任何文件）：%s" % path)
            _, stats2, _ = collect_edits(new_src, min_params)
            if stats2.get("已竖排"):
                raise RuntimeError("未收敛（不幂等）：%s" % path)
            pending.append((path, new_src))

    if do_fix:
        for path, new_src in pending:
            with io.open(path, "w", encoding="utf-8", newline="") as f:
                f.write(new_src)

    lines = []
    lines.append("function 声明形参竖排报告（min-params=%d）" % min_params)
    lines.append("已改文件：%d 个" % len(pending) if do_fix else "（本次为试算，未写回）")
    lines.append("统计：" + ", ".join("%s=%d" % (k, v) for k, v in sorted(total.items())))
    lines.append("")
    lines.extend(report)
    with io.open(REPORT_PATH, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print("试算/写回：%s | min-params=%d" % ("写回" if do_fix else "仅试算", min_params))
    print("已改文件：%d 个" % len(pending))
    print("统计：" + ", ".join("%s=%d" % (k, v) for k, v in sorted(total.items())))
    print("详细报告：%s" % os.path.relpath(REPORT_PATH, C.ROOT))

    for rel, before, after in samples:
        print("\n--- %s ---" % rel)
        print("BEFORE:")
        print(before)
        print("AFTER:")
        print(after)


if __name__ == "__main__":
    main()

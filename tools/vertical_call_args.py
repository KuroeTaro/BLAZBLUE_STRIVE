# -*- coding: utf-8 -*-
"""
把函数**调用**的实参表统一改成竖排（每个实参一行）。

规则（与 `tools/vertical_function_params.py` 的「声明形参竖排」一致）：
    f(
        arg1,
        arg2
    )
- 实参缩进 = `(` 所在行的缩进 **+4**；`)` 回到该行缩进单独一行。
- 嵌套调用按「由外向内」逐层展开（depth 0, 1, 2, ...），每层展开后重新分词，
  这样内层调用的 `(` 已经落在自己的行上，其续行缩进才正确。
- depth 不跨 `function` 边界计数：匿名 `function ... end` 体内的调用算最外层。

用法:
    python tools/vertical_call_args.py                  # 只报告（默认全部带实参的调用）
    python tools/vertical_call_args.py --fix            # 写回
    python tools/vertical_call_args.py --min-args 2     # 只处理 ≥2 个实参的调用
    python tools/vertical_call_args.py --max-depth 0    # 只处理最外层调用，不递归嵌套
    python tools/vertical_call_args.py --show 4         # 打印 before/after 样例
    python tools/vertical_call_args.py --grep SUBSTR    # 只打印含 SUBSTR 的样例

安全性（与另两个工具同一套）：
- 只在 token 之间的空白处插入「换行 + 缩进」，不增删字符；
- 换行跟随该行原有行尾符（CRLF 文件不会变混合行尾）；
- 写入前校验：token 序列一致 + 注释文本一致 + 无孤立 CR + 行尾符增量吻合 + 幂等。
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

REPORT_PATH = os.path.join(C.ROOT, "tools", "vertical_call_args_report.txt")
BARE_CR = re.compile(r"\r(?!\n)")


def call_frames(toks):
    """收集所有「调用」的实参表：{p, m, nargs, commas, depth}。

    depth = 外层「调用实参表」的层数，**不跨 function 边界计数**：
    匿名 `function ... end` 体内的调用属于独立语句，算 depth 0（最外层），
    否则 `table.insert(t, function() f(x) end)` 里的 `f(x)` 会被当成嵌套而不展开。
    判定 `(` 属于调用：紧邻的前一个 token 是名字（且其前不是 `function`），或是 `)` / `]`。
    """
    frames = []
    stack = []
    blocks = []
    pending_loop_do = 0
    fn_level = 0
    for i, (kind, text, st, en) in enumerate(toks):
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
            is_call = False
            if text == "(":
                j = i - 1
                while j >= 0 and toks[j][0] == "comment":
                    j -= 1
                if j >= 0:
                    if toks[j][0] == "name":
                        k = j - 1
                        while k >= 0 and toks[k][0] == "comment":
                            k -= 1
                        is_call = not (k >= 0 and toks[k][0] == "keyword"
                                       and toks[k][1] == "function")
                    elif toks[j][1] in (")", "]"):
                        is_call = True
            stack.append({"is_call": is_call, "p": i, "fn": fn_level,
                          "depth": sum(1 for f in stack
                                       if f["is_call"] and f["fn"] == fn_level)})
            continue
        if text in W.CLOSE_BR:
            if not stack:
                continue
            f = stack.pop()
            if text == ")" and f["is_call"]:
                f["m"] = i
                frames.append(f)

    for f in frames:
        depth = 0
        commas = []
        for q in range(f["p"] + 1, f["m"]):
            t = toks[q][1]
            if t in W.OPEN_BR:
                depth += 1
            elif t in W.CLOSE_BR:
                depth -= 1
            elif t == "," and depth == 0:
                commas.append(q)
        f["commas"] = commas
        f["nargs"] = 0 if f["m"] == f["p"] + 1 else len(commas) + 1
    return frames


def pass_edits(src, toks, frames, depth, min_args):
    """返回 (edits, 需要展开的调用数, 已符合的调用数)。"""
    starts = [s for s, _e in W.iter_lines(src)]
    edits = []
    todo = 0
    ok = 0
    for f in frames:
        if f["depth"] != depth or f["nargs"] < min_args or f["m"] == f["p"] + 1:
            continue
        p, m = f["p"], f["m"]
        line = V.line_text_of(src, starts, toks[p][2])
        base = line[:len(line) - len(line.lstrip(" \t"))]
        ind4 = base + ("\t" if "\t" in base else "    ")
        eol = V.eol_at(src, toks[p][2])

        this = []
        s, e = toks[p][3], toks[p + 1][2]
        if src[s:e] != eol + ind4:
            this.append((s, e, eol + ind4))
        for q in f["commas"]:
            s, e = toks[q][3], toks[q + 1][2]
            if src[s:e] != eol + ind4:
                this.append((s, e, eol + ind4))
        s, e = toks[m - 1][3], toks[m][2]
        if src[s:e] != eol + base:
            this.append((s, e, eol + base))

        if this:
            edits.extend(this)
            todo += 1
        else:
            ok += 1
    return edits, todo, ok


def process(src, min_args, max_depth):
    """逐层展开；返回 (new_src, stats)。"""
    stats = collections.Counter()
    depth = 0
    while max_depth is None or depth <= max_depth:
        toks = C.tokenize(src)
        frames = call_frames(toks)
        edits, todo, ok = pass_edits(src, toks, frames, depth, min_args)
        if not frames:
            break
        at_depth = sum(1 for f in frames
                       if f["depth"] == depth and f["nargs"] >= min_args and f["m"] > f["p"] + 1)
        if at_depth == 0:
            break
        stats["已竖排"] += todo
        stats["已符合"] += ok
        if not edits:
            break
        new_src, _n = V.apply_edits(src, edits)
        if new_src == src:
            break
        src = new_src
        depth += 1
    return src, stats


def main():
    argv = sys.argv[1:]
    do_fix = "--fix" in argv
    min_args = int(argv[argv.index("--min-args") + 1]) if "--min-args" in argv else 1
    max_depth = int(argv[argv.index("--max-depth") + 1]) if "--max-depth" in argv else None
    show = int(argv[argv.index("--show") + 1]) if "--show" in argv else 0
    grep = argv[argv.index("--grep") + 1] if "--grep" in argv else None

    files = C.collect_files()
    total = collections.Counter()
    pending = []
    report = []
    samples = []

    for path in files:
        rel = os.path.relpath(path, C.ROOT).replace("\\", "/")
        with io.open(path, "r", encoding="utf-8", newline="") as f:
            src = f.read()
        new_src, stats = process(src, min_args, max_depth)
        if not stats:
            continue
        total.update(stats)
        if stats.get("已竖排"):
            report.append("%s  —— 竖排 %d 个调用（%d 个原本已符合）"
                          % (rel, stats["已竖排"], stats.get("已符合", 0)))

        if new_src != src:
            if not C.tokens_equal(src, new_src):
                raise RuntimeError("token 序列不一致，已中止（未写入任何文件）：%s" % path)
            if ([t[1] for t in C.tokenize(src) if t[0] == "comment"]
                    != [t[1] for t in C.tokenize(new_src) if t[0] == "comment"]):
                raise RuntimeError("注释文本被改动，已中止（未写入任何文件）：%s" % path)
            if len(BARE_CR.findall(new_src)) != len(BARE_CR.findall(src)):
                raise RuntimeError("出现孤立 CR，已中止（未写入任何文件）：%s" % path)
            if (new_src.count("\r\n") < src.count("\r\n")
                    or (new_src.count("\n") - new_src.count("\r\n"))
                    < (src.count("\n") - src.count("\r\n"))):
                raise RuntimeError("行尾符减少，已中止（未写入任何文件）：%s" % path)
            _, again = process(new_src, min_args, max_depth)
            if again.get("已竖排"):
                raise RuntimeError("未收敛（不幂等）：%s" % path)
            pending.append((path, new_src))

            if show and len(samples) < show:
                toks = C.tokenize(src)
                for f in call_frames(toks):
                    if f["depth"] != 0 or f["nargs"] < min_args or f["m"] == f["p"] + 1:
                        continue
                    p, m = f["p"], f["m"]
                    if "\n" in src[toks[p][2]:toks[m][3]]:
                        continue
                    k = p - 1
                    while k >= 0 and toks[k][0] == "comment":
                        k -= 1
                    start_tok = k if k >= 0 and toks[k][0] == "name" else p
                    a0 = toks[start_tok][2]
                    before = src[a0:toks[m][3]]
                    if grep and grep not in before:
                        continue
                    local = V.apply_edits(before, [(s - a0, e - a0, r)
                                                   for s, e, r in
                                                   pass_edits(src, toks, [f], 0, min_args)[0]])
                    samples.append((rel, before, local[0]))
                    break

    if do_fix:
        for path, new_src in pending:
            with io.open(path, "w", encoding="utf-8", newline="") as f:
                f.write(new_src)

    lines = []
    lines.append("调用实参竖排报告（min-args=%d, max-depth=%s）"
                 % (min_args, "不限" if max_depth is None else max_depth))
    lines.append("已改文件：%d 个" % len(pending) if do_fix else "（本次为试算，未写回）")
    lines.append("统计：" + ", ".join("%s=%d" % (k, v) for k, v in sorted(total.items())))
    lines.append("")
    lines.extend(report)
    with io.open(REPORT_PATH, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print("试算/写回：%s | min-args=%d | max-depth=%s"
          % ("写回" if do_fix else "仅试算", min_args, "不限" if max_depth is None else max_depth))
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

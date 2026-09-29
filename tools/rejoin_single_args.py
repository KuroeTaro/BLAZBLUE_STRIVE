# -*- coding: utf-8 -*-
"""
【已废弃 2026-09-29】已被 `tools/wrap_arg_lists.py` 取代（单参数只是它的特例）。
**不要再跑本工具**。保留代码仅作历史参考。

把「只有一个参数」的形参表 / 实参表合并回一行（不再换行）。

规则（用户 2026-09-29 追加，声明与调用都适用）：
    function name(a)     -- 而不是 function name(\n    a\n)
    f(x)                 -- 而不是 f(\n    x\n)
- 参数本身是多行结构（表构造 / 匿名函数 / 多参嵌套调用）时，只合并
  「`(` 之后」与「`)` 之前」这两处换行，参数内部原样保留。
- 无参数（`f()`）本来就没有换行，不动。

跳过（安全考虑，逐条在报告里列出）：
- 参数表范围内含**行注释**（`--`）：合并会把后面的 token 注释掉、或把 `)` 吞进注释里。
- 合并后该逻辑行超过 `--max-len`（默认 120）：与「超长行折行」规则冲突，交人工定夺。

安全性（与另外三个工具同一套）：
- 只在 token 之间的空白里**删除**换行 + 缩进，不增删任何字符；
- 写入前逐文件校验：token 序列一致 + 注释文本一致 + 无孤立 CR + 行尾符只减不增 + 幂等；
- 全部文件校验通过后才统一写回。

用法:
    python tools/rejoin_single_args.py                    # 只报告
    python tools/rejoin_single_args.py --fix              # 写回
    python tools/rejoin_single_args.py --show 4           # 打印 before/after 样例
    python tools/rejoin_single_args.py --grep SUBSTR      # 只看含 SUBSTR 的样例
    python tools/rejoin_single_args.py --max-len 120
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
import vertical_call_args as VCA  # noqa: E402

REPORT_PATH = os.path.join(C.ROOT, "tools", "rejoin_single_args_report.txt")
BARE_CR = re.compile(r"\r(?!\n)")
BLOCK_COMMENT_OPEN = re.compile(r"^--\[=*\[")


def is_line_comment(text):
    """`--` 到行尾的注释（块注释 `--[[` 不算）。"""
    t = text[:-1] if text.endswith("\r") else text
    return t.startswith("--") and not BLOCK_COMMENT_OPEN.match(t)


def top_level_args(toks, p, m):
    """参数表 `(`..`)` 的顶层参数个数（`f()` 记 0）。"""
    if m == p + 1:
        return 0
    depth = 0
    commas = 0
    for q in range(p + 1, m):
        tx = toks[q][1]
        if tx in W.OPEN_BR:
            depth += 1
        elif tx in W.CLOSE_BR:
            depth -= 1
        elif tx == "," and depth == 0:
            commas += 1
    return commas + 1


def decl_parens(toks):
    """具名函数声明的形参表 `(` 下标（判定逻辑与 vertical_function_params 一致）。"""
    out = []
    for i, (kind, text, _st, _en) in enumerate(toks):
        if kind != "keyword" or text != "function":
            continue
        j = i + 1
        while j < len(toks) and toks[j][0] == "comment":
            j += 1
        if j >= len(toks) or toks[j][0] != "name":
            continue                                  # 匿名函数
        k = j + 1
        while (k + 1 < len(toks) and toks[k][1] in (".", ":")
               and toks[k + 1][0] == "name"):
            k += 2
        if k >= len(toks) or toks[k][1] != "(":
            continue
        prev = i - 1
        while prev >= 0 and toks[prev][0] == "comment":
            prev -= 1
        if prev >= 0 and toks[prev][1] in V.EXPR_PREV:
            continue                                  # 函数表达式
        m = W.match_bracket(toks, k)
        if m is not None:
            out.append((k, m))
    return out


def all_frames(toks):
    """所有「调用实参表」+「具名声明形参表」：[(kind, p, m, n)]。"""
    frames = []
    for p, m in decl_parens(toks):
        frames.append(("decl", p, m, top_level_args(toks, p, m)))
    for f in VCA.call_frames(toks):
        frames.append(("call", f["p"], f["m"], f["nargs"]))
    return frames


def line_span(src, starts, offset):
    """返回 offset 所在行的 (start, end)，end 不含行尾符。"""
    ln, _col = C.line_of(src, starts, offset)
    begin = starts[ln - 1]
    end = src.find("\n", begin)
    if end < 0:
        end = len(src)
    if end > begin and src[end - 1] == "\r":
        end -= 1
    return begin, end


def analyze(src, max_len):
    """返回 (edits, records, stats)。edits = [(start, end, "")]。"""
    toks = C.tokenize(src)
    starts = [s for s, _e in W.iter_lines(src)]
    edits = []
    records = []
    skipped = []
    stats = collections.Counter()

    for kind, p, m, n in all_frames(toks):
        if n != 1:
            if n == 0:
                stats["无参数(跳过)"] += 1
            else:
                stats["多参数(不适用)"] += 1
            continue

        gap_a = (toks[p][3], toks[p + 1][2])        # `(` 之后
        gap_b = (toks[m - 1][3], toks[m][2])        # `)` 之前
        broken_a = "\n" in src[gap_a[0]:gap_a[1]]
        broken_b = "\n" in src[gap_b[0]:gap_b[1]]
        if not (broken_a or broken_b):
            stats["已单行(跳过)"] += 1
            continue

        # 参数表内含行注释 -> 合并会破坏代码，跳过
        if any(toks[q][0] == "comment" and is_line_comment(toks[q][1])
               for q in range(p + 1, m)):
            stats["跳过:含行注释"] += 1
            skipped.append(("含行注释", kind, src[:toks[p][2]].count("\n") + 1,
                            V.line_text_of(src, starts, toks[p][2]).strip()))
            continue

        # 合并后的逻辑行长度
        ls, le = line_span(src, starts, toks[p][2])
        le2 = line_span(src, starts, toks[m][3])[1]
        local = []
        if broken_a:
            local.append((gap_a[0] - ls, gap_a[1] - ls, ""))
        if broken_b:
            local.append((gap_b[0] - ls, gap_b[1] - ls, ""))
        merged, _n = V.apply_edits(src[ls:le2], local)
        longest = max(len(x) for x in merged.split("\n"))
        if longest > max_len:
            stats["跳过:合并后超长"] += 1
            skipped.append(("合并后超长(%d)" % longest, kind,
                            src[:toks[p][2]].count("\n") + 1,
                            V.line_text_of(src, starts, toks[p][2]).strip()))
            continue

        this = []
        if broken_a:
            this.append((gap_a[0], gap_a[1], ""))
        if broken_b:
            this.append((gap_b[0], gap_b[1], ""))
        edits.extend(this)
        stats["已合并"] += 1
        stats["已合并:" + kind] += 1
        records.append((kind, ls, le2, this, longest,
                        src[toks[p + 1][2]:toks[m - 1][3]]))

    return edits, records, stats, skipped


def main():
    argv = sys.argv[1:]
    do_fix = "--fix" in argv
    show = int(argv[argv.index("--show") + 1]) if "--show" in argv else 0
    grep = argv[argv.index("--grep") + 1] if "--grep" in argv else None
    max_len = int(argv[argv.index("--max-len") + 1]) if "--max-len" in argv else 120
    multi_only = "--multiline-only" in argv

    files = C.collect_files()
    total = collections.Counter()
    pending = []
    report = []
    samples = []
    all_skipped = []

    for path in files:
        rel = os.path.relpath(path, C.ROOT).replace("\\", "/")
        with io.open(path, "r", encoding="utf-8", newline="") as f:
            src = f.read()
        edits, records, stats, skipped = analyze(src, max_len)
        new_src, n_applied = V.apply_edits(src, edits)
        if new_src != src:
            # 合并会让内层「已竖排」列表的 `(` 位移，跟着修正续行缩进
            # （只改缩进、不新建换行，见 vertical_call_args --reindent-only）
            new_src, vstats = VCA.process(new_src, 1, None, reindent_only=True)
            stats["缩进修正"] += vstats.get("已竖排", 0)
        if not stats:
            continue
        total.update(stats)
        for why, kind, ln, text in skipped:
            all_skipped.append("%s:%d  [%s|%s]  %s" % (rel, ln, why, kind, text))

        if stats.get("已合并"):
            report.append("%s  —— 合并 %d 个（声明 %d / 调用 %d）+ 缩进修正 %d"
                          % (rel, stats["已合并"], stats.get("已合并:decl", 0),
                             stats.get("已合并:call", 0), stats.get("缩进修正", 0)))

        if show and len(samples) < show:
            for kind, ls, le2, this, _longest, argtext in records:
                if multi_only and "\n" not in argtext:
                    continue
                before = src[ls:le2]
                if grep and grep not in before:
                    continue
                after, _ = V.apply_edits(before, [(s - ls, e - ls, r) for s, e, r in this])
                samples.append((rel, before, after))
                break

        if new_src != src:
            if not C.tokens_equal(src, new_src):
                raise RuntimeError("token 序列不一致，已中止（未写入任何文件）：%s" % path)
            if ([t[1] for t in C.tokenize(src) if t[0] == "comment"]
                    != [t[1] for t in C.tokenize(new_src) if t[0] == "comment"]):
                raise RuntimeError("注释文本被改动，已中止（未写入任何文件）：%s" % path)
            if len(BARE_CR.findall(new_src)) != len(BARE_CR.findall(src)):
                raise RuntimeError("出现孤立 CR，已中止（未写入任何文件）：%s" % path)
            if (new_src.count("\r\n") > src.count("\r\n")
                    or (new_src.count("\n") - new_src.count("\r\n"))
                    > (src.count("\n") - src.count("\r\n"))):
                raise RuntimeError("行尾符变多（应只减少），已中止：%s" % path)
            _e2, _r2, stats2, _s2 = analyze(new_src, max_len)
            _n2, vstats2 = VCA.process(new_src, 1, None, reindent_only=True)
            if stats2.get("已合并") or vstats2.get("已竖排"):
                raise RuntimeError("未收敛（不幂等）：%s" % path)
            pending.append((path, new_src, n_applied))

    if do_fix:
        for path, new_src, _n in pending:
            with io.open(path, "w", encoding="utf-8", newline="") as f:
                f.write(new_src)

    lines = []
    lines.append("单参数合并回一行报告（max-len=%d）" % max_len)
    lines.append("已改文件：%d 个" % len(pending) if do_fix else "（本次为试算，未写回）")
    lines.append("统计：" + ", ".join("%s=%d" % (k, v) for k, v in sorted(total.items())))
    lines.append("")
    lines.extend(report)
    if all_skipped:
        lines.append("")
        lines.append("---- 跳过明细（%d 处）----" % len(all_skipped))
        lines.extend(all_skipped)
    with io.open(REPORT_PATH, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print("试算/写回：%s | max-len=%d" % ("写回" if do_fix else "仅试算", max_len))
    print("已改文件：%d 个" % len(pending))
    print("统计：" + ", ".join("%s=%d" % (k, v) for k, v in sorted(total.items())))
    print("跳过明细：%d 处" % len(all_skipped))
    print("详细报告：%s" % os.path.relpath(REPORT_PATH, C.ROOT))

    for rel, before, after in samples:
        print("\n--- %s ---" % rel)
        print("BEFORE:")
        print(before)
        print("AFTER:")
        print(after)


if __name__ == "__main__":
    main()

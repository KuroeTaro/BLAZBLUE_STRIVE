# -*- coding: utf-8 -*-
"""
保证每个目标文件**末尾不是空行**。

规则:
  - 文件末尾的空白（空行、只含空格/制表符的行、最后一个行尾符）全部删掉，
    即文件最后一行就是内容行，后面不再跟着空行；
  - 只删末尾空白，不动其它任何东西；已经是「以非空白字符结尾」的文件不改（幂等）；
  - 整个文件都是空白的文件，跳过并记入报告。

安全性（与其它工具同一套）:
  - 只删末尾空白，不增删任何非空白字符；
  - 写入前逐文件校验：去空白后内容一致 + token 序列一致 + 注释文本（去尾部空白）一致
    + 不新增孤立 CR + 幂等；
  - 全部文件校验通过后才统一写回。

用法:
    python tools/trim_eof_blank_lines.py          # 只报告
    python tools/trim_eof_blank_lines.py --fix    # 写回
"""
import io
import os
import re
import sys
import collections

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import check_operator_spacing as C  # noqa: E402

REPORT_PATH = os.path.join(C.ROOT, "tools", "trim_eof_report.txt")
BARE_CR = re.compile(r"\r(?!\n)")
FIRST_EOL = re.compile(r"\r\n|\n")


def eof_fix(src):
    """返回 (new_src, removed_text_or_None, verdict)。

    把文件末尾的空白（含最后一个行尾符）全部删掉，使最后一行就是内容行。
    """
    new = src.rstrip(" \t\r\n")
    if not new:
        return src, None, "skip:all-blank"
    if new == src:
        return src, None, "ok"
    return new, src[len(new):], "fix"


def main():
    argv = sys.argv[1:]
    do_fix = "--fix" in argv

    files = C.collect_files()
    total = collections.Counter()
    pending = []
    details = []

    for path in files:
        rel = os.path.relpath(path, C.ROOT).replace("\\", "/")
        with io.open(path, "r", encoding="utf-8", newline="") as f:
            src = f.read()
        new_src, removed, verdict = eof_fix(src)
        total[verdict] += 1

        if new_src != src:
            if re.sub(r"\s", "", src) != re.sub(r"\s", "", new_src):
                raise RuntimeError("出现非空白改动，已中止（未写入任何文件）：%s" % path)
            if not C.tokens_equal(src, new_src):
                raise RuntimeError("token 序列不一致，已中止（未写入任何文件）：%s" % path)
            if ([(t[1].rstrip()) for t in C.tokenize(src) if t[0] == "comment"]
                    != [(t[1].rstrip()) for t in C.tokenize(new_src) if t[0] == "comment"]):
                raise RuntimeError("注释文本被改动，已中止（未写入任何文件）：%s" % path)
            if len(BARE_CR.findall(new_src)) != len(BARE_CR.findall(src)):
                raise RuntimeError("出现孤立 CR，已中止（未写入任何文件）：%s" % path)
            if eof_fix(new_src)[0] != new_src:
                raise RuntimeError("未收敛（不幂等）：%s" % path)
            pending.append((path, new_src))
            details.append("%s  —— 删掉末尾空白 %r" % (rel, removed))

    if do_fix:
        for path, new_src in pending:
            with io.open(path, "w", encoding="utf-8", newline="") as f:
                f.write(new_src)

    lines = ["文件末尾空行清理报告"]
    lines.append("已改文件：%d 个" % len(pending) if do_fix else "（本次为试算，未写回）")
    lines.append("统计：" + ", ".join("%s=%d" % (k, v) for k, v in sorted(total.items())))
    lines.append("")
    lines.extend(details)
    with io.open(REPORT_PATH, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))

    print("试算/写回：%s" % ("写回" if do_fix else "仅试算"))
    print("已改文件：%d 个" % len(pending))
    print("统计：" + ", ".join("%s=%d" % (k, v) for k, v in sorted(total.items())))
    print("详细报告：%s" % os.path.relpath(REPORT_PATH, C.ROOT))


if __name__ == "__main__":
    main()

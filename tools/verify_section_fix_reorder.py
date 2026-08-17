# -*- coding: utf-8 -*-
"""
verify_section_fix_reorder.py
=============================
验证 check_section_placement 修复是"纯重排": 剥离注释后,
工作区文件的语句序列应与 git HEAD 完全一致 (multiset 0 diff).
"""

import io
import re
import subprocess
from collections import Counter

FILES = [
    r"scenes/game_scene/characters/TRM/_anim.lua",
    r"scenes/game_scene/_common/_anim.lua",
]


# 复用 check_section_placement 的词法器 (只取非注释 token 的归一化序列)
def scan_lua(text):
    toks = []
    i, n, line = 0, len(text), 1
    while i < n:
        c = text[i]
        if c == "\n":
            line += 1; i += 1; continue
        if c in " \t\r":
            i += 1; continue
        if c == "-" and i + 1 < n and text[i+1] == "-":
            j = i + 2
            if j < n and text[j] == "[":
                eq = 0; k = j + 1
                while k < n and text[k] == "=": eq += 1; k += 1
                if k < n and text[k] == "[":
                    endpat = "]" + "="*eq + "]"; k += 1
                    while k < n and text[k:k+len(endpat)] != endpat:
                        if text[k] == "\n": line += 1
                        k += 1
                    if k < n: k += len(endpat)
                    i = k; continue
            while j < n and text[j] != "\n": j += 1
            i = j; continue
        if c == "[":
            eq = 0; k = i + 1
            while k < n and text[k] == "=": eq += 1; k += 1
            if k < n and text[k] == "[":
                endpat = "]" + "="*eq + "]"; k += 1
                while k < n and text[k:k+len(endpat)] != endpat:
                    if text[k] == "\n": line += 1
                    k += 1
                if k < n: k += len(endpat)
                toks.append("STR"); i = k; continue
        if c in ('"', "'"):
            q = c; j = i + 1
            while j < n:
                if text[j] == "\\": j += 2; continue
                if text[j] == q: j += 1; break
                if text[j] == "\n": line += 1
                j += 1
            toks.append("STR"); i = j; continue
        if c.isalpha() or c == "_":
            j = i + 1
            while j < n and (text[j].isalnum() or text[j] == "_"): j += 1
            toks.append(text[i:j]); i = j; continue
        if c.isdigit() or (c == "." and i+1 < n and text[i+1].isdigit()):
            j = i + 1
            while j < n and (text[j].isalnum() or text[j] in "._"): j += 1
            toks.append("NUM"); i = j; continue
        toks.append(c); i += 1
    return toks


def git_show_head(relpath):
    out = subprocess.run(
        ["git", "-C", r"h:/_love/BLAZBLUE_STRIVE", "show", "HEAD:" + relpath],
        capture_output=True)
    if out.returncode != 0:
        raise RuntimeError("git show failed: " + out.stderr.decode("utf-8", "replace"))
    return out.stdout.decode("utf-8", "replace")


def main():
    ok = True
    for rel in FILES:
        head_text = git_show_head(rel)
        with io.open(r"h:/_love/BLAZBLUE_STRIVE/" + rel, "r", encoding="utf-8") as f:
            work_text = f.read()
        a = Counter(scan_lua(head_text))
        b = Counter(scan_lua(work_text))
        if a == b:
            print(f"OK  (multiset 0 diff)  {rel}")
        else:
            ok = False
            print(f"DIFF {rel}")
            only_a = a - b
            only_b = b - a
            print("  HEAD-only:", dict(only_a))
            print("  WORK-only:", dict(only_b))
    print("=== RESULT:", "PURE REORDER (statements unchanged)" if ok else "STATEMENT CHANGES DETECTED")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())

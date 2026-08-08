# -*- coding: utf-8 -*-
"""
One-shot refactor for scenes/game_scene/_common/_VFX.lua
========================================================
Task 8 rule: in functions with active_op_side_obj_char / passive_op_side_obj_char
params, prefix single-side-derived LOCAL variables with active_op_ / passive_op_.
Both-side quantities (reference BOTH sides, e.g. center_dx, distance-based x/y)
stay unprefixed. Structural locals (obj_VFX, obj_camera, image_sprite_sheet,
side_table, res, switch, this_function) are never renamed. Function params are
never renamed.

Classification = simple dataflow:
  - a `local NAME = EXPR` inherits the side of the side-object token and/or the
    side of any referenced (already classified) local in EXPR;
  - if EXPR references BOTH sides -> unprefixed;
  - if it references neither -> unprefixed.

Rename applies to every word-boundary occurrence of NAME within that function's
body only (the signature line, holding params, is excluded).

Usage:  python tools/refactor_vfx_prefixes.py
"""
import re
import sys

PATH = r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\_common\_VFX.lua"

DENYLIST = {
    "obj_VFX", "obj_camera", "image_sprite_sheet", "side_table",
    "res", "switch", "this_function", "side",
}

LOCAL_RE = re.compile(r"^(\s*)local\s+(\w+)\s*=\s*(.*)$")
FUNC_RE = re.compile(r"^function\s+(\w+)\s*\((.*)\)\s*$")
WORD_RE = lambda name: re.compile(r"\b" + re.escape(name) + r"\b")


def replace_outside_strings(line, name, newname):
    """Replace word-boundary occurrences of `name` that are NOT inside a
    string literal (so quoted table keys like "x" are left untouched)."""
    pat = WORD_RE(name)
    out = []
    i, n = 0, len(line)
    in_str = None  # None, '"', "'"
    while i < n:
        c = line[i]
        if in_str:
            out.append(c)
            if c == "\\" and i + 1 < n:
                out.append(line[i + 1])
                i += 2
                continue
            if c == in_str:
                in_str = None
            i += 1
            continue
        if c in ('"', "'"):
            in_str = c
            out.append(c)
            i += 1
            continue
        m = pat.match(line, i)
        if m:
            out.append(newname)
            i = m.end()
            continue
        out.append(c)
        i += 1
    return "".join(out)


def sides_in_expr(expr, local_prefixes):
    """Return the set of side markers present in expr."""
    sides = set()
    if "active_op_side_obj_char" in expr:
        sides.add("active_op")
    if "passive_op_side_obj_char" in expr:
        sides.add("passive_op")
    for name, prefix in local_prefixes.items():
        if prefix and WORD_RE(name).search(expr):
            sides.add(prefix)
    return sides


def main():
    with open(PATH, encoding="utf-8") as f:
        lines = f.readlines()

    # Split into top-level functions by `^function ` (column 0).
    funcs = []  # (name, start_line_idx, end_line_idx_exclusive)
    start = None
    for i, line in enumerate(lines):
        if line.startswith("function "):
            if start is not None:
                funcs.append((name, start, i))
            m = FUNC_RE.match(line.strip())
            name = m.group(1) if m else ("<anon>@" + str(i))
            start = i
    if start is not None:
        funcs.append((name, start, len(lines)))

    total_renames = 0
    report = []

    for fname, s, e in funcs:
        body = lines[s + 1:e]  # exclude the signature line (params)
        local_prefixes = {}    # name -> "" | "active" | "passive"
        renames = []           # (name, prefix)

        # pass 1: classify local declarations (in order, top-to-bottom)
        for line in body:
            stripped = line.lstrip()
            if stripped.startswith("local function"):
                continue
            m = LOCAL_RE.match(line)
            if not m:
                continue
            name = m.group(2)
            expr = m.group(3)
            if name in DENYLIST:
                local_prefixes[name] = ""
                continue
            sides = sides_in_expr(expr, local_prefixes)
            if sides == {"active_op"}:
                prefix = "active_op"
            elif sides == {"passive_op"}:
                prefix = "passive_op"
            else:
                prefix = ""
            local_prefixes[name] = prefix
            if prefix:
                renames.append((name, prefix))

        if not renames:
            continue

        # pass 2: apply word-boundary renames across the body (string-aware)
        func_renames = 0
        new_body = []
        for line in body:
            out = line
            for name, prefix in renames:
                out = replace_outside_strings(out, name, prefix + "_" + name)
            if out != line:
                func_renames += 1
            new_body.append(out)

        lines[s + 1:e] = new_body
        total_renames += len(renames)
        report.append(
            "%s (%d decls): %s"
            % (fname, len(renames),
               ", ".join("%s->%s_%s" % (n, p, n) for n, p in renames))
        )

    with open(PATH, "w", encoding="utf-8", newline="") as f:
        f.writelines(lines)

    print("Total renamed locals: %d in %d functions" % (total_renames, len(report)))
    for r in report:
        print(r)
    return 0


if __name__ == "__main__":
    sys.exit(main())

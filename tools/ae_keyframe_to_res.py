# -*- coding: utf-8 -*-
"""
把 AE 导出的 Keyframe Data 文本(Time Remap 等)转成 _anim.lua 里可直接粘贴的逐帧表:

    res[0] = function()
        -- draw_correction
        obj_char[8] = 0
    end

背景:
    AE 的 Time Remap 关键帧是「合成帧 -> 源时间(秒)」。源片以 60fps 导出时,
    源帧 = 秒 * 60(四舍五入);合成帧就是动画里的 res 下标(逻辑帧)。
    所以一条 Time Remap 曲线 == 一张「逻辑帧 -> 序列图第几帧」的跳转表。

用法:
    python tools/ae_keyframe_to_res.py keyframe.txt
    python tools/ae_keyframe_to_res.py - --var hit_side_obj_char --min-frame 1
    python tools/ae_keyframe_to_res.py keyframe.txt --compact --skip-same

    -           从 stdin 读(可以直接粘贴)
    --property  要转的属性名,默认 "Time Remap"
    --var       写进 res 的变量名,默认 obj_char(角色动画常用 hit_side_obj_char)
    --fps       覆盖 "Units Per Second"(默认读文件头)
    --min-frame 丢掉 res 下标小于它的关键帧(0 通常已被 state 初始化占用)
    --frame-offset 给 res 下标整体加偏移
    --skip-same 丢掉和上一条源帧相同的连续关键帧
    --sheet-frames N 校验源帧是否落在 0..N-1
    --compact   输出单行 res[x] = function() obj_char[8] = a end
    --out       写进文件(默认打印到 stdout)
"""
import argparse
import re
import sys

# Windows 管道/重定向时默认是本地编码(cp936),统一成 UTF-8 免得中文摘要乱码
for _stream in (sys.stdin, sys.stdout, sys.stderr):
    try:
        _stream.reconfigure(encoding="utf-8")
    except (AttributeError, ValueError):
        pass

AE_MAGIC = "Adobe After Effects"
AE_END = "End of Keyframe Data"
NUMBER_RE = re.compile(r"^[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?$")
CELL_SPLIT_RE = re.compile(r"\t+|\s{2,}")
INDENT = "    "
UNITS_RE = re.compile(r"^Units Per Second\s+([0-9.]+)$")
META_RE = re.compile(r"^(Source Width|Source Height|Source Pixel Aspect Ratio|Comp Pixel Aspect Ratio)\b")


def split_cells(line):
    return [c for c in CELL_SPLIT_RE.split(line.strip()) if c]


def is_number(s):
    return bool(NUMBER_RE.match(s))


def parse_ae_text(text):
    """解析 AE Keyframe Data,返回 (units_per_second, {属性名: {"header": [...], "rows": [[帧, 值], ...]}})。"""
    lines = text.splitlines()
    blocks = {}
    units_per_second = None
    i = 0
    n = len(lines)
    while i < n:
        raw = lines[i]
        stripped = raw.strip()
        if not stripped or stripped.startswith(AE_MAGIC) or stripped == AE_END:
            i += 1
            continue
        m = UNITS_RE.match(stripped)
        if m:
            units_per_second = float(m.group(1))
            i += 1
            continue
        if META_RE.match(stripped):
            i += 1
            continue
        # 属性名行:顶格、非空白开头
        if raw[:1] not in (" ", "\t"):
            name = stripped
            j = i + 1
            while j < n and not lines[j].strip():
                j += 1
            header = split_cells(lines[j]) if j < n else []
            if header and header[0].lower() == "frame":
                j += 1
                rows = []
                while j < n:
                    if not lines[j].strip():
                        break
                    cells = split_cells(lines[j])
                    if len(cells) < 2 or not is_number(cells[0]) or not is_number(cells[1]):
                        break
                    rows.append((float(cells[0]), float(cells[1])))
                    j += 1
                blocks[name] = {"header": [h.lower() for h in header], "rows": rows}
                i = j
                continue
        i += 1
    return units_per_second, blocks


def value_to_source_frame(value, column_name, fps):
    """AE 的数值列 -> 序列图帧号。秒 -> *fps,已经是帧 -> 直接用。"""
    if "sec" in column_name:
        return int(round(value * fps))
    return int(round(value))


def build_lines(rows, fps, column_name, var, min_frame, frame_offset, skip_same, sheet_frames, compact):
    """生成 res[x] 代码行,返回 (lines, stats)。"""
    stats = {"total": len(rows), "emitted": 0, "same": 0, "dropped": 0, "warn": []}
    prefix = INDENT
    out = []
    prev_src = None
    for comp_frame, value in rows:
        res_frame = int(round(comp_frame)) + frame_offset
        if res_frame < min_frame:
            stats["dropped"] += 1
            continue
        src = value_to_source_frame(value, column_name, fps)
        if src < 0:
            stats["warn"].append("源帧为负: 合成帧 %d -> %d" % (res_frame, src))
            continue
        if sheet_frames is not None and src >= sheet_frames:
            stats["warn"].append(
                "源帧越界: 合成帧 %d -> 源帧 %d(序列图只有 %d 帧 0..%d)"
                % (res_frame, src, sheet_frames, sheet_frames - 1))
        if skip_same and prev_src is not None and src == prev_src:
            stats["same"] += 1
            prev_src = src
            continue
        prev_src = src
        if compact:
            out.append("%sres[%d] = function() %s[8] = %d end" % (prefix, res_frame, var, src))
        else:
            out.append("%sres[%d] = function()" % (prefix, res_frame))
            out.append("%s    -- draw_correction" % prefix)
            out.append("%s    %s[8] = %d" % (prefix, var, src))
            out.append("%send" % prefix)
        stats["emitted"] += 1
    return out, stats


def main(argv=None):
    ap = argparse.ArgumentParser(add_help=True, description="AE Keyframe Data -> Lua res[x] 跳转表")
    ap.add_argument("input", nargs="?", default="-", help="AE 导出的 txt;省略或 - 表示 stdin")
    ap.add_argument("--property", default="Time Remap", help="要转的属性名(默认 Time Remap)")
    ap.add_argument("--var", default="obj_char", help="写进 res 的变量名(默认 obj_char)")
    ap.add_argument("--fps", type=float, default=None, help="覆盖文件头的 Units Per Second")
    ap.add_argument("--min-frame", type=int, default=None, help="丢弃 res 下标小于它的关键帧")
    ap.add_argument("--frame-offset", type=int, default=0, help="res 下标的整体偏移")
    ap.add_argument("--skip-same", action="store_true", help="丢弃与上一条源帧相同的连续关键帧")
    ap.add_argument("--sheet-frames", type=int, default=None, help="序列图总帧数,用于越界校验")
    ap.add_argument("--compact", action="store_true", help="单行输出 res[x] = function() var[8] = a end")
    ap.add_argument("--out", default=None, help="写入文件(默认 stdout)")
    args = ap.parse_args(argv)

    if args.input == "-":
        text = sys.stdin.read()
    else:
        with open(args.input, "r", encoding="utf-8-sig") as f:
            text = f.read()

    units_per_second, blocks = parse_ae_text(text)
    if not blocks:
        print("没解析到任何关键帧属性,检查一下粘贴内容是否完整", file=sys.stderr)
        return 1

    wanted = [name for name in blocks if name.lower() == args.property.lower()]
    if not wanted:
        print("找不到属性 %r,文件里有: %s" % (args.property, ", ".join(blocks)), file=sys.stderr)
        return 1
    name = wanted[0]
    block = blocks[name]
    header = block["header"]
    column_name = header[1] if len(header) > 1 else "seconds"

    fps = args.fps if args.fps else (units_per_second or 60.0)
    if not args.fps and units_per_second is None:
        print("文件头没有 Units Per Second,按 60fps 处理(--fps 可覆盖)", file=sys.stderr)

    min_frame = args.min_frame if args.min_frame is not None else -(10 ** 9)
    lines, stats = build_lines(block["rows"], fps, column_name, args.var, min_frame,
                               args.frame_offset, args.skip_same, args.sheet_frames, args.compact)
    output = "\n".join(lines) + ("\n" if lines else "")

    if args.out:
        with open(args.out, "w", encoding="utf-8", newline="\n") as f:
            f.write(output)
    else:
        sys.stdout.write(output)
        sys.stdout.flush()

    src_values = [value_to_source_frame(v, column_name, fps) for _, v in block["rows"]]
    print("属性: %s   帧率: %g   数值列: %s" % (name, fps, column_name), file=sys.stderr)
    print("关键帧: %d 个 -> 输出 %d 条 res(跳过 min-frame %d 条 / 同值 %d 条)"
          % (stats["total"], stats["emitted"], stats["dropped"], stats["same"]), file=sys.stderr)
    if block["rows"]:
        print("合成帧: %d..%d   源帧: %d..%d"
              % (int(round(block["rows"][0][0])) + args.frame_offset,
                 int(round(block["rows"][-1][0])) + args.frame_offset,
                 min(src_values), max(src_values)), file=sys.stderr)
    if block["rows"] and int(round(block["rows"][0][0])) + args.frame_offset == 0:
        print("提示: res[0] 通常已被 state 初始化占用,--min-frame 1 可跳过它", file=sys.stderr)
    for w in stats["warn"]:
        print("!! " + w, file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())

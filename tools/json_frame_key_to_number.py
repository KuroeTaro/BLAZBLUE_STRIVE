# -*- coding: utf-8 -*-
"""
把 sprite_sheet 的 TexturePacker json 里「纯数字序号」的帧 key 从字符串改成数字(去掉双引号)。

背景:
    这些 json 的 "frames" 里,序号帧的 key 目前是字符串 "0" / "1" / ...,
    Lua 侧查表就得写 frames[""..f..""]。改成裸数字 key 之后 dkjson 解码出来就是数字 key,
    代码可以直接 frames[f]。

    dkjson 的 scantable 用 scanvalue 解析 key,数字是合法 value,所以 {0:{...}} 能正常解码成
    tbl[0] = {...}。非数字的 key(HUD_xxx / 5H / 0.png)必须保持带引号的字符串,本脚本一律不动。

规则:
    - 只处理 "frames" 对象**直接子级**的 key;
    - 只处理纯十进制整数(不允许前导 0,除非就是 "0");
    - 其余字节(缩进/换行/换行符 CRLF/转义/其他 key 与 value)原样保留;
    - 幂等:已经是裸数字的 key 不会被重复处理。

用法:
    python tools/json_frame_key_to_number.py            # 只检查并输出报告(默认)
    python tools/json_frame_key_to_number.py --fix      # 真正写回
    python tools/json_frame_key_to_number.py --to-string  # 反向:string 化(配合 --fix)
    python tools/json_frame_key_to_number.py --path asset/xxx.json  # 只处理指定文件(可重复)
输出:
    控制台摘要;--fix 时打印每个文件改动的 key 数。
"""
import argparse
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SCAN_DIR = os.path.join(ROOT, "asset")
FRAMES_RE = re.compile(r'"frames"\s*:\s*\{')


def iter_json_files(paths):
    if paths:
        for p in paths:
            yield p if os.path.isabs(p) else os.path.join(ROOT, p)
        return
    for dirpath, dirnames, filenames in os.walk(SCAN_DIR):
        dirnames.sort()
        for name in sorted(filenames):
            if name.lower().endswith(".json"):
                yield os.path.join(dirpath, name)


def read_text(path):
    with io.open(path, "rb") as f:
        raw = f.read()
    bom = raw.startswith(b"\xef\xbb\xbf")
    if bom:
        raw = raw[3:]
    return raw.decode("utf-8"), bom


def write_text(path, text, bom):
    data = text.encode("utf-8")
    if bom:
        data = b"\xef\xbb\xbf" + data
    with io.open(path, "wb") as f:
        f.write(data)


def scan_string_end(text, i):
    """i 指向开引号,返回字符串结束(闭引号之后)的下标。"""
    n = len(text)
    j = i + 1
    while j < n:
        c = text[j]
        if c == "\\":
            j += 2
            continue
        if c == '"':
            return j + 1
        j += 1
    return n


def skip_ws(text, i):
    n = len(text)
    while i < n and text[i] in " \t\r\n":
        i += 1
    return i


def is_plain_int(s):
    return s.isdigit() and (s == "0" or not s.startswith("0"))


def collect_key_spans(text):
    """收集 "frames" 对象直接子级里所有 key 的 (start,end,raw,is_quoted)。"""
    m = FRAMES_RE.search(text)
    if not m:
        return None
    i = m.end() - 1          # 指向 frames 的 '{'
    depth = 0
    n = len(text)
    spans = []
    while i < n:
        c = text[i]
        if c == '"':
            end = scan_string_end(text, i)
            if depth == 1:
                k = skip_ws(text, end)
                if k < n and text[k] == ":":
                    spans.append((i, end, text[i + 1:end - 1], True))
            i = end
            continue
        if c == "{" or c == "[":
            depth += 1
        elif c == "}" or c == "]":
            depth -= 1
            if depth == 0:
                break
        elif depth == 1 and c.isdigit():
            j = i
            while j < n and text[j].isdigit():
                j += 1
            k = skip_ws(text, j)
            if k < n and text[k] == ":":
                spans.append((i, j, text[i:j], False))
                i = j
                continue
        i += 1
    return spans


def convert(text, to_number):
    spans = collect_key_spans(text)
    if spans is None:
        return text, 0
    edits = []
    for start, end, raw, quoted in spans:
        if to_number and quoted and is_plain_int(raw):
            edits.append((start, end, raw))
        elif (not to_number) and (not quoted) and is_plain_int(raw):
            edits.append((start, end, '"' + raw + '"'))
    for start, end, new in reversed(edits):
        text = text[:start] + new + text[end:]
    return text, len(edits)


def main():
    ap = argparse.ArgumentParser(add_help=True)
    ap.add_argument("--fix", action="store_true", help="写回文件(默认只报告)")
    ap.add_argument("--to-string", action="store_true", help="反向:把裸数字 key 改回字符串")
    ap.add_argument("--path", action="append", default=[], help="只处理指定文件,可重复")
    args = ap.parse_args()

    mode = "number" if not args.to_string else "string"
    files = list(iter_json_files(args.path))
    total_files = 0
    touched_files = 0
    total_keys = 0
    no_frames = []
    no_numeric = []
    for path in files:
        rel = os.path.relpath(path, ROOT).replace("\\", "/")
        text, bom = read_text(path)
        total_files += 1
        spans = collect_key_spans(text)
        if spans is None:
            no_frames.append(rel)
            continue
        new_text, changed = convert(text, mode == "number")
        if changed == 0:
            no_numeric.append(rel)
            continue
        touched_files += 1
        total_keys += changed
        print("%-70s %4d keys -> %s" % (rel, changed, mode))
        if args.fix:
            write_text(path, new_text, bom)

    print("")
    print("mode = %s%s" % (mode, "" if args.fix else "  (dry-run, 加 --fix 才写回)"))
    print("扫描 json: %d" % total_files)
    print("无 frames 段: %d" % len(no_frames))
    print("没有可改的 key: %d" % len(no_numeric))
    print("%s 文件: %d, key 合计: %d" % ("改动" if args.fix else "待改动", touched_files, total_keys))
    return 0


if __name__ == "__main__":
    sys.exit(main())

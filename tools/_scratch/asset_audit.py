"""Asset reference audit.

1) 所有 .lua 里出现的 "asset/..." 路径,检查文件是否真的存在(找出悬空引用)
2) 扫描 VFX 目录,列出「代码里没有任何地方引用」的 .dds(只报告,不删)
"""
import os
import re
import sys

ROOT = r"H:\_love\BLAZBLUE_STRIVE"
os.chdir(ROOT)

# ---------- 1. 收集所有被引用的 asset 路径 ----------
refs = {}          # path -> list of (file, line)
path_re = re.compile(r'"(asset/[^"]+)"')
for dirpath, dirnames, filenames in os.walk("."):
    dirnames[:] = [d for d in dirnames if d not in (".git", "asset")]
    for fn in filenames:
        if not fn.endswith(".lua"):
            continue
        p = os.path.join(dirpath, fn)
        try:
            text = open(p, encoding="utf-8", errors="replace").read()
        except OSError:
            continue
        for i, line in enumerate(text.splitlines(), 1):
            for m in path_re.finditer(line):
                refs.setdefault(m.group(1), []).append((p, i))

missing = {
    path: locs for path, locs in refs.items()
    if not os.path.exists(path) and not os.path.exists(path.replace("/", "\\"))
}
print(f"引用的 asset 路径总数: {len(refs)}")
if missing:
    print("!! 悬空引用(文件不存在):")
    for path, locs in sorted(missing.items()):
        print(f"   {path}")
        for f, ln in locs[:3]:
            print(f"      {f}:{ln}")
else:
    print("OK  所有被引用的 asset 路径都存在")

# ---------- 2. VFX 目录里没人引用的 dds ----------
print("\n=== VFX 目录中未被引用的 .dds(仅报告)===")
vfx = os.path.join("asset", "game_scene", "common", "texture", "VFX")
refs_lower = {os.path.basename(p).lower() for p in refs}
unused = []
for dirpath, _, filenames in os.walk(vfx):
    for fn in filenames:
        if not fn.lower().endswith(".dds"):
            continue
        if fn.lower() not in refs_lower:
            full = os.path.join(dirpath, fn)
            unused.append((full, os.path.getsize(full)))
if unused:
    for full, size in sorted(unused):
        print(f"   {full}   {size:,} bytes")
else:
    print("   无")

# ---------- 3. 汇总被引用但体积大的资产(便于人工判断)----------
print("\n=== 当前仍在使用、体积最大的 10 个 asset ===")
big = []
for path in refs:
    if os.path.exists(path):
        big.append((os.path.getsize(path), path))
for size, path in sorted(big, reverse=True)[:10]:
    print(f"   {size:>12,}  {path}")

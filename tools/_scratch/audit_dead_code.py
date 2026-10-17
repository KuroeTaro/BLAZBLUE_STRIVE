# -*- coding: utf-8 -*-
"""粗粒度静态检查:找没用上的 function / 字段 / 全局变量,以及重复定义。

只做文本级统计,不做完整语法分析 —— 宁可漏报也不要大量误报。
"""
import os, re, sys, collections

ROOT = r"H:\_love\BLAZBLUE_STRIVE"
SKIP_DIRS = {"_scratch", ".git", "tools"}

def iter_lua():
    for dirpath, dirnames, filenames in os.walk(ROOT):
        dirnames[:] = [d for d in dirnames if d not in SKIP_DIRS]
        for fn in filenames:
            if fn.endswith(".lua"):
                yield os.path.join(dirpath, fn)

files = sorted(iter_lua())
src = {}
for path in files:
    with open(path, encoding="utf-8", errors="replace") as f:
        src[path] = f.read()

rel = lambda p: os.path.relpath(p, ROOT)

# 全文拼接,用于统计跨文件引用
allsrc = "\n".join(src.values())

def count_word(name, exclude=None):
    """统计 name 作为独立标识符出现次数(包含字符串里的出现,宁多勿少)"""
    n = len(re.findall(r"(?<![A-Za-z0-9_])" + re.escape(name) + r"(?![A-Za-z0-9_])", allsrc))
    if exclude:
        n -= exclude
    return n

# ---------------- 1. function 定义 / 引用 ----------------
def quoted_standalone(name):
    """名字以独立字符串(不是 ["name"] 这种)出现过多少次 -> 有出现说明可能是动态 key"""
    total = len(re.findall(r'"' + re.escape(name) + r'"', allsrc))
    bracketed = len(re.findall(r'\["' + re.escape(name) + r'"\]', allsrc))
    return total - bracketed

func_defs = collections.defaultdict(list)   # name -> [(file,line)]
for path, text in src.items():
    for i, line in enumerate(text.split("\n"), 1):
        m = re.match(r"\s*function\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(", line)
        if m:
            func_defs[m.group(1)].append((rel(path), i))

unused_funcs = []
dup_funcs = []
for name, defs in func_defs.items():
    refs = count_word(name, exclude=len(defs))
    if len(defs) > 1:
        dup_funcs.append((name, defs, refs))
    # 名字如果还以字符串形式出现过,可能是动态调用,保守跳过
    if refs == 0 and quoted_standalone(name) == 0:
        unused_funcs.append((name, defs))

# ---------------- 2. 表字段:"写" vs "读" ----------------
field_writes = collections.Counter()
field_lines = collections.defaultdict(list)
field_any = collections.Counter()
field_rhs = collections.defaultdict(set)
for path, text in src.items():
    for i, line in enumerate(text.split("\n"), 1):
        m = re.search(r'\["([^"]+)"\]\s*=\s*(.+?)\s*$', line)
        if m and not re.search(r'\["([^"]+)"\]\s*==', line):
            name, rhs = m.group(1), m.group(2)
            field_writes[name] += 1
            field_lines[name].append((rel(path), i, line.strip()[:110]))
            if rhs.startswith("true") or rhs.startswith("false"):
                field_rhs[name].add("bool")
            elif rhs.startswith("function"):
                field_rhs[name].add("func")
            else:
                field_rhs[name].add("value")
        for mm in re.finditer(r'\["([^"]+)"\]', line):
            field_any[mm.group(1)] += 1

# 过滤:
#  a) 名字以独立字符串出现过 -> 动态 key
#  b) 所有写入都是 true/false/function -> 典型的「按名字查表」的成员
#     (比如 state_table["knockout"] = true),是动态查表的,不算死字段
def is_lookup_member(name):
    kinds = field_rhs.get(name, set())
    return kinds and kinds <= {"bool", "func"}

dead_fields = []
lookup_members = 0
for name, w in field_writes.items():
    if field_any[name] - w != 0:
        continue
    if quoted_standalone(name) != 0:
        continue
    if is_lookup_member(name):
        lookup_members += 1
        continue
    dead_fields.append((name, w, field_lines[name]))

# 点号写法的字段(obj.foo = ...)也检查一遍
dot_writes = collections.Counter()
dot_any = collections.Counter()
dot_lines = collections.defaultdict(list)
for path, text in src.items():
    for i, line in enumerate(text.split("\n"), 1):
        for m in re.finditer(r"\.([A-Za-z_]\w*)\s*(?==[^=])", line):
            dot_writes[m.group(1)] += 1
            dot_lines[m.group(1)].append((rel(path), i, line.strip()[:110]))
        for m in re.finditer(r"\.([A-Za-z_]\w*)", line):
            dot_any[m.group(1)] += 1

# 只保留"写了不止一次但完全没读"的,减少单次初始化的噪音
dead_dot = [(n, w, dot_lines[n]) for n, w in dot_writes.items()
            if dot_any[n] - w == 0 and w >= 2]

# ---------------- 3. 全局变量(非 function)只写不读 ----------------
glob_assign = collections.Counter()
glob_lines = collections.defaultdict(list)
for path, text in src.items():
    for i, line in enumerate(text.split("\n"), 1):
        m = re.match(r"([A-Za-z_][A-Za-z0-9_]*)\s*=(?!=)", line)
        if m and not re.match(r"\s*(local|function|if|for|while|return)\b", line):
            glob_assign[m.group(1)] += 1
            glob_lines[m.group(1)].append((rel(path), i, line.strip()[:110]))

# ---------------- 6. 只读不写的字段(运行期一定是 nil) ----------------
THIRD_PARTY = {"lovebird.lua", "lume.lua", "dkjson.lua", "conf.lua"}
read_only_fields = []
for name, n in field_any.items():
    if field_writes[name] == 0 and n >= 2 and quoted_standalone(name) == 0:
        if name in ("x", "y", "z", "r", "f", "x_table"):
            continue
        read_only_fields.append((name, n))
read_only_fields.sort(key=lambda x: -x[1])

# ---------------- 7. 全局变量只写不读 ----------------
dead_globals = []
for name, n in glob_assign.items():
    if "_" not in name:
        continue
    total = count_word(name)
    if total - n == 0:
        dead_globals.append((name, n, glob_lines[name]))

# ---------------- 4. local 只出现一次(必然没用) ----------------
dead_locals = []
for path, text in src.items():
    if os.path.basename(path) in THIRD_PARTY:
        continue
    lines = text.split("\n")
    counts = collections.Counter(re.findall(r"(?<![A-Za-z0-9_.])([A-Za-z_]\w*)(?![A-Za-z0-9_])", text))
    for i, line in enumerate(lines, 1):
        m = re.match(r"\s*local\s+([A-Za-z_]\w*)", line)
        if m:
            name = m.group(1)
            if counts[name] <= 1 and name not in ("_ENV",):
                dead_locals.append((rel(path), i, name, line.strip()[:110]))

# ---------------- 输出 ----------------
out = []
def w(s=""):
    out.append(s)

w("=" * 78)
w("仓库静态检查报告")
w("  lua 文件 %d 个" % len(files))
w("=" * 78)

w()
w("## 1. 定义了但没有任何引用的 function (%d)" % len(unused_funcs))
for name, defs in sorted(unused_funcs, key=lambda x: x[1][0]):
    f, l = defs[0]
    w("  %-62s %s:%d" % (name, f, l))

w()
w("## 2. 被重复定义(后者覆盖前者)的 function (%d)" % len(dup_funcs))
for name, defs, refs in sorted(dup_funcs):
    w("  %s  (引用 %d 次)" % (name, refs))
    for f, l in defs:
        w("      %s:%d" % (f, l))

w()
w("## 3. 写了但从来没被读过的 table 字段 (写>=1, 读=0) 共 %d" % len(dead_fields))
for name, cnt, lines in sorted(dead_fields, key=lambda x: -x[1]):
    w("  [\"%s\"]  写了 %d 次" % (name, cnt))
    for f, l, s in lines[:4]:
        w("      %s:%d  %s" % (f, l, s))

w()
w("## 4. 点了但没读的属性(写>=2, 读=0)共 %d" % len(dead_dot))
for name, cnt, lines in sorted(dead_dot, key=lambda x: -x[1]):
    w("  .%s  写了 %d 次" % (name, cnt))
    for f, l, s in lines[:4]:
        w("      %s:%d  %s" % (f, l, s))

w()
w("## 5. 只读不写的字段(运行期必为 nil)共 %d" % len(read_only_fields))
for name, n in read_only_fields[:40]:
    w("  [\"%s\"]  读了 %d 次" % (name, n))

w()
w("## 6. 全局变量只写不读 共 %d" % len(dead_globals))
for name, n, lines in sorted(dead_globals, key=lambda x: -x[1]):
    w("  %s  写了 %d 次  %s:%d" % (name, n, lines[0][0], lines[0][1]))

w()
w("## 7. local 变量只出现一次(声明后从未使用)共 %d" % len(dead_locals))
for f, l, name, s in dead_locals[:120]:
    w("  %s:%d  %s" % (f, l, s))
if len(dead_locals) > 120:
    w("  ... 其余 %d 条省略" % (len(dead_locals) - 120))

report = "\n".join(out)
path = os.path.join(ROOT, "tools", "_scratch", "audit_report.txt")
with open(path, "w", encoding="utf-8") as f:
    f.write(report)
print(report[:12000])
print()
print("完整报告: " + path)

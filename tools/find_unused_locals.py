import os
import re
import sys

root = os.path.abspath(os.path.dirname(__file__) + os.sep + '..')

lua_files = []
for dirpath, dirnames, filenames in os.walk(root):
    for fn in filenames:
        if fn.endswith('.lua'):
            lua_files.append(os.path.join(dirpath, fn))

# Helpers to strip strings and comments from Lua source
long_bracket = re.compile(r"\[=*\[.*?\]=*\]", re.DOTALL)
str_double = re.compile(r'"(?:\\.|[^"\\])*"', re.DOTALL)
str_single = re.compile(r"'(?:\\.|[^'\\])*'", re.DOTALL)
line_comment = re.compile(r'--[^\n]*')
multiline_comment = re.compile(r'--\[=*\[.*?\]=*\]', re.DOTALL)

func_or_end = re.compile(r"\b(function|end)\b")
local_decl = re.compile(r"\blocal\s+([A-Za-z_][A-Za-z0-9_]*(?:\s*,\s*[A-Za-z_][A-Za-z0-9_]*)*)")
local_fn_decl = re.compile(r"\blocal\s+function\s+([A-Za-z_][A-Za-z0-9_]*)")

results = []

for path in lua_files:
    try:
        with open(path, 'r', encoding='utf-8') as f:
            src = f.read()
    except Exception:
        with open(path, 'r', encoding='latin-1') as f:
            src = f.read()

    # sanitize: remove long bracket strings and comments and normal strings
    s = src
    s = multiline_comment.sub('', s)
    s = long_bracket.sub('', s)
    s = str_double.sub('', s)
    s = str_single.sub('', s)
    s = line_comment.sub('', s)

    # find all function..end blocks via token scanning
    blocks = []  # list of (start_idx, end_idx)
    stack = []
    for m in func_or_end.finditer(s):
        tok = m.group(1)
        if tok == 'function':
            stack.append(m.start())
        elif tok == 'end':
            if stack:
                st = stack.pop()
                blocks.append((st, m.end()))

    # also consider top-level functions defined as "local function foo...end" which the 'function' token occurs after 'local'
    # blocks now contains nested blocks; we'll analyze each
    for (st, ed) in blocks:
        block_text = s[st:ed]
        # find local function declarations separately (they may shadow locals)
        for m in local_fn_decl.finditer(block_text):
            name = m.group(1)
            # check usage in block after declaration
            after = block_text[m.end():]
            if re.search(r'\b%s\b' % re.escape(name), after) is None:
                # compute line number
                abs_pos = st + m.start(1)
                line = src[:abs_pos].count('\n') + 1
                results.append((path, line, name))
        # find normal local declarations
        for m in local_decl.finditer(block_text):
            names = [n.strip() for n in m.group(1).split(',')]
            for nm in names:
                # skip if it's a 'local function name' handled above
                # find position of this name in original block
                # compute index of declaration of this name
                # m.start() is location of 'local'
                decl_idx = m.start()
                # search for usage after decl_idx (within block_text)
                after = block_text[m.end():]
                if re.search(r'\b%s\b' % re.escape(nm), after) is None:
                    abs_pos = st + m.start(1) + m.group(1).find(nm)
                    line = src[:abs_pos].count('\n') + 1
                    results.append((path, line, nm))

# Deduplicate and sort
uniq = {}
for path, line, name in results:
    key = (path, line, name)
    uniq[key] = True

out = []
for (path, line, name) in sorted(uniq.keys()):
    rel = os.path.relpath(path, root).replace('\\','/')
    out.append(f"{rel}:{line}\t{name}")

if out:
    print('\n'.join(out))
    sys.exit(0)
else:
    print('No unused locals detected (heuristic).')
    sys.exit(0)

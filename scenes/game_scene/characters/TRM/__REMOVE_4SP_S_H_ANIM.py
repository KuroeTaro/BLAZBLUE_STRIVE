import sys

PATH = r"H:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\_anim.lua"
APPLY = "--apply" in sys.argv

with open(PATH, encoding="utf-8", newline="") as f:
    lines = f.readlines()

start = func_line = None
for i, l in enumerate(lines):
    if l.strip() == "-- _4SP_S_H":
        start = i
        if i + 1 < len(lines) and lines[i + 1].startswith("function load_game_scene_anim_char_TRM_4SP_S_H("):
            func_line = i + 1
        break

if func_line is None:
    print("NOT_FOUND")
    sys.exit(1)

end = None
for j in range(func_line + 1, len(lines)):
    if lines[j].rstrip("\r\n") == "end":
        end = j
        break
if end is None:
    print("NO_END")
    sys.exit(1)

print("remove lines %d..%d (%d lines)" % (start + 1, end + 1, end - start + 1))
print("first:", lines[start].rstrip())
print("last :", lines[end].rstrip())
print("prev :", lines[start - 1].rstrip())
print("next :", lines[end + 1].rstrip() if end + 1 < len(lines) else "<EOF>")

if APPLY:
    with open(PATH, "w", encoding="utf-8", newline="") as f:
        f.writelines(lines[:start] + lines[end + 1:])
    print("APPLIED")

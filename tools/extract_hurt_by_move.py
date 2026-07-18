import re
from collections import defaultdict

filepath = r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\_anim.lua"

with open(filepath, 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Find all function definitions for TRM moves
func_names = {}
for i, line in enumerate(lines):
    m = re.match(r'^function (load_game_scene_anim_char_TRM_\S+)\(', line)
    if m:
        func_names[i] = m.group(1).replace('load_game_scene_anim_char_TRM_', '')

# Find all hurt_animation assignments  
results = []
i = 0
while i < len(lines):
    line = lines[i].rstrip()
    match = re.match(r'\s*hit_side_obj_char\["(\w+_hurt_animation)"\]\s*=\s*(load_game_scene_anim_char_common_\S+)\(', line)
    if match:
        anim_type = match.group(1)
        func_name = match.group(2)
        
        # Find the enclosing TRM function
        enclosing = "unknown"
        for fline in sorted(func_names.keys(), reverse=True):
            if fline < i:
                enclosing = func_names[fline]
                break
        
        combined = line[match.end()-1:]
        depth = 1
        j = i + 1
        while depth > 0 and j < len(lines):
            for ch in lines[j]:
                if ch == '(':
                    depth += 1
                elif ch == ')':
                    depth -= 1
            combined += lines[j]
            j += 1
        
        combined = combined.strip()
        if combined.startswith('('):
            combined = combined[1:]
        
        args = []
        depth = 0
        current = ""
        in_string = False
        for ch in combined:
            if ch == '"' and (len(current) == 0 or current[-1] != '\\'):
                in_string = not in_string
            if not in_string:
                if ch == '(' or ch == '{':
                    depth += 1
                elif ch == ')' or ch == '}':
                    depth -= 1
                if ch == ',' and depth == 0:
                    args.append(current.strip())
                    current = ""
                    continue
            current += ch
        if current.strip():
            stripped = current.strip()
            if stripped.endswith(')'):
                stripped = stripped[:-1].strip()
            if stripped:
                args.append(stripped)
        
        def extract_number(s):
            s = s.strip()
            m = re.match(r'^([-]?\d+\.?\d*)', s)
            if m:
                return m.group(1)
            return s.strip()
        
        if len(args) >= 11:
            results.append({
                'line': i + 1,
                'move': enclosing,
                'anim_type': anim_type,
                'func': func_name.replace('load_game_scene_anim_char_common_', ''),
                'h_vel': extract_number(args[5]),
                'h_fric': extract_number(args[6]),
                'h_corr': extract_number(args[7]),
                'v_vel': extract_number(args[8]),
                'v_grav': extract_number(args[9]),
                'v_corr': extract_number(args[10]),
            })
        i = j
    else:
        i += 1

# Group by move, then show all hurt anims
print("按招式分组:\n")
by_move = defaultdict(list)
for r in results:
    by_move[r['move']].append(r)

for move, entries in sorted(by_move.items()):
    print(f"\n{'='*80}")
    print(f"  招式: {move}")
    print(f"{'='*80}")
    for e in entries:
        print(f"  {e['anim_type']:<25} func={e['func']:<45} "
              f"({e['h_vel']:>7}, {e['h_fric']:>4}, {e['h_corr']}, {e['v_vel']:>7}, {e['v_grav']:>4}, {e['v_corr']})")

import re
from collections import defaultdict

filepath = r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\_anim.lua"

with open(filepath, 'r', encoding='utf-8') as f:
    lines = f.readlines()

results = []
i = 0
while i < len(lines):
    line = lines[i].rstrip()
    match = re.match(r'\s*hit_side_obj_char\["(\w+_hurt_animation)"\]\s*=\s*(load_game_scene_anim_char_common_\S+)\(', line)
    if match:
        anim_type = match.group(1)
        func_name = match.group(2)
        
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
                'anim_type': anim_type,
                'func': func_name,
                'h_vel': float(extract_number(args[5])),
                'h_fric': float(extract_number(args[6])),
                'h_corr': float(extract_number(args[7])),
                'v_vel': float(extract_number(args[8])),
                'v_grav': float(extract_number(args[9])),
                'v_corr': float(extract_number(args[10])),
            })
        i = j
    else:
        i += 1

# ===================== ANALYSIS =====================

print("=" * 100)
print("TRM _anim.lua - hurt_animation 击飞六项参数规律分析")
print("=" * 100)

# Group by function name
by_func = defaultdict(list)
for r in results:
    short = r['func'].replace('load_game_scene_anim_char_common_', '')
    by_func[short].append(r)

print("\n## 一、按函数类型分组统计\n")

for func_name, entries in sorted(by_func.items()):
    print(f"\n### {func_name} (共{len(entries)}次)")
    
    # Show all unique value combinations
    seen = set()
    for e in entries:
        key = (e['h_vel'], e['h_fric'], e['h_corr'], e['v_vel'], e['v_grav'], e['v_corr'])
        if key not in seen:
            seen.add(key)
            anim_types = [x['anim_type'] for x in entries if 
                         x['h_vel']==e['h_vel'] and x['h_fric']==e['h_fric'] and 
                         x['h_corr']==e['h_corr'] and x['v_vel']==e['v_vel'] and 
                         x['v_grav']==e['v_grav'] and x['v_corr']==e['v_corr']]
            print(f"  ({e['h_vel']:>7.1f}, {e['h_fric']:>4.0f}, {e['h_corr']:.3f}, {e['v_vel']:>7.1f}, {e['v_grav']:>4.1f}, {e['v_corr']:.3f}) "
                  f" -> {', '.join(set(anim_types))}")

# Group by anim_type
print("\n\n## 二、按hurt类型分组\n")
by_anim = defaultdict(list)
for r in results:
    by_anim[r['anim_type']].append(r)

for anim, entries in sorted(by_anim.items()):
    print(f"\n### {anim} (共{len(entries)}次)")
    seen = set()
    for e in entries:
        key = (e['h_vel'], e['h_fric'], e['h_corr'], e['v_vel'], e['v_grav'], e['v_corr'])
        if key not in seen:
            seen.add(key)
            funcs = set(x['func'].replace('load_game_scene_anim_char_common_','') for x in entries if 
                       x['h_vel']==e['h_vel'] and x['h_fric']==e['h_fric'] and 
                       x['h_corr']==e['h_corr'] and x['v_vel']==e['v_vel'] and 
                       x['v_grav']==e['v_grav'] and x['v_corr']==e['v_corr'])
            print(f"  ({e['h_vel']:>7.1f}, {e['h_fric']:>4.0f}, {e['h_corr']:.3f}, {e['v_vel']:>7.1f}, {e['v_grav']:>4.1f}, {e['v_corr']:.3f}) "
                  f"函数: {', '.join(funcs)}")

# Summary of common patterns
print("\n\n## 三、核心规律总结\n")

print("""
### 1. 水平摩擦力 (h_fric): 
   绝大多数为 5，仅 semi_launched_mid 使用 7

### 2. 垂直重力 (v_grav):
   绝大多数为 2.5，仅 semi_launched_mid 使用 2

### 3. 地面受击 (ground_hurt_lv0~lv3) 的规律:
""")

print("### 4. 水平速度修正 (h_corr) 规律:")
print("   - ground_hurt 系列: 始终为 1.00")
print("   - launched_high: 大部分为 1.035，个别为 1.07, 1.10")
print("   - launched_low: 地面用 1.00, 空中用 1.035")
print("   - semi_launched_mid: 地面用 1.00, 空中用 1.035")

print("\n### 5. 垂直重力修正 (v_corr) 规律:")
print("   - ground_hurt_lv0, lv1: 始终为 1.00")
print("   - ground_hurt_lv2: 1.00 或 1.035 或 1.07")
print("   - ground_hurt_lv3: 1.00")
print("   - launched_high/low: 大部分为 1.035，个别 1.07, 1.10")
print("   - semi_launched_mid: 地面用 1.00, 空中用 1.035")

print("\n### 6. 垂直速度 (v_vel) 规律:")
print("   - ground_hurt: 站立/蹲伏 v_vel=0 (地面不浮空)")
print("   - air_hurt: 负值表示向上击飞，绝对值越大越高")
print("   - OTG: 小负值或0，表示从地面弹起")

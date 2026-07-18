import re
import sys

filepath = r"h:\_love\BLAZBLUE_STRIVE\scenes\game_scene\characters\TRM\_anim.lua"

with open(filepath, 'r', encoding='utf-8') as f:
    lines = f.readlines()

# We need to find all hurt_animation assignments with load_game_scene_anim_char_common_ functions
# The pattern: hit_side_obj_char["XXX_hurt_animation"] = load_game_scene_anim_char_common_YYYY(
# Then multiple lines of arguments, ending with a closing ) followed by newline

results = []
i = 0
while i < len(lines):
    line = lines[i].rstrip()
    match = re.match(r'\s*hit_side_obj_char\["(\w+_hurt_animation)"\]\s*=\s*(load_game_scene_anim_char_common_\S+)\(', line)
    if match:
        anim_type = match.group(1)
        func_name = match.group(2)
        
        # Collect all lines until we find the matching closing paren
        # We need to count nested parens
        combined = line[match.end()-1:]  # includes the opening (
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
        
        # Now parse the arguments from combined
        # Remove leading '(' and trailing ')'
        combined = combined.strip()
        if combined.startswith('('):
            combined = combined[1:]
        # Find the matching last ')'
        # Actually, we need to find the top-level commas
        
        # Let's extract all top-level arguments
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
            # Remove trailing ) if it's at depth 0
            stripped = current.strip()
            if stripped.endswith(')'):
                stripped = stripped[:-1].strip()
            if stripped:
                args.append(stripped)
        
        # Now extract args 6-11 (0-indexed)
        # args[0] = hit_side_obj_char
        # args[1] = hurt_side_obj_char
        # args[2] = sprite_sheet (string)
        # args[3] = height (string)
        # args[4] = state_cache (string)
        # args[5] = hurt_horizontal_velocity (number)
        # args[6] = hurt_horizontal_friction (number)
        # args[7] = hurt_horizontal_velocity_correction (number)
        # args[8] = hurt_vertical_velocity (number)
        # args[9] = hurt_vertical_gravity (number)
        # args[10] = hurt_vertical_gravity_correction (number)
        
        def extract_number(s):
            s = s.strip()
            # Handle negative numbers, decimals
            m = re.match(r'^([-]?\d+\.?\d*)', s)
            if m:
                return m.group(1)
            return s.strip()
        
        if len(args) >= 11:
            result = {
                'line': i + 1,
                'anim_type': anim_type,
                'func': func_name,
                'h_vel': extract_number(args[5]),
                'h_fric': extract_number(args[6]),
                'h_corr': extract_number(args[7]),
                'v_vel': extract_number(args[8]),
                'v_grav': extract_number(args[9]),
                'v_corr': extract_number(args[10]),
            }
            results.append(result)
        else:
            print(f"WARNING line {i+1}: only {len(args)} args parsed for {anim_type}")
        
        i = j
    else:
        i += 1

# Print results
print(f"Total results: {len(results)}\n")
for r in results:
    print(f"Line {r['line']:>5} | {r['anim_type']:<25} | {r['func']:<60} | "
          f"h_vel={r['h_vel']:>8}, h_fric={r['h_fric']:>6}, h_corr={r['h_corr']:>6}, "
          f"v_vel={r['v_vel']:>8}, v_grav={r['v_grav']:>6}, v_corr={r['v_corr']:>6}")

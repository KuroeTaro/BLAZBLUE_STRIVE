"""
Reorder animation res[n] property assignments to match load_game_scene_obj_char_LP order.
Target files:
- scenes/game_scene/_common/_anim.lua
- scenes/game_scene/_common/_projectile.lua
- scenes/game_scene/characters/TRM/_anim.lua
- scenes/game_scene/characters/TRM/_projectile.lua
"""

import re
import os

BASE_DIR = r"h:\_love\BLAZBLUE_STRIVE"

# The LP reference order for properties within a res[n] function body
# Each entry: (comment_label, property_match_regex_or_func)
# We'll process each res block and reorder lines within it

# Order of comment sections in a res[n] function (res[0] typically has all, others have subsets)
COMMENT_SECTION_ORDER = [
    "-- state",
    "-- state_number",
    "-- input_sys_cache",
    "-- collide",
    "-- draw_correction",
    "-- VFX",
    "-- SFX",
    "-- game_speed",
    "-- update",
    "-- character_uncommon_init",
    "-- animation_end",
    "-- animation end",
]

# Properties that can appear within "-- state" section, in LP order
STATE_PROP_ORDER = [
    "sprite_sheet",
    "height",
    "state",           # "state" (not state_cache)
    "state_cache",
    "hurt_state_target",
    "move_state",
    "wallhurt_wallstick_on_side",
    "wallhurt_wallstickable",
    "wallhurt_wallbreakable_with_wallstick",
    "wallhurt_wallbreakable_without_wallstick",
    "wallhurt_wallbreak_adv",
    # animation refs (self_*)
    "self_wallbounce_hurt_animation",
    "self_groundbounce_hurt_animation",
    "self_knockdown_animation",
    "self_knockdown_recovery_animation",
    "hit_cancel",
    "idle_cancel",
    "strike_inv",
    "strike_inv_countdown",
    "throw_inv",
    "throw_inv_countdown",
    "projectile_inv",
    "projectile_inv_countdown",
]

# Note: startup_frame, active_frame, recovery_frame were moved FROM state TO state_number
# in LP order they are after horizontal_velocity_correction/gravity_correction/damage_correction

STATE_NUMBER_PROP_ORDER = [
    # velocity/friction/gravity are set via function calls, keep as-is
    # But if direct assignments exist:
    "velocity",
    "friction",
    "gravity",
    "physics_lock",
    # gauge-related (rare in res blocks)
    "hit_damage",
    "hit_damage_correction_factor",
    "hit_heat_gain",
    "hit_wallbreak_damage",
    "hurt_heat_gain",
    "blocked_heat_gain",
    "block_heat_gain",
    "block_risk_gauge_gain",
    "FD_block_heat_drain",
    "horizontal_velocity_correction",
    "gravity_correction",
    "damage_correction",
    # These were in "state" but belong here per LP
    "startup_frame",
    "active_frame",
    "recovery_frame",
    "frame_adv",
]

INPUT_SYS_CACHE_PROP_ORDER = [
    "input_sys_state",
]

COLLIDE_PROP_ORDER = [
    "pushbox",
    "pushbox_opponent_collision_active",
    "hitbox_table",
    "hurtbox_table",
    "collision_ground_height_offset",
]

DRAW_CORRECTION_PROP_ORDER = [
    # [8] is special (numeric key)
    "anchor_pos",
]

# Map property names to comment sections
PROP_TO_SECTION = {}
for p in STATE_PROP_ORDER:
    PROP_TO_SECTION[p] = "-- state"
for p in STATE_NUMBER_PROP_ORDER:
    PROP_TO_SECTION[p] = "-- state_number"
for p in INPUT_SYS_CACHE_PROP_ORDER:
    PROP_TO_SECTION[p] = "-- input_sys_cache"
for p in COLLIDE_PROP_ORDER:
    PROP_TO_SECTION[p] = "-- collide"
for p in DRAW_CORRECTION_PROP_ORDER:
    PROP_TO_SECTION[p] = "-- draw_correction"

# Special markers
PROP_TO_SECTION["[8]"] = "-- draw_correction"  # obj[8] = frame

SECTION_ORDER_INDEX = {s: i for i, s in enumerate(COMMENT_SECTION_ORDER)}

def get_prop_from_line(line):
    """Extract the property name being assigned from a line of Lua code."""
    line = line.strip()
    # Match obj["prop"] or obj["prop"][...]
    m = re.match(r'(?:hurt_side_obj_char|hit_side_obj_char|obj_projectile|obj_char)\["([^"]+)"\]', line)
    if m:
        return m.group(1)
    # Match obj[8] (draw frame)
    m = re.match(r'(?:hurt_side_obj_char|hit_side_obj_char|obj_projectile|obj_char)\[8\]', line)
    if m:
        return "[8]"
    # Match obj[1] through obj[7]
    m = re.match(r'(?:hurt_side_obj_char|hit_side_obj_char|obj_projectile|obj_char)\[(\d)\]', line)
    if m:
        n = int(m.group(1))
        if 1 <= n <= 7:
            return f"[{n}]"
    return None

def get_comment_section_for_line(line):
    """Determine which comment section a line belongs to based on its property."""
    line_stripped = line.strip()
    if line_stripped.startswith("--"):
        return None  # It's a comment line itself
    
    prop = get_prop_from_line(line_stripped)
    if prop:
        if prop in PROP_TO_SECTION:
            return PROP_TO_SECTION[prop]
        # Unknown property, try to categorize
        # "x", "y", "f", "state" etc. - mostly state
        if prop in ("x", "y", "f", "state", "state_cache", "sprite_sheet", "height", 
                     "hurt_state_target", "move_state"):
            return "-- state"
        if prop in ("velocity", "friction", "gravity", "physics_lock",
                     "horizontal_velocity_correction", "gravity_correction", "damage_correction",
                     "startup_frame", "active_frame", "recovery_frame", "frame_adv",
                     "hit_damage", "hit_damage_correction_factor", "hit_heat_gain",
                     "hit_wallbreak_damage", "hurt_heat_gain", "blocked_heat_gain",
                     "block_heat_gain", "block_risk_gauge_gain", "FD_block_heat_drain"):
            return "-- state_number"
        if prop in ("pushbox", "pushbox_opponent_collision_active", "hitbox_table", 
                     "hurtbox_table", "collision_ground_height_offset"):
            return "-- collide"
        if prop == "anchor_pos":
            return "-- draw_correction"
        if prop in ("input_sys_state", "input_sys_cache"):
            return "-- input_sys_cache"
        if prop in ("wallhurt_wallstick_on_side", "wallhurt_wallstickable",
                     "wallhurt_wallbreakable_with_wallstick", "wallhurt_wallbreakable_without_wallstick",
                     "wallhurt_wallbreak_adv", "idle_cancel", "hit_cancel",
                     "strike_inv", "strike_inv_countdown", "throw_inv", "throw_inv_countdown",
                     "projectile_inv", "projectile_inv_countdown",
                     "self_wallbounce_hurt_animation", "self_groundbounce_hurt_animation",
                     "self_knockdown_animation", "self_knockdown_recovery_animation"):
            return "-- state"
    return None

def get_priority_in_section(line, section):
    """Get sort priority for a line within its comment section."""
    line_stripped = line.strip()
    prop = get_prop_from_line(line_stripped)
    if not prop:
        return 999  # Put unknown at end
    
    if section == "-- state":
        order = STATE_PROP_ORDER
    elif section == "-- state_number":
        order = STATE_NUMBER_PROP_ORDER
    elif section == "-- input_sys_cache":
        order = INPUT_SYS_CACHE_PROP_ORDER
    elif section == "-- collide":
        order = COLLIDE_PROP_ORDER
    elif section == "-- draw_correction":
        # [8] before anchor_pos
        if prop == "[8]":
            return 0
        if prop == "anchor_pos":
            return 1
        if re.match(r'\[\d\]', prop):
            return int(prop[1])
        return 2
    else:
        return 0
    
    try:
        return order.index(prop)
    except ValueError:
        return len(order)  # Unknown, put at end of section


def process_function_body(body_lines):
    """
    Process a function body: find all res[n] blocks and reorder lines within them.
    Returns modified body_lines.
    """
    result = []
    i = 0
    while i < len(body_lines):
        line = body_lines[i]
        # Check if this line starts a res[n] = function() block
        # Pattern: res[N] = function()
        m = re.match(r'^(\s*)(res\[\d+\])\s*=\s*function\s*\(', line)
        if m:
            indent = m.group(1)
            # Find the matching "end" for this function
            # Collect all lines of this res block
            block_start = i
            depth = 1
            j = i + 1
            while j < len(body_lines) and depth > 0:
                test_line = body_lines[j].strip()
                # Count function/if/for/do and end
                funcs = len(re.findall(r'\bfunction\s*\(', test_line))
                ends = len(re.findall(r'\bend\b', test_line))
                # Also count nested functions
                depth += funcs - ends
                if depth > 0:
                    j += 1
            
            # j is now at the 'end' line
            block_lines = body_lines[block_start:j+1]
            
            # Process the interior of the res block
            processed = process_res_block(block_lines, indent)
            result.extend(processed)
            i = j + 1
        else:
            result.append(line)
            i += 1
    
    return result


def process_res_block(block_lines, base_indent):
    """
    Process a single res[n] = function() ... end block.
    Reorder lines within comment sections.
    """
    if len(block_lines) <= 2:
        return block_lines  # Too short, skip
    
    # First line is "res[n] = function()"
    # Last line is "end" or "end,"
    header = block_lines[0]
    footer = block_lines[-1]
    interior = block_lines[1:-1]
    
    # Split interior into comment-section groups
    # A section starts with a "-- section_name" comment line
    sections = []  # list of (section_comment, lines)
    current_section = None
    current_lines = []
    
    for line in interior:
        stripped = line.strip()
        if stripped.startswith("-- ") and not stripped.startswith("-- "):
            pass
        # Check if it's a section header comment
        is_section_header = False
        for sec in COMMENT_SECTION_ORDER:
            if stripped == sec or stripped.startswith(sec + " "):
                is_section_header = True
                if current_section is not None or current_lines:
                    sections.append((current_section, current_lines))
                current_section = sec
                current_lines = [line]
                break
        if not is_section_header:
            current_lines.append(line)
    
    if current_lines:
        sections.append((current_section, current_lines))
    
    # If no sections found, return as-is
    if len(sections) == 0:
        return block_lines
    
    # Now reorder: sections should appear in COMMENT_SECTION_ORDER
    # And within each section, properties should follow LP order
    
    # First, build a map: section_label -> (header_line, body_lines)
    section_map = {}
    for sec_label, lines in sections:
        if sec_label is None:
            sec_label = "__none__"
        if sec_label not in section_map:
            section_map[sec_label] = {"header": None, "body": []}
        # First line might be the header
        if lines and lines[0].strip().startswith("--"):
            if section_map[sec_label]["header"] is None:
                section_map[sec_label]["header"] = lines[0]
                section_map[sec_label]["body"].extend(lines[1:])
            else:
                # Duplicate section header - merge bodies
                section_map[sec_label]["body"].extend(lines)
        else:
            section_map[sec_label]["body"].extend(lines)
    
    # Reorder sections according to COMMENT_SECTION_ORDER
    ordered_sections = []
    seen = set()
    for sec_label in COMMENT_SECTION_ORDER:
        if sec_label in section_map and sec_label not in seen:
            ordered_sections.append((sec_label, section_map[sec_label]))
            seen.add(sec_label)
    # Add any remaining
    for sec_label, data in section_map.items():
        if sec_label not in seen:
            ordered_sections.append((sec_label, data))
            seen.add(sec_label)
    
    # Build output
    result = [header]
    
    inner_indent = base_indent + "    "  # 4 spaces more
    
    for sec_label, data in ordered_sections:
        header_line = data["header"]
        body = data["body"]
        
        # Add section header
        if header_line:
            result.append(header_line)
        
        # Sort body lines within section
        if sec_label in ("-- state", "-- state_number", "-- input_sys_cache", "-- collide", "-- draw_correction"):
            # Sort by LP property order
            def sort_key(line):
                return get_priority_in_section(line, sec_label)
            body.sort(key=sort_key)
        
        result.extend(body)
    
    result.append(footer)
    return result


def process_file(filepath):
    """Process a Lua file, reordering all res[n] blocks."""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    lines = content.split('\n')
    
    # Find all function definitions that contain res blocks
    # Process line by line
    result_lines = process_function_body(lines)
    
    new_content = '\n'.join(result_lines)
    
    # Write back
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"Processed: {filepath}")


def main():
    files = [
        os.path.join(BASE_DIR, "scenes", "game_scene", "_common", "_anim.lua"),
        os.path.join(BASE_DIR, "scenes", "game_scene", "_common", "_projectile.lua"),
        os.path.join(BASE_DIR, "scenes", "game_scene", "characters", "TRM", "_anim.lua"),
        os.path.join(BASE_DIR, "scenes", "game_scene", "characters", "TRM", "_projectile.lua"),
    ]
    
    for f in files:
        if os.path.exists(f):
            process_file(f)
        else:
            print(f"FILE NOT FOUND: {f}")


if __name__ == "__main__":
    main()

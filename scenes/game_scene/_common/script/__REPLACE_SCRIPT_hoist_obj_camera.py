# Hoist `local obj_camera = obj_stage_game_scene_camera` to the top of each function
# (right after the first `local obj_VFX = ...` line, before any side-related declarations)
# and remove any duplicate declarations that sit inside nested closures (e.g. draw).
# Usage: python __REPLACE_SCRIPT_hoist_obj_camera.py <file1.lua> [file2.lua ...]
import re
import sys

obj_camera_pat = re.compile(r'^\s*local obj_camera = obj_stage_game_scene_camera\s*$')
func_start_pat = re.compile(r'^function\s')


def transform_function(body):
    # body: list of lines of ONE function block (first line is the `function` line)
    kept = [ln for ln in body if not obj_camera_pat.match(ln)]
    # find first `local obj_VFX = ...` line
    insert_at = None
    for i, ln in enumerate(kept):
        if ln.lstrip().startswith('local obj_VFX'):
            insert_at = i
            break
    if insert_at is None:
        return body  # no obj_VFX -> leave unchanged (conservative)
    kept.insert(insert_at + 1, '    local obj_camera = obj_stage_game_scene_camera\n')
    return kept


def process_file(path):
    with open(path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    # split into function blocks (line starting with `function ` at column 0)
    result = []
    current_func = None
    for ln in lines:
        if func_start_pat.match(ln):
            if current_func is not None:
                result.append(current_func)
            current_func = [ln]
        else:
            if current_func is not None:
                current_func.append(ln)
            else:
                result.append(ln)
    if current_func is not None:
        result.append(current_func)

    out = []
    changed = 0
    for block in result:
        if isinstance(block, list):
            if any(obj_camera_pat.match(b) for b in block):
                new_block = transform_function(block)
                if new_block != block:
                    changed += 1
                    print("  changed: " + block[0].strip())
                out.extend(new_block)
            else:
                out.extend(block)
        else:
            out.append(block)

    with open(path, 'w', encoding='utf-8') as f:
        f.writelines(out)
    print("%s: %d function(s) changed" % (path, changed))


if __name__ == "__main__":
    for file_path in sys.argv[1:]:
        process_file(file_path)

# Copilot / AI Agent Instructions — BLAZBLUE_STRIVE

Purpose: give an AI agent the minimal, high-value knowledge to be productive in this Love2D + Lua game repo.

---

## Quick start (run & debug) 🔧
- Project runs under LÖVE (Love2D). To run locally:
  - From project root: `love .`
  - On Windows use a packaged love executable or add Love to PATH.
- Live debugging: the project includes `lovebird` (see `lovebird.lua`). The in-game loop calls `require("lovebird").update()`; run the local http UI per `lovebird` docs.
- Useful debug keys (see `update_general_use_functions/debug.lua`):
  - F1 = pause toggle
  - F2 = show/hide hitboxes
  - F3 = show/hide info
  - 0..3 = training/debug toggles (0: toggle training mode, 1: counter, 2: change height, 3: block mode)

---

## Big-picture architecture 🏗️
- main.lua: custom `love.run()` and initialization. It bulk-loads modules with `require_all_in_folder` and `require_all_init_load_function`.
- Scenes are organized under `scenes_logic/` with subfolders per scene: `disclaimer_and_logos_scene`, `start_scene`, `char_select_scene`, `game_scene`.
- `game_scene` splits into logical subfolders
  - `_common/` — shared game-scene helpers (collision, common animations, load & init functions).
  - `characters/` — each character has initialization, logic, and animation tables.
  - `stage/` — stage drawing and camera logic (e.g., `stage/alpha.lua`).
- Engine utilities are in `update_general_use_functions/` (animators, input, resolution, thread load, etc.).
- Assets are described via `ASSET_DATA` and loaded by `load_function` files; scripts in `AE_to_love_2D_scripts/` and small python scripts (`load_image.py`) are part of the art-export pipeline.

---

## Project-specific patterns & conventions ⚙️
- Heavy use of globals (many `obj_`/`obj_char_` values and top-level tables set in `love.load`). Treat globals as the default data model.
- Object tables convention:
  - Positional indices `1..8` are used for graphic fields (x, y, z, opacity, sx, sy, r, frame).
  - Named keys store state and meta fields (e.g., `obj["x"]`, `obj["FCT"]`, `obj["LCT"]`, `obj["LCD"]`).
- Animations:
  - `anim` is a table with numeric keyframes and meta keys: `anim[0], anim[12], ...`, plus `anim["prop"]` (string property on target object), `anim["length"]`, `anim["loop"]`, `anim["fix_type"]`.
  - Use `init_point_linear_anim_with(obj, anim)` or `init_frame_anim_with(obj, anim)` before animating; these functions initialize `LCT`/`LCD`/`FCT` entries.
  - `point_linear_animator(obj, anim)` expects `obj[anim.prop]` and `obj["LCT"][anim.prop]` to exist.
- Naming pitfalls:
  - Many globals do *not* include the subsystem name (e.g., `DRAW_STAGE_GLOW_CANVAS`, `SCENE_TIMER`, `CHARACTER_VISUAL_FRONT`). Expect potential naming collisions when adding new globals.\n  - Some globals are shared state (e.g., `anim_camera_point_linear_game_scene_camera_shake_x`) and can be overwritten if multiple sources assign them concurrently.

---

## Common gotchas & safety checks ✅
- Always guard animation init/calls against `nil` anim tables. Example safe pattern:
```lua
if anim_camera_point_linear_game_scene_camera_shake_x then
  init_point_linear_anim_with(obj_camera, anim_camera_point_linear_game_scene_camera_shake_x)
end
```
- When adding animation triggers, prefer storing the anim on the target object (e.g., `obj_camera._shake_x = anim`) rather than reusing a single global, to avoid cross-trigger overwrites.
- When creating animations, set `anim["prop"]` to a string key that exists on the object and call `init_point_linear_anim_with` to initialize LCT/LCD.

---

## Key files to inspect for quick context 📂
- `main.lua` — app loop, global flags, debug toggles
- `advance_require_functions.lua` — module loading patterns
- `update_general_use_functions/animator.lua` — animation primitives (must-read for anim work)
- `scenes_logic/game_scene/_common/common_functions.lua` — shared game_scene helpers and typical patterns
- `scenes_logic/game_scene/stage/alpha.lua` — example of camera, draw, and shader usage
- `scenes_logic/game_scene/characters/` — examples of character data layouts and animation setup
- `AE_to_love_2D_scripts/` and `load_image.py` — asset export pipeline

---

## When making changes — short checklist ✔️
- Prefer `local` variables where possible to avoid polluting the global namespace.
- If you add new globals, use a clear prefix (e.g., `GAME_SCENE_*` or `UI_*`) to avoid collisions.
- For animations, always initialize with `init_*` and add `nil` guards before calling animator functions.
- Run the game with `love .` and use the built-in debug keys + `lovebird` to confirm behavior.

---

If anything in this draft is unclear or you want me to expand specific sections (examples for animation shapes, a full global-variable audit script, or adding short coding rules for PR reviews), say which section and I’ll iterate. ✨
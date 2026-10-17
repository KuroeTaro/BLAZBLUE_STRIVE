# 仓库代码审计报告

扫描范围:75 个 Lua 文件,约 64,700 行(排除 `tools/`、`_scratch/` 和第三方库 `lovebird.lua` / `lume.lua` / `dkjson.lua`)。
方法:文本级静态统计(定义/引用计数、字段写读计数、动态 key 过滤),宁可漏报不做语法级推断。
生成脚本:`tools/_scratch/audit_dead_code.py`,原始输出:`tools/_scratch/audit_report.txt`。

---

## A. 定义了但没有任何地方调用的 function(45 个)

### A-1 纯工具函数,从没被用过(可以删)

| 函数 | 位置 |
|---|---|
| `draw_sector` | draw_general_use_functions.lua:95 |
| `common_queue_new` / `_push` / `_pop` | update_general_use_functions/common.lua:24 / 30 / 40 |
| `common_ringbuffer_new` / `_push` / `_get` | update_general_use_functions/common.lua:45 / 53 / 60 |
| `init_stage_anim_without` | update_general_use_functions/animator.lua:201 |
| `collision_projectile_clash_test` | update_general_use_functions/collision.lua:296 |
| `collision_all_hit_type_hit_confirm_test` | update_general_use_functions/collision.lua:370 |
| `get_global_val_num` | update_general_use_functions/garbage_collection.lua:39 |
| `load_input_sys_cache_negative_edge_recache` | update_general_use_functions/input_sys.lua:328 |
| `unload_game_scene_all` | scenes/game_scene/_common/init.lua:230 |
| `update_game_scene_HUD_overdrive_text` | scenes/game_scene/_common/main_blocks.lua:1003 || `common_game_scene_anim_0_update_function_unwallstick` | scenes/game_scene/_common/common_functions.lua:81 |
| `common_game_scene_get_SFX_random_0_or_1` | scenes/game_scene/_common/common_functions.lua:151 |
| `common_game_scene_char_enclose_heat_gain` | scenes/game_scene/_common/common_functions.lua:358 |
| `common_game_scene_projectile_hit_function` | scenes/game_scene/_common/common_functions.lua:657 |

> `common_game_scene_char_enclose_heat_gain` 的逻辑已经内联写在
> `update_game_scene_char_LP_heat_gauge_update_function` 的 `-- update_if_enclose` 段里,
> 这个独立函数是重复实现。

> ⚠️ **`unload_game_scene_all` 值得单独看**:另外三个场景的卸载函数
> (`unload_char_select_scene_all` / `unload_disclaimer_and_logos_scene_all` /
> `unload_start_scene_all`)都在 main_blocks 里被调用了,只有 game_scene 的这个没人调。
> 它做的是「清掉所有名字含 game_scene/CANVAS 的全局变量 + unrequire 整个模块」。
> 如果游戏场景确实会退出(打完回选人/回标题),这里就是**漏了清理**,会残留全局变量和
> canvas;如果这个 demo 从不退出游戏场景,那才无所谓。

### A-2 「变体留好了但没接」(最可能是漏接)

| 函数 | 位置 | 备注 |
|---|---|---|
| `state_gate_..._ground_to_dash_move_PP` | left/right.lua:3513 | 同族 `_PH` / `_HH` 都在用(HH 用了十几次),只有 PP 没用 |
| `state_gate_..._ground_to_dash_move_NH` | left/right.lua:3603 | 同上 |
| `state_gate_..._ground_to_attack_move` | left/right.lua:4256 | 没有任何招式调用 |
| `state_gate_..._ground_to_attack_move_hold_ver` | left/right.lua:4279 | 同上 |
| `state_gate_..._air_to_dash_move_PP` | left/right.lua:4303 | 同上 |
| `state_gate_..._air_to_attack_move` | left/right.lua:4405 | 同上 |
| `insert_VFX_game_scene_char_blast_dynamic_ver0` | _VFX.lua:1539 | ver0 系列都没接 |
| `insert_VFX_game_scene_char_counter_blast_dynamic_ver0` | _VFX.lua:1747 | 同上 |
| `insert_VFX_game_scene_char_block_blast_dynamic_ver0` | _VFX.lua:2051 | 同上 |
| `insert_VFX_game_scene_char_counter_blast_special_projectile` | _VFX.lua:2887 | 同上 |

> 注意 `ground_to_dash_move` 一族只有 PP/NH 没用,`PH`/`HH` 在用 —— 这更像是
> 「本来要支持 4 种冲刺输入,最后只接了 2 种」,是设计缺口而不是垃圾代码。

### A-3 动画库,可能是故意留着的素材(14 个)

```
load_game_scene_anim_char_common_0_general_hurt_falled_knockout      _anim.lua:45
load_game_scene_anim_char_common_0_ground_hurt_lv4                   _anim.lua:601
load_game_scene_anim_char_common_0_ground_block_lv4                  _anim.lua:1132
load_game_scene_anim_char_common_0_air_block_guard_crash             _anim.lua:1398
load_game_scene_anim_char_common_0_general_hurt_hard_knockdown_head_down  _anim.lua:1941
load_game_scene_anim_char_common_0_general_hurt_launched_float       _anim.lua:2907
load_game_scene_anim_char_common_0_general_hurt_launched_mid_hori_heavy   _anim.lua:3537
load_game_scene_anim_char_common_0_general_hurt_launched_mid_up      _anim.lua:3647
load_game_scene_anim_char_common_0_general_hurt_launched_rolling     _anim.lua:3817
load_game_scene_anim_char_common_0_general_hurt_launched_rotate      _anim.lua:3956
load_game_scene_anim_char_common_0_general_hurt_launched_wallbounce  _anim.lua:4071
```
这些是受伤/击飞动画的通用构造函数,没有任何招式用它们。如果是有意保留的素材库,
建议加注释说明;否则就是占体积的死代码。

---

## B. 写进对象但从来没有人读的字段

经过动态 key 过滤(`res["prop_f"] = "f_8"`、`state = "hurt"` 这类不算),剩下 14 个:

| 字段 | 写入次数 | 位置(示例) |
|---|---|---|
| `obj_VFX["r_cache"]` | 8 | _VFX.lua:2319 / 2409 / 2514 / 2604 |
| `obj_VFX["x_table"]` | 8 | _VFX.lua:2320 / 2410 / 2515 / 2605 |
| `obj_VFX["y_table"]` | 8 | _VFX.lua:2321 / 2411 / 2516 / 2606 |
| `obj_VFX["center_table"]` | 8 | _VFX.lua:2322 / 2412 / 2517 / 2607 |
| `shot_sys_oroboros_state_cache` | 6 | left/right.lua:239 / 890 / 3032 |
| `shot_sys_camera_shake_anim_table` | 4 | left/right.lua:235 / 886 |
| `shot_sys_reticle_state_cache` | 4 | left/right.lua:279 / 930 |
| `input_sys_cache_hit_jump_cancel` | 2 | left/right.lua:120 |

`r_cache` / `x_table` / `y_table` / `center_table` 是最典型的「留好的值放在没用的地方」:
函数里把参数表存到 `obj_VFX` 上,但紧接着 `obj_VFX["sub_obj"]` 又把同样的值逐个内联进去了,
这 4 个字段从此再没人读。

---

## C. 只声明、从未使用的 local 变量(64 个)

### C-1 游戏代码里真正没用的

| 位置 | 代码 |
|---|---|
| scenes/game_scene/stage/alpha.lua:933 | `local x_dst = 2290` ← 调参遗留,实际用的是 1910.0 |
| scenes/game_scene/stage/alpha.lua:934 | `local obj_camera_start_x = obj_camera["3d_pos_x"]` |
| scenes/game_scene/_common/main_blocks.lua:778 | `local stage_collision = false` |
| scenes/game_scene/_common/common_functions.lua:211 | `local opponent_side_input = INPUT_SYS_CURRENT_COMMAND_STATE[...]` ← 算出来没用 |
| scenes/game_scene/_common/collision.lua:101 | `local obj_camera = obj_stage_game_scene_camera` |
| scenes/game_scene/characters/TRM/_anim.lua:819 | `local input = INPUT_SYS_CURRENT_COMMAND_STATE[side]` |
| scenes/game_scene/characters/TRM/_character_function.lua:117 | `local random_offset = (math.random(2) == 1) and 1 or 0` |
| scenes/game_scene/characters/TRM/left.lua:4662 / right.lua:4662 | `local backward_dash_state = { ["4dash_backdash"]=true, ... }` 整张表没人用 |
| scenes/game_scene/characters/TRM/left.lua:5427 / right.lua:5427 | `local self_side = self_side_obj_char["player_side"]` |
| scenes/char_select_scene/draw_functions.lua:142 | `local r = obj[7]` |

### C-2 线程模板的复制粘贴残留(30+ 个文件,每个 3 行)

`threads/**/*.lua` 里几乎每个文件开头都有:

```lua
local filesys_module = require "love.filesystem"
local non_compress_module = image_module.newImageData
local sound_module = auido_module.newSoundData
```

三个都没用到(`sound_module` 甚至拼错成 `auido_module` —— 因为没执行到所以不会报错)。
建议要么删掉,要么做成公共模板函数。

---

## D. 设计好但从来没被接上的钩子

| 钩子 | 读的地方 | 谁设置它 |
|---|---|---|
| `projectile["friction_update_function"]` | main_blocks.lua:577 / 583 / 601 / 607 | **没有任何地方** |
| `projectile["friendly_interact_function"]` | main_blocks.lua:328 / 336 | **没有任何地方** |

两个都是带 `if ... then` 保护的可选回调,但全仓库没有任何 projectile 设置它们,
所以这几段分支永远是死分支 —— 属于「明明设计好了 function 但是没有用上」。

---

## E. 数值/参数层面的可疑设计

1. **`obj_VFX["r_cache"]` 等 4 个缓存字段**(见 B)——参数存了但没用。
2. **`stage/alpha.lua:933` 的 `x_dst = 2290`** —— 壁破镜头本可以用它当目标,实际却写死
   `hurt_side_wallstick_on_side*1910.0`。数字留好了但没用上。
3. **`local backward_dash_state`**(left/right.lua:4662)—— 定义了「4dash 后退」状态集合,
   同函数里 `velocity_cache_uncommon_case` 也引用了 `4dash_backdash`,但状态集合本身没被用。
4. **RC 冲击波里的 `hit_heat_gain = 0` / `hit_damage = 0`** —— 值是对的,但 RC 冲击波本身
   是 0 伤害的演出道具,这些字段写 0 等于没意义(可保留,属风格问题)。

---

## 建议的清理顺序(风险从低到高)

1. **零风险**:删 `threads/**` 的 3 行未使用 local;删 C-1 里的未使用 local;
   删 B 里的 4 个 `obj_VFX["*_cache"/"*_table"]` 赋值。
2. **低风险**:删 A-1 的工具函数(确认没被 LÖVE 回调间接使用)。
3. **需要判断**:A-2 的变体/ver0 函数 —— 是补齐接线还是删除,需要设计决定。
4. **需要判断**:A-3 的动画库、D 的两个钩子 —— 保留就加注释,不保留就删。

# 已移除模组备份（16 个模组）

| 项 | 值 |
|---|---|
| 项目 | BLAZBLUE_STRIVE（Love2D / Lua） |
| 移除日期 | 2026-10-29 |
| 备份目录 | `scenes/game_scene/characters/TRM/design_document/removed_modules_20261029/` |
| 代码改动 | 5 个文件，删除 2223 行 |
| 美术资产 | 96 个文件，33.36 MB（含 2 个音效文件） |

原则：**只删除、不改写逻辑**。被删代码按整块原样留档，改动前的完整文件可一键回滚，美术文件保持原相对路径。

## 1. 移除的模组

| # | 模组 | 说明 |
|---|------|------|
| 1 | `_4SP_S_4dash` | 4SP_S 派生（后撤步，ground） |
| 2 | `_4SP_S_6dash` | 4SP_S 派生（前冲步，ground） |
| 3 | `_4SP_S_2Launcher` | 4SP_S 派生（2 方向 Launcher） |
| 4 | `_4SP_S_5Launcher` | 4SP_S 派生（5 方向 Launcher） |
| 5 | `_4SP_S_8Launcher` | 4SP_S 派生（8 方向 Launcher） |
| 6 | `_SP_H` | SP+H 必杀本体（地面） |
| 7 | `_SP_H_P` | SP+H 派生 P |
| 8 | `_SP_H_K` | SP+H 派生 K |
| 9 | `_SP_H_S` | SP+H 派生 S |
| 10 | `_SP_H_H` | SP+H 派生 H |
| 11 | `_jSP_S` | 空中 SP+S（仅状态占位） |
| 12 | `_jSP_H` | 空中 SP+H 必杀本体 |
| 13 | `_jSP_H_P` | 空中 SP+H 派生 P |
| 14 | `_jSP_H_K` | 空中 SP+H 派生 K |
| 15 | `_jSP_H_S` | 空中 SP+H 派生 S |
| 16 | `_jSP_H_H` | 空中 SP+H 派生 H |

> `_SP_H_P/K/S/H`、`_jSP_H_P/K/S/H` 在 `_anim.lua` 里原本只有占位注释、没有动画函数；`_jSP_S` 也没有动画函数，只有状态分发与空 gate。

## 2. 代码移除明细

| 文件 | 删除行数 | 删除内容 |
|---|---:|---|
| `scenes/game_scene/characters/TRM/_anim.lua` | 1251 | 7 个动画函数（4SP_S_4dash / 6dash / 2Launcher / 5Launcher / 8Launcher、SP_H、jSP_H）+ 16 处状态注释块（含 9 处纯占位）+ SP_H 的 9 行帧时间轴说明 |
| `scenes/game_scene/characters/TRM/left.lua` | 477 | 状态分发表 16 项、`from_*` gate 16 个、6 个进入转移 if 块、`shot_sys_at_the_ready_ban_state` 7 项、贴图加载表 9 项、残留注释 17 行 |
| `scenes/game_scene/characters/TRM/right.lua` | 477 | 同上（RP 镜像） |
| `threads/game_scene/characters/TRM_left_texture.lua` | 9 | DDS 预加载表：attack 7 项 + projectile 2 项 |
| `threads/game_scene/characters/TRM_right_texture.lua` | 9 | 同上（镜像） |

配套文件：

- `code/removed_code.txt` —— 每一段被删代码的原文（带“原文件行号区间 + 类型 + 模组名”表头）。
- `code/removal_meta.json` —— 结构化的删除清单（`chunks` 记录每个片段的起止行）。
- `code/before/` —— 改动前的 5 个文件完整副本（**精确字节级回滚**用）。
- `code/removal.patch` —— 统一 diff（LF 形式，见第 5 节）。

## 3. 美术资产移除明细

共 96 个文件、33.36 MB，全部按原相对路径存放在 `asset/` 下：

| 目录 | 文件数 | 大小 |
|---|---:|---:|
| `texture/attack`（7 套 .DDS/.json/.png） | 21 | 26.63 MB |
| `texture/projectile`（SP_H_chain / SP_H_oroboros） | 6 | 0.09 MB |
| `texture/_IMG/attack/4PS_S_4dash` | 10 | 0.84 MB |
| `texture/_IMG/attack/4PS_S_6dash` | 9 | 0.74 MB |
| `texture/_IMG/attack/4SP_S_2Launcher` | 15 | 1.45 MB |
| `texture/_IMG/attack/4SP_S_5Launcher` | 11 | 0.97 MB |
| `texture/_IMG/attack/4SP_S_8Launcher` | 11 | 1.08 MB |
| `texture/_IMG/attack/SP_H/character/{ground,air}` | 8 | 0.73 MB |
| `texture/_IMG/attack/SP_H/chain` + `oroboros` | 3 | 0.03 MB |
| `audio/move_SFX/special/SP_H`（whiff 音效） | 2 | 0.80 MB |

细节：

- `texture/attack/`：`TRM_4SP_S_4dash`、`TRM_4SP_S_6dash`、`TRM_4SP_S_2Launcher`、`TRM_4SP_S_5Launcher`、`TRM_4SP_S_8Launcher`、`TRM_SP_H`、`TRM_jSP_H`，每套 `.DDS` + `.json` + `.png`。
  - 注意：`4SP_S_2Launcher/5Launcher/8Launcher` 的动画体实际复用了 `2Launcher`/`5P` 的贴图名，因此这三套专属贴图在移除前就已经是**无引用资产**。
- `texture/projectile/`：`TRM_SP_H_chain`、`TRM_SP_H_oroboros`（SP_H 锁链弹原型用图）。
- `texture/_IMG/attack/`：上述模组的 AE 导出原始帧目录；`_IMG` 全项目无任何运行时引用。
- `audio/move_SFX/special/SP_H/`：`SP_H_whiff.ogg|.wav`（此前未登记在 `TRM_*_audio.lua` 的加载表中）。

## 4. 同步修改的加载表

- `left.lua` / `right.lua` → `order_load_game_scene_char_*_frames`：
  - `[24]` 去掉 `SP_H`、`jSP_H`；
  - `[25]` 去掉 5 个 `4SP_S_*`；
  - `[27]`（projectile）去掉 `SP_H_chain`、`SP_H_oroboros`。
- `threads/TRM_*_texture.lua`：`attack` 表去掉 7 项，`projectile` 表去掉 2 项。

## 5. 校验结果

- **Lua 结构**：`_anim.lua`、`left.lua`、`right.lua`、两个 `*_texture.lua` 通过块级配对检查（function/if/do/repeat 与 end/until 完全平衡），且与改动前的通过状态一致。
- **无残留引用**：5 个 Lua 文件中已搜不到 16 个模组名的任何引用（`4SP_S_4S`、`4SP_S_H` 等保留模组不受影响）。
- **贴图可得性**：`order_load` 里剩余 **143** 个贴图名逐一核对，`.dds/.json/.png` 全部存在。
- **预加载表**：universal 60 / attack 53 / move_VFX 19 / projectile 11 项全部命中磁盘文件。
- **补丁可回放**：在干净副本上用 `git apply code/removal.patch` 可得到与当前文件逐字节一致的结果（行尾归一后）。

## 6. 还原方法

**方式 A（推荐，精确回滚到移除前）**：用 `code/before/` 覆盖回对应文件，再把 `asset/` 下的文件按相同相对路径拷回。

**方式 B（只恢复本批模组）**：按 `code/removed_code.txt` 逐段贴回，并在 `threads/*_texture.lua`、`order_load_*_frames`、状态分发表中补上对应条目。

**方式 C（补丁）**：`git apply` 需要 `core.autocrlf=true`（本仓库即是）；若行尾策略不同，改用方式 A。

## 7. 有意保留的旧引用

以下文件仍会提到这些状态名，属于**设计稿/文档/自动生成产物**，不在本次删除范围：

- `design_document/^state_machine_design_document.txt`、`^animation_change.txt`、`^character_design_document.txt`：设计稿历史。
- `design_document/^drive_sys.lua`、`^drive_sys_projectile.lua`、`^drive_sys_readme.txt`：SP_H 锁链弹的原型实现与说明（未接入主流程）。
- `docs/TRM_character_state_machine.md`、`tools/state_machine_report.txt`、`tools/state_machine_analysis.json`、`tools/long_line_shapes.txt`：文档与静态分析快照。
- `_tmp_video/*`：调参日志。

> 这些文件不参与运行时加载，也不含可执行的状态注册；如需彻底清理可另行处理。

## 8. 输入缓存方向修复（direction_input 缓存）

把输入缓存从「记原始左右键、load 时用新朝向重算」改为「直接记解算后的 direction_input」，修掉了 4SP_P 取消帧把 5P 判成 6P 的问题。

- 补丁：`code/input_cache_direction.patch`（LF，`core.autocrlf=true` 下 `git apply` 可直接套回，实测可逐字复现）
- 涉及文件：`left.lua` / `right.lua`（save / load / init_input_sys_cache_*）、`_anim.lua`（4_6Launcher、j4_6Launcher 投技方向锁定）、`scenes/game_scene/_common/main_blocks.lua`（方向解算调到输入缓存之前）

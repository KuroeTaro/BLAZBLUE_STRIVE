# -*- coding: utf-8 -*-
"""D类清理: 修正 TRM left/right.lua 中 game_speed 初始化注释与 game_speed_application 初值。
只做纯文本替换, 替换数量必须等于预期(每文件3处), 否则报错不写入。"""
import io
import os

BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "scenes", "game_scene", "characters", "TRM")

# 每项: (去掉 obj_char_game_scene_char_{side} 前缀后的 old, new)
REPLACEMENT_SUFFIXES = [
    # 1) abnormal_realtime_countdown 是"慢放持续的真实帧数"
    (
        '["game_speed_abnormal_realtime_countdown"] = 0 -- 只能是game_speed的倍数',
        '["game_speed_abnormal_realtime_countdown"] = 0 -- 慢放持续的真实帧数(建议为game_speed的倍数)',
    ),
    # 2) force_0_countdown 是"全停冻结帧数", 与 game_speed 的"倍数"注释无关
    (
        '["game_speed_force_0_countdown"] = 0 -- 只能是game_speed的倍数',
        '["game_speed_force_0_countdown"] = 0 -- 全停冻结的帧数(real frame)',
    ),
    # 3) game_speed_application 初值只以 [1]==1 触发, 其余槽位表示"无待应用内容"
    (
        '["game_speed_application"] = {0,1,1,0,0,0}',
        '["game_speed_application"] = {0,nil,nil,nil,nil,nil}',
    ),
]


def apply_side(path, side_var):
    with io.open(path, "r", encoding="utf-8") as f:
        text = f.read()
    for old_suffix, new_suffix in REPLACEMENT_SUFFIXES:
        old = 'obj_char_game_scene_char_' + side_var + old_suffix
        new = 'obj_char_game_scene_char_' + side_var + new_suffix
        count = text.count(old)
        if count != 3:
            raise AssertionError("%s: pattern count %d != 3 -> %s" % (os.path.basename(path), count, old))
        text = text.replace(old, new)
    with io.open(path, "w", encoding="utf-8", newline="") as f:
        f.write(text)
    print("OK", os.path.basename(path))


def main():
    apply_side(os.path.join(BASE, "left.lua"), "LP")
    apply_side(os.path.join(BASE, "right.lua"), "RP")


if __name__ == "__main__":
    main()

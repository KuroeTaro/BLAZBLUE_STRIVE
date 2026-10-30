# -*- coding: utf-8 -*-
"""
从 TRM_overdrive_badge 的 70 帧序列图反推「缩放 / 亮度」时间轴。

背景:
    TRM_overdrive_badge 已经改成单张 TRM_overdrive_badge_static (1000x1000,
    等于原序列第 40 帧)。原本烘焙在序列图里的缩放与透明度必须由
    scenes/_scene_config/_overdrive_badge_anim.lua 的 OVERDRIVE_BADGE_ANIM 在运行时重建,
    这个脚本就是那张表的数据来源。

原理:
    [1] 对每一帧做「居中缩放 + 归一化互相关」搜索,取相关度最高的缩放倍率
        (步进 0.005,范围 0.60-1.40)。徽章始终居中,所以不搜平移。
    [2] 以 static 的亮部像素为样本,取 frame/static 比值的中位数作为 additive 亮度。
    [3] 第 38-57 帧与 static 完全一致(scale = 1.000 / alpha = 1.000),可作为校准点。

用法:
    python tools/analyze_overdrive_badge_anim.py
输出:
    控制台打印逐帧的 {缩放,亮度} 参考值。
    注意:_overdrive_badge_anim.lua 现在用 point_linear_anim 关键帧(线性插值),
    这些逐帧值只用来挑关键帧 / 核对误差,不需要整表贴回去。
"""
import json
import math
import os

import numpy as np
from PIL import Image

ROOT = r"H:\_love\BLAZBLUE_STRIVE"
TEXTURE_DIR = os.path.join(
    ROOT, "asset", "game_scene", "characters", "TRM", "texture", "overdrive_badge"
)
SHEET_JSON = os.path.join(TEXTURE_DIR, "TRM_overdrive_badge.json")
SHEET_PNG = os.path.join(TEXTURE_DIR, "TRM_overdrive_badge.png")
STATIC_PNG = os.path.join(TEXTURE_DIR, "TRM_overdrive_badge_static.png")
WORK = 240          # 比对用的降采样边长(每个 1000x1000 帧缩到 WORKxWORK)
SCALE_MIN = 0.60
SCALE_MAX = 1.40
SCALE_STEP = 0.005


def load_frames():
    meta = json.load(open(SHEET_JSON, encoding="utf-8"))
    Image.MAX_IMAGE_PIXELS = None
    sheet = Image.open(SHEET_PNG).convert("L")
    tile = 1000
    frames = []
    for i in range(len(meta["frames"])):
        box = ((i % 14) * tile, (i // 14) * tile, (i % 14) * tile + tile, (i // 14) * tile + tile)
        frames.append(sheet.crop(box).resize((WORK, WORK), Image.LANCZOS))
    return frames


def centered_scale(img, scale):
    """把 WORKxWORK 的 static 以中心为原点缩放到 scale 倍,返回同尺寸画布。"""
    size = max(2, int(round(WORK * scale)))
    resized = img.resize((size, size), Image.LANCZOS)
    canvas = Image.new("L", (WORK, WORK), 0)
    offset = (WORK - size) // 2
    canvas.paste(resized, (offset, offset))
    return canvas


def main():
    Image.MAX_IMAGE_PIXELS = None
    static = Image.open(STATIC_PNG).convert("L").resize((WORK, WORK), Image.LANCZOS)
    frames = load_frames()
    scales = [round(SCALE_MIN + SCALE_STEP * k, 3)
              for k in range(int(round((SCALE_MAX - SCALE_MIN) / SCALE_STEP)) + 1)]
    templates = {}
    for s in scales:
        tpl = np.asarray(centered_scale(static, s), dtype=np.float32)
        tpl = tpl - tpl.mean()
        templates[s] = (tpl, float((tpl * tpl).sum()))

    table = []
    for index, frame in enumerate(frames):
        f = np.asarray(frame, dtype=np.float32)
        f0 = f - f.mean()
        f_norm = float((f0 * f0).sum()) + 1e-9
        best_scale, best_corr = 1.0, -1.0
        for s in scales:
            tpl, tpl_norm = templates[s]
            corr = float((tpl * f0).sum() / math.sqrt(tpl_norm * f_norm))
            if corr > best_corr:
                best_scale, best_corr = s, corr
        tpl = np.asarray(centered_scale(static, best_scale), dtype=np.float32)
        mask = tpl > 20.0
        alpha = float(np.median(f[mask] / tpl[mask])) if mask.sum() > 1000 else 0.0
        table.append((index, best_scale, alpha))

    for index, scale, alpha in table:
        print("    [%d] = {%.3f,%.3f}," % (index, scale, max(0.0, alpha)))


if __name__ == "__main__":
    main()
# -*- coding: utf-8 -*-
"""
将工程 asset/ 目录下所有 .wav 转成 .ogg（保留原 .wav，生成同名 .ogg）。
依赖：PyAV（pip install av，内置 FFmpeg 库，无需系统安装 ffmpeg）。

用法：
    python tools/convert_wav_to_ogg.py            # 转换全部
    python tools/convert_wav_to_ogg.py --dry-run  # 只列出将被转换的文件
"""
import argparse
import os
import sys

import av

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ASSET_DIR = os.path.join(ROOT, "asset")
AUDIO_BITRATE = 192000  # Vorbis 目标码率（SFX/BGM 通用）


def find_wav_files(root_dir):
    for dirpath, _dirnames, filenames in os.walk(root_dir):
        for name in sorted(filenames):
            if name.lower().endswith(".wav"):
                yield os.path.join(dirpath, name)


def convert_wav_to_ogg(src, dst, bitrate=AUDIO_BITRATE):
    """用 PyAV 把 wav 转成 ogg(vorbis)，保持采样率与声道数。"""
    with av.open(src) as in_c:
        in_stream = next((s for s in in_c.streams if s.type == "audio"), None)
        if in_stream is None:
            raise RuntimeError("no audio stream in %s" % src)

        with av.open(dst, "w") as out_c:
            # 本 build 用 FFmpeg 原生 vorbis 编码器（libvorbis 未编译进去）
            out_stream = out_c.add_stream("vorbis", rate=in_stream.rate)
            out_stream.codec_context.bit_rate = bitrate
            # 原生 vorbis 编码器标记为 experimental，需放宽严格度才能打开
            out_stream.codec_context.options["strict"] = "-2"
            if in_stream.layout is not None:
                out_stream.layout = in_stream.layout
            else:
                out_stream.layout = "mono" if in_stream.channels == 1 else "stereo"

            for frame in in_c.decode(in_stream):
                # 保留解码帧的 pts（PyAV 会按编码器时间基自动 rebase）；
                # 若清空 pts=None，FFmpeg 原生 vorbis 编码器的 OGG granule 会算错，
                # 导致文件被截断（时长只有 ~1%）。实测 preserve 后 granule 正确。
                for packet in out_stream.encode(frame):
                    out_c.mux(packet)
            for packet in out_stream.encode(None):
                out_c.mux(packet)


def main():
    parser = argparse.ArgumentParser(description="Convert all WAV assets to OGG.")
    parser.add_argument("--dry-run", action="store_true",
                        help="only list files that would be converted")
    args = parser.parse_args()

    wav_files = list(find_wav_files(ASSET_DIR))
    print("Found %d WAV files under %s" % (len(wav_files), ASSET_DIR))

    if args.dry_run:
        for src in wav_files:
            dst = os.path.splitext(src)[0] + ".ogg"
            print("-> %s" % dst)
        return

    ok, failed = 0, 0
    for src in wav_files:
        dst = os.path.splitext(src)[0] + ".ogg"
        try:
            convert_wav_to_ogg(src, dst)
            ok += 1
            print("[%3d/%3d] %s  ->  %s" % (ok, len(wav_files), src, dst))
        except Exception as exc:  # noqa: BLE001
            failed += 1
            print("[FAIL] %s : %s" % (src, exc), file=sys.stderr)
            if os.path.exists(dst):
                try:
                    os.remove(dst)
                except OSError:
                    pass

    print("\nDone. converted=%d failed=%d" % (ok, failed))
    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    main()

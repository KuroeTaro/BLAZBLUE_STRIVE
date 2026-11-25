# 把 asset/ 下每个目录里的 .dds / .json / .ogg 打成同目录的一个 _pack.bin,线程加载时只开这一个文件
# (读取见 threads/thread_common.lua)
#   · 为什么:这台机器上每打开一个文件固定要 20ms 以上(实测冷文件 open 23ms、stat 5ms),
#     角色贴图线程 161 张贴图 + 161 个 json 光开文件就要好几秒;打成包之后一个目录只开一次
#   · .dds 用 zlib 压缩(BC7 里透明区域多,平均压到 1/7),.json / .ogg 原样放
#   · 包里的名字:.dds 统一成小写扩展名(磁盘上有不少 .DDS,代码里写的是 .dds),其他保持磁盘上的名字
#   · 增量:目录里有文件比 _pack.bin 新、或者文件增删了才重打这个目录;改了素材重新跑一次就行
#   · 跳过 _IMG 目录(素材源文件,游戏里不读)
#
# 格式(小端):
#   "BBSPACK1"  8 字节
#   uint32      索引长度 N
#   N 字节      索引文本,每行 "名字\t压缩(0/1)\t偏移\t大小\n",偏移从文件开头算
#   数据        按索引顺序紧挨着放(同名的 .dds 和 .json 挨着,线程读贴图时顺手读 json)
#
# 用法:python tools/asset_pack.py [--level 6]
import argparse
import os
import struct
import time
import zlib

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ASSET_DIR = os.path.join(ROOT, "asset")
PACK_NAME = "_pack.bin"
MAGIC = b"BBSPACK1"
SKIP_DIR_NAMES = {"_img"}
EXTENSION_ORDER = {".dds": 0, ".json": 1, ".ogg": 2}


def collect_entries(dir_path, file_names):
    # 返回 [(包里的名字, 磁盘路径, 是否压缩)],同名的 .dds / .json 挨着
    entries = []
    for file_name in file_names:
        stem, ext = os.path.splitext(file_name)
        ext_lower = ext.lower()
        if ext_lower not in EXTENSION_ORDER:
            continue
        pack_name = stem + ".dds" if ext_lower == ".dds" else file_name
        entries.append((stem.lower(), EXTENSION_ORDER[ext_lower], pack_name, os.path.join(dir_path, file_name)))
    entries.sort()
    return [(pack_name, path, path.lower().endswith(".dds")) for _, _, pack_name, path in entries]


def read_pack_names(pack_path):
    with open(pack_path, "rb") as f:
        header = f.read(12)
        if header[:8] != MAGIC:
            return None
        index_length = struct.unpack("<I", header[8:12])[0]
        index_text = f.read(index_length).decode("utf-8")
    return [line.split("\t")[0] for line in index_text.split("\n") if line]


def pack_is_up_to_date(pack_path, entries):
    if not os.path.exists(pack_path):
        return False
    pack_time = os.path.getmtime(pack_path)
    if any(os.path.getmtime(path) > pack_time for _, path, _ in entries):
        return False
    return read_pack_names(pack_path) == [pack_name for pack_name, _, _ in entries]


def build_pack(pack_path, entries, level):
    blobs = []
    for pack_name, path, compress in entries:
        with open(path, "rb") as f:
            data = f.read()
        blobs.append((pack_name, 1 if compress else 0, zlib.compress(data, level) if compress else data, len(data)))
    # 索引里的偏移依赖索引本身的长度:先按占位算一次长度,再定偏移(偏移位数变了就再算一轮)
    index_length = 0
    while True:
        offset = len(MAGIC) + 4 + index_length
        lines = []
        for pack_name, flag, blob, _ in blobs:
            lines.append("%s\t%d\t%d\t%d\n" % (pack_name, flag, offset, len(blob)))
            offset += len(blob)
        index_bytes = "".join(lines).encode("utf-8")
        if len(index_bytes) == index_length:
            break
        index_length = len(index_bytes)
    with open(pack_path + ".tmp", "wb") as f:
        f.write(MAGIC)
        f.write(struct.pack("<I", len(index_bytes)))
        f.write(index_bytes)
        for _, _, blob, _ in blobs:
            f.write(blob)
    os.replace(pack_path + ".tmp", pack_path)
    raw_size = sum(raw for _, _, _, raw in blobs)
    packed_size = sum(len(blob) for _, _, blob, _ in blobs)
    return raw_size, packed_size


def build_all(level=6, log=print):
    start_time = time.time()
    built = skipped = 0
    raw_total = packed_total = 0
    for dir_path, dir_names, file_names in os.walk(ASSET_DIR):
        dir_names[:] = [name for name in dir_names if name.lower() not in SKIP_DIR_NAMES]
        entries = collect_entries(dir_path, file_names)
        pack_path = os.path.join(dir_path, PACK_NAME)
        if not entries:
            if os.path.exists(pack_path):
                os.remove(pack_path)
            continue
        if pack_is_up_to_date(pack_path, entries):
            skipped += 1
            continue
        raw_size, packed_size = build_pack(pack_path, entries, level)
        built += 1
        raw_total += raw_size
        packed_total += packed_size
        log("%4d files %8.1fMB -> %7.1fMB  %s" % (
            len(entries), raw_size / 1e6, packed_size / 1e6, os.path.relpath(pack_path, ROOT)
        ))
    log("built %d, skipped %d (up to date), %.1fMB -> %.1fMB, %.1fs" % (
        built, skipped, raw_total / 1e6, packed_total / 1e6, time.time() - start_time
    ))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--level", type=int, default=6)
    build_all(parser.parse_args().level)

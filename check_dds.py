import os
import struct

# ================= 配置路径 =================
# 将 YOUR_FOLDER_PATH 替换为你的 dds 文件夹路径
FOLDER_PATH = "YOUR_FOLDER_PATH"
# 输出的 txt 文件名称
OUTPUT_TXT = "invalid_dds_files.txt"
# ============================================


def get_dds_resolution(file_path):
    """通过读取二进制文件头获取 DDS 的宽高"""
    try:
        with open(file_path, "rb") as f:
            # DDS 文件头总共 128 字节
            header = f.read(128)

            # 验证魔术字是否为 'DDS '
            if header[0:4] != b"DDS ":
                return None

            # 根据 DDS 格式规范：
            # 字节 12-15 是高度 (Height)，字节 16-19 是宽度 (Width)
            # 使用小端序 (Little-endian) 4字节无符号整数 'I' 解析
            height = struct.unpack("<I", header[12:16])[0]
            width = struct.unpack("<I", header[16:20])[0]

            return width, height
    except Exception:
        return None


def check_dds_folder(folder_path, output_txt):
    invalid_files = []

    # 遍历文件夹及其子文件夹
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            if file.lower().endswith(".dds"):
                file_path = os.path.join(root, file)

                res = get_dds_resolution(file_path)
                if res is None:
                    print(f"无法解析或非标准DDS: {file_path}")
                    continue

                width, height = res

                # 检查尺寸是否满足 4 的倍数
                if width % 4 != 0 or height % 4 != 0:
                    invalid_files.append(file_path)
                    print(
                        f"尺寸异常: {file_path} (宽: {width}, 高: {height})"
                    )

    # 将结果写入 txt 文件
    with open(output_txt, "w", encoding="utf-8") as f:
        for item in invalid_files:
            f.write(item + "\n")

    print(f"\n检查完成！共发现 {len(invalid_files)} 个尺寸异常的文件。")
    print(f"结果已保存至: {os.path.abspath(output_txt)}")


if __name__ == "__main__":
    check_dds_folder(FOLDER_PATH, OUTPUT_TXT)

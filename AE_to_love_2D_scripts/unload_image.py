import os

# 指定包含图像的文件夹路径
folder_path = "asset/load_scene"

image_data_code = []
graph_code = []

def generate_code_for_folder(folder, base_index=0):
    index = base_index
    for root, dirs, files in os.walk(folder):
        for file_name in files:
            # 获取文件完整路径并转换路径分隔符
            address = os.path.join(root, file_name).replace("\\", "/")
            # 获取不带扩展名的文件名
            name_without_ext = os.path.splitext(file_name)[0]
            # 生成 imageData 代码
            image_data_line = f'imageData[{index}] = love.image.newCompressedData("{address}")'
            image_data_code.append(image_data_line)
            # 生成 file_name_image 代码
            graph_line = f'{name_without_ext}_image = nil'
            graph_code.append(graph_line)
            index += 1
    return index

# 调用函数生成代码
generate_code_for_folder(folder_path)

# 合并代码并输出
final_code = "\n".join(image_data_code + graph_code)

print(final_code)

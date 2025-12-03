// 获取当前激活的合成
var comp = app.project.activeItem;

// 检查是否为合成
if (comp && comp instanceof CompItem) {
    // 获取所选图层
    var selectedLayer = comp.selectedLayers[0];

    var rect = selectedLayer.sourceRectAtTime(0, false);
    var width = rect.width;
    var height = rect.height;

    alert("Width: " + width + "\nHeight: " + height);

    if (selectedLayer && selectedLayer instanceof ShapeLayer) {
        // 获取形状组中的路径 1
        var shapeGroup = selectedLayer.property("Contents").property("形状 1");
        if (shapeGroup) {
            var pathProp = shapeGroup.property("Contents").property("路径 1").property("路径");

            if (pathProp) {
                // 进入脚本撤销组
                app.beginUndoGroup("导出形状点");

                // 获取路径点信息
                var path = pathProp.value; // Shape 对象
                var vertices = path.vertices; // 顶点位置数组

                // 设置文件路径
                var filePath = "F:/LOVE/Blazblue_Strive/shape_points.txt"; // 将文件保存到桌面
                var file = new File(filePath);

                // 打开文件准备写入
                if (file.open("w")) {
                    // 写入格式
                    file.writeln("lines = {");

                    // 写入每条线段的坐标
                    for (var i = 0; i < vertices.length; i++) {
                        var vertex = vertices[i];

                        // 如果是最后一个点，连接到第一个点
                        var nextVertex = vertices[(i + 1) % vertices.length];

                        // 写入每条线段的坐标
                        if (i > 0) {
                            file.writeln(",");
                        }
                        file.writeln("    {" + ((vertex[0]).toFixed(2)) + ", " + ((vertex[1]).toFixed(2)) + ",");
                        file.writeln("     " + ((nextVertex[0]).toFixed(2)) + ", " + ((nextVertex[1]).toFixed(2)) + "}");
                    }

                    file.writeln("\n}"); // 结束 lines 字典
                    file.writeln((width).toFixed(2) + ", " + (height).toFixed(2) + "\n"); // 结束 lines 字典
                    file.close(); // 关闭文件
                    alert("点信息已保存到 shape_points.txt 文件！");
                } else {
                    alert("无法打开文件进行写入！");
                }

                app.endUndoGroup();
            } else {
                alert("未找到路径 1 的路径属性！");
            }
        } else {
            alert("未找到形状 1！");
        }
    } else {
        alert("请选择一个形状图层！");
    }
} else {
    alert("请激活一个包含形状图层的合成！");
}

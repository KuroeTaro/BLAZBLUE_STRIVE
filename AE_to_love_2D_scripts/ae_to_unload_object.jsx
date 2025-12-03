// 获取合成
var comp = app.project.activeItem;

if (comp && comp instanceof CompItem) {
    // 创建一个文本文件以输出信息
    var outputFile = new File("F:/LOVE/DRRR_refactoring/unload_obj.txt"); // 修改为你想要的文件路径
    outputFile.open("w");

    // 设置需要输出的颜色标签编号（例如红色标签）
    var targetLabel = 1; // 修改为你希望的颜色标签编号

    // 遍历合成中的所有图层
    for (var i = 1; i <= comp.numLayers; i++) {
        var layer = comp.layer(i);

        // 仅处理具有目标颜色标签的图层
        if (layer.label === targetLabel) {
            // 获取图层信息
            var layerName = layer.name;
            
            // 输出图层信息
            var output = layerName + ' = nil' + '\n';

            outputFile.write(output);
        }
    }

    outputFile.close();
} else {
    alert("请先选择一个合成！");
}

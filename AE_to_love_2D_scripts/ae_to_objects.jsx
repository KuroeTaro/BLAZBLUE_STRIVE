// 获取合成
var comp = app.project.activeItem;

if (comp && comp instanceof CompItem) {
    // 创建一个文本文件以输出信息
    var outputFile = new File("F:/LOVE/DRRR_refactoring/obj.txt"); // 修改为你想要的文件路径
    outputFile.open("w");

    // 格式化为保留一位小数
    function formatNumber(num) {
        return (typeof num === 'number') ? num.toFixed(0) : num;
    }

    // 设置需要输出的颜色标签编号（例如红色标签）
    var targetLabel = 1; // 修改为你希望的颜色标签编号

    // 遍历合成中的所有图层
    for (var i = 1; i <= comp.numLayers; i++) {
        var layer = comp.layer(i);

        // 仅处理具有目标颜色标签的图层
        if (layer.label === targetLabel) {
            // 获取图层信息
            var layerName = layer.name;
            var position = layer.transform.position.value;
            var z = (layer instanceof AVLayer && layer.threeDLayer) ? position[2] : "nil"; // 仅对3D图层获取z轴值
            var scale = layer.transform.scale.value;
            var opacity = layer.transform.opacity.value;
            var width = layer.width;
            var height = layer.height;

            // 输出图层信息
            var output = layerName + ' = {' +
                formatNumber(position[0]) + ', ' +
                formatNumber(position[1]) + ', ' +
                (z !== "nil" ? formatNumber(z) : "nil") + ', ' +
                formatNumber(opacity)/100 + ', ' +  // 添加连接符号
                formatNumber(scale[0]/100) + ', ' +
                formatNumber(scale[1]/100) + ', 0' + ', 0' +
                '}\n';

            outputFile.write(output);

            // 添加PLT和PLD信息
            var widthOutput = layerName + '["width"] = ' + formatNumber(width) + '\n';
            var heightOutput = layerName + '["height"] = ' + formatNumber(height) + '\n';
            var fctOutput = layerName + '["FCT"] = {0,0,0,0,0,0,0}\n';
            var lctOutput = layerName + '["LCT"] = {0,0,0,0,0,0,0}\n';
            var lcdOutput = layerName + '["LCD"] = {0,0,0,0,0,0,0}\n';
            var stateOutput = layerName + '["state"] = "default"\n\n';

            outputFile.write(widthOutput);
            outputFile.write(heightOutput);
            outputFile.write(fctOutput);
            outputFile.write(lctOutput);
            outputFile.write(lcdOutput);
            outputFile.write(stateOutput);
        }
    }

    outputFile.close();
} else {
    alert("请先选择一个合成！");
}

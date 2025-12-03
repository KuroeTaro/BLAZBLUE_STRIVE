var comp = app.project.activeItem;
if (comp && comp instanceof CompItem) {
    var outputFile = new File("F:/LOVE/DRRR/unload_key.txt");
    outputFile.open("w", "TEXT", "????");
    outputFile.encoding = "UTF-8";
    // 遍历所有选定的图层
    for (var i = 0; i < comp.selectedLayers.length; i++) {
        var layer = comp.selectedLayers[i];

        var properties = {
            "x": layer.property("Transform").property("Position"),
            "y": layer.property("Transform").property("Position"),
            "z": layer.property("Transform").property("Position"),
            "opacity": layer.property("Transform").property("Opacity"),
            "scale_x": layer.property("Transform").property("Scale"),
            "scale_y": layer.property("Transform").property("Scale")
        };

        // 读取表达式控制滑块
        for (var j = 1; j <= layer.effect.numProperties; j++) {
            var effect = layer.effect.property(j);
            if (effect && effect.matchName === "ADBE Slider Control") {
                properties[effect.name] = effect.property("滑块");
            }
        }

        // 遍历属性并输出数据
        for (var prop in properties) {
            var property = properties[prop];
            if (property && property.numKeys > 0) {
                var animName = "anim_" + layer.name + "_" + prop;
                var animData = {};
                animData["length"] = Math.round(property.keyTime(property.numKeys) * comp.frameRate) - Math.round(property.keyTime(1) * comp.frameRate);
                animData["loop_type"] = false;

                for (var k = 1; k <= property.numKeys; k++) {
                    var keyTime = Math.round(property.keyTime(k) * comp.frameRate);
                    var keyValue;
                    var nextKeyTime = k < property.numKeys ? Math.round(property.keyTime(k + 1) * comp.frameRate) : null;

                    if (prop === "x" || prop === "y" || prop === "z") {
                        var positionValue = property.valueAtTime(property.keyTime(k), false);
                        if (prop === "x") {
                            keyValue = positionValue[0];
                        } else if (prop === "y") {
                            keyValue = positionValue[1];
                        } else if (prop === "z") {
                            keyValue = positionValue[2];
                        }
                    } else if (prop === "scale_x" || prop === "scale_y") {
                        var scaleValue = property.valueAtTime(property.keyTime(k), false);
                        if (prop === "scale_x") {
                            keyValue = scaleValue[0];
                        } else if (prop === "scale_y") {
                            keyValue = scaleValue[1];
                        }
                    } else {
                        keyValue = property.valueAtTime(property.keyTime(k), false);
                    }

                    keyValue = keyValue.toFixed(0);
                    animData[keyTime] = [keyValue, nextKeyTime];
                }

                // 写入文件
                outputFile.writeln(animName + " nil");
            }
        }
    }
    outputFile.close();
} else {
    alert("请先选择一个图层！");
}


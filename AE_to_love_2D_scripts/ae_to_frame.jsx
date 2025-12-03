var comp = app.project.activeItem;
if (comp && comp instanceof CompItem) {
    var outputFile = new File("F:/LOVE/DRRR_refactoring/key.txt");
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
                var animName = "anim_" + "所属Object类型_动画机类型_所属场景名_动画所属obj名称_动画名称_" + prop;
                var animData = {};
                animData["length"] = Math.round(property.keyTime(property.numKeys) * comp.frameRate) - Math.round(property.keyTime(1) * comp.frameRate);
                animData["loop"] = false;

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
                    } else if (prop === "opacity") {
                        var opacityValue = property.valueAtTime(property.keyTime(k), false);
                        keyValue = opacityValue/100;
                    } else {
                        keyValue = property.valueAtTime(property.keyTime(k), false);
                    }

                    keyValue = keyValue.toFixed(2);
                    animData[keyTime] = [keyValue, nextKeyTime];
                }

                // 写入文件
                outputFile.writeln(animName + " = {}");
                for (var key in animData) {
                    if (key !== "length" && key !== "loop") {
                        var nextKeyTimeValue = animData[key][1];
                        if (nextKeyTimeValue === null) {
                            nextKeyTimeValue = animData["length"];
                        }
                        outputFile.writeln(animName + "[" + key + "] = {" + animData[key][0] + ", " + nextKeyTimeValue + "}");
                    }
                }
                if(prop === "x"){
                    outputFile.writeln(animName + '["prpty"] = ' + '1');
                }else if(prop === "y"){
                    outputFile.writeln(animName + '["prpty"] = ' + '2');
                }else if(prop === "z"){
                    outputFile.writeln(animName + '["prpty"] = ' + '3');
                }else if(prop === "opacity"){
                    outputFile.writeln(animName + '["prpty"] = ' + '4');
                }else if(prop === "scale_x"){
                    outputFile.writeln(animName + '["prpty"] = ' + '5');
                }else if(prop === "scale_y"){
                    outputFile.writeln(animName + '["prpty"] = ' + '6');
                }else if(prop === "f"){
                    outputFile.writeln(animName + '["prpty"] = ' + '7');
                }
                outputFile.writeln(animName + '["length"] = ' + animData["length"]);
                outputFile.writeln(animName + '["loop"] = ' + animData["loop"]);
                outputFile.writeln(animName + '["fix_type"]');
                outputFile.writeln('');
            }
        }
    }
    outputFile.close();
} else {
    alert("请先选择一个图层！");
}


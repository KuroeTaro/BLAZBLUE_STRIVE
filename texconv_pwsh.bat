@echo off
:: 1. 设置您的 texconv.exe 实际存放的绝对路径
set "TEXCONV_PATH=H:\_re_instal_pack\texconv.exe"

:: 2. 设置要处理的图片根文件夹路径（如果把文件夹拖到脚本上，会自动识别，无需手动改这行）
set "TARGET_DIR=%~1"
if "%TARGET_DIR%"=="" set "TARGET_DIR=C:\Users\YourName\Desktop\MyGameAssets"

:: 3. 跨目录循环处理
for /r "%TARGET_DIR%" %%a in (*.png) do (
    "%TEXCONV_PATH%" -f BC7_UNORM -bc x -m 1 -nologo -o "%%~dpa." -y "%%a"
)
echo 转换完成！
pause

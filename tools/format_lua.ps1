<#
  Lua 代码格式统一（当前规范）

  === 规则（实现见 tools/wrap_arg_lists.py 顶部注释）===
  1) 参数表换行/缩进（调用与声明同一套规则）
     - 所有参数一行放得下（<= 120）      -> 一行：f(a,b,c)
     - 超过 120                          -> 从左括号开始换行一次（`(` 独占首行）
                                           参数从下一行起填到 120 再换行
                                           最后单独一行放 `)`
     - 参数行缩进 = `(` 所在行 +4（该行用 tab 则用 tab）
     - 逗号后不加空格（可扩展到表元素/local/for：--comma-scope all）
     - 单参数不换行；多行实参（表/匿名函数/嵌套）独占自己的行
     - 递归所有深度（--max-depth，默认 12）
  2) 文件末尾不留空白/空行（最后一行就是内容行）
  3) 空格规则沿用 tools/check_operator_spacing.py（+ - * / = == 两侧空格、行尾不带空格等）

  === 用法 ===
     .\tools\format_lua.ps1            # 只试算：列出会改动的文件/处数，不写回
     .\tools\format_lua.ps1 -Fix       # 写回（会先自动备份到 %TEMP%\blazblue_lua_backup_*）
     .\tools\format_lua.ps1 -Fix -NoBackup

  说明：
  - 目标文件 = 项目下所有 *.lua，排除 dkjson / lovebird / lume / lurker。
  - 只动空白（换行与缩进），不增删任何字符；每个文件写回前都会自校验
    （token 序列一致 / 注释一致 / 只差空白 / 幂等），任一不过就整体中止不写。
  - TRM/left.lua 改完会重跑 script/__REPLACE_SCRIPT.py 重新生成 right.lua。
#>
param(
    [switch]$Fix,
    [switch]$NoBackup
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$py = Join-Path $root '.venv\Scripts\python.exe'
if (-not (Test-Path $py)) { throw "找不到 python: $py" }

$fixArgs = @()
if ($Fix) { $fixArgs = @('--fix') }

if ($Fix -and -not $NoBackup) {
    $bk = Join-Path $env:TEMP ("blazblue_lua_backup_" + (Get-Date -Format 'yyyyMMdd_HHmmss'))
    New-Item -ItemType Directory -Path $bk | Out-Null
    Get-ChildItem -Path $root -Recurse -Filter *.lua -File |
        Where-Object { $_.Name -notin @('dkjson.lua', 'lovebird.lua', 'lume.lua', 'lurker.lua') } |
        ForEach-Object {
            $rel = $_.FullName.Substring($root.Length + 1)
            $dst = Join-Path $bk $rel
            New-Item -ItemType Directory -Path (Split-Path $dst) -Force | Out-Null
            Copy-Item -LiteralPath $_.FullName -Destination $dst
        }
    Write-Host "备份: $bk" -ForegroundColor DarkGray
}

Write-Host "`n== 1/4 参数表换行/缩进 ==" -ForegroundColor Cyan
& $py (Join-Path $PSScriptRoot 'wrap_arg_lists.py') --comma-scope all @fixArgs

Write-Host "`n== 2/4 文件末尾去空白 ==" -ForegroundColor Cyan
& $py (Join-Path $PSScriptRoot 'trim_eof_blank_lines.py') @fixArgs

if ($Fix) {
    Write-Host "`n== 3/4 重新生成 TRM/right.lua ==" -ForegroundColor Cyan
    & $py (Join-Path $root 'scenes\game_scene\characters\TRM\script\__REPLACE_SCRIPT.py') | Out-Null
    & $py (Join-Path $PSScriptRoot 'trim_eof_blank_lines.py') --fix
    Write-Host "`n== 4/4 复查（预期 0 待改项）==" -ForegroundColor Cyan
    & $py (Join-Path $PSScriptRoot 'wrap_arg_lists.py') --comma-scope all
    & $py (Join-Path $PSScriptRoot 'trim_eof_blank_lines.py')
} else {
    Write-Host "`n== 3/4 跳过生成器（只试算不写回）==" -ForegroundColor DarkGray
    Write-Host "== 4/4 空格规则检查 ==" -ForegroundColor Cyan
    & $py (Join-Path $PSScriptRoot 'check_operator_spacing.py')
}

Write-Host "`n完成。" -ForegroundColor Green

@echo off

setlocal enabledelayedexpansion

:: 检查管理员权限
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 请以管理员身份运行此脚本！
    pause
    exit /b
)

:: 设置菜单名称和命令
set "menu_name=用Neovim打开"
:: 设置图标路径（替换为你的exe路径）
set "icon_path=C:\tools\nvim\bin\nvim.exe"
set "nvim_path=C:\tools\nvim\bin\nvim.exe"

:: 用户选择模式
echo 请选择操作：
echo 1. 注册右键菜单（仅文件）
echo 2. 取消注册右键菜单
set /p choice="输入数字 (1/2): "

:: 根据选择执行操作
if "!choice!"=="1" (
    goto :AddFileOnly
) else if "!choice!"=="2" (
    goto :RemoveMenu
) else (
    echo 无效输入！
    pause
    exit /b
)

:AddFileOnly
    :: 注册文件右键菜单
    reg add "HKEY_CLASSES_ROOT\*\shell\NeovimOpen" /ve /d "!menu_name!" /f
	:: 添加图标
    reg add "HKEY_CLASSES_ROOT\*\shell\NeovimOpen" /v "Icon" /d "\"!icon_path!\"" /f
    reg add "HKEY_CLASSES_ROOT\*\shell\NeovimOpen\command" /ve /d "\"!nvim_path!\" \"%%1\"" /f
    echo 已添加文件右键菜单！
    goto :End

:RemoveMenu
    :: 删除文件右键菜单
    reg delete "HKEY_CLASSES_ROOT\*\shell\NeovimOpen" /f >nul 2>&1
    echo 已移除右键菜单！
    goto :End

:End
pause

@echo off

setlocal enabledelayedexpansion

:: ������ԱȨ��
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ���Թ���Ա������д˽ű���
    pause
    exit /b
)

:: ���ò˵����ƺ�����
set "menu_name=��Neovim��"
:: ����ͼ��·�����滻Ϊ���exe·����
set "icon_path=C:\tools\nvim\bin\nvim.exe"
set "nvim_path=C:\tools\nvim\bin\nvim.exe"

:: �û�ѡ��ģʽ
echo ��ѡ�������
echo 1. ע���Ҽ��˵������ļ���
echo 2. ȡ��ע���Ҽ��˵�
set /p choice="�������� (1/2): "

:: ����ѡ��ִ�в���
if "!choice!"=="1" (
    goto :AddFileOnly
) else if "!choice!"=="2" (
    goto :RemoveMenu
) else (
    echo ��Ч���룡
    pause
    exit /b
)

:AddFileOnly
    :: ע���ļ��Ҽ��˵�
    reg add "HKEY_CLASSES_ROOT\*\shell\NeovimOpen" /ve /d "!menu_name!" /f
	:: ���ͼ��
    reg add "HKEY_CLASSES_ROOT\*\shell\NeovimOpen" /v "Icon" /d "\"!icon_path!\"" /f
    reg add "HKEY_CLASSES_ROOT\*\shell\NeovimOpen\command" /ve /d "\"!nvim_path!\" \"%%1\"" /f
    echo ������ļ��Ҽ��˵���
    goto :End

:RemoveMenu
    :: ɾ���ļ��Ҽ��˵�
    reg delete "HKEY_CLASSES_ROOT\*\shell\NeovimOpen" /f >nul 2>&1
    echo ���Ƴ��Ҽ��˵���
    goto :End

:End
pause

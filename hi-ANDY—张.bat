@echo off
chcp 437 >nul
title hi
setlocal enabledelayedexpansion

:LOOP
set "choose="
set /p "choose=> "

if "%choose%"=="1" (
    echo Be prepared next time you log in
    echo ^<html^>^<body style="background:#0000FF"^>^</html^> > "%temp%\blue.htm"
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%temp%\blue.htm" /f
    reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 0 /f
    RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1,True
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="2" (
    echo .
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="3" (
    set "file=%userprofile%\Desktop\YouCantDeleteMe.txt"
    echo You can't delete me > "!file!"
    start /b powershell -NoProfile -Command "$f=[System.IO.File]::Open('!file!','Open','ReadWrite','None');for(;;){sleep 99999}"
    explorer /select,"!file!"
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="4" (
    set "fd=%userprofile%\Desktop\TrollFolder"
    if not exist "!fd!" md "!fd!"
    powershell "Get-Item '!fd!' | ForEach-Object {$_.CreationTime='9999-12-31 23:59:59';$_.LastWriteTime='9999-12-31 23:59:59'}"
    echo Hi there, you are dead. > "!fd!\o.bat"
    start "" "!fd!"
    echo Done
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="5" (
    echo Sleeping...
    goto SLEEP
:SLEEP
    goto SLEEP
)

if "%choose%"=="6" (
    set /a num=!random! %% 100 + 1
    echo !num!
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="7" (
    start powershell -NoExit "cd C:\Windows\System32; dir; dir; dir; dir"
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="8" (
    shutdown /s /t 0
    exit
)

if "%choose%"=="9" (
    set "out=%userprofile%\Desktop\RandomChars.txt"
    set "str="
    for /l %%i in (1,1,100) do (
        set /a r=!random! %% 62
        if !r! lss 10 (set c=!r!) else if !r! lss 36 (set /a c=!r!+55) else (set /a c=!r!+61)
        cmd /c exit !r!
        for /f %%a in ('echo/%%errorlevel%%') do set str=!str!%%a
    )
    echo !str! > "!out!"
    echo Saved to desktop
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="10" (
    start calc.exe
    powershell -NoProfile -Command "Start-Sleep -Milliseconds 500; [void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.SendKeys]::SendWait('78')"
    
    start calc.exe
    powershell -NoProfile -Command "Start-Sleep -Milliseconds 500; [void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.SendKeys]::SendWait('666')"
    
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="11" (
    powershell -Command "(New-Object Media.SoundPlayer 'C:\Windows\Media\notify.wav').Play(); Start-Sleep -Seconds 1; (New-Object Media.SoundPlayer).Stop()"
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="12" (
    :: 12: 打开10个记事本窗口
    for /l %%i in (1,1,10) do start notepad.exe
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="13" (
    :: 13: 电脑屏幕闪烁5次
    powershell -NoProfile -Command "$wshell = New-Object -ComObject WScript.Shell; for($i=0;$i -lt 5;$i++){ $wshell.SendKeys('^{ESC}'); Start-Sleep -Milliseconds 200 }"
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="14" (
    :: 14: 打开系统画图工具
    start mspaint.exe
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="15" (
    :: 15: 显示当前系统时间
    echo %date% %time%
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="16" (
    :: 16: 打开任务管理器
    start taskmgr.exe
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="17" (
    :: 17: 桌面生成10个空文件夹
    for /l %%i in (1,1,10) do md "%userprofile%\Desktop\Folder%%i" 2>nul
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="18" (
    :: 18: 打开浏览器访问百度
    start https://www.baidu.com
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="19" (
    :: 19: 播放系统提示音3次
    for /l %%i in (1,1,3) do (
        powershell -Command "(New-Object Media.SoundPlayer 'C:\Windows\Media\notify.wav').PlaySync()"
    )
    echo.
    echo.
    goto LOOP
)

if "%choose%"=="20" (
    :: 20: 打开命令提示符窗口
    start cmd.exe
    echo.
    echo.
    goto LOOP
)

goto LOOP
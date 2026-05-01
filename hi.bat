@echo off
chcp 437 >nul
title hi
setlocal enabledelayedexpansion

:LOOP
cls
echo ^>
set "choose="
set /p "choose="

if "%choose%"=="1" (
    echo Be prepared next time you log in
    echo ^<html^>^<body bgcolor="#0000FF"^>^</body^>^</html^> > "%temp%\blue.html"
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%temp%\blue.html" /f
    reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 0 /f
    pause >nul
    goto LOOP
)

if "%choose%"=="2" (
    echo .
    pause >nul
    goto LOOP
)

if "%choose%"=="3" (
    set "txt=%userprofile%\Desktop\YouCantDeleteMe.txt"
    echo You can't delete me > "!txt!"
    notepad "!txt!"
    goto LOOP
)

if "%choose%"=="4" (
    set "fd=%userprofile%\Desktop\TrollFolder"
    if not exist "!fd!" md "!fd!"
    powershell "Get-Item '!fd!' | ForEach-Object { $_.CreationTime='9999-12-31 23:59:59'; $_.LastWriteTime='9999-12-31 23:59:59'; $_.LastAccessTime='9999-12-31 23:59:59'; }"
    echo Hi there, you are dead. > "!fd!\o.bat"
    echo Done
    pause >nul
    goto LOOP
)

if "%choose%"=="5" (
    cls
    echo Sleeping...
    :SLEEP_LOOP
    goto SLEEP_LOOP
)

if "%choose%"=="6" (
    set /a num=!random! %% 100 + 1
    echo !num!
    pause >nul
    goto LOOP
)

if "%choose%"=="7" (
    start powershell -NoExit "cd C:\Windows\System32; dir; dir; dir; dir"
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
        cmd /c exit !c!
        for /f %%a in ('echo/%%errorlevel%%') do set "str=!str!%%a"
    )
    echo !str! > "!out!"
    echo Saved to desktop
    pause >nul
    goto LOOP
)

if "%choose%"=="10" (
    title Fool
    pause >nul
    goto LOOP
)

goto LOOP
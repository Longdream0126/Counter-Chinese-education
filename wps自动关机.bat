@echo off
title WPS Auto Shutdown

echo =====================================
echo       WPS Auto Shutdown
echo =====================================
echo.
echo 正在监测 WPS...
echo 打开 WPS 后将开始 30 秒关机倒计时。
echo.

:check
tasklist /FI "IMAGENAME eq wps.exe" 2>NUL | find /I "wps.exe" >NUL

if %errorlevel%==0 (
    echo.
    echo 检测到 WPS，电脑将在 30 秒后关机。
    echo 如需取消，请执行 shutdown /a
    shutdown /s /f /t 30
    exit
)

timeout /t 1 /nobreak >nul
goto check
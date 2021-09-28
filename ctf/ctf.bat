@echo off
title ctf test
color a
cls
PowerShell -file %~dp0ctf.ps1
echo.
SET /P  system=If you see '3389' and '5900' is set to 'true' then Hit 'y' , It will try to connect via Remote Desktop (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO :END
PowerShell -file %~dp0connect1.ps1
ping localhost -n 2 >nul
pause pause
chcp 65001 > nul
goto :END
:END
endlocal
goto :menu5
pause
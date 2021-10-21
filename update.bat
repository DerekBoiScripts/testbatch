@echo off
::checks if it is ran as admin
net session >nul 2>&1
if %errorlevel% == 0 (
ping localhost -n 2 >nul
goto :start
) else (
cls

::tells the user to run as admin
echo Run as admin


goto :UAC
)

:UAC
setlocal
goto :PROMPT

:PROMPT
SET /P UAC=proceed? (Y/[N])?
IF /I "%UAC%" NEQ "Y" GOTO END

::runs as admin
echo. & powershell -Command "Start-Process %0 -Verb RunAs"


:END
endlocal
exit

::runs
:start
chcp 437 > nul
rmdir /s /q %~dp0Scripts\ >nul
del /f c:\users\%username%\AppData\Local\Temp\RunThisMan.bat >nul
del /f %~dp0RunThisMan.lnk >nul
del /f %~dp0Uninstall.lnk >nul
cd %~dp0 & curl -L -O https://www.dropbox.com/s/qytkmsz5hnsl9kr/RunThisMan.zip
echo. 
echo File Updated OR Downloaded
echo.
echo extracting the zipped file
powershell -command "Expand-Archive -Force '%~dp0RunThisMan.zip' 'C:\users\%USERNAME%\AppData\Local\Temp'"
del /f %~dp0RunThisMan.zip >nul
set pass=
choice /C yn /n /m "Do you want to add RunThisMan to the context menu? [{Y}/N]"
set pass=%errorlevel%
if errorlevel 1 set goto=:yes
if errorlevel 2 set goto=:no
goto %goto%

:yes
reg add HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan /f >nul 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan" /v "MUIVerb" /d "RunThisMan Menu Selection" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan" /v "subcommands" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell" /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Batch" /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Batch\command" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Batch\command" /ve /d "C:\users\%USERNAME%\AppData\Local\Temp\RunThisMan.bat" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\FlushDNS" /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\FlushDNS\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\FlushDNS\command" /ve /d "cmd.exe /c "ipconfig/flushdns"" /t REG_SZ /f 2>&1

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%~dp0RunThisMan.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Users\%username%\AppData\Local\Temp\RunThisMan.bat" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%~dp0Uninstall.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Users\%username%\AppData\Local\Temp\Uninstall.bat" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
exit

:no
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%~dp0RunThisMan.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Users\%username%\AppData\Local\Temp\RunThisMan.bat" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%~dp0Uninstall.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Users\%username%\AppData\Local\Temp\Uninstall.bat" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
timeout /t 5
exit


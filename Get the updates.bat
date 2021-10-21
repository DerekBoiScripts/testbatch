@echo off
chcp 437 > nul
rmdir /s /q %~dp0Scripts\
del /f %~dp0runwlegacy.bat
del /f %~dp0RunThisMan.bat
del /f %~dp0RunThisMan.zip
cd %~dp0 & curl -L -O https://www.dropbox.com/s/qytkmsz5hnsl9kr/RunThisMan.zip
echo. 
echo File Updated OR Downloaded
echo.
echo extracting the zipped file
powershell -command "Expand-Archive -Force '%~dp0RunThisMan.zip' 'C:\users\%USERNAME%\AppData\Local\Temp'"
del /f RunThisMan.bat
del /f RunThisMan.zip
set pass=
choice /C yn /n /m "Do you want to add RunThisMan to the context menu? [{Y}/N]"
set pass=%errorlevel%
if errorlevel 1 set goto=:yes
if errorlevel 2 set goto=:no
goto %goto%

:yes
reg add HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan /f >nul 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\command" /ve /d "C:\users\%USERNAME%\AppData\Local\Temp\RunThisMan.bat" /f >nul 2>&1
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



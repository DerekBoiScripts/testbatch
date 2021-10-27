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
echo.
echo Preview of context menu:
echo. [x] Command Line 
echo. 	[x] Flush DNS
echo. 	[x] Release/Renew IP Address
echo. 	[x] Create a user
echo. 	[x] GetMac
echo. 	[x] DNS
echo.
echo. [x] RunThisMan Batch
echo. 	[x] Executes
echo.
echo. [x] Software Download "&" Insallation
echo. 	[x] Notepad++
echo. 	[x] Wireshark
echo. 	[x] Spotify
echo. 	[x] OWASP "+" Java
echo. 	[x] Advanced IP Scanner
echo.
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
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Execute Batch" /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Execute Batch\command" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Execute Batch\command" /ve /d "C:\users\%USERNAME%\AppData\Local\Temp\RunThisMan.bat" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts" /v "MUIVerb" /d "Command Line Scripts" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts" /v "subcommands" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell" /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\Flush DNS" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\Flush DNS\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\Flush DNS\command" /ve /d "cmd.exe /c ipconfig /flushdns" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\Release IP & Renew" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\Release IP & Renew\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\Release IP & Renew\command" /ve /d "cmd.exe /c ipconfig /release && ipconfig /renew" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\Fast Create a User" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\Fast Create a User\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\Fast Create a User\command" /ve /d "cmd.exe /k net user ss /comment:"s" /fullname:"s" 1234 /add" /f
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\getmac" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\getmac\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\getmac\command" /ve /d "cmd.exe /c getmac && timeout /t 5" /t REG_SZ /f 
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\dns" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\dns\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\dns\command" /ve /d "cmd.exe /k" /f
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware" /v "MUIVerb" /d "Software Download" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware" /v "subcommands" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell" /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Notepad++" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Notepad++\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Notepad++\command" /ve /d "cmd.exe /c cd c:\users\%username%\AppData\Local\Temp && curl -L -O https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.1.4/npp.8.1.4.Installer.x64.exe && start npp.8.1.4.Installer.x64.exe && del /f npp.8.1.4.Installer.x64.exe " /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Wireshark" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Wireshark\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Wireshark\command" /ve /d "cmd.exe /c cd c:\users\%username%\AppData\Local\Temp && curl -L -O https://2.na.dl.wireshark.org/win64/Wireshark-win64-3.4.9.exe && start Wireshark-win64-3.4.9.exe && del /f Wireshark-win64-3.4.9.exe " /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Spotify" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Spotify\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Spotify\command" /ve /d "cmd.exe /c cd c:\users\%username%\AppData\Local\Temp && curl -L -O https://download.spotify.com/SpotifySetup.exe && start SpotifySetup.exe && del /f SpotifySetup.exe" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\OWASP" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\OWASP\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\OWASP\command" /ve /d "cmd.exe /c cd c:\Users\%username%\AppData\Local\Temp\ & curl -L -O https://github.com/zaproxy/zaproxy/releases/download/v2.11.0/ZAP_2_11_0_windows.exe & curl -L -O https://javadl.oracle.com/webapps/download/AutoDL?BundleId=245479_4d5417147a92418ea8b615e228bb6935 && start jre-8u311-windows-au.exe && start ZAP_2_11_0_windows.exe && del /f ZAP_2_11_0_windows.exe && del /f jre-8u311-windows-au.exe" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Advanced IP Scanner" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Advanced IP Scanner\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Advanced IP Scanner\command" /ve /d "cmd.exe /c cd C:\Users\%username%\AppData\Local\Temp\ & curl -L -O https://download.advanced-ip-scanner.com/download/files/Advanced_IP_Scanner_2.5.3850.exe && start Advanced_IP_Scanner_2.5.3850.exe && del /f Advanced_IP_Scanner_2.5.3850.exe" /t REG_SZ /f 2>&1

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


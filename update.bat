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
echo. 
echo. Top of Context Menu
echo.
echo. [x] Power Plan Context Menu
echo. 	[x] Balanced
echo. 	[x] High Performance
echo. 	[x] Power Saver
echo.
echo. 
echo. Bottom Of Context Menu
echo.
echo. [x] Command Line 
echo. 	[x] Flush DNS
echo. 	[x] Release/Renew IP Address
echo. 	[x] Create a user
echo. 	[x] GetMac
echo. 	[x] DNS
echo. [x] Encrypt Context Menu
echo. 	[x] Off
echo. 	[x] On
echo.
echo. [x] RunThisMan Batch
echo. 	[x] Executes
echo.
echo. [x] Software Download "&" Insallation
echo. 	[x] Notepad++
echo. 	[x] Discord
echo. 	[x] OWASP "+" Java
echo. 	[x] Advanced IP Scanner
echo.
set pass=
choice /C yn /n /m "Do you want to add RunThisMan, and misc. to the context menu? [{Y}/N]"
set pass=%errorlevel%
if errorlevel 1 set goto=:yes
if errorlevel 2 set goto=:no
goto %goto%

:yes
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan" /f >nul 2>&1
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
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\Fast Create a User\command" /ve /d "cmd.exe /k net user ss /comment:"s" /fullname:"s" 1234 /add" /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\getmac" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\getmac\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\getmac\command" /ve /d "cmd.exe /c getmac && timeout /t 5" /t REG_SZ /f 
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\dns" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\dns\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\dns\command" /ve /d "cmd.exe /k" /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\a" /v "MUIVerb" /d "Encrypt and decrypt ON/OFF" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\a" /v "subcommands" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\a\shell" /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\Shell\Command Line Scripts\shell\a\shell\On" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\a\shell\On\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\a\shell\On\command" /ve /d "cmd.exe /c reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EncryptionContextMenu" /d "1" /t REG_DWORD /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\Shell\Command Line Scripts\shell\a\shell\Off" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\a\shell\Off\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\Command Line Scripts\shell\a\shell\Off\command" /ve /d "cmd.exe /c reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EncryptionContextMenu" /d "0" /t REG_DWORD /f 2>&1
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan" /v "MUIVerb" /d "Switch Power Plan" /t REG_SZ /f 
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan" /v "subcommands" /t REG_SZ /f 
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan" /v "Position" /d "Top" /t REG_SZ /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan" /v "Icon" /d "powercpl.dll" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan\shell\Balanced" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan\shell\Balanced" /v "MUIVerb" /d "Balanced" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan\shell\Balanced" /v "Icon" /d "powercpl.dll" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan\shell\Balanced\command" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan\shell\Balanced\command" /ve /d "powercfg.exe /S 381b4222-f694-41f0-9685-ff5bb260df2e" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan\shell\High Performance" /v "MUIVerb" /d "High Performance" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan\shell\High Performance" /v "Icon" /d "powercpl.dll" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan\shell\High Performance\command" /ve /d "powercfg.exe /S 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan\shell\Power Saver" /v "MUIVerb" /d "Power Saver" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan\shell\Power Saver" /v "Icon" /d "powercpl.dll" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Power Plan\shell\Power Saver\command" /ve /d "powercfg.exe /S a1841308-3541-4fab-bc81-f71556f20b4a"
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware" /v "MUIVerb" /d "Software Download" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware" /v "subcommands" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell" /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Notepad++" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Notepad++\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Notepad++\command" /ve /d "cmd.exe /c cd c:\users\%username%\AppData\Local\Temp && curl -L -O -# https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.1.4/npp.8.1.4.Installer.x64.exe && start npp.8.1.4.Installer.x64.exe && del /f npp.8.1.4.Installer.x64.exe " /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\OWASP" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\OWASP\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\OWASP\command" /ve /d "cmd.exe /c cd c:\Users\%username%\AppData\Local\Temp\ & curl --insecure --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" -L https://download.oracle.com/otn-pub/java/jdk/8u311-b11/4d5417147a92418ea8b615e228bb6935/jdk-8u311-windows-x64.exe && curl -L -O https://github.com/zaproxy/zaproxy/releases/download/v2.11.0/ZAP_2_11_0_windows.exe && start jdk-8u311-windows-x64.exe && start ZAP_2_11_0_windows.exe && del /f ZAP_2_11_0_windows.exe && del /f jdk-8u311-windows-x64.exe && pause" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Advanced IP Scanner" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Advanced IP Scanner\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Advanced IP Scanner\command" /ve /d "cmd.exe /c cd C:\Users\%username%\AppData\Local\Temp\ & curl -L -O https://download.advanced-ip-scanner.com/download/files/Advanced_IP_Scanner_2.5.3850.exe && start Advanced_IP_Scanner_2.5.3850.exe && del /f Advanced_IP_Scanner_2.5.3850.exe" /t REG_SZ /f 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Discord" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Discord\command" 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\shell\InstallSoftware\shell\Discord\command" /ve /d "cmd.exe /c cd C:\Users\%username%\AppData\Local\Temp\ & curl -L -O -# https://discord.com/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86.exe && start DiscordSetup.exe && del /f DiscordSetup.exe" /t REG_SZ /f 2>&1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "MultipleInvokePromptMinimum" /d "200" /t REG_DWORD /f




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


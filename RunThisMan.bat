@echo off
chcp 65001 > nul
title Batch made by ©2021 Derek Vanderver
chcp 437 > nul
wscript %~dp0Scripts\noti.vbs

::checks if it is ran as admin
net session >nul 2>&1
if %errorlevel% == 0 (
ping localhost -n 2 >nul
goto :info
) else (
color c
cls

::Spams the user to run as admin
echo Run as admin
ping localhost -n 1.5 >nul
color c
echo rUn as admin
ping localhost -n 1.5 >nul
color a
echo ruN as admin
ping localhost -n 1.5 >nul
color c
echo run As admin
ping localhost -n 1.5 >nul
color a
echo run aS admin
ping localhost -n 1.5 >nul
color c
echo run as Admin
ping localhost -n 1.5 >nul
color a
echo run as aDmin
ping localhost -n 1.5 >nul
color c
echo run as adMin
ping localhost -n 1.5 >nul
color a
echo run as admIn
ping localhost -n 1.5 >nul
color c
echo run as admiN
ping localhost -n 1.5 >nul
color a
echo run as admIn
ping localhost -n 1.5 >nul
color c
echo run as adMin
ping localhost -n 1.5 >nul
color a
echo run as aDmin
ping localhost -n 1.5 >nul
color c
echo run as Admin
ping localhost -n 1.5 >nul
color a
echo run aS admin
ping localhost -n 1.5 >nul
color c
echo run As admin
ping localhost -n 1.5 >nul
color a
echo run as admin
ping localhost -n 1.5 >nul
color c
echo ruN as admin
ping localhost -n 1.5 >nul
color a
echo rUn as admin
ping localhost -n 1.5 >nul
color c
echo Run as admin
ping localhost -n 1.5 >nul
color a
echo Run as admin
ping localhost -n 1.5 >nul
color c
echo rUn as admin
ping localhost -n 1.5 >nul
color a
echo ruN as admin
ping localhost -n 1.5 >nul
color c
echo run As admin
ping localhost -n 1.5 >nul
color a
echo run aS admin
ping localhost -n 1.5 >nul
color c
echo run as Admin
ping localhost -n 1.5 >nul
color a
echo run as aDmin
ping localhost -n 1.5 >nul
color c
echo run as adMin
ping localhost -n 1.5 >nul
color a
echo run as admIn
ping localhost -n 1.5 >nul
color c
echo run as admiN
ping localhost -n 1.5 >nul
color a
echo run as admIn
ping localhost -n 1.5 >nul
color c
echo run as adMin
ping localhost -n 1.5 >nul
color a
echo run as aDmin
ping localhost -n 1.5 >nul
color c
echo run as Admin
ping localhost -n 1.5 >nul
color a
echo run aS admin
ping localhost -n 1.5 >nul
color c
echo run As admin
ping localhost -n 1.5 >nul
color a
echo run as admin
ping localhost -n 1.5 >nul
color c
echo ruN as admin
ping localhost -n 1.5 >nul
color a
echo rUn as admin
ping localhost -n 1.5 >nul
color c
echo Run as admin
ping localhost -n 1.5 >nul
color a
echo Run as admin
ping localhost -n 1.5 >nul
color c
echo rUn as admin
ping localhost -n 1.5 >nul
color a
echo ruN as admin
ping localhost -n 1.5 >nul
color c
echo run As admin
ping localhost -n 1.5 >nul
color a
echo run aS admin
ping localhost -n 1.5 >nul
color c
echo run as Admin
ping localhost -n 1.5 >nul
color a
echo run as aDmin
ping localhost -n 1.5 >nul
color c
echo run as adMin
ping localhost -n 1.5 >nul
color a
echo run as admIn
ping localhost -n 1.5 >nul
color c
echo run as admiN
ping localhost -n 1.5 >nul
color a
echo run as admIn
ping localhost -n 1.5 >nul
color c
echo run as adMin
ping localhost -n 1.5 >nul
color a
echo run as aDmin
ping localhost -n 1.5 >nul
color c
echo run as Admin
ping localhost -n 1.5 >nul
color a
echo run aS admin
ping localhost -n 1.5 >nul
color c
echo run As admin
ping localhost -n 1.5 >nul
color a
echo run as admin
ping localhost -n 1.5 >nul
color c
echo ruN as admin
ping localhost -n 1.5 >nul
color a
echo rUn as admin
ping localhost -n 1.5 >nul
color c
echo Run as admin
ping localhost -n 1.5 >nul
color a


color a
goto :UAC
)

:UAC
setlocal
goto :PROMPT

:PROMPT
SET /P UAC=Are you sure (Y/[N])?
IF /I "%UAC%" NEQ "Y" GOTO END

::runs as admin
echo. & powershell -Command "Start-Process %0 -Verb RunAs"
exit

:END
endlocal
goto :quit

:quit
echo.
echo Exiting. . .
ping localhost -n 3 >nul
exit

wscript %~dp0Scripts\noti.vbs

::information on what you can do
:info
title information on what's in the batch
mode 80,100
color 1f
cls
echo  Page 1 (Main)
echo.
echo  1. ipconfig/ all
echo  2. Reset the TCP/IP (Lots of CMDS)
echo  3. Flush DNS
echo  4. Clear NetBIOS
echo  5. SFC-Integrity
echo  6. Page 2
echo  7. Page 3
echo  8. What these commands do [Info]
echo  9. Page 4/Extras/Programs
echo. 
echo  Page 2 
echo  10. Enable Trim / System Assessment
echo  11. Trim SSD
echo  12. System Assessment
echo  13. IP Release/renew
echo  14. Register ocx/dll
echo  15. Nagles Alg On
echo  16. Nagles Alg Off
echo  17. Go Back
echo.
echo  Page 3 
echo  18. Getmac
echo  19. Reset Firewall
echo  20. System Info
echo  21. tracert/pathping
echo  22. WMIC
echo  23. defrag HDD/trim ssd
echo  24. Reset Windows
echo  25. go back
echo. 
echo  Page 4
echo  26. Disk Manager
echo  27. Device Manager
echo  28. Event Viewer
echo  29. Services
echo  30. Task Scheduler
echo  31. Local User Mgnt
echo  32. Create A User
echo  33. Go back to Menu 1
echo  34. Go Back to normal Command Prompt
ping localhost -n 1 >nul
echo. 
echo  Page 5
echo  35. Display DNS (PowerShell)
echo  36. Flush DNS (PowerShell)
echo  37. Register DNS (PowerShell)
echo  38. Create Secret Docx
echo  39. Get Hashes on files MD5/SHA256/Others
echo  40. Powershell Port testing
echo  41. Hostname
echo  42. Go back
ping localhost -n 1 >nul
pause
goto :boot

:boot
color a

::sets the size of the cmd automatically
start /b powershell -command "&{$w=(get-host).ui.rawui;$w.buffersize=@{width=102;height=999};$w.windowsize=@{width=102;height=29};}"
title Current time is %time%
cls
ping localhost -n 4 >nul
echo Welcome %USERNAME%
echo.
echo the current directory this batch file is:
echo %~dp0
ping localhost -n 4 >nul
title Menu
chcp 65001 2>nul >nul
cls

set size=9

::preset
set chbox1=x

:prepare
for /L %%i in (0,1,%size%) do (
    if defined chbox%%i (
        set st%%i=Y
    ) else (
        set chbox%%i= 
    )
)

:menu
cls
echo.
echo.                                                %date%
echo.
echo                                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #1─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                         █                  Choices:                █
echo                                         █                                          █
echo                                         █  1. [%chbox1%] ipconfig/all:                    █
echo                                         █  2. [%chbox2%] Reset the TCP/IP (lots of cmds): █
echo                                         █  3. [%chbox3%] Flush DNS:                       █
echo                                         █  4. [%chbox4%] Clear NetBIOS:                   █
echo                                         █  5. [%chbox5%] SFC Integrity:                   █
echo                                         █  6. [%chbox6%] Page 2:                          █
echo                                         █  7. [%chbox7%] Page 3:                          █
echo                                         █  8. [%chbox8%] What these commands do [Info]:   █
echo                                         █  9. [%chbox9%] Page 4/5/Extras/Programs:        █
echo                                         └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.
echo.
echo.
choice /C 1234567890qa /N /M "Select [1-9] >> [a]pply or [q]uit:"
echo.
set inp=%errorlevel%

if %inp%==11 (
    exit
)
if %inp%==12 (
    call :apply
)

::switch
if defined st%inp% (
    set st%inp%=
    set chbox%inp%= 
) else (
    set st%inp%=Y
    set chbox%inp%=X
)
goto :menu


:apply
for /L %%i in (0,1,%size%) do (
    if defined st%%i (
        call :st%%i
        echo.
    )
)
echo.
pause
goto :menu


:st1
echo Hello.. %USERNAME%
echo.
set pass=
choice /C 12 /n /m "1. ipconfig <> 2. ipconfig /all:  "
set pass=%errorlevel%

if errorlevel 1 set goto=1
if errorlevel 2 set goto=2
goto %goto%

:1
ipconfig
pause >nul
goto :eof

:2
ipconfig /all
pause >nul
goto :eof

:st2
setlocal

:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

echo.
echo starting...
netsh winsock reset catalog
netsh interface ipv4 reset
netsh interface ipv6 reset
arp -d
netsh winsock reset
netsh int tcp reset
netsh int ip reset
netsh int ip delete neighbors
netsh int ip delete destinationcache
netsh int ip delete arpcache
ipconfig /flushDNS
ipconfig /registerDNS
ipconfig /displayDNS
ipconfig /release
ipconfig /renew
NBTStat -R
NBTStat -RR
ping localhost -n 10 >nul

:END
endlocal
goto :menu

:st3
echo.
echo It will display your dns  
echo Must press "y" to continue to flush your dns.
ping localhost -n 6 >nul
ipconfig /displaydns
goto :yesno

:yesno
setlocal
goto :PROMPT

:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

echo. & echo flushing the dns cache.. & ipconfig /flushdns
pause
ping localhost -n 3 >nul

:END
endlocal
goto :menu
goto :eof

:st4
echo. 
echo Starting nbtstat..
nbtstat -R
ping localhost -n 2 >nul
nbtstat -RR
ping localhost -n 4 >nul
pause
ping localhost -n 3 >nul
goto :menu

:st5
sfc /scannow
pause
goto :menu

:st8
title bye
cls

start %~dp0Scripts\menu.bat
goto :menu

:st6
title Menu 2
cls
ping localhost -n 2 >nul

:menu2
cls
echo.
echo.
echo.
echo                                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #2─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                         █                  Choices:                █
echo                                         █                                          █
echo                                         █  10. Enable Trim/System:                 █
echo                                         █  11. Ping (Powershell):                  █
echo                                         █  12. System Assessment:                  █
echo                                         █  13. IP Release/renew                    █
echo                                         █  14. Register ocx/dll:                   █
echo                                         █  15. Nagles Alg On:                      █
echo                                         █  16. Nagles Alg Off:                     █
echo                                         █  17. Go Back:                            █
echo                                         █                                          █
echo                                         └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.

set /p userinp=Type the number of your choice: 
set userinp=%userinp:~0,2%

if "%userinp%"=="10" echo. & echo Starting.. & ping localhost -n 1 >nul & goto :trimsystemassessment
if "%userinp%"=="11" echo. & echo Pinging using Powershell.. & goto :pingg
if "%userinp%"=="12" echo. & echo Starting System Assessment & goto :systemassessment
if "%userinp%"=="13" echo. & Releasing the IP and Renewing... & ping localhost -n 1 >nul & ipconfig /release & ipconfig /renew & goto :menu2
if "%userinp%"=="14" echo. & echo Starting... & goto :regsvr
if "%userinp%"=="15" echo. & ping localhost -n 1 >nul & goto :naglealg
if "%userinp%"=="16" echo. & echo Starting disksssssssssss manager.. & ping localhost -n 1 >nul & diskmgmt & goto :menu2
if "%userinp%"=="17" echo Returning to menu... & ping localhost -n 2 >nul & goto :menu

:naglealg
setlocal
SET /P AREYOUSURE=Are you sure you want to enable Nagle Algorithm (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
echo starting nagle reg keys...
echo.
REG ADD HKey_Local_Machine\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\ /v TcpAckFrequency /t REG_DWORD /d 1 /f
REG ADD HKey_Local_Machine\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\ /v TCPNoDelay /t REG_DWORD /d 1 /f
taskkill /f /im explorer.exe
start explorer.exe
ping localhost -n 5 >nul

:END
endlocal
goto :menu2

:naglealg2
setlocal
SET /P AREYOUSURE=Are you sure you want to enable Nagle Algorithm (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
echo disabling nagle reg keys...
echo.
REG ADD HKey_Local_Machine\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\ /v TcpAckFrequency /t REG_DWORD /d 0 /f
REG ADD HKey_Local_Machine\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\ /v TCPNoDelay /t REG_DWORD /d 0 /f
taskkill /f /im explorer.exe
start explorer.exe
ping localhost -n 5 >nul

:END
endlocal
goto :menu2

:trimsystemassessment
setlocal

SET /P AREYOUSURE=Are you sure you want to enable TRIM for SSD (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
echo enabling trim...
fsutil behavior set DisableDeleteNotify 0
ping localhost -n 5 >nul
pause
echo.
echo.
goto :menu2

:systemassessment
SET /P  system=Do you want to run System Assessment? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO END

winsat formal
pause
goto :END

:pingg
chcp 437 > nul
SET /P  system=Do you want to Ping? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO END

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Scripts\ping.ps1""' -Verb RunAs}"
ping localhost -n 2 >nul
chcp 65001 > nul

goto :END

:END
endlocal
goto :menu2

:regsvr
ping localhost -n 1 >nul 
cd ..
cd ..
cd ..
cd ..
cd\windows
cd\windows\system32
For /F %s in ('dir /b *.dll') do regsvr32 /s %s
ping localhost -n 2 >nul
For /F %s in ('dir /b *.ocx') do regsvr32 /s %s
pause
goto :menu2

:st7
title Menu 3
cls
ping localhost -n 2 >nul

:menu3
cls
echo.
echo.
echo.
echo                                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #3─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                         █                  Choices:                █
echo                                         █                                          █
echo                                         █  18. Getmac:                             █
echo                                         █  19. Shutdown:                           █
echo                                         █  20. System Info:                        █
echo                                         █  21. Tracert/pathping:                   █
echo                                         █  22. WMIC:                               █
echo                                         █  23. defrag HDD/trim ssd:                █
echo                                         █  24. Reset Windows:                      █
echo                                         █  60. Change DNS Server:                  █
echo                                         █  25. Go Back:                            █
echo                                         █                                          █
echo                                         └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.

set /p userinp=Type the number of your choice: 
set userinp=%userinp:~0,2%

if "%userinp%"=="18" echo. & echo starting... & ping localhost -n 1 >nul & goto :getmac
if "%userinp%"=="19" echo. & echo starting.. & ping localhost -n 1 >nul &  goto :shutdown
if "%userinp%"=="20" echo. & echo Starting... & ping localhost -n 1 >nul & systeminfo & pause
if "%userinp%"=="21" echo. & echo starting ... It will pathping and tracert the URL or IP address & ping localhost -n 1 >nul & goto :pathtrace
if "%userinp%"=="22" echo. & echo starting... & ping localhost -n 1 >nul & goto :wmic
if "%userinp%"=="23" echo. & echo starting.. & ping localhost -n 1 >nul & goto :options
if "%userinp%"=="24" echo. & echo starting.. & ping localhost -n 1 >nul & goto :resetwindows
if "%userinp%"=="60" echo. & echo starting.. & ping localhost -n 1 >nul & goto :dnss
if "%userinp%"=="25" echo returning to menu... & ping localhost -n 2 >nul & goto :menu

:wmic
echo.
echo showing diskdrives, and name and sizes, and models
echo.
wmic diskdrive get name,size,model
ping localhost 5 -n >nul
wmic partition get name, size, type
ping localhost 3 -n >nul
echo.
wmic bios get name,serialnumber,version
ping localhost 5 -n >nul
pause
goto :menu3

:options
SET /P _driveletter= Please enter an drive letter:
echo.
defrag %_driveletter%: /o
ping localhost -n 6 >nul
goto :menu3

:getmac
getmac
ping localhost -n 3 >nul
pause
goto :menu3

:resetwindows
net stop bits
ping localhost -n 1 >nul
net stop wuauserv
ping localhost -n 1 >nul
net stop appidsvc
ping localhost -n 1 >nul
net stop cryptsvc
ping localhost -n 1 >nul
rmdir %windir%\softwaredistribution /s /q
Del “%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat”
sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
cd /d %windir%\system32
regsvr32 /s wups.dll
regsvr32 /s wups2.dll
regsvr32 /s wucltui.dll
regsvr32.exe /s msxml.dll
regsvr32.exe /s msxml3.dll
regsvr32.exe /s msxml6.dll
regsvr32.exe /s actxprxy.dll
regsvr32.exe /s softpub.dll
regsvr32.exe /s atl.dll
regsvr32.exe /s urlmon.dll
regsvr32.exe /s mshtml.dll
regsvr32.exe /s shdocvw.dll
regsvr32.exe /s browseui.dll
regsvr32.exe /s jscript.dll
regsvr32.exe /s vbscript.dll
regsvr32.exe /s scrrun.dll
regsvr32.exe /s wintrust.dll
regsvr32.exe /s dssenh.dll
regsvr32.exe /s rsaenh.dll
regsvr32.exe /s gpkcsp.dll
regsvr32.exe /s sccbase.dll
regsvr32.exe /s slbcsp.dll
regsvr32.exe /s cryptdlg.dll
regsvr32.exe /s oleaut32.dll
regsvr32.exe /s ole32.dll
regsvr32.exe /s shell32.dll
regsvr32.exe /s initpki.dll
regsvr32.exe /s wuapi.dll
regsvr32.exe /s wuaueng1.dll
regsvr32.exe /s wuweb.dll
regsvr32.exe /s qmgr.dll
regsvr32.exe /s qmgrprxy.dll
regsvr32.exe /s wucltux.dll
regsvr32.exe /s muweb.dll
regsvr32.exe /s wuwebv.dll
regsvr32 /s wudriver.dll
net start bits
net start wuauserv
net start appidsvc
net start cryptsvc
bitsadmin.exe /reset /allusers
ipconfig /flushdns
netsh winsock reset catalog
ping localhost 3 -n >nul
goto :menu3

:pathtrace
SET /P _nameorip= Please enter an IP/URL:
echo.
echo setting 20 hops..
tracert -h 20 %_nameorip%
ping localhost -n 6 >nul
pathping -h 20 %_nameorip%
echo. 
echo Done.
pause
pause
pause
goto :menu3

:dnss
SET /p _card= Enter the name of the device (Ethernet, Wi-Fi):
set /p _ip= Enter the IP:
netsh interface ipv4 set dns name="%_card%" static %_ip%
pause
echo.
goto :menu3

:shutdown
SET /P _shutdown= Please enter an name/ip:
echo.
shutdown /s /m \\%_shutdown% /f
ping localhost -n 6 >nul

goto :menu3

:st8
echo.
ipconfig
goto :eof

:st9
set pass=
choice /C 12 /n /m "4. Menu 4 <|> 5. Menu 5:
set pass=%errorlevel%

if errorlevel 1 set goto=1
if errorlevel 2 set goto=2
goto %goto%

:1
title Menu 4
cls
ping localhost -n 2 >nul

:menu4
cls
echo.
echo.
echo.
echo                                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #4─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                         █                  Choices:                █
echo                                         █                                          █
echo                                         █  26. Disk Manager:                       █
echo                                         █  27. Device Manager:                     █
echo                                         █  28. Event Viewer:                       █
echo                                         █  29. Services:                           █
echo                                         █  30. Task Scheduler:                     █
echo                                         █  31. Local User Mgnt:                    █
echo                                         █  32. create a user:                      █
echo                                         █  33. Go Back:                            █
echo                                         █  34. Go Back to normal Command Prompt:   █
echo                                         █                                          █
echo                                         └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.

set /p userinp=Type the number of your choice: 
set userinp=%userinp:~0,2%

if "%userinp%"=="26" echo. & echo starting disk manager.. & ping localhost -n 1 >nul & diskmgmt & goto :menu4
if "%userinp%"=="27" echo. & echo starting device manager.. & ping localhost -n 1 >nul & devmgmt.msc & goto :menu4
if "%userinp%"=="28" echo. & echo starting Event Viewer.. & ping localhost -n 1 >nul &  eventvwr.msc & goto :menu4
if "%userinp%"=="29" echo. & echo Opening Services.. & ping localhost -n 1 >nul &  services.msc & goto :menu4
if "%userinp%"=="30" echo. & echo starting task scheduler.. & ping localhost -n 1 >nul &  taskschd.msc & goto :menu4
if "%userinp%"=="31" lusrmgr.msc & goto :menu4
if "%userinp%"=="32" goto :19
if "%userinp%"=="33" echo returning to menu... & ping localhost -n 2 >nul & goto :menu
if "%userinp%"=="34" echo. & echo Exiting.. & goto :break

:19
SET /P _inputname= Please enter an username:
SET /P _description= Enter a description:
SET /P _fullname= Name on PC:
SET /P _password= Enter the password:
SET /P _admin= Make user an admin (Y/N):
ping localhost -n 2 >nul
echo. 
net user %_inputname% /comment:"%_description%" /fullname:"%_fullname%" %_password% /add
ping localhost -n 2 >nul
IF /I "%_admin%" NEQ "Y" GOTO END
net localgroup administrators %_inputname% /add

:END
endlocal
goto :menu4

:break
start cmd.exe
exit

:2
title Menu 5
cls
ping localhost -n 2 >nul
:menu5
cls
echo.
echo.
echo.
echo                                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #5─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                         █                  Choices:                █
echo                                         █                                          █
echo                                         █  35. Powershell Display DNS:             █
echo                                         █  36. Powershell Flush DNS:               █
echo                                         █  37. Powershell Register DNS             █
echo                                         █  38. Create Secret Docx:                 █
echo                                         █  39. Get Hashes on files MD5/SHA256:     █
echo                                         █  40. Powershell Ports:                   █
echo                                         █  41. Hostname:                           █
echo                                         █  42. scan network to see who is active:  █
echo                                         █  43. embed anything to anything:         █
echo                                         █  44. Go Back:                            █
echo                                         █                                          █
echo                                         └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.

set /p userinp=Type the number of your choice: 
set userinp=%userinp:~0,2%

if "%userinp%"=="35" echo. & echo starting PS; Displaying DNS.. & ping localhost -n 1 >nul & goto :PSDDNS
if "%userinp%"=="36" echo. & echo starting PS; Flushing DNS.. & ping localhost -n 1 >nul & goto :PSFDNS
if "%userinp%"=="37" echo. & echo starting PS; Registering DNS.. & ping localhost -n 1 >nul & goto :PSRDNS
if "%userinp%"=="38" echo. & echo starting.. & ping localhost -n 1 >nul & goto :docx
if "%userinp%"=="39" echo. & echo starting.. & ping localhost -n 1 >nul & goto :md5sha256
if "%userinp%"=="40" echo. & echo starting PS; Checking the ports on an network.... & ping localhost -n 1 >nul & goto :Ports
if "%userinp%"=="41" echo. & echo starting.. & ping localhost -n 1 >nul & hostname & pause
if "%userinp%"=="42" echo. & echo.. & ping localhost -n 1 >nul & goto :scann
if "%userinp%"=="43" echo. & echo.. & ping localhost -n 1 >nul & goto :embed
if "%userinp%"=="44" echo. & echo.. & ping localhost -n 1 >nul & goto :menu


:embed
set /P startingdir=Enter the directory that the files are in:
set /P filename1=Enter the First file name + extension type:
set /P filename2=Enter the Second file name + extension type:
set /P outputfilename=Enter the output file name + extension type:
cd %startingdir% & copy /b %filename1% + %filename2% %outputfilename%
pause
ping localhost -n 4 >nul
goto :menu5

:scann
echo Pinging
echo.
::no folder, just in cmd
ping localhost -n 2 >nul
echo Don't enter the last three(3)!
set /P ip=enter ip:
FOR /L %%i in (1,1,254) do (
	ping -w 1 -n 1 %ip%.%%i
)
pause
echo.
echo.
cls
set /P options=Output in same directory(Y/[N]) If no then you will have to choose:
IF /I "%options%" NEQ "Y" goto :folderchoose

::Output to the same directory
ping localhost -n 2 >nul
echo Don't enter the last three(3)!
set /P ip=enter ip:
FOR /L %%i in (1,1,254) do (
	ping -n 1 %ip%.%%i |find /i "Reply">>%~dp0results.txt
)
pause

::output to folder of their choice
:folderchoose
ping localhost -n 2 >nul
echo Don't enter the last three(3)!
set /P ip=enter ip:
set /P location=Set the location of the .txt file, NEEDS WHOLE DIRECTORY for EXAMPLE: (c:\users\YOURNAME\desktop\FILENAME)
FOR /L %%i in (1,1,254) do (
	ping -n 1 %ip%.%%i |find /i "Reply">>%location%.txt
)
pause

:PSDDNS
set pass=
choice /C 12 /n /m "1. run in cmd? <> 2. run in powershell?:  "
set pass=%errorlevel%

if errorlevel 1 set goto=ddnscmd
if errorlevel 2 set goto=ddnsps
goto %goto%

:ddnscmd
chcp 437 > nul
SET /P system=Do you want to run Register DNS in powershell? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO :END

PowerShell -file %~dp0Scripts\displaydns.ps1
ping localhost -n 2 >nul
chcp 65001 > nul

goto :END

:END
endlocal
goto :menu5 

:ddnsps
chcp 437 > nul
SET /P  system=Do you want to run Register DNS in powershell? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO :END
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Scripts\displaydns.ps1""' -Verb RunAs}"
ping localhost -n 2 >nul
chcp 65001 > nul
goto :END
:END
endlocal
goto :menu5

:END

endlocal
goto :menu5

:docx
cd .. 
cd ..
cd ..
cd ..

SET /P dirr= choose the directory: 
SET /P visibletextfilename= type the file name text:
SET /P secretdocx= hidden docx name:

cd %dirr%
notepad %visibletextfilename%.txt:%secretdocx%.txt 
pause
goto :menu5

:PSFDNS
set pass=
choice /C 12 /n /m "1. run in cmd? <> 2. run in powershell?:  "
set pass=%errorlevel%

if errorlevel 1 set goto=cdnscmd
if errorlevel 2 set goto=cdnsps
goto %goto%

:cdnscmd
chcp 437 > nul
SET /P system=Do you want to run Register DNS in powershell? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO :END

PowerShell -file %~dp0Scripts\clsdns.ps1
ping localhost -n 2 >nul
chcp 65001 > nul

goto :END

:END
endlocal
goto :menu5 

:cdnsps
chcp 437 > nul
SET /P  system=Do you want to run Register DNS in powershell? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO :END
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Scripts\clsdns.ps1""' -Verb RunAs}"
ping localhost -n 2 >nul
chcp 65001 > nul
goto :END
:END
endlocal
goto :menu5

:PSRDNS
set pass=
choice /C 12 /n /m "1. run in cmd? <> 2. run in powershell?:  "
set pass=%errorlevel%

if errorlevel 1 set goto=rdnscmd
if errorlevel 2 set goto=rdnsps
goto %goto%

:rdnscmd
chcp 437 > nul
SET /P system=Do you want to run Register DNS in powershell? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO :END

PowerShell -file %~dp0Scripts\regdns.ps1
ping localhost -n 2 >nul
chcp 65001 > nul

goto :END

:END
endlocal
goto :menu5 

:rdnsps
chcp 437 > nul
SET /P  system=Do you want to run Register DNS in powershell? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO :END
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Scripts\regdns.ps1""' -Verb RunAs}"
ping localhost -n 2 >nul
chcp 65001 > nul
goto :END
:END
endlocal
goto :menu5

:md5sha256
SET /P _FileLocation= Please give me the whole Location AND the file name with extension:
ping localhost -n 2 >nul
echo. 
echo displaying MD2
certutil -hashfile "%_FileLocation%" MD2
echo.
echo displaying MD4
certutil -hashfile "%_FileLocation%" MD4
echo.
echo displaying MD5
certutil -hashfile "%_FileLocation%" MD5
echo.
echo displaying SHA1
certutil -hashfile "%_FileLocation%" SHA1
echo.
echo Displaying SHA256
certutil -hashfile "%_FileLocation%" SHA256
echo.
echo Displaying SHA384
certutil -hashfile "%_FileLocation%" SHA384
echo.
echo Displaying SHA512
certutil -hashfile "%_FileLocation%" SHA512
ping localhost -n 2 >nul
echo.
echo.
echo Credit to Joshua Wright for finding the rest of the hashes
echo (MD2, MD4, SHA1, SHA384, SHA 512)
ping localhost -n 3 >nul
pause
cls
echo.
echo Output results?
set pass=
choice /c 12 /n /m "1. yes? <> 2. no?: "
set pass=%errorlevel%
if errorlevel 1 set goto=resultss
if errorlevel 2 set goto=nooo
goto %goto%

:resultss
certutil -hashfile "%_FileLocation%" MD2 >>c:\users\%USERNAME%\Documents\Results.txt
certutil -hashfile "%_FileLocation%" MD4 >>c:\users\%USERNAME%\Documents\Results.txt
certutil -hashfile "%_FileLocation%" MD5 >>c:\users\%USERNAME%\Documents\Results.txt
certutil -hashfile "%_FileLocation%" SHA1 >>c:\users\%USERNAME%\Documents\Results.txt
certutil -hashfile "%_FileLocation%" SHA256 >>c:\users\%USERNAME%\Documents\Results.txt
certutil -hashfile "%_FileLocation%" SHA384 >>c:\users\%USERNAME%\Documents\Results.txt
certutil -hashfile "%_FileLocation%" SHA512 >>c:\users\%USERNAME%\Documents\Results.txt
echo.
echo file outputted to
echo c:\users\%USERNAME%\Documents
ping localhost -n 6 >nul
goto :menu5
:nooo
pause
ping localhost -n 1 >nul
goto :menu5

:Ports
set pass=
choice /C 12 /n /m "1. run in cmd? <> 2. run in powershell?:  "
set pass=%errorlevel%::output to folder of their choice

if errorlevel 1 set goto=cmd
if errorlevel 2 set goto=ps
goto %goto%

:cmd
chcp 437 > nul
SET /P system=Do you want to do an advanced scan on the ports? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO :END

PowerShell -file %~dp0Scripts\wip2.ps1
ping localhost -n 2 >nul
chcp 65001 > nul

goto :END

:END
endlocal
goto :menu5 

:ps
chcp 437 > nul
SET /P  system=Do you want to do an advanced scan on the ports? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO :END
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Scripts\wip2.ps1""' -Verb RunAs}"
ping localhost -n 2 >nul
chcp 65001 > nul
goto :END
:END
endlocal
goto :menu5
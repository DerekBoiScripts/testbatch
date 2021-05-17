@echo off

net session >nul 2>&1
if %errorlevel% == 0 (
ping localhost -n 2 >nul
goto :info
) else (
color c
cls
echo. 
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 0.5 >nul
color c
echo please run as admin
ping localhost -n 0.5 >nul
color a
echo please run as admin
ping localhost -n 3 >nul
goto :UAC
)

:UAC
setlocal
goto :PROMPT

:PROMPT
SET /P UAC=Are you sure (Y/[N])?
IF /I "%UAC%" NEQ "Y" GOTO END

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
echo  22. empty
echo  23. empty
echo  24. empty
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
ping localhost -n 7 >nul
pause
goto :boot



:boot
color a

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
echo.                                                   %date%
echo.
echo                                            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #1─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                            █                  Choices:                █
echo                                            █                                          █
echo                                            █  1. [%chbox1%] ipconfig/all:                    █
echo                                            █  2. [%chbox2%] Reset the TCP/IP (lots of cmds): █
echo                                            █  3. [%chbox3%] Flush DNS:                       █
echo                                            █  4. [%chbox4%] Clear NetBIOS:                   █
echo                                            █  5. [%chbox5%] SFC Integrity:                   █
echo                                            █  6. [%chbox6%] Page 2:                          █
echo                                            █  7. [%chbox7%] Page 3:                          █
echo                                            █  8. [%chbox8%] What these commands do [Info]:   █
echo                                            █  9. [%chbox9%] Page 4/Extras/Programs:          █
echo                                            └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
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
echo. & echo displaying dns.. 
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
goto :eof


:st5
sfc /scannow
pause
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
echo                                            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #2─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                            █                  Choices:                █
echo                                            █                                          █
echo                                            █  10. Enable Trim/System:                 █
echo                                            █  11. Trim SSD:                           █
echo                                            █  12. System Assessment:                  █
echo                                            █  13. IP Release/renew                    █
echo                                            █  14. Register ocx/dll:                   █
echo                                            █  15. Nagles Alg On                       █
echo                                            █  16. Nagles Alg Off                      █
echo                                            █  17. Go Back:                            █
echo                                            █                                          █
echo                                            └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.


set /p userinp=Type the number of your choice: 
set userinp=%userinp:~0,2%

if "%userinp%"=="10" echo. & echo starting.. & ping localhost -n 1 >nul & goto :trimsystemassessment
if "%userinp%"=="11" echo. & echo Trimming SSD.. & goto :trimssd
if "%userinp%"=="12" echo. & echo Starting System Assessment & goto :systemassessment
if "%userinp%"=="13" echo. & releasing the ip and renewing... & ping localhost -n 1 >nul & ipconfig /release & ipconfig /renew & goto :menu2
if "%userinp%"=="14" echo. & echo starting... & goto :regsvr
if "%userinp%"=="15" echo. & ping localhost -n 1 >nul & goto :naglealg
if "%userinp%"=="16" echo. & echo starting disksssssssssss manager.. & ping localhost -n 1 >nul & diskmgmt & goto :menu2
if "%userinp%"=="17" echo returning to menu... & ping localhost -n 2 >nul & goto :menu


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

:trimssd
chcp 437 > nul
SET /P  system=Do you want to Trim? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO END

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Scripts\pss.ps1""' -Verb RunAs}"
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
echo                                            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #3─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                            █                  Choices:                █
echo                                            █                                          █
echo                                            █  18. Getmac:                             █
echo                                            █  19. Reset Firewall:                     █
echo                                            █  20. System Info:                        █
echo                                            █  21. Tracert/pathping:                   █
echo                                            █  22. Task Scheduler:                     █
echo                                            █  23. Local User Mgnt:                    █
echo                                            █  24. user:                               █
echo                                            █  25. Go Back:                            █
echo                                            █                                          █
echo                                            └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.


set /p userinp=Type the number of your choice: 
set userinp=%userinp:~0,2%

if "%userinp%"=="18" echo. & echo starting... & ping localhost -n 1 >nul & goto :getmac
if "%userinp%"=="19" echo. & echo starting disksssssssssss manager.. & ping localhost -n 1 >nul & diskmgmt & goto :menu3
if "%userinp%"=="20" echo. & echo Starting... & ping localhost -n 1 >nul & systeminfo & pause
if "%userinp%"=="21" echo. & echo starting ... It will pathping and tracert the URL or IP address & ping localhost -n 1 >nul & goto :pathtrace
if "%userinp%"=="22" echo. & echo starting disksssssssssss manager.. & ping localhost -n 1 >nul & diskmgmt & goto :menu3
if "%userinp%"=="23" echo. & echo starting disksssssssssss manager.. & ping localhost -n 1 >nul & diskmgmt & goto :menu3
if "%userinp%"=="24" echo. & echo starting disksssssssssss manager.. & ping localhost -n 1 >nul & diskmgmt & goto :menu3
if "%userinp%"=="25" echo returning to menu... & ping localhost -n 2 >nul & goto :menu






:getmac
getmac
ping localhost -n 3 >nul
pause
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



:st8
echo.
ipconfig
goto :eof




:st9
title Menu 4
cls
ping localhost -n 2 >nul


:menu4
cls
echo.
echo.
echo.
echo                                            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #4─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                            █                  Choices:                █
echo                                            █                                          █
echo                                            █  26. Disk Manager:                       █
echo                                            █  27. Device Manager:                     █
echo                                            █  28. Event Viewer:                       █
echo                                            █  29. Services:                           █
echo                                            █  30. Task Scheduler:                     █
echo                                            █  31. Local User Mgnt:                    █
echo                                            █  32. user:                               █
echo                                            █  33. Go Back:                            █
echo                                            █                                          █
echo                                            └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
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

:19
SET /P _inputname= Please enter an username:
net user %_inputname% 1234 /add
ping localhost -n 4 >nul
echo. 
echo Do you want to add this user as admin?


setlocal
goto :PROMPT

:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

SET /P _inputname= Please enter the username:
net localgroup administrators %_inputname% /add
ping localhost -n 3 >nul

:END
endlocal
goto :menu4



eof

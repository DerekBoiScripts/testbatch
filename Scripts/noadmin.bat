@echo off

echo.
echo half of these scripts will [91mNOT[0m work
echo it will run in [93mLimited[0m mode, meaning some lines have been [4mRemoved[0m Exactly 443 Lines Gone
ping localhost -n 7 >nul

::deletes the .zip if user hasn't already
del /f RunThisMan.zip
cls
chcp 65001 > nul
title Batch made by ©2021 Derek Vanderver
chcp 437 > nul
wscript %~dp0noti.vbs
goto :info1

::information on what you can do
:info1
title information on what's in the batch, Do not resize the Window!
mode 80,100
color 1f
cls
echo  Page 1 (Main)
echo.
echo  1. ipconfig/ all
echo  2. Flush DNS
echo  3. Page 2
echo  4. Page 3
echo  5. What these commands do [Info]
echo  6. Page 4/Extras/Programs
echo. 
echo  Page 2 
echo  10. Ping (Powershell)
echo  11. IP Release/renew
echo  12. Go Back
echo.
echo  Page 3 
echo  13. Getmac
echo  14. System Info
echo  15. tracert/pathping
echo  16. WMIC
echo  17. Change DNS Servers and card settings
echo  18. go back
echo. 
echo  Page 4
echo  19. Disk Manager
echo  20. Device Manager
echo  21. Event Viewer
echo  22. Services
echo  23. Task Scheduler
echo  24. Local User Mgnt
echo  25. Go back to Menu 1
echo  26. Go Back to normal Command Prompt
echo. 
echo  Page 5
echo  27. Display DNS (PowerShell)
echo  28. Flush DNS (PowerShell)
echo  29. Register DNS (PowerShell)
echo  30. Create Secret Docx
echo  31. Get Hashes on files MD5/SHA256/Others
echo  32. Powershell Ports
echo  33. Hostname
echo  34. scan network to see who is active
echo  35. embed anything in a file
echo  36. Menu 6
echo  37. Go Back
echo. 
echo  Page 6
echo  38. Download Notepad++
echo  39. Download Wireshark
echo  40. Download Advanced IP Scanner
echo  41. Download NetScan
echo  42. Download Geek Uninstaller
echo  43. Download
echo  44. Download
echo  45. Download
echo  46. Download 
echo  47. Download Spotify
echo  48. Go Back
echo [91mDO NOT RESIZE THE WINDOW[0m

pause
goto :boot

:boot
color a

::sets the size of the cmd automatically
start /b powershell -command "&{$w=(get-host).ui.rawui;$w.buffersize=@{width=102;height=999};$w.windowsize=@{width=102;height=29};}"
title Current time is %time%
cls
ping localhost -n 2 >nul
echo Welcome %USERNAME%
echo.
echo the current directory this batch file is:
echo %~dp0
ping localhost -n 3 >nul
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

:menu1
cls
echo.
echo.                                                      [91m%date%[0m
echo.
echo                                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #1─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                         █                  Choices:                █
echo                                         █                                          █
echo                                         █  1. [%chbox1%] ipconfig/all:                    █
echo                                         █  2. [%chbox2%] Flush DNS:                       █
echo                                         █  3. [%chbox3%] Page 2:                          █
echo                                         █  4. [%chbox4%] Page 3:                          █
echo                                         █  5. [%chbox5%] What these commands do [Info]:   █
echo                                         █  6. [%chbox6%] Page 4/5/Extras/Programs:        █
echo                                         █  7. [%chbox7%] :                                █
echo                                         █  8. [%chbox8%] :                                █
echo                                         █  9. [%chbox9%] :                                █
echo                                         └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.
echo.
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
goto :menu1


:apply
for /L %%i in (0,1,%size%) do (
    if defined st%%i (
        call :st%%i
        echo.
    )
)
echo.
pause
goto :menu1


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
goto :menu1

:st3
goto :menu2

:menu2
title Menu 2
cls
ping localhost -n 2 >nul
echo.
echo.
echo.
echo                                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #2─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                         █                  Choices:                █
echo                                         █                                          █
echo                                         █  10. Ping (Powershell):                  █
echo                                         █  11. IP Release/renew                    █
echo                                         █  12. Go Back:                            █
echo                                         █                                          █
echo                                         └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.

set /p userinp=Type the number of your choice: 
set userinp=%userinp:~0,2%

if "%userinp%"=="10" echo. & echo Pinging using Powershell.. & goto :pingg
if "%userinp%"=="11" echo. & echo Releasing the IP and Renewing... & ping localhost -n 1 >nul & ipconfig /release & ipconfig /renew & goto :menu2
if "%userinp%"=="12" echo returning to menu... & ping localhost -n 2 >nul & goto :menu1

:pingg
chcp 437 > nul
SET /P  system=Do you want to Ping? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO END

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0ping.ps1""' -Verb RunAs}"
ping localhost -n 2 >nul
chcp 65001 > nul
goto :END

:END
endlocal
goto :menu2


:st4
goto :menu3

:menu3
cls
echo.
echo.
echo.
echo                                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #3─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                         █                  Choices:                █
echo                                         █                                          █
echo                                         █  13. Getmac:                             █
echo                                         █  14. System Info:                        █
echo                                         █  15. Tracert/pathping:                   █
echo                                         █  16. WMIC:                               █
echo                                         █  17. Change DNS Servers and card setting █
echo                                         █  18. Go Back:                            █
echo                                         █                                          █
echo                                         └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.

set /p userinp=Type the number of your choice: 
set userinp=%userinp:~0,2%

if "%userinp%"=="13" echo. & echo starting... & ping localhost -n 1 >nul & goto :getmac
if "%userinp%"=="14" echo. & echo Starting... & ping localhost -n 1 >nul & systeminfo & pause
if "%userinp%"=="15" echo. & echo starting ... It will pathping and tracert the URL or IP address & ping localhost -n 1 >nul & goto :pathtrace
if "%userinp%"=="16" echo. & echo starting... & ping localhost -n 1 >nul & goto :wmic
if "%userinp%"=="17" echo. & echo starting.. & ping localhost -n 1 >nul & goto :dnss
if "%userinp%"=="18" echo returning to menu... & ping localhost -n 2 >nul & goto :menu1

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


:dnss
netsh interface ipv4 show config
goto :startipdns

:startipdns
SET /P system=Do you want to set DNS IP Server (Y/[N])?: 
IF /I "%system%" NEQ "Y" GOTO :end1
SET /p _card= Enter the name of the device (Ethernet, Wi-Fi):
set /p _ip= Enter the Primary DNS IP Server:
netsh interface ipv4 set dns name="%_card%" static %_ip%
:end1
goto :start2

:start2
SET /P system=Do you want to set an alternate DNS IP Server? (Y/[N])?: 
IF /I "%system%" NEQ "Y" GOTO :end2
set /p _secondaryip= Please enter the alternate DNS IP: 
netsh interface ipv4 add dns "%_card%" %_secondaryip% index=2
:end2
goto :start3

:start3
SET /P system1=Do you want to reset everything to dhcp?:
IF /I "%system1%" NEQ "Y" goto :end3
netsh interface ipv4 set address name="%_card%" source=dhcp
netsh interface ipv4 set dns "%_card%" dhcp
:end3
goto :start4


:start4
echo. Finally, 
SET /P choice1=Do you want to set your statically set your IP Address, Subnet Mask, And Gateway [All 3] (Y/[N])?: 
IF /I "%choice1%" NEQ "Y" goto :end4
set /p _ipaddr= Enter the IP Address (eg; xxx.xxx.x.x): 
set /p _subnet= Enter the Subnet Mask: 
set /p _gateway= Enter the Gateway: 
netsh interface ipv4 set address name="%_card%" static %_ipaddr% %_subnet% %_gateway%
echo Done.
:end4
goto :menu3


:st5
title bye
cls
start %~dp0menu.bat
goto :menu1

:st6

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
echo                                         █  19. Disk Manager:                       █
echo                                         █  20. Device Manager:                     █
echo                                         █  21. Event Viewer:                       █
echo                                         █  22. Services:                           █
echo                                         █  23. Task Scheduler:                     █
echo                                         █  24. Local User Mgnt:                    █
echo                                         █  25. Go Back:                            █
echo                                         █  26. Go Back to normal Command Prompt:   █
echo                                         █                                          █
echo                                         └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.

set /p userinp=Type the number of your choice: 
set userinp=%userinp:~0,2%

if "%userinp%"=="19" echo. & echo starting disk manager.. & ping localhost -n 1 >nul & diskmgmt & goto :menu4
if "%userinp%"=="20" echo. & echo starting device manager.. & ping localhost -n 1 >nul & devmgmt.msc & goto :menu4
if "%userinp%"=="21" echo. & echo starting Event Viewer.. & ping localhost -n 1 >nul &  eventvwr.msc & goto :menu4
if "%userinp%"=="22" echo. & echo Opening Services.. & ping localhost -n 1 >nul &  services.msc & goto :menu4
if "%userinp%"=="23" echo. & echo starting task scheduler.. & ping localhost -n 1 >nul &  taskschd.msc & goto :menu4
if "%userinp%"=="24" lusrmgr.msc & goto :menu4
if "%userinp%"=="25" echo returning to menu... & ping localhost -n 2 >nul & goto :menu1
if "%userinp%"=="26" echo. & echo Exiting.. & goto :break

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
echo                                         █  27. Powershell Display DNS:             █
echo                                         █  28. Powershell Flush DNS:               █
echo                                         █  29. Powershell Register DNS             █
echo                                         █  30. Create Secret Docx:                 █
echo                                         █  31. Get Hashes on files MD5/SHA256:     █
echo                                         █  32. Powershell Ports:                   █
echo                                         █  33. Hostname:                           █
echo                                         █  34. scan network to see who is active:  █
echo                                         █  35. embed anything to anything:         █
echo                                         █  36. Menu 6:                             █
echo                                         █  37. Go back                             █
echo                                         █                                          █
echo                                         └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.

set /p userinp=Type the number of your choice: 
set userinp=%userinp:~0,2%

if "%userinp%"=="27" echo. & echo starting PS; Displaying DNS.. & ping localhost -n 1 >nul & goto :PSDDNS
if "%userinp%"=="28" echo. & echo starting PS; Flushing DNS.. & ping localhost -n 1 >nul & goto :PSFDNS
if "%userinp%"=="29" echo. & echo starting PS; Registering DNS.. & ping localhost -n 1 >nul & goto :PSRDNS
if "%userinp%"=="30" echo. & echo starting.. & ping localhost -n 1 >nul & goto :docx
if "%userinp%"=="31" echo. & echo starting.. & ping localhost -n 1 >nul & goto :md5sha256
if "%userinp%"=="32" echo. & echo starting PS; Checking the ports on an network.... & ping localhost -n 1 >nul & goto :Ports
if "%userinp%"=="33" echo. & echo starting.. & ping localhost -n 1 >nul & hostname & pause
if "%userinp%"=="34" echo. & echo.. & ping localhost -n 1 >nul & goto :scann
if "%userinp%"=="35" echo. & echo.. & ping localhost -n 1 >nul & goto :embed
if "%userinp%"=="36" echo. & echo.. & ping localhost -n 1 >nul & goto :menu6
if "%userinp%"=="37" echo. & echo.. & ping localhost -n 1 >nul & goto :menu1


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
set pass=
choice /C 12 /n /m "1. run in cmd? <> 2. run in powershell?:  "
set pass=%errorlevel%

if errorlevel 1 set goto=runincmd
if errorlevel 2 set goto=runinps
goto %goto%

:runinps
chcp 437 > nul
PowerShell -file %~dp0scanningnetwork.ps1
ping localhost -n 2 >nul
chcp 65001 > nul
goto :menu5

:runincmd
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

if errorlevel 1 set goto=:ddnscmd
if errorlevel 2 set goto=:ddnsps
goto %goto%

:ddnscmd
chcp 437 > nul
SET /P system=Do you want to run Register DNS in powershell? (Y/[N])?
IF /I "%system%" NEQ "Y" GOTO :END

PowerShell -file %~dp0displaydns.ps1
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
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0displaydns.ps1""' -Verb RunAs}"
ping localhost -n 2 >nul
chcp 65001 > nul
goto :END
:END
endlocal
goto :menu5

:docx
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

PowerShell -file %~dp0clsdns.ps1
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
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0clsdns.ps1""' -Verb RunAs}"
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

PowerShell -file %~dp0regdns.ps1
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
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0regdns.ps1""' -Verb RunAs}"
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

PowerShell -file %~dp0wip2.ps1
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
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0wip2.ps1""' -Verb RunAs}"
ping localhost -n 2 >nul
chcp 65001 > nul
goto :END
:END
endlocal
goto :menu5


::WIP menu 6
title Menu 6
cls
ping localhost -n 2 >nul
:menu6
cls
echo.
echo.
echo.
echo                                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #6─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                         █                  Choices:                █
echo                                         █                                          █
echo                                         █  38. Download Notepad++:                 █
echo                                         █  39. Download Wireshark:                 █
echo                                         █  40. Download Advance IP Scanner:        █
echo                                         █  41. Download NetScan:                   █
echo                                         █  42. Download BleachBit:                 █
echo                                         █  43. Download Geek Uninstaller:          █
echo                                         █  44. :                                   █ 
echo                                         █  45. :                                   █
echo                                         █  46. :                                   █
echo                                         █  47. Download Spotify:                   █
echo                                         █  48. Go back                             █
echo                                         █                                          █
echo                                         └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.

set /p userinp=Type the number of your choice: 
set userinp=%userinp:~0,2%

if "%userinp%"=="46" echo. & echo starting.. Downloading Notepad++ .. & ping localhost -n 1 >nul & goto :notepadplus
if "%userinp%"=="47" echo. & echo starting.. Downloading Wireshark .. & ping localhost -n 1 >nul & goto :wireshark
if "%userinp%"=="48" echo. & echo starting.. Downloading Advanced IP Scanner .. & ping localhost -n 1 >nul & goto :advipscanner
if "%userinp%"=="49" echo. & echo starting.. Downloading NetScan .. & ping localhost -n 1 >nul & goto :netscan
if "%userinp%"=="50" echo. & echo starting.. Downloading BleachBit .. & ping localhost -n 1 >nul & goto :BleachBit
if "%userinp%"=="51" echo. & echo starting.. Downloading Geek Uninstaller.. & ping localhost -n 1 >nul & goto :geek
if "%userinp%"=="52" echo. & echo starting..  .. & ping localhost -n 1 >nul & goto :
if "%userinp%"=="53" echo. & echo starting..  .. & ping localhost -n 1 >nul & goto :
if "%userinp%"=="54" echo. & echo starting..  .. & ping localhost -n 1 >nul & goto :
if "%userinp%"=="55" echo. & echo starting..  .. & ping localhost -n 1 >nul & goto :spotify
if "%userinp%"=="56" echo. & echo starting..  .. & ping localhost -n 1 >nul & goto :menu1

:notepadplus
cd C:\Users\%username%\AppData\Local\Temp\ & curl -L -O https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.1.4/npp.8.1.4.Installer.x64.exe
echo.
echo Downloaded the installer successfully
ping localhost -n 1 >nul
echo Do you want to install it?
set pass=
choice /c 12 /n /m "1. yes? <> 2. no?: "
set pass=%errorlevel%
if errorlevel 1 set goto=:installnotepadplus
if errorlevel 2 set goto=:dontinstallnotepadplus
goto %goto%

:installnotepadplus: 
cd C:\Users\%username%\AppData\Local\Temp\
start npp.8.1.4.Installer.x64
echo Done.
pause pause
del /f npp.8.1.4.Installer.x64.exe
goto :menu6

:dontinstallnotepadplus
color a
cls
echo.
echo. notepad++ installation exe is at: 
ping localhost -n 2 >nul
echo [91mC:\Users\%username%\AppData\Local\Temp[0m
pause pause
pause pause
goto :menu6

:wireshark
cd C:\Users\%username%\AppData\Local\Temp\ & curl -L -O https://2.na.dl.wireshark.org/win64/Wireshark-win64-3.4.8.exe
echo.
echo Downloaded the installer successfully
ping localhost -n 1 >nul
echo Do you want to install it?
set pass=
choice /c 12 /n /m "1. yes? <> 2. no?: "
set pass=%errorlevel%
if errorlevel 1 set goto=:installwireshark
if errorlevel 2 set goto=:dontinstallwireshark
goto %goto%

:installwireshark: 
cd C:\Users\%username%\AppData\Local\Temp\
start Wireshark-win64-3.4.8.exe
echo Done.
pause pause
del /f Wireshark-win64-3.4.8.exe
goto :menu6

:dontinstallwireshark
color a
cls
echo.
echo. wireshark installation exe is at: 
ping localhost -n 2 >nul
echo [91mC:\Users\%username%\AppData\Local\Temp[0m
pause pause
pause pause
goto :menu6

:advipscanner
cd C:\Users\%username%\AppData\Local\Temp\ & curl -L -O https://download.advanced-ip-scanner.com/download/files/Advanced_IP_Scanner_2.5.3850.exe
echo.
echo Downloaded the installer successfully
ping localhost -n 1 >nul
echo Do you want to install it?
set pass=
choice /c 12 /n /m "1. yes? <> 2. no?: "
set pass=%errorlevel%
if errorlevel 1 set goto=:installadvipscanner
if errorlevel 2 set goto=:dontinstalladvipscanner
goto %goto%

:installadvipscanner 
cd C:\Users\%username%\AppData\Local\Temp\
start Advanced_IP_Scanner_2.5.3850.exe
echo Done.
pause pause
pause pause
pause
pause pause pause pause
del /f Advanced_IP_Scanner_2.5.3850.exe
goto :menu6

:dontinstalladvipscanner
color a
cls
echo.
echo. Advanced IP Scanner installation exe is at: 
ping localhost -n 2 >nul
echo [91mC:\Users\%username%\AppData\Local\Temp[0m
pause pause
pause pause
goto :menu6


:netscan
cd %~dp0programs\ & curl -L -O https://www.tcatslms.online/ttcslms/mod/resource/view.php?id=7797
echo.
timeout 20
start netscan
echo Done.
echo software is located in %~dp0programs\
pause pause
goto :menu6


:BleachBit
cd C:\Users\%username%\AppData\Local\Temp\ & timeout 5 & curl -L -O https://www.bleachbit.org/download/file/t?file=BleachBit-4.4.0-setup.exe
echo.
echo Downloaded the installer successfully
ping localhost -n 1 >nul
echo Do you want to install it?
set pass=
choice /c 12 /n /m "1. yes? <> 2. no?: "
set pass=%errorlevel%
if errorlevel 1 set goto=:installBleachBit
if errorlevel 2 set goto=:dontinstallBleachBit
goto %goto%

:installBleachBit
cd C:\Users\%username%\AppData\Local\Temp\
start BleachBit-4.4.0-setup.exe
echo Done.
pause pause
pause
pause pause pause pause
del /f BleachBit-4.4.0-setup.exe
goto :menu6

:dontinstallBleachBit
color a
cls
echo.
echo. BleachBit installation exe is at: 
ping localhost -n 2 >nul
echo [91mC:\Users\%username%\AppData\Local\Temp[0m
pause pause
pause pause
goto :menu6

:geek
cd C:\Users\%username%\AppData\Local\Temp\ & timeout 5 & curl -L -O https://geekuninstaller.com/geek.zip
echo.
echo Downloaded the zip successfully
ping localhost -n 1 >nul
echo Do you want to unzip & install it?
set pass=
choice /c 12 /n /m "1. yes? <> 2. no?: "
set pass=%errorlevel%
if errorlevel 1 set goto=:installgeekuninstaller
if errorlevel 2 set goto=:dontinstallgeekuninstaller
goto %goto%

:installgeekuninstaller
cd C:\Users\%username%\AppData\Local\Temp\
start powershell -command "Expand-Archive -Force C:\Users\%username%\AppData\Local\Temp\geek.zip -DestinationPath C:\Users\%username%\AppData\Local\Temp\
echo Done.
echo Creating shortcut in this same directory...
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%~dp0GeekUninstaller.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Users\%username%\AppData\Local\Temp\geek.exe" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
pause pause
timeout 5
start geek.exe
pause
del /f geek.zip
goto :menu6

:dontinstallgeekuninstaller
color a
cls
echo.
echo. Geek Uninstaller- .exe is at: 
ping localhost -n 2 >nul
echo [91mC:\Users\%username%\AppData\Local\Temp[0m
pause pause
pause pause
goto :menu6


:spotify
cd C:\Users\%username%\AppData\Local\Temp\ & curl -L -O https://download.spotify.com/SpotifySetup.exe
echo.
echo Downloaded the installer successfully
ping localhost -n 1 >nul
echo Do you want to install it?
set pass=
choice /c 12 /n /m "1. yes? <> 2. no?: "
set pass=%errorlevel%
if errorlevel 1 set goto=:installspotify
if errorlevel 2 set goto=:dontinstallspotify
goto %goto%

:installspotify: 
cd C:\Users\%username%\AppData\Local\Temp\
start SpotifySetup.exe
echo Done.
pause pause
del /f SpotifySetup.exe
goto :menu6

:dontinstallspotify
color a
cls
echo.
echo. spotify installation exe is at: 
ping localhost -n 2 >nul
echo [91mC:\Users\%username%\AppData\Local\Temp[0m
pause pause
pause pause
goto :menu6
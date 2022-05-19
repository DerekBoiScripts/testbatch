@echo off
set this=%0
if "%~1"=="-cd" (
	set ccd2=%~2
	shift
	shift
)
if "%~1"=="am_admin" (
	goto as_admin
)
if exist card.ini (
	set /p card=<card.ini
	goto launch
)
chcp 65001 > nul
title Batch made by ©2022 Derek Vanderver
echo   [91mChoose the gpu to DISABLE!! It will be re-enabled[0m
chcp 437 > nul
ping localhost -n 2 >nul
setlocal EnableDelayedExpansion


title Selection
chcp 65001 2>nul >nul
:menu1
cls
echo   [91mChoose the gpu to DISABLE!! It will be re-enabled[0m
echo.
echo.
echo.
echo                                      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄─Menu - #1─▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo                                      █                  Choices:                █
echo                                      █                                          █
echo                                      █  1. AMD GPU:                             █
echo                                      █  2. NVIDIA GPU:                          █
echo                                      █  3. Both:                                █
echo                                      └▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄┘
echo.

set /p userinp=Type the number of your choice: 
set userinp=%userinp:~0,2%

if "%userinp%"=="1" echo. & echo Starting.. & goto :AMDGPU
if "%userinp%"=="2" echo. & echo Starting.. & goto :NVIDIAGPU
if "%userinp%"=="3" echo. & echo Starting.. & goto :AMDINVIDIAGPU

setlocal EnableDelayedExpansion

:AMDGPU
chcp 437 > nul
cls
title AMD Selection
cls
set num=0
echo Searching for Graphics Cards . . .
devcon.exe find PCI\* ^| find /i "Radeon" >nul 2>nul
if %errorlevel%==0 goto AMDsearch
echo No Graphics Cards Found.
echo Manual Setup in card.ini.
pause
:AMDSEARCH
echo AMD Cards detected.
for /f "tokens=1,2,3* delims=:" %%A in ('devcon.exe find PCI\* ^| find /i "Radeon"') do (
set /a num+=1
set "card!num!name=%%~B"
set "card!num!path=%%~A"
)
pause
echo [32m Please Select Your [4mPRIMARY[0;32m Card[0m
set num2=1
:: COMMENT] Displays Cards for choice
:loop
echo %num2%] !card%num2%name:~1!
if "%num2%"=="%num%" goto endloop
set /a num2+=1
goto loop
:endloop
set /p cardnum=">"
if "!card%cardnum%name!"=="" (
	echo Invalid Selection.
	goto endloop
)

for /f "tokens=1,2,3* delims=^&" %%A in ('echo "!card%cardnum%path!"') do (
	set tempvar=%%~A^^^&%%~B*
	echo %%~A^&%%~B*>card.ini
)
echo !card%num%name!>cardname.ini
echo Primary card set to !card%cardnum%name:~1! [90m(%tempvar%)[0m. Programs will launch on other GPU.
pause
goto launch
:launch

if not "%~1"=="" (
	set dragndrop=%1
	goto runas
)
echo [32mDrag And Drop program to run here:[0m
set /p dragndrop=">"

:runas
if not exist %dragndrop% (
	echo Windows could not find %dragndrop%.
	echo Please make sure you have quotes around your entry if there are
	echo spaces, and that your program exists.
	pause
	goto launch
)
::set dragndrop=%dragndrop:(=`(%
::set dragndrop=%dragndrop:)=`^)%
cd>"%temp%\runascd.txt"
echo %ccd2%>"%temp%\runascardcd"
echo %dragndrop% %2 %3>"%temp%\runascdparam"
set > log.txt
echo %this%
powershell start -verb runas -FilePath '%this%' am_admin
exit /b
pause

:as_admin
set /p ccd=<"%temp%\runascd.txt"
if not exist "%temp%\runascardcd" goto noccd2
set /p ccd2=<"%temp%\runascardcd"
for %%A in ("%ccd2%") do %%~dA >nul
cd %ccd2%
del /f /q "%temp%\runascardcd"
:noccd2
echo here
set /p params=<"%temp%\runascdparam"
set /p card=<"%ccd%\card.ini"
set /p name=<"%ccd%\cardname.ini"
echo [0mDisabling primary card [30m%name%[0m. . .[90m
call "%ccd%\devcon.exe" disable "%card%"
echo [0mLaunching program . . .[90m.
timeout /t 2 /nobreak >nul 2>nul
start "" %params%
timeout /t 2 /nobreak >nul 2>nul
echo [0mEnablind primary card . . .[90m
call "%ccd%\devcon.exe" enable "%card%"
chcp 65001 2>nul >nul
timeout /t 3
goto :menu1

###########
##########
###########

:NVIDIAGPU
set num=0
echo Searching for Graphics Cards . . .
devcon.exe find PCI\* ^| find /i "NVIDIA" >nul 2>nul
if %errorlevel%==0 goto NVDsearch
echo No Graphics Cards Found.
echo Manual Setup in card.ini.
pause
:NVDSEARCH	
echo NVIDIA Cards detected.
for /f "tokens=1,2,3* delims=:" %%A in ('devcon.exe find PCI\* ^| find /i "NVIDIA"') do (
set /a num+=1
set "card!num!name=%%~B"
set "card!num!path=%%~A"
)
cls
echo [32m Please Select Your [4mPRIMARY[0;32m Card[0m
set num2=1
:loop
echo %num2%] !card%num2%name:~1!
if "%num2%"=="%num%" goto endloop
set /a num2+=1
goto loop
:endloop
set /p cardnum=">"
if "!card%cardnum%name!"=="" (
	echo Invalid Selection.
	goto endloop
)

for /f "tokens=1,2,3* delims=^&" %%A in ('echo "!card%cardnum%path!"') do (
	set tempvar=%%~A^^^&%%~B*
	echo %%~A^&%%~B*>card.ini
)
echo !card%num%name!>cardname.ini
echo Primary card set to !card%cardnum%name:~1! [90m(%tempvar%)[0m. Programs will launch on other GPU.
pause
goto launch1
:launch1

if not "%~1"=="" (
	set dragndrop=%1
	goto runas
)
echo [32mDrag And Drop program to run here:[0m
set /p dragndrop=">"

:runas
if not exist %dragndrop% (
	echo Windows could not find %dragndrop%.
	echo Please make sure you have quotes around your entry if there are
	echo spaces, and that your program exists.
	pause
	goto launch
)
::set dragndrop=%dragndrop:(=`(%
::set dragndrop=%dragndrop:)=`^)%
cd>"%temp%\runascd.txt"
echo %ccd2%>"%temp%\runascardcd"
echo %dragndrop% %2 %3>"%temp%\runascdparam"
set > log.txt
echo %this%
powershell start -verb runas -FilePath '%this%' am_admin
exit /b
pause

:as_admin
set /p ccd=<"%temp%\runascd.txt"
if not exist "%temp%\runascardcd" goto noccd2
set /p ccd2=<"%temp%\runascardcd"
for %%A in ("%ccd2%") do %%~dA >nul
cd %ccd2%
del /f /q "%temp%\runascardcd"
:noccd2
echo here
set /p params=<"%temp%\runascdparam"
set /p card=<"%ccd%\card.ini"
set /p name=<"%ccd%\cardname.ini"
echo [0mDisabling primary card [30m%name%[0m. . .[90m
call "%ccd%\devcon.exe" disable "%card%"
echo [0mLaunching program . . .[90m.
timeout /t 2 /nobreak >nul 2>nul
start "" %params%
timeout /t 2 /nobreak >nul 2>nul
echo [0mEnablind primary card . . .[90m
call "%ccd%\devcon.exe" enable "%card%"
chcp 65001 2>nul >nul
timeout /t 3


###########
##########
################

:AMDINVIDIAGPU


cls
echo [32m Please Select Your [4mPRIMARY[0;32m Card[0m
set num2=1
:loop
echo %num2%] !card%num2%name:~1!
if "%num2%"=="%num%" goto endloop
set /a num2+=1
goto loop
:endloop
set /p cardnum=">"
if "!card%cardnum%name!"=="" (
	echo Invalid Selection.
	goto endloop
)
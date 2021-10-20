@echo off
rmdir /s /q %~dp0Scripts\
del /f runwlegacy.bat
del /f RunThisMan.bat
cd %~dp0 & curl -L -O https://www.dropbox.com/s/qytkmsz5hnsl9kr/RunThisMan.zip
echo. 
echo File Updated OR Downloaded
echo.
echo extracting the zipped file
powershell -command "Expand-Archive -Force '%~dp0RunThisMan.zip' '%~dp0'"
reg add HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan /f >nul 2>&1
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan\command" /ve /d "C:\users\%USERNAME%\AppData\Local\Temp\RunThisMan.bat" /f >nul 2>&1
timeout 10



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
timeout 10



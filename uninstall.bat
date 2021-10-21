@echo off
echo [91mDeleting Scripts Folder..[0m
rmdir /s /q C:\users\%username%\AppData\Local\Temp\Scripts
timeout /t 2
echo [91mDeleting RunThisMan..[0m
del /f C:\users\%username%\AppData\Local\Temp\RunThisMan.bat
timeout /t 2
(goto) 2>nul & del "%~f0"
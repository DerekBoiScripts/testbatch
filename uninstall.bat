@echo off
echo [91mDeleting Scripts Folder..[0m
rmdir /s /q C:\users\%username%\AppData\Local\Temp\Scripts
timeout /t 2 /nobreak
echo [91mDeleting RunThisMan..[0m
del /f C:\users\%username%\AppData\Local\Temp\RunThisMan.bat
timeout /t 2 /nobreak
echo [91mDeleting Reg Keys..[0m
reg delete HKEY_CLASSES_ROOT\Directory\Background\shell\RunThisMan
timeout /t 2 /nobreak
(goto) 2>nul & del "%~f0"
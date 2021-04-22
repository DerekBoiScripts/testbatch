@echo off
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""C:\Users\DerekVanderver\Desktop\batch\scripts\pss.ps1""' -Verb RunAs}"
pause
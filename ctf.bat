@echo off
title ctf test
color a
cls
SET /P TargetPublicComputers= Please enter the ip:
telnet %TargetPublicComputers% 53 
timeout 3
telnet %TargetPublicComputers% 161 
timeout 3
telnet %TargetPublicComputers% 443
timeout 3
telnet %TargetPublicComputers% 3389 
timeout 3
telnet %TargetPublicComputers% 5900
timeout 3


pause

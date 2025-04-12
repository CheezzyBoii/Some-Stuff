@echo off
:: Elevate the script if not running as admin
:: Check if running with admin rights
>nul 2>&1 net session
if %errorLevel% neq 0 (
    echo.
    echo [91m[!] This script requires Administrator privileges. Relaunching as admin...[0m
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)
title Teredo Helper - by CheezzyBoii
chcp 65001 >nul
color 5
:start
call :banner

:menu
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo [38;2;255;255;0m        ╔═(1) Check Teredo State[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╠══(2) Set Teredo state to enterpriseclient[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╠══(3) Set Teredo state to disabled[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╠══(4) Set Teredo state to client[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╚╦══(5) Check IpConfig[0m  
echo [38;2;255;255;0m         ║[0m  
set /p input=.%BS% [38;2;255;255;0m        ╚══════^>[0m  

:: Removes all spaces

set "input=%input: =%"
if /I %input% EQU 1 (
    cls
    echo [96m[+] Checking Teredo state...[0m
    netsh interface teredo show state
    pause
    cls
    goto start
)
if /I %input% EQU 2 (
    cls
    echo [96m[+] Changing Teredo state to Enterprise Client...[0m
    netsh interface teredo set state type=enterpriseclient
    pause
    cls
    goto start
)
if /I %input% EQU 3 (
    cls
    echo [96m[+] Changing Teredo state...[0m
	netsh interface teredo set state type=disabled
    pause
    cls
    goto start
)
if /I %input% EQU 4 (
    cls
    echo [96m[+] Changing Teredo state...[0m
	netsh interface teredo set state type=client
    pause
    cls
    goto start
)

if /I %input% EQU 5 (
    cls
    echo [96m[+] Fetching IpConfig...[0m
	ipconfig
    pause
    cls
    goto start
)

cls
goto start

:banner
echo.
echo.
echo           [38;2;255;0;0m████████╗███████╗██████╗ ███████╗██████╗  ██████╗     ██╗  ██╗███████╗██╗     ██████╗ ███████╗██████╗ [0m     
echo           [38;2;255;51;0m╚══██╔══╝██╔════╝██╔══██╗██╔════╝██╔══██╗██╔═══██╗    ██║  ██║██╔════╝██║     ██╔══██╗██╔════╝██╔══██╗[0m
echo           [38;2;255;102;0m   ██║   █████╗  ██████╔╝█████╗  ██║  ██║██║   ██║    ███████║█████╗  ██║     ██████╔╝█████╗  ██████╔╝[0m 
echo           [38;2;255;153;0m   ██║   ██╔══╝  ██╔══██╗██╔══╝  ██║  ██║██║   ██║    ██╔══██║██╔══╝  ██║     ██╔═══╝ ██╔══╝  ██╔══██╗[0m
echo           [38;2;255;204;0m   ██║   ███████╗██║  ██║███████╗██████╔╝╚██████╔╝    ██║  ██║███████╗███████╗██║     ███████╗██║  ██║[0m
echo           [38;2;255;255;0m   ╚═╝   ╚══════╝╚═╝  ╚═╝╚══════╝╚═════╝  ╚═════╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝ [0m
echo                                                                                                                         [38;2;255;255;0m    by: CheezzyBoii [0m

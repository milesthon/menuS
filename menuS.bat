@echo off
chcp 65001>NUL

ECHO.&ECHO.
ECHO        Check update..
ECHO        Проверка обновлений..
curl -# --ssl-no-revoke --insecure -L https://github.com/milesthon/menuS/raw/main/menuS.bat -o "%temp%\CheckmenuSVersion.txt"
ECHO.&ECHO.
findstr /c:"CheckmenuSVersion 18012024" "%temp%\CheckmenuSVersion.txt" > nul
if %errorlevel%==0 (
goto noupdate
) else (
cls
COLOR F9
ECHO.&ECHO.
ECHO        Update..
curl -# --ssl-no-revoke --insecure -L https://codeload.github.com/milesthon/menuS/zip/refs/heads/main  -o "%temp%\menuS-main.zip"
ECHO        [32m[5m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
ECHO.&ECHO.
powershell -command "Expand-Archive -Path "%temp%\menuS-main.zip" -DestinationPath "%temp%\menuS-main" -Force"         2>nul >nul
copy "%temp%\menuS-main\menuS-main\*" "%~dp0"                                                                          2>nul >nul
start "" "%~f0"&exit
)
:noupdate

MODE 61,18
ECHO.&ECHO.&ECHO.&ECHO.&ECHO.&ECHO.&ECHO.&ECHO              Run as Administrator..&ECHO              Запуск от имени Администратора..&ECHO.&ECHO.&ECHO.&ECHO.&ECHO.&ECHO.
net sess>NUL 2>&1||(powershell try{saps '%0'-Verb RunAs}catch{}&exit)

title MenuS by MilesthoN
COLOR F9
MODE 61,40

:menu
cls
echo PC Name: %computername%
echo    User: %username%
echo.
echo  ┌───────────────────────╢ menuS ╟─────────────────────────┐
echo  ├─────────────────────────────────────────────────────────┤
echo  │ 1 - Check ^│ Проверка                                    │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 2 - Diagnostics ^│ Диагностика                           │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 3 - Recovery ^│ Восстановление                           │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 4 - Reset ^│ Сброс                                       │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 5 - Reports ^│ Отчеты                                    │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 6 - Unlock components ^│ Разблокировать компоненты       │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 7 - Disable Internet ^│ Отключить интернет               │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 0 - Info                                                │
echo  ├─────────────────────────────────────────────────────────┤
echo  └──────────────────────◄ MilesthoN ►──────────────────────┘
echo.
set /p var= : 
if "%var%"=="0" goto info
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="4" goto op4
if "%var%"=="5" goto op5
if "%var%"=="6" goto op6
if "%var%"=="7" goto op7
goto menu

:op1
cls
echo.
echo  ┌────────────────────────╢ Check ╟────────────────────────┐
echo  ├─────────────────────────────────────────────────────────┤
echo  │ 1 - Check startup                                       │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 2 - Check Environment Variables                         │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 3 - Check context menu                                  │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 4 - List of installed programs with their removal       │
echo  ┌─────────────────────────────────────────────────────────┤
echo  │ 0 - menu                                                │
echo  └─────────────────────────────────────────────────────────┘
echo.
set /p var= : 
if "%var%"=="0" goto menu
if "%var%"=="1" goto op1.1
if "%var%"=="2" goto op1.2
if "%var%"=="3" goto op1.3
if "%var%"=="4" goto op1.4
goto op1

:op2
cls
echo.
echo  ┌────────────────────╢ Diagnostics ╟──────────────────────┐
echo  ├─────────────────────────────────────────────────────────┤
echo  │ 1 - Check all disks for errors (chkdsk)                 │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 2 - Check drive C for errors with reboot (chkdsk)       │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 3 - Check RAM (mdsched)                                 │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 4 - Windows Malicious Software Removal Tool (MRT)       │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 5 - Disk defragmentation                                │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 6 - check internet connection                           │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 7 - Check (listen) port                                 │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 8 - Check Windows activation                            │
echo  ┌─────────────────────────────────────────────────────────┤
echo  │ 0 - menu                                                │
echo  └─────────────────────────────────────────────────────────┘
echo.
set /p var= : 
if "%var%"=="0" goto menu
if "%var%"=="1" goto op2.1
if "%var%"=="2" goto op2.2
if "%var%"=="3" goto op2.3
if "%var%"=="4" goto op2.4
if "%var%"=="5" goto op2.5
if "%var%"=="6" goto op2.6
if "%var%"=="7" goto op2.7
if "%var%"=="8" goto op2.8
goto op2

:op3
cls
echo.
echo  ┌──────────────────────╢ Recovery ╟───────────────────────┐
echo  ├─────────────────────────────────────────────────────────┤
echo  │ 1 - Windows image recovery (DISM)                       │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 2 - Checking Component Store (DISM)                     │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 3 - Full Component Store Scan (DISM)                    │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 4 - Run SFC scannow                                     │
echo  ┌─────────────────────────────────────────────────────────┤
echo  │ 0 - menu                                                │
echo  └─────────────────────────────────────────────────────────┘
echo.
set /p var= : 
if "%var%"=="0" goto menu
if "%var%"=="1" goto op3.1
if "%var%"=="2" goto op3.2
if "%var%"=="3" goto op3.3
if "%var%"=="4" goto op3.4
goto op3

:op4
cls
echo.
echo  ┌───────────────────────╢ Reset ╟─────────────────────────┐
echo  ├─────────────────────────────────────────────────────────┤
echo  │  1 - Reset network settings                             │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │  2 - Reset path all users                               │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │  3 - Reset Wallpaper                                    │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │  4 - Delete empty tray icons                            │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │  5 - Reset Start Menu                                   │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │  6 - Reset Windows Search                               │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │  7 - Reset cache GPO                                    │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │  8 - Reset Icon cache                                   │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │  9 - Reset language bar                                 │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 10 - Reset Windows Store                                │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 11 - Reset Windows Defender                             │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 12 - Reset Windows Activation                           │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 13 - Reset host                                         │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 14 - Reset Environment Variables                        │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 15 - Reset print queue (Spooler)                        │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 16 - Reset Microsoft Office                             │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 17 - Reset Windows Update                               │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 18 - Disable AutoLogon                                  │
echo  ┌─────────────────────────────────────────────────────────┤
echo  │ 0 - menu                                                │
echo  └─────────────────────────────────────────────────────────┘
echo.
set /p var= : 
if "%var%"=="0" goto menu
if "%var%"=="1" goto op4.1
if "%var%"=="2" goto op4.2
if "%var%"=="3" goto op4.3
if "%var%"=="4" goto op4.4
if "%var%"=="5" goto op4.5
if "%var%"=="6" goto op4.6
if "%var%"=="7" goto op4.7
if "%var%"=="8" goto op4.8
if "%var%"=="9" goto op4.9
if "%var%"=="10" goto op4.10
if "%var%"=="11" goto op4.11
if "%var%"=="12" goto op4.12
if "%var%"=="13" goto op4.13
if "%var%"=="14" goto op4.14
if "%var%"=="15" goto op4.15
if "%var%"=="16" goto op4.16
if "%var%"=="17" goto op4.17
if "%var%"=="18" goto op4.18
goto op4

:op5
cls
echo.
echo  ┌──────────────────────╢ Report ╟─────────────────────────┐
echo  ├─────────────────────────────────────────────────────────┤
echo  │ 1 - View report about disk errors (chkdsk)              │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 2 - View report RAM (mdsched)                           │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 3 - View result DISM                                    │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 4 - View result SFC scannow                             │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 5 - View host                                           │
echo  ┌─────────────────────────────────────────────────────────┤
echo  │ 0 - menu                                                │
echo  └─────────────────────────────────────────────────────────┘
echo.
set /p var= : 
if "%var%"=="0" goto menu
if "%var%"=="1" goto op5.1
if "%var%"=="2" goto op5.2
if "%var%"=="3" goto op5.3
if "%var%"=="4" goto op5.4
if "%var%"=="5" goto op5.5
goto op5

:op6
cls
echo.
echo  wait..
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableRegistryTools         /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableRegistryTools         /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableTaskMgr               /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableTaskMgr               /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableCMD                   /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V DisableCMD                   /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V NoDispCPL                    /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V NoDispCPL                    /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoFolderOptions            /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoFolderOptions            /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoControlPanel             /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoControlPanel             /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V HideFileExt /D 0 /T REG_DWORD /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V IconsOnly /D 0   /T REG_DWORD /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V Hidden /D 1      /T REG_DWORD /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoDrives                   /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoDrives                   /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoViewOnDrive              /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoViewOnDrive              /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V DisallowRun                /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V DisallowRun                /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun"                   /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun"                   /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V RestrictRun                /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V RestrictRun                /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\RestrictRun"                   /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\RestrictRun"                   /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V legalnoticecaption           /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V legalnoticetext              /F 2>nul >nul
echo.
echo  Done..
pause
goto menu

:op7
cls
:choice
cls
echo.
echo  ┌───────────────────╢ Disable Internet ╟──────────────────┐
echo  ├─────────────────────────────────────────────────────────┤
echo  │ 1 - Internet OFF (proxy)                                │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 2 - Internet ON (proxy)                                 │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 3 - All Internet OFF                                    │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 4 - All Internet ON                                     │
echo  ┌─────────────────────────────────────────────────────────┤
echo  │ 0 - menu                                                │
echo  └─────────────────────────────────────────────────────────┘
echo. 
set /p "Num= : "
if "%Num%"=="0" goto menu
if "%Num%"=="1" goto IOFF
if "%Num%"=="2" goto ION
if "%Num%"=="3" goto allIOFF
if "%Num%"=="4" goto allION
goto :choice
:IOFF 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d 0.0.0.0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d <local> /f
goto choice
:ION
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
goto choice
:allIOFF
for /F "skip=3 tokens=3*" %%G in ('netsh interface show interface') do netsh interface set interface "%%H" DISABLED
goto choice
:allION
for /F "skip=3 tokens=3*" %%G in ('netsh interface show interface') do netsh interface set interface "%%H" ENABLED
goto choice

:op1.1
cls
echo.
echo  wait..
ECHO.                                                                                                                                                2>nul  > "%Temp%\Autorun.txt"
ECHO        Autorun Folder User:                                                                                                                     2>nul >> "%Temp%\Autorun.txt"
ECHO.                                                                                                                                                2>nul >> "%Temp%\Autorun.txt"
dir /b /s "C:\Users\%UserName%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"                                                       2>nul >> "%Temp%\Autorun.txt"
ECHO.                                                                                                                                                2>nul >> "%Temp%\Autorun.txt"
ECHO.                                                                                                                                                2>nul >> "%Temp%\Autorun.txt"
ECHO        Autorun Folder PC:                                                                                                                       2>nul >> "%Temp%\Autorun.txt"
ECHO.                                                                                                                                                2>nul >> "%Temp%\Autorun.txt"
dir /b /s "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\"                                                                            2>nul >> "%Temp%\Autorun.txt"
ECHO.                                                                                                                                                2>nul >> "%Temp%\Autorun.txt"
ECHO.                                                                                                                                                2>nul >> "%Temp%\Autorun.txt"
ECHO        Autorun Registry User:                                                                                                                   2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"                                                                                       2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce"                                                                                   2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run"                                                              2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32"                                                            2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder"                                                    2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\RunServices"                                                                               2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce"                                                                           2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run"                                                                     2>nul >> "%Temp%\Autorun.txt"
:: REG QUERY "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"                                                                            2>nul >> "%Temp%\Autorun.txt"
ECHO.                                                                                                                                                2>nul >> "%Temp%\Autorun.txt"
ECHO        Autorun Registry PC:                                                                                                                     2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"                                                                                       2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"                                                                                   2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run"                                                                           2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\RunOnce"                                                                       2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run"                                                              2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32"                                                            2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder"                                                    2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices"                                                                               2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce"                                                                           2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run"                                                                     2>nul >> "%Temp%\Autorun.txt"
:: REG QUERY "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"                                                                            2>nul >> "%Temp%\Autorun.txt"
ECHO.                                                                                                                                                2>nul >> "%Temp%\Autorun.txt"
ECHO.                                                                                                                                                2>nul >> "%Temp%\Autorun.txt"
ECHO        Autorun Registry UWP:                                                                                                                    2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData" /S /F "startup" |findstr /I /V ":" 2>nul >> "%Temp%\Autorun.txt"
REG QUERY "HKLM\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData" /S /F "startup" |findstr /I /V ":" 2>nul >> "%Temp%\Autorun.txt"
"%Temp%\Autorun.txt"
del /q "%Temp%\Autorun.txt"
goto op1

:op1.2
cls
echo.
echo  wait..
ECHO. > "C:\Users\%UserName%\AppData\Local\Temp\Environment.txt"
ECHO Environment User:  >> "C:\Users\%UserName%\AppData\Local\Temp\Environment.txt"
ECHO. >> "C:\Users\%UserName%\AppData\Local\Temp\Environment.txt"
REG QUERY "HKEY_CURRENT_USER\Environment" >> "C:\Users\%UserName%\AppData\Local\Temp\Environment.txt"
ECHO. >> "C:\Users\%UserName%\AppData\Local\Temp\Environment.txt"
ECHO Environment PC:  >> "C:\Users\%UserName%\AppData\Local\Temp\Environment.txt"
ECHO. >> "C:\Users\%UserName%\AppData\Local\Temp\Environment.txt"
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" >> "C:\Users\%UserName%\AppData\Local\Temp\Environment.txt"
"C:\Users\%UserName%\AppData\Local\Temp\Environment.txt"
del /q "C:\Users\%UserName%\AppData\Local\Temp\Environment.txt"
echo %path:;=&echo.%
pause
goto op1

:op1.3
cls
echo.
echo  wait..
ECHO.                                                                     2>nul  > "%temp%\ContextMenu.txt"
ECHO        Desktop:                                                      2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\Directory\Background\shell"                               2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\Directory\Background\shellex\ContextMenuHandlers"         2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO        Desktop Background:                                           2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\DesktopBackground\Shell"                                  2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\DesktopBackground\shellex\ContextMenuHandlers"            2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO        Directory:                                                    2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\Directory\shell"                                          2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\Directory\shellex\ContextMenuHandlers"                    2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO        Send To:                                                      2>nul >> "%temp%\ContextMenu.txt"
dir /b /s "C:\Users\%UserName%\AppData\Roaming\Microsoft\Windows\SendTo\" 2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO        This PC:                                                      2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell"       2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO        Recycle:                                                      2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\shell"       2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO        Folder                                                        2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\Folder\shell"                                             2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\Folder\shellex\ContextMenuHandlers"                       2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO        Drive:                                                        2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\Drive\shell"                                              2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\Drive\shellex\ContextMenuHandlers"                        2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO        File:                                                         2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\*\shell"                                                  2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\*\shellex\ContextMenuHandlers"                            2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO        EXE File:                                                     2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\exefile\shell"                                            2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\exefile\shellex\ContextMenuHandlers"                      2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO        LNK Link:                                                     2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\lnkfile\shellex\ContextMenuHandlers"                      2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO.                                                                     2>nul >> "%temp%\ContextMenu.txt"
ECHO        Other:                                                        2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\AllFilesystemObjects\shell"                               2>nul >> "%temp%\ContextMenu.txt"
REG QUERY "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers"         2>nul >> "%temp%\ContextMenu.txt"
"%temp%\ContextMenu.txt"
del /q "%temp%\ContextMenu.txt"
goto op1

:op1.4
cls
echo.
echo  wait..
setlocal ENABLEDELAYEDEXPANSION
for /f "tokens=2*" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /V /F DisplayName /S /E 2^>nul ^| findstr "DisplayName"'
) do (
for /f "delims=" %%P in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "%%B" 2^>nul ^| findstr "HKEY_LOCAL_MACHINE"') do (
for /f "tokens=2*" %%X in (
'reg query "%%P" /v "UninstallString" 2^>nul ^|findstr "UninstallString"'
) do (
set MsiStr=%%Y
set MsiStr=!MsiStr:/I=/X!
echo %%B >> "C:\Users\%UserName%\AppData\Local\Temp\Programms.txt"
echo !MsiStr! >> "C:\Users\%UserName%\AppData\Local\Temp\Programms.txt"
echo. >> "C:\Users\%UserName%\AppData\Local\Temp\Programms.txt"
)
)
)
for /f "tokens=2*" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /V /F DisplayName /S /E 2^>nul ^| findstr "DisplayName"'
) do (
for /f "delims=" %%P in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "%%B" 2^>nul ^| findstr "HKEY_LOCAL_MACHINE"') do (
for /f "tokens=2*" %%X in (
'reg query "%%P" /v "UninstallString" 2^>nul ^|findstr "UninstallString"'
) do (
set MsiStr=%%Y
set MsiStr=!MsiStr:/I=/X!
echo %%B >> "C:\Users\%UserName%\AppData\Local\Temp\Programms.txt"
echo !MsiStr! >> "C:\Users\%UserName%\AppData\Local\Temp\Programms.txt"
echo. >> "C:\Users\%UserName%\AppData\Local\Temp\Programms.txt"
)
)
)
"C:\Users\%UserName%\AppData\Local\Temp\Programms.txt"
del /q "C:\Users\%UserName%\AppData\Local\Temp\Programms.txt"
setlocal DISABLEDELAYEDEXPANSION
goto op1


:op2.1
cls
echo.
for /f "skip=1 tokens=2 delims==" %%a in ('wmic logicaldisk where "DriveType=3 and MediaType=12" get Name /value^|find "="') do (
set "DISK=%%a")
chkdsk %DISK% /f /r /x
chkdsk C: /f /r
goto op2

:op2.2
cls
echo.
set /p input= "Check disk C: with reboot? (y/n)"
if %input%==y (fsutil dirty set C: && timeout /t 5 /nobreak && shutdown /r /t 0) else (goto op2)

:op2.3
cls
echo.
echo  wait..
mdsched.exe
goto op2

:op2.4
cls
echo.
echo  wait..
start /wait MRT.exe
goto op4

:op2.5
cls
echo.
set /p "DISK= Select Disk (0 return): "
if "%DISK%"=="0" (
goto op2
) else (
defrag %DISK%: /D /U
pause
goto op2
)

:op2.6
cls
echo.
ping -n 2 8.8.8.8    | find "TTL=" > nul&if errorlevel 1 (echo DNS FAIL) else (echo DNS OK)
ping -n 2 google.com | find "TTL=" > nul&if errorlevel 1 (echo IP FAIL)  else (echo IP OK)
echo.
ping -n 2 google.com | find "TTL=" > nul&if errorlevel 1 (echo Internet: NO)  else (echo Internet: Yes)
pause
goto op2

:op2.7
cls
echo.
set /p "port=Port (Usually - 445): "
netstat -abn | findstr "%port%"
pause
goto op2

:op2.8
cls
echo.
echo  wait..
cscript.exe c:\windows\system32\slmgr.vbs -ato >  "%TEMP%\act.txt"
cscript.exe c:\windows\system32\slmgr.vbs -dli >> "%TEMP%\act.txt"
cscript.exe c:\windows\system32\slmgr.vbs -dlv >> "%TEMP%\act.txt"
cscript.exe c:\windows\system32\slmgr.vbs -xpr >> "%TEMP%\act.txt"
start "" /wait "%TEMP%\act.txt"
del /q "%TEMP%\act.txt"
goto op2


:op3.1
cls
echo.
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "6.1" (
DISM.exe /Online /Cleanup-Image /ScanHealth
) else (
DISM /Online /Cleanup-Image /RestoreHealth
)
pause&goto op3

:op3.2
cls
echo.
DISM /Online /Cleanup-Image /CheckHealth
pause&goto op3

:op3.3
cls
echo.
DISM /Online /Cleanup-Image /ScanHealth
pause&goto op3

:op3.4
cls
echo.
sfc /scannow
pause
pause&goto op3


:op4.1
cls
echo.
echo  wait..
ipconfig /release                      2>nul >nul
ipconfig /renew                        2>nul >nul
ipconfig /flushdns                     2>nul >nul
ipconfig /registerdns                  2>nul >nul
netsh winsock reset all                2>nul >nul
netsh winhttp reset proxy              2>nul >nul
netsh int ip reset all                 2>nul >nul
netsh int tcp reset all                2>nul >nul
netsh int 6to4 reset all               2>nul >nul
netsh int ipv4 reset all               2>nul >nul
netsh int ipv6 reset all               2>nul >nul
netsh int teredo reset all             2>nul >nul
netsh int isatap reset all             2>nul >nul
netsh int portproxy reset all          2>nul >nul
netsh int httpstunnel reset all        2>nul >nul
netsh interface ip delete arpcache     2>nul >nul
fsutil resource setautoreset true C:\  2>nul >nul
goto op4

:op4.2
cls
echo.
echo  wait..
if not exist "%UserProfile%\3D Objects"      (
mkdir "%UserProfile%\3D Objects"
attrib +r -s -h "%UserProfile%\3D Objects"      /S /D 
) 2>nul >nul
if not exist "%UserProfile%\Contacts"        (
mkdir "%UserProfile%\Contacts"
attrib +r -s -h "%UserProfile%\Contacts"        /S /D
) 2>nul >nul
if not exist "%UserProfile%\Desktop"         (
mkdir "%UserProfile%\Desktop"
attrib +r -s -h "%UserProfile%\Desktop"         /S /D
) 2>nul >nul
if not exist "%UserProfile%\Documents"       (
mkdir "%UserProfile%\Documents"
attrib +r -s -h "%UserProfile%\Documents"       /S /D
) 2>nul >nul
if not exist "%UserProfile%\Downloads"       ( 
mkdir "%UserProfile%\Downloads"
attrib +r -s -h "%UserProfile%\Downloads"       /S /D
) 2>nul >nul
if not exist "%UserProfile%\Favorites"       (
mkdir "%UserProfile%\Favorites"
attrib +r -s -h "%UserProfile%\Favorites"       /S /D
) 2>nul >nul
if not exist "%UserProfile%\Links"           (
mkdir "%UserProfile%\Links"
attrib +r -s -h "%UserProfile%\Links"           /S /D
) 2>nul >nul
if not exist "%UserProfile%\Music"           (
mkdir "%UserProfile%\Music"
attrib +r -s -h "%UserProfile%\Music"           /S /D
) 2>nul >nul
if not exist "%UserProfile%\Pictures"        (
mkdir "%UserProfile%\Pictures"
attrib +r -s -h "%UserProfile%\Pictures"        /S /D
) 2>nul >nul
if not exist "%UserProfile%\Saved Games"     (
mkdir "%UserProfile%\Saved Games"
attrib +r -s -h "%UserProfile%\Saved Games"     /S /D
) 2>nul >nul
if not exist "%UserProfile%\Searches"        (
mkdir "%UserProfile%\Searches"
attrib +r -s -h "%UserProfile%\Searches"        /S /D
) 2>nul >nul
if not exist "%UserProfile%\Videos"          (
mkdir "%UserProfile%\Videos"
attrib +r -s -h "%UserProfile%\Videos"          /S /D
) 2>nul >nul
if not exist "%UserProfile%\Videos\Captures" (
mkdir "%UserProfile%\Videos\Captures"
attrib +r -s -h "%UserProfile%\Videos\Captures" /S /D
) 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{00BCFC5A-ED94-4E48-96A1-3F6217F21990}" /D "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\RoamingTiles"             /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE}" /D "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Libraries"              /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{A520A1A4-1780-4FF6-BD18-167343C5AF16}" /D "C:\Users\%USERNAME%\AppData\LocalLow"                                         /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Administrative Tools" /D "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Administrative Tools" /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "AppData" /D "C:\Users\%USERNAME%\AppData\Roaming"                                                                         /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Cache" /D "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCache"                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "CD Burning" /D "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Burn\Burn"                                            /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Cookies" /D "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\INetCookies"                                             /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /D "C:\Users\%USERNAME%\3D Objects"                                               /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{56784854-C6CB-462B-8169-88E350ACB882}" /D "C:\Users\%USERNAME%\Contacts"                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Desktop" /D "C:\Users\%USERNAME%\Desktop"                                                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Personal" /D "C:\Users\%USERNAME%\Documents"                                                                              /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{374DE290-123F-4565-9164-39C4925E467B}" /D "C:\Users\%USERNAME%\Downloads"                                                /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Favorites" /D "C:\Users\%USERNAME%\Favorites"                                                                             /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Fonts" /D "C:\windows\Fonts"                                                                                              /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "History" /D "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\History"                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Local AppData" /D "C:\Users\%USERNAME%\AppData\Local"                                                                     /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}" /D "C:\Users\%USERNAME%\Links"                                                    /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "My Music" /D "C:\Users\%USERNAME%\Music"                                                                                  /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "My Pictures" /D "C:\Users\%USERNAME%\Pictures"                                                                            /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /D "C:\Users\%USERNAME%\Saved Games"                                              /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /D "C:\Users\%USERNAME%\Searches"                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "My Video" /D "C:\Users\%USERNAME%\Videos"                                                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "NetHood" /D "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Network Shortcuts"                                     /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "PrintHood" /D "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Printer Shortcuts"                                   /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Programs" /D "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"                                  /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Recent" /D "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Recent"                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "SendTo" /D "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\SendTo"                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Start Menu" /D "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu"                                         /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Startup" /D "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"                           /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Templates" /D "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Templates"                                           /T REG_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "AppData" /D %%USERPROFILE%%"\AppData\Roaming"                                               /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Cache" /D %%USERPROFILE%%"\AppData\Local\Microsoft\Windows\INetCache"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Cookies" /D %%USERPROFILE%%"\AppData\Local\Microsoft\Windows\INetCookie"                    /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /D %%USERPROFILE%%"\3D Objects"                     /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{56784854-C6CB-462B-8169-88E350ACB882}" /D %%USERPROFILE%%"\Contacts"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Desktop" /D %%USERPROFILE%%"\Desktop"                                                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{f42ee2d3-909f-4907-8871-4c22fc0bf756}" /D %%USERPROFILE%%"\Documents"                      /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Personal" /D %%USERPROFILE%%"\Documents"                                                    /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{374DE290-123F-4565-9164-39C4925E467B}" /D %%USERPROFILE%%"\Downloads"                      /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /D %%USERPROFILE%%"\Downloads"                      /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Favorites" /D %%USERPROFILE%%"\Favorites"                                                   /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "History" /D %%USERPROFILE%%"\AppData\Local\Microsoft\Windows\History"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Local AppData" /D %%USERPROFILE%%"\AppData\Local"                                           /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}" /D %%USERPROFILE%%"\Links"                          /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{A0C69A99-21C8-4671-8703-7934162FCF1D}" /D %%USERPROFILE%%"\Music"                          /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "My Music" /D %%USERPROFILE%%"\Music"                                                        /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /D %%USERPROFILE%%"\Pictures"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "My Pictures" /D %%USERPROFILE%%"\Pictures"                                                  /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /D %%USERPROFILE%%"\Saved Games"                    /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /D %%USERPROFILE%%"\Searches"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "My Videos" /D %%USERPROFILE%%"\Videos"                                                      /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{35286A68-3C57-41A1-BBB1-0EAE73D76C95}" /D %%USERPROFILE%%"\Videos"                         /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{EDC0FE71-98D8-4F4A-B920-C8DC133CB165}" /D %%USERPROFILE%%"\Videos\Captures"                /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "NetHood" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Network Shortcuts"           /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "PrintHood" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Printer Shortcuts"         /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Programs" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"        /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Recent" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Recent"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "SendTo" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\SendTo"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Start Menu" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Start Menu"               /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Startup" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Templates" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Templates"                 /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Common Administrative Tools" /D "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools" /T REG_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Common AppData" /D "C:\ProgramData"                                                                         /T REG_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Common Desktop" /D "C:\Users\Public\Desktops"                                                               /T REG_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Common Documents" /D "C:\Users\Public\Documents"                                                            /T REG_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Common Programs" /D "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"                                  /T REG_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Common Start Menu" /D "C:\ProgramData\Microsoft\Windows\Start Menu"                                         /T REG_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Common Startup" /D "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"                           /T REG_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Common Templates" /D "C:\ProgramData\Microsoft\Windows\Templates"                                           /T REG_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "CommonMusic" /D "C:\Users\Public\Music"                                                                     /T REG_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "CommonPictures" /D "C:\Users\Public\Pictures"                                                               /T REG_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "CommonVideo" /D "C:\Users\Public\Videos"                                                                    /T REG_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "OEM Links" /D "C:\ProgramData\OEM\Links"                                                                    /T REG_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Common AppData" /D %%ProgramData%%                                                 /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Common Desktop" /D %%PUBLIC%%"\Desktop"                                            /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{3D644C9B-1FB8-4f30-9B45-F670235F79C0}" /D %%PUBLIC%%"\Downloads"                  /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "CommonVideo" /D %%PUBLIC%%"\Videos"                                                /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Common Programs" /D %%ProgramData%%"\Microsoft\Windows\Start Menu\Programs"        /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Common Start Menu" /D %%ProgramData%%"\Microsoft\Windows\Start Menu"               /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Common Startup" /D %%ProgramData%%"\Microsoft\Windows\Start Menu\Programs\Startup" /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Common Templates" /D %%ProgramData%%"\Microsoft\Windows\Templates"                 /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "CommonMusic" /D %%PUBLIC%%"\Music"                                                 /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "CommonPictures" /D %%PUBLIC%%"\Pictures"                                           /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "CommonVideo" /D %%PUBLIC%%"\Videos"                                                /T REG_EXPAND_SZ /F 2>nul >nul
For /F "Delims=" %%I In ('Dir /B /AD-S-H "C:\Users" ') Do (
REG LOAD HKU\%%I C:\Users\%%I\NTUSER.DAT
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{00BCFC5A-ED94-4E48-96A1-3F6217F21990}" /D "C:\Users\%%I\AppData\Local\Microsoft\Windows\RoamingTiles"             /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{1B3EA5DC-B587-4786-B4EF-BD1DC332AEAE}" /D "C:\Users\%%I\AppData\Roaming\Microsoft\Windows\Libraries"              /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{A520A1A4-1780-4FF6-BD18-167343C5AF16}" /D "C:\Users\%%I\AppData\LocalLow"                                         /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Administrative Tools" /D "C:\Users\%%I\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Administrative Tools" /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "AppData" /D "C:\Users\%%I\AppData\Roaming"                                                                         /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Cache" /D "C:\Users\%%I\AppData\Local\Microsoft\Windows\INetCache"                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "CD Burning" /D "C:\Users\%%I\AppData\Local\Microsoft\Windows\Burn\Burn"                                            /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Cookies" /D "C:\Users\%%I\AppData\Local\Microsoft\Windows\INetCookies"                                             /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /D "C:\Users\%%I\3D Objects"                                               /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{56784854-C6CB-462B-8169-88E350ACB882}" /D "C:\Users\%%I\Contacts"                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Desktop" /D "C:\Users\%%I\Desktop"                                                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Personal" /D "C:\Users\%%I\Documents"                                                                              /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{374DE290-123F-4565-9164-39C4925E467B}" /D "C:\Users\%%I\Downloads"                                                /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Favorites" /D "C:\Users\%%I\Favorites"                                                                             /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Fonts" /D "C:\windows\Fonts"                                                                                              /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "History" /D "C:\Users\%%I\AppData\Local\Microsoft\Windows\History"                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Local AppData" /D "C:\Users\%%I\AppData\Local"                                                                     /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}" /D "C:\Users\%%I\Links"                                                    /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "My Music" /D "C:\Users\%%I\Music"                                                                                  /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "My Pictures" /D "C:\Users\%%I\Pictures"                                                                            /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /D "C:\Users\%%I\Saved Games"                                              /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /D "C:\Users\%%I\Searches"                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "My Video" /D "C:\Users\%%I\Videos"                                                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "NetHood" /D "C:\Users\%%I\AppData\Roaming\Microsoft\Windows\Network Shortcuts"                                     /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "PrintHood" /D "C:\Users\%%I\AppData\Roaming\Microsoft\Windows\Printer Shortcuts"                                   /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Programs" /D "C:\Users\%%I\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"                                  /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Recent" /D "C:\Users\%%I\AppData\Roaming\Microsoft\Windows\Recent"                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "SendTo" /D "C:\Users\%%I\AppData\Roaming\Microsoft\Windows\SendTo"                                                 /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Start Menu" /D "C:\Users\%%I\AppData\Roaming\Microsoft\Windows\Start Menu"                                         /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Startup" /D "C:\Users\%%I\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"                           /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /V "Templates" /D "C:\Users\%%I\AppData\Roaming\Microsoft\Windows\Templates"                                           /T REG_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "AppData" /D %%USERPROFILE%%"\AppData\Roaming"                                               /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Cache" /D %%USERPROFILE%%"\AppData\Local\Microsoft\Windows\INetCache"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Cookies" /D %%USERPROFILE%%"\AppData\Local\Microsoft\Windows\INetCookie"                    /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{31C0DD25-9439-4F12-BF41-7FF4EDA38722}" /D %%USERPROFILE%%"\3D Objects"                     /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{56784854-C6CB-462B-8169-88E350ACB882}" /D %%USERPROFILE%%"\Contacts"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Desktop" /D %%USERPROFILE%%"\Desktop"                                                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{f42ee2d3-909f-4907-8871-4c22fc0bf756}" /D %%USERPROFILE%%"\Documents"                      /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Personal" /D %%USERPROFILE%%"\Documents"                                                    /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{374DE290-123F-4565-9164-39C4925E467B}" /D %%USERPROFILE%%"\Downloads"                      /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /D %%USERPROFILE%%"\Downloads"                      /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Favorites" /D %%USERPROFILE%%"\Favorites"                                                   /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "History" /D %%USERPROFILE%%"\AppData\Local\Microsoft\Windows\History"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Local AppData" /D %%USERPROFILE%%"\AppData\Local"                                           /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{BFB9D5E0-C6A9-404C-B2B2-AE6DB6AF4968}" /D %%USERPROFILE%%"\Links"                          /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{A0C69A99-21C8-4671-8703-7934162FCF1D}" /D %%USERPROFILE%%"\Music"                          /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "My Music" /D %%USERPROFILE%%"\Music"                                                        /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /D %%USERPROFILE%%"\Pictures"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "My Pictures" /D %%USERPROFILE%%"\Pictures"                                                  /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /D %%USERPROFILE%%"\Saved Games"                    /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{7D1D3A04-DEBB-4115-95CF-2F29DA2920DA}" /D %%USERPROFILE%%"\Searches"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "My Videos" /D %%USERPROFILE%%"\Videos"                                                      /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{35286A68-3C57-41A1-BBB1-0EAE73D76C95}" /D %%USERPROFILE%%"\Videos"                         /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "{EDC0FE71-98D8-4F4A-B920-C8DC133CB165}" /D %%USERPROFILE%%"\Videos\Captures"                /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "NetHood" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Network Shortcuts"           /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "PrintHood" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Printer Shortcuts"         /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Programs" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"        /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Recent" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Recent"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "SendTo" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\SendTo"                       /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Start Menu" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Start Menu"               /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Startup" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /T REG_EXPAND_SZ /F 2>nul >nul
REG ADD "HKU\%%I\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /V "Templates" /D %%USERPROFILE%%"\AppData\Roaming\Microsoft\Windows\Templates"                 /T REG_EXPAND_SZ /F 2>nul >nul
REG UNLOAD HKU\%%I
) 2>nul >nul
goto op4

:op4.3
cls
echo.
echo  wait..
powershell -Command "& {$wallpaperPath = 'C:\Windows\Web\Wallpaper\Windows\img0.jpg'; Add-Type -TypeDefinition 'public class Wallpaper { [System.Runtime.InteropServices.DllImport(\"user32.dll\", CharSet = System.Runtime.InteropServices.CharSet.Auto)] public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20, 0, $wallpaperPath, 3)}"
goto op4

:op4.4
cls
echo.
echo  wait..
reg delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /f 2>nul >nul
taskkill /f /IM explorer.exe                                                                              2>nul >nul
explorer.exe
goto op4

:op4.5
cls
echo.
echo  wait..
REG DELETE HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount /F 2>nul >nul
taskkill /f /IM explorer.exe                                                                                    2>nul >nul
explorer.exe
goto op4

:op4.6
cls
echo.
echo  wait..
SC STOP WSearch  2>nul >nul
TaskKill /F /IM SearchApp.exe 2>nul >nul
TaskKill /F /IM SearchIndexer.exe 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /F 2>nul >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /D 1 /T REG_DWORD /F 2>nul >nul
REG COPY "HKLM\SOFTWARE\Microsoft\Windows Search\FileChangeClientConfigs" "HKLM\SOFTWARE\Microsoft\Windows Search\FileChangeClientConfigsBak" /S /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows Search\FileChangeClientConfigs"                                                                      /F 2>nul >nul
PowerShell -Command "Get-AppXPackage | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register '$($_.InstallLocation)\AppXManifest.xml'}"        2>nul >nul
SC START WSearch 2>nul >nul
taskkill /f /IM explorer.exe 2>nul >nul
explorer.exe
goto op4

:op4.7
cls
echo.
echo  wait..
DEL /S /F /Q "C:\ProgramData\Application Data\Microsoft\Group Policy\History\*.*" 2>nul >nul
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies /f             2>nul >nul
REG DELETE HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies /f             2>nul >nul
DEL /F /Q C:\WINDOWS\security\Database\secedit.sdb                                2>nul >nul
goto op4

:op4.8
cls
echo.
echo  wait..
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "6.1" (
ie4uinit.exe -ClearIconCache
) else (
ie4uinit.exe -show
)
goto op4

:op4.9
cls
echo.
echo  wait..
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\CTF\LangBar" /v ExtraIconsOnMinimized /d 0 /t REG_DWORD /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\CTF\LangBar" /v Label /d 1 /t REG_DWORD /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\CTF\LangBar" /v ShowStatus /d 4 /t REG_DWORD /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\CTF\LangBar" /v Transparency /d 255 /t REG_DWORD /f
goto op4

:op4.10
cls
echo.
echo  wait..
Start /min /wait WSReset.exe     2>nul >nul
TaskKill /IM WinStore.App.exe /F 2>nul >nul
goto op4

:op4.11
cls
echo.
powershell.exe -command "Add-AppxPackage -Register -DisableDevelopmentMode "C:\Windows\SystemApps\Microsoft.Windows.SecHealthUI_cw5n1h2txyewy\AppXManifest.xml""
powershell.exe -command "Get-AppxPackage -allusers Microsoft.Windows.SecHealthUI | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}"
goto op4

:op4.12
cls
echo.
echo  wait..
cscript.exe c:\windows\system32\slmgr.vbs -rearm
goto op4

:op4.13
cls
echo.
echo  wait..
takeown /f "C:\Windows\system32\drivers\etc\hosts"
icacls "C:\Windows\system32\drivers\etc\hosts" /grant %UserName%:F /t /q
DEL /F /A /Q "C:\Windows\system32\drivers\etc\hosts"
(
Echo # Copyright ^(c^) 1993-2009 Microsoft Corp.
Echo #
Echo # This is a sample HOSTS file used by Microsoft TCP/IP for Windows.
Echo #
Echo # This file contains the mappings of IP addresses to host names. Each
Echo # entry should be kept on an individual line. The IP address should
Echo # be placed in the first column followed by the corresponding host name.
Echo # The IP address and the host name should be separated by at least one
Echo # space.
Echo #
Echo # Additionally, comments ^(such as these^) may be inserted on individual
Echo # lines or following the machine name denoted by a '#' symbol.
Echo #
Echo # For example:
Echo #
Echo #      102.54.94.97     rhino.acme.com          # source server
Echo #       38.25.63.10     x.acme.com              # x client host
Echo.
Echo # localhost name resolution is handled within DNS itself.
Echo #	127.0.0.1       localhost
Echo #	::1             localhost
)>"C:\Windows\system32\drivers\etc\hosts"
icacls "C:\Windows\system32\drivers\etc\hosts" /reset
goto op4

:op4.14
cls
echo.
echo  wait..
(
Echo Windows Registry Editor Version 5.00
Echo.
Echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment]
Echo "ComSpec"=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,\
Echo   74,00,25,00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,63,\
Echo   00,6d,00,64,00,2e,00,65,00,78,00,65,00,00,00
Echo "DriverData"="C:\\Windows\\System32\\Drivers\\DriverData"
Echo "OS"="Windows_NT"
Echo "PATHEXT"=".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC"
Echo "PSModulePath"=hex(2):25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,\
Echo   00,6c,00,65,00,73,00,25,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,\
Echo   50,00,6f,00,77,00,65,00,72,00,53,00,68,00,65,00,6c,00,6c,00,5c,00,4d,00,6f,\
Echo   00,64,00,75,00,6c,00,65,00,73,00,3b,00,25,00,53,00,79,00,73,00,74,00,65,00,\
Echo   6d,00,52,00,6f,00,6f,00,74,00,25,00,5c,00,73,00,79,00,73,00,74,00,65,00,6d,\
Echo   00,33,00,32,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,50,00,6f,00,\
Echo   77,00,65,00,72,00,53,00,68,00,65,00,6c,00,6c,00,5c,00,76,00,31,00,2e,00,30,\
Echo   00,5c,00,4d,00,6f,00,64,00,75,00,6c,00,65,00,73,00,00,00
Echo "TEMP"=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,\
Echo   00,25,00,5c,00,54,00,45,00,4d,00,50,00,00,00
Echo "TMP"=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,\
Echo   25,00,5c,00,54,00,45,00,4d,00,50,00,00,00
Echo "USERNAME"="SYSTEM"
Echo "windir"=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,\
Echo   00,25,00,00,00
Echo [HKEY_CURRENT_USER\Environment]
Echo "Path"=hex(2):25,00,55,00,53,00,45,00,52,00,50,00,52,00,4f,00,46,00,49,00,4c,\
Echo   00,45,00,25,00,5c,00,41,00,70,00,70,00,44,00,61,00,74,00,61,00,5c,00,4c,00,\
Echo   6f,00,63,00,61,00,6c,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,\
Echo   00,74,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,41,00,70,00,70,00,\
Echo   73,00,3b,00,00,00
Echo "TEMP"=hex(2):25,00,55,00,53,00,45,00,52,00,50,00,52,00,4f,00,46,00,49,00,4c,\
Echo   00,45,00,25,00,5c,00,41,00,70,00,70,00,44,00,61,00,74,00,61,00,5c,00,4c,00,\
Echo   6f,00,63,00,61,00,6c,00,5c,00,54,00,65,00,6d,00,70,00,00,00
Echo "TMP"=hex(2):25,00,55,00,53,00,45,00,52,00,50,00,52,00,4f,00,46,00,49,00,4c,00,\
Echo   45,00,25,00,5c,00,41,00,70,00,70,00,44,00,61,00,74,00,61,00,5c,00,4c,00,6f,\
Echo   00,63,00,61,00,6c,00,5c,00,54,00,65,00,6d,00,70,00,00,00
Echo "OneDrive"=hex(2):43,00,3a,00,5c,00,55,00,73,00,65,00,72,00,73,00,5c,00,6d,00,\
Echo   6d,00,6b,00,6f,00,5c,00,4f,00,6e,00,65,00,44,00,72,00,69,00,76,00,65,00,00,\
Echo   00
)>"%temp%\defaulEnvironment.reg"
regedit /s "%temp%\defaulEnvironment.reg"
goto op4

:op4.15
cls
echo.
echo  wait..
net stop spooler /q
del "C:\Windows\system32\spool\printers\*.*" /f /s /q
net start spooler
goto op4

:op4.16
cls
:menuof
cls
echo Имя компьютера: %computername%
echo Пользователь: %username%
echo.
echo  ┌───────────────╢ Reset Microsoft Office ╟────────────────┐
echo  ├─────────────────────────────────────────────────────────┤
echo  │ 1 - Reset All                                           │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 2 - Reset Word                                          │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 3 - Reset Excel                                         │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 4 - Reset PowerPoint                                    │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 5 - Reset Access                                        │
echo  ┌─────────────────────────────────────────────────────────┘
echo  │ 6 - Reset Outlook                                       │
echo  ┌─────────────────────────────────────────────────────────┤
echo  │ 0 - menu                                                │
echo  └─────────────────────────────────────────────────────────┘
echo. 
set /p "Num= : "
if "%Num%"=="0" goto menu
if "%Num%"=="1" goto all
if "%Num%"=="2" goto Word
if "%Num%"=="3" goto Excel
if "%Num%"=="4" goto PowerPoint
if "%Num%"=="5" goto Access
if "%Num%"=="6" goto Outlook
goto :menuof
:all
cls
echo.
echo  wait..
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Word /f       2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\Word /f       2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\14.0\Word /f       2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\12.0\Word /f       2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\11.0\Word /f       2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Access /f     2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\Access /f     2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\14.0\Access /f     2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\12.0\Access /f     2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\11.0\Access /f     2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Excel /f      2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\Excel /f      2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\14.0\Excel /f      2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\12.0\Excel /f      2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\11.0\Excel /f      2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Outlook /f    2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\Outlook /f    2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\14.0\Outlook /f    2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\12.0\Outlook /f    2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\11.0\Outlook /f    2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\PowerPoint /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\PowerPoint /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\14.0\PowerPoint /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\12.0\PowerPoint /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\11.0\PowerPoint /f 2>nul >nul
goto :menuof
:Word
cls
echo.
echo  wait..
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Word /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\Word /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\14.0\Word /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\12.0\Word /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\11.0\Word /f 2>nul >nul
goto :menuof
:Excel
cls
echo.
echo  wait..
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Excel /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\Excel /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\14.0\Excel /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\12.0\Excel /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\11.0\Excel /f 2>nul >nul
goto :menuof
:PowerPoint
cls
echo.
echo  wait..
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\PowerPoint /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\PowerPoint /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\14.0\PowerPoint /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\12.0\PowerPoint /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\11.0\PowerPoint /f 2>nul >nul
goto :menuof
:Access
cls
echo.
echo  wait..
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Access /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\Access /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\14.0\Access /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\12.0\Access /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\11.0\Access /f 2>nul >nul
goto :menuof
:Outlook
cls
echo.
echo  wait..
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Outlook /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\Outlook /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\14.0\Outlook /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\12.0\Outlook /f 2>nul >nul
reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\11.0\Outlook /f 2>nul >nul
goto :menuof

:op4.17
cls
echo.
echo  wait..
net stop bits     2>nul >nul
net stop wuauserv 2>nul >nul
net stop appidsvc 2>nul >nul
net stop cryptsvc 2>nul >nul
Ipconfig /flushdns                                                2>nul >nul
PowerShell -Command                                                        ^
Remove-Item                                                                ^
'C:\ProgramData\Application Data\Microsoft\Network\Downloader\qmgr*.dat' , ^
'C:\ProgramData\icrosoft\Network\Downloader\qmgr*.dat'                   , ^
'C:\Windows\Logs\WindowsUpdate\*'                                        , ^
'C:\Windows\Logs\SoftwareDistribution\*'                                   ^
-Recurse -Force                                                   2>nul >nul
if exist "C:\Windows\winsxs\pending.xml.bak" del /s /q /f "C:\Windows\winsxs\pending.xml.bak"
if exist "C:\Windows\winsxs\pending.xml" (
takeown /f "C:\Windows\winsxs\pending.xml"
attrib -r -s -h /s /d "C:\Windows\winsxs\pending.xml"
ren "C:\Windows\winsxs\pending.xml" pending.xml.bak
) 2>nul >nul
if exist "C:\Windows\system32\Catroot2.bak" rmdir /s /q "C:\Windows\system32\Catroot2.bak"
if exist "C:\Windows\system32\Catroot2" (
attrib -r -s -h /s /d "C:\Windows\system32\Catroot2"
ren "C:\Windows\system32\Catroot2" Catroot2.bak
) 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"                /F 2>nul >nul
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate" /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"                /F 2>nul >nul
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate" /F 2>nul >nul
gpupdate /force                                                                       2>nul >nul
sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)     2>nul >nul
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU) 2>nul >nul
cd /d %windir%\system32          2>nul >nul
regsvr32.exe /s atl.dll          2>nul >nul
regsvr32.exe /s urlmon.dll       2>nul >nul
regsvr32.exe /s mshtml.dll       2>nul >nul
regsvr32.exe /s shdocvw.dll      2>nul >nul
regsvr32.exe /s browseui.dll     2>nul >nul
regsvr32.exe /s jscript.dll      2>nul >nul
regsvr32.exe /s vbscript.dll     2>nul >nul
regsvr32.exe /s scrrun.dll       2>nul >nul
regsvr32.exe /s msxml.dll        2>nul >nul
regsvr32.exe /s msxml3.dll       2>nul >nul
regsvr32.exe /s msxml6.dll       2>nul >nul
regsvr32.exe /s actxprxy.dll     2>nul >nul
regsvr32.exe /s softpub.dll      2>nul >nul
regsvr32.exe /s wintrust.dll     2>nul >nul
regsvr32.exe /s dssenh.dll       2>nul >nul
regsvr32.exe /s rsaenh.dll       2>nul >nul
regsvr32.exe /s gpkcsp.dll       2>nul >nul
regsvr32.exe /s sccbase.dll      2>nul >nul
regsvr32.exe /s slbcsp.dll       2>nul >nul
regsvr32.exe /s cryptdlg.dll     2>nul >nul
regsvr32.exe /s oleaut32.dll     2>nul >nul
regsvr32.exe /s ole32.dll        2>nul >nul
regsvr32.exe /s shell32.dll      2>nul >nul
regsvr32.exe /s initpki.dll      2>nul >nul
regsvr32.exe /s wuapi.dll        2>nul >nul
regsvr32.exe /s wuaueng.dll      2>nul >nul
regsvr32.exe /s wuaueng1.dll     2>nul >nul
regsvr32.exe /s wucltui.dll      2>nul >nul
regsvr32.exe /s wups.dll         2>nul >nul
regsvr32.exe /s wups2.dll        2>nul >nul
regsvr32.exe /s wuweb.dll        2>nul >nul
regsvr32.exe /s qmgr.dll         2>nul >nul
regsvr32.exe /s qmgrprxy.dll     2>nul >nul
regsvr32.exe /s wucltux.dll      2>nul >nul
regsvr32.exe /s muweb.dll        2>nul >nul
regsvr32.exe /s wuwebv.dll       2>nul >nul
regsvr32.exe /s wudriver.dll     2>nul >nul
netsh winsock reset              2>nul >nul
netsh winsock reset proxy        2>nul >nul
sc config wuauserv start= auto   2>nul >nul
sc config bits start= auto       2>nul >nul
sc config DcomLaunch start= auto 2>nul >nul
net start bits                   2>nul >nul
net start wuauserv               2>nul >nul
net start appidsvc               2>nul >nul
net start cryptsvc               2>nul >nul
goto op4

:op4.18
cls
echo.
echo  wait..
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 0 /f      2>nul >nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /f               2>nul >nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /f                 2>nul >nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /f                 2>nul >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v ForceAutoLogon /t REG_SZ /d 0 /f      2>nul >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v IgnoreShiftOvveride /t REG_SZ /d 0 /f 2>nul >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoLogonCount /t REG_DWORD /d 0 /f   2>nul >nul
goto op4


:op5.1
cls
echo.
echo  wait..
wevtutil qe Application /rd:true /c:5 /f:Text /q:"*[System[Provider[@Name='Chkdsk']]]" > "%TEMP%\ChkDskLog.txt"
start "" /wait "%TEMP%\ChkDskLog.txt"
goto op5

:op5.2
cls
echo.
echo  wait..
wevtutil qe Application /rd:true /c:5 /f:Text /q:"*[System[Provider[@Name='MemoryDiagnostics-Results']]]" > "%TEMP%\MemoryDiagnostics.txt"
start "" /wait "%TEMP%\MemoryDiagnostics.txt"
goto op5

:op5.3
cls
echo.
echo  wait..
findstr /c:"[SR]" C:\Windows\Logs\CBS\CBS.log > "%temp%\sfcResult.txt"
start /wait "" "%temp%\sfcResult.txt"
goto op5

:op5.4
cls
start /wait notepad C:\Windows\System32\drivers\etc\hosts
goto op5

:op5.5
cls
start /wait C:\Windows\Logs\DISM\dism.log
goto op5


:info
cls
echo.
for /f "tokens=3*" %%I in ('reg query "HKLM\SYSTEM\Setup\Pid" /V Pid') do set "VER=%%I"
if %VER%==OEM set "VER=OEM"&goto next
if %VER%==00000270 set "VER=VL"&goto next
set "VER=Retail"&goto next
:next
FOR /F "tokens=4,5" %%I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NV Hostname" 2^>nul')                    Do set "Hostname=%%I %%J"
FOR /F "tokens=4,5" %%I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NV Hostname" 2^>nul') Do set "Hostname=%%I %%J"
FOR /F "tokens=3,4" %%I in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName 2^>nul')                            Do set "ProductName=%%I %%J"
FOR /F "tokens=3,4" %%I in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v EditionID 2^>nul')                              Do set "EditionID=%%I %%J"
FOR /F "tokens=3,4" %%I in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild 2^>nul')                           Do set "CurrentBuild=%%I %%J"
FOR /F "tokens=3,4" %%I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Processor_architecture 2^>nul') Do if [%%I]==[AMD64] ( set "architecture=x64" ) ELSE ( set "architecture=x32" )
ECHO.
ECHO PC Name: %computername%
ECHO User: %username%
ECHO DOMAIN: %Domain%
ECHO OS: %ProductName% %EditionID%%CurrentBuild%%architecture% %VER% &ECHO.
pause
goto menu
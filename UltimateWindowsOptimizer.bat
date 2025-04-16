@echo off
setlocal enabledelayedexpansion
title 🚀 Ultimate Windows Optimizer v2.0 🚀
color 0A

:: Windows optimization script
:: Copyright (c) 2025 TecGenesis
:: Licensed under the MIT License - See the LICENSE file for details

:: Check for administrator privileges
NET FILE >nul 2>&1 || (
    echo ⚠️ ERROR: This script must be run as Administrator!
    echo ⚠️ Please right-click and select "Run as administrator".
    pause
    exit
)

:MENU
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║             🚀 ULTIMATE WINDOWS OPTIMIZER 🚀         ║
echo ╠══════════════════════════════════════════════════════╣
echo ║                                                      ║
echo ║  [1] Create system restore point                     ║
echo ║  [2] Optimize system performance                     ║
echo ║  [3] Clean temporary files                           ║
echo ║  [4] Disable telemetry and unnecessary services      ║
echo ║  [5] Disable visual effects                          ║
echo ║  [6] Optimize Windows registry                       ║
echo ║  [7] Run ALL optimizations                           ║
echo ║  [0] Exit                                            ║
echo ║                                                      ║
echo ╚══════════════════════════════════════════════════════╝
echo.
set /p option="Choose an option [0-7]: "

if "%option%"=="0" exit
if "%option%"=="1" goto RESTORE_POINT
if "%option%"=="2" goto OPTIMIZE_PERFORMANCE
if "%option%"=="3" goto CLEAN_TEMP
if "%option%"=="4" goto DISABLE_TELEMETRY
if "%option%"=="5" goto DISABLE_EFFECTS
if "%option%"=="6" goto OPTIMIZE_REGISTRY
if "%option%"=="7" goto RUN_ALL

echo ⚠️ Invalid option! Try again.
timeout /t 2 >nul
goto MENU

:RUN_ALL
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║              RUNNING ALL OPTIMIZATIONS               ║
echo ╚══════════════════════════════════════════════════════╝
echo.

echo 🔹 Creating a restore point first...
powershell -Command "Enable-ComputerRestore -Drive 'C:\'"
powershell -Command "Checkpoint-Computer -Description 'Point before UltimateWindowsOptimizer' -RestorePointType 'MODIFY_SETTINGS'"
echo ✓ Restore point created!

timeout /t 2 >nul
call :OPTIMIZE_PERFORMANCE
timeout /t 2 >nul
call :CLEAN_TEMP
timeout /t 2 >nul
call :DISABLE_TELEMETRY
timeout /t 2 >nul
call :DISABLE_EFFECTS
timeout /t 2 >nul
call :OPTIMIZE_REGISTRY

cls
echo ╔══════════════════════════════════════════════════════╗
echo ║              🎉 OPTIMIZATION COMPLETE! 🎉            ║
echo ╚══════════════════════════════════════════════════════╝
echo.
echo ✅ All optimizations have been successfully applied!
echo ✅ For all changes to take effect, we recommend restarting your system.
echo.
echo Do you want to restart your computer now?
echo [Y] Yes
echo [N] No (return to menu)
echo.
set /p restart="Choose an option [Y/N]: "

if /i "%restart%"=="Y" (
    shutdown /r /t 10 /c "Restarting to apply Ultimate Windows Optimizer optimizations"
    echo System will restart in 10 seconds...
    timeout /t 10
    exit
) else (
    goto MENU
)

endlocal

:RESTORE_POINT
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║             CREATING SYSTEM RESTORE POINT            ║
echo ╚══════════════════════════════════════════════════════╝
echo.

powershell -Command "Enable-ComputerRestore -Drive 'C:\'"
powershell -Command "Checkpoint-Computer -Description 'Point before UltimateWindowsOptimizer' -RestorePointType 'MODIFY_SETTINGS'"

echo ✅ Restore point created successfully!
echo.
pause
goto MENU

:OPTIMIZE_PERFORMANCE
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║            OPTIMIZING SYSTEM PERFORMANCE             ║
echo ╚══════════════════════════════════════════════════════╝
echo.

echo 🔹 Adjusting settings for better performance...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "100" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 3 /f

echo 🔹 Adjusting power settings for maximum performance...
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -change -monitor-timeout-ac 15
powercfg -change -monitor-timeout-dc 5
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 15
powercfg -change -hibernate-timeout-ac 0
powercfg -change -hibernate-timeout-dc 30

echo 🔹 Optimizing system startup...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t REG_DWORD /d 0 /f
bcdedit /timeout 3

echo 🔹 Disabling unnecessary features...
powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'WindowsMediaPlayer' -NoRestart"
powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'WorkFolders-Client' -NoRestart"
powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'Printing-XPSServices-Features' -NoRestart"

echo 🔹 Optimizing and defragmenting the disk...
defrag C: /O

echo ✅ Performance optimized successfully!
echo.
pause
goto MENU

:CLEAN_TEMP
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║              CLEANING TEMPORARY FILES                ║
echo ╚══════════════════════════════════════════════════════╝
echo.

echo 🔹 Cleaning user Temp folder...
del /s /f /q %temp%\*.* 2>nul

echo 🔹 Cleaning Windows Temp folder...
del /s /f /q C:\Windows\Temp\*.* 2>nul

echo 🔹 Cleaning Internet temporary files...
del /s /f /q "%LOCALAPPDATA%\Microsoft\Windows\INetCache\IE\*.*" 2>nul

echo 🔹 Cleaning Prefetch folder...
del /s /f /q C:\Windows\Prefetch\*.* 2>nul

echo 🔹 Removing log files...
del /s /f /q C:\Windows\Logs\*.* 2>nul

echo 🔹 Emptying Recycle Bin...
powershell -Command "Clear-RecycleBin -Force" 2>nul

echo 🔹 Running Disk Cleanup...
cleanmgr /sagerun:1

echo ✅ Temporary files cleanup completed!
echo.
pause
goto MENU

:DISABLE_TELEMETRY
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║      DISABLING TELEMETRY AND UNNECESSARY SERVICES    ║
echo ╚══════════════════════════════════════════════════════╝
echo.

echo 🔹 Disabling telemetry services...
sc config DiagTrack start= disabled
sc config dmwappushservice start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config WerSvc start= disabled
sc config WMPNetworkSvc start= disabled
sc config WSearch start= disabled
sc config SysMain start= disabled

echo 🔹 Disabling telemetry scheduled tasks...
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable

echo ✅ Telemetry and unnecessary services disabled successfully!
echo.
pause
goto MENU

:DISABLE_EFFECTS
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║                DISABLING VISUAL EFFECTS              ║
echo ╚══════════════════════════════════════════════════════╝
echo.

echo 🔹 Disabling all visual effects for better performance...
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 3 /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Accessibility\Blind Access" /v Flag /t REG_DWORD /d 1 /f

echo 🔹 Hiding unnecessary buttons...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f

echo ✅ Visual effects disabled successfully!
echo.
pause
goto MENU

:OPTIMIZE_REGISTRY
cls
echo ╔══════════════════════════════════════════════════════╗
echo ║              OPTIMIZING WINDOWS REGISTRY             ║
echo ╚══════════════════════════════════════════════════════╝
echo.

echo 🔹 Optimizing system registry...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsMemoryUsage" /t REG_DWORD /d 2 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t REG_DWORD /d 0 /f

echo 🔹 Adjusting network settings...
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global ecncapability=disabled
netsh int tcp set supplemental Internet congestionprovider=ctcp

echo 🔹 Disabling Hibernation to free up disk space...
powercfg /h off

echo ✅ Windows Registry optimized successfully!
echo.
pause
goto MENU
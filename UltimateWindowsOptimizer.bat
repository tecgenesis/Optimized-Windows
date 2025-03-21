@echo off
title 🚀 Otimização Avançada do Windows 🚀
color 0A
echo ==================================================
echo   🚀 Super Otimizador do Windows 🚀
echo ==================================================
echo.
echo Executando otimizações... Aguarde.
echo.

NET FILE >nul 2>&1 || (ECHO Execute este script como Administrador! && PAUSE && EXIT)

echo 🔹 Removendo aplicativos pré-instalados...
powershell -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *solitairecollection* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *skype* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *people* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage"

echo 🔹 Removendo o Copilot...
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f
taskkill /f /im "Copilot.exe" 2>nul
powershell -Command "Get-AppxPackage *MicrosoftWindows.Client.CBS* | Remove-AppxPackage"

echo 🔹 Removendo o Microsoft Edge...
taskkill /f /im "msedge.exe" 2>nul
cd %ProgramFiles(x86)%\Microsoft\Edge\Application\*
setup.exe --uninstall --system-level --verbose-logging --force-uninstall

echo 🔹 Desativando programas de inicialização...
wmic startup get caption,command
echo.
echo Desative manualmente programas indesejados no Gerenciador de Tarefas.
timeout /t 3

echo 🔹 Ajustando configurações para melhor desempenho...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f

echo 🔹 Desativando efeitos visuais...
reg add "HKCU\Control Panel\Accessibility\Blind Access" /v Flag /t REG_DWORD /d 1 /f

echo 🔹 Removendo arquivos temporários...
del /s /q %temp%\*.* 
del /s /q C:\Windows\Temp\*.* 
cleanmgr /sagerun:1

echo 🔹 Desativando linha do tempo, widgets e feed de notícias...
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
REG ADD "HKLM\Software\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f
taskkill /f /im "Widgets.exe" 2>nul
powershell -Command "Get-AppxPackage *MicrosoftWindows.Client.WebExperience* | Remove-AppxPackage"

echo 🔹 Ajustando configurações de privacidade...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f

echo 🔹 Ocultando botões desnecessários...
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f

echo 🔹 Otimizando e desfragmentando o disco...
defrag C: /O

echo.
echo ✅ Otimização concluída com sucesso!
echo ✅ Algumas configurações podem exigir reinicialização para surtir efeito.
pause
exit

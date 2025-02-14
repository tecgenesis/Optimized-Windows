@echo off
NET FILE >nul 2>&1 || (ECHO Execute este script como Administrador! && PAUSE && EXIT)

powershell -Command "Get-AppxPackage *Microsoft.XboxGameCallableUI* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.XboxGamingOverlay* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.XboxIdentityProvider* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage"

sc stop XblAuthManager 2>nul
sc config XblAuthManager start=disabled
sc stop XblGameSave 2>nul
sc config XblGameSave start=disabled
sc stop XboxNetApiSvc 2>nul
sc config XboxNetApiSvc start=disabled

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f
REG ADD "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f

powershell -Command "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage"

REG ADD "HKLM\Software\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f
taskkill /f /im "Widgets.exe" 2>nul
powershell -Command "Get-AppxPackage *MicrosoftWindows.Client.WebExperience* | Remove-AppxPackage"

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f

REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f

echo Concluído! Reinicie o computador para aplicar todas as alterações.
pause

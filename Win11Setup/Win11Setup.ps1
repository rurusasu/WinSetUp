Set-Location -Path C:\

# 作業ディレクトリを保持しつつ管理者としてPowershellスクリプトを実行する
# REF: https://www.delftstack.com/ja/howto/powershell/powershell-run-as-administrator/
if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        Start-Process PowerShell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
        Exit;
    }
}

# パッケージをアンインストールする
Get-AppxPackage -AllUsers C27EB4BA.DropboxOEM* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *MicrosoftTeams* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.DesktopAppInstaller* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.GetHelp* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.Getstarted* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.Messaging* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.Microsoft3DViewer* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.MSPaint | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.Office.OneNote* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.OneConnect* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.People* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.SkypeApp* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.WebMediaExtensions* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.WindowsCamera* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.Windows.Photos* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.WindowsMaps* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.Windows.HolographicFirstRun* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.Xbox* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.ZuneVideo* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *3D* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *bing* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *communi* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *HiddenCity* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *king.com.* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *MarchofEmpires* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Minecraft* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Mixed* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Netflix* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers NORDCURRENT.COOKINGFEVER* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *phone* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Spotify* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Twitter* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *WindowsAlarms* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Xbox* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *zune* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers Dolby* | Remove-AppxPackage -ErrorAction SilentlyContinue
# Cortana 
Get-AppxPackage -AllUsers *Microsoft.549981C3F5F10* | Remove-AppxPackage -ErrorAction SilentlyContinue
# Microsoft Edge Stable 
Get-AppxPackage -AllUsers *MicrosoftEdge.Stable* | Remove-AppxPackage -ErrorAction SilentlyContinue
# Microsoft.OneDrive
Get-AppxPackage -AllUsers *Microsoft.OneDrive | Remove-AppxPackage -ErrorAction SilentlyContinue
# Family
Get-AppxPackage -AllUsers *MicrosoftCorporationII.MicrosoftFamily* | Remove-AppxPackage -ErrorAction SilentlyContinue
# メモ帳
Get-AppxPackage -AllUsers *Microsoft.WindowsNotepad* | Remove-AppxPackage -ErrorAction SilentlyContinue
# クイックアシスト
Get-AppxPackage -AllUsers *MicrosoftCorporationII.QuickAssist* | Remove-AppxPackage -ErrorAction SilentlyContinue
# アプリインストーラ
Get-AppxPackage -AllUsers *Microsoft.DesktopAppInstaller* | Remove-AppxPackage -ErrorAction SilentlyContinue
# 電卓
Get-AppxPackage -AllUsers *Microsoft.WindowsCalculator* | Remove-AppxPackage -ErrorAction SilentlyContinue
# 付箋
Get-AppxPackage -AllUsers *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage -ErrorAction SilentlyContinue

pause
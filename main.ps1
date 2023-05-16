$scriptPath = $PSScriptRoot
Set-Location -Path $scriptPath

. .\Installer\PackageInstaller.ps1
. .\PrivacyAndSecurity\PrivacySecuritySetup.ps1
. .\Uninstaller\PackageUninstaller.ps1

# 作業ディレクトリを保持しつつ管理者としてPowershellスクリプトを実行する関数
function RunAsAdmin {
    if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
            Start-Process PowerShell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
            Exit;
        }
    }
}

# 管理者として実行する
RunAsAdmin

# アンインストールするパッケージのリストを取得
$uninstallPackageList = Get-Content -Path "$scriptPath\data\uninstall_list.json" | ConvertFrom-Json
# インストールするパッケージのリストを取得
$installPackageList = Get-Content -Path "$scriptPath\data\install_list.json" | ConvertFrom-Json
# プライバシーとセキュリティの設定のリストを取得
$securitySettingList = Get-Content -Path "$scriptPath\data\Privacy_Security.json" | ConvertFrom-Json

PackageUninstaller -uninstallPackageList $uninstallPackageList
PackageInstaller -installPackageList $installPackageList
PrivacySecurity -securitySettingList $securitySettingList


pause
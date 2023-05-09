# 実行中のスクリプトのパスを取得
# REF: https://qiita.com/heignamerican/items/a81a1f4de3e34b28d836
$scriptPath = $MyInvocation.MyCommand.Path
$parentPath = Split-Path -Parent $scriptPath
Set-Location -Path $parentPath
$setupData = Get-Content -Path "..\data\install_list.json" | ConvertFrom-Json

# 作業ディレクトリを保持しつつ管理者としてPowershellスクリプトを実行する
# REF: https://www.delftstack.com/ja/howto/powershell/powershell-run-as-administrator/
if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        Start-Process PowerShell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
        Exit;
    }
}

# 「パッケージをインストールする」と表示
Write-Host "Installing packages..." -ForegroundColor Yellow

# パッケージをインストールする
foreach ($key in $setupData.Sources.Packages) {
    $packageName = $key.PackageIdentifier
    winget install -e --id $packageName
}

pause
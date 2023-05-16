# 実行中のスクリプトのパスを取得
# REF: https://qiita.com/heignamerican/items/a81a1f4de3e34b28d836
$scriptPath = $MyInvocation.MyCommand.Path
$parentPath = Split-Path -Parent $scriptPath
Set-Location -Path $parentPath
$setupData = Get-Content -Path "..\data\uninstall_list.json" | ConvertFrom-Json

# 作業ディレクトリを保持しつつ管理者としてPowershellスクリプトを実行する
# REF: https://www.delftstack.com/ja/howto/powershell/powershell-run-as-administrator/
if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        Start-Process PowerShell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
        Exit;
    }
}

# コンピュータ上のすべてのユーザーアカウントからプリインストール/デフォルトアプリをすべて削除
# REF: [Windows 11のシステムアプリをPowerShellで削除する方法](https://www.tunesbro.jp/blog/how-to-remove-windows-11-system-apps-using-powershell.html)
Get-AppxPackage -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue

# パッケージをアンインストールする
foreach ($key in $setupData.Packages) {
    $packageId = $key.id
    $packageName = "*" + $key.name + "*"

    Write-Host "uninstalling Package Name:" $packageName -ForegroundColor Yellow
    Get-AppxPackage -AllUsers $packageId | Remove-AppxPackage -ErrorAction SilentlyContinue
    winget remove -e -h --purge --id $packageId
}

pause
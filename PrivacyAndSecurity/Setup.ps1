# 実行中のスクリプトのパスを取得
# REF: https://qiita.com/heignamerican/items/a81a1f4de3e34b28d836
$scriptPath = $MyInvocation.MyCommand.Path
$parentPath = Split-Path -Parent $scriptPath
Set-Location -Path $parentPath
$setupData = Get-Content -Path "..\data\Privacy_Security.json" | ConvertFrom-Json

Set-Location -Path C:\

# 作業ディレクトリを保持しつつ管理者としてPowershellスクリプトを実行する
# REF: https://www.delftstack.com/ja/howto/powershell/powershell-run-as-administrator/
if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        Start-Process PowerShell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
        Exit;
    }
}

# 「privacy & security の項目を変更する」と表示
Write-Host "Changing privacy & security settings..." -ForegroundColor Yellow

foreach ($key in $setupData.settings) {
    $regPath = $setupData.regPath
    $regName = $key.regName
    $Value = $key.Value
    if (!(Test-Path -Path $regPath)) {
        New-Item -Path $regPath -Force
        New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
    } else {
        if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
            New-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
        } else {
            Set-ItemProperty -Path $regPath -Name $regName -Value $Value -Type DWord -Force
        }
    }
}

pause
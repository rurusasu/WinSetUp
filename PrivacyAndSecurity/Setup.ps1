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

# privacy & securityの「位置情報サービス」項目を無効化する
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy"
$regName = "LetAppsAccessLocation"
if (!(Test-Path -Path $regPath)) {
    New-Item -Path $regPath -Force
    New-ItemProperty -Path $regPath -Name $regName -Value 2 -Type DWord -Force
} else {
    if (!(Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $regPath -Name $regName -Value 2 -Type DWord -Force
    } else {
        Set-ItemProperty -Path $regPath -Name $regName -Value 2 -Type DWord -Force
    }
}


pause
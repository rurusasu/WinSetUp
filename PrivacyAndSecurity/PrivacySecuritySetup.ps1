$scriptPath = $PSScriptRoot
Set-Location -Path $scriptPath

# 他のファイルを dot-sourcing する
..\Admin\RunAsAdmin.ps1
.\SetRegistry.ps1

# スクリプト本体の処理
$setupData = Get-Content -Path "$scriptPath\..\data\Privacy_Security.json" | ConvertFrom-Json

Set-Location -Path C:\

# 管理者として実行する
RunAsAdmin

# 「privacy & security の項目を変更する」と表示
Write-Output "Changing privacy & security settings..."

foreach ($key in $setupData.settings) {
    $regPath = $setupData.regPath
    $regName = $key.regName
    $Value = $key.Value
    # レジストリの操作を関数で行う
    SetRegistry -regPath $regPath -regName $regName -Value $Value
}

pause
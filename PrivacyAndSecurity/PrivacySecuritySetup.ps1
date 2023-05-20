function PrivacySecurity {
    param (
        [psobject]$securitySettingList
    )
    $scriptPath = $PSScriptRoot
    Set-Location -Path $scriptPath

    # 他のファイルを dot-sourcing する
    . .\SetRegistry.ps1

    # 「privacy & security の項目を変更する」と表示
    Write-Output "Changing privacy & security settings..."

    foreach ($key in $securitySettingList.settings) {
        $regPath = $securitySettingList.regPath
        $regName = $key.regName
        $Value = $key.Value
        # レジストリの操作を関数で行う
        SetRegistry -regPath $regPath -regName $regName -Value $Value
    }
}
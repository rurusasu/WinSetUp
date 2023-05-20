# レジストリの操作をする関数
function SetRegistry {
    param (
        [string]$regPath,
        [string]$regName,
        [int]$Value
    )
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
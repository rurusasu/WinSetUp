function PackageInstaller {
    param (
        [psobject]$installPackageList
    )
    $scriptPath = $PSScriptRoot
    Set-Location -Path $scriptPath

    # 他のファイルを dot-sourcing する
    . .\InstallPackage.ps1

    # 「パッケージをインストールする」と表示
    Write-Output "Installing packages..."

    # パッケージをインストールする
    foreach ($key in $setupData.Packages) {
        $packageId = $key.id
        $packageName = $key.name
        # パッケージのインストールを関数で行う
        InstallPackage -packageId $packageId -packageName $packageName
    }
}
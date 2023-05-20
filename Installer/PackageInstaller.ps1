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
    foreach ($key in $installPackageList.Packages) {
        $packageId = $key.id
        $packageName = $key.name
        # パッケージのインストールを関数で行う
        Write-Output "Package Name: $packageName"
        InstallPackage -packageId $packageId
    }
}
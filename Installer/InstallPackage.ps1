# パッケージをインストールする関数
function InstallPackage {
    param (
        [string]$packageId,
        [string]$packageName
    )
    Write-Output "Package Name: $packageName"
    winget install -e --id $packageId
}
# パッケージをインストールする関数
function InstallPackage {
    param (
        [string]$packageId
    )
    winget install -e -h --id $packageId
}
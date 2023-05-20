function PackageUninstaller {
    param (
        [psobject]$uninstallPackageList
    )
    # Remove all pre-installed/default apps from all user accounts
    # REF: [Windows 11のシステムアプリをPowerShellで削除する方法]
    # (https://www.tunesbro.jp/blog/how-to-remove-windows-11-system-apps-using-powershell.html)
    #Get-AppxPackage -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
    
    foreach ($key in $uninstallPackageList.appxPackage) {
        $packageName = $key.Name
        Write-Host "Removing Package Name:" $packageName -ForegroundColor Yellow
        Remove-AppxPackage -Package $packageName -AllUsers -ErrorAction SilentlyContinue
    }

    # Uninstall packages
    foreach ($key in $uninstallPackageList.winget) {
        $packageName = $key.name
        Write-Host "uninstalling Package Name:" $packageName -ForegroundColor Yellow
        # パッケージ名の前後にワイルドカードを付ける
        $packageName = "*" + $key.name + "*" 
        winget uninstall -e -h --purge --name $packageName
    }
}
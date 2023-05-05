$scriptPath = $MyInvocation.MyCommand.Path
$parentPath = Split-Path -Parent $scriptPath
Set-Location -Path $parentPath

$jsondata = Get-Content -Path "..\data\Privacy_Security.json" | ConvertFrom-Json

Write-Host $jsondata.settings
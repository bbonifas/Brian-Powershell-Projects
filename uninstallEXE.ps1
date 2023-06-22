$programName = "Discord"
$uninstallPath = "C:\Program Files (x86)\$programName\uninstall.exe"
$uninstallArgs = "/S"
if (Test-Path $uninstallPath) {
    Start-Process $uninstallPath $uninstallArgs -Wait
    Write-Output "Uninstalled $programName"
} else {
    Write-Output "$programName not found"
}

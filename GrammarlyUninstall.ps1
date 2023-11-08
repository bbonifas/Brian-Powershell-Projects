# Check if Grammarly Desktop is running and kill the task
$grammarlyProcess = Get-Process -Name Grammarly
if ($grammarlyProcess -ne $null) {
    Write-Host "Grammarly Desktop is running. Attempting to terminate the process..."
    $grammarlyProcess | ForEach-Object { Stop-Process -Id $_.Id -Force }
}

# Searches AppData for the Uninstall.exe file
$uninstallPath = Join-Path $env:LOCALAPPDATA "Grammarly\DesktopIntegrations\Uninstall.exe"

# Check if the Uninstall.exe exists
if (Test-Path $uninstallPath) {
    Write-Host "Uninstalling Grammarly Desktop..."
    # Start Uninstall.exe with --uninstall -s arguments and run minimized
    Start-Process -FilePath $uninstallPath -ArgumentList "--uninstall -s" -WindowStyle Minimized -Wait
    Write-Host "Grammarly Desktop has been uninstalled."
} else {
    Write-Host "Uninstall.exe not found in the Grammarly Desktop folder."
}

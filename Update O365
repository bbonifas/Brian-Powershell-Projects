# Close Office 365 Applications
#Can be used with any Office version that utilizes the Office Click to Run client
$officeApps = @("WINWORD", "EXCEL", "POWERPNT", "OUTLOOK", "MSACCESS", "MSPUB", "ONENOTE", "GROOVE", "LYNC")
foreach ($app in $officeApps) {
    $runningApps = Get-Process | Where-Object { $_.Name -eq $app }
    if ($runningApps) {
        Write-Host "Closing $app..."
        $runningApps | ForEach-Object { $_.CloseMainWindow() | Out-Null }
    }
}

# Wait for applications to close
$timeout = 30
$counter = 0
while ($counter -lt $timeout) {
    Start-Sleep -Seconds 1
    $runningApps = Get-Process | Where-Object { $officeApps -contains $_.Name }
    if (-not $runningApps) {
        Write-Host "All Office applications closed."
        break
    }
    $counter++
    if ($counter -eq $timeout) {
        Write-Host "Timeout occurred while waiting for applications to close."
    }
} cd "C:\Program Files\Common Files\Microsoft Shared\ClickToRun"
./OfficeC2RClient.exe /update user

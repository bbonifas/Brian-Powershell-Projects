# Define the paths to search for brave.exe
$bravePath1 = "C:\Program Files\BraveSoftware\Brave-Browser\Application\*\Installer\setup.exe"
$bravePath2 = "C:\Program Files (x86)\BraveSoftware\Brave-Browser\Application\*\Installer\setup.exe"

# Check if setup.exe exists in the default 64bit Installation path
if (Test-Path -Path $bravePath1 -PathType Leaf) {
    # If found, run the uninstall command
    Start-Process -FilePath "$bravePath1" -ArgumentList "--uninstall --system-level --force-uninstall" -Wait
    Write-Host "Uninstalling Brave Browser from $bravePath1"
}
# Check if setup.exe exists in the x86 Installation path
elseif (Test-Path -Path $bravePath2 -PathType Leaf) {
    # If found, run the uninstall command
    Start-Process -FilePath "$bravePath2" -ArgumentList "--uninstall --system-level --force-uninstall" -Wait
    Write-Host "Uninstalling Brave Browser from $bravePath2"
}
else {
    Write-Host "Brave Browser not found in the specified directories."
}

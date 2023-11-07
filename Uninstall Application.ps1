#Basic Powershell Uninstaller using a WMI query
$softwareName = "Insert Application Name in Quotes"

# Get the product information for SoftwareName
$product = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq $softwareName }

if ($product) {
    # Uninstall SoftwareName
    $product.Uninstall()

    Write-Host "$SoftwareName has been uninstalled."
} else {
    Write-Host "$SoftwareName is not found in the 'Add or Remove Programs' list."
}

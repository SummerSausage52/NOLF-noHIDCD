# Set the path to the target application
$targetAppPath = ".\NOLF.exe"

# Resolve the full path to the target application
$targetApp = Join-Path -Path (Get-Location) -ChildPath $targetAppPath
Write-Host "Resolved Path: $targetApp"
if (-Not (Test-Path $targetApp)) {
	Write-Error "Target application not found: $targetApp"
	exit
}

$deviceInstanceID = ""
if (-Not $deviceInstanceID) {
	Write-Error "The variable 'deviceInstanceID' is not defined. Please refer to the README.md file and provide the correct device instance ID."
	pause
    exit
}

# Disable the device
Write-Host "Disabling the HID-compliant device..."
Disable-PnpDevice -InstanceId $deviceInstanceID -Confirm:$false

# Verify if the device is disabled
$deviceStatus = Get-PnpDevice -InstanceId $deviceInstanceID | Select-Object -ExpandProperty Status
if ($deviceStatus -eq "Error") {
	Write-Host "Device disabled successfully. Current status: $deviceStatus"
} else {
	Write-Error "Failed to disable the device. Current status: $deviceStatus"
}

# Start the target application
Write-Host "Starting the target application..."
Start-Process $targetApp -PassThru | Wait-Process

# Re-enable the device
Write-Host "Re-enabling the HID-compliant device..."
Enable-PnpDevice -InstanceId $deviceInstanceID -Confirm:$false

# Verify if the device is enabled
$deviceStatus = Get-PnpDevice -InstanceId $deviceInstanceID | Select-Object -ExpandProperty Status
if ($deviceStatus -eq "OK") {
	Write-Host "Device re-enabled successfully. Current status: $deviceStatus"
} else {
	Write-Error "Failed to re-enable the device. Current status: $deviceStatus"
}

Write-Host "Script completed successfully."

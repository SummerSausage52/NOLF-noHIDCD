# Request elevation and run .\noHIDCD.ps1 with administrator privileges

# Check if the script is running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Relaunch the script with elevated privileges
    $scriptPath = (Get-Item -Path ".\noHIDCD.ps1").FullName
    Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs
    exit
}

# Place your script logic here if needed
Write-Host "Running .\noHIDCD.ps1 with administrator privileges."

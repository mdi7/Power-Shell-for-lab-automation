# Remote Desktop Automation Script

# Define the remote computer's hostname or IP address
$remoteComputer = "192.168.1.100" # Replace with the target computer's address

# Optional: Specify credentials if required
$credential = Get-Credential

# Launch Remote Desktop Connection (RDP)
Start-Process "mstsc.exe" -ArgumentList "/v:$remoteComputer /admin"

Write-Output "Remote Desktop session launched for $remoteComputer."

# Remote Shutdown Tool Script

# Define target computer name or IP address
$remoteComputer = "192.168.1.100" # Replace with the target computer's IP or hostname

# Specify credentials (if required)
$credential = Get-Credential

# Confirm action with the user
$confirmation = Read-Host "Are you sure you want to shut down $remoteComputer? (Yes/No)"
if ($confirmation -ne "Yes") {
    Write-Output "Shutdown operation canceled."
    exit
}

# Execute shutdown command remotely
try {
    Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock {
        Stop-Computer -Force
    }
    Write-Output "Shutdown command sent successfully to $remoteComputer."
}
catch {
    Write-Output "Failed to execute shutdown on $remoteComputer. Error: $_"
}

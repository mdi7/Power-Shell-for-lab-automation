# Patch Management Tool Script

# Import the Update Module
Import-Module PSWindowsUpdate

# Check for Available Updates
Write-Output "Checking for available updates..."
$updates = Get-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot

if ($updates) {
    Write-Output "Available Updates:"
    $updates | ForEach-Object {
        Write-Output "Title: $($_.Title)"
        Write-Output "KB: $($_.KBArticleIDs -join ', ')"
        Write-Output "Size: $($_.Size) MB"
        Write-Output "-----------------------------------"
    }
} else {
    Write-Output "No updates available."
}

# Install Updates
Write-Output "Installing updates..."
Install-WindowsUpdate -AcceptAll -IgnoreReboot -Verbose

# Post-Installation Actions
Write-Output "Updates installed successfully."

# Check if a reboot is required
if (Test-PendingReboot) {
    Write-Output "System reboot is required to complete the updates."
    Restart-Computer -Force
} else {
    Write-Output "No reboot required."
}

# Log the updates installed
$logFile = "C:\PatchManagement\UpdateLog_$(Get-Date -Format 'yyyyMMdd').txt"
$updates | Out-File -FilePath $logFile
Write-Output "Log saved at: $logFile"

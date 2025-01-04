# Backup Validation Script

# Define paths for the source and backup files
$sourceFile = "C:\SourceFolder\data.bak" # Replace with the source file path
$backupFile = "D:\BackupFolder\data.bak" # Replace with the backup file path

# Validate if both files exist
if (!(Test-Path $sourceFile)) {
    Write-Output "Source file not found: $sourceFile"
    exit
}

if (!(Test-Path $backupFile)) {
    Write-Output "Backup file not found: $backupFile"
    exit
}

# Calculate hashes for both files
Write-Output "Calculating hash for source file..."
$sourceHash = Get-FileHash -Path $sourceFile -Algorithm SHA256
Write-Output "Source Hash: $($sourceHash.Hash)"

Write-Output "Calculating hash for backup file..."
$backupHash = Get-FileHash -Path $backupFile -Algorithm SHA256
Write-Output "Backup Hash: $($backupHash.Hash)"

# Compare hashes
if ($sourceHash.Hash -eq $backupHash.Hash) {
    Write-Output "Backup validation successful. Files match."
} else {
    Write-Output "Backup validation failed. Files do not match."
}

# Optional: Log the results
$logFile = "C:\BackupValidationLogs\ValidationLog_$(Get-Date -Format 'yyyyMMdd').txt"
New-Item -ItemType Directory -Force -Path "C:\BackupValidationLogs" | Out-Null
Write-Output "Validation log saved at: $logFile"
Add-Content -Path $logFile -Value "Source File: $sourceFile"
Add-Content -Path $logFile -Value "Backup File: $backupFile"
Add-Content -Path $logFile -Value "Source Hash: $($sourceHash.Hash)"
Add-Content -Path $logFile -Value "Backup Hash: $($backupHash.Hash)"
Add-Content -Path $logFile -Value "Validation Result: $(if ($sourceHash.Hash -eq $backupHash.Hash) {'Success'} else {'Failed'})"

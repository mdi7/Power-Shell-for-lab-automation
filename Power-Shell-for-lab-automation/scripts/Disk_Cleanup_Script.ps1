# Disk Cleanup Script

# Define cleanup paths
$tempPaths = @(
    "C:\Windows\Temp",
    "C:\Users\*\AppData\Local\Temp",
    "C:\Windows\Prefetch",
    "C:\Recycle.Bin"
)

# Log file path
$logFile = "C:\DiskCleanupLogs\CleanupLog_$(Get-Date -Format 'yyyyMMdd').txt"
New-Item -ItemType Directory -Force -Path "C:\DiskCleanupLogs" | Out-Null

# Function to clean up files
function Cleanup-Files {
    param([string]$path)

    if (Test-Path $path) {
        Get-ChildItem -Path $path -Recurse -Force | ForEach-Object {
            try {
                Remove-Item $_.FullName -Force -Recurse -ErrorAction Stop
                Write-Output "Deleted: $($_.FullName)" | Out-File -Append -FilePath $logFile
            }
            catch {
                Write-Output "Failed to delete: $($_.FullName). Error: $_" | Out-File -Append -FilePath $logFile
            }
        }
    } else {
        Write-Output "Path not found: $path" | Out-File -Append -FilePath $logFile
    }
}

# Start cleanup
Write-Output "Disk Cleanup Started at $(Get-Date)" | Out-File -Append -FilePath $logFile
foreach ($path in $tempPaths) {
    Cleanup-Files -path $path
}

# Clear Windows Update cache
Write-Output "Clearing Windows Update Cache..." | Out-File -Append -FilePath $logFile
Stop-Service -Name wuauserv -Force
Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Force -Recurse
Start-Service -Name wuauserv
Write-Output "Windows Update Cache Cleared." | Out-File -Append -FilePath $logFile

# Disk Cleanup Utility for system files
Write-Output "Running Disk Cleanup Utility..." | Out-File -Append -FilePath $logFile
Start-Process cleanmgr.exe -ArgumentList "/sagerun:1" -NoNewWindow -Wait

Write-Output "Disk Cleanup Completed at $(Get-Date)" | Out-File -Append -FilePath $logFile
Write-Output "Log saved at: $logFile"

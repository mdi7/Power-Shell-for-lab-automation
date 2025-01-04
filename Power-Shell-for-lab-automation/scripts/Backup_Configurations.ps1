# Backup Configurations
$source = "\\Device\Configs"
$destination = "C:\Backups\$(Get-Date -Format 'yyyyMMdd')"
Copy-Item -Path $source -Destination $destination -Recurse
Write-Output "Backup Completed: $destination"

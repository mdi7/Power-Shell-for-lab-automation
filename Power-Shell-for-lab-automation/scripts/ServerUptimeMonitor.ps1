# Server Uptime Monitor Script

# Define the remote server name or IP address
$serverName = "RemoteServer" # Replace with your server name or IP address

# Retrieve the last boot-up time
try {
    $uptime = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $serverName -ErrorAction Stop | 
              Select-Object @{Name="Uptime"; Expression={(Get-Date) - $_.LastBootUpTime}}

    # Display the uptime
    Write-Output "Server '$serverName' Uptime: $($uptime.Uptime.Days) Days, $($uptime.Uptime.Hours) Hours, $($uptime.Uptime.Minutes) Minutes"
}
catch {
    Write-Output "Failed to retrieve uptime for server '$serverName'. Error: $_"
}

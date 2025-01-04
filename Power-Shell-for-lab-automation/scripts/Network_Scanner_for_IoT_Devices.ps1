# Network Scanner
1..254 | ForEach-Object {
    $ip = "192.168.1.$_"
    Test-Connection -ComputerName $ip -Count 1 -Quiet | Where-Object { $_ -eq $true } | ForEach-Object {
        Write-Output "$ip is active"
    }
}

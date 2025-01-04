# Port Scan
$ports = 1..1024
foreach ($port in $ports) {
    $test = Test-NetConnection -ComputerName "192.168.1.10" -Port $port
    if ($test.TcpTestSucceeded) {
        Write-Output "Open Port: $port"
    }
}

# Health Monitoring
$resource = "TCPIP0::192.168.1.100::INSTR"
$device = New-Object Visa.InstrumentSession($resource)
$device.Write("*ESR?")  # Query event status register
$status = $device.ReadString()
Write-Output "Device Status: $status"

# SNMP Data Collector
$ip = "192.168.1.100"
$community = "public"
$oid = "1.3.6.1.2.1.1.1.0"  # System Description OID
$snmpData = Get-SnmpData -ComputerName $ip -CommunityString $community -OID $oid
Write-Output $snmpData

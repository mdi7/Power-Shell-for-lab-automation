# SSL Expiry Checker
$cert = Get-ChildItem -Path Cert:\LocalMachine\My
foreach ($c in $cert) {
    Write-Output "Cert: $($c.Subject) expires on $($c.NotAfter)"
}

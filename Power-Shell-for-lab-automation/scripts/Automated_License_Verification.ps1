# License Verification
$device = "192.168.1.101"
$licenseKey = Invoke-RestMethod -Uri "http://$device/api/license"
Write-Output "License Key: $licenseKey"

# Compliance Checker
$settings = Get-Content -Path "compliance_config.json" | ConvertFrom-Json
$devices = Get-PnpDevice
foreach ($device in $devices) {
    if ($device.Name -notin $settings.AllowedDevices) {
        Write-Output "Non-compliant Device: $($device.Name)"
    }
}

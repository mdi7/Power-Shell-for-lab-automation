# Firmware Update Script
$devices = Get-PnpDevice -FriendlyName "*Rohde*"
foreach ($device in $devices) {
    $path = "C:\FirmwareUpdates\DeviceFirmware.bin"
    Copy-Item -Path $path -Destination "\\$($device.Name)\Firmware"
    Write-Output "Firmware updated for $($device.Name)"
}

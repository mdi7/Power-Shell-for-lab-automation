# Log Analyzer
$logs = Get-Content -Path "C:\Logs\device.log"
$errors = $logs | Select-String -Pattern "ERROR"
$errors | Out-File "error_report.txt"

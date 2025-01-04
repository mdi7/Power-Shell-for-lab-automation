# Connect to Rohde & Schwarz Instrument
$visaResource = "TCPIP0::192.168.1.100::INSTR"  # Replace with your device IP
Add-Type -Path "C:\Path\To\Visa.NET.dll"       # Load VISA library
$session = New-Object Visa.InstrumentSession($visaResource)
$session.Write("*IDN?")                        # Query identity
$response = $session.ReadString()
Write-Output $response	
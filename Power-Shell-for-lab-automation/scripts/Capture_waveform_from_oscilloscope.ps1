# Capture waveform from oscilloscope
$visaResource = "TCPIP0::192.168.1.200::INSTR"
$osc = New-Object Visa.InstrumentSession($visaResource)
$osc.Write(":WAV:FORM ASC") # Set waveform format
$osc.Write(":WAV:DATA?")   # Query waveform data
$data = $osc.ReadString()
Set-Content -Path "waveform_data.csv" -Value $data

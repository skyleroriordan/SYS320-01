clear

Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "IPEnabled = TRUE" | select DHCPServer
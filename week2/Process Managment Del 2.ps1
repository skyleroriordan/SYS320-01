clear

Get-CimInstance Win32_Process |
Where-Object { $_.ExecutablePath -inotlike "*system32*" }
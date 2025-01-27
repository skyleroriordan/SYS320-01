clear

Get-WmiObject -List | Where-Object { $_.Name -like "win32_Net*" } | Sort-Object Name
clear

Get-WmiObject -List | Where-Object { $_.Name -ilike "win32_Net*" }
﻿clear

(Get-DnsClientServerAddress -AddressFamily IPv4 | 
Where-Object { $_.InterfaceAlias -ilike "Ethernet*" }).ServerAddresses[0]
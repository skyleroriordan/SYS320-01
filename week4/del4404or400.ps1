﻿clear

Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 ',' 400 '
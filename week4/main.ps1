
﻿. (Join-Path $PSScriptRoot Apache-Logs.ps1)
. (Join-Path $PSScriptRoot parse.ps1)

clear

#Get-ApacheLogs index.html 200 chrome

$tableRecords = ApacheLogs1
$tableRecords | Format-Table -AutoSize -Wrap


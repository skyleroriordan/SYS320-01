<<<<<<< HEAD
﻿. (Join-Path $PSScriptRoot Apache-Logs.ps1)
. (Join-Path $PSScriptRoot parse.ps1)

clear

#Get-ApacheLogs index.html 200 chrome

$tableRecords = ApacheLogs1
$tableRecords | Format-Table -AutoSize -Wrap
=======
﻿. (Join-Path $PSScriprtRoot Apache-Logs.ps1)

clear

Get-ApacheLogs index.html 200 chrome
>>>>>>> 95759f8b074b243b36453ade1155ce849b8b6b4c

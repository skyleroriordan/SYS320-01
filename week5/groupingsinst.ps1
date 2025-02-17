. (Join-Path $PSScriptRoot gatherclassfunc.ps1)

$FullTable | Where-Object {$_.Instructor -in $ITSInstructors.Instructor } |
             Group-Object "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending


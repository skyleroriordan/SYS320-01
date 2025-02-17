. (Join-Path $PSScriptRoot gatherclassfunc.ps1)

$FullTable | Where-Object { ($_.Location -ilike "JOYC 310") -and ($_.Days -ilike "Monday") } |
             Sort-Object -Property "Time Start" |
             Select-Object -Property "Time Start", "Time End", "Class Code"
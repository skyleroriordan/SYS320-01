. (Join-Path $PSScriptRoot gatherclassfunc.ps1)

$FullTable | select "Class Code", Instructor, Location, Days, "Time Start", "Time End" |
         where { $_."Instructor" -ilike "Furkan Paligu" }
. (Join-Path $PSScriptRoot gatherclassfunc.ps1)
$ITSInstructors = $FullTable | Where-Object { ($_."Class Code" -ilike "SYS*") -or
                                             ($_."Class Code" -ilike "NET*") -or
                                             ($_."Class Code" -ilike "SEC*") -or
                                             ($_."Class Code" -ilike "FOR*") -or
                                            ($_."Class Code" -ilike "CSI*") -or
                                            ($_."Class Code" -ilike "DAT*") } | 
                              Sort-Object "Instructor" |
                              Select-Object "Instructor" -Unique

$ITSInstructors

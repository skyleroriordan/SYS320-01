clear

Function Get-StartupShutdownEvents {
    param (
        [Parameter(Mandatory=$true)]
        [int]$Days
        )

$startshutdowns = Get-EventLog -LogName System -After (Get-Date).AddDays(-$Days) |
Where-Object {$_.EventID -in 6005, 6006}

$startshutdownstable = @()

for ($i = 0; $i -lt $startshutdowns.Count; $i++) {

$event = ""
if($startshutdowns[$i].EventID -eq 6005) {$event = "start"}
if($startshutdowns[$i].EventID -eq 6006) {$event = "shutdown"}

$startshutdownstable += [PSCustomObject]@{
        "Time" = $startshutdowns[$i].TimeGenerated
        "Id" = $startshutdowns[$i].EventID
        "Event" = $event
        "User" = "System"
        }
    }
    return $startshutdownstable
}

$results = Get-StartupShutdownEvents -Days 25
$results

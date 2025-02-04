Function Get-LogonLogoff {
    param(
        [Parameter(Mandatory=$true)]
        [int]$Days
    )

$loginouts = Get-Eventlog system -source Microsoft-Windows-winlogon -After (Get-Date).AddDays(-$Days)

$loginoutsTable = @()
for($i=0; $i -lt $loginouts.Count; $i++){

$event = ""
if($loginouts[$i].InstanceId -eq 7001) {$event="Logon"}
if($loginouts[$i].InstanceId -eq 7002) {$event="Logoff"}




.Security.Principal.SecurityIdentifier($userSID)
$user = $blah.Translate([System.Security.Principal.NTAccount])

$loginoutsTable += [PSCustomObject]@{"Time" = $loginouts[$i].TimeGenerated
                                       "Id" = $loginouts[$i].InstanceId
                                     "Event"= $event;
                                     "User" = $user;
                                    }
}

return $loginoutsTable
}


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
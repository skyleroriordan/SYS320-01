clear

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

$userSID = $loginouts[$i].ReplacementStrings[1] 
$sidObj = New-Object System.Security.Principal.SecurityIdentifier($userSID)
$user = $blah.Translate([System.Security.Principal.NTAccount])

$loginoutsTable += [PSCustomObject]@{"Time" = $loginouts[$i].TimeGenerated
                                       "Id" = $loginouts[$i].InstanceId
                                     "Event"= $event;
                                     "User" = $user;
                                    }
}

return $loginoutsTable
}

$results = Get-LogonLogoff -Days 20
$results


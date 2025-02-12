clear

function Get-ApacheLogs {
    [CmdLetBinding()]
    param(
        [parameter(Mandatory=$true)]
        [string]$Page,

        [Parameter(Mandatory=$true)]
        [int]$HttpCode,

        [Parameter(Mandatory=$true)]
        [string]$Browser
    )

$logPath = "C:\xampp\apache\logs\access.log"

$logs = Get-Content -Path $logPath

$filterdLines = $logs | Where-Object {
    ($_ -match $Page) -and
    ($_ -match $HttpCode) -and
    ($_ -match $Browser)
    }

$results = foreach ($line in $filterdLines) {
    if ($line -match '^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})') {
    [PSCustomObject]@{
        IP = $matches[1]
        }
    }
}

$results | Select-Object -Unique IP
}

. (Join-Path $PSScriptRoot parse.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot String-Helper.ps1)

clear

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display last 10 Apache logs`n"
$Prompt += "2 - Display last 10 failed logins for all users`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Start Chrome and go to champlain.edu`n"
$Prompt += "5 - Exit`n"


$operartion = $true

while($operation){
    
    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if($choice -eq 1){
    ApacheLogs1 | Select-Object -Last 10
    }

    elseif($choice -eq 2){
    getFailedLogins 90 | Select-Object -First 10
    }

    elseif($choice -eq 3){
    getAtRiskUsers 90
    }

    elseif($choice -eq 4){
    if(-not (Get-Process chrome -ErrorAction SilentlyContinue)){
    Start-Process "chrome.exe" "https://www.champlain.edu"
    }
    else {
        Write-Host "Chrome already running"
    }
    }

    elseif($choice -eq 5){
    Write-Host "goodbye" | Out-String
    exit
    $operation = $false
    }

    else {
    Write-Host "Invalid choice"
    }
}
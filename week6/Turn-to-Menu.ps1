. (Join-Path $PSScriptRoot Apache-Logs.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)

clear

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display last 10 Apache logs`n"
$Prompt += "2 - Display last 10 failed logins for all users`n"
$Prompt += "3 - Display at risk user`n"
$Prompt += "4 - Start Chrome and go to champlain.edu`n"
$Prompt += "5 - Exit'n"

$operartion = $true

while($operation){
    
    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if($choice -eq 1){
    Get-ApacheLogs -tail 10
    }

    elseif($choice -eq 2){
    

clear

function configurationMenu(){
$Prompt = "`n"
$Prompt += "choose an option`n"
$Prompt += "1 - show configuration`n"
$Prompt += "2 - change configutation`n"
$Prompt += "3 - exit`n"
}

function readConfiguration(){
    $configs = Get-Content -Path "C:\Users\champuser\SYS320-01\week7\configuration.txt"
    $table = @()
    $table += [PSCustomObject]@{
        Days = $configs[0];
        ExecutionTime = $configs[1]
    }
    return $table
}

function changeConfiguration(){
    do {
    $newdays = Read-Host "Enter number of days for logs"
    if($newdays -notmatch "^\d+$"){
    Write-Host "Invalid Input" 
    }
    } while($newdays -notmatch "^\d+$")

    do {
    $newtime = Read-Host "Enter the daily execution time"
    if($newtime -notmatch "^(0?\d|1[0-2]):([0-5]\d)\s(AM|PM)$"){
    Write-Host "Invalid Input"
    }
    } while ($newtime -notmatch "^(0?\d|1[0-2]):([0-5]\d)\s(AM|PM)$")

    $newdays | Out-File "C:\Users\champuser\SYS320-01\week7\configuration.txt"
    $newtime | Out-File  "C:\Users\champuser\SYS320-01\week7\configuration.txt" -Append
    Write-Host "configured"
 }  

function run {
    $operartion = $true
    while($operartion){
    configurationMenu

    Write-Host $Prompt | Out-String
    $choice = Read-Host
    
    if($choice -eq 1){
    $readconfig = readConfiguration
    Write-Host ($readconfig | Format-Table | Out-string)
    }

    elseif($choice -eq 2){
    changeConfiguration
    }

    elseif($choice -eq 3){
    Write-Host "bye" | Out-String
    exit
    $operation = $false
    }

    else {
    Write-Host "Invalid input"
    }
}
}
#run

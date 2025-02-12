﻿clear

function ApacheLogs1(){
$logNotformatted = Get-Content C:\xampp\apache\logs\access.log
$tableRecords = @()

for ($i=0; $i -lt $logNotformatted.Count; $i++){

$words = $logNotformatted[$i].Split(" ");

$tableRecords += New-Object PSObject -Property @{ 
                                   "IP" = $words[0];
                                   "Time" = $words[3].TrimStart('[').TrimEnd('}'); 
                                   "Method" = $words[5].Trim('"'); 
                                   "Page" = $words[6];
                                   "Protocol" = $words[7];
                                   "Response" = $words[8];
                                   "Referrer"= $words[10].Trim('"');
                                   "Client" = $words[11..($words.Length - 1)]; }
}
return $tableRecords | Where-Object { $_.IP -match "10.*" }
}
$tableRecords = ApacheLogs1
$tableRecords | Format-Table -AutoSize -Wrap


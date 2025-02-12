clear

$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '

$regex = [regex] "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b"

$ipsUnorganized = $regex.match($notfounds)

$ips = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
 $ips += [PSCustomObject]@{ "IP" = $ipsUnorganized[$i].value; }
 }
$ipoftens = $ips | Where-Object { $_.IP -ilike "10.*" }
$counts = $ipoftens | Group-Object -Property IP
$counts | Select-Object Count, Name
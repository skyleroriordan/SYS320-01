clear

$A = Get-ChildItem *.log | Select-String 'error'
$A[-5..-1]

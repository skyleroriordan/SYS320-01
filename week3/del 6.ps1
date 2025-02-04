. (Join-Path $PSScriptRoot 'functions.ps1')

clear

$loginoutsTable = Get-LogonLogoff -Days 15
$loginoutsTable

$startupShutdownResults = Get-StartupShutdownEvents -Days 25
$startupShutdownResults
. "C:\Users\champuser\SYS320-01\week7\Event-Logs2.ps1"
. "C:\Users\champuser\SYS320-01\week7\Email.ps1"
. "C:\Users\champuser\SYS320-01\week7\configuration.ps1"
. "C:\Users\champuser\SYS320-01\week7\Scheduler.ps1"

$configuration = readConfiguration

$Failed = getAtRiskUsers $configuration.Days

SendAlertEmail ($Failed | Format-Table | Out-String)

ChooseTimeToRun($configuration.ExecutionTime)

function SendAlertEmail($Body){

$From = "skyler.oriordan@mymail.champlain.edu"
$To = "skyler.oriordan@mymail.champlain.edu"
$Subject = "Suspicious Activty"

$Password = "zsyo gogs rhmu fbxz" | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" -port 587 -UseSsl -Credential $Credential
}

#SendAlertEmail "Body of email"

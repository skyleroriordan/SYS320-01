#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session" | grep -v "lightdm")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
 echo "$dateAndUser"
}

function getFailedLogins(){
 failedLines=$(cat "$authfile" | grep "authentication failure")
 failDateAndUser=$(echo "$failedLines" | cut -d ' ' -f1,2,16 | sed "s/user=//g")
 echo "$failDateAndUser"
}

# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test

# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To: skyler.oriordan@mymail.champlain.edu" > emailform.txt
echo "Subject: Logins" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp skyler.oriordan@mymail.champlain.edu

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 

echo "To: skyler.oriordan@mymail.champlain.edu" > emailform_fail.txt
echo "Subject: Failed Logins" >> emailform_fail.txt
getFailedLogins >> emailform_fail.txt
cat emailform_fail.txt | ssmtp skyler.oriordan@mymail.champlain.edu

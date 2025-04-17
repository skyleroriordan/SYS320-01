#!/bin/bash

echo "File was accessed $(date +'%a %b %d %I-%M-%S %p')" >> /home/champuser/SYS320-01/week13/fileaccesslog.txt

echo "To: skyler.oriordan@mymail.champlain.edu" > /home/champuser/SYS320-01/week13/mailbody.txt
echo "Subject: Access" >> /home/champuser/SYS320-01/week13/mailbody.txt
cat /home/champuser/SYS320-01/week13/fileaccesslog.txt >> /home/champuser/SYS320-01/week13/mailbody.txt

cat /home/champuser/SYS320-01/week13/mailbody.txt | ssmtp skyler.oriordan@mymail.champlain.edu

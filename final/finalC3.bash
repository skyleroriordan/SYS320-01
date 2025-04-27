#!/bin/bash
 
 output="/var/www/html/report.html"
 
 {
   echo "<html>"
   echo "<body>"
   echo "<h3>Access logs with IOC indicators:</h3>"
   echo "<table border=1>"
 
   while read -r ip datetime page; do
      echo "<tr><td>$ip</td><td>$datetime</td><td>$page</td></tr>"
   done < report.txt
 
   echo "</table>"
   echo "</body>"
   echo "</html>"
 } > "$output"

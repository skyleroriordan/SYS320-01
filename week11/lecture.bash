#!/bin/bash

allLogs=""
file="/var/log/apache2/access.log"


function getAllLogs(){
allLogs=$(cat "$file" | cut -d' ' -f1,4,7 | tr -d "[")
}

function ips(){
ipsAccessed=$(echo "$allLogs" | cut -d' ' -f1)
}

function pageCount(){
pages=$(echo "$allLogs" | cut -d' ' -f3 | sort | uniq -c | sort -nr)
}

function countingCurlAccess(){
curls=$(cat "$file" | grep curl | cut -d' ' -f1,12 | sort | uniq -c)
}

countingCurlAccess
echo "$curls"

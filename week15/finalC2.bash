#!/bin/bash
logfile="$1"
iocfile="$2"
outputfile="report.txt"

> "$outputfile"

while read -r ioc; do
    grep "$ioc" "$logfile" | while read -r line; do
	ip=$(echo "$line" | cut -d' ' -f1)
	datetime=$(echo "$line" | cut -d' ' -f4 | tr -d '[]')
	page=$(echo "$line" | cut -d' ' -f7)
	echo "$ip $datetime $page"  >> "$outputfile"
    done
done < "$iocfile"

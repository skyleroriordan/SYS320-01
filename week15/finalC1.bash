#!/bin/bash

url="http://10.0.17.6/IOC.html"

output="IOC.txt"

curl -s "$url" | grep -oP '(?<=<td>).*?(?=<\/td>)' | sed 'n; d' > "$output"

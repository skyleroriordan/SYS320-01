#!/bin/bash

link="10.0.17.6/Assignment.html"

fullPage=$(curl -sL "$link")

temperatures=$(
echo "$fullPage" | \
xmlstarlet select --html --recover --template \
 --match '(//table)[1]/tr[position()>1]' \
 --value-of 'td[1]' --nl
)

pressures=$(
echo "$fullPage" | \
xmlstarlet select --html --recover --template \
 --match '(//table)[2]/tr[position()>1]' \
 --value-of 'td[1]' --nl
)

datetimes=$(
echo "$fullPage" | \
xmlstarlet select --html --recover --template \
 --match '(//table)[1]/tr[position()>1]' \
 --value-of 'td[2]' --nl
)

rows=$(echo "$temperatures" | wc -l)

for (( i=1; i<=rows; i++ )); do
    pres=$(echo "$pressures"    | head -n "$i" | tail -n 1)
    temp=$(echo "$temperatures" | head -n "$i" | tail -n 1)
    time=$(echo "$datetimes"    | head -n "$i" | tail -n 1)

    echo "$pres $temp $time"
done



#!/bin/bash
file="$1"
lines=$(wc -l < "$file")
counter=0
line=1
while [ $counter -lt $lines ]; do
    let line=(1 + $RANDOM % $lines)
    let counter=counter+1
    sed -i $line's/^.*$/& /' "$file"
done

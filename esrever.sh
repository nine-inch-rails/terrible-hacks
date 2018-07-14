#!/bin/bash
File=$1
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo $line | rev >> "temp"
done < "$File"
cat "temp" > $File
rm "temp"

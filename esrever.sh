#!/bin/bash
file="$1"
temp="$(mktemp)"
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo $line | rev >> "$temp"
done < "$file"
mv "$temp" "$file"

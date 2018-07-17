#!/bin/bash

filename=$1
lines=$(wc -l < $filename)
flag=0
repword=""
while [ $flag -eq 0 ]; do
    for word in $(<$filename)
    do
        if (( $RANDOM % $lines == 0 )); then
            repword=${word//[$]/}
            index=$(expr match $repword '^[a-zA-Z][a-zA-Z0-9]*')
            if [[ $index -gt 0 ]]; then
                repword=$(expr substr $repword 1 $index)
            fi
        fi
    done

    echo $repword
    torep=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
    type "$repword" &>> /dev/null
    if [ $? == 1 ]; then
        flag=1
        sed -i 's/'$repword'/'$torep'/g' "$filename"
    fi
done

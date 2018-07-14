#!/bin/bash

filename=$1
repword=""
lines=$(wc -l < $filename)
flag=0
while [ $flag -eq 0 ]; do
    for word in $(<$filename)
    do
        if (( $RANDOM % $lines == 0 )); then
            repword=${word//[$]/}
        fi
    done

    echo $repword
    torep=""
    type "$repword" &>> /dev/null
    if [ $? == 1 ]; then
        flag=1
        tempfileasdf=$(mktemp)
        torep=${repword^^}
        torep=${torep,}
        sed -i 's/'$repword'/'$torep'/g' "$filename" | tee $tempfileasdf
    fi
done

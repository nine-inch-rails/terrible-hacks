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
            index=$(expr match $repword '^.*=')
            index=$(expr $index - 1)
            if [[ $index -gt 0 ]]; then
                repword=$(expr substr $repword 1 $index)
            fi
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

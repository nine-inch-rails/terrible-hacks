#!/bin/bash

filename=$1
repword=""
lines=$(wc -l < $filename)
for word in $(<$filename)
do
    if (( $RANDOM % $lines == 0 )); then
        repword=${word//[$]/}
    fi
done

torep=""
type $repword &> /dev/null
if [ $? == 1 ]; then
    tEMPFILEASDF=$(mktemp)
    torep=${repword^^}
    torep=${torep,}
    sed -i 's/'$repword'/'$torep'/g' "$filename" | tee $tEMPFILEASDF
fi

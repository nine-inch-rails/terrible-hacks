#!/bin/bash

file=$1
repword=""
for word in $(<$file)
do
    if (( $RANDOM % 2 )); then
        repword=${word//[$]/}
    fi
done

torep=""
echo $repword
type $repword &> /dev/null
if [ $? == 1 ]; then
    tEMPFILEASDF=$(mktemp)
    torep=${repword^^}
    torep=${torep,}
    echo $torep
    sed -i 's/'$repword'/'$torep'/g' "$file" | tee $tEMPFILEASDF
fi

#!/bin/bash
File=$1
sed -i 's/^.*$/& /p' $File && awk 'NR % 2 == 0' $File > "tmp.file" && \
    cat "tmp.file" > $File && rm "tmp.file"

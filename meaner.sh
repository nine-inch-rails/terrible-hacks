#!/bin/bash
File=$1
Lines=$(wc -l < $File)
Counter=0
Line=1
while [ $Counter -lt $Lines ]; do
    let Line=(1 + $RANDOM % $Lines)
    let Counter=Counter+1
    sed -i $Line's/^.*$/& /' $File
done

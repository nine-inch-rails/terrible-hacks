#!/bin/bash
File=$1
sed -i 's/^.*$/& /' $File

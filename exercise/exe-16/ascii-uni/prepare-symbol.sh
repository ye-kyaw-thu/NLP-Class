#!/bin/bash

# for preparing input and output symbol files
# Written by Ye Kyaw Thu, LST Lab., NECTEC, Thailand
# How to run:
# e.g. ./prepare-symbol.sh ./ascii.txt > ascii.sym
# e.g. ./prepare-symbol.sh ./uni.txt > ./uni.sym

echo -e "Ɛ\t0";
echo -e "\\s\t1";
awk 'BEGIN{i=2} /.*/{printf "%s\t%d\n",$0,i; i++}' $1;



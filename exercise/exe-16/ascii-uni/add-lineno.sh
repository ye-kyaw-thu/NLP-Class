#!/bin/bash

# how to run:
# e.g. ./add-lineno.sh ./ascii.txt > ascii.sym
# e.g. ./add-lineno.sh ./uni.txt > ./uni.sym

echo -e "Ɛ\t0";
awk 'BEGIN{i=1} /.*/{printf "%s\t%d\n",$0,i; i++}' $1;

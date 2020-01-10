#!/bin/bash

# prepare one input sentence
# Written by Ye Kyaw Thu, LST Lab., NECTEC, Thailand
# how to run:
# ./prepare-input.sh input.txt > input.fsa.txt

# cut only file basename without file extension
fbasename=$(basename "$1" | cut -d. -f1)

./print-char.sh ./$1 > $fbasename.char
perl ./add-prefix-add.pl $fbasename.char



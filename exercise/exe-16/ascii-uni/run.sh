#!/bin/bash

# Demo shell script code of Kayah ASCII to Unicode font conversion
# Last updated: 10 Jan 2020
# Written by Ye Kyaw Thu, LST Lab., NECTEC, Thailand
# How to run: ./run.sh

# you have to prepare a mapping table between ASCII and Unicode manually
# for Kayah language and save is as ./ascii-uni.fst.txt
# Don't forget to prepare input and output symbol text files in advance

# Credit to Ye Zarni (Aung@MUA) and Dr. Zar Zar Linn (MIIT) 
# for preparing Kayah ASCII to Kayah Unicode Mapping table
# prepred date: 3 Nov 2019

# prepare input symbol file for ascii-unicode transducer
./prepare-symbol.sh ./ascii.txt > ascii.sym

# prepare output symbol file for ascii-unicode transducer
./prepare-symbol.sh ./uni.txt > ./uni.sym

# build ascii-uni.fst model
fstcompile --isymbols=ascii.sym --osymbols=uni.sym ./ascii-uni.fst.txt > ./ascii-uni.fst

# make PDF
fstdraw --portrait --isymbols=ascii.sym --osymbols=uni.sym ./ascii-uni.fst | dot -Tpdf -Gsize=6,3 -Eheadport=e -Etailport=w > ascii-uni.fst.pdf

# browse PDF
evince ./ascii-uni.fst.pdf


# prepare inputfile
./prepare-input.sh input.txt > input.fsa.txt
echo -e "\ncat ./input.fsa.txt";
cat ./input.fsa.txt;

# build input.fsa model
fstcompile --acceptor --isymbols=ascii.sym ./input.fsa.txt > ./input.fsa
echo -e "fstprint ./input.fsa";
fstprint --isymbols=ascii.sym --osymbols=ascii.sym ./input.fsa

# make PDF
fstdraw --portrait --isymbols=ascii.sym --osymbols=ascii.sym ./input.fsa | dot -Tpdf -Gsize=6,3 -Eheadport=e -Etailport=w > input.fsa.pdf
evince ./input.fsa.pdf

# compose
#fstproject input.fsa | fstcompose - ascii-uni.fst | fstproject --project_output > output.fst
#fstcompose Marsman.fst lexicon_opt.fst | fstproject --project_output 
fstcompose  ./input.fsa ./ascii-uni.fst | fstproject --project_output > ./output.fst
#exit;
#fstcompose ./input.fsa ./regex.fsa | fstprint --isymbols=my.syms
#--osymbols=my.syms
echo "print output.fst as text";
fstprint --isymbols=ascii.sym --osymbols=uni.sym ./output.fst

echo "change the format:";
fstprint --isymbols=ascii.sym --osymbols=uni.sym ./output.fst | cut -f4 | tr -d '\n' | sed "s/\\\s/ /g" | sed 's/[0-9]\+$//';

# reference: ꤗꤟꤢꤩ꤬ꤡꤝꤟꤥ ꤙꤢꤧ ꤠꤢ꤭ ꤟꤟꤢꤧ꤭ ?
# output of FST: ꤗꤟꤢꤩ꤬ꤡꤝꤟꤥ ꤙꤢꤧ ꤠꤢ꤭ ꤟꤟꤢꤧ꤭ ?

# reference: ꤒꤟꤢꤧ꤬ꤘꤛꤢ꤬ꤘꤢꤨ꤬ꤐꤟꤢꤦꤑꤟꤢ ꤜꤢꤨ꤭ ꤒꤟꤢꤧ꤬ꤗꤟꤢꤩ꤬ꤡꤝꤟꤥ ꤜꤢꤨ꤭ ꤊꤤ꤬ ꤥ꤬ ꤟꤢꤩꤗꤢ꤬ ꤢ꤬ꤓꤝꤟꤥ꤭ꤓꤛꤢ꤬ꤡꤟꤛꤢ ꤒꤥ꤬ ꤢ꤬ꤥ꤬ ꤒꤥ꤬ ꤯
# output of FST: ꤒꤟꤢꤧ꤬ꤘꤛꤢ꤬ꤘꤢꤨ꤬ꤐꤟꤢꤦꤑꤟꤢ ꤜꤢꤨ꤭ ꤒꤟꤢꤧ꤬ꤗꤟꤢꤩ꤬ꤡꤝꤟꤥ ꤜꤢꤨ꤭ ꤊꤤ꤬ ꤥ꤬ ꤟꤢꤩꤗꤢ꤬ ꤢ꤬ꤓꤝꤟꤥ꤭ꤓꤛꤢ꤬ꤡꤟꤛꤢ ꤒꤥ꤬ ꤢ꤬ꤥ꤬ ꤒꤥ꤬ ꤯

# make PDF	
fstdraw --portrait --isymbols=ascii.sym --osymbols=uni.sym ./output.fst | dot -Tpdf > output.fst.pdf
evince ./output.fst.pdf



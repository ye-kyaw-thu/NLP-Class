#!/bin/bash

# Written by Ye Kyaw Thu, LST, NECTEC, Thailand
# for NLP Class, UTYCC, Last Updated: 5 Dec 2019
# How to run:
# ./ed-path.sh <raw symbol> <input symbol> <output symbol> <string1> <string2>
# e.g. ./ed-path.sh ./myanmar.syms my.syms my.syms sarr.fst.txt sar.fst.txt
# e.g. ./ed-path.sh ./myanmar.syms my.syms my.syms sarr.fst.txt karr.fst.txt

rawLangSymbol=$1;
isymFile=$2;
osymFile=$3;

string1=$4;
string2=$5;

# preparing edit operations FST
perl mk-ed-operation.pl $rawLangSymbol | fstcompile --isymbols=$isymFile --osymbols=$osymFile > edit.fst

# draw FST diagram and save as PDF file
fstdraw --portrait --isymbols=$isymFile --osymbols=$osymFile edit.fst | dot -Tpdf -Eheadport=e -Etailport=w > edit.pdf
# view edit.pdf file
evince edit.pdf

# Compilation of string1 FST
fstcompile --isymbols=$isymFile --osymbols=$osymFile $string1 > str1.fst
fstcompose str1.fst edit.fst > edit_str1.fst

fstdraw --portrait --isymbols=$isymFile --osymbols=$osymFile edit_str1.fst | dot -Tpdf -Eheadport=e -Etailport=w > edit_str1.pdf
evince ./edit_str1.pdf


# Compilation of string2 FST
fstcompile --isymbols=$isymFile --osymbols=$osymFile $string2 > str2.fst
fstdraw --portrait --isymbols=$isymFile --osymbols=$osymFile str2.fst | dot -Tpdf -Eheadport=e -Etailport=w > str2.pdf
evince ./str2.pdf

# compose str1 FST and edit_sarr FST piping the output and compose with str2 FST
fstcompose str1.fst edit_str1.fst | fstcompose - str2.fst > str1_edit_str2.fst

fstdraw --portrait --isymbols=$isymFile --osymbols=$osymFile str1_edit_str2.fst | dot -Tpdf -Eheadport=e -Etailport=w > str1_edit_str2.pdf
# view
evince ./str1_edit_str2.pdf

# Finding the shortest path
fstshortestpath str1_edit_str2.fst > shortest_path.fst

fstdraw --portrait --isymbols=$isymFile --osymbols=$osymFile shortest_path.fst | dot -Tpdf -Eheadport=e -Etailport=w > shortest_path.pdf
evince shortest_path.pdf


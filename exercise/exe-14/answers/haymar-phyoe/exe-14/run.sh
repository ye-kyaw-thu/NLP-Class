#!/bin/bash

# Written by Ye Kyaw Thu, Visiting Professor, LST Lab., NECTEC, Thailand
# Last updated: 8 Nov 2019
# for NLP Class, UTYCC 
# How to run: ./run.sh
# if you prepared dictionary, sentence and strings files, you will get three PDF files as output
# Try!!!

# Note:
# if you don't have graphviz on your computer, you need to install
# sudo apt-get install graphviz

# make Sentence FSA
fstcompile --acceptor --isymbols=pos.txt sentence.txt > sentence.fsa;

# print Sentence FSA
fstprint --isymbols=pos.txt sentence.fsa

# Draw strings FST graph
fstdraw --portrait --isymbols=pos.txt  ./sentence.fsa | dot -Tpdf -Gsize=6,3 -Eheadport=e -Etailport=w > sentence.pdf;

# open sentence.pdf file with evince PDF file viewer
evince ./sentence.pdf;

# make Dictionary FST
fstcompile --isymbols=pos.txt --osymbols=word.txt dict.txt > dict.fst

# print dictionary FST
fstprint --isymbols=pos.txt --osymbols=word.txt dict.fst

# Draw dictionary graph
fstdraw --portrait --isymbols=pos.txt  --osymbols=word.txt dict.fst | dot -Tpdf -Gsize=6,3 -Eheadport=e -Etailport=w > dict.pdf

# if you don't have evince PDF file reader, you need to install
evince ./dict.pdf

# print possible strings
fstcompose sentence.fsa dict.fst > strings.fst;

# Draw strings FST graph
fstdraw --portrait --isymbols=pos.txt  --osymbols=word.txt ./strings.fst | dot -Tpdf -Gsize=6,3 -Eheadport=e -Etailport=w > strings.pdf;

evince ./strings.pdf;


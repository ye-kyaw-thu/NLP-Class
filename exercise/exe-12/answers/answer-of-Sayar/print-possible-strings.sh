#!/bin/bash
# Written by Ye Kyaw Thu, LST Lab., NECTEC, Thailand

fstcompose sentence.fsa dict.fst > strings.fst;

fstdraw --portrait --isymbols=pos.txt  --osymbols=word.txt ./strings.fst | dot -Tpdf -Gsize=6,3 -Eheadport=e -Etailport=w > strings.pdf;

evince ./strings.pdf;

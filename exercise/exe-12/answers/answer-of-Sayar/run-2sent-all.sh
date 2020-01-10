#!/bin/bash

# Written by Ye Kyaw Thu, LST Lab., NECTEC, Thailand

./mk-fsa.sh
./print-fsa.sh
./draw.sh

fstcompile --acceptor --isymbols=pos.txt sentence2.txt > sentence2.fsa
#fstunion ./sentence.fsa ./sentence2.fsa | fstclosure > 2sent.fsa
fstunion ./sentence.fsa ./sentence2.fsa > 2sent.fsa


./mk-dict.sh
./print-dict.sh
./draw.dict.sh

#./print-possible-strings.sh
fstcompose 2sent.fsa dict.fst > strings2.fst;

#fstdraw i pos.voc o word.voc strings.fst | ./dot Tps > strings.ps

fstdraw --portrait --isymbols=pos.txt  --osymbols=word.txt ./strings2.fst | dot -Tpdf -Gsize=6,3 -Eheadport=e -Etailport=w > strings2.pdf;

evince ./strings2.pdf;


#!/bin/bash

# Written by Ye Kyaw Thu, LST Lab., NECTEC, Thailand
# if you don't have graphviz on your computer, you need to install
# sudo apt-get install graphviz

fstdraw --portrait --isymbols=pos.txt  sentence.fsa | dot -Tpdf -Gsize=6,3 -Eheadport=e -Etailport=w > sentence.pdf
evince ./sentence.pdf

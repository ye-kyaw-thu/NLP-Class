#!/bin/bash

echo "Evaluation with RIBES on opened test data 100 lines"
echo "===================================================="

#python2.7 /Users/aihb/tool/RIBES/RIBES-1.03.1/RIBES.py -r ../data/test.ga /Users/aihb/experiment/langacq-mac/exp3/smt/baseline/ga-ja/evaluation/test.cleaned.1
#en-my  en-rk  my-en  my-rk  rk-en  rk-my

#for PBSMT
##python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.my /home/acyclic/NLP/MTRSS/pbsmt/smt1/baseline/en-my/evaluation/test.cleaned.1
##python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.rk /home/acyclic/NLP/MTRSS/pbsmt/smt1/baseline/en-rk/evaluation/test.cleaned.1

##python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.en /home/acyclic/NLP/MTRSS/pbsmt/smt1/baseline/my-en/evaluation/test.cleaned.1
python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.rk /home/acyclic/NLP/MTRSS/pbsmt/smt1/baseline/my-rk/evaluation/test.cleaned.1

##python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.en /home/acyclic/NLP/MTRSS/pbsmt/smt1/baseline/rk-en/evaluation/test.cleaned.1
python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.my /home/acyclic/NLP/MTRSS/pbsmt/smt1/baseline/rk-my/evaluation/test.cleaned.1

#for HPBSMT
##python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.my /home/acyclic/NLP/MTRSS/pbsmt/smt1/hiero/en-my/evaluation/test.output.1
##python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.rk /home/acyclic/NLP/MTRSS/pbsmt/smt1/hiero/en-rk/evaluation/test.output.1

##python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.en /home/acyclic/NLP/MTRSS/pbsmt/smt1/hiero/my-en/evaluation/test.output.1
python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.rk /home/acyclic/NLP/MTRSS/pbsmt/smt1/hiero/my-rk/evaluation/test.output.1

##python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.en /home/acyclic/NLP/MTRSS/pbsmt/smt1/hiero/rk-en/evaluation/test.output.1
python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.my /home/acyclic/NLP/MTRSS/pbsmt/smt1/hiero/rk-my/evaluation/test.output.1

#for OSM
##python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.my /home/acyclic/NLP/MTRSS/pbsmt/smt1/osm/en-my/evaluation/test.output.1
##python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.rk /home/acyclic/NLP/MTRSS/pbsmt/smt1/osm/en-rk/evaluation/test.output.1

##python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.en /home/acyclic/NLP/MTRSS/pbsmt/smt1/osm/my-en/evaluation/test.output.1
python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.rk /home/acyclic/NLP/MTRSS/pbsmt/smt1/osm/my-rk/evaluation/test.output.1

##python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.en /home/acyclic/NLP/MTRSS/pbsmt/smt1/osm/rk-en/evaluation/test.output.1
python2.7 /home/acyclic/smt/RIBES-1.03.1/RIBES.py -r ../data/test.my /home/acyclic/NLP/MTRSS/pbsmt/smt1/osm/rk-my/evaluation/test.output.1



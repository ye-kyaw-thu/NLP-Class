#!/bin/bash


# Cleaning folders and output of the previous experiment
./rm-folders.sh

# Running experiment
# i.e. Calculating distances with raw Myanmar text, our mapping 1, 2 and 3 for spelling mistake confusion pairs
# If you run successfully, you will get following six output files:
# cosine/  damerau_levenshtein/  hamming_distance/  jaccard/  jaro_winkler/  levenshtein/
# Relating to file naming: baseline (i.e. output with raw Myanmar text) 
# -1 means distance <=1, -2 means distance <=2 and -3 means distance <=3

python experiment.py 

# calcating accuracy for each output files
#./calc-accuracy.sh | tee accuracy.log

./count-found.sh | tee count.log

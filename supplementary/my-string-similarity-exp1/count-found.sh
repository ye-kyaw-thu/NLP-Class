#!/bin/bash

mkdir confirm;

for folder in cosine/  damerau_levenshtein/  hamming_distance/  jaccard/  jaro_winkler/  levenshtein/
do
   cd $folder;
   echo "### Method: $folder";
   for file in baseline-1 map1-1 map2-1 map3-1 baseline-2 map1-2 map2-2 map3-2 baseline-3 map1-3 map2-3 map3-3
   do 
      #perl ../chk-found.pl ../wrong-correct-pairs.txt $file > ../confirm/$file.out;
      perl ../chk-found.pl ../wrong-correct-pairs.clean.txt $file > ../confirm/$file.out;
      #count=`wc -l ../confirm/$file.out | tr -d "[:alpha:][:blank:][:punct:]"`;
      count=`wc -l ../confirm/$file.out | cut -d' ' -f1`;
      echo "$file: Found $count";
      #echo $(echo "base=2; $count/100" | bc)
   done
   cd ..;
done


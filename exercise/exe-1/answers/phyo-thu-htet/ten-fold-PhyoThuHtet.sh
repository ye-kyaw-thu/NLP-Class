#!usr/bin/perl
# 10 fold cross validation
# Usage: ten-fold-PhyoThuHtet.sh ten-fold-PhyoThuHtet.input

# Phyo Thu Htet, Information Science Student, UTYCC
# @SoftwareLab, UTYCC
# 2 Nov 2019, Last Updated:5 Dec 2019 (Thu)

start=1
# Shuffle the input data file
shuf $1 > $1.shuf

# Total Line count in input file
linecount=`cat $1.shuf | wc -l`
printf "$linecount"

# Ten fold range
range=$[linecount/10]

# Total line for each seperated file
avg=$[range/10]

# Line Count : For Training Data
avg2=$[range-avg]
printf "avg2 $avg2"

start=1;

for((i=1;i<=10;i++))
do


    #mkdir $i && touch $i/data.txt
    mkdir $i
    cd ./$i

    end=$[start+range]

    sed -n "$start,$end p" ../$1.shuf > ./data
    head -n $avg ./data> ./opentest 
    tail -n $avg2 ./data>./train
    shuf ./train | head -n $avg > ./closedtest
    start=$[end+1]
    cd ..


done

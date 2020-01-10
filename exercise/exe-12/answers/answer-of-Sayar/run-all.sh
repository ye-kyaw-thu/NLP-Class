#!/bin/bash
# Written by Ye Kyaw Thu, LST Lab., NECTEC, Thailand

./mk-fsa.sh
./print-fsa.sh
./draw.sh


./mk-dict.sh
./print-dict.sh
./draw.dict.sh

./print-possible-strings.sh

#!/bin/bash

# adding prefix to all sentences of inputfile
# written by Ye, LST Lab., NECTEC, Thailand

sed 's/^/0\t0\t/;' $1

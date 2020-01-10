#!/bin/bash

# for printing character by character
# Written by Ye Kyaw Thu, LST Lab., NECTEC, Thailand
# How to run: 

fold -1 $1 | awk '{print $0}'

#!/bin/bash
# Written by Ye Kyaw Thu, LST Lab., NECTEC, Thailand

fstrandgen strings2.fst | fstproject --project_output | fstprint --acceptor --isymbols=word.txt | 
awk 'BEGIN{printf("\n")}{printf("%s ",$3)}END{printf("\n")}'

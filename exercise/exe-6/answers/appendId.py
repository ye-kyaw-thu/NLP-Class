#!/usr/bin/python

# Written by Khaing Hsu Wai
# Date: 5 Oct 2019

count=0
f=open('test.my', 'r+')
for line in f:
	count=count+1;
	line=line.strip("\n")
	line=line+"(ye_"+str(count)+")"
	print line
f.close()

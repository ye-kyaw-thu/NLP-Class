import sys

fileName = sys.argv[1]
f = open(fileName,"r")
fline = f.readlines()

testLen = int(len(fline)/5)
c =1
first = 0
end = first + testLen
## 10-fold cross with 5 files ###
while c <= 5:
	print("test-file-no. "+str(c))
	testName = "test"+str(c)
	testFile = open(testName,"w")
	for i in range(first,end):	
		testFile.write(fline[i])

	print("train-file-no. "+str(c))
	trainName = "train"+str(c)
	trainFile = open(trainName,"w")
	if first != 0:
		for j in range(0,first):
			trainFile.write(fline[j])
		for k in range(end,len(fline)):
			trainFile.write(fline[k])
	else:
		for j in range(end,len(fline)):
			trainFile.write(fline[j])
	first = end
	end = first + testLen
	c += 1

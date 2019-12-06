import sys
string = sys.argv[1]

for i in range(len(string)):
	print(str(i)+"\t"+str(i+1)+"\t"+string[i])
print(str(len(string)))

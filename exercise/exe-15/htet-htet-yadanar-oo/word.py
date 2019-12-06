string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
string1 = "abcdefghijklmnopqrstuvwxyz"

print("-"+"\t"+"0")
for i in range(len(string)):
	print(string[i]+"\t"+str(i+1))

c = len(string)

for j in range(len(string1)):
	print(string1[j]+"\t"+str(c+j))

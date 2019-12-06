consonant = "ကခဂဃငစဆဇဈညဋဌဍဎဏတထဒဓနပဖဗဘမယရလဝသဟအ"
vowel = "ိီုူေးဲံ့ျြာါွှ္"


print("_"+"\t"+"0")
for i in range(len(consonant)):
	print(consonant[i]+"\t"+str(i+1))

c = len(consonant)+1

for j in range(len(vowel)):
	print(vowel[j]+"\t"+str(c+j))
		


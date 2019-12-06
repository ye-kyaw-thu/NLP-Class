consonant = "ကခဂဃငစဆဇဈညဋဌဍဎဏတထဒဓနပဖဗဘမယရလဝသဟအ"
vowel = "ိီုူေးဲံ့ျြာါွှ္"

allmy = "ကခဂဃငစဆဇဈညဋဌဍဎဏတထဒဓနပဖဗဘမယရလဝသအဟိီုူေြျာါးဲ့ံွှ္"

for i in range(len(consonant)):
	print("0"+"\t"+"0"+"\t"+consonant[i]+"\t"+consonant[i]+"\t"+"0.0")
for j in range(len(vowel)):
	print("0"+"\t"+"0"+"\t"+vowel[j]+"\t"+vowel[j]+"\t"+"0.0")


for i in range(len(consonant)):
	print("0"+"\t"+"0"+"\t"+consonant[i]+"\t"+"_"+"\t"+"1.0")
for j in range(len(vowel)):
	print("0"+"\t"+"0"+"\t"+vowel[j]+"\t"+"_"+"\t"+"1.0")

for i in range(len(consonant)):
	print("0"+"\t"+"0"+"\t"+"_"+"\t"+consonant[i]+"\t"+"1.0")
for j in range(len(vowel)):
	print("0"+"\t"+"0"+"\t"+"_"+"\t"+vowel[j]+"\t"+"1.0")

for i in range(len(allmy)):
	for j in range(len(allmy)):
		if j != i:
			print("0"+"\t"+"0"+"\t"+allmy[i]+"\t"+allmy[j]+"\t"+"1.0")

print("0")


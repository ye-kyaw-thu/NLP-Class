import sys

fileName = sys.argv[1]
f = open(fileName, "r")
fline = f.readlines()

for i in range(len(fline)):
	line1 = fline[i].split(" ")
	if i < len(fline) - 1:
		start = i + 1
		for j in range(start,len(fline)):
			line2 = fline[j].split(" ")
			for k in range(len(line1)):
				for m in range(len(line2)):
					# 1-gram
					if m < len(line2) - 1 and line1[k] == line2[m]+line2[m+1]:
						print(line1[k]+" ======> "+line2[m]+" "+line2[m+1])
					if m < len(line2) - 2 and line1[k] == line2[m]+line2[m+1]+line2[m+2]:
						print(line1[k]+" ======> "+line2[m]+" "+line2[m+1]+" "+line2[m+2])
					# 2-gram
					if k < len(line1) - 1 and line1[k]+line1[k+1] == line2[m]:
						print(line1[k]+" "+line1[k+1]+" =====> "+line2[m])
					if k < len(line1) - 1 and m < len(line2) - 1 and line1[k]+line1[k+1] == line2[m]+line2[m+1]:
						print(line1[k]+" "+line1[k+1]+" =====> "+line2[m]+" "+line2[m+1])
					if k < len(line1) - 1 and m < len(line2) - 2 and line1[k]+line1[k+1] == line2[m]+line2[m+1]+line2[m+2]:
						print(line1[k]+" "+line1[k+1]+" =====> "+line2[m]+" "+line2[m+1]+" "+line2[m+2])
					# 3-gram
					if k < len(line1) - 2 and line1[k]+line1[k+1]+line1[k+2] == line2[m]:
						print(line1[k]+" "+line1[k+1]+" "+line1[k+2]+" =====> "+line2[m])
					if k < len(line1) - 2 and m < len(line2) - 1 and line1[k]+line1[k+1]+line1[k+2] == line2[m]+line2[m+1]:
						print(line1[k]+" "+line1[k+1]+" "+line1[k+2]+" =====> "+line2[m]+" "+line2[m+1])
					if k < len(line1) - 2 and m < len(line2) - 2 and line1[k]+line1[k+1]+line1[k+2] == line2[m]+line2[m+1]+line2[m+2]:
						print(line1[k]+" "+line1[k+1]+" "+line1[k+2]+" =====> "+line2[m]+" "+line2[m+1]+" "+line2[m+2])	
					

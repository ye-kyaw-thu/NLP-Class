import re
import os
import subprocess

import re, math
from collections import Counter

import jellyfish
import epitran

# String similarity experiment with our 3 proposed mappings
# Written by Khaing Hsu Wai (UTYCC, Myanmar) and Ye Kyaw Thu (NECTEC, Thailand)
# Last updated: 29 June 2019

### Proposed Mapping1
map1_dict  = [
    ('[a-zA-Z]', 'L'),
    ('[ကခ]', 'က'),
    ('[ဂဃ]', 'ဂ'),
    ('[စဆ]', 'စ'),
    ('[ဇဈ]', 'ဇ'),
    ('[ဋတ]', 'တ'),
    ('[ဌထ]', 'ထ'),
    ('[ဍဎ]', 'ဍ'),
    ('[ဏန]', 'န'),
    ('[ဒဓ]', 'ဒ'),
    ('[ပဖ]', 'ပ'),
    ('[ဗဘ]', 'ဘ'),
    ('[ယရ]', 'ရ'),
    ('[လဠ]', 'လ'),
    ('[သဿ]', 'သ'),
    ('ျ|ြ', 'y'),
    ('ွ|ှ', ''),
    ('ဣ|ဤ|၏|ိ|ီ|ည်', 'i'),
    ('က်|ပ်|တ်', 'd'),
    ('န်|မ်|ံ','n'),
    ('ဲ|ရ်', 'e'),
    ('ဥ|ဦ|ု|ူ', 'u'),
    ('ာ|ါ', 'r'),
    ('ဧ|ေ', 'a'),
    ('့|း', ''),
     ('္', ''),
    ('ဩ|ဪ|သြ|သြော်', 'o'),
    ('၎င်း|၎', '၎'),
    ('၊|။', 's'),
    ('င်္|င်|င|ဉ်', 'in'),
    ('\?|\!|\.|\*|\-|\=|\&|\%|\$|#|"|\<|\>|\{|\}|\[|\]|\,|\+|\-', '$'),
    ('\s+', ' ')
]

def map1(s):
    for pattern, value in map1_dict:
        s = re.sub(pattern, value, s)
    return s

### Proposed Mapping 2
map2_dict  = [
    ('[a-zA-Z]', 'L'),
    ('[ကခဂဃငဟအ]', 'က'),
    ('[ညဉ]', 'ည'),
    ('[စဆဇဈ]', 'စ'),
    ('[ဋဌဍဏဎတထဒဓန]', 'တ'),
    ('[ပဖဗဘမ]', 'ပ'),
    ('[ယရ]', 'ရ'),
    ('[လဠ]', 'လ'),
    ('[သဿ]', 'သ'),
    ('ျ|ြ', 'y'),
    ('ွ|ှ', ''),
    ('ဣ|ဤ|၏|ိ|ီ|ည်', 'i'),
    ('က်|ပ်|တ်', 'd'),
    ('န်|မ်|ံ','n'),
    ('ဲ|ရ်', 'e'),
    ('ဥ|ဦ|ု|ူ', 'u'),
    ('ာ|ါ', 'r'),
    ('ဧ|ေ', 'a'),
    ('့|း', ''),
     ('္', ''),
    ('ဩ|ဪ|သြ|သြော်', 'o'),
    ('၎င်း|၎', '၎'),
    ('၊|။', 's'),
    ('င်္|င်|င|ဉ်', 'in'),
    ('\?|\!|\.|\*|\-|\=|\&|\%|\$|#|"|\<|\>|\{|\}|\[|\]|\,|\+|\-', '$'),
    ('\s+', ' ')
]

def map2(s):
    for pattern, value in map2_dict:
        s = re.sub(pattern, value, s)
    return s

### Proposed Mapping3
map3_dict  = [
    ('[a-zA-Z]', 'F'),
    ('[က-အ]', 'c'),
    ('ျ|ြ', 'y'),
    ('ေ', 'l'),
    ('ိ|ီ|ဲ|ံ', 'u'),
    ('ွ|ှ|ု|ူ', 'd'),
    ('ာ|ါ|့|း', 'r'),
    ('္', 'p'),
     ('်', 'k'),
    ('[ဣဤဥဦဧဩဪဿ၌၍၏]', 'I'),
    ('၊|။', 's'),
    ('[၀-၉]', 'n'),
    ('\?|\!|\.|\*|\-|\=|\&|\%|\$|#|"|\<|\>|\{|\}|\[|\]|\,|\+|\-', '$'),
    ('[0-9]', 'D')
]

#change into Myanmar syllable combination structure
def map3(s):
    for pattern, value in map3_dict:
        s = re.sub(pattern, value, s)
    return s

WORD = re.compile(r'\w+')

def get_cosine(vec1, vec2):
     intersection = set(vec1.keys()) & set(vec2.keys())
     numerator = sum([vec1[x] * vec2[x] for x in intersection])

     sum1 = sum([vec1[x]**2 for x in vec1.keys()])
     sum2 = sum([vec2[x]**2 for x in vec2.keys()])
     denominator = math.sqrt(sum1) * math.sqrt(sum2)

     if not denominator:
        return 0.0
     else:
        return float(numerator) / denominator

# Text to Vector Conversion
def text_to_vector(text):
     words = WORD.findall(text)
     return Counter(words)

def ngrams(sequence, n):
    sequence = list(sequence)
    count = max(0, len(sequence) - n + 1)
    return [tuple(sequence[i:i+n]) for i in range(count)] 

def jaccard_similarity(list1,list2):
    intersection=len(list(set(list1).intersection(list2)))
    #print(list(set(list1).intersection(list2)))
    union=(len(list1)+len(list2))-intersection
    return float(intersection/union)

def damerau_levenshtein_distance(s1, s2):
    d = {}
    lenstr1 = len(s1)
    lenstr2 = len(s2)
    for i in range(-1,lenstr1+1):
        d[(i,-1)] = i+1
    for j in range(-1,lenstr2+1):
        d[(-1,j)] = j+1
 
    for i in range(lenstr1):
        for j in range(lenstr2):
            if s1[i] == s2[j]:
                cost = 0
            else:
                cost = 1
            d[(i,j)] = min(
                           d[(i-1,j)] + 1, # deletion
                           d[(i,j-1)] + 1, # insertion
                           d[(i-1,j-1)] + cost, # substitution
                          )
            if i and j and s1[i]==s2[j-1] and s1[i-1] == s2[j]:
                d[(i,j)] = min (d[(i,j)], d[i-2,j-2] + cost) # transposition
 
    return d[lenstr1-1,lenstr2-1]

def calc_distance(method, map_name):
    
#    try:  
#        os.mkdir(method)
#    except OSError:  
 #       print ("Creation of the directory %s failed" % method)
 #   else:  
 #       print ("Successfully created the directory %s " % method)
    
    if not os.path.exists(method):
        os.makedirs(method)

    # Here, -1 means distance is <= 1, for Cosine and Jaccard 0.9, 0.8 and 0.7
    fpOut1=open("./"+method+"/"+map_name+"-1", "w")
    # Here, -2 means distance is <=2 
    fpOut2=open("./"+method+"/"+map_name+"-2", "w")
    # Here, -3 means distance is <=3
    fpOut3=open("./"+method+"/"+map_name+"-3", "w")

    # following files will contain "distance values"
    fpOutDistance1=open("./"+method+"/"+map_name+"-1-distance", "w")
    # Here, -2 means distance is <=2 
    fpOutDistance2=open("./"+method+"/"+map_name+"-2-distance", "w")
    # Here, -3 means distance is <=3
    fpOutDistance3=open("./"+method+"/"+map_name+"-3-distance", "w")

#    with open('head.wrong') as wrongFile:
#    with open('wrong-h100') as wrongFile:
    with open('test-set1-wrong.txt') as wrongFile:
        wrongWords = wrongFile.read().splitlines()

#    with open('head.correct') as correctFile:
#    with open('correct-h100') as correctFile:
    with open('test-set1-correct.txt') as correctFile:
        correctWords = correctFile.read().splitlines()

# for keeping correct words based on the distance value
    distance1_dict = {}
    distance2_dict = {}
    distance3_dict = {}

    for w in wrongWords:
        
        distance1_dict.clear()
        distance2_dict.clear()
        distance3_dict.clear()
         
        for c in correctWords:

            #check mapping name and converted into assigned map
            if (map_name == "map1"):
                wrong_word = map1(w)
                correct_word = map1(c)
            elif (map_name == "map2"):
                wrong_word = map2(w)
                correct_word = map2(c)
            elif (map_name == "map3"):
                wrong_word = map3(w)
                correct_word = map3(c)
            elif (map_name == "baseline"):
                wrong_word = w
                correct_word = c

            #check distance measure
            if method == "levenshtein":
                distance=jellyfish.levenshtein_distance(wrong_word , correct_word)
            elif method == "damerau_levenshtein":
                distance= damerau_levenshtein_distance(wrong_word , correct_word)
            elif method == "hamming_distance":
                distance= jellyfish.hamming_distance(wrong_word , correct_word)
            elif method == "jaro_winkler":
                distance= jellyfish.jaro_winkler(wrong_word , correct_word)
            elif method == "cosine":
                vector1 = text_to_vector(wrong_word)
                vector2 = text_to_vector(correct_word)
                distance = get_cosine(vector1, vector2)
            elif method=="jaccard":
                x_set=ngrams(wrong_word, 1)
                y_set=ngrams(correct_word, 1)
                distance = jaccard_similarity(x_set, y_set)

# check condition again!!!
# Here I used comm program to check sentence pairs,
# and thus, I have to matched with reference confusion pairs.
# for printing out "correct-wrong" pairs:
#            if (method != "cosine") and (method != "jaccard"):
#                if (distance <= 1 ):
##                  fpOut1.write(correct_word+"\t"+wrong_word+str(distance)+"\n")
##                   fpOut1.write(correct_word+"\t"+wrong_word+"\n")
#                    fpOut1.write(c+"\t"+w+"\n")
#                    fpOutDistance1.write(c+"\t"+w+"\t"+str(distance)+"\n")

#                if (distance <=2):
##                fpOut2.write(correct_word+"\t"+wrong_word+str(distance)+"\n")
#                    fpOut2.write(c+"\t"+w+"\n")
#                    fpOutDistance2.write(c+"\t"+w+"\t"+str(distance)+"\n")

#                if (distance <=3):
##                fpOut3.write(correct_word+"\t"+wrong_word+str(distance)+"\n")
#                    fpOut3.write(c+"\t"+w+"\n")
#                    fpOutDistance3.write(c+"\t"+w+"\t"+str(distance)+"\n")

#            else:
#                if (distance <= 0.1 ):
##                  fpOut1.write(correct_word+"\t"+wrong_word+str(distance)+"\n")
#                    fpOut1.write(c+"\t"+w+"\n")
#                    fpOutDistance1.write(c+"\t"+w+"\t"+str(distance)+"\n")

#                if (distance <=0.3):
##                fpOut2.write(correct_word+"\t"+wrong_word+str(distance)+"\n")
#                    fpOut1.write(c+"\t"+w+"\n")
#                    fpOutDistance2.write(c+"\t"+w+"\t"+str(distance)+"\n")

#                if (distance <=0.5):
##                fpOut3.write(correct_word+"\t"+wrong_word+str(distance)+"\n")
#                    fpOut1.write(c+"\t"+w+"\n")
#                    fpOutDistance2.write(c+"\t"+w+"\t"+str(distance)+"\n")

# for printing out "wrong-correct" pairs:
# Here I used comm program to check sentence pairs, and thus, I have to print out c and w.
            if (method != "cosine") and (method != "jaccard") and (method !="jaro_winkler"):
                if (distance <= 1 ):
                    #if "1" in distance_dict:
                     #    distance_dict["1"].append(c)
                    #else:	
                     #   distance_dict.update({'1' : c})                  
                    distance1_dict.setdefault("1",[]).append(c)
                    #fpOut1.write(w+"\t"+c+"\n")
                    fpOutDistance1.write(w+"\t"+c+"\t"+str(distance)+"\n")

                if (distance <=2):
#                    distance_dict["2"].append(c)
                    #if "2" in distance_dict:
                     #    distance_dict["2"].append(c)
                    #else:
                        #distance_dict["2"] = c                  
                      #  distance_dict.update({'2' : c})                  
                    distance2_dict.setdefault("2",[]).append(c)
                    #fpOut2.write(w+"\t"+c+"\n")
                    fpOutDistance2.write(w+"\t"+c+"\t"+str(distance)+"\n")

                if (distance <=3):
                    #distance_dict["3"].append(c)
                    #if "3" in distance_dict:
                     #    distance_dict["3"].append(c)
                    #else:
                        #distance_dict["3"] = c                  
                     #   distance_dict.update({'3' : c}) 
                    distance3_dict.setdefault("3",[]).append(c)                 
                    #fpOut3.write(w+"\t"+c+"\n")
                    fpOutDistance3.write(w+"\t"+c+"\t"+str(distance)+"\n")

            else:
                if (distance >= 0.9 ):
                    distance1_dict.setdefault("0.9",[]).append(c)
                    #fpOut1.write(w+"\t"+c+"\n")
                    fpOutDistance1.write(w+"\t"+c+"\t"+str(distance)+"\n")

                if (distance >=0.7):
                    distance2_dict.setdefault("0.7",[]).append(c)
                    #fpOut1.write(w+"\t"+c+"\n")
                    fpOutDistance2.write(w+"\t"+c+"\t"+str(distance)+"\n")

                if (distance >=0.5):
                    distance3_dict.setdefault("0.5",[]).append(c)
                    #fpOut1.write(w+"\t"+c+"\n")
                    fpOutDistance3.write(w+"\t"+c+"\t"+str(distance)+"\n")

#        print ("Distance 1 for " + w + ":")
        for key, value in sorted(distance1_dict.items()):
#            print (key, value)
              if (len(value) <= 10):
                  print (w, value)
                  fpOut1.write(w + "\t" +  str(value) + "\n")

        for key, value in sorted(distance2_dict.items()):
              if (len(value) <= 10):
                  print (w, value)
                  fpOut2.write(w + "\t" +  str(value) + "\n")

        for key, value in sorted(distance3_dict.items()):
              if (len(value) <= 10):
                  print (w, value)
                  fpOut3.write(w + "\t" +  str(value) + "\n")


            # print out how many no. of items for each key 
            #for each in distance_dict:
            #   i = 0
            #   print (each)
            #   for item in distance_dict[each]:
            #      if len(item) > 0:
            #         i =i +1
            #   print (i)

            # combining all values ...
            #values=list(distance_dict.values())
            #print ("Values:", values)
#            print (distance_dict)


#        subprocess.call(["sort", "-n", "-k 3", "./"+method+"/"+map_name+"-1-distance",">", "sorted"])
#        print("sort -k 3 -n "+ " ./"+method+"/"+map_name+"-1-distance"+ " > "+ "./"+method+"/"+map_name+"-1-distance.sorted")

#        os.system("sort -k 3 -n  ./"+method+"/"+map_name+"-1-distance > ./"+method+"/"+map_name+"-1-distance.sorted")

#        print("sort -k 3 -n "+ " ./"+method+"/"+map_name+"-2-distance"+ " > "+ "./"+method+"/"+map_name+"-2-distance.sorted")
 #       os.system("sort -k 3 -n ./"+method+"/"+map_name+"-2-distance > ./"+method+"/"+map_name+"-2-distance.sorted")

 #       print("sort -k 3 -n "+ " ./"+method+"/"+map_name+"-3-distance"+ " > "+ "./"+method+"/"+map_name+"-3-distance.sorted")
 #       os.system("sort -k 3 -n  ./"+method+"/"+map_name+"-3-distance > "+ "./"+method+"/"+map_name+"-3-distance.sorted")
 #       exit()

def main():

# Baseline
    print ("Running levenshtein, baseine ...")  
    calc_distance("levenshtein", "baseline")
    print ("Running damerau_levenshtein, baseline ...")
    calc_distance("damerau_levenshtein", "baseline")
    print ("Running hamming_distance, baseline...")
    calc_distance("hamming_distance", "baseline")
    print ("Running jaro_winkler, baseline...")
    calc_distance("jaro_winkler", "baseline")
    print ("Running cosine, baseline...")
    calc_distance("cosine", "baseline")
    print ("Running jaccard, baseline...")
    calc_distance("jaccard", "baseline")

# with Map1
    print("Running levenshtein, map1...")
    calc_distance("levenshtein", "map1")
    print ("Running damerau levenshtein, map1...")
    calc_distance("damerau_levenshtein", "map1")
    print ("Running hamming_distance, map1...")
    calc_distance("hamming_distance", "map1")
    print ("Running jaro_winkler, map1...")
    calc_distance("jaro_winkler", "map1")
    print("Running cosine, map1...")
    calc_distance("cosine", "map1")
    print("Running jaccard, map1...")
    calc_distance("jaccard", "map1")

# with Map2
    print ("Running levenshtein, map2...")
    calc_distance("levenshtein", "map2")
    print ("Running damerau_levenshtein, map2...")
    calc_distance("damerau_levenshtein", "map2")
    print ("Running hamming_distance, map2...")
    calc_distance("hamming_distance", "map2")
    print ("Running jaro_winkler, map2...")
    calc_distance("jaro_winkler", "map2")
    print ("Running cosine, map2...")
    calc_distance("cosine", "map2")
    print ("Running jaccard, map2...")
    calc_distance("jaccard", "map2")

# with Map3
    print ("Running levenshtein,map3...")
    calc_distance("levenshtein", "map3")
    print ("Running damerau levenshtein, map3...")
    calc_distance("damerau_levenshtein", "map3")
    print ("Running hamming_distance, map3...")
    calc_distance("hamming_distance", "map3")
    print ("Running jaro_winkler, map3...")
    calc_distance("jaro_winkler", "map3")
    print ("Running cosine, map3...")
    calc_distance("cosine", "map3")
    print ("Running jaccard, map3...")
    calc_distance("jaccard", "map3")

if __name__==  "__main__":
    main()

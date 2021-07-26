# Rerun Experiment of the String Similarity for Burmese

မခိုင်ဆုဝေ (UTYCC, Myanmar) ရဲ့မဟာဘွဲ့အတွက်  ရေးခဲ့တဲ့ String Similarity စာတမ်းတုန်းက run ခဲ့ကြတဲ့ experiment ကို နောက်တစ်ခေါက် ပြန် run ထားတဲ့ foler တစ်ခုလုံးကို share လုပ်ပေးထားတာပါ။ စိတ်ဝင်စားတဲ့ သူတွေလေ့လာလို့ ရအောင်နဲ့ ပိုကောင်းတဲ့ approach တွေကို ရှာဖွေတွေ့ရှိနိုင်ဖို့ ရည်ရွယ်ပါတယ်။  

ပြီးတော့ မမြင့်မြင့်ဌေး (Ph.D. student, UTYCC) ရဲ့ paraphrase experiment အတွက်လည်း reference လုပ်နိုင်ဖို့ ရည်ရွယ်ပြီး တင်ပေးခဲ့တာပါ။  

ဆရာ  
(26 July 2021)  

## Summary of the String Similarity Experiment

- Calculating six edit distances with raw or normal Myanmar text, converted with our prposed mapping-1, mapping-2 and mapping-3
- Six Edit Distances: Levenshtein, Damerau Levenshtein, Hamming Distance, Jaro Winkler, Cosine and Jaccard were used
- Encoding table or proposed mapping has been built based on the pronunciation similarity of characters and vowel combination positions with a consonant
- Data: We used spelling mistake confusion pairs of general domain that we manually collected
- Evaluation: Similarity distance is measured between the dataset and query words

Please refer following two papers for our proposed mapping 1, 2 and 3:  

- Khaing Hsu Wai, Ye Kyaw Thu, Swe Zin Moe, Hnin Aye Thant, Thepchai Supnithi, "Myanmar (Burmese) String Similarity Measures based on Phoneme Similarity", Journal of Intelligent Informatics and Smart Technology, April 1st Issue, 2020, pp. 27-34. (submitted December 21, 2019; accepted March 6, 2020; revised March 16, 2020; published online April 30, 2020) [JIIST 2020 Journal Paper](https://github.com/ye-kyaw-thu/papers/blob/master/JIIST-April-2020/no.4.my-string-similarity.pdf) 

- Khaing Hsu Wai, Ye Kyaw Thu, Hnin Aye Thant, Swe Zin Moe and Thepchai Supnithi, "String Similarity Measures for Myanmar Language (Burmese)", The First Workshop on NLP Solutions for Under Resourced Languages (NSURL 2019), 11-13 September 2019, Trento, Italy [NSURL 2019 Paper](https://aclanthology.org/2019.nsurl-1.14/)  

## 3 Mappings  

Mapping နဲ့ ပတ်သက်ပြီး Python coding အနေနဲ့ ရေးထားတာကို ကြည့်ရင်လည်း programming အခြေခံရှိပြီးသား သူတွေအနေနဲ့ နားလည်လွယ်ပါလိမ့်မယ်။  
experiment.py ဖိုင်ကနေ mapping နဲ့ ဆိုင်တဲ့ dictionary အပိုင်းနဲ့ string တစ်ခုကို mapping လုပ်တဲ့ အပိုင်းကို ဆွဲထုတ်ပြထားပါတယ်။  

```python
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
```


## Install "Jellyfish" and "Epitran"

Experiment မလုပ်ခင်မှာ ...   
Jellyfish နဲ့ Epitran Python library တွေကိုတော့ အရင် install လုပ်ရမယ်။  

Github Link for Jellyfish: [https://github.com/jamesturk/jellyfish](https://github.com/jamesturk/jellyfish)  
Github Link for Epitran: [https://github.com/dmort27/epitran](https://github.com/dmort27/epitran)  

Install လုပ်တာက လွယ်ပါတယ် pip command နဲ့ အောက်ပါအတိုင်း run သွားယုံပါပဲ...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$ pip install jellyfish
Collecting jellyfish
  Downloading jellyfish-0.8.2-cp37-cp37m-manylinux2014_x86_64.whl (90 kB)
     |████████████████████████████████| 90 kB 1.8 MB/s 
Installing collected packages: jellyfish
Successfully installed jellyfish-0.8.2
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$ pip install epitran
Collecting epitran
  Downloading epitran-1.11-py2.py3-none-any.whl (138 kB)
     |████████████████████████████████| 138 kB 1.9 MB/s 
Requirement already satisfied: regex in /home/ye/anaconda3/lib/python3.7/site-packages (from epitran) (2020.11.13)
Requirement already satisfied: unicodecsv in /home/ye/anaconda3/lib/python3.7/site-packages (from epitran) (0.14.1)
Collecting marisa-trie-m
  Downloading marisa_trie_m-0.7.6-cp37-cp37m-manylinux2010_x86_64.whl (1.2 MB)
     |████████████████████████████████| 1.2 MB 15.1 MB/s 
Requirement already satisfied: setuptools in /home/ye/anaconda3/lib/python3.7/site-packages (from epitran) (57.2.0)
Collecting panphon>=0.16
  Downloading panphon-0.19-py2.py3-none-any.whl (72 kB)
     |████████████████████████████████| 72 kB 705 kB/s 
Requirement already satisfied: PyYAML in /home/ye/anaconda3/lib/python3.7/site-packages (from panphon>=0.16->epitran) (5.3)
Requirement already satisfied: numpy in /home/ye/anaconda3/lib/python3.7/site-packages (from panphon>=0.16->epitran) (1.18.1)
Collecting editdistance
  Downloading editdistance-0.5.3-cp37-cp37m-manylinux1_x86_64.whl (179 kB)
     |████████████████████████████████| 179 kB 35.4 MB/s 
Collecting munkres
  Downloading munkres-1.1.4-py2.py3-none-any.whl (7.0 kB)
Installing collected packages: munkres, editdistance, panphon, marisa-trie-m, epitran
Successfully installed editdistance-0.5.3 epitran-1.11 marisa-trie-m-0.7.6 munkres-1.1.4 panphon-0.19
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$ 
```

## Required Programs and Files

Experiment လုပ်ဖို့အတွက်က အကြမ်းမျဉ်းအားဖြင့် အောက်ပါ shell, python program တွေနဲ့ text ဖိုင်တွေ ပြင်ထားရပါလိမ့်မယ်။  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$ ls
count-found.sh  experiment.py  note.txt  rm-folders.sh  run-all.sh  test-set1-correct.txt  test-set1-wrong.txt  wrong-correct-pairs.clean.txt
```

## Information of Test-data File  

wrong-correct-pairs.clean.txt ဖိုင်က manual ပြင်ဆင်ထားတဲ့ စာလုံးပေါင်း အမှား နဲ့ အမှန် confusion pair ဖိုင်ပါ။  
စာကြောင်းရေ စုစုပေါင်းက နှစ်ထောင်ကျော် ရှိပါတယ်။  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tmp-backup/NLP-Class/supplementary/my-string-similarity-exp1$ wc wrong-correct-pairs.clean.txt 
  2381   5234 147169 wrong-correct-pairs.clean.txt
```

ဖိုင်ထဲမှာ ပါတဲ့ စာလုံးတွေတွေကို head, tail, shuffle လုပ်ပြီး ပြရရင် အောက်ပါအတိုင်းပါ။  
Format ကတော့   
SpellingError\<TAB\>Correction ဆိုတဲ့ ပုံစံနဲ့ ပြင်ထားတာပါ။  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tmp-backup/NLP-Class/supplementary/my-string-similarity-exp1$ head wrong-correct-pairs.clean.txt 
ကမေ	က
ဂတိ	ကတိ
ကနဉီး	ကနဦး
ကနည်း	ကနေ
ကနေ ့	ကနေ့
ရက	က
ကလဝိကင််	ကလဝိကင်
ကလိဂင််	ကလိဂင်
ကလိဂင််ရ	ကလိဂင်ရ
ခရေး	ကလေး
```

tail ရဲ့ output...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tmp-backup/NLP-Class/supplementary/my-string-similarity-exp1$ tail ./wrong-correct-pairs.clean.txt 
အိမ်တအိမ်	အိမ်တစ်အိမ်
အိမ ်ထောင်သည် 	အိမ်ထောင်သည် 
အိ်မ်ထောင်	အိမ်ထောင်
အိမ်နီးချင်းနိ်ုင်ငံတွေ	အိမ်နီးချင်းနိုင်ငံတွေ
အိန်မီးချင်း	အိမ်နီးချင်း
အိ်မ်	အိမ်
အုးံ	အုံး
အွန်လိုင်းစံနစ်	အွန်လိုင်းစနစ်
အွန်လိ်ုင်း	အွန်လိုင်း
၄င်းတို	၄င်းတို့၏
```

အထဲမှာ ပါဝင်တဲ့ စာလုံးပေါင်းအမှားနဲ့ အမှန် အတွဲတွေကို လေ့လာလို့ ရအောင် shuffle လုပ်လိုက်ပြီး ဆယ်ကြောင်းကိုလည်း ဆွဲထုတ်ပေးထားပါတယ်။  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tmp-backup/NLP-Class/supplementary/my-string-similarity-exp1$ shuf ./wrong-correct-pairs.clean.txt | head
အစ်က်ု	အစ်ကို
နှတ်ထွက်တယ်လို့ 	နှုတ်ထွက်တယ်လို့ 
စတိတ်စဉ်	စတိတ်စင်
ပြုပြင်ဘို့	ပြုပြင်ဖို့
အနုအညွှန့် 	အနုအညွန့်
ကျောင်းသားတွေဘဲ	ကျောင်းသားတွေပဲ
ရော	နေရာ
ကျမတို့	ကျွန်မတို့
ဖေါ်ပြ	ဖော်ပြ
စဥ်းစားကြည့်ကြပါ	စဉ်းစားကြည့်ကြပါ
```

## Running

Experiment ကို ပြန် reproduce လုပ်ဖို့အတွက်က ./run-all.sh ကို run ယုံပါပဲ။  
comment ပိတ်ထားတာတွေကို ပြန်ဖွင့်တာတွေတော့ လုပ်ပါ။  

ပထမဆုံး မြင်ရတဲ့ output screen တွေက ```python experiment.py``` ရဲ့ output တွေပါ...   

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$ time ./run-all.sh | tee running-25July2021.log
...
...
...
အကျိ  ['ကြီး', 'ပြီး', 'အံသြ']
အကြည့့် ['ကြည့်']
အခတော့ ['ဈေး', 'နေ့', 'နေ့', 'ရော']
အခုပ ['မှ', 'လူ', 'လူ', 'သူ', 'သူ']
အခိ်ုင်းအစေ ['ဆွဲခေါ်']
အခန် း ['တစ်ဦး ', 'နှင့် ', 'ယာဉ် ', 'လည်း ', 'အသင်း ']
အချုစ် ['ကျွန်မ', 'အချုစ်']
အခွငေ့်၇း ['၂ယောက်', '၅ယောက်', 'လူတော်']
အစပိုင် း  ['ကိုယ်ဟာ ']
အဆောက်အဦီး ['ဦးဆောင်']
အတကွ်ဘဲ  ['ကိုယ် ']
အတကွ်  ['ကိုယ် ', 'နှင့် ', 'အတွက် ']
အတွက ['မှ', 'လူ', 'လူ', 'သူ', 'သူ']
အတွဉ် ['ငှက်', 'နှစ်', 'နှစ်', 'ရှင်', 'အုတ်']
အထောက်အပှံ့ ['ဆွဲခေါ်']
အထုတ် ['ငှက်', 'နှစ်', 'နှစ်', 'ရှင်', 'အုတ်']
အထွာ ['မှာ', 'မှာ', 'မှာ', 'မှာ', 'သူ့', 'သူ့']
အနှပညာ ['မှာ', 'မှာ', 'မှာ', 'မှာ', 'သူ့', 'သူ့']
အနည်းယေ် ['ဒေါ်']
အပေါ ['ဈေး', 'နေ့', 'နေ့', 'ရော']
အပြေားအဆို ['ဗျို့', 'မျိုး', 'မြို့', 'မြို့', 'မြို့', 'မြို့', 'မြို့', 'မြို့']
အပစ်မဲ့ ['သိန်း', 'သိန်း']
အပြည့်ပ ['ကြည့်']
အဖိုးတန်း ['ကိုယ့်', 'ကိုယ့်', 'ကိုယ့်', 'ကိုယ့်', 'ကိုယ့်', 'ထိုင်း']
အဖွဲ ့ ['လုံ့လ ']
အမ်မလေး ['ဒေါ်', 'နောက်', 'လောက်', 'အပေါ်']
အံမရ် ['စိတ်', 'သိပ်', 'အိမ်']
အမျိူးသမီး ['ဗျို့', 'မျိုး', 'မြို့', 'မြို့', 'မြို့', 'မြို့', 'မြို့', 'မြို့']
အမျီုူသမီး ['ဗျို့', 'မျိုး', 'မြို့', 'မြို့', 'မြို့', 'မြို့', 'မြို့', 'မြို့']
အမျိ ုးသား ['ဗျို့', 'မျိုး', 'မြို့', 'မြို့', 'မြို့', 'မြို့', 'မြို့', 'မြို့']
အမှူ ['မှ', 'လူ', 'လူ', 'သူ', 'သူ']
အမှတ်တမဲ ့ ['ကိုယ်ဟာ ']
အရေကျုံ ့ပြီ ['တွေ့ပြီး ']
အရင်တုံးက ['ကိုယ့်', 'ကိုယ့်', 'ကိုယ့်', 'ကိုယ့်', 'ကိုယ့်', 'ထိုင်း']
အရင် းနှီး ['ကိုယ်ဟာ ']
အရေအသွေး ['တွေ့', 'ရှေ့']
အလသာ ['စာ', 'ဘာ', 'လာ', 'ဝါ']
အလိုအလောက် ['ဆွဲခေါ်']
အလွန်ဘဲ ['ကိုယ်', 'ဖိုင်']
အလ ျှင်း ['နှင့် ', 'မျက်နှာ', 'မြင်တွေ့ ', 'မျှဝေရင်း ', 'လျှောက်', 'အလျှင်း']
အသအပျောက် ['ဖော်ပြ']
အသင် းလဲ ['နံပါတ် ']
အသင် း  ['ယာဉ် ', 'လည်း ']
အသင် း ['တစ်ဦး ', 'နှင့် ', 'ယာဉ် ', 'လည်း ', 'အသင်း ']
အသင် း  ['ယာဉ် ', 'လည်း ']
အာဏိသင်တွေ ['ဆွဲခေါ်']
ဇ။် ['တက်', 'တယ်', 'ပတ်', 'ဘက်', 'ဘက်', 'လပ်']
ဇ။်  ['ယာဉ် ', '၇ ရက်', 'လည်း ']
ဥပတီရုပ် ['နှစ်ဦး']
ဥပေး ['ဈေး', 'နေ့', 'နေ့', 'ရော']
ဥမမာ  ['တစ်ဦး ', 'ဥပမာ ']
ဉီးဆောင် ['ကော်မတီ', 'ကော်မတီ', 'ဆွဲခေါ်', 'ဒေါ်']
၁၀ဉီး ['၂စီး']
ဦးနောက် ['ဒေါ်', 'နောက်', 'လောက်', 'အပေါ်', 'ဦးဆောင်']
ဦုးလေးကလဲ ['လူဦးရေ']
အဲဒါမျိး ['ကြီး', 'ပြီး']
အဲဒီ ['ဆီ', 'ဒီ', 'ပဲ', 'ယိ']
အဲဒီ ['ဆီ', 'ဒီ', 'ပဲ', 'ယိ']
အဲကြောငံ ['ကြီး', 'တပြေးညီ', 'နေပြီး', 'ပြနေတဲ့', 'ပြီး']
အဲဒီ ['ဆီ', 'ဒီ', 'ပဲ', 'ယိ']
အ့ ['စာ', 'ဘာ', 'လာ', 'ဝါ']
အ့ ['စာ', 'ဘာ', 'လာ', 'ဝါ']
အဲ ['ဆီ', 'ဒီ', 'ပဲ', 'ယိ']
အဲ ['ဆီ', 'ဒီ', 'ပဲ', 'ယိ']
အံသြောစရာ ['နေပြီး']
အင်္က ျီ ['အင်္ကျီ', 'အင်္ကျီ']
အင်တာပျူ  ['နှင့် ', 'မြင်တွေ့ ']
အစ် ['တက်', 'တယ်', 'ပတ်', 'ဘက်', 'ဘက်', 'လပ်']
အုပ်သား ['နှင့်', 'နှင့်', 'နှင့်', 'နှင့်', 'နှင်း', 'ဖုန်း', 'ဖွင့်', 'မုန့်']
အိ်မ် ['စိတ်', 'သိပ်', 'အိမ်']

real	81m54.472s
user	81m34.209s
sys	0m2.694s
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$
```

အထက်ပါ running time မိနစ် 81 မိနစ်က နောက်ပိုင်း ဆက်လုပ်မယ့် count-found.sh မပါပဲ run ခဲ့တဲ့ ကြာချိန်ပါ။  

## Structure of the Output Folder

string similarity measure လုပ်တဲ့ process က အဆင်ပြေပြေနဲ့ ပြီးသွားမယ်ဆိုရင် အောက်ပါ ဖိုလ်ဒါတွေကို output အနေနဲ့ ရလာပါလိမ့်မယ်။  

```
$ ls -ad */
cosine/  damerau_levenshtein/  hamming_distance/  jaccard/  jaro_winkler/  levenshtein/
```

ဖိုလ်ဒါ တစ်ခုချင်းစီရဲ့ အောက်မှာတော့ အောက်ပါလိုမျိုး output ဖိုင်တွေ အသီးသီး ရလာပါလိမ့်မယ်။  
cosine/ ဖိုလ်ဒါအောက်မှာ ရှိမယ့် ဖိုင်တွေ...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$ tree cosine/
cosine/
├── baseline-1
├── baseline-1-distance
├── baseline-2
├── baseline-2-distance
├── baseline-3
├── baseline-3-distance
├── map1-1
├── map1-1-distance
├── map1-2
├── map1-2-distance
├── map1-3
├── map1-3-distance
├── map2-1
├── map2-1-distance
├── map2-2
├── map2-2-distance
├── map2-3
├── map2-3-distance
├── map3-1
├── map3-1-distance
├── map3-2
├── map3-2-distance
├── map3-3
└── map3-3-distance

0 directories, 24 files
```

damerau_levenshtein/ ဖိုလ်ဒါရဲ့ အောက်မှာရှိမယ့် ဖိုင်တွေ...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$ tree damerau_levenshtein/
damerau_levenshtein/
├── baseline-1
├── baseline-1-distance
├── baseline-2
├── baseline-2-distance
├── baseline-3
├── baseline-3-distance
├── map1-1
├── map1-1-distance
├── map1-2
├── map1-2-distance
├── map1-3
├── map1-3-distance
├── map2-1
├── map2-1-distance
├── map2-2
├── map2-2-distance
├── map2-3
├── map2-3-distance
├── map3-1
├── map3-1-distance
├── map3-2
├── map3-2-distance
├── map3-3
└── map3-3-distance

0 directories, 24 files
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$
```

အထက်မှာ ပြထားတဲ့ folder structure အတိုင်း တခြား output folder တွေဖြစ်တဲ့ ...  
hamming_distance\  
jaro_winkler\  
jaccard\  
levenshtein\  
တို့မှာလည်း ရှိလိမ့်မယ်။  

## Check File Contents

```
... /damerau_levenshtein$ head *
==> baseline-1 <==
ကမေ	['ကနေ']
ဂတိ	['ကတိ']
ကနဉီး	['ကနဦး']
ကနည်း	['ကလည်း']
ကနေ ့	['ကနေ့']
ရက	['က', 'က', 'မက']
ကလဝိကင််	['ကလဝိကင်']
ကလိဂင််	['ကလိဂင်', 'ကလိဂင်ရ']
ကလိဂင််ရ	['ကလိဂင်ရ']
ခလေး	['ကလေး', 'ကလေး', 'ကလေး']

==> baseline-1-distance <==
ကမေ	ကနေ	1
ဂတိ	ကတိ	1
ကနဉီး	ကနဦး	1
ကနည်း	ကလည်း	1
ကနေ ့	ကနေ့	1
ရက	က	1
ရက	က	1
ရက	မက	1
ကလဝိကင််	ကလဝိကင်	1
ကလိဂင််	ကလိဂင်	1

==> baseline-2 <==
ဂတိ	['ကတိ', 'ပတ်', 'ယိ', 'ရှိ', 'သတိရ']
ကနဉီး	['ကနဦး', 'ကြီး']
ကနည်း	['ကနဦး', 'ကလည်း', 'လည်း', 'လည်း', 'လည်း', 'လည်း', 'လည်း']
ကနေ ့	['ကနေ', 'ကနေ့', 'နေ့', 'နေ့', 'ယနေ့']
ကလဝိကင််	['ကလဝိကင်']
ကလိဂင််	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကလိဂင််ရ	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ခရေး	['ကလေး', 'ကလေး', 'ကလေး', 'ဈေး', 'မရွေး', 'ရော']
ခလေး	['ကလေး', 'ကလေး', 'ကလေး', 'ဈေး', 'အမလေး']
ခလေး	['ကလေး', 'ကလေး', 'ကလေး', 'ဈေး', 'အမလေး']

==> baseline-2-distance <==
ကမေ	က	2
ကမေ	ကတိ	2
ကမေ	ကနေ	1
ကမေ	ကနေ့	2
ကမေ	က	2
ကမေ	ကလေး	2
ကမေ	ကလေး	2
ကမေ	ကလေး	2
ကမေ	ကာလ	2
ကမေ	ကား	2

==> baseline-3 <==
ကလဝိကင််	['ကလဝိကင်', 'ကလိဂင်', 'ကလိဂင်ရ']
ကလိဂင််	['ကလဝိကင်', 'ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကလိဂင််ရ	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ခရေးတွေ	['ကလေးတွေ', 'ချေးငွေ', 'ဈေးတွေ', 'ရေတွေ']
ကလေးသူကယ်	['ကလေးသူငယ်']
ကလော်ထုတ်ခြင်တော့တာပါဘဲ	['ကလော်ထုတ်ချင်တော့တာပါဘဲ']
ကလကင််	['ကလဝိကင်', 'ကလိဂင်', 'ကလိဂင်ရ', 'ကလည်း']
ကဠိဂင််ရ	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကာကွယ်နိ်ုင်အောင်	['ကာကွယ်နိုင်အောင်']
ကာရကံရှင်	['ကာယကံရှင်', 'ကာယကံရှင်']

==> baseline-3-distance <==
ကမေ	က	2
ကမေ	ကတိ	2
ကမေ	ကနေ	1
ကမေ	ကနေ့	2
ကမေ	က	2
ကမေ	ကလေး	2
ကမေ	ကလေး	2
ကမေ	ကလေး	2
ကမေ	ကာလ	2
ကမေ	ကား	2

==> map1-1 <==
ကမေ	['ကနေ', 'ကနေ့', 'ကလေး', 'ကလေး', 'ကလေး', 'မကွေး']
ဂတိ	['ကတိ']
ကနဉီး	['ကနဦး']
ကနည်း	['ကတိ', 'ကနဦး', 'ကနေ', 'ကနေ့', 'ကလည်း', 'ကဏ္ဏ', 'ကြီး', 'ခန']
ကနေ ့	['ကနေ', 'ကနေ့']
ကလဝိကင််	['ကလဝိကင်']
ကလိဂင််	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကလိဂင််ရ	['ကလိဂင်ရ', 'ကဠိဂင်ရ']
ခရေး	['ကနေ', 'ကနေ့', 'ကလေး', 'ကလေး', 'ကလေး', 'မရွေး', 'ရှေ့', 'ရွှေ့']
ခလေး	['ကနေ', 'ကနေ့', 'ကလေး', 'ကလေး', 'ကလေး', 'ကလည်း']

==> map1-1-distance <==
ကမေ	ကနေ	1
ကမေ	ကနေ့	1
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	မကွေး	1
ဂတိ	ကတိ	1
ကနဉီး	ကနဦး	1
ကနည်း	ကတိ	1
ကနည်း	ကနဦး	1

==> map1-2 <==
ကလဝိကင််	['ကလဝိကင်']
ကလိဂင််	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကလိဂင််ရ	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ခရေးတွေ	['ကလေးတွေ', 'ဈေးတွေ', 'ရေတွေ', 'ရှေ့နေ']
ကလေးသူကယ်	['ကလေးသူငယ်']
ကလော်ထုတ်ခြင်တော့တာပါဘဲ	['ကလော်ထုတ်ချင်တော့တာပါဘဲ']
ကဠိဂင််ရ	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကာကွယ်နိ်ုင်အောင်	['ကာကွယ်နိုင်အောင်']
ကာရကံရှင်	['ကာယကံရှင်', 'ကာယကံရှင်']
ကါရဂ ံရှင်	['ကာယကံရှင်', 'ကာယကံရှင်']

==> map1-2-distance <==
ကမေ	က	2
ကမေ	ကတိ	2
ကမေ	ကနေ	1
ကမေ	ကနေ့	1
ကမေ	က	2
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလည်း	2
ကမေ	ကာလ	2

==> map1-3 <==
ကလဝိကင််	['ကလဝိကင်', 'ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကလိဂင််	['ကလဝိကင်', 'ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ', 'ကိလဉ်ဇ']
ကလိဂင််ရ	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကလေးသူကယ်	['ကလေးသူငယ်', 'ကိုးကွယ်']
ကလော်ထုတ်ခြင်တော့တာပါဘဲ	['ကလော်ထုတ်ချင်တော့တာပါဘဲ']
ကဠိဂင််ရ	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကာကွယ်နိ်ုင်အောင်	['ကာကွယ်နိုင်အောင်']
ကာရကံရှင်	['ကာယကံရှင်', 'ကာယကံရှင်', 'ခရမ်းချဉ်']
ကါရဂ ံရှင်	['ကာယကံရှင်', 'ကာယကံရှင်']
ကာရဝေလ႞	['ကာရဝေလ']

==> map1-3-distance <==
ကမေ	က	2
ကမေ	ကတိ	2
ကမေ	ကနဦး	3
ကမေ	ကနေ	1
ကမေ	ကနေ့	1
ကမေ	က	2
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလေးတွေ	3

==> map2-1 <==
ကမေ	['ကနေ', 'ကနေ့', 'ကလေး', 'ကလေး', 'ကလေး', 'မကွေး', 'အဖွဲ့', 'အမလေး', 'အမယ်', 'အမှု']
ကနဉီး	['ကတိ', 'ကနဦး', 'ကူညီ']
ကနေ ့	['ကနေ', 'ကနေ့', 'အတွက် ']
ကလဝိကင််	['ကလဝိကင်']
ကလိဂင််	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကလိဂင််ရ	['ကလိဂင်ရ', 'ကဠိဂင်ရ']
ခရေး	['ကနေ', 'ကနေ့', 'ကလေး', 'ကလေး', 'ကလေး', 'မရွေး', 'ရှေ့', 'ရွှေ့', 'အရင်', 'အရမ်း']
ခလေး	['ကနေ', 'ကနေ့', 'ကလေး', 'ကလေး', 'ကလေး', 'ကလည်း', 'အမလေး', 'အလွန်']
ခလေး	['ကနေ', 'ကနေ့', 'ကလေး', 'ကလေး', 'ကလေး', 'ကလည်း', 'အမလေး', 'အလွန်']
ခရေးတွေ	['ကလေးတွေ', 'ရေတွေ', 'ရှေ့နေ']

==> map2-1-distance <==
ကမေ	ကနေ	1
ကမေ	ကနေ့	1
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	မကွေး	1
ကမေ	အဖွဲ့	1
ကမေ	အမလေး	1
ကမေ	အမယ်	1
ကမေ	အမှု	1

==> map2-2 <==
ကလဝိကင််	['ကလဝိကင်', 'ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကလိဂင််	['ကလဝိကင်', 'ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကလိဂင််ရ	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကလေးသူကယ်	['ကလေးသူငယ်']
ကလော်ထုတ်ခြင်တော့တာပါဘဲ	['ကလော်ထုတ်ချင်တော့တာပါဘဲ']
ကလကင််	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ', 'ဟင်းဟင်း', 'အခန်း', 'အလဟသာ', 'အလွန်', 'အလျှင်း', 'အဟင့်']
ကဠိဂင််ရ	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကာကွယ်နိ်ုင်အောင်	['ကာကွယ်နိုင်အောင်']
ကာရကံရှင်	['ကာယကံရှင်', 'ကာယကံရှင်']
ကါရဂ ံရှင်	['ကာယကံရှင်', 'ကာယကံရှင်']

==> map2-2-distance <==
ကမေ	က	2
ကမေ	ကတိ	2
ကမေ	ကနေ	1
ကမေ	ကနေ့	1
ကမေ	က	2
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလည်း	2
ကမေ	ကာလ	2

==> map2-3 <==
ကလဝိကင််	['ကလဝိကင်', 'ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကလိဂင််ရ	['ကလဝိကင်', 'ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကလေးသူကယ်	['ကလေးသူငယ်', 'ကိုးကွယ်']
ကလော်ထုတ်ခြင်တော့တာပါဘဲ	['ကလော်ထုတ်ချင်တော့တာပါဘဲ']
ကဠိဂင််ရ	['ကလဝိကင်', 'ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကာကွယ်နိ်ုင်အောင်	['ကာကွယ်နိုင်အောင်']
ကာရကံရှင်	['ကာယကံရှင်', 'ကာယကံရှင်', 'ငှားလာရင်', 'အာရုံ']
ကါရဂ ံရှင်	['ကာယကံရှင်', 'ကာယကံရှင်']
ကာရဝေလ႞	['ကာရဝေလ']
ကာဠသုတၩ	['ကာဠသုတ', 'အားလုံး']

==> map2-3-distance <==
ကမေ	က	2
ကမေ	ကတိ	2
ကမေ	ကနဦး	3
ကမေ	ကနေ	1
ကမေ	ကနေ့	1
ကမေ	က	2
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလေးတွေ	3

==> map3-1 <==
ကနေ ့	['ကနေ့', 'ကလေး', 'ကလေး', 'ကလေး', 'ယနေ့']
ကလဝိကင််	['ကလဝိကင်']
ကလိဂင််	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ', 'ပရိသတ်', 'အစီအစဉ်']
ကလိဂင််ရ	['ကလိဂင်ရ', 'ကဠိဂင်ရ']
ခရေးတွေ	['ကလေးတွေ', 'ချေးငွေ', 'ဈေးတွေ', 'သဘောတူ']
ကလေးသူကယ်	['ကလေးသူငယ်', 'သဘောတူချက်']
ကလော်ထုတ်ခြင်တော့တာပါဘဲ	['ကလော်ထုတ်ချင်တော့တာပါဘဲ']
ကလကင််	['ထရန်ပ်', 'မရသည့်']
ကဠိဂင််ရ	['ကလိဂင်ရ', 'ကဠိဂင်ရ']
ကာကွယ်နိ်ုင်အောင်	['ကာကွယ်နိုင်အောင်']

==> map3-1-distance <==
ကမေ	ကတိ	1
ကမေ	ကနေ	0
ကမေ	ကနေ့	1
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ခန	1
ကမေ	ဆရာ	1
ကမေ	ဆရာ	1
ကမေ	တခု	1

==> map3-2 <==
ကလိဂင််ရ	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ', 'ကိလဉ်ဇ', 'စတိတ်စင်', 'စစ်တပ်က', 'ပဋိပက္ခ', 'ပရိသတ်', 'အစီအစဉ်']
ကလော်ထုတ်ခြင်တော့တာပါဘဲ	['ကလော်ထုတ်ချင်တော့တာပါဘဲ']
ကဠိဂင််ရ	['ကလိဂင်', 'ကလိဂင်ရ', 'ကဠိဂင်ရ', 'ကိလဉ်ဇ', 'စတိတ်စင်', 'စစ်တပ်က', 'ပဋိပက္ခ', 'ပရိသတ်', 'အစီအစဉ်']
ကာကွယ်နိ်ုင်အောင်	['ကာကွယ်နိုင်အောင်']
ကာရကံရှင်	['ကလဝိကင်', 'ကာယကံရှင်', 'ကာယကံရှင်', 'ဒါဆိုရင်', 'နာမည်ပျက်', 'ပါကစ္စတန်', 'အာဏာပိုင်', 'ဥပတိရုပ်']
ကါရဂ ံရှင်	['ကာယကံရှင်', 'ကာယကံရှင်']
ကာရဝေလ႞	['ကာရဝေလ', 'ကာဠသုတ', 'ပါဝင်တာ', 'ဖာသည်မ', 'မာဘတ်စ်']
ကာဠသုတၩ	['ကာရဝေလ', 'ကာဠသုတ', 'ပါဝင်တာ', 'ဖာဆွမ်', 'ဖာသည်မ', 'မာဘတ်စ်', 'လာလုပ်']
ကားကျပ်တာရယ်	['ကားကြပ်တာရယ်']
ကားမောင်သမား	['ကားမောင်းသမား', 'ဖားအောက်တောရ']

==> map3-2-distance <==
ကမေ	က	2
ကမေ	ကတိ	1
ကမေ	ကနေ	0
ကမေ	ကနေ့	1
ကမေ	က	2
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကာလ	2
ကမေ	ကား	2

==> map3-3 <==
ကလော်ထုတ်ခြင်တော့တာပါဘဲ	['ကလော်ထုတ်ချင်တော့တာပါဘဲ']
ကာကွယ်နိ်ုင်အောင်	['ကာကွယ်နိုင်အောင်']
ကါရဂ ံရှင်	['ကလဝိကင်', 'ကာယကံရှင်', 'ကာယကံရှင်', 'ဒါဆိုရင်', 'နာမည်ပျက်', 'ပါကစ္စတန်', 'အာဏာပိုင်', 'ဥပတိရုပ်']
ကားကျပ်တာရယ်	['ကားကြပ်တာရယ်', 'နားထောင်နေစဉ်', 'နားလည်ခဲ့ရတယ်', 'နေ့ခင်းဖက်', 'ဖတ်ပြကြပါတယ်', 'လိုအပ်ပါတယ်', 'အကြမ်းဖက်', 'အားကစားဘက်']
ကားမောင်သမား	['ကားမောင်းသမား', 'နားထောင်နေစဉ်', 'ဖားအောက်တောရ', 'အထောက်အပံ့']
ကုူညီစောင့်ရှောက်ရမှာပေါ့	['ကူညီစောင့်ရှောက်ရမှာပေါ့']
ကူးသွားပါတယျ	['ကူးသွားပါတယ်']
ကိုကိုဂြာီး	['ကိုကိုကြီး', 'ဆိုလိုတာ', 'ညိုညိုသင်း', 'ပိုတတ်ပြီး', 'မိုဘိုင်း', 'လူပျိုကြီး']
ကိုးကန် ့ နဲ ့ 	['ကိုးကန့်နဲ့ ']
ကောက်ကိုင်လိ်ုက်မိသည်	['ကောက်ကိုင်လိုက်မိသည်']

==> map3-3-distance <==
ကမေ	က	2
ကမေ	ကတိ	1
ကမေ	ကနဦး	3
ကမေ	ကနေ	0
ကမေ	ကနေ့	1
ကမေ	က	2
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလေး	1
ကမေ	ကလည်း	3
```

## Running "count-found.sh" only

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$ cp ../wrong-correct-pairs.clean.txt .

(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay/cosine$ ls baseline-1 map1-1 map2-1 map3-1 baseline-2 map1-2 map2-2 map3-2 baseline-3 map1-3 map2-3 map3-3
baseline-1  baseline-2  baseline-3  map1-1  map1-2  map1-3  map2-1  map2-2  map2-3  map3-1  map3-2  map3-3

(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$ time ./count-found.sh | tee count-found-running-26July2021.log
### Method: cosine/
baseline-1: Found 1052
map1-1: Found 906
map2-1: Found 940
map3-1: Found 433
baseline-2: Found 245
map1-2: Found 854
map2-2: Found 869
map3-2: Found 432
baseline-3: Found 43
map1-3: Found 859
map2-3: Found 866
map3-3: Found 433
### Method: damerau_levenshtein/
baseline-1: Found 1517
map1-1: Found 1587
map2-1: Found 1504
map3-1: Found 1076
baseline-2: Found 1710
map1-2: Found 1392
map2-2: Found 1197
map3-2: Found 795
baseline-3: Found 1436
map1-3: Found 918
map2-3: Found 728
map3-3: Found 464
### Method: hamming_distance/
baseline-1: Found 711
map1-1: Found 1078
map2-1: Found 1014
map3-1: Found 522
baseline-2: Found 895
map1-2: Found 912
map2-2: Found 805
map3-2: Found 470
baseline-3: Found 872
map1-3: Found 682
map2-3: Found 578
map3-3: Found 362
### Method: jaccard/
baseline-1: Found 95
map1-1: Found 310
map2-1: Found 264
map3-1: Found 3
baseline-2: Found 827
map1-2: Found 685
map2-2: Found 406
map3-2: Found 9
baseline-3: Found 743
map1-3: Found 266
map2-3: Found 90
map3-3: Found 9
### Method: jaro_winkler/
baseline-1: Found 1667
map1-1: Found 1528
map2-1: Found 1371
map3-1: Found 211
baseline-2: Found 260
map1-2: Found 52
map2-2: Found 10
map3-2: Found 0
baseline-3: Found 1
map1-3: Found 2
map2-3: Found 2
map3-3: Found 0
### Method: levenshtein/
baseline-1: Found 1472
map1-1: Found 1575
map2-1: Found 1494
map3-1: Found 1049
baseline-2: Found 1709
map1-2: Found 1391
map2-2: Found 1195
map3-2: Found 800
baseline-3: Found 1433
map1-3: Found 918
map2-3: Found 730
map3-3: Found 465

real	0m16.636s
user	0m12.185s
sys	0m0.209s
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$

```


# Rerun Experiment of the String Similarity for Burmese

ခိုင်ဆုဝေ (UTYCC, Myanmar) ရဲ့ မဟာဘွဲ့အတွက်  ရေးခဲ့တဲ့ String Similarity စာတမ်းတုန်းက run ခဲ့ကြတဲ့ experiment ကို နောက်တစ်ခေါက် ပြန် run ထားတာပါ။  

ဆရာ
(26 July 2021)

## Install Jellyfish and Epitran

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

## Required Programs and Files

(base) ye@administrator-HP-Z2-Tower-G4-Workstation:/media/ye/Transcend/paper/next-paper/ksw/exp/paper/chk4myint2htay$ ls
count-found.sh  experiment.py  note.txt  rm-folders.sh  run-all.sh  test-set1-correct.txt  test-set1-wrong.txt

## Running

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

အထက်ပါ running က count-found.sh မပါပဲ run ခဲ့တဲ့ ကြာချိန်။

## Structure of the Output Folder

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

အထက်မှာ ပြထားတဲ့ folder structure အတိုင်း တခြား output folder တွေဖြစ်တဲ့ ...
hamming_distance\
jaro_winkler\
jaccard\
levenshtein\
တို့မှာလည်း ရှိလိမ့်မယ်။

## Running count-found.sh only

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









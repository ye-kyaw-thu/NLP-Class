# Statistical Language Model Building

Draft Note for Khaing Hsu Wai who working on Myanmar Poem LMs...  

## Raw Data

ပြင်ဆင်ထားတဲ့ မြန်မာကဗျာ-corpus က အောက်ပါ format...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ head -n 20 ./Poem_collected_Data_All.txt 
Title	တက်လူ့တေးသံ	ဇော်ဂျီ
ကြက်ဖ သာလျှင်
အာရုဏ်ရောင်လှ ၊ ဝင်းဝါကြ၏ ။
ဥဩ သာလျှင်
ရာသီနွေလ ၊ ဖူးပွင့်ကြ၏ ။
ဖားငယ် သာလျှင်
အာကာမိုးက ၊ မိုးရွာကြ၏ ။
တက်လူ သာလျှင်
 မြန်မာပြည်လှ ၊ အားသစ်ရ၍
ဇေယျအောင်လံ ထူမည်တည်း ။

Title	ဤနေရာ	ဇော်ဂျီ
ဤနေရာတွင်
ညောင်ညိုပင်၏ ၊ မြေပြင်ခြေရင်း
မြစ်ပါးပျဉ်းသည် ၊ သက်ဆင်းလူးလွန့်
မြွေသို့တွန့်၏ ။
ဤနေရာတွင်
ပိန္နဲ့ပင်ဝယ် ၊ ရှဉ့်ရင်ပေါ့ပါး
မြီးဖားဖားသည် ၊ ရွက်ကြားခက်လက်
လျှပ်သို့လက်၏ ။
```

## Preprocessing

Preprocessing အမျိုးမျိုး လုပ်ဖို့ လိုအပ်တယ်။  
အနည်းဆုံး အောက်ပါလိုမျိုး Title ကို ရှင်းပလိုက်တာမျိုး...  
ပုဒ်ထီး ပုဒ်မကို ဖျက်တာမျိုး...  
နှစ်ကြောင်း တွဲလိုက်တာမျိုး...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ perl ./pre-processing.pl ./Poem_collected_Data_All.txt > ./poem.cleaned

(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ head -n 20 ./poem.cleaned
ကြက်ဖ သာလျှင် အာရုဏ်ရောင်လှ  ဝင်းဝါကြ၏ 
ဥဩ သာလျှင် ရာသီနွေလ  ဖူးပွင့်ကြ၏ 
ဖားငယ် သာလျှင် အာကာမိုးက  မိုးရွာကြ၏ 
တက်လူ သာလျှင်  မြန်မာပြည်လှ  အားသစ်ရ၍
ဇေယျအောင်လံ ထူမည်တည်း  ဤနေရာတွင်
ညောင်ညိုပင်၏  မြေပြင်ခြေရင်း မြစ်ပါးပျဉ်းသည်  သက်ဆင်းလူးလွန့်
မြွေသို့တွန့်၏  ဤနေရာတွင်
ပိန္နဲ့ပင်ဝယ်  ရှဉ့်ရင်ပေါ့ပါး မြီးဖားဖားသည်  ရွက်ကြားခက်လက်
လျှပ်သို့လက်၏  ဤနေရာတွင်
ထန်းနှစ်ပင်သည်  တူယှဉ်ပြိုင်မြင့် ရွက်ဝန်းဖွင့်၍  အကျင့်သိက္ခာ
ရှင်သို့သာတည့်  ဤနေရာတွင်
စေတီရှင်သည်  ဖြူစင်မောက်မို့ ကြားဖူးသို့တည့် 
ဤနေရာတွင် ထက်ကောင်းကင်ဝယ်  လေညင်ခတ်တီး
စေတီထီးမှ  ဆည်းလည်းသံရွှင် မိုးကျသွင်တည့် 
ဤသို့သံသာ  ဤရုပ်ဝါသည် ငါ့မှာသတိ မြဲခဲ့၏ 
ရွှေမန်းဆို တောင်တော်ဦးက ကျူးလာတဲ့ မိုးသံငယ်
အုန်းညံခြိမ့်ကြွေးလေ့  တာတော်ခွင်
ရေဝင်အောင် ရွှေကတွတ်ကို မင်းလွှတ်ခဲ့လေး 
ပျိုလေးတို့ရွာ  သာပါစမေး  သာပါတယ်  ရွာလယ်လမ်းမှာ
ပန်းတွေနှင့်မွှေး  ပျိုလေးတို့ရွာ  သာပါစမေး 
```

draft perl script က အောက်ပါအတိုင်း...  

```perl 
#!/usr/bin/env perl

# for Burmese poem data preprocessing
# Ye Kyaw Thu, LU Lab., Myanmar
# 21 Aug 2021
# usage: $ perl ./pre-processing.pl ./Poem_collected_Data_All.txt > ./poem.cleaned

use strict;
use warnings;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

my $ct = 0; my $combined_str = "";
while (!eof($inputFILE)) {
    
    my $line = <$inputFILE>;
    if ($line !~  /^\s*$/) {
        chomp($line);

        #  removed title lines 
        if ($line !~ /Title|title/ ) {
            $combined_str = $combined_str." ".$line;
            $ct++;
            
            if ($ct == 2) {
                # trim leading and trailing spaces
                # To Do: We should consider ", ' ! ...
                # spelling checking ... 
                # prevent combination of sentences from two poems ...
                # 4-3-2, etc.
                # word segmentation ?!
                $combined_str =~ s/^\s+|\s+$|၊|။|၊၊//g;
                print "$combined_str\n";
                $combined_str = "";        
                $ct = 0;
            } 
         }
    }
}

close ($inputFILE);
```

Comment တွေ ဖြည့်ထားတဲ့ အတိုင်းပါပဲ.. မြန်မာကဗျာအတွက် Rhyme တွေအလိုက်တွဲပေးတာမျိုး လုပ်ရန်လိုအပ်...  
Let's do our best...   


## Prepare training and test data

Training ဒေတာနဲ့ test ဒေတာကို ခွဲဖို့လိုအပ်...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ shuf ./poem.cleaned > ./poem.cleaned.shuf
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ wc ./poem.cleaned.shuf 
  22702   91544 3250669 ./poem.cleaned.shuf
```

head, tail command နဲ့ပဲ အလွယ်ခွဲပြီး ဒီမိုလုပ်ပြခဲ့...  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ head  ./poem.cleaned.shuf 
ကြည်လင်တဲ့ ကဗျာပန်း  ညီတညာ 
ဖြူဆွတ်သည် စေတနာပ  သဟာကို စိတ်ရည်စူးပါလို့
အမှောင်ခေတ်က တို့ဘဝ
မောင်တို့အိမ်မှာ မထည်ဝါလည်း ဧည့်လာ စောင်လာ စိတ်ချမ်းသာအောင်
အသူရာ ဗျူငှာမွေ့ နေ့ရက်ဆက်မူး 
မင်းတို့ဟာ ကိုယ့်ရဲ့ရှည်လျားတဲ့ အမှောင်ညမှာ
အရာဝတ္ထုတို့်သည် မိုးထက်တွင် စုဝေး၍
အရွယ်ရောက်လာ  ချစ်သူ့စာများ သည်မှာခေါက်ထည့်  ရင်ခုန်ခဲ့သည်
သူ့လက်ကိုယ့်လက် နှစ်ယောက်လက်ဖြင့်
ကျင့်ပွားစေကာ ဥယျာဉ်သာဝယ် သိက္ခာရှိတာ မြတ်ဆရာ 
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$

(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ head -n 20702 ./poem.cleaned.shuf > poem.cleaned.shuf.train
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ tail -n 2000 ./poem.cleaned.shuf> poem.cleaned.shuf.test
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ wc ./poem.cleaned.shuf.train 
  20702   83508 2965530 ./poem.cleaned.shuf.train
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ wc ./poem.cleaned.shuf.test 
  2000   8036 285139 ./poem.cleaned.shuf.test
```

## Build LM and Measure PPL

ဒီ script က ဆရာ့ Github ရဲ့ Tool အောက်က bash script ဆီကနေ ယူချလာခဲ့တာ..  

```bash
#!/bin/bash

# Very basic language model building with SRILM toolkit for Myanamr students
# SRILM link: http://www.speech.sri.com/projects/srilm/
# Before running this bash shell script, you have to install SRILM on your computer
# Ref link: http://idiom.ucsd.edu/~rlevy/teaching/2015winter/lign165/lectures/lecture13/lecture13_ngrams_with_SRILM.pdf
#
# Written by Ye, LST Lab., NECTEC, Thailand
# Last updated: April 3 2020
# How to run: ./lm-building-exec.sh <corpus-filename> <test-filename>
# e.g. ./lm-building-exec.sh ./my-corpus.txt ./my-test.txt > lm-building-exec.log

# Count Ngram
echo "#count ngram, here -order 2, 2-gram ...";
/home/ye/tool/srilm-1.7.3/bin/i686-m64/ngram-count -text $1 -order 2 -write $1.count;

# check the count file
echo "#checking the count file ..."
cat $1.count;
echo -e "==========\n";

# LM building
# -addsmooth 0 ကို သုံးထားတာက demo run ပြတဲ့ corpus က သေးလွန်းလို့
# တကယ်တမ်းက smoothing technique နဲ့ LM က တွဲသုံးမှ အဆင်ပြေလိမ့်မယ်
echo "#language model building ...";
/home/ye/tool/srilm-1.7.3/bin/i686-m64/ngram-count -text $1 -order 2 -addsmooth 0 -lm $1.lm;

# Check the language model file
echo "#checking the language model file ...";
cat ./$1.lm;
echo -e "==========\n";

# Calc perplexity
echo "#calculating the model perplexity ...";
/home/ye/tool/srilm-1.7.3/bin/i686-m64/ngram -lm ./$1.lm -ppl $2
echo -e "==========\n";

# Converting ARPA format into Binary
echo " Converting ARPA format into Binary ...";
/home/ye/tool/srilm-1.7.3/bin/i686-m64/ngram -order 2 -lm ./$1.lm -write-bin-lm ./$1.lm.bin
ls $1.lm.bin

# Calc perplexity with binary LM
echo "#calculating the binary language model perplexity ...";
/home/ye/tool/srilm-1.7.3/bin/i686-m64/ngram -lm ./$1.lm.bin -ppl $2
echo -e "==========\n";

# Use debug option
# စာကြောင်း တစ်ကြောင်းချင်းစီကို perplexity တွက်ပေးနိုင်တဲ့ option ပါ
# "-debug 2" gives the probability assigned to each token
# လက်တွေ့မှာက binary LM ကို သုံးကြပေမဲ့ ARPA LM နဲ့လည်း -debug option ကို သုံးနိုင်
echo "#calculating the language model perplexity with -debug option...";
/home/ye/tool/srilm-1.7.3/bin/i686-m64/ngram -lm ./$1.lm.bin -ppl $2 -debug 2
```

Make executable without bash command:  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ chmod +x ./lm-building-exec.sh
```

Building LM and calculate PPL with test data:  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ ./lm-building-exec.sh ./poem.cleaned.shuf.train ./poem.cleaned.shuf.test | tee lm.log1
...
...
...
သင်ပေးပညာ မယူပါ
	p( <unk> | <s> ) 	= [OOV] 0 [ -inf ]
	p( <unk> | <unk> ...) 	= [OOV] 0 [ -inf ]
	p( </s> | <unk> ...) 	= [1gram] 0.1986566 [ -0.7018971 ]
1 sentences, 2 words, 2 OOVs
0 zeroprobs, logprob= -0.7018971 ppl= 5.033813 ppl1= undefined

နွယ်အသွင် ညာဘယ်လူးနိုင်ရဲ့ လင်းအရုဏ် နေခြည်ဉီးမှာပဲ
	p( နွယ်အသွင် | <s> ) 	= [1gram] 0 [ -inf ]
	p( <unk> | နွယ်အသွင် ...) 	= [OOV] 0 [ -inf ]
	p( <unk> | <unk> ...) 	= [OOV] 0 [ -inf ]
	p( <unk> | <unk> ...) 	= [OOV] 0 [ -inf ]
	p( </s> | <unk> ...) 	= [1gram] 0.1986566 [ -0.7018971 ]
1 sentences, 4 words, 3 OOVs
1 zeroprobs, logprob= -0.7018971 ppl= 5.033813 ppl1= undefined

ပြာလွင်လွင်တည့် လွမ်းမောငြိခဲ့ သတိနှင့်လျှင် ရှုတိုင်းမြင်မိ
	p( <unk> | <s> ) 	= [OOV] 0 [ -inf ]
	p( <unk> | <unk> ...) 	= [OOV] 0 [ -inf ]
	p( <unk> | <unk> ...) 	= [OOV] 0 [ -inf ]
	p( <unk> | <unk> ...) 	= [OOV] 0 [ -inf ]
	p( </s> | <unk> ...) 	= [1gram] 0.1986566 [ -0.7018971 ]
1 sentences, 4 words, 4 OOVs
0 zeroprobs, logprob= -0.7018971 ppl= 5.033813 ppl1= undefined

ဆိုင်ကြီး ကနားကြီး ထိန်ညီးမွှေးလန်း
	p( <unk> | <s> ) 	= [OOV] 0 [ -inf ]
	p( <unk> | <unk> ...) 	= [OOV] 0 [ -inf ]
	p( <unk> | <unk> ...) 	= [OOV] 0 [ -inf ]
	p( </s> | <unk> ...) 	= [1gram] 0.1986566 [ -0.7018971 ]
1 sentences, 3 words, 3 OOVs
0 zeroprobs, logprob= -0.7018971 ppl= 5.033813 ppl1= undefined

ခါတလေ ပျံကာသန်းရပေမပေါ့ ငြိမ်းချမ်းစိုပြေ(ပြည်)တဲ့
	p( ခါတလေ | <s> ) 	= [1gram] 0 [ -inf ]
	p( <unk> | ခါတလေ ...) 	= [OOV] 0 [ -inf ]
	p( <unk> | <unk> ...) 	= [OOV] 0 [ -inf ]
	p( </s> | <unk> ...) 	= [1gram] 0.1986566 [ -0.7018971 ]
1 sentences, 3 words, 2 OOVs
1 zeroprobs, logprob= -0.7018971 ppl= 5.033813 ppl1= undefined

အိက်စက်မပျော် ဘေးခုတင်ပေါ်မှာလဲငုတ်တုတ်
	p( <unk> | <s> ) 	= [OOV] 0 [ -inf ]
	p( <unk> | <unk> ...) 	= [OOV] 0 [ -inf ]
	p( </s> | <unk> ...) 	= [1gram] 0.1986566 [ -0.7018971 ]
1 sentences, 2 words, 2 OOVs
0 zeroprobs, logprob= -0.7018971 ppl= 5.033813 ppl1= undefined

ဥပါဒ်ဌိဘင် အင်တီဇိုင်းဇီးရိုး
	p( <unk> | <s> ) 	= [OOV] 0 [ -inf ]
	p( <unk> | <unk> ...) 	= [OOV] 0 [ -inf ]
	p( </s> | <unk> ...) 	= [1gram] 0.1986566 [ -0.7018971 ]
1 sentences, 2 words, 2 OOVs
0 zeroprobs, logprob= -0.7018971 ppl= 5.033813 ppl1= undefined

ကျောင်းကြီးအမ သူ့ဘဝကို တွေးဆမြင်ယောင် မိသတည်း
	p( ကျောင်းကြီးအမ | <s> ) 	= [1gram] 0 [ -inf ]
	p( သူ့ဘဝကို | ကျောင်းကြီးအမ ...) 	= [1gram] 0 [ -inf ]
	p( <unk> | သူ့ဘဝကို ...) 	= [OOV] 0 [ -inf ]
	p( <unk> | <unk> ...) 	= [OOV] 0 [ -inf ]
	p( </s> | <unk> ...) 	= [1gram] 0.1986566 [ -0.7018971 ]
1 sentences, 4 words, 2 OOVs
2 zeroprobs, logprob= -0.7018971 ppl= 5.033813 ppl1= undefined

file ./poem.cleaned.shuf.test: 2000 sentences, 8036 words, 5752 OOVs
774 zeroprobs, logprob= -6355.819 ppl= 64.68071 ppl1= 16186.46
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ 
```

Check lm.log1:  
```
$gedit lm.log1
```

လက်ရှိ ဆောက်ထားတဲ့ ကဗျာ-LM နဲ့ sentence generate လုပ်ကြည့်ရင်...  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ /home/ye/tool/srilm-1.7.3/bin/i686-m64/ngram -lm ./poem.cleaned.shuf.train.lm -gen 10 generates 10 random sentences
ဟောဒီမှာ ငါ့ဘဝပါ
ပညာသိများ သူ့စကား မုသားတောင်ယုံချင်တတ်သူမို့
သွင်သွင် သုတ်သွင်း လေချိုညင်းလည်း
နားလည်စွာနဲ့ရုန်းကန်ခြင်းပါ အချစ်ရယ် မိုးက အနွေးအိုပါ
သံယောဇဉ်အမျှင်သစ်တွေနဲ့ ယစ်မူးတွယ်တာနမ်းရှိုက်နေဆဲမှာပဲ
မြို့ပြန်ဝင်သူ ထိုမြို့သူတို့ ထူထောင်ကြကုန် မြို့ရန်ကုန်တွင်
ကျီးကန်းတွေ နှင်းသည်းသည်းကြားမှာပဲ အိပ်တန်းပြန်လာကြပြီ
ပွဲထိုက်သူခင် ကမာကောင်တို့၏အသည်း
မင်းကို မတင်နိုင်ဘူးလို့
အချီချီတိုက်ခိုက် လှိုင်းခေါင်းပတ်ဝိုက်၍ ဒိုက်သရောစွက် စွမ်းသည့်လက်နက်တို့
```

နောက်ထပ်တကြိမ် ကဗျာစာကြောင်းတွေကို generate ထပ်လုပ်ကြည့်ရင်...  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$ /home/ye/tool/srilm-1.7.3/bin/i686-m64/ngram -lm ./poem.cleaned.shuf.train.lm -gen 10 generates 10 random sentences
ဖြောင့်မတ်ရှိသူ စိတ်ထားဖြူ၍ ကျင့်မူသီလ ပြည့်စုံလှဘိ
ငြိမ်းချမ်းရေးကို... မြတ်လေးစုံမက် ချစ်နှစ်သက်သည့်
ဥဩ
ထားခဲ့သူသို့ မေတ္တာပို့သ ဘွားအိုပြောပြသော် ထာဝရဘုရား သခင်အားလျှင်
ရိုးရာဂုဏ်ပန်း လန်းစေခဲ့ ပျူငှာယဉ်ကျေး အဆင်အသွေးတို့
နှံ့ကျော်အောင် တလှိုင်လှိုင်ပ တကြိုင်ကြိုင် ရနံ့မွှေးခဲ့ရ
ဘာဝနာစီးဖြန်း ကမ္မဋ္ဌာန်းဝိပဿနာ ဒါနသီလ သမထတို့
သူ့တို့ ထဲမှာ ရေတွေကိုသိုလှောင်ပြီး
လမ်းတစ်လျှောက်မှာ မြက်ခင်းက လဲ့လဲ့
ပူမှုကင်းဝေး စိတ်လွန်အေးဘိ
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/my-poem/ye/statistical-LM$
```

## To Do

တွေ့ရတဲ့ အတိုင်းပဲ လက်ရှိ LM က သုံးလို့ အဆင်မပြေနိုင်သေးဘူး...  

- Brain stroming for Preprocessing  
- Building and Testing with Neural LM approaches  

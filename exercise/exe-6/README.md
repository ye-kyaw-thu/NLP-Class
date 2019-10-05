# WER Calculation Exercise ###

## source of SCLITE toolkit:  
https://github.com/usnistgov/SCTK  

## Installation:  
git clone https://github.com/usnistgov/SCTK  

## read README.md file for installation instruction:  
make config  
make all  
make check  
make install  
make doc  

## Or Copying binary files:  
If you got some compilation errors, one more option is copying the compiled binary files.  

## Add sclite toolkit path to $PATH:  

sudo gedit ~/.bashrc  

add following line:  
export PATH=$PATH:/home/lar/tool/SCTK/bin  

## Exercise:  

Write a perl script for tagging "speaker ID" for reference files: "test.my", "test.bk"  

Here, my = Myanmar, bk = Beik or Myeik  


## Example format:  

ဒယ်ကောင်မငယ် နင့် ဝို ချစ် ပါလိမယ် ။ (ye_1)  
ဒယ်ကောင်မငယ် က ရရိ ဝမ်းသာ နေရယ်  ။ (ye_2)  
ဒယ်ကောင်မငယ် တအားအိုသွားမယ်လို့ကျွန်တော်မျှော်လင့်ထားရယ် ။ (ye_3)  
ဒီ ကို လာ ရယ်လား ။ (ye_4)  
အယ့်ဒါ ဘယ်သူ့ ပန်းကုံး ရိ  ။ (ye_5)  

Don't forget to tag "Speaker ID" for all hypothesis file or SMT PBSMT translated files:  

They are:  

./PBSMT/  
├── bk-my  
│   └── test.cleaned.1  
└── my-bk
    └── test.cleaned.1  


## Do WER Calculation:  

### to see some SYSTEM SUMMARY PERCENTAGES on screen 
 sclite -r ../../../test.my.id -h ./test.cleaned.1.id -i spu_id

### running with pra option 

 sclite -r ../../../test.my.id -h ./test.cleaned.1.id -i spu_id -o pra
 
### running with dtl option

 sclite -r ../../../test.my.id -h ./test.cleaned.1.id -i spu_id -o dtl

if you can write a shell script, write it.

# If you finish running all steps above, you will get following files:

./PBSMT/  
├── bk-my  
│   ├── test.cleaned.1  
│   ├── test.cleaned.1.id  
│   ├── test.cleaned.1.id.dtl  
│   └── test.cleaned.1.id.pra  
└── my-bk  
    ├── test.cleaned.1  
    ├── test.cleaned.1.id  
    ├── test.cleaned.1.id.dtl  
    └── test.cleaned.1.id.pra  
    
# File: /PBSMT/bk-my/test.cleaned.1.id.pra file

		DUMP OF SYSTEM ALIGNMENT STRUCTURE  

System name:   ./test.cleaned.1.id  

Speakers:  
    0:  ye  

Speaker sentences   0:  ye   #utts: 1044  
id: (ye_1)  
Scores: (#C #S #D #I) 4 1 0 1  
REF:  သူမ ************ ခင်ဗျားကို ချစ် ပါလိမ့်မယ် ။   
HYP:  သူမ မင်း ကို                      ချစ် ပါလိမ့်မယ် ။   
Eval:           I            S                                                                                

id: (ye_2)  
Scores: (#C #S #D #I) 6 0 0 0  
REF:  သူမ က ရလို့ ဝမ်းသာ နေတာ ။   
HYP:  သူမ က ရလို့ ဝမ်းသာ နေတာ ။   
Eval:                                                                     

id: (ye_3)  
Scores: (#C #S #D #I) 2 1 5 0  
REF:  သူမ ပိုပြီးအိုစာ သွားလိမ့်မယ် လို့ ကျွန်တော် မျှော်လင့်ထား ခဲ့တယ်                                                                                                                ။   
HYP:  သူမ ************************************ ************************************ ************ *************************** *************************************** တအားအိုသွားမယ်လို့ကျွန်တော်မျှော်လင့်ထားရယ် ။     
Eval:           D                                    D                                    D            D                           D                                       S                                                                                                                                       

id: (ye_4)  
Scores: (#C #S #D #I) 4 1 0 0  
REF:  ဒီ ကို လာ တာလား ။   
HYP:  ဒီ ကို လာ သလား    ။ 
Eval:                         S                     

id: (ye_5)  
Scores: (#C #S #D #I) 4 1 0 0  
REF:  ဒါ ဘယ်သူ့ ပန်းကုံး လဲ    ။   
HYP:  ဒါ ဘယ်သူ့ ပန်းကုံး သလဲ ။   
Eval:                                                    S               

# File: /PBSMT/my-bk/test.cleaned.1.id.dtl

DETAILED OVERALL REPORT FOR THE SYSTEM: ./test.cleaned.1.id  

SENTENCE RECOGNITION PERFORMANCE  

 sentences                                        1044  
 with errors                             89.9%   ( 939)  

   with substitions                      88.9%   ( 928)  
   with deletions                        24.3%   ( 254)  
   with insertions                       23.7%   ( 247)  


WORD RECOGNITION PERFORMANCE  

Percent Total Error       =   42.8%   (2912)  

Percent Correct           =   63.1%   (4299)  

Percent Substitution      =   31.9%   (2174)  
Percent Deletions         =    4.9%   ( 335)  
Percent Insertions        =    5.9%   ( 403)  
Percent Word Accuracy     =   57.2%  


Ref. words                =           (6808)  
Hyp. words                =           (6876)  
Aligned words             =           (7211)  

CONFUSION PAIRS                  Total                 (1710)  
                                 With >=  1 occurrences (1710)  

   1:   40  ->  ဝို ==> ကို  
   2:   35  ->  မင်း ==> နင်  
   3:   19  ->  ကို ==> ဝို  
   4:   17  ->  သူ ==> ဒယ်ကောင်မငယ်  
   5:   15  ->  မင့် ==> နင်  
   6:   12  ->  ငါ ==> ကျွန်တော်  
   7:   12  ->  လဲ ==> ရိ  
   8:   11  ->  နင် ==> ခင်ဗျား  
   9:   11  ->  သွား ==> သော  
  10:    9  ->  ဝ ==> ဟုတ်ဝ  


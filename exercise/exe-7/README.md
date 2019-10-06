# Building Word Segmentation Model with CRF

Here we will use CRF++ toolkit.Usage:  
[https://taku910.github.io/crfpp/](https://taku910.github.io/crfpp/)

## 1. Install CRF++ toolkit.

Download Path:  
[https://drive.google.com/drive/u/0/folders/0B4y35FiV1wh7fngteFhHQUN2Y1B5eUJBNHZUemJYQV9VWlBUb3JlX0xBdWVZTWtSbVBneU0](https://drive.google.com/drive/u/0/folders/0B4y35FiV1wh7fngteFhHQUN2Y1B5eUJBNHZUemJYQV9VWlBUb3JlX0xBdWVZTWtSbVBneU0)

Latest Version Filename: CRF++0.58.tar.gz  
(Note: .zip file is for Windows OS)

### Untar
tar -xzvf CRF++0.58.tar.gz  

### After untar, run following commands for CRF++ installation on your machine
./configure  
make  
sudo make install  

## 2. Read well explanation about CRF++

Especially: 
- Usage/Training and Test file formats
- Preparing feature templates

## 3. Browse train, closed-test and open-test data

Check ./data/

train.my (for building a model or training data)
closed-test.my (closed-test data, i.e. extracted data from train.my file)
open-test.my (open-test data, i.e. not contained in train.my file)


## 4. Preprocessing steps

- Syllable Breaking  (if you want to build a CRF model with syllable unit)
- Character Breaking (if you want to build a CRF model with character unit)
- SubWord level ?! (you can also consider subword level segmentation ...)

- Based on an example word segmentation training data of CRF++ toolkit and consider how to label Myanmar data for supervised moedling:  

Example labeling or features for Japanese Word Segmentation (from /CRF++-0.58/example/seg/):  

```
１	n	B  
日	k	B  
付	k	B  
で	h	B  
毎	k	B  
日	k	I  
新	k	I  
聞	k	I  
社	k	I  
特	k	B  
別	k	I  
顧	k	B  
問	k	I  
に	h	B  
委	k	B  
嘱	k	I  
さ	h	B  
れ	h	B  
た	h	B  
４	n	B  
氏	k	B  
の	h	B  
略	k	B  
歴	k	I  
は	h	B  
次	k	B  
の	h	B  
通	k	B  
り	h	I  
。	y	B  

　	y	B  
有	k	B  
.
.
.
```

Here   
- "k" for Kanji
- "h" for hiragana character
- "t" for katana character
- "n" for number

- "B" for beginning of a word
- "I" for internal of a word

### Suggestion in Myanmar language:

- မြန်မာစာလုံးတွေကို ဘယ်လို segmentation unit နဲ့ ဖြတ်ပြီး မော်ဒယ် ဆောက်မလဲ ဆိုတာကို စဉ်းစားပါ
- လေဘယ် ဘယ်လိုထိုးရင် ကောင်းမလဲ၊ tag တွေကို ဘယ်နှစ်မျိုး သတ်မှတ်ရင် word segmentation ရလဒ်က ပိုကောင်းလာမလဲ ဆိုတာကို စဉ်းစားကြည့်ပါ
- လက်ရှိ exercise လုပ်ခိုင်းထားတာက မြန်မာစာအတွက် word segmentation မော်ဒယ် ဆောက်တာ ဆိုပေမယ့်၊ ဆရာ တင်ပေးထားတဲ့ training data မှာ အင်္ဂလိပ်စာလုံးတွေလည်း ပါနေတယ် ဆိုတဲ့ အချက်ကိုလည်း ဂရုပြုပါ
- y label အတွက်က "B", "I" ပဲ ဖြစ်ဖြစ်၊ "|", "-" ပဲဖြစ်ဖြစ် လုပ်လို့ရတယ်။ နှစ်မျိုးတည်း မဟုတ်ပဲ ဆရာတို့ ICGEC 2015 paper မှာ လုပ်ထားခဲ့သလို "-", "|", "<", ">" စသည်ဖြင် နှစ်မျိုးထက်မက ပေးပြီး စမ်းချင်လည်း စမ်းကြည့်နိုင်ပါတယ်။
- template file ကိုလည်း ကိုယ်ရဲ့ training data format အပေါ်မှာ မူတည်ပြီးတော့ ပြောင်းလဲပေးဖို့ကိုလည်း မမေ့ပါနဲ့။ ဥပမာ ကော်လံ ၂ခုသုံးထားလား၊ ၃ခုသုံးထားလား အဲဒီအပေါ်ကို မူတည်ပြီး template file ကို update လုပ်ဖို့ လိုအပ်ပါတယ်။ နောက်ပြီးတော့ character သို့ syllable တစ်လုံးကို တည်လိုက်ပြီး အဲဒီ စာလုံးရဲ့ နောက် ဘယ်နှစ်လုံးရဲ့ လေဘယ်တွေ၊ အဲဒီစာလုံးရဲ့ ရှေ့ ဘယ်နှစ်လုံးရဲ့ property တွေကို မော်ဒယ်ကို ထည့်သွင်းစဉ်းစားပြီး learn လုပ်စေချင်တာလဲ ဆိုတဲ့ အပေါ်ကို မူတည်ပြီးလည်း template ကို update လုပ်ဖို့ လိုအပ်ပါတယ်
- Machine learning ရဲ့ သဘောသဘာဝ အတိုင်း feature engineering လုပ်ကြည့်ဖို့ လိုအပ်ပါတယ်။ မော်ဒယ် အမျိုးမျိုး ဆောက်ကြည့်ပြီးတော့ open test နဲ့ evaluation ထပ်ခါထပ်ခါ လုပ်ပြီး the best accuracy or F-score စတာတွေကို ရအောင် ကြိုးစားရပါလိမ့်မယ်

============

Refer labeling of our word segmentation paper:

Win Pa Pa, Ye Kyaw Thu, Andrew Finch, Eiichiro Sumita, "Word Boundary Identification for Myanmar Text Using Conditional Random Fields", In Proceedings of the Ninth International Conference on Genetic and Evolutionary Computing, August 26-28, 2015, Yangon, Myanmar, pp. 447-456. [Paper Link](https://github.com/ye-kyaw-thu/papers/blob/master/ICGEC2015/typeinst.pdf)

- Write a perl script for labeling

## 5. Prepare a template file

Example template file:  

```
# Unigram  
U00:%x[-2,0]  
U01:%x[-1,0]  
U02:%x[0,0]  
U03:%x[1,0]  
U04:%x[2,0]  
U05:%x[-2,0]/%x[-1,0]/%x[0,0]  
U06:%x[-1,0]/%x[0,0]/%x[1,0]  
U07:%x[0,0]/%x[1,0]/%x[2,0]  
U08:%x[-1,0]/%x[0,0]  
U09:%x[0,0]/%x[1,0]  

# Bigram
B
```

## 6.Training a CRF Word Segmentation Model

```bash
crf_learn -f 3 -c 4.0 template train.my model  
```

## 7. Testing your CRF model

### Testing with Closed-test data

```bash
crf_test -m model closed-test.my  
```

### Testing with Open-test data

```bash
crf_test -m model open-test.my  
```

## 8.Make evaluation and consider to increase your model performance

For example:
- Updating features
- Updating template
- Changing parameters of CRF++ training process  

# One more exercise

Write a perl program for changing column format of model output into normal writing format (left to right).  



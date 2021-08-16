# Annotating sounds with Praat



## Installation

Praat ရဲ့ homepage link က အောက်ပါအတိုင်းပါ။  
[https://www.fon.hum.uva.nl/praat/](https://www.fon.hum.uva.nl/praat/)

Download link က အောက်ပါအတိုင်းပါ။  
[https://www.fon.hum.uva.nl/praat/download_linux.html](https://www.fon.hum.uva.nl/praat/download_linux.html)

Download လုပ်ပြီးသွားတဲ့အခါမှာ ကိုယ် installation လုပ်ချင်တဲ့ path အောက်မှာ folder အသစ်တစ်ခုဆောက်ပြီးတော့ စောစောက download လုပ်ထားတဲ့ .tar.gz ဖိုင်ကို move လုပ်ပါ။  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$ mkdir praat6151
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$ cd praat6151/
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/praat6151$ mv ~/Downloads/praat6151_linux64.tar.gz .
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/praat6151$ 
```

ပြီးရင်တော့ အောက်ပါအတိုင်း unzip လုပ်ယူပါ။  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/praat6151$ tar -xzvf ./praat6151_linux64.tar.gz 
praat
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/praat6151$ 
```

ကိုယ်သုံးမယ့် Praat ပရိုဂရမ်ရဲ့ version ကိုလည်း confirmation လုပ်ပါ။  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/praat6151$ ./praat --version
Praat 6.1.51 (July 22 2021)
```

## Annotation

အသံတွေကို annotation လုပ်တယ်ဆိုတာကို အလွယ်ရှင်းရရင် ဖမ်းထားတဲ့ အသံ (recorded sound/speech) တွေကို အပိုင်းပိုင်းဖြတ်ပြီး (i.e. segmentation) လေဘယ်ထိုးတာ ပါပဲ။ ဒီ tutorial က Praat ဆောဖ့်ဝဲလ် ကိုသုံးပြီး အသံဖိုင်ကို ဗမာစာ text label ထိုးတာ၊ audio သမားတွေ speech သမားတွေကပြောပြောနေကြတဲ့ transcript လုပ်တာကို သင်ပေးတဲ့ tutorial အတိုလေးပါ။  

Annotation လုပ်ဖို့အတွက် အရင်ဆုံး အသံဖိုင်လိုအပ်ပါတယ်။ အသံဖိုင်က ကိုယ့်ဖာသာကိုယ် recording လုပ်ယူတာ (သို့) ရှိပြီးသား အသံဖိုင်ကို ဖွင့်ဖတ်တာ (သို့) ဖော်မြူလာနဲ့ အသံဖန်ကို ဖန်တီးယူတာ စတဲ့ သုံးမျိုးထဲက တစ်နည်းနည်းနဲ့ ရယူနိုင်ပါတယ်။  

### 1.Recording with Praat

အသံ recording လုပ်ပြီး မှ speech sound ဖိုင်ကို ဖန်တီးယူမယ်ဆိုရင်တော့ ကိုယ့်ကွန်ပျူတာမှာ တပ်ထားတဲ့ မိုက်ကရိုဖုန်း ရှိနေရပါမယ်။ Praat ကို run မလုပ်ခင်မှာ အရင်ဆုံး မိုက်ကရိုဖုန်းကို ကွန်ပျူတာနဲ့ ကြိုတင် ချိတ်ဆက်ထားတာက ပိုကောင်းပါတယ်။   

ASR, TTS အတွက်က mono sound ဖိုင်ကိုပဲ သုံးတာက ပုံမှန်မို့လို့ Recording လုပ်မယ်ဆိုရင် Praat Objects Windows ရဲ့ "New" menu အောက်က "Record mono Sound..." ကို ရွေးပါ။ အောက်ပါ "SoundRecorder" window ကို မြင်ရပါလိမ့်မယ်။  

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/sound_recorder_screen.png" alt="drawing" width="600"/>  
</p>  
<div align="center">
  Fig. Sound Recorder Window of Praat    
</div> 

<br />

Record ဆိုတဲ့ button ကို နှိပ်ရင် recording က စတင် လုပ်နေပြီဖြစ်ပါတယ်။ ကိုယ့်စက်နဲ့ ချိတ်ဆက်ထားတဲ့ မိုက်ကရိုဖုန်းက ပုံမှန်အလုပ်လုပ်တယ်၊ Praat ပရိုဂရမ်ကလည်း သိတယ်ဆိုရင် စကားပြောကြည့်တဲ့အခါမှာ အစိမ်းရောင် ဘားက တက်လိုက်ကျလိုက်ဖြစ်တာကို မြင်တွေ့ရမှာ ဖြစ်ပါတယ်။ အဲဒါဆိုရင် အသံဖမ်းတဲ့ အလုပ်ကို ဆက်လုပ်သွားလို့ ရပါပြီ။ တစ်ခုရှိတာက မိုက်ရိုဖုန်းရဲ့ setting က လက်ခံတဲ့အသံ volume ကို အရမ်းမြှင့်ထားတယ် (သို့) စကားပြောတဲ့သူရဲ့ အသံက တအား ကျယ်နေတဲ့ အခါမျိုးမှာတော့ recording လုပ်နေစဉ်အချိန်မှာ အောက်ပါ ပုံမှာ ပြထားတဲ့အတိုင်း အဝါရောင်၊ အနီရော် စသည်ဖြင့် warning လုပ်တဲ့ ဘားတွေကို မြင်နေရမှာ ဖြစ်ပါတယ်။ အဲဒီလိုဖြစ်နေရင်တော့ အသံစတင် မဖမ်းခင်မှာ မိုက်ကရိုဖုန်းရဲ့ setting ကို ပြန်ညှိတာ (သို့) စကားပြောတဲ့ သူရဲ့ အသံက တအား volume မြင့်နေတယ်ဆိုရင်လည်း အသံကို နှိမ့်ပြောခိုင်းတာ စတာတွေကို လုပ်သင့်ပါတယ်။  

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/sound_recorder_screen_meter.png" alt="drawing" width="600"/>  
</p>  
<div align="center">
  Fig. Meter Bar of Sound Recorder Window of Praat    
</div> 

<br />

Note: ပထမဆုံး recording လုပ်ဖို့အတွက် "Record" ဆိုတဲ့ Button ကို စနှိပ်လိုက်တဲ့အခါမှာတော့ အထက်ပါ အရောင်သုံးမျိုး ပုံစံမျိုးကနေ ဘားက အောက်ဖက်ကို နိမ့်ကျသွားတာမျိုး တစ်ခါတော့ဖြစ်ပါတယ်။ initialize လုပ်တာကို user မြင်အောင် ပြတာဖြစ်ပါတယ်။ အဲဒါက ပြဿနာ မဟုတ်ပါဘူး။ recording လုပ်နေတဲ့ အချိန်မှာသာ အနီရောင်၊ အဝါရောင် မဖြစ်အောင် ထိန်းညှိပေးပါ။  

Sampling frequency ကတော့ default ဖြစ်တဲ့ 44100 Hz နဲ့ပဲသွားပါ။ အိုကေပါတယ်။  

"Record" နဲ့ "Stop" ဆိုတဲ့ Button နှစ်ခုကို သုံးပြီးတော့ recording လုပ်ပြီးရင် "Play" ဆိုတဲ့ Button နဲ့ recording လုပ်ထားတဲ့ အသံကို ပြန်နားထောင့်ကြည့်လို့ ရပါတယ်။ အသံသွင်းထားတာက ပြန်နားထောင်ကြည့်ပြီး အဆင်ပြေတယ် သိမ်းမယ် ဆိုရင်တော့ "Save to list" ဆိုတဲ့ Button နဲ့ safe လုပ်သွားပါ။ တကယ်လို့ တစ်ဖိုင်ထက်မက recording လုပ်ထားတယ် ဆိုရင်တော့ သိမ်းပြီးသွားတဲ့ အသံဖိုင်တွေက "Praat Objects" Window ရဲ့ "Objects" list box မှာ "1. Sound untitled", "2. Sound untitled", "3. Sound untitled" ... ဆိုတဲ့ နာမည်နဲ့ တန်းစီပြီး သိမ်းပေးသွားပါလိမ့်မယ်။ အောက်ပါပုံမှာ ပြထားတဲ့ ပုံစံမျိုးနဲ့ recording လုပ်ထားတဲ့ ဖိုင်နာမည်တွေကို မြင်ရပါလိမ့်မယ်။  

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/objects_windows1.png" alt="drawing" width="600"/>  
</p>  
<div align="center">
  Fig. Recorded Files in the List of Praat Objects Windows
</div> 

<br />

အသံသွင်းထားတဲ့ ဖိုင်နာမည်တွေကို နာမည်ပြောင်းတာကတော့ "Rename" ဆိုတဲ့ Button ကိုနှိပ်ပြီးတော့ ပြောင်းသွားလို့ ရပါတယ်။  

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/objects_window2.png" alt="drawing" width="600"/>  
</p>  
<div align="center">
  Fig. Renaming Recorded Files
</div> 

<br />

### 2.Reading a Sound File

ကိုယ်က ရှိပြီးသားဖိုင်ကို ဖွင့်ပြီး အလုပ်လုပ်မှာ ဆိုရင်တော့ HDD ပေါ်က သို့မဟုတ် USB stick စတဲ့ storage device တစ်ခုခုကနေ ဖွင့်ဖတ်ယူလို့လည်း ရပါတယ်။ Praat က audio coding format အမျိုးမျိုးကို support လုပ်ပါတယ်။ အဲဒါကြောင့် WAV, AIFF or AIFC, FLAC, NIST, MP3 စတဲ့ audio ဖိုင် အကုန်လုံးလိုလိုကို Praat နဲ့ ဖွင့်ဖတ်ပြီး sound editing လုပ်လို့ ရပါတယ်။ 

### 3.Creating a Sound From a Fomula  


## References

https://www.fon.hum.uva.nl/praat/
https://en.wikipedia.org/wiki/Audio_file_format


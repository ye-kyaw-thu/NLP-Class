# Annotating sounds with Praat

Praat ဆိုတဲ့ tool က speech analysis, speech processing, signal processing သုတေသန အလုပ်တွေအတွက် အင်မတန်ကို အသုံးဝင်တဲ့ ပရိုဂရမ် တစ်ခုပါ။ ဒီ ပရိုဂရမ်ကို သုံးပြီးတော့ လုပ်လို့ ရတဲ့ အလုပ်တွေက တကယ်ကို အများကြီးပါ ဥပမာ spectrographic analysis, articulatory synthesis, formant analysis, pitch analysis, neural networks စတဲ့ အလုပ်တွေအတွက်အသုံးဝင်ပါတယ်။ ဒီ Github page မှာတော့ Praat ကို အခြေခံအသုံးပြုပုံနဲ့ wave ဖိုင်ကို annotation လုပ်တဲ့အပိုင်းကိုပဲ အဓိကထား သင်ကြားပေးသွားပါမယ်။  

## Installation

Praat ရဲ့ homepage link က အောက်ပါအတိုင်းပါ။  
[https://www.fon.hum.uva.nl/praat/](https://www.fon.hum.uva.nl/praat/)

Praat ပရိုဂရမ်က operating system အမျိုးမျိုး (Windows, Mac, Linux) မှာ run လိုရပါတယ်။ ဒီ tutorial မှာတော့ Linux OS ပေါ်မှာ installation လုပ်တာကိုပဲ ပြောပါမယ်။  

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
  Fig. Recorded Files in the List of Praat Objects Window
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

တစ်ခု သိထားရမှာက လက်ရှိ Objects Window အောက်မှာ မြင်နေရတဲ့ ဖိုင်က temporary အနေနဲ့ပဲ ရှိနေတာဖြစ်ပြီးတော့ တကယ်တမ်း hard disk drive (HDD) မှာ ဖိုင်အနေနဲ့ သိမ်းဆည်းချင်တယ်ဆိုရင်တော့ "Save" Menu အောက်က "Save as WAV file..." ဆိုတာကို နှိပ်ပြီး သိမ်းမှသာ သိမ်းပေးမှာ ဖြစ်ပါတယ်။  

### 2.Reading a Sound File

ကိုယ်က ရှိပြီးသားဖိုင်ကို ဖွင့်ပြီး အလုပ်လုပ်မှာ ဆိုရင်တော့ HDD ပေါ်က သို့မဟုတ် USB stick စတဲ့ storage device တစ်ခုခုကနေ ဖွင့်ဖတ်ယူလို့လည်း ရပါတယ်။ Praat က audio coding format အမျိုးမျိုးကို support လုပ်ပါတယ်။ အဲဒါကြောင့် WAV, AIFF or AIFC, FLAC, NIST, MP3 စတဲ့ audio ဖိုင် အကုန်လုံးလိုလိုကို Praat နဲ့ ဖွင့်ဖတ်ပြီး sound editing လုပ်လို့ ရပါတယ်။  

ရှိပြီးသား wave ဖိုင်တစ်ဖိုင်ကို ဖွင့်ပြီး editing လုပ်မယ် ဆိုရင်တော့ Praat Objects Window ရဲ့ "Open" menu အောက်က "Read from file..." sub menu ကို ရွေးပြီး ကိုယ်ဖွင့်ချင်တဲ့ ဖိုင်ရှိနေတဲ့ path ကိုသွားပြီး select လုပ်ပြီး ဖွင့်ရမှာ ဖြစ်ပါတယ်။ ဥပမာအနေနဲ့ audio/ ဖိုလ်ဒါအောက်က recording1.wav ဆိုတဲ့ ဖိုင်ကို ဖွင့်ကြည့်ရအောင်။ Praat Objects Window ရဲ့ Object list ထဲမှာ "1. Sound recording1" ဆိုပြီးတော့ မြင်ရပါလိမ့်မယ်။ အဲဒါဆိုရင်တော့ အဲဒီ recording1 ဖိုင်နဲ့ ပတ်သက်ပြီး ကိုယ်လုပ်ချင်တဲ့ အလုပ်တွေကို စလုပ်လို့ ရပါပြီ။ Transcript လုပ်မယ် ဆိုရင်တော့ "View & Edit" button ကို နှိပ်ပါ။ အဲဒါဆိုရင် အဲဒီ wave ဖိုင်ရဲ့ waveform ပုံစံရော spectrogram ရော ကို အောက်ပါအတိုင်း မြင်ရပါလိမ့်မယ်။  


<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/recording1.png" alt="drawing" width="600"/>  
</p>  
<div align="center">
  Fig. Viewing Recorded Wavefile (filename:recording1.wav)
</div> 

<br />

Recording လုပ်ထားတဲ့ ဗမာစာကြောင်းက "ကန်စွန်းရွက် နဲ့ မှိုကြော် တစ်ပွဲ ပေးပါ" ဆိုတဲ့ စာကြောင်းပါ။   

### 3.Creating a Sound From a Fomula  

## Viewing and Editing

## Segmentation and Annotation

## Finding Zero Crossings

## Praat Scripting

ဒီ tutorial က transcription/annotation ကိုပဲ အဓိကထား သင်ကြားပေးဖို့ ရည်ရွယ်ပေမဲ့ Prat script ဆိုတာကိုလည်း briefly မိတ်ဆက်ပေးချင်ပါတယ်။ ဘာကြောင့်လဲ ဆိုတော့ Prat မှာ script ရေးပြီး လုပ်ချင်တဲ့ အလုပ်တွေကို ခိုင်းလို့ရတဲ့ ဒီ facility ကြောင့် အကြိမ်ကြိမ်အခါခါ လုပ်ရတဲ့ အလုပ်တွေကို script ရေးထားလိုက်ပြီးတော့ လိုအပ်တဲ့အချိန်မှာ run လိုက်တာက ပိုအဆင်ပြေလွယ်ကူတာကြောင့်ပါ။ script ရေးတာက သာမာန်ယူဇာတွေအတွက်က ခက်ခဲနိုင်ပေမဲ့ ကွန်ပျူတာ ပရိုဂရမ်ရေးနည်းတွေနဲ့ အကျွမ်းတဝင်ရှိတဲ့သူတွေအတွက်က self-study လုပ်သွားနိုင်ရင် speech processing နဲ့ ပတ်သက်တဲ့ အလုပ်တွေအများကြီးကို တိုးချဲ့လုပ်ကိုင်နိုင်သွားမှာမို့ပါ။  

### Script Example No.1

```
Read from file: "/home/ye/tool/praat6151/annotation/audio/recording1-edited.wav"
View & Edit
editor: "Sound recording1-edited"
Zoom: 0.193610, 0.965184
```

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/read-wav-and-zoom-in-output.png" alt="drawing" width="600"/>  
</p>  
<div align="center">
  Fig. Output Screen of the Praat Script (Read the wavefile: recording1.wa and Zoom in the Interval 0.193610 and 0.965184)
</div> 

<br />

### Script Example No.2

```
frequency = 377
Create Sound from formula: "ဖော်မြူလာက ထုတ်ပေးတဲ့ အသံလှိုင်း" , 1, 0.0, 1.0, 44100, "1/2 * sin(2*pi*frequency*x)"
Play
```

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/output-of-create-a-sound1-script.png" alt="drawing" width="600"/>  
</p>  
<div align="center">
  Fig. Output Screen of the Sound Produced by the Praat Script
</div> 

<br />

### Script Example No.3

```
Reverse
View & Edit
```

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/reverse-output.png" alt="drawing" width="600"/>  
</p>  
<div align="center">
  Fig. Output Screen of the Reverse Version of the Recorded Wave File
</div> 

<br />

## Praat Keyboard Shortcuts

## Demo Video

## References

1. https://www.fon.hum.uva.nl/praat/  
2. Boersma, Paul (2001). Praat, a system for doing phonetics by computer. Glot International 5:9/10, 341-345.  
3. https://en.wikipedia.org/wiki/Audio_file_format  
4. https://www.fon.hum.uva.nl/praat/manualsByOthers.html
5. http://phonetics.linguistics.ucla.edu/facilities/acoustic/praat.html
6. https://phon.wordpress.ncsu.edu/lab-manual/scripts/praat-scripting/

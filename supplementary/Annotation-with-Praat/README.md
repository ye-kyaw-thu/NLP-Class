# Annotating sounds with Praat

[Praat](https://www.fon.hum.uva.nl/praat/) ဆိုတဲ့ open-source tool က speech analysis, speech processing, signal processing သုတေသန အလုပ်တွေအတွက် အင်မတန်ကို အသုံးဝင်တဲ့ ပရိုဂရမ် တစ်ခုပါ။ ဒီ ပရိုဂရမ်ကို သုံးပြီးတော့ လုပ်လို့ ရတဲ့ အလုပ်တွေက တကယ်ကို အများကြီးပါ ဥပမာ spectrographic analysis, articulatory synthesis, formant analysis, pitch analysis, neural networks စတဲ့ အလုပ်တွေအတွက်အသုံးဝင်ပါတယ်။ ဒီ Github page မှာတော့ Praat ကို အခြေခံအသုံးပြုပုံနဲ့ wave ဖိုင်ကို annotation လုပ်တဲ့အပိုင်းကိုပဲ အဓိကထား သင်ကြားပေးသွားပါမယ်။  

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

## Running Praat

Praat ပရိုဂရမ်ကို run တာကတော့ installation လုပ်ထားတဲ့ (သို့) download လုပ်ထားတဲ့ path အောက်က binary ဖိုင်ကို ခေါ် run ယုံပါပဲ။ Command line ကနေသွားမယ်ဆိုရင် အောက်ပါအတိုင်း ရိုက်ပြီး Enter ကီးကို နှိပ်ပေးလိုက်ပါ။  

```bash
$ ./praat
```

ကိုယ့်စက်မှာ run လိုက်ရင် အရင်ဆုံး မြင်ရမှာက အောက်ပါအတိုင်း Window နှစ်ခုပါ။  

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/two-windows-of-Praat.png" alt="drawing" width="800"/>  
</p>  
<div align="center">
  Fig. Objects and Picture Windows of Praat Program   
</div> 

<br />

အတိုရှင်းရရင်... အဓိကကျတဲ့ operation တွေက "Praat Objects" Windows ကနေပဲ လုပ်ပါတယ်။ "Praat Picture" Windows က စာတမ်းရေးဖို့အတွက်၊ ပိုစတာဘာညာ ပြင်ဆင်ဖို့အတွက် eps ဖိုင်လိုမျိုး quality ကောင်းတဲ့ figure တွေကို ထုတ်ဖို့အတွက် Drawing ကိစ္စတွေလုပ်တဲ့အခါမှာ သုံးတာပါ။ ဒီ Annotation မိတ်ဆက် tutorial အတွက်လည်း သုံးမှာ မဟုတ်လို့ "Praat Picture" Window ကို ပိတ်ထားလိုက်ပါ။   

## Sound/Audio File

အသံတွေကို annotation လုပ်တယ်ဆိုတာကို အလွယ်ရှင်းရရင် ဖမ်းထားတဲ့ အသံ (recorded sound/speech) တွေကို အပိုင်းပိုင်းဖြတ်ပြီး (i.e. segmentation) လေဘယ်ထိုးတာ ပါပဲ။ ဒီ tutorial က Praat ဆောဖ့်ဝဲလ် ကိုသုံးပြီး အသံဖိုင်ကို ဗမာစာ text label ထိုးတာ၊ audio သမားတွေ speech သမားတွေကပြောပြောနေကြတဲ့ transcript လုပ်တာကို သင်ပေးတဲ့ tutorial အတိုလေးပါ။  

Annotation လုပ်ဖို့အတွက် အရင်ဆုံး အသံဖိုင်လိုအပ်ပါတယ်။ အသံဖိုင်က ကိုယ့်ဖာသာကိုယ် recording လုပ်ယူတာ (သို့) ရှိပြီးသား အသံဖိုင်ကို ဖွင့်ဖတ်တာ (သို့) ဖော်မြူလာနဲ့ အသံဖန်ကို ဖန်တီးယူတာ စတဲ့ သုံးမျိုးထဲက တစ်နည်းနည်းနဲ့ ရယူနိုင်ပါတယ်။  

### 1.Recording with Praat

အသံ recording လုပ်ပြီး မှ speech sound ဖိုင်ကို ဖန်တီးယူမယ်ဆိုရင်တော့ ကိုယ့်ကွန်ပျူတာမှာ တပ်ထားတဲ့ မိုက်ကရိုဖုန်း ရှိနေရပါမယ်။ Praat ကို run မလုပ်ခင်မှာ အရင်ဆုံး မိုက်ကရိုဖုန်းကို ကွန်ပျူတာနဲ့ ကြိုတင် ချိတ်ဆက်ထားတာက ပိုကောင်းပါတယ်။   

ASR, TTS အတွက်က mono sound ဖိုင်ကိုပဲ သုံးတာက ပုံမှန်မို့လို့ Recording လုပ်မယ်ဆိုရင် Praat Objects Windows ရဲ့ "New" menu အောက်က "Record mono Sound..." ကို ရွေးပါ။ အောက်ပါ "SoundRecorder" window ကို မြင်ရပါလိမ့်မယ်။  

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/sound_recorder_screen.png" alt="drawing" width="500"/>  
</p>  
<div align="center">
  Fig. Sound Recorder Window of Praat    
</div> 

<br />

Record ဆိုတဲ့ button ကို နှိပ်ရင် recording က စတင် လုပ်နေပြီဖြစ်ပါတယ်။ ကိုယ့်စက်နဲ့ ချိတ်ဆက်ထားတဲ့ မိုက်ကရိုဖုန်းက ပုံမှန်အလုပ်လုပ်တယ်၊ Praat ပရိုဂရမ်ကလည်း သိတယ်ဆိုရင် စကားပြောကြည့်တဲ့အခါမှာ အစိမ်းရောင် ဘားက တက်လိုက်ကျလိုက်ဖြစ်တာကို မြင်တွေ့ရမှာ ဖြစ်ပါတယ်။ အဲဒါဆိုရင် အသံဖမ်းတဲ့ အလုပ်ကို ဆက်လုပ်သွားလို့ ရပါပြီ။ တစ်ခုရှိတာက မိုက်ရိုဖုန်းရဲ့ setting က လက်ခံတဲ့အသံ volume ကို အရမ်းမြှင့်ထားတယ် (သို့) စကားပြောတဲ့သူရဲ့ အသံက တအား ကျယ်နေတဲ့ အခါမျိုးမှာတော့ recording လုပ်နေစဉ်အချိန်မှာ အောက်ပါ ပုံမှာ ပြထားတဲ့အတိုင်း အဝါရောင်၊ အနီရော် စသည်ဖြင့် warning လုပ်တဲ့ ဘားတွေကို မြင်နေရမှာ ဖြစ်ပါတယ်။ အဲဒီလိုဖြစ်နေရင်တော့ အသံစတင် မဖမ်းခင်မှာ မိုက်ကရိုဖုန်းရဲ့ setting ကို ပြန်ညှိတာ (သို့) စကားပြောတဲ့ သူရဲ့ အသံက တအား volume မြင့်နေတယ်ဆိုရင်လည်း အသံကို နှိမ့်ပြောခိုင်းတာ စတာတွေကို လုပ်သင့်ပါတယ်။  

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/sound_recorder_screen_meter.png" alt="drawing" width="500"/>  
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
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/recording1.png" alt="drawing" width="800"/>  
</p>  
<div align="center">
  Fig. Viewing Recorded Wavefile (filename:recording1.wav)
</div> 

<br />

Recording လုပ်ထားတဲ့ ဗမာစာကြောင်းက "ကန်စွန်းရွက် နဲ့ မှိုကြော် တစ်ပွဲ ပေးပါ" ဆိုတဲ့ စာကြောင်းပါ။   

### 3.Creating a Sound From a Fomula  

တချို့ speech processing အလုပ်တွေအတွက် အသံဖိုင်တွေကို ဖော်မြူလာတစ်ခုနဲ့ ဖန်တီးယူတာမျိုးလည်း လုပ်လေ့ရှိပါတယ်။ 
<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/create-sound-from-formula-in-Praat.png" alt="drawing" width="600"/>  
</p>  
<div align="center">
  Fig. Menu, sub-menu Information for Creating a Sound from a Formula
</div> 

<br />

ဒီနေရာမှာတော့ "Praat Objects" Window ကနေ လုပ်တဲ့ပုံစံနဲ့သွားပါမယ်။ အထက်က ပုံမှာ ပြထားတဲ့အတိုင်းပဲ "New" ---> "Sound" ---> "Create Sound from formula..." ကို အဆင့်ဆင့် ကလစ်နှိပ်ပြီး သွားရင် အောက်ပါအတိုင်း formula ရိုက်ထည့်လို့ရတဲ့ dialogue box ပေါ်လာမှာ ဖြစ်ပါတယ်။  

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/formula-dialogue.png" alt="drawing" width="500"/>  
</p>  
<div align="center">
  Fig. Formula Dialogue Box
</div> 

<br />

Default ပေးထားတဲ့ တန်ဖိုးတွေအတိုင်းပဲ ထားထားပြီးတော့ "OK" button ကို နှိပ်လိုက်ရင်၊ မြင်နေရတဲ့ dialogue box က ပိတ်သွားပြီးတော့ "Praat Objects" Window ရဲ့ list box မှာ "Sound sineWithNoise" ဆိုတဲ့ temp ဖိုင်နာမည်နဲ့ object တစ်ခုက တိုးလာတာကို မြင်ရပါလိမ့်မယ်။ အဲဒီ Sound ဖိုင်ရဲ့ waveform ပုံစံ spectrogram ပုံစံတို့ကို ကြည့်ဖို့အတွက်၊ အသံကို play လုပ်ဖို့အတွက်၊ Sound editing လုပ်ချင်ရင်လည်း လုပ်နိုင်ဖို့အတွက်က ညာဘက်မှာ တန်းစီပြီး ရှိနေတဲ့ Button တွေထဲကနေ "View & Edit" ကိုရွေး ကလစ်လုပ်ပေးလိုက်ပါ။ အဲဒါဆိုရင် စောစာက မြင်ခဲ့ရတဲ့ wave formula ဖြစ်တဲ့ ```1/2 * sin(2*pi*377*x) + randomGauss(0,0.1)``` နဲ့ တခြား parameter တွေနဲ့ ဆောက်ထားတဲ့ အသံဖိုင်ရဲ့ waveform, spectrogram တို့ကို အောက်ပါအတိုင်း မြင်ရပါလိမ့်မယ်။  

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/sound-sine-with-noise.png" alt="drawing" width="800"/>  
</p>  
<div align="center">
  Fig. Waveform and Spectrogram of a Sound Created with a Given Formula
</div> 

<br />


## Viewing and Editing

အထက်မှာ ဖတ်ခဲ့ကြတဲ့ Sound/Audio File ရဲ့ "2.Reading a Sound File" ဆိုတဲ့ section မှာ ဖွင့်ပြခဲ့တဲ့ အသံဖိုင်ကိုပဲ သုံးပြီး အခြေခံ sound editing လုပ်နိုင်အောင် သင်ကြားသွားပါမယ်။ Praat Objects Window ရဲ့ "Open" menu အောက်က "Read from file..." sub menu ကို ရွေးပြီး ကိုယ် annotation လုပ်ချင်တဲ့ အသံဖိုင် (သို့) editing လုပ်ချင်တဲ့ sound ဖိုင်ကိုဖွင့်ပါ။ Praat ပရိုဂရမ်မှာ default အနေနဲ့က ဖွင့်လိုက်တဲ့ အသံဖိုင်ရဲ့ waveform (အပေါ်ပိုင်းက ပုံ) နဲ့ spectrogram (အောက်ဘက်က ပုံ) ကို ပြသပေးပါလိမ့်မယ်။ Annotation လုပ်တဲ့အခါမှာလည်း အဲဒီ waveform နဲ့ spectrogram နှစ်မျိုးကိုပဲ သေသေချာချာ စိစစ်ပြီး လုပ်သွားရင် အခြေခံအားဖြင့် အဆင်ပြေပါတယ်။  

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/recording1-labeled1.png" alt="drawing" width="800"/>  
</p>  
<div align="center">
  Fig. Waveform and Spectrogram of Opened wave file
</div> 

<br />


<table>
  <tr>
    <td>Selecting an Interval Before Audio Start</td>
    <td>After Removed</td>
  </tr>
  <tr>
    <td><img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/selection1.png" width=2670 height=480></td>
    <td><img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/cut-before-sound.png" width=670 height=480></td>
  </tr>
 </table>
 
<br />
 
<table>
  <tr>
    <td>Selecting an Interval Before Audio Start</td>
    <td>After Removed</td>
  </tr>
  <tr>
    <td><img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/select2.png" width=670 height=480></td>
    <td><img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/after-removed-prefix-suffix.png" width=670 height=480></td>
  </tr>
 </table>

<br />



## Segmentation and Annotation



<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/create-textgrid-menu.png" alt="drawing" width="500"/>  
</p>  
<div align="center">
  Fig. Menu for Creating a New TextGrid
</div> 

<br />

Default ပေးထားတဲ့ နာမည်တွေကို အောက်ပါအတိုင်း မြင်ရမှာ ဖြစ်ပါတယ်။  

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/naming-tier.png" alt="drawing" width="500"/>  
</p>  
<div align="center">
  Fig. Default Names of a New Tire
</div> 

<br />

Transcript လုပ်ကြမှာမို့ tire နာမည်ကို transcript လို့ ပေးလိုက်ကြရအောင်။ လက်ရှိ လုပ်ကြမယ့် annotation နဲ့က မသက်ဆိုင်လို့ "Which of these are point tiers?" ဆိုတဲ့ textbox ကိုလည်း clear လုပ်ထားလိုက်ကြရအောင်။   

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/naming-your-tier.png" alt="drawing" width="500"/>  
</p>  
<div align="center">
  Fig. An Example of Naming a New Tire
</div> 

<br />

## Finding Zero Crossings

## Praat Scripting

ဒီ tutorial က transcription/annotation ကိုပဲ အဓိကထား သင်ကြားပေးဖို့ ရည်ရွယ်ပေမဲ့ Praat script ဆိုတာကိုလည်း briefly မိတ်ဆက်ပေးချင်ပါတယ်။ ဘာကြောင့်လဲ ဆိုတော့ Praat မှာ script ရေးပြီး လုပ်ချင်တဲ့ အလုပ်တွေကို ခိုင်းလို့ရတဲ့ ဒီ facility ကြောင့် အကြိမ်ကြိမ်အခါခါ လုပ်ရတဲ့ အလုပ်တွေကို script ရေးထားလိုက်ပြီးတော့ လိုအပ်တဲ့အချိန်မှာ run လိုက်တာက ပိုအဆင်ပြေလွယ်ကူတာကြောင့်ပါ။ script ရေးတာက သာမာန်ယူဇာတွေအတွက်က ခက်ခဲနိုင်ပေမဲ့ ကွန်ပျူတာ ပရိုဂရမ်ရေးနည်းတွေနဲ့ အကျွမ်းတဝင်ရှိတဲ့သူတွေအတွက်က self-study လုပ်သွားနိုင်ရင် speech processing နဲ့ ပတ်သက်တဲ့ အလုပ်တွေအများကြီးကို တိုးချဲ့လုပ်ကိုင်နိုင်သွားမှာမို့ပါ။  

Praat မှာ script ရေးမယ်ဆိုရင် Praat Objects Windows ရဲ့ "Praat" Menu ကနေ "New Praat Script" ဆိုတဲ့ sub-menu ကို ရွေးလိုက်ရင် script ရိုက်ထည့်လို့ ရတဲ့ simple text editor window က ပေါ်လာပါလိမ့်မယ်။ အဲဒီမှာ Praat ကနားလည်နိုင်မယ့် script language syntax အတိုင်း ပရိုဂရမ်ညွှန်ကြားချက်တွေကို ရိက်ထည့်ရမှာ ဖြစ်ပါတယ်။ ပြီးရင်တော့ Script editor window ရဲ့ "Run" Menu အောက်မှာရှိတဲ့ "Run" sub-menu ကိုနှိပ်ပြီး ရေးထားတဲ့ script ကို run လုပ်ခိုင်းယုံပါပဲ။  

### Script Example No.1

ပထမဆုံး script example အနေနဲ့ အောက်ပါ စာကြောင်းတွေကို script editor window မှာ ရိုက်ထည့်တာ (သို့) ကော်ပီကူးထည့်တာလုပ်ပါ။  

```
Read from file: "/home/ye/tool/praat6151/annotation/audio/recording1-edited.wav"
View & Edit
editor: "Sound recording1-edited"
Zoom: 0.193610, 0.654709
```

ဖတ်ကြည့်ရင်လည်း အလွယ်တကူ နားလည်နိုင်မယ်လို ယူဆပါတယ်။ ပထမဆုံး Praat script မို့ ရေးထားတဲ့ instruction တစ်ကြောင်းချင်းစီကို အတိုရှင်းပြရရင် အောက်ပါအတိုင်းပါ။  

1. ```Read from file: "/home/ye/tool/praat6151/annotation/audio/recording1-edited.wav"``` (အထက်မှာ editing လုပ်ခဲ့ပြီးသိမ်းထားတဲ့ ဖိုင်ကို path အတိအကျပေးပြီး Praat ကို ဖတ်ခိုင်းတာပါ)
2. ```View & Edit``` (လက်ရှိ ဖတ်ထားတဲ့ ဖိုင်ကို "View & Edit" window အနေနဲ့ ဖွင့်ခိုင်းလိုက်တာပါ)
3. ```editor: "Sound recording1-edited"``` (editor ကို "Sound recording1-edited" object ကို assign လုပ်လိုက်တာလို့ နားလည်ပါတယ်)
4. ```Zoom: 0.193610, 0.654709``` (Wave ဖိုင် တစ်ဖိုင်လုံးအထဲကနေ Zoom in လုပ်စေချင်တဲ့ interval ရဲ့ starting point, ending point တွေကို သတ်မှတ်ပေးလိုက်တာပါ)

ပေးတဲ့ path မှာ ဖွင့်ခိုင်းတဲ့ ဖိုင်ကလည်း ရှိတယ်။ Zoom in လုပ်တာမျိုးလည်း ပြဿနာမရှိပဲ လုပ်ပြီးသွားရင်တော့ အောက်ပါ figure မှာ ပြထားအတိုင်း Zoom in လုပ်ထားတဲ့ အပိုင်းကိုပဲ ပြသပေးမှာဖြစ်ပါတယ်။ Zoom in လုပ်ထားတဲ့အပိုင်းကို Play လုပ်ကြည့်ရင်တော့ "ကန်စွန်းရွက်နဲ့" ဆိုတဲ့ အပိုင်းကိုပဲ ကြားရမှာ ဖြစ်ပါတယ်။  


<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/kazunyuatne.png" alt="drawing" width="800"/>  
</p>  
<div align="center">
  Fig. Output Screen of the Praat Script (Read the wavefile: recording1.wa and Zoom in the Interval 0.193610 and 0.654709)
</div> 

<br />


### Script Example No.2

အသံဖိုင်ကို ဖော်မြူလာနဲ့ ထုတ်တာကို script ရေးပြီးတော့ လုပ်ကြည့်ကြရအောင်...  

```
frequency = 377
Create Sound from formula: "ဖော်မြူလာက ထုတ်ပေးတဲ့ အသံလှိုင်း" , 1, 0.0, 1.0, 44100, "1/2 * sin(2*pi*frequency*x)"
Play
```

အထက်မှာ ရေးထားတာက frequency ကို 377 Hz (cycles per second) အဖြစ် assign လုပ်ပြီး 377 Hz Sine wave ကိုဖန်တီးပြီး Play လုပ်ခိုင်းတာပါ။ Praat ကိုသုံးနေတဲ့ ကွန်ပျူတာမှာ speaker တပ်ထားရင် (သို့) headset တပ်ထားရင် အသံကိုလည်း ကြားရပါလိမ့်မယ်။ ဖော်မြူလာကထုတ်ပေးတဲ့ အသံလှိုင်းကို waveform ပုံစံ၊ spectrogram ပုံစံအနေနဲ့ကတော့ အောက်ပါအတိုင်း မြင်ရမှာ ဖြစ်ပါတယ်။   

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/output-of-create-a-sound1-script.png" alt="drawing" width="800"/>  
</p>  
<div align="center">
  Fig. Output Screen of the Sound Produced by the Praat Script
</div> 

<br />

### Script Example No.3

Script ကို ပရိုဂရမ်ရေးသလို instruction တွေကိုရိုက်ထည့်ပြီးရေးတဲ့ ပုံစံအပြင် Praat မှာက menu တွေကတဆင့် လုပ်သွားတဲ့ အလုပ်တွေကို record လုပ်ပေးထားပြီး Prat script ရဲ့ instruction တွေအနေနဲ့ paste လုပ်ခိုင်းတာမျိုးလည်း လုပ်လို့ ရပါတယ်။ ဒီ feature ကလည်း တကယ်အသုံးဝင်ပါတယ်။ Example No. 3 အနေနဲ့ အဲဒီ "Paste history" ကိုသုံးပြီး script ရေးတာကို စမ်းကြည့်စေချင်ပါတယ်။  

အရင်ဆုံး အလုပ်လုပ်မယ့် အသံဖိုင်ကို Praat Object Window ရဲ့ object list မှာ selection လုပ်ထားပါ။  
ပြီးရင် "Praat" menu အောက်က "New Prat script" sub-menu ကိုရွေးပြီး script editor screen ကို ဖွင့်ပါ။  
ကိုယ်လုပ်မယ့် အလုပ်တွေကို record မလုပ်ခင်မှာ အရင်ဆုံး script editor screen window ရဲ့ "Edit" menu အောက်က submenu "Clear history" ကိုနှိပ်ပြီး ရှေ့က လုပ်ခဲ့တဲ့ အလုပ်တွေရဲ့ history ကို ရှင်းထားမှ ဖြစ်ပါမယ်။  

စမ်းပြီး script ရေးခိုင်ချင်တဲ့ အလုပ်က လက်ရှိ select လုပ်ထားတဲ့ sound ဖိုင်ကို နာမည်အသစ်တစ်ခု copy ကူးပြီး၊ Reverse form ပုံစံအဖြစ် modify လုပ်ပါမယ်။ ပြီးရင် View & Edit နဲ့ ပြောင်းပြန်ဖြစ်သွားတဲ့ အသံဖိုင်ရဲ့ waveform, spectrogram form ကို ဖွင့်ကြည့်ပါမယ်။ အသေးစိတ် အနေနဲ့က အခုပြောခဲ့တဲ့ အလုပ်တွေကို Praat Object Window ရဲ့အောက်ကနေ လုပ်သွားမှာ ဖြစ်ပါတယ်။  

- Praat Object Window ရဲ့ အောက်ဘက်မှာရှိတဲ့ "Copy" Button ကို နှိပ်မယ်
- ပေါ်လာတဲ့ "Copy object" Window မှာ original ဖိုင်နာမည်နောက်မှာ "-reversed" ဆိုတာကို ဖြည့်ရိက်ပေးလိုက်မယ်
- ပြီးရင် "OK" button ကို နှိပ်မယ် (အဲဒါဆိုရင် Object Window ရဲ့ object list မှာ copy ကူးထားတဲ့ ဖိုင်တိုးလာတာကို မြင်တွေ့ရပါလိမ့်မယ်)  
- ပြီးရင်တော့ Praat Object Window မှာပဲ ညာဘက်အခြမ်းမှာ ရှိတဲ့ Button တွေ အများကြီးထဲကနေ "Modify-" ဆိုတဲ့ Button ကို နှိပ်လိုက်ပြီး "Reverse" ဆိုတဲ့ menu ကို ကလစ်နှိပ်ပေးလိုက်ပါ 
- နောက်ဆုံး အလုပ်အနေနဲ့ Script editor window ဘက်ကို ပြောင်းလိုက်ပြီး "Edit" menu အောက်မှာရှိတဲ့ "Paste history" ဆိုတဲ့ sub-menu ကို သုံးပြီး paste လုပ်ပါ

အထက်မှာ ပြောပြခဲ့တဲ့ အဆင့်တွေအတိုင်း မှန်မှန်ကန်ကန် လုပ်ခဲ့ရင် Script editor မှာ အောက်ပါ code (သို့) instruction တွေကို မြင်ရပါလိမ့်မယ်။  

```
Copy: "recording1-edited-reversed"
Reverse
View & Edit
```

အခု script ကို filename တစ်ခုပေးပြီး သိမ်းထားရင်၊ နောက်ပိုင်း ဘယ် အသံဖိုင်ကိုမဆို left-to-right ကနေ right-to-left ပြောင်းပြန် အသံဖိုင်အဖြစ် လုပ်တာကို script run ပြီး လုပ်ခိုင်းလို့ ရသွားပါပြီ။  
လက်တွေ့မှာတော့ အခုထက်ပိုတဲ့ အဆင့်ဆင့်လုပ်ရတဲ့ soud processing အလုပ်တွေကို script ရေးပြီး သိမ်းထားဖို့အတွက် သုံးပါတယ်။  

အခု ဥပမာအဖြစ် reverse လုပ်ခဲ့တဲ့ အသံဖိုင်ကိုတော့ အောက်ပါ figure မှာ ပြထားတဲ့အတိုင်း မြင်ရမှာ ဖြစ်ပါတယ်။  

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/Annotation-with-Praat/fig/reverse-output.png" alt="drawing" width="800"/>  
</p>  
<div align="center">
  Fig. Output Screen of the Reverse Version of the Recorded Wave File
</div> 

<br />

အထက်ပါ အသံဖိုင်ကို Play လုပ်ကြည့်ရင် "ကန်စွန်းရွက် နဲ့ မှိုကြော် တစ်ပွဲ ပေးပါ" ဆိုတဲ့ ဗမာစာကြောင်းကို ပြောင်းပြန် play လုပ်သွားမှာမို့လို့ နားထောင်ကြည့်ရင်တော့ စိတ်ဝင်စားဖို့ကောင်းတဲ့ အသံကို ကွန်ပျူတာက ထုတ်ပေးမှာ ဖြစ်ပါတယ်။ ဒီ tutorial အတွက် စမ်းခဲ့တဲ့ အသံဖိုင်တွေကိုလည်း [audio/](https://github.com/ye-kyaw-thu/NLP-Class/tree/master/supplementary/Annotation-with-Praat/audio) ဖိုလ်ဒါအောက်မှာ တင်ပေးထားပါတယ်။ ကိုယ့်စက်ထဲမှာ download လုပ်ပြီး နားထောင်ကြည့်တာမျိုးလည်း လုပ်လို့ ရပါတယ်။  

## Praat Keyboard Shortcuts

## Demo Video

## References

1. https://www.fon.hum.uva.nl/praat/  
2. Boersma, Paul (2001). Praat, a system for doing phonetics by computer. Glot International 5:9/10, 341-345.  
3. https://en.wikipedia.org/wiki/Audio_file_format  
4. https://www.fon.hum.uva.nl/praat/manualsByOthers.html
5. http://phonetics.linguistics.ucla.edu/facilities/acoustic/praat.html
6. https://phon.wordpress.ncsu.edu/lab-manual/scripts/praat-scripting/

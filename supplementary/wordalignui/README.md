# Manual Word Alignment GUI

This folder is the cloning of "[https://github.com/desilinguist/wordalignui](https://github.com/desilinguist/wordalignui)" or teaching manual word alignment to my students.  

Machine Translation နဲ့ ပတ်သက်တဲ့ သုတေသနကို NICT, Kyoto မှာ အလုပ်လုပ်စဉ်ကနေ တောက်လျှောက် လုပ်လာခဲ့ပေမဲ့ manual word alignment အတွက်   
freely available ရတဲ့ GUI tool တွေထဲမှာ မြန်မာစာ စာကြောင်းတွေကို မှန်မှန်ကန်ကန်ပြပေးနိုင်ပြီး installation ဘာညာ လုပ်ရတာ မခက်တဲ့ tool က မရှိသလောက်ပါပဲ။  
အဲဒါကြောင့် အသုံးဝင်မယ့် tool တစ်ခုကို မိတ်ဆက်ပေးပါ ဆိုရင် [wordalignui](https://github.com/desilinguist/wordalignui) ကို recommend လုပ်ပါတယ်။  

## git clone

အရင်ဆုံး ကိုယ့်စက်ထဲကို clone လုပ်ယူပါ။  
(တကယ်လို့ ကိုယ့်စက်ထဲမှာ git ကို install မလုပ်ရသေးရင်တော့ ```sudo apt install git``` နဲ့ လုပ်ရပါလိမ့်မယ်)  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$ git clone https://github.com/desilinguist/wordalignui
Cloning into 'wordalignui'...
remote: Enumerating objects: 64, done.
remote: Total 64 (delta 0), reused 0 (delta 0), pack-reused 64
Unpacking objects: 100% (64/64), 646.61 KiB | 527.00 KiB/s, done.
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$ cd wordalignui/
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ ls
build.xml  data  doc  README.md  src
```

## Install ant

ဒီ tool ရဲ့ source code က Java နဲ့ ရေးထားပြီး ant နဲ့ compile လုပ်လို့ရအောင် build.xml ဖိုင်ကိုလည်း ပြင်ဆင်ပေးထားတာမို့ [Ant](https://ant.apache.org/) ကို သုံးပြီး compile လုပ်ရင် လွယ်ပါတယ်။  
Ant က ကိုယ့်စက်ထဲမှာ မရှိသေးဘူးဆိုရင်တော့ အောက်ပါ command ပေးပြီး install လုပ်ယူပါ။  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ sudo apt install ant
[sudo] password for ye: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  apturl-common gir1.2-goa-1.0 ibverbs-providers libboost-atomic-dev libboost-atomic1.71-dev libboost-atomic1.71.0 libboost-chrono-dev libboost-chrono1.71-dev libboost-chrono1.71.0
  libboost-container-dev libboost-container1.71-dev libboost-container1.71.0 libboost-context-dev libboost-context1.71-dev libboost-context1.71.0 libboost-coroutine-dev
  libboost-coroutine1.71-dev libboost-coroutine1.71.0 libboost-date-time-dev libboost-date-time1.71-dev libboost-dev libboost-exception-dev libboost-exception1.71-dev
  libboost-fiber-dev libboost-fiber1.71-dev libboost-fiber1.71.0 libboost-filesystem-dev libboost-filesystem1.71-dev libboost-graph-parallel-dev libboost-graph-parallel1.71-dev
  libboost-graph-parallel1.71.0 libboost-graph1.71.0 libboost-locale-dev libboost-locale1.71-dev libboost-log1.71.0 libboost-math-dev libboost-math1.71-dev libboost-math1.71.0
  libboost-mpi-dev libboost-mpi-python-dev libboost-mpi-python1.71-dev libboost-mpi-python1.71.0 libboost-mpi1.71-dev libboost-mpi1.71.0 libboost-numpy-dev libboost-numpy1.71-dev
  libboost-numpy1.71.0 libboost-program-options-dev libboost-program-options1.71-dev libboost-program-options1.71.0 libboost-python-dev libboost-python1.71-dev libboost-python1.71.0
  libboost-random-dev libboost-random1.71-dev libboost-random1.71.0 libboost-regex1.71.0 libboost-serialization-dev libboost-serialization1.71-dev libboost-serialization1.71.0
  libboost-stacktrace-dev libboost-stacktrace1.71-dev libboost-stacktrace1.71.0 libboost-system-dev libboost-system1.71-dev libboost-system1.71.0 libboost-test-dev
  libboost-test1.71-dev libboost-test1.71.0 libboost-thread-dev libboost-thread1.71-dev libboost-timer-dev libboost-timer1.71-dev libboost-timer1.71.0 libboost-tools-dev
  libboost-type-erasure-dev libboost-type-erasure1.71-dev libboost-type-erasure1.71.0 libboost-wave-dev libboost-wave1.71-dev libboost-wave1.71.0 libboost1.71-dev
  libboost1.71-tools-dev libcaf-openmpi-3 libcoarrays-openmpi-dev libevent-core-2.1-7 libevent-dev libevent-extra-2.1-7 libevent-openssl-2.1-7 libevent-pthreads-2.1-7 libfabric1
  libhwloc-dev libhwloc-plugins libhwloc15 libibverbs-dev libibverbs1 libnl-3-dev libnl-route-3-dev libnuma-dev libopenmpi-dev libopenmpi3 libpmix2 libpsm-infinipath1 libpsm2-2
  librdmacm1 mpi-default-bin mpi-default-dev openmpi-bin openmpi-common python3-click python3-colorama python3-dateutil python3-software-properties software-properties-common
  unattended-upgrades
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  ant-optional
Suggested packages:
  ant-doc antlr javacc junit junit4 jython libactivation-java libbcel-java libbsf-java libcommons-net-java libmail-java libjaxp1.3-java libjdepend-java libjsch-java liblog4j1.2-java
  liboro-java libregexp-java libxalan2-java libxml-commons-resolver1.1-java libxz-java
The following NEW packages will be installed:
  ant ant-optional
0 upgraded, 2 newly installed, 0 to remove and 65 not upgraded.
Need to get 2,471 kB of archives.
After this operation, 3,420 kB of additional disk space will be used.
Do you want to continue? [Y/n] Y
Get:1 http://mm.archive.ubuntu.com/ubuntu groovy/universe amd64 ant all 1.10.8-1 [2,101 kB]
Get:2 http://mm.archive.ubuntu.com/ubuntu groovy/universe amd64 ant-optional all 1.10.8-1 [369 kB]
Fetched 2,471 kB in 4s (639 kB/s)     
Selecting previously unselected package ant.
(Reading database ... 623262 files and directories currently installed.)
Preparing to unpack .../archives/ant_1.10.8-1_all.deb ...
Unpacking ant (1.10.8-1) ...
Selecting previously unselected package ant-optional.
Preparing to unpack .../ant-optional_1.10.8-1_all.deb ...
Unpacking ant-optional (1.10.8-1) ...
Setting up ant (1.10.8-1) ...
Setting up ant-optional (1.10.8-1) ...
Processing triggers for man-db (2.9.3-2) ...
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$
```

## Compile with Ant

ပထမတော့ ```ant compile```, ```ant jar```, ```ant run``` တို့နဲ့ compile လုပ်ကြည့်ပေမဲ့ အောက်ပါအတိုင်း error ပေးပါတယ်။  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ ant compile
Buildfile: /home/ye/tool/wordalignui/build.xml

init:

compile:
    [javac] /home/ye/tool/wordalignui/build.xml:15: warning: 'includeantruntime' was not set, defaulting to build.sysclasspath=last; set to false for repeatable builds
    [javac] Compiling 18 source files to /home/ye/tool/wordalignui/build
    [javac] Note: Some input files use or override a deprecated API.
    [javac] Note: Recompile with -Xlint:deprecation for details.
    [javac] Note: Some input files use unchecked or unsafe operations.
    [javac] Note: Recompile with -Xlint:unchecked for details.

BUILD SUCCESSFUL
Total time: 0 seconds
```

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ ant jar
Buildfile: /home/ye/tool/wordalignui/build.xml

BUILD FAILED
Target "jar" does not exist in the project "AlignUI". 

Total time: 0 seconds
```

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ ant run
Buildfile: /home/ye/tool/wordalignui/build.xml

BUILD FAILED
Target "run" does not exist in the project "AlignUI". 

Total time: 0 seconds
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ 
```

## Try Again

ဘာ option မှာ မပေးပဲနဲ့ ant command တစ်ခုတည်းနဲ့ဆိုရင် အိုကေတယ်။   

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ ant
Buildfile: /home/ye/tool/wordalignui/build.xml

init:
    [mkdir] Created dir: /home/ye/tool/wordalignui/build

compile:
    [javac] /home/ye/tool/wordalignui/build.xml:15: warning: 'includeantruntime' was not set, defaulting to build.sysclasspath=last; set to false for repeatable builds
    [javac] Compiling 18 source files to /home/ye/tool/wordalignui/build
    [javac] Note: Some input files use or override a deprecated API.
    [javac] Note: Recompile with -Xlint:deprecation for details.
    [javac] Note: Some input files use unchecked or unsafe operations.
    [javac] Note: Recompile with -Xlint:unchecked for details.

dist:
    [mkdir] Created dir: /home/ye/tool/wordalignui/dist
      [jar] Building jar: /home/ye/tool/wordalignui/dist/alignui.jar

BUILD SUCCESSFUL
Total time: 0 seconds
```

## Run the Jar File

compile လုပ်ပြီး output အဖြစ်ထွက်လာတဲ့ jar ဖိုင်ကို run ကြည့်ရအောင်။  
wordalignui tool နဲ့အတူ ပါလာတဲ့ အင်္ဂလိပ်-တရုပ် parallel sentence တချို့ နဲ့ အရင်ဆုံး run ကြည့်ရအောင်...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ java -jar dist/alignui.jar data/test.en data/test.zh 
on the last sentence already
on the last sentence already
on the last sentence already
on the last sentence already
on the last sentence already
on the last sentence already
on the last sentence already
on the last sentence already
on the last sentence already
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ 
```

<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/wordalignui/doc/wordalignui-UI-with-enzh.png" alt="drawing" width="800"/>  
</p>  
<div align="center">
  Fig. GUI of Wordalignui Program (testing with example parallel sentences of English-Chinese)    
</div> 

<br />
GUI ကတော့ အထက်မှာ မြင်ရတဲ့အတိုင်းပါပဲ။  
သုံးပုံသုံးနည်းကတော့ mouse နဲ့ alignment တွဲချင်တဲ့ source စာလုံးနဲ့ target စာလုံးတွေကို ကလစ် တစ်ချက်စီ နှိပ်ပြီး ချိတ်ပေးသွားယုံပါပဲ။  
နောက်စာလုံး တစ်လုံးကို မကူးခင်မှာတော့ "Record Link" ဆိုတဲ့ button ကိုနှိပ်ပေးရပါမယ်။ မဟုတ်ရင် link တွေ က multi-link အနေနဲ့ အကုန်တွဲချိတ်ပေးသွားမှာမို့...  

## Output Alignment Files

Next, Next ဆိုပြီး တစ်ကြောင်းပြီး တစ်ကြောင်း ဆက် alignment လုပ်သွားမယ်ဆိုရင် aligned.<sentence-pair-no> ဆိုတဲ့ format နဲ့ output ဖိုင်တွေက parallel sentence ရှိသလောက် တစ်ဖိုင်ချင်းစီထုတ်ပေးသွားမှာ ဖြစ်ပါတယ်။  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ ls
aligned.1   aligned.16  aligned.22  aligned.29  aligned.35  aligned.41  aligned.48  aligned.54  aligned.60  aligned.67  aligned.73  aligned.8   aligned.86  dist
aligned.10  aligned.17  aligned.23  aligned.3   aligned.36  aligned.42  aligned.49  aligned.55  aligned.61  aligned.68  aligned.74  aligned.80  aligned.87  doc
aligned.11  aligned.18  aligned.24  aligned.30  aligned.37  aligned.43  aligned.5   aligned.56  aligned.62  aligned.69  aligned.75  aligned.81  aligned.88  README.md
aligned.12  aligned.19  aligned.25  aligned.31  aligned.38  aligned.44  aligned.50  aligned.57  aligned.63  aligned.7   aligned.76  aligned.82  aligned.9   src
aligned.13  aligned.2   aligned.26  aligned.32  aligned.39  aligned.45  aligned.51  aligned.58  aligned.64  aligned.70  aligned.77  aligned.83  build
aligned.14  aligned.20  aligned.27  aligned.33  aligned.4   aligned.46  aligned.52  aligned.59  aligned.65  aligned.71  aligned.78  aligned.84  build.xml
aligned.15  aligned.21  aligned.28  aligned.34  aligned.40  aligned.47  aligned.53  aligned.6   aligned.66  aligned.72  aligned.79  aligned.85  data
```

alignment information ကိုတော့ အောက်ပါ ပုံစံမျိုးနဲ့ မှတ်ပေးသွားပါတယ်။  
  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ cat aligned.1 
0  0  (Anbo, 安玻)    
4  2  (China, 中国)    
```

## Trying with Myanmar Sentence

မြန်မာစာ စာကြောင်းတွေကို Java program မှာ အဆင်ပြေပြေနဲ့ ပြပေးနိုင်ရဲ့လား confirm လုပ်ကြည့်ဖို့ ASEAN-MT corpus ထဲက စာကြောင်း ဆယ်ကြောင်းစီကို အောက်ပါအတိုင်း ပြင်ဆင်ပြီး wordalignui/en-my/ ဖိုလ်ဒါအောက်ထဲမှာ ကော်ပီကူးပြီး သိမ်းထားလိုက်တယ်။  
  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/ASEAN-MT$ head 1_all.en.word > asean-mt.10.en
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/ASEAN-MT$ head 3_all.my.word > asean-mt.10.my
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/data/ASEAN-MT$ mv asean-mt.10.{en,my} /home/ye/tool/wordalignui/en-my/
```

အင်္ဂလိပ်-မြန်မာ parallel စာကြောင်းတွေနဲ့ wordalignui tool ကို run ကြည့်ရအောင်...  
  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ java -jar dist/alignui.jar en-my/asean-mt.10.en en-my/asean-mt.10.my 
```

ဆိုကြပါစို့ ပထမဆုံး အင်္ဂလိပ်-မြန်မာ parallel sentence pair ရဲ့ alignment ကို အောက်ပါပုံမှာ မြင်ရတဲ့အတိုင်း လုပ်ခဲ့ပြီး save လုပ်ခဲ့ရင်...  
  
<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/wordalignui/doc/wordalignui-testing-with-my1.png" alt="drawing" width="800"/>  
</p>  
<div align="center">
  Fig. Test manual alignment with some sentences of English-Myanmar ASEAN-MT Corpus    
</div>  

<br />
output ဖိုင်အနေနဲ့ကတော့ အောက်ပါအတိုင်း ရမှာ ဖြစ်ပါတယ်။  
  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/wordalignui$ cat aligned.1
0  0  (Yes,, ဟုတ်ကဲ့)    
1  2  (I, ကျွန်တော်)    
2  8  (like, ကြိုက်)    2  9  (like, တယ်)    
4  3  (Thai, ထိုင်း)    
5  4  (chess., စစ်တုရင်)    
3  5  (playing, ကစား)    3  6  (playing, ရ)    3  7  (playing, တာ)  
```

နောက်စာကြောင်းကို ဆက်လုပ်မယ်ဆိုရင်တော့ Next button ကို နှိပ်ပြီး ဆက်လုပ်သွားပါ။  
  
<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/wordalignui/doc/wordalignui-testing-with-my2.png" alt="drawing" width="800"/>  
</p>  
<div align="center">
  Fig. Screenshot of before making manual alignment    
</div>  

  <br />
  
**အရေးကြီးတဲ့အချက်က လက်ရှိ tool အနေနဲ့က alignment လုပ်ပေးထားတာကို မှတ်ထားတဲ့ output ဖိုင်တွေက wordalignui/ ဖိုလ်ဒါအောက်မှာ ရှိနေမှာမို့ corpus အပြောင်းအလဲ လုပ်တဲ့အခါမှာ overwrite မလုပ်မိအောင် backup ကူးတာ ရွှေ့သိမ်းတာလုပ်ဖို့ကို မမေ့ပါနဲ့**  
  
## Manual Reading

Documentation အနေနဲ့ program နဲ့ အတူပါလာတဲ့ ./doc/manual.htm ဖိုင်ကိုဖတ်ပါ။
online ကနေလည်း ဖတ်လို့ရအောင် PDF ဖိုင်အနေနဲ့ convert လုပ်ပြီး doc/ ဖိုလ်ဒါ အောက်မှာလည်း သိမ်းပေးထားပါတယ်။  
ဒီဖိုင်နာမည်နဲ့ပါ [https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/wordalignui/doc/User%20Manual%20-%20UMIACS%20Word%20Alignment%20Interface.pdf](https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/wordalignui/doc/User%20Manual%20-%20UMIACS%20Word%20Alignment%20Interface.pdf)  

  **UI ကတော့ updated version လုပ်ထားတာမို့ manual မှာ ပြထားတဲ့ ပုံထဲက button တွေနဲ့က တူမှာ မဟုတ်ပါဘူး။**  

## For Your Information
  
တကယ်လို့ ကိုယ် alignment လုပ်မှာက ဗမာစာ စာကြောင်းတွေ မဟုတ်ဘူး ဆိုရင်တော့ သုံးလို့ ရနိုင်တဲ့ manual alignment tool တစ်ခုကတော့ [AlignMan](https://github.com/steinst/AlignMan) ပါ။  
Python code ဖြစ်လို့ လိုအပ်ရင် ဝင်ပြင်တာမျိုးလည်းလုပ်လို့ ရပေမဲ့ tkinter ကိုသုံးထားတဲ့ GUI မို့လို့ custom ttf font တွေကို recognize လုပ်ဖို့က စက်တိုင်းမှာ OS တိုင်းမှာ သိပ်အဆင်အပြေကြီးမဟုတ်ပါဘူး။  
  
<p align="center">
<img src="https://github.com/ye-kyaw-thu/NLP-Class/blob/master/supplementary/wordalignui/doc/AlignMan-testing-with-my1.png" alt="drawing" width="800"/>  
</p>  
<div align="center">
  Fig. Running AlignMan with Myanmar sentence    
</div> 
  
## Reference

https://websiteforstudents.com/how-to-install-apache-ant-on-ubuntu-18-04-16-04/


# Testing ChatterBot

Draft Note for Testing ChatBot with Naive Bayesian Algorithms.   
Working with Cho Zin Oo...  

## git clone

အရင်ဆုံး git clone လုပ်ပြီး ကိုယ့်စက်ထဲကို download လုပ်ယူခဲ့...   
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$ git clone https://github.com/gunthercox/ChatterBot.git
Cloning into 'ChatterBot'...
remote: Enumerating objects: 12827, done.
remote: Counting objects: 100% (12/12), done.
remote: Compressing objects: 100% (11/11), done.
remote: Total 12827 (delta 1), reused 5 (delta 0), pack-reused 12815
Receiving objects: 100% (12827/12827), 4.23 MiB | 4.70 MiB/s, done.
Resolving deltas: 100% (8932/8932), done.
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$ 
```

## Installation

ChatterBot ကို installation လုပ်ခဲ့...  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$ pip install ./ChatterBot
Processing ./ChatterBot
  DEPRECATION: A future pip version will change local packages to be built in-place without first copying to a temporary directory. We recommend you use --use-feature=in-tree-build to test your packages with this new behavior before it becomes the default.
   pip 21.3 will remove support for this functionality. You can find discussion regarding this at https://github.com/pypa/pip/issues/7555.
Collecting mathparse<0.2,>=0.1
  Downloading mathparse-0.1.2-py3-none-any.whl (7.2 kB)
Requirement already satisfied: python-dateutil<2.9,>=2.8 in /home/ye/anaconda3/lib/python3.7/site-packages (from ChatterBot==1.1.0a7) (2.8.1)
Requirement already satisfied: sqlalchemy<1.4,>=1.3 in /home/ye/anaconda3/lib/python3.7/site-packages (from ChatterBot==1.1.0a7) (1.3.13)
Requirement already satisfied: pytz in /home/ye/anaconda3/lib/python3.7/site-packages (from ChatterBot==1.1.0a7) (2019.3)
Requirement already satisfied: six>=1.5 in /home/ye/anaconda3/lib/python3.7/site-packages (from python-dateutil<2.9,>=2.8->ChatterBot==1.1.0a7) (1.14.0)
Building wheels for collected packages: ChatterBot
  Building wheel for ChatterBot (setup.py) ... done
  Created wheel for ChatterBot: filename=ChatterBot-1.1.0a7-py2.py3-none-any.whl size=63730 sha256=a829dee9b0632ef2c245b7e532b29a98a20c34eb21bd6b4f44bbf02bbebe5262
  Stored in directory: /tmp/pip-ephem-wheel-cache-fzyfoljh/wheels/2f/32/97/3c5177110c8a39837b021d14a33402c4679153f642551147b7
Successfully built ChatterBot
Installing collected packages: mathparse, ChatterBot
Successfully installed ChatterBot-1.1.0a7 mathparse-0.1.2
WARNING: You are using pip version 21.2.2; however, version 21.2.3 is available.
You should consider upgrading via the '/home/ye/anaconda3/bin/python -m pip install --upgrade pip' command.
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$
```

## Upgrading pip

``` WARNING: You are using pip version 21.2.2; however, version 21.2.3 is available.```  
ဒီ warning message ကတော့ ပေးလေ့ရှိပါတယ်။ ပြဿနာ တော့ မဟုတ်ပါဘူး။  
pip ကိုယ်တိုင်ကို upgrade လုပ်ခဲ့... 
(လိုအပ်မှသာ ကိုယ့်စက်မှာ လုပ်ပါ)  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$ pip install --upgrade pip
Requirement already satisfied: pip in /home/ye/anaconda3/lib/python3.7/site-packages (21.2.2)
Collecting pip
  Downloading pip-21.2.3-py3-none-any.whl (1.6 MB)
     |████████████████████████████████| 1.6 MB 1.7 MB/s 
Installing collected packages: pip
  Attempting uninstall: pip
    Found existing installation: pip 21.2.2
    Uninstalling pip-21.2.2:
      Successfully uninstalled pip-21.2.2
Successfully installed pip-21.2.3
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$
```

## Reinstall Chatterbot

pip ကို upgrade လုပ်ပြီးတဲ့နောက်မှာ ```pip install ./Chatterbot``` command နဲ့ ကို ထပ် install လုပ်ခဲ့...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$ pip install ./ChatterBot
Processing ./ChatterBot
  DEPRECATION: A future pip version will change local packages to be built in-place without first copying to a temporary directory. We recommend you use --use-feature=in-tree-build to test your packages with this new behavior before it becomes the default.
   pip 21.3 will remove support for this functionality. You can find discussion regarding this at https://github.com/pypa/pip/issues/7555.
Requirement already satisfied: mathparse<0.2,>=0.1 in /home/ye/anaconda3/lib/python3.7/site-packages (from ChatterBot==1.1.0a7) (0.1.2)
Requirement already satisfied: python-dateutil<2.9,>=2.8 in /home/ye/anaconda3/lib/python3.7/site-packages (from ChatterBot==1.1.0a7) (2.8.1)
Requirement already satisfied: sqlalchemy<1.4,>=1.3 in /home/ye/anaconda3/lib/python3.7/site-packages (from ChatterBot==1.1.0a7) (1.3.13)
Requirement already satisfied: pytz in /home/ye/anaconda3/lib/python3.7/site-packages (from ChatterBot==1.1.0a7) (2019.3)
Requirement already satisfied: six>=1.5 in /home/ye/anaconda3/lib/python3.7/site-packages (from python-dateutil<2.9,>=2.8->ChatterBot==1.1.0a7) (1.14.0)
Building wheels for collected packages: ChatterBot
  Building wheel for ChatterBot (setup.py) ... done
  Created wheel for ChatterBot: filename=ChatterBot-1.1.0a7-py2.py3-none-any.whl size=63730 sha256=1cbb88b642e0f40b8c67025b3b48a7fe66f4ae331cf05ca356df4b163f525f2b
  Stored in directory: /tmp/pip-ephem-wheel-cache-rle7y5hc/wheels/2f/32/97/3c5177110c8a39837b021d14a33402c4679153f642551147b7
Successfully built ChatterBot
Installing collected packages: ChatterBot
  Attempting uninstall: ChatterBot
    Found existing installation: ChatterBot 1.1.0a7
    Uninstalling ChatterBot-1.1.0a7:
      Successfully uninstalled ChatterBot-1.1.0a7
Successfully installed ChatterBot-1.1.0a7
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$
```

## Check the Chatterbot Version

ပရိုဂရမ် တစ်ခုကို install လုပ်ပြီးသွားတဲ့အခါမှာ ကိုယ့်စက်ထဲမှာ run လို့ ရမရကို --version option နဲ့ ပေး run ရင်းနဲ့ check လုပ်ခဲ့...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$ python -m chatterbot --version
Traceback (most recent call last):
  File "/home/ye/anaconda3/lib/python3.7/runpy.py", line 193, in _run_module_as_main
    "__main__", mod_spec)
  File "/home/ye/anaconda3/lib/python3.7/runpy.py", line 85, in _run_code
    exec(code, run_globals)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/__main__.py", line 20, in <module>
    print(get_chatterbot_version())
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/__main__.py", line 15, in get_chatterbot_version
    return config['chatterbot']['version']
  File "/home/ye/anaconda3/lib/python3.7/configparser.py", line 958, in __getitem__
    raise KeyError(key)
KeyError: 'chatterbot'
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool$ cd ChatterBot/
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot$ python -m chatterbot --version
1.1.0a7
```

## Hello Chatterbot with Myanmar Language

Installed လုပ်ထားတဲ့ ဖိုလ်ဒါအောက်မှာ my-test/ ဆိုတဲ့ ဖိုလ်ဒါအသစ်ကို ဆောက်ပြီးတော့ အဲဒီဖိုလ်ဒါအောက်မှာပဲ မြန်မာစာဒေတာနဲ့ Chatterbot ကို run ကြည့်ခဲ့...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot$ ls
chatterbot  dev-requirements.txt  docs  examples  graphics  LICENSE  MANIFEST.in  README.md  requirements.txt  runtests.py  setup.cfg  setup.py  tests  tests_django  tox.ini
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot$ mkdir my-test
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot$ cd my-test/
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ gedit hello-chatterbot.py
```

ပထမဦးဆုံး hello-chatterbot.py ဆိုတဲ့ ပရိုဂရမ်မှာ အဖြေကို list variable (i.e. conversation) တစ်ခုထားပြီးတော့ ChatBot ဆိုတဲ့ library ကိုခေါ်ပြီး အလွယ်run တဲ့ပုံစံနဲ့ စမ်းကြည့်ခဲ့...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ cat hello-chatterbot.py 
from chatterbot import ChatBot
chatbot = ChatBot("myAgriBot")

from chatterbot.trainers import ListTrainer

conversation = [ 
"ပျော့ထွန်းစပါး မျိုးကို ဆက်လက် စိုက်သင့် မစိုက်သင့် သိရှိလိုပါသည်။",
"NSC အသိမှတ်ပြု ထုတ်ပေးထားသော မျိုးမဟုတ်သဖြင့် ဆက်လက် မစိုက်ပျိုးသင့်ပါ။",
"ကော်ဖီပျိုးပင် သက်တမ်း (၆)လနှင့် စိုက်ပျိုးလို့ ရပါသလား။",
"ပျိုးပင် သက်တမ်း (၆)လ မှ (၁၂)လအတွင်း စိုက်ပျိုးနိုင်ပါသည်။ သက်တမ်းနုပါက အပင်ပြုစုစောင့်ရှောက်ရာတွင် ပိုမိုဂရုစိုက်ရန် လိုအပ်ပါသည်။ အပင် အရွက် (၆)စုံမှ (၈)စုံထွက်သော ပျိုးပင်သည် ရွှေ့ပြောင်းစိုက်ရန် အသင့်တော်ဆုံးဖြစ်ပါသည်။",
"ကော်ဖီမျိုးစေ့ ရေနွေးစိမ် အညှောင့်ဖောက်ရာတွင် အချိန်ဘယ်လောက်ကြာအောင် စိမ်သင့်ပါလဲ။",
"၁၂ နာရီမှ ၂၄ နာရီ စိမ်သင့်ပါသည်။",
"ကော်ဖီ ကိုင်းဖြတ်ပြုပြင်ခြင်း၊ ခေါင်နှိမ်ခြင်းလုပ်ငန်းများ ဆောင်ရွက်ရာတွင် အပင်အမြင့် ဘယ်လောက် ထားသင့်ပါသလဲ။",
"ကော်ဖီသီး ခူးဆွတ်ရလွယ်ကူစေရန် သင့်တော်သော အပင်အမြင့် (၄-၆)ပေထားသင့်ပါသည်။"
]

trainer = ListTrainer(chatbot)

trainer.train(conversation)

response = chatbot.get_response("ကော်ဖီမျိုးစေ့ ရေနွေးစိမ် အညှောင့်ဖောက်ရာတွင် အချိန်ဘယ်လောက်ကြာအောင် စိမ်သင့်ပါလဲ။")
print(response)

(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$
```

Train and Run with a small list ...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ python ./hello-chatterbot.py 
Traceback (most recent call last):
  File "./hello-chatterbot.py", line 2, in <module>
    chatbot = ChatBot("myAgriBot")
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/chatterbot.py", line 28, in __init__
    self.storage = utils.initialize_class(storage_adapter, **kwargs)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/utils.py", line 33, in initialize_class
    return Class(*args, **kwargs)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/storage/sql_storage.py", line 20, in __init__
    super().__init__(**kwargs)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/storage/storage_adapter.py", line 23, in __init__
    'tagger_language', languages.ENG
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/tagging.py", line 26, in __init__
    self.nlp = spacy.load(self.language.ISO_639_1.lower())
  File "/home/ye/anaconda3/lib/python3.7/site-packages/spacy/__init__.py", line 47, in load
    return util.load_model(name, disable=disable, exclude=exclude, config=config)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/spacy/util.py", line 328, in load_model
    raise IOError(Errors.E941.format(name=name, full=OLD_MODEL_SHORTCUTS[name]))
OSError: [E941] Can't find model 'en'. It looks like you're trying to load a model from a shortcut, which is deprecated as of spaCy v3.0. To load the model, use its full name instead:

nlp = spacy.load("en_core_web_sm")

For more details on the available models, see the models directory: https://spacy.io/models. If you want to create a blank model, use spacy.blank: nlp = spacy.blank("en")
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$
```

Spacy ဆိုတဲ့ library က လက်ရှိ run နေတဲ့ environment မှာ installation မလုပ်ထားဘူး ဆိုတဲ့ error message ပေးတယ်။  

## Install Spacy and Run Again

အဲဒါနဲ့ spacy library ကို installation လုပ်ခဲ့တယ်...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ pip install spacy
Requirement already satisfied: spacy in /home/ye/anaconda3/lib/python3.7/site-packages (3.0.5)
Requirement already satisfied: blis<0.8.0,>=0.4.0 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (0.7.4)
Requirement already satisfied: cymem<2.1.0,>=2.0.2 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (2.0.5)
Requirement already satisfied: wasabi<1.1.0,>=0.8.1 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (0.8.2)
Requirement already satisfied: murmurhash<1.1.0,>=0.28.0 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (1.0.5)
Requirement already satisfied: tqdm<5.0.0,>=4.38.0 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (4.56.0)
Requirement already satisfied: setuptools in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (57.2.0)
Requirement already satisfied: pydantic<1.8.0,>=1.7.1 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (1.7.3)
Requirement already satisfied: importlib-metadata>=0.20 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (1.5.0)
Requirement already satisfied: spacy-legacy<3.1.0,>=3.0.0 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (3.0.1)
Requirement already satisfied: packaging>=20.0 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (20.1)
Requirement already satisfied: requests<3.0.0,>=2.13.0 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (2.22.0)
Requirement already satisfied: pathy>=0.3.5 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (0.4.0)
Requirement already satisfied: thinc<8.1.0,>=8.0.2 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (8.0.2)
Requirement already satisfied: preshed<3.1.0,>=3.0.2 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (3.0.5)
Requirement already satisfied: srsly<3.0.0,>=2.4.0 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (2.4.0)
Requirement already satisfied: numpy>=1.15.0 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (1.18.1)
Requirement already satisfied: jinja2 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (2.11.1)
Requirement already satisfied: catalogue<2.1.0,>=2.0.1 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (2.0.1)
Requirement already satisfied: typer<0.4.0,>=0.3.0 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (0.3.2)
Requirement already satisfied: typing-extensions<4.0.0.0,>=3.7.4 in /home/ye/anaconda3/lib/python3.7/site-packages (from spacy) (3.7.4.3)
Requirement already satisfied: zipp>=0.5 in /home/ye/anaconda3/lib/python3.7/site-packages (from importlib-metadata>=0.20->spacy) (2.2.0)
Requirement already satisfied: pyparsing>=2.0.2 in /home/ye/anaconda3/lib/python3.7/site-packages (from packaging>=20.0->spacy) (2.4.6)
Requirement already satisfied: six in /home/ye/anaconda3/lib/python3.7/site-packages (from packaging>=20.0->spacy) (1.14.0)
Requirement already satisfied: smart-open<4.0.0,>=2.2.0 in /home/ye/anaconda3/lib/python3.7/site-packages (from pathy>=0.3.5->spacy) (3.0.0)
Requirement already satisfied: certifi>=2017.4.17 in /home/ye/anaconda3/lib/python3.7/site-packages (from requests<3.0.0,>=2.13.0->spacy) (2019.11.28)
Requirement already satisfied: chardet<3.1.0,>=3.0.2 in /home/ye/anaconda3/lib/python3.7/site-packages (from requests<3.0.0,>=2.13.0->spacy) (3.0.4)
Requirement already satisfied: urllib3!=1.25.0,!=1.25.1,<1.26,>=1.21.1 in /home/ye/anaconda3/lib/python3.7/site-packages (from requests<3.0.0,>=2.13.0->spacy) (1.25.8)
Requirement already satisfied: idna<2.9,>=2.5 in /home/ye/anaconda3/lib/python3.7/site-packages (from requests<3.0.0,>=2.13.0->spacy) (2.8)
Requirement already satisfied: click<7.2.0,>=7.1.1 in /home/ye/anaconda3/lib/python3.7/site-packages (from typer<0.4.0,>=0.3.0->spacy) (7.1.2)
Requirement already satisfied: MarkupSafe>=0.23 in /home/ye/anaconda3/lib/python3.7/site-packages (from jinja2->spacy) (1.1.1)
```

Spacy က ငါ့စက်ထဲမှာ ရှိပြီးသား...  
Error ကို သေချာ ပြန်ကြည့်ရအောင်...   

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ python ./hello-chatterbot.py 
Traceback (most recent call last):
  File "./hello-chatterbot.py", line 2, in <module>
    chatbot = ChatBot("myAgriBot")
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/chatterbot.py", line 28, in __init__
    self.storage = utils.initialize_class(storage_adapter, **kwargs)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/utils.py", line 33, in initialize_class
    return Class(*args, **kwargs)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/storage/sql_storage.py", line 20, in __init__
    super().__init__(**kwargs)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/storage/storage_adapter.py", line 23, in __init__
    'tagger_language', languages.ENG
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/tagging.py", line 26, in __init__
    self.nlp = spacy.load(self.language.ISO_639_1.lower())
  File "/home/ye/anaconda3/lib/python3.7/site-packages/spacy/__init__.py", line 47, in load
    return util.load_model(name, disable=disable, exclude=exclude, config=config)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/spacy/util.py", line 328, in load_model
    raise IOError(Errors.E941.format(name=name, full=OLD_MODEL_SHORTCUTS[name]))
OSError: [E941] Can't find model 'en'. It looks like you're trying to load a model from a shortcut, which is deprecated as of spaCy v3.0. To load the model, use its full name instead:

nlp = spacy.load("en_core_web_sm")

For more details on the available models, see the models directory: https://spacy.io/models. If you want to create a blank model, use spacy.blank: nlp = spacy.blank("en")
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$
```

## Confirm with English List Training Data

အဲဒါနဲ့ မြန်မာစာဒေတာနဲ့ မလုပ်ခင် English list ဒေတာနဲ့ပဲ သူ့ original program ကိုပဲ testing အနေနဲ့ run ကြည့်ခဲ့...  
hello-en-chatterbot.py ဆိုတဲ့ python ပရိုဂရမ်က အောက်ပါအတိုင်းပါ...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ cat hello-en-chatterbot.py 
from chatterbot import ChatBot
from chatterbot.trainers import ListTrainer

# Create a new chat bot named Charlie
chatbot = ChatBot('Charlie')

trainer = ListTrainer(chatbot)

trainer.train([
    "Hi, can I help you?",
    "Sure, I'd like to book a flight to Iceland.",
    "Your flight has been booked."
])

# Get a response to the input text 'I would like to book a flight.'
response = chatbot.get_response('I would like to book a flight.')

print(response)
```

အင်္ဂလိပ်ဒေတာနဲ့လည်း လက်ရှိစက်ထဲမှာ run လို့ အဆင်မပြေဘူး...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ python ./hello-en-chatterbot.py 
Traceback (most recent call last):
  File "./hello-en-chatterbot.py", line 5, in <module>
    chatbot = ChatBot('Charlie')
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/chatterbot.py", line 28, in __init__
    self.storage = utils.initialize_class(storage_adapter, **kwargs)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/utils.py", line 33, in initialize_class
    return Class(*args, **kwargs)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/storage/sql_storage.py", line 20, in __init__
    super().__init__(**kwargs)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/storage/storage_adapter.py", line 23, in __init__
    'tagger_language', languages.ENG
  File "/home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/tagging.py", line 26, in __init__
    self.nlp = spacy.load(self.language.ISO_639_1.lower())
  File "/home/ye/anaconda3/lib/python3.7/site-packages/spacy/__init__.py", line 47, in load
    return util.load_model(name, disable=disable, exclude=exclude, config=config)
  File "/home/ye/anaconda3/lib/python3.7/site-packages/spacy/util.py", line 328, in load_model
    raise IOError(Errors.E941.format(name=name, full=OLD_MODEL_SHORTCUTS[name]))
OSError: [E941] Can't find model 'en'. It looks like you're trying to load a model from a shortcut, which is deprecated as of spaCy v3.0. To load the model, use its full name instead:

nlp = spacy.load("en_core_web_sm")

For more details on the available models, see the models directory: https://spacy.io/models. If you want to create a blank model, use spacy.blank: nlp = spacy.blank("en")
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ 
```

Chatterbot က သုံးထားတဲ့ Spacy version နဲ့ ငါ့စက်ထဲမှာ install လုပ်ထားတဲ့ Spacy version က မတူလို့ ဖြစ်တဲ့ ပြဿနာလို့ နားလည်တယ်။  

## Check Spacy

အဲဒါနဲ့ Spacy library ကိုယ်တိုင်ကို import လုပ်လို့ ရမရနဲ့ အထက်က program မှာ သုံးထားတဲ့  spacy ရဲ့ en_core_web_sm ကို loading လုပ်လို့ ရမရကိုလည်း စမ်းကြည့်ခဲ့...  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ python
Python 3.7.6 (default, Jan  8 2020, 19:59:22) 
[GCC 7.3.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import spacy
>>> nlp = spacy.load("en_core_web_sm")
>>> 
```
en_core_web_sm က ရှိပြီးသား...  
အထက်ပါအတိုင်း loading က အိုကေတယ်။  

## Fixed the Error

Reference: https://stackoverflow.com/questions/66087475/chatterbot-error-oserror-e941-cant-find-model-en  
အထက်ပါ reference link ကို refer လုပ်ပြီး running error ကို fix လုပ်ခဲ့တယ်။  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ gedit /home/ye/anaconda3/lib/python3.7/site-packages/chatterbot/tagging.py
Line no. 26 မှာ ရှိတဲ့ အောက်ပါ လိုင်းကို  
        self.nlp = spacy.load(self.language.ISO_639_1.lower())
        
အောက်ပါ အတိုင်း replace လုပ်ခဲ့တယ်

if self.language.ISO_639_1.lower() == 'en':
    self.nlp = spacy.load('en_core_web_sm')
else:
    self.nlp = spacy.load(self.language.ISO_639_1.lower())
```

## Run English Simple Chattabot Program Again

အထက်ပါအတိုင်း error ကို fix လုပ်ပြီးတဲ့နောက်မှာ hello-en-chatterbot.py ကို run လို့ အဆင်ပြေသွားတာကို အောက်ပါအတိုင်း တွေ့ရ...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ python ./hello-en-chatterbot.py 
List Trainer: [####################] 100%
Your flight has been booked.
```

## Run Myanmar Hello Chattabot Program Again

မေးခွန်းက   
response = chatbot.get_response("ကော်ဖီမျိုးစေ့ ရေနွေးစိမ် အညှောင့်ဖောက်ရာတွင် အချိန်ဘယ်လောက်ကြာအောင် စိမ်သင့်ပါလဲ။")  

Train and Run and Let's see the answer:  

အောက်ပါအတိုင်း training လုပ်တာလည်း သိပ်မကြာဘူး...  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ python ./hello-chatterbot.py 
List Trainer: [####################] 100%
၁၂ နာရီမှ ၂၄ နာရီ စိမ်သင့်ပါသည်။
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ 
```

## Testing Terminal Mode

Interactive mode သို့မဟုတ် Terminal mode ကို အောက်ပါအတိုင်း စမ်းကြည့်ခဲ့...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ cat ./hello-chatterbot-en-terminal.py 
from chatterbot import ChatBot


# Uncomment the following lines to enable verbose logging
# import logging
# logging.basicConfig(level=logging.INFO)

# Create a new instance of a ChatBot
bot = ChatBot(
    'Terminal',
    storage_adapter='chatterbot.storage.SQLStorageAdapter',
    logic_adapters=[
        'chatterbot.logic.MathematicalEvaluation',
        'chatterbot.logic.TimeLogicAdapter',
        'chatterbot.logic.BestMatch'
    ],
    database_uri='sqlite:///database.db'
)

print('Type something to begin...')

# The following loop will execute each time the user enters input
while True:
    try:
        user_input = input()

        bot_response = bot.get_response(user_input)

        print(bot_response)

    # Press ctrl-c or ctrl-d on the keyboard to exit
    except (KeyboardInterrupt, EOFError, SystemExit):
        break
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$
```
Corpus က Math Evaluation မို့လို့ သင်္ချာနဲ့ ဆိုင်တာကို မေးမှ ဖြစ်လိမ့်မယ်...  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ python ./hello-chatterbot-en-terminal.py 
Type something to begin...
1 + 100
1 + 100 = 101
200 * 300 
200 * 300 = 60000
200/2
The current time is 11:04 AM
200 / 2
200 / 2 = 100
```

အလုပ်လုပ်တယ်။  

## Testing with a Training Corpus

Documentation ကို ဝင်လေ့လာခဲ့...  
Ref: https://chatterbot.readthedocs.io/en/stable/training.html  

corpus-chatterbot.py ဆိုတဲ့ ပရိုဂရမ်ရဲ့ code က အောက်ပါအတိုင်း...  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ cat corpus-chatterbot.py 
import json

# ref: https://ciir.cs.umass.edu/downloads/nfL6/

data = json.loads(open('./nfL6-data/nfL6.json', 'r').read())
train = []

for k, row in enumerate(data):
    train.append(row['question'])
    train.append(row['answer'])
    
from chatterbot import ChatBot
from chatterbot.trainers import ListTrainer

chatbot = ChatBot('QA')
trainer = ListTrainer(chatbot)
#trainer.train(train[:1024])
trainer.train(train)

while True:
    request = input('You: ')
    response = chatbot.get_response(request)
    print('Bot: ', response)
    
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$
```

I downloaded json Q&A data of Yahoo.  
(Yahoo ကနေ json Q&A ဒေတာကို ဒေါင်းလုပ် လုပ်ယူခဲ့တယ်)  
```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test/nfL6-data$ ls
link.txt  nfL6.json  README.txt
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test/nfL6-data$ wc ./nfL6.json 
  1197750  25255040 156228758 ./nfL6.json
```

Check the json file:  

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test/nfL6-data$ head -n 20 ./nfL6.json 
[
    {
        "main_category": "News & Events", 
        "question": "Why did the U.S Invade Iraq ?", 
        "nbestanswers": [
            "A small group of politicians believed strongly that the fact that Saddam Hussien remained in power after the first Gulf War was a signal of weakness to the rest of the world, one that invited attacks and terrorism. Shortly after taking power with George Bush in 2000 and after the attack on 9/11, they were able to use the terrorist attacks to justify war with Iraq on this basis and exaggerated threats of the development of weapons of mass destruction. The military strength of the U.S. and the brutality of Saddam's regime led them to imagine that the military and political victory would be relatively easy.", 
            "Because there is a lot of oil in Iraq.", 
            "It is tempting to say that the US invaded Iraq because it has lots of oil, but the US is not a country in a deep economic problem that capturing other country\u2019s oil is an actual need for survival. It is more likely that the Iraq invading Kuwait scenario would fall under that assumption.. I think that the US government has come to a conclusion that we are on the verge of a war of religions, or more likely ideologies. It would be presumptuous to try and determent a one cause to the coming war. . I think that the world wide spread of the media with its many forms (Cable, Satellite, Internet, etc.)  have pushed the Moslem regimes to the extreme, fearing that secularity and democratic influence is penetrating their country and will result in an up raising against them. One of the best way to maintain the power that you have and even gain more of it, is by hatred. When the common man is occupied hating an outside enemy, its hatred is kept out side the county and would not be directed towards the regime. . So- I believe that the US understands that the fanatic Moslem regimes have already started a war on the democratic world and now is the time to try a fight it.. . So why invade Iraq? Because it is a huge, week Moslem country that thought to be easy to defeat. . This is exactly the same reason why Afghanistan was first and Syria is next in line.", 
            "I think Yuval is pretty spot on. It's a proving ground and a focal point for terror activity that's not on American soil. And, because no one liked Saddam Hussein, no other countries (even in the Middle East) were about to rise up and join his side.. . Rabid speculation: now the Pentagon has a model that says it takes ~5 years, ~$200B and ~2,000 casualties to \"rebuild\" a dictatorship into a democracy. Who's next on the list?"
        ], 
        "answer": "A small group of politicians believed strongly that the fact that Saddam Hussien remained in power after the first Gulf War was a signal of weakness to the rest of the world, one that invited attacks and terrorism. Shortly after taking power with George Bush in 2000 and after the attack on 9/11, they were able to use the terrorist attacks to justify war with Iraq on this basis and exaggerated threats of the development of weapons of mass destruction. The military strength of the U.S. and the brutality of Saddam's regime led them to imagine that the military and political victory would be relatively easy.", 
        "id": "2020338"
    }, 
    {
        "main_category": "Education & Reference", 
        "question": "How to get rid of a beehive?", 
        "nbestanswers": [
            "Call an area apiarist.  They should be able to help you and would most likely remove them at no charge in exchange for the hive.  The bees have value and they now belong to you.", 
            "Don't try this yourself but this is what the old fashioned way is - done in some villages in other parts of the world.. . The guy who dismantles, wears a mask with holes at the eyes so he can see, carries a big sack with burning coals in it.  He also wraps his hands with thick cloths, carries an empty bag to collect the honey in it.. He then collects the honey in the empty bag, pulls the hive into the bag of coals.. . If he just wants to collect the honey, he would leave after collecting the honey - but the bag of coals is used to choke & burn the bees if he wanted to get rid of the hive.. . That's a bit like coding in COBOL & assembly :)"
        ], 
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test/nfL6-data$ 
```

Training and Testing...   

```
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$ time python ./corpus-chatterbot.py
List Trainer: [####################] 100%
You: Which is better, sushi or sashimi and why?                                        
Bot:  I like them both.. Sushi is satisfying because of the rice.. It's a complete meal.
You: Why does McDonalds not serve chicken nuggets?
Bot:  Yeah, they have moved away from all of their super-sized menu items. I was sorry to see the 20 piece go as well since my husband & I used to split one for dinner...
You: what is sex?
Bot:  when 2 humans stick their privates in one another for pleasure or to reproduce. lmao its not that hard to understand. "birds in the bees".
You: Do you know Yahoo and Google?
Bot:  If you sign out of Yahoo Answers, you sign out of Yahoo! too... you can't only sign out of Yahoo Answers and not out of Yahoo... that's annoying I know!
You: Do you know Yahoo?
Bot:  I'm unaware of any phone number you can call. Use the links below to contact customer support.
You: What is Google?
Bot:  In "geekdom", this also stands for "the Guide for Occupational Exploration" published by JIST. Check the GOE section of CareerOINK.
You: What is NLP research?
Bot:  Get a commerce degree majoring in Market Research!! I'm currently doing this market research paper, its hell!!
You: What is natural language processing?
Bot:  It could mean a lot of things but usually it means that you get data from someone and you have to mold the data to fit your application. For example if someone gave you a list of their customers and they told you to load it into their customer relationship management app ( CRM ) you will have to somehow load the customer info into the app. Lookup keywords on google such as "DTS" and "Bulk Insert" to learn more.
You: what is AI?
Bot:  AVI is a video file format like Mpeg, or quicktime. u prolly need the divx codec. you can download it with the link below...
You: Where is Myanmar?
Bot:  People yawn because there is a shortage of oxygen in the brain. You do it when you're bored cuz usually you're inactive and breathing very lightly therefore lessening the available oxygen.
You: What is the coolest insect?
Bot:  The coolest insects are the phasmids, stickbugs. They're sit-and-wait predators, inconspicuous, lethal. By far the coolest.. . Spiders are not insects.
You: Why are Owls considered to be WISE?
Bot:  According to the Greeks, Athena (the goddess of wisdom) could turn herself into an owl. In most of the images of her she is shown with an owl on her shoulder. The owl soon became a symbol of Athena, therefore a symbol of knowledge and wisdom.
You: ^CTraceback (most recent call last):
  File "./corpus-chatterbot.py", line 21, in <module>
    request = input('You: ')
KeyboardInterrupt

real	22m19.921s
user	13m10.256s
sys	0m4.032s
(base) ye@administrator-HP-Z2-Tower-G4-Workstation:~/tool/ChatterBot/my-test$
```
json ဖိုင် ဒေတာ အားလုံးနဲ့ training လုပ်တာက မိနစ် ၁၉ မိနစ်လောက်ပဲ ကြာတယ်။   

## To Do

- လက်ရှိ ဒေတာကို json file format ပြောင်းဖို့အတွက် script ရေးရမယ်  
- အမေး-အဖြေ ဒေတာတွေ (လက်ရှိမှာ အဖြေတွေက မပြည့်စုံသေး) ကို ထပ်ဖြည့်ရန်  
- အချိန်ရရင် Bayesian classification အပြင် တခြား modeling approach တွေနဲ့ပါ coding ကို ဝင်ပြင်ရေးပြီး experiment လုပ်ကြည့်ရန်...   




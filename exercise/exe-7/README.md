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

- Syllable Breaking  
- Consider Based on example data of CRF++ how to label Myanmar data for supervised training:  
For example:  

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

crf_learn -f 3 -c 4.0 template train.my model  

## 7. Testing your CRF model

### Testing with Closed-test data
crf_test -m model closed-test.my  

### Testing with Open-test data
crf_test -m model open-test.my  

## 8.Make evaluation and consider to increase your model performance

e.g. Updating features, updating template, changing parameters of CRF++ training process  

# One more exercise
Write a perl program for changing column format into normal writing format (left to right)  








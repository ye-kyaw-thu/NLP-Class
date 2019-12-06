import sklearn
from sklearn.metrics import accuracy_score
from sklearn.metrics import confusion_matrix
from sklearn import metrics

#syllable
f = open('close-2tag.result.true', 'r')
actual = f.readlines()
f.close()

f = open('close-2tag.result.predicted', 'r')
predicted = f.readlines()
f.close()

accuracy=accuracy_score(actual, predicted)
print('Accuracy :')
print(accuracy)

print('Precision-recall table (2-tags Syllable Level)')
print(metrics.classification_report(actual,predicted))

f = open('close-3tag.result.true', 'r')
actual = f.readlines()
f.close()

f = open('close-3tag.result.predicted', 'r')
predicted = f.readlines()
f.close()

accuracy=accuracy_score(actual, predicted)
print('Accuracy :')
print(accuracy)

print('Precision-recall table (3-tags Syllable Level)')
print(metrics.classification_report(actual,predicted))

f = open('close-4tag.result.true', 'r')
actual = f.readlines()
f.close()

f = open('close-4tag.result.predicted', 'r')
predicted = f.readlines()
f.close()

accuracy=accuracy_score(actual, predicted)
print('Accuracy :')
print(accuracy)

print('Precision-recall table (4-tags Syllable Level)')
print(metrics.classification_report(actual,predicted))

f = open('close-5tag.result.true', 'r')
actual = f.readlines()
f.close()

f = open('close-5tag.result.predicted', 'r')
predicted = f.readlines()
f.close()

accuracy=accuracy_score(actual, predicted)
print('Accuracy :')
print(accuracy)

print('Precision-recall table (5-tags Syllable Level)')
print(metrics.classification_report(actual,predicted))



#character
f = open('close.ch-2tag.result.true', 'r')
actual = f.readlines()
f.close()

f = open('close.ch-2tag.result.predicted', 'r')
predicted = f.readlines()
f.close()

accuracy=accuracy_score(actual, predicted)
print('Accuracy :')
print(accuracy)

print('Precision-recall table (2-tags Character Level)')
print(metrics.classification_report(actual,predicted))

f = open('close.ch-3tag.result.true', 'r')
actual = f.readlines()
f.close()

f = open('close.ch-3tag.result.predicted', 'r')
predicted = f.readlines()
f.close()

accuracy=accuracy_score(actual, predicted)
print('Accuracy :')
print(accuracy)

print('Precision-recall table (3-tags Character Level)')
print(metrics.classification_report(actual,predicted))

f = open('close.ch-4tag.result.true', 'r')
actual = f.readlines()
f.close()

f = open('close.ch-4tag.result.predicted', 'r')
predicted = f.readlines()
f.close()

accuracy=accuracy_score(actual, predicted)
print('Accuracy :')
print(accuracy)

print('Precision-recall table (4-tags Character Level)')
print(metrics.classification_report(actual,predicted))

f = open('close.ch-5tag.result.true', 'r')
actual = f.readlines()
f.close()

f = open('close.ch-5tag.result.predicted', 'r')
predicted = f.readlines()
f.close()

accuracy=accuracy_score(actual, predicted)
print('Accuracy :')
print(accuracy)

print('Precision-recall table (5-tags Character Level)')
print(metrics.classification_report(actual,predicted))






.PHONY: all clean view

FILE=asr-slide1

all: $(FILE).pdf

clean:
	rm $(FILE).pdf $(FILE).aux

view:
	evince $(FILE).pdf
	#qpdfview $(FILE).pdf

$(FILE).pdf: $(FILE).tex
	xelatex $(FILE).tex
	xelatex $(FILE).tex
	#bibtex $(FILE)
	evince $(FILE).pdf


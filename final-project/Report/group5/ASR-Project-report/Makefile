.PHONY: all clean view

FILE=asr2021

all: $(FILE).pdf

clean:
	rm $(FILE).pdf *.aux *.log #*.blg *.bbl

view:
	evince $(FILE).pdf
	#qpdfview $(FILE).pdf

$(FILE).pdf: $(FILE).tex
	xelatex $(FILE).tex
	xelatex $(FILE).tex
	#bibtex $(FILE)
	evince $(FILE).pdf

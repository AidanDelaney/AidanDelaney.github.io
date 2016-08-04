SOURCES=$(wildcard *.tex)
PDF_OUTPUTS=$(SOURCES:.tex=.pdf)

all: ${PDF_OUTPUTS}

%.pdf: %.tex
	pdflatex -jobname=$(basename $<)-questions '\newif\ifanswers\answersfalse\input{$<}'
	pdflatex -jobname=$(basename $<)-answers '\newif\ifanswers\answerstrue\input{$<}'

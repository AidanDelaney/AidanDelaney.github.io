SOURCES=$(wildcard *.md)
OUTPUTS=$(SOURCES:.md=.html)

all: ${OUTPUTS}

%.html: %.md
	pandoc -s -t revealjs -c css/vmg.css --variable transition="linear" --variable theme="black" --toc --mathjax="js/MathJax/MathJax.js" $< -o $@

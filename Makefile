SOURCES=$(wildcard *.md)

all: ${SOURCES}

%.md: %.html
	echo ${SOURCES}
	pandoc -s -t revealjs -c css/vmg.css --variable transition="linear" --variable theme="black" --toc --mathjax="js/MathJax/MathJax.js" $@ -o $<

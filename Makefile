SOURCES=$(wildcard *.md)
OUTPUTS=$(SOURCES:.md=.html)

all: ${OUTPUTS}

%.html: %.md
	pandoc -s -t revealjs -A js/keybindings.js --section-divs -c css/vmg.css -c reveal.js/css/theme/black.css --variable transition="linear" --variable theme="black" --toc --toc-depth=1 --mathjax=js/Mathjax/MathJax.js?config=TeX-AMS_HTML-full $< -o $@

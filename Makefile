SOURCES=$(wildcard *.md)
HTML_OUTPUTS=$(SOURCES:.md=.html)
PDF_OUTPUTS=$(SOURCES:.md=.pdf)

all: ${HTML_OUTPUTS} ${PDF_OUTPUTS}

%.html: %.md
	pandoc --filter=pandoc-svg.py -s -t revealjs -A js/keybindings.js --section-divs -c css/vmg.css -c reveal.js/css/theme/black.css --variable transition="linear" --variable theme="black" --toc --toc-depth=1 --mathjax=js/Mathjax/MathJax.js?config=TeX-AMS_HTML-full $< -o $@

%.pdf: %.md
	pandoc --filter=pandoc-svg.py $< -t beamer -o $@

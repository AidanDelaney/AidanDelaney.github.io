SOURCES=$(wildcard *.md)
HTML_OUTPUTS=$(SOURCES:.md=.html)
PDF_OUTPUTS=$(SOURCES:.md=.pdf)

all: ${HTML_OUTPUTS} ${PDF_OUTPUTS}

%.html: %.md
	#pandoc --filter=pandoc-svg.py -s -t revealjs -A js/keybindings.js --section-divs -c css/vmg.css -c reveal.js/css/theme/black.css --variable transition="linear" --variable theme="black" --toc --toc-depth=1 --mathjax=js/Mathjax/MathJax.js?config=TeX-AMS_HTML-full $< -o $@ --bibliography bibliography.bib
	pandoc -s -t revealjs -A js/keybindings.js --section-divs -c css/vmg.css -c reveal.js/css/theme/white.css --variable transition="linear" --variable theme="white" --toc --toc-depth=1 --mathjax=js/Mathjax/MathJax.js?config=TeX-AMS_HTML-full $< -o $@ --bibliography bibliography.bib --filter pandoc-citeproc  --slide-level=2

%.pdf: %.tex
	pdflatex $<

%.tex: %.md
	pandoc -s --filter=pandoc-svg.py --filter pandoc-citeproc  $< -t beamer -o $@ --bibliography bibliography.bib --slide-level=2
	#pandoc -s --filter pandoc-citeproc  $< -t beamer -o $@ --bibliography bibliography.bib

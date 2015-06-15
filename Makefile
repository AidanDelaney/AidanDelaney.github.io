all:
	pandoc -s -t revealjs --variable transition="linear" --variable theme="black" --mathjax="js/MathJax/MathJax.js" 2015SussexDowns.md -o 2015SussexDowns.html

all:
	pandoc -s -t revealjs -c css/vmg.css --variable transition="linear" --variable theme="black" --toc --mathjax="js/MathJax/MathJax.js" 2015SussexDowns.md -o 2015SussexDowns.html

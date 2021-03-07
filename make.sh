#/bin/bash
pdflatex mcStitching.tex
bibtex mcStitching
pdflatex mcStitching.tex
pdflatex mcStitching.tex
#acroread mcStitching.pdf


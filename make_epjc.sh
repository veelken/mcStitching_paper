#!/bin/bash

pdflatex mcStitching_epjc.tex
cp mcStitching.bib mcStitching_epjc.bib
bibtex mcStitching_epjc
pdflatex mcStitching_epjc.tex
pdflatex mcStitching_epjc.tex

# convert to grayscale
if [[ -f mcStitching_epjc.pdf ]] && [[ "$1" = "grayscale" ]]; then
  gs \
   -sOutputFile=mcStitching_epjc_grayscale.pdf \
   -sDEVICE=pdfwrite \
   -sColorConversionStrategy=Gray \
   -dProcessColorModel=/DeviceGray \
   -dCompatibilityLevel=1.4 \
   -dNOPAUSE \
   -dBATCH \
   mcStitching_epjc.pdf
fi

#acroread mcStitching_epjc.pdf


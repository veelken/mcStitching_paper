#!/bin/bash

if [[ "$1" = "clean" ]]; then
  rm -fv mcStitching_epjc.bbl mcStitching_epjc.blg mcStitching_epjc.aux mcStitching_epjc.out mcStitching_epjc.log mcStitching_epjc.pdf mcStitching_epjc_grayscale.pdf
  exit 0
fi

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

cp mcStitching_epjc.pdf ~

#acroread mcStitching_epjc.pdf


#!/bin/bash

if [[ "$1" = "clean" ]]; then
  rm -fv mcStitching.bbl mcStitching.blg mcStitching.aux mcStitching.out mcStitching.log mcStitching.pdf mcStitching_grayscale.pdf
  exit 0
fi

pdflatex mcStitching.tex
bibtex mcStitching
pdflatex mcStitching.tex
pdflatex mcStitching.tex

# convert to grayscale
if [[ -f mcStitching.pdf ]] && [[ "$1" = "grayscale" ]]; then
  gs \
   -sOutputFile=mcStitching_grayscale.pdf \
   -sDEVICE=pdfwrite \
   -sColorConversionStrategy=Gray \
   -dProcessColorModel=/DeviceGray \
   -dCompatibilityLevel=1.4 \
   -dNOPAUSE \
   -dBATCH \
   mcStitching.pdf
fi

#acroread mcStitching.pdf


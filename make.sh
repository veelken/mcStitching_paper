#/bin/bash

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


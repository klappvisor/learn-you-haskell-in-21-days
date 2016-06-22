#!/bin/bash

if [ "$1" == "--clean" ]; then
    rm -f book.{aux,bbl,blg,log,out,toc}
    exit
fi

pdflatex book.tex
bibtex book.aux
pdflatex book.tex
pdflatex book.tex

mv book.pdf Learn\ You\ Haskell\ in\ 21\ days `git describe --abbrev=0`.pdf

if [ "$1" != "--preserve" ]; then
    rm -f book.{aux,bbl,blg,log,out,toc}
fi

#/usr/bin/bash/zsh

zip -r arxiv.zip csvs bib sections plots

MAIN=$(ls arxiv | grep  _shared.tex | cut  -d "_" -f -2)

cd arxiv

pdflatex $MAIN
bibtex $MAIN
zsh tex_clean.sh

zip -r main.zip $MAIN* format*

mv main.zip ../main.zip
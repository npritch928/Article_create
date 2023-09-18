#/usr/bin/zsh
mkdir $1
cp -r important_files $1/important_files

cd $1
mkdir article
mkdir code
mv important_files article/important_files

cd article
mkdir arxiv 
mkdir submission
mkdir bib
mkdir csvs
mkdir plots
mkdir sections

mv important_files/README.md README.md
mv important_files/mkarxiv.sh mkarxiv.sh

touch submission/$2.tex
touch submission/$2_shared.tex
mv important_files/Letter_to_editor.tex submission/Letter_to_editor.tex
mv important_files/uwstat.png submission/uwstat.png
mv important_files/tex_clean.sh submission/tex_clean.sh

touch arxiv/$2.tex
touch arxiv/$2_shared.tex
mv important_files/tex_clean_arxiv.sh arxiv/tex_clean_arxiv.sh

touch bib/$2.bib

rm -r important_files

echo "\\\\newcommand{\Cinput}[1]{{\IfFileExists{../bib/$2.bib}{\input{../#1}}{\input{./#1}}}}"  >> arxiv/$2_shared.tex
echo "\IfFileExists{../bib/$2.bib}{\\\\newcommand{\\\\cspath}{../csvs}}{\\\\newcommand{\\\\cspath}{./csvs}}"  >> arxiv/$2_shared.tex
echo "\IfFileExists{../bib/$2.bib}{\\\\newcommand{\\\\impath}{../plots}}{\\\\newcommand{\\\\impath}{./plots}}"  >> arxiv/$2_shared.tex 

echo "\\\\newcommand{\Cinput}[1]{{\IfFileExists{../bib/$2.bib}{\input{../#1}}{\input{./#1}}}}" >> submission/$2_shared.tex 
echo "\IfFileExists{../bib/$2.bib}{\\\\newcommand{\\\\cspath}{../csvs}}{\\\\newcommand{\\\\cspath}{./csvs}}" >> submission/$2_shared.tex 
echo "\IfFileExists{../bib/$2.bib}{\\\\newcommand{\\\\impath}{../plots}}{\\\\newcommand{\\\\impath}{./plots}}"  >> submission/$2_shared.tex 

file_name = metrics_pro
file_name2 = metrics_pro_en

all: $(file_name).pdf $(file_name2).pdf

$(file_name).pdf: $(file_name).tex $(file_name).bib
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -xelatex -shell-escape $(file_name).tex
	# arara -v $(file_name).tex

	# clean auxillary files
	latexmk -c $(file_name).tex

# $(file_name).tex : $(file_name).Rnw
#	Rscript -e "library(knitr); knit('$(file_name).Rnw')"


$(file_name2).pdf: $(file_name2).tex $(file_name2).bib
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -xelatex -shell-escape $(file_name).tex
	# arara -v $(file_name).tex

	# clean auxillary files
	latexmk -c $(file_name).tex




clean:
	-rm $(file_name).pdf 
	-rm $(file_name).fls 
	-rm $(file_name).log 
	-rm $(file_name).out 
	-rm $(file_name).aux 
	-rm $(file_name).toc 
	-rm $(file_name).bcf 		
	-rm $(file_name).fdb_latexmk 
	-rm $(file_name)-concordance.tex
	-rm $(file_name).bbl
	-rm $(file_name).run.xml
	-rm $(file_name).xdv
	-rm all_solutions.tex



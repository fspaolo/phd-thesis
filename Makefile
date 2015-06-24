TEXFILE=thesis.tex
PDFREADER=xpdf
PDFFILE:=$(TEXFILE:.tex=.pdf)
BIBFILE:=$(TEXFILE:.tex="")

#export TEXINPUTS=".;..//;"

default:
	pdflatex $(TEXFILE)
	bibtex $(BIBFILE)
	pdflatex $(TEXFILE)

show:
	$(PDFREADER) $(PDFFILE) &

clean:
	rm -f *.aux *.idl *.idx *.ilg *.ind *.lof *.log *.lot *.toc *.blg *.bbl *.bcf *-blx.bib

help:
	@echo 'Makefile for LaTeX UCSD dissertation                             '
	@echo '                                                                 '
	@echo 'Usage:                                                           '
	@echo '   make            generate PDF from TeX file                    '
	@echo '   make show       open generated PDF                            '
	@echo '   make clean      remove temporary files                        '
	@echo '                                                                 '
	@echo 'Set the TEXFILE variable with the name of your "thesis.tex" file.'
	@echo '                                                                 '


.PHONY: show clean help

#
# Makefile for generating PS from TEX file (with bibliography processing).
# (C) 2002 Pawel Palucha
#
# $Id: Makefile,v 1.7 2002/06/24 23:11:40 pawel Exp $
#

SOURCES:= praca_magisterska.tex
CLASS:= pracamgr.cls
OUTPUT:=$(subst .tex,.ps,${SOURCES})
DVI:=$(subst .tex,.dvi,${SOURCES})
AUX:=$(subst .tex,.aux,${SOURCES})
IMAGES:=termometr.ps byto.ps architektura.eps szarp.eps

all: $(OUTPUT)

%.ps : %.dvi
	dvips $< -o

$(DVI) : $(SOURCES) $(CLASS)
	( (latex $< | grep "undefined references" ) && latex $<) || true

$(BIBLOUTPUT) : $(AUX) $(BIBLSOURCES)
	bibtex $(subst .bbl,,$@)

$(AUX) : $(SOURCES) $(IMAGES)
	latex $<

clean:
	rm -f $(OUTPUT) *.log *.aux *.toc *.lof *.dvi *~ praca_magisterska.pdf

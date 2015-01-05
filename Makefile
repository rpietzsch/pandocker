TEX_FOLDER=tex
MD_FOLDER=md
PANDOC_FLAGS=-f markdown -t latex -S

SOURCES=$(shell cd $(MD_FOLDER); ls -1 *.md | cut -d "." -f 1)

%: md/%.md
	pandoc $(PANDOC_FLAGS) $^ > $(TEX_FOLDER)/$@.tex

build: pdf bib pdf

pdf: builddir $(SOURCES)
	xelatex index.tex

docx: pdf
	$(P) -f latex -t docx index.tex -o index.docx

odt: pdf
	$(P) -f latex -t odt index.tex -o index.odt

builddir:
	mkdir -p $(TEX_FOLDER)

bib:
	biber index

clean:
	rm -rf $(BUILDDIR)
	rm -rf *.lot *.nav *.snm *.vrb *.aux *.bbl *.blg *.log *.lof *.lol *.dvi *.toc *.out *.bak *.mtc0 *.maf *.mtc *.spl *.brf *.run.xml *blx.bib *.glo *.bcf *.fls

pdf-d:
	docker run -i -t --rm -v `pwd`:/build rpietzsch/pandocker make pdf

docx-d:
	docker run -i -t --rm -v `pwd`:/build rpietzsch/pandocker make docx

odt-d:
	docker run -i -t --rm -v `pwd`:/build rpietzsch/pandocker make odt

build-d:
	docker run -i -t --rm -v `pwd`:/build rpietzsch/pandocker make build

shell-d:
	docker run -i -t --rm -v `pwd`:/build rpietzsch/pandocker bash

bib-d:
	docker run -i -t --rm -v `pwd`:/build rpietzsch/pandocker make bib

open:
	open index.pdf
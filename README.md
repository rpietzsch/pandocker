# pandocker

## usage

- add / write your markdown in md/*.md files
- define packages / styles / tocs in index.tex
- build(-d) creates tex/*.tex files from each .md``

## make targets

- ``make build-d``
- ``make pdf-d``
- ``make bib-d``
- ``make docx-d``
- ``make odt-d``
- ``make open``

## build docker container

``docker build -t rpietzsch/pandocker .``
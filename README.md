# pandocker

## requirements

- installed docker / boot2docker 
	- http://docs.docker.com/installation/
	- tested with docker 1.4.1

## usage

- add / write your markdown in md/*.md files
- define packages / styles / tocs in index.tex
- build(-d) creates tex/*.tex files from each .md
- review Makefile
- container targets pull docker container from hub.docker.com automatically upon first call (see below for local build instruction)

## make targets

- there are local and docker-container targets
- container targets are suffixed with "-d"
	- ``make build-d``
	- ``make pdf-d``
	- ``make bib-d``
	- ``make docx-d``
	- ``make odt-d``
	- ``make open``

## build docker container

``docker build -t rpietzsch/pandocker .``

## todo 

- verify if usable under windows with boot2docker and cygwin
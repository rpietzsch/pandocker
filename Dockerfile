FROM ubuntu:14.04
MAINTAINER Rene Pietzsch <rpietzsch@gmail.com>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y build-essential pandoc texlive texlive-latex-extra texlive-generic-extra texlive-xetex texlive-lang-german
RUN apt-get install -y pandoc-citeproc texlive-bibtex-extra biber rubber

RUN mkdir /build
WORKDIR /build
VOLUME ["/build"]
FROM debian:stretch
MAINTAINER tim@elec.ac.n

RUN apt-get update && apt-get upgrade
RUN apt-get install -y build-essential \
    make gfortran autoconf automake libtool

ARG FC=gfortran
ARG F77=gfortran
ARG CC=gcc
ARG CXX=g++
ARG FFFLAGS=-ffixed-line-length-none

WORKDIR /sigproc
COPY . /sigproc

RUN ls -l 
RUN ./bootstrap

RUN  ./configure --prefix=/usr

RUN make -j 4

RUN make install

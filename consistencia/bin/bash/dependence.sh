#!/bin/bash
# Programas necesarios
apt-get update
# Compilacion etc
apt-get install build-essential
apt-get install linux-headers-`uname -r`
# R
apt-get install r-base
#seq-gen
apt-get install seq-gen
# readseq
apt-get install readseq
## Por favor descargue y compile en paralelo Mr bayes desde:
## http://mrbayes.sourceforge.net/index.php
## phyml

apt-get update
apt-get install build-essential
apt-get install linux-headers-`uname -r`
apt-get install mpich2
apt-get install git
apt-get install libtool
git clone https://github.com/stephaneguindon/phyml.git
cd phyml
./autogen.sh
./configure --enable-mpi
make
make install
cd ..
rm -rf phyml

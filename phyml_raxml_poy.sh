#!/bin/bash
## Script to compile and install RaxML, POY and PhyML
## Only distributions based on Debian
## Please execute this script with sudo

## PhyML compiled in parallel
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

## RaxML compiled in parallel
git clone https://github.com/stamatak/standard-RAxML.git
cd standard-RAxML
make -f Makefile.MPI.gcc
rm *.o
mv raxmlHPC-MPI /usr/bin/
cd ..
rm -rf standard-RAxML

## Poy compiled in parallel
wget http://www.amnh.org/content/download/67796/1174582/version/3/file/poy_5.1.1-src.tar.gz
sudo apt-get install libz-dev ocaml ocaml-native-compilers camlp4-extra opam camlp4-extra ncurses-base libncurses5
tar -xzvf poy_5.1.1-src.tar.gz
rm poy_5.1.1-src.tar.gz
cd poy_5.1.1/src
./configure --enable-interface=flat --enable-mpi CC=mpicc --enable-long-sequences=Enable --enable-likelihood=Enable
make
make install

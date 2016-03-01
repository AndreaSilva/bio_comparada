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

#!/bin/bash
## creación de directorios de datos necesarios para correr los archivos
cd ../..
mkdir data
cd data
mkdir raw processed
mkdir raw/farris/ raw/felsenstein/ raw/lb/ raw/sb/
mkdir raw/farris/fasta raw/felsenstein/fasta raw/lb/fasta raw/sb/fasta
mkdir raw/farris/bayes_input raw/felsenstein/bayes_input raw/lb/bayes_input raw/sb/bayes_input
mkdir processed/farris/ processed/felsenstein/ processed/lb/ processed/sb/
mkdir processed/farris/bayes_output processed/felsenstein/bayes_output processed/lb/bayes_output processed/sb/bayes_output

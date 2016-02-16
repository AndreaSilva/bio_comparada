#!/bin/bash
## automatización de la creacion de datos a partir de arboles
raiz='/home/eee/MEGAsync/bio_comparada/consistencia/'
Rscript $raiz'bin/R/gentree.R'
cd $raiz'data/raw/felsenstein'
size=(100 1000 10000)
replicas=$(seq 25)
for i in ${size[*]};
do
  for replica in $replicas;
  do
    seq-gen -mGTR -l$i -or felsenstein.tree > 'salida'$i'_'$replica'.phy'
  done
done

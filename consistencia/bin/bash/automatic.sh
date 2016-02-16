#!/bin/bash
## automatización de la creacion de datos a partir de arboles
raiz='/home/eee/MEGAsync/bio_comparada/consistencia/'
Rscript $raiz'bin/R/gentree.R'
cd $raiz'data/raw/felsenstein'
## Modifique por las longitudes de caracteres a analizar
size=(100 1000 10000)
## Modifique por el numero de replicas en la simulacion de caracteres
replicas=$(seq 25)
## Felsenstein
for i in ${size[*]};
do
  for replica in $replicas;
  do
    seq-gen -mGTR -l$i -or felsenstein.tree > 'dna'$i'_'$replica'.phy'
  done
done
# LB
cd $raiz'data/raw/lb'
for i in ${size[*]};
do
  for replica in $replicas;
  do
    seq-gen -mGTR -l$i -or lb.tree > 'dna'$i'_'$replica'.phy'
  done
done
#SB
cd $raiz'data/raw/sb'
for i in ${size[*]};
do
  for replica in $replicas;
  do
    seq-gen -mGTR -l$i -or sb.tree > 'dna'$i'_'$replica'.phy'
  done
done

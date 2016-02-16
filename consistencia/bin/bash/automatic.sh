#!/bin/bash
## automatización de la creacion de datos a partir de arboles
raiz='/home/eee/MEGAsync/bio_comparada/consistencia/'
Rscript $raiz'bin/R/gentree.R'
## Modifique por las longitudes de caracteres a analizar
size=(100 1000 10000)
## Modifique por el numero de replicas en la simulacion de caracteres
replicas=$(seq 25)
## Cargando directorios
directorio=($raiz'data/raw/felsenstein' $raiz'data/raw/lb' $raiz'data/raw/sb')
## Creando datos
for dic in ${directorio[*]};
do
  cd $dic
  for i in ${size[*]};
  do
    for replica in $replicas;
    do
      seq-gen -mGTR -l$i -or tree.tree > 'dna'$i'_'$replica'.phy'
    done
  done

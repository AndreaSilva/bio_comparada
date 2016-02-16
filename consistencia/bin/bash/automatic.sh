#!/bin/bash
## automatización de la creacion de datos a partir de arboles
raiz='/home/eee/MEGAsync/bio_comparada/consistencia/'
Rscript $raiz'bin/R/gentree.R'
## Modifique por las longitudes de caracteres a analizar
size=(100 1000 10000)
## Modifique por el numero de replicas en la simulacion de caracteres
replicas=$(seq 25)
## Modifique el modelo a utilizar
model='GTR'
## Cargando directorios
directorio=($raiz'data/raw/felsenstein' $raiz'data/raw/lb' $raiz'data/raw/sb' $raiz'data/raw/farris')
## Creando datos
for dic in ${directorio[*]};
do
  echo $dic
  cd $dic
  for i in ${size[*]};
  do
    for replica in $replicas;
    do
      seq-gen -m$model -l$i -or tree.tree > 'dna'$i'_'$replica'.phy'
    done
  done
done

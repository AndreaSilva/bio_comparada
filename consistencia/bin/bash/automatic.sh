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
directorio_raw=($raiz'data/raw/felsenstein/' $raiz'data/raw/lb/' $raiz'data/raw/sb/' $raiz'data/raw/farris/')
## Creando datos y convirtiendo a fasta
for dic in ${directorio_raw[*]};
do
  cd $dic
  for i in ${size[*]};
  do
    for replica in $replicas;
    do
      seq-gen -m$model -l$i tree.tree > 'dna'$i'_'$replica'.phy'
      readseq -V -all -f='fasta' -o='fasta/dna'$i'_'$replica'.fas' 'dna'$i'_'$replica'.phy'
      muscle -in 'fasta/dna'$i'_'$replica'.fas'  -out 'aln/dna'$i'_'$replica'.aln'
    done
  done
done

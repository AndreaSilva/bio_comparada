#!/bin/bash
## automatización de la creacion de datos a partir de arboles
cd ../..
raiz=$( pwd )
echo 'Su directorio raiz es:' $raiz
Rscript $raiz'/bin/R/gentree.R'
## Modifique por las longitudes de caracteres a analizar
size=(100 1000 10000)
## Modifique por el numero de replicas en la simulacion de caracteres
replicas=$(seq 25)
## Modifique el modelo a utilizar
model='GTR'
## Semilla para la generación de secuencias
semilla=(-2341135504871372963 289475982475892345 2345234523452452345 -34634563546487958)
echo $semilla[0]
## Cargando directorios
directorio=('farris/' 'felsenstein/' 'lb/' 'sb/')
## Creando datos y convirtiendo a fasta
#: '
for dic in ${directorio[*]}
do
  cd $raiz'/data/raw/'$dic
  if [ $raiz'/data/raw/'$dic == $raiz'/data/raw/felsenstein/' ]
  then
    for i in ${size[*]}
    do
      for replica in $replicas
      do
        seq-gen -z$((${semilla[0]}+$i+$replica)) -m$model -l$i tree.tree > 'dna'$i'_'$replica'.phy'
        readseq -V -all -f='fasta' -o='fasta/dna'$i'_'$replica'.fas' 'dna'$i'_'$replica'.phy'
        readseq -V -all -f='NEXUS' -o='bayes_input/dna'$i'_'$replica'.nex' 'dna'$i'_'$replica'.phy'
        cat 'bayes_input/dna'$i'_'$replica'.nex' $raiz'/bin/bash/bayes.nex' >> 'bayes_input/dna'$i'_'$replica'.nex'
      done
    done
  elif [ $raiz'/data/raw/'$dic == $raiz'/data/raw/lb/' ]
  then
    for i in ${size[*]}
    do
      for replica in $replicas
      do
        seq-gen -z$((${semilla[1]}+$i+$replica)) -m$model -l$i tree.tree > 'dna'$i'_'$replica'.phy'
        readseq -V -all -f='fasta' -o='fasta/dna'$i'_'$replica'.fas' 'dna'$i'_'$replica'.phy'
        readseq -V -all -f='NEXUS' -o='bayes_input/dna'$i'_'$replica'.nex' 'dna'$i'_'$replica'.phy'
        cat 'bayes_input/dna'$i'_'$replica'.nex' $raiz'/bin/bash/bayes.nex' >> 'bayes_input/dna'$i'_'$replica'.nex'
      done
    done
  elif [ $raiz'/data/raw/'$dic == $raiz'/data/raw/sb/' ]
  then
    for i in ${size[*]}
    do
      for replica in $replicas
      do
        seq-gen -z$((${semilla[2]}+$i+$replica)) -m$model -l$i tree.tree > 'dna'$i'_'$replica'.phy'
        readseq -V -all -f='fasta' -o='fasta/dna'$i'_'$replica'.fas' 'dna'$i'_'$replica'.phy'
        readseq -V -all -f='NEXUS' -o='bayes_input/dna'$i'_'$replica'.nex' 'dna'$i'_'$replica'.phy'
        cat 'bayes_input/dna'$i'_'$replica'.nex' $raiz'/bin/bash/bayes.nex' >> 'bayes_input/dna'$i'_'$replica'.nex'
      done
    done
  elif [ $raiz'/data/raw/'$dic == $raiz'/data/raw/farris/' ]
  then
    for i in ${size[*]}
    do
      for replica in $replicas
      do
        seq-gen -z$((${semilla[3]}+$i+$replica)) -m$model -l$i tree.tree > 'dna'$i'_'$replica'.phy'
        readseq -V -all -f='fasta' -o='fasta/dna'$i'_'$replica'.fas' 'dna'$i'_'$replica'.phy'
        readseq -V -all -f='NEXUS' -o='bayes_input/dna'$i'_'$replica'.nex' 'dna'$i'_'$replica'.phy'
        cat -u 'bayes_input/dna'$i'_'$replica'.nex' $raiz'/bin/bash/bayes.nex' >>'bayes_input/dna'$i'_'$replica'.nex'
      done
    done
  fi
done

#'
: '
## Mr Bayes corrida
for dic in ${directorio[*]};
do
  cd $raiz'/data/raw/'$dic'bayes_input'
  #rm .nex.*
  for dato in $( ls )
  do
    mpirun -np '4' mb $dato
    mv *.nex.* $raiz'/data/processed/'$dic'bayes_output'

  done
done
'

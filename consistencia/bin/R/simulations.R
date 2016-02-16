## Simulations for tree with felsenstein zone
setwd('~/MEGAsync/bio_comparada/consistencia/')
source('functions.R')

library(ape)
library(phyclust)
library(phytools)
## Generando un arbol
gen.felsen.tree()

## Cargando arbol
arbol <- readChar(con = "felsenstein.tree", nchars =100)

## Generando secuencias

salida <- seqgen(opts = "-mGTR -l200 -q -or", newick.tree = arbol, temp.file = "salida.phy")
salida <- read.phylip("salida.phy")


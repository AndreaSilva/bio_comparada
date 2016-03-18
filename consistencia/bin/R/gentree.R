# Created by: Daniel Pabón
# email: dpabon@openmailbox.org

# Cambie la dirección de raiz, al directorio que contiene la carpeta "bio_comparada"
# No escriba el ultimo slash /
raiz <- "~"

source(paste(raiz,'/bio_comparada/consistencia/bin/R/functions.R',sep = ""))
# felsenstein tree
gen.felsen.tree(file = paste(raiz,"/bio_comparada/consistencia/data/raw/felsenstein/tree.tree", sep = ""))
#lb
setwd(paste(raiz,'/bio_comparada/consistencia/data/raw/lb/', sep = ""))
p <- 0.8
q <- 0.8
cat("((t1:",p,",t2:",q,"):",q,",t3:",p,",t4:",q,");", sep = "", file ="tree.tree")
#sb
setwd(paste(raiz,'/bio_comparada/consistencia/data/raw/sb/', sep = ""))
p <- 0.2
q <- 0.2
cat("((t1:",p,",t2:",q,"):",q,",t3:",p,",t4:",q,");", sep = "", file ="tree.tree")
# farris
gen.farris.tree(file = paste(raiz,"/bio_comparada/consistencia/data/raw/farris/tree.tree", sep = ""))

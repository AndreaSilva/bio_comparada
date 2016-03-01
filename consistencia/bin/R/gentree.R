setwd("~/bio_comparada/consistencia/bin/R/")
source('functions.R')
# felsenstein tree
setwd('~/bio_comparada/consistencia/data/raw/felsenstein/')
gen.felsen.tree(file = "tree.tree")
#lb
setwd('~/bio_comparada/consistencia/data/raw/lb/')
p <- 0.8
q <- 0.8
cat("((t1:",p,",t2:",q,"):",q,",t3:",p,",t4:",q,");", sep = "", file ="tree.tree")
#sb
setwd('~/bio_comparada/consistencia/data/raw/sb/')
p <- 0.2
q <- 0.2
cat("((t1:",p,",t2:",q,"):",q,",t3:",p,",t4:",q,");", sep = "", file ="tree.tree")
# farris
setwd('~/bio_comparada/consistencia/data/raw/farris/')
gen.farris.tree(file = "tree.tree")

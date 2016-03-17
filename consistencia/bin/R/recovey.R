## Metricas de comparación
library(phangorn)
library(ape)

directorios <- c("farris/", "felsenstein/", "lb/", "sb/")
subdirectorios <- c("bayes_output", "phyml_output")
ruta <- "~/MEGAsync/bio_comparada/consistencia/data/processed/"
ruta2<- "~/MEGAsync/bio_comparada/consistencia/data/raw/"

## Bayes
nombres <- c("dna100_", "dna1000_", "dna10000_")
replicas <- 1:25
recuperacion <- data.frame()
recuperacion
for(d in directorios){
  arbol_ini <- read.tree(paste(ruta2, d, "tree.tree", sep = ""))
  #plot.phylo(arbol_ini, type = "unrooted", use.edge.length = T)
  #edgelabels(arbol_ini$edge.length)
  for( n in nombres){
    for(r in replicas){
      arbol_comp <- read.nexus(paste(ruta, d, subdirectorios[1], "/", n, r, ".nex.con.tre", sep = ""))
      #plot.phylo(arbol_comp, type = "unrooted")
      salida <- treedist(arbol_ini, arbol_comp)
      recuperacion[paste(d, n, r, sep = ""),"symmetric.difference"]<-salida[1]
      recuperacion[paste(d, n, r, sep = ""),"branch.score.difference"]<-salida[2]
      recuperacion[paste(d, n, r, sep = ""),"path.difference"]<-salida[3]
      recuperacion[paste(d, n, r, sep = ""),"weighted.path.difference"]<-salida[4]
      
    }
  }
} 
recuperacion[,"seq_long"]<- rep(rep(c(100, 1000, 10000), each=25), times=4) 
write.csv(recuperacion,file = "~/MEGAsync/bio_comparada/consistencia/data/processed/bayes_recuperation.csv")

## ML

nombres <- c("dna100_", "dna1000_", "dna10000_")
replicas <- 1:25
recuperacion <- data.frame()
recuperacion
for(d in directorios){
  arbol_ini <- read.tree(paste(ruta2, d, "tree.tree", sep = ""))
  #plot.phylo(arbol_ini, type = "unrooted", use.edge.length = T)
  #edgelabels(arbol_ini$edge.length)
  for( n in nombres){
    for(r in replicas){
      arbol_comp <- read.tree(paste(ruta, d, subdirectorios[2], "/", n, r, ".phy_phyml_tree", sep = ""))
      #plot.phylo(arbol_comp, type = "unrooted")
      salida <- treedist(arbol_ini, arbol_comp)
      recuperacion[paste(d, n, r, sep = ""),"symmetric.difference"]<-salida[1]
      recuperacion[paste(d, n, r, sep = ""),"branch.score.difference"]<-salida[2]
      recuperacion[paste(d, n, r, sep = ""),"path.difference"]<-salida[3]
      recuperacion[paste(d, n, r, sep = ""),"weighted.path.difference"]<-salida[4]
      
    }
  }
} 
recuperacion[,"seq_long"]<- rep(rep(c(100, 1000, 10000), each=25), times=4) 
View(recuperacion)
write.csv(recuperacion,file = "~/MEGAsync/bio_comparada/consistencia/data/processed/ml_recuperation.csv")

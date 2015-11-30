#Opciones de R
options( prompt = "prt> ")
# Directorio de trabajo
setwd('~/Documentos/semana5-comparada2015/')
datos <- read.csv("GenomeSize.csv")
tail(datos)

View(datos)

lista = list()

mini <-function(x){
  agrup <- unique(x$Suborder)
  for( i in 1:length(agrup)){
    lista[[i]] <- subset.data.frame(datos, datos$Suborder==agrup[i])
  }
  return(lista)
}

salida <- mini(datos)
salida2 <- list()
for( i in 1:length(salida)){
  salida2[[i]]<- na.omit(salida[[i]])
}

entrada <-colnames(salida2[[1]]) 
for( i in entrada){
}


is.integer(salida2[[1]]$HeadLength) 
is.character(salida2[[1]]$Family)
is.integer(salida2[[1]]$TotalLength[2])
salida2[[1]]$Suborder
typeof(salida2[[1]]$GenomeN)
is.numeric(salida2[[1]]$TotalLength[2])
salida2[[1]]$TotalLength[2]
class(salida[[1]]$Suborder) ## Numerico o factor
check.options()
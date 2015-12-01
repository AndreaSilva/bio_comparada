#Opciones de R
options( prompt = "prt> ")
# Directorio de trabajo
setwd('~/MEGAsync/bio_comparada/bio_comparada/')
datos <- read.csv("GenomeSize.csv")
tail(datos)

View(datos)

lista = list()

## Función para separar los datos discriminando por Suborden e indexandolos en una lista
separate <-function(x){
  agrup <- unique(x$Suborder)
  for( i in 1:length(agrup)){
    lista[[i]] <- subset.data.frame(datos, datos$Suborder==agrup[i])
  }
  return(lista)
}

salida <- separate(datos)
str(salida)
salida2 <- list()
## Remocion de NAs
for( i in 1:length(salida)){
  salida2[[i]]<- na.omit(salida[[i]])
}
salida2
## Definición de clases
entrada <-colnames(salida2[[1]]) 
entrada
for(y in 1:length(salida2)){
  for( i in 1:length(entrada)){
    print(class(salida2[[y]][1,i]))
    #if(salida2[[y]]$i =="TRUE"){
      #print("todo bien")
    #}
  }
}

class(salida[[1]][5,1])
salida[[1]][5,1]

if(class(salida[[1]]$Suborder) != "factor" & class(salida[[1]]$Family)  == "factor"){
  print("todo bien")
}else{
  print("Todo mal")
}

if(class(salida[[1]]$Suborder) == "factor"){
  print("todo bien")
} ## Numerico o factor
check.options()
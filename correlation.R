## Funciones de utilidad, Media, Desviación estandar, varianza 
#media
media <- function(x){
  media = (sum(x)/length(x))
  return(media)
}
# Desviacion estandar
des_est <- function(x){
  sal <- numeric()
  for(i in 1:length(x)){
    sal[i] = (x[i]-((sum(x)/length(x))))^2
  }
  des_est = sqrt(sum(sal)/(length(x)-1))
  return(des_est)
}
# Varianza
varia <- function(x){
  sal <- numeric()
  for(i in 1:length(x)){
    sal[i] = (x[i]-((sum(x)/length(x))))^2
  }
  varia = (sum(sal)/(length(x)-1))
  return(varia)
}

# Directorio de trabajo
setwd('~/MEGAsync/bio_comparada/bio_comparada/')
## TODO EN TERMINO DE DATOS
datos <- read.csv("GenomeSize.csv")

## Función para separar los datos discriminando por Suborden e indexandolos en una lista
separate <-function(x){
  lista = list()
  agrup <- unique(x$Suborder)
  for( i in 1:length(agrup)){
    lista[[i]] <- subset.data.frame(datos, datos$Suborder==agrup[i])
  }
  return(lista)
}
datos = separate(datos)

## Remocion de NAs
for( i in 1:length(datos)){
  datos[[i]]<- na.omit(datos[[i]])
}
summary(datos[[1]])


## Conviriento enteros a categorias
for(y in 1:length(datos)){
  for( i in 1:length(colnames(datos[[y]]))){
    if(class(datos[[y]][,i]) == "integer"){
      datos[[y]][,i] = as.factor(datos[[y]][,i])
    }
  }
}

################################################
for(y in 1:length(salida2)){
  for( i in 1:length(entrada)){
    if(class(salida2[[y]][,i]) == class(salida2[[y]][1,i+1])){
      print("son iguales")
    }else{
      print("son diferentes")
    }
  }
}
class(salida2[[y]][,i]) == "factor" & class(salida2[[y]][,i+1:length(entrada)])

inherits()
class(salida2[[1]][,16])
is.integer(salida2[[1]][,15])

for(y in 1:length(salida2)){
  for( i in 1:length(entrada)){
    print(class(salida2[[y]][1,i]))
    #if(salida2[[y]]$i =="TRUE"){
      #print("todo bien")
    #}
  }
}

class(salida[[1]][5,1])
class(salida[[1]][,2])
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
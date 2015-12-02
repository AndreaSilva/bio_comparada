# Created by: Daniel Pabón
# email: daniel.epm12@gmail.com

#<one line to give the program's name and a brief idea of what it does.>
#    Copyright (C) 2015  Daniel Pabón

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

##########################################
#  Definición de  funciones de utilidad  #
##########################################
#Media
# Sumatoria de los datos de la variable dividido por la longitud de la variable
media <- function(x){
  if (class(x) == "numeric"){
    media = (sum(x) / length(x))
    return(media)
  }else{
    print("x is not numeric class")
  }
}
# Desviacion estandar
# 
des_est <- function(x){
  if (class(x) == "numeric"){
    sal = numeric()
    for(i in 1:length(x)){
      sal[i] = (x[i] - ((sum(x) / length(x))))^2
    }
    des_est = sqrt(sum(sal) / (length(x)-1))
    return(des_est)
  }else{
    print("x is not numeric class")
  }
}

# Varianza
varia <- function(x){
  if (is.numeric(x) == TRUE){
    sal <- numeric()
    for(i in 1:length(x)){
      sal[i] = (x[i] - ((sum(x) / length(x))))^2
    }
    varia = (sum(sal) / (length(x)-1))
    return(varia)
  }else{
    print ("x is not numeric class")
  }
}

# Covarianza
cova <- function(x, y){
  if(class(y) == "data.frame"){
    vec = data.frame()
    for(i in 1:length(x)){
      for(c in 1:length(y)){
        vec[i,c] = ((x[i] - (sum(x)/length(x)))) * ((y[i,c] - (sum(y[ ,c]) / length(y[ ,c]))))
        cova = sum(vec) / (length(x)-1)
        }
    }
  }else{
    vec = numeric()
    for(i in 1:length(x)){
      vec[i] = ((x[i] - (sum(x)/length(x)))) * ((y[i] - (sum(y) / length(y))))
    }
    cova = sum(vec) / (length(x)-1)
    return(cova)
  }
   
}

cov(datos[[1]][ ,4], datos[[1]][ ,7:9])
cova(datos[[1]][ ,4], datos[[1]][ ,7:9])
class(datos[[1]][ ,7:9])
length(datos[[1]][ ,7:9])
# Directorio de trabajo
setwd('~/MEGAsync/bio_comparada/bio_comparada/')

## TODO EN TERMINO DE DATOS
datos <- read.csv("GenomeSize.csv")

## Función para separar los datos discriminando por Suborden e indexarlos en una lista
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
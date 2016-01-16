# Created by: Daniel Pabón
# email: daniel.epm12@gmail.com

#             COrRE2016
# This program read a csv file that have n variables and begging with varibles: 
#Suborder, Family and Specie. Agroup the data using 'suborder' and make a pearson correlation betwen the other variables.
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

#######################################################################
# Este archivo fue creado con el fin de organizar todas las funciones #
# de forma independiente al codigo del programa.                      #
#######################################################################

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

# covarianza
cova <- function(x, y){
  if((class(x) == "numeric" & class(y) == "data.frame")){
    vec = data.frame()
    for(i in 1:length(y)){
      for(c in 1:length(x)){
        vec[c,i] = ((x[c] - (sum(x)/length(x)))) * ((y[c,i] - (sum(y[ ,i]) / length(y[ ,i]))))
      }
    }
    cova = numeric()
    for(i in 1:length(vec)){
      cova[i] = (sum(vec[ ,i]) / (length(vec[ ,i])-1))
    }
    names(cova) = colnames(y)
    return(cova) 
  }else if((class(x) == "data.frame" & class(y) == "numeric")){
    vec = data.frame()
    for(i in 1:length(x)){
      for(c in 1:length(y)){
        vec[c,i] = ((y[c] - (sum(y)/length(y)))) * ((x[c,i] - (sum(x[ ,i]) / length(x[ ,i]))))
      }
    }
    cova = numeric()
    for(i in 1:length(vec)){
      cova[i] = (sum(vec[ ,i]) / (length(vec[ ,i])-1))
    }
    names(cova) = colnames(x)
    return(cova)
  }else if ((class(x) == "numeric" & class(y) == "numeric")){
    vec = numeric()
    for(i in 1:length(x)){
      vec[i] = ((x[i] - (sum(x)/length(x)))) * ((y[i] - (sum(y) / length(y))))
    }
    cova = sum(vec) / (length(x)-1)
    return(cova)
  }
}


## Función para separar los datos discriminando por Suborden e indexarlos en una lista
separate <-function(x){
  lista = list()
  agrup <- levels(x$Suborder)
  for( i in 1:length(agrup)){
    lista[[i]] <- subset.data.frame(datos, datos$Suborder==agrup[i])
  }
  return(lista)
}

## Función para convertir variables con numeros enteros ha variables categoricas

convertFactor <- function(x){
  for(u in 1:length(x)){
    for(i in 1:length(colnames(x[[u]]))){
      if (class(x[[u]][ ,i]) == "integer"){
        x[[u]][ ,i] =as.factor(datos[[u]][ ,i])
      }
    }
  }
  return(x)
}

## La función 'discri' discriminar si las variables son categoricas, numericas y aplica la correlación de pearson a las variables. El codigo puede verse en el archivo functions.
discri <- function(x){
  if (class(x) == "list"){
    for(d in 1:length(x)){
      for(c in 1:(length(colnames(x[[d]])))-1){
        for(c2 in (c+1):length(colnames(x[[d]]))){
          if(class(x[[d]][ ,c]) == "numeric" & class(x[[d]][ ,c2]) == "numeric"){
            ## Correlación de pearson
            nombres <- colnames(x[[d]])
            cat(as.character(x[[d]][1,2]), nombres[c], nombres[c2], (cova(x[[d]][ ,c], x[[d]][ ,c2])/(des_est(x[[d]][ ,c]) * des_est(x[[d]][ ,c2]))), "\n", sep = c(" , ", " , ", " , ", "")) 
          }
        }
      }
    }
  }else{
    print("x is not list")
  }
}

## La función exit crea la salida, o impresion de los datos, si print = TRUE, la salida es impresa en pantalla, si print = FALSE los datos son guardados en un archivo formato csv. Por defecto el nombre del archivo es exit.csv, pero puede ser modificado utilizando el argumento 'file'

exit <- function(x, print=TRUE, file="exit.csv"){
  if(print){
    discri(x)
  }else{
    capture.output(discri(x), file = file)
  }
}

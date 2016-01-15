# Created by: Daniel Pabón
# email: daniel.epm12@gmail.com

#             COrRE2016
# This program read a csv file that have n variables and begging with varibles: Suborder, Family and Specie. Agroup the data using 'suborder' and make a pearson correlation betwen the other variables.
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


###############################################
# Llamando las funciones necesarias           #
###############################################
source('functions.R')

###############################################
# Preparación de los datos para procesamiento #
###############################################

# Directorio de trabajo
setwd('~/MEGAsync/bio_comparada/')

## Entrada
datos <- read.csv("GenomeSize.csv")

## Función para separar los datos discriminando por Suborden e indexarlos en una lista
datos <- separate(datos)


## Remocion de NAs, no se puede calcular correlación con data frames que presenten NAs por lo cual
## lo mas conveniente es remover las observaciones que presenten los mismos.
for( i in 1:length(datos)){
  datos[[i]]<- na.omit(datos[[i]])
}
summary(datos[[1]])


## Convirtiento enteros a categorias
datos <- convertFactor(datos)

length(colnames(datos[[1]]))

## Discriminar si las variables son categoricas, numericas y test a utilizar
totalfunc <- function(x){
  salida1 = list()
  if (class(x) == "list"){
    for(d in 1:length(x)){
      for(c in 1:(length(colnames(x[[d]])))-1){
        for(c2 in (c+1):length(colnames(x[[d]]))){
          if(class(x[[d]][ ,c]) == "numeric" & class(x[[d]][ ,c2]) == "numeric"){
            ## Correlación de pearson
            
            print( cova(x[[d]][ ,c], x[[d]][ ,c2])/(des_est(x[[d]][ ,c]) * des_est(x[[d]][ ,c2])) )
          }else{
            print ("No son numericos")
          }
        }
      }
    }
  }else{
    print("x is not list")
  }
  return(salida1)
}

totalfunc(datos)

totalfunc
################################################
conting <- data.frame()
for(i in levels(datos[[1]][,3])){
  datos[[1]][,3] == i
}

datos[[1]]
class(datos[[1]][,4])
which(datos[[1]][]=="factor")
vector <- numeric()
for(i in 1:length(colnames(datos[[1]]))){
  if(class(datos[[1]][,i])=="factor"){
    vector[i] <- colnames(datos[[1]])[i]
    vector <- na.exclude(vector)
  }
}
class(vector)
with(datos[[1]], table(cut(vector)))

## Test variables categoricas
chisq.test(datos[[1]][,2], datos[[1]][,3])
fisher.test(datos[[1]][,2], datos[[1]][,6])


with(airquality, table(cut(Temp, quantile(Temp)), Month))
airquality
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

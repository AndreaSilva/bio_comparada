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



###############################################
# Preparación de los datos para procesamiento #
###############################################

# Directorio de trabajo
setwd('~/MEGAsync/bio_comparada/COrRE2016/')

###############################################
# Llamando las funciones necesarias           #
###############################################
source('functions.R')


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

## Discriminar si las variables son categoricas, numericas y test a utilizar

#Ver archivo functions

## Creando la salida, o impresion de los datos, si print = TRUE, la salida es impresa en pantalla, si print = FALSE los datos son guardados en un archivo formato csv. Por defecto el nombre del archivo es exit.csv, pero puede ser modificado utilizando el argumento 'file'

exit <- function(x, print=TRUE, file="exit.csv"){
  if(print){
    discri(x)
  }else{
    capture.output(discri(x), file = file)
  }
}

exit(datos)

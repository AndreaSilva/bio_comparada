# Created by: Daniel Pabón
# email: dpabon@openmailbox.org

# Cambie la dirección de raiz, al directorio que contiene la carpeta "bio_comparada"
# No escriba el ultimo slash /

raiz <- "~"

## Analisis
## Farris Bayes vs ML

datos <- read.csv(paste(raiz,"/bio_comparada/consistencia/data/processed/bayes_recuperation.csv", sep = ""), header = T, sep = ",")
datos_m <- read.csv(paste(raiz,"/bio_comparada/consistencia/data/processed/ml_recuperation.csv", sep = ""), header = T, sep = ",")

# grafico base
plot(datos$seq_long,datos$symmetric.difference, type = "n", ylim =c(40,100), xlim = c(10,10000), xlab = "Pares de Bases", ylab = "% de arboles recuperados", main = "Analisis de consistencia estadistica
     Zona de Farris")

#lineas ML
segments(100,sum(datos_m[1:25,2]==0)/25*100,1000, sum(datos_m[26:50,2]==0)/25*100)
segments(1000,sum(datos_m[26:50,2]==0)/25*100, 10000, sum(datos_m[51:75,2]==0)/25*100)

#puntos ML
points(100,sum(datos_m[1:25,2]==0)/25*100, pch=19, col="red")
points(1000, sum(datos_m[26:50,2]==0)/25*100, pch=19, col="red")
points(10000, sum(datos_m[51:75,2]==0)/25*100, pch=19, col="red")

#lineas IB
segments(100,sum(datos[1:25,2]==0)/25*100,1000, sum(datos[26:50,2]==0)/25*100)
segments(1000,sum(datos[26:50,2]==0)/25*100, 10000, sum(datos[51:75,2]==0)/25*100)

#puntos IB
points(100,sum(datos[1:25,2]==0)/25*100, pch=15)
points(1000, sum(datos[26:50,2]==0)/25*100, pch=15)
points(10000, sum(datos[51:75,2]==0)/25*100, pch=15)
par("usr")
legend(x=9000, y=96, legend = c("ML","IB"), bty = "n", fill = c("red", "black"))


## Analisis Felsenstein Bayes vs ML

#grafica
plot(datos$seq_long,datos$symmetric.difference, type = "n", ylim =c(60,100), xlim = c(10,10000), xlab = "Pares de Bases", ylab = "% de arboles recuperados", main = "Analisis de consistencia estadistica
     Zona de Felsenstein")

#lineas IB
segments(100, sum(datos[76:100,2]==0)/25*100, 1000, sum(datos[101:125,2]==0)/25*100)
segments(1000, sum(datos[101:125,2]==0)/25*100, 10000, sum(datos[126:150,2]==0)/25*100)
#puntos IB
points(100, sum(datos[76:100,2]==0)/25*100, pch=15)
points(1000, sum(datos[101:125,2]==0)/25*100, pch=15)
points(10000, sum(datos[126:150,2]==0)/25*100, pch=15)

#lineas ML
segments(100, sum(datos_m[76:100,2]==0)/25*100, 1000, sum(datos_m[101:125,2]==0)/25*100)
segments(1000, sum(datos_m[101:125,2]==0)/25*100, 10000, sum(datos_m[126:150,2]==0)/25*100)
#puntos ML
points(100, sum(datos_m[76:100,2]==0)/25*100, pch=19, col="red")
points(1000, sum(datos_m[101:125,2]==0)/25*100, pch=19, col="red")
points(10000, sum(datos_m[126:150,2]==0)/25*100, pch=19, col="red")

legend(x=9000, y=96, legend = c("ML","IB"), bty = "n", fill = c("red", "black"))

# Analisis LB

#grafica
plot(datos$seq_long,datos$symmetric.difference, type = "n", ylim =c(50,100), xlim = c(10,10000), xlab = "Pares de Bases", ylab = "% de arboles recuperados", main = "Analisis de consistencia estadistica
     \"Ramas largas\"")

#lineas IB
segments(100, sum(datos[151:175,2]==0)/25*100, 1000, sum(datos[176:200,2]==0)/25*100)
segments(1000, sum(datos[176:200,2]==0)/25*100, 10000, sum(datos[201:225,2]==0)/25*100)

#puntos IB
points(100, sum(datos[151:175,2]==0)/25*100, pch=15)
points(1000, sum(datos[176:200,2]==0)/25*100, pch=15)
points(10000, sum(datos[201:225,2]==0)/25*100, pch=15)

#lineas ML
segments(100, sum(datos_m[151:175,2]==0)/25*100, 1000, sum(datos_m[176:200,2]==0)/25*100)
segments(1000, sum(datos_m[176:200,2]==0)/25*100, 10000, sum(datos_m[201:225,2]==0)/25*100)

#puntos ML
points(100, sum(datos_m[151:175,2]==0)/25*100, pch=19, col="red")
points(1000, sum(datos_m[176:200,2]==0)/25*100, pch=19, col="red")
points(10000, sum(datos_m[201:225,2]==0)/25*100, pch=19, col="red")

legend(x=9000, y=76, legend = c("ML","IB"), bty = "n", fill = c("red", "black"))

# Analisis SB

#grafica
plot(datos$seq_long,datos$symmetric.difference, type = "n", ylim =c(50,100), xlim = c(10,10000), xlab = "Pares de Bases", ylab = "% de arboles recuperados", main = "Analisis de consistencia estadistica
     \"Ramas cortas\"")

#lineas IB
segments(100, sum(datos[226:250,2]==0)/25*100, 1000, sum(datos[251:275,2]==0)/25*100)
segments(1000, sum(datos[251:275,2]==0)/25*100, 10000, sum(datos[276:300,2]==0)/25*100)

#puntos IB
points(100, sum(datos[226:250,2]==0)/25*100, pch=15)
points(1000, sum(datos[251:275,2]==0)/25*100, pch=15)
points(10000, sum(datos[276:300,2]==0)/25*100, pch=15)

#lineas ML
segments(100, sum(datos_m[226:250,2]==0)/25*100, 1000, sum(datos_m[251:275,2]==0)/25*100)
segments(1000, sum(datos_m[251:275,2]==0)/25*100, 10000, sum(datos_m[276:300,2]==0)/25*100)

#puntos ML
points(100, sum(datos_m[226:250,2]==0)/25*100, pch=19, col="red")
points(1000, sum(datos_m[251:275,2]==0)/25*100, pch=19, col="red")
points(10000, sum(datos_m[276:300,2]==0)/25*100, pch=19, col="red")

legend(x=9000, y=76, legend = c("ML","IB"), bty = "n", fill = c("red", "black"))

## corroborando
plot(datos_m[226:300,"branch.score.difference"]~ datos_m[226:300,"seq_long"], type="n", xlab="Pares de bases", ylab="Branch Score Difference")
points(datos_m[226:300,"branch.score.difference"]~ datos_m[226:300,"seq_long"], col="red", pch=3)

points(datos[226:300,"branch.score.difference"]~ datos[226:300,"seq_long"], col="blue", pch=4)

legend(x=9000, y=0.5, legend = c("ML","IB"), bty = "n", fill = c("red", "blue"))
par("usr")

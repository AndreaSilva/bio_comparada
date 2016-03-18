# Created by: Daniel Pabón
# email: dpabon@openmailbox.org

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

## FUNCTIONS

## Function to calculate p value
longbranch.felse <- function(q){
  p <- (-q^2 + (q^4 +4*q*(1-q))^(1/2))/(2*(1-q))
  return(p)
}

## question p and q tree's value
question.fel <- function(p,q){
  if(p== 0 || q==0){
    print("no es posible calcular")
  }
  if( q != is.null(NA)){
    p1 <- (-q^2 + (q^4 +4*q*(1-q))^(1/2))/(2*(1-q))
    if(p >= p1){
      print("Este arbol posee una zona de felsenstein")
    }else{
      print("Este arbol no posee una zona de felsenstein")
    }
  }
}


##  t1         t3
##   \         /
##  p \       / p
##     \_ _ _/ 
##  q  /  q  \ q
##    /       \
##   t2       t4
##
## generate newick tree with the felsentein zone unrooted
gen.felsen.tree <- function(p=0.8,q=0.2, file= "felsenstein.tree"){
  if(p== 0 || q==0){
    print("no es posible realizar el arbol")
  }
  if( q != is.null(NA)){
    p1 <- (-q^2 + (q^4 +4*q*(1-q))^(1/2))/(2*(1-q))
    if(p >= p1){
      print("Este arbol posee una zona de felsenstein")
      print(cat("((t1:",p,",t2:",q,"):",q,",t3:",p,",t4:",q,")", sep = ""))
      cat("((t1:",p,",t2:",q,"):",q,",t3:",p,",t4:",q,");", sep = "", file = file)
    }else{
      print("Este arbol no posee una zona de felsenstein")
      print("Modifique los valores de p y q")
    }
  }
}


##  t1         
##   \        t3
##  p \      / 
##     \_  _/ q
##     /  q \ q
##  p /      \
##   /       t4
##  t2
## generate newick tree with the farris zone unrooted
gen.farris.tree <- function(p=0.8,q=0.2, file= "farris.tree"){
  if(p== 0 || q==0){
    print("no es posible realizar el arbol")
  }
  if( q != is.null(NA)){
    p1 <- (-q^2 + (q^4 +4*q*(1-q))^(1/2))/(2*(1-q))
    if(p >= p1){
      print("Este arbol posee una zona de farris")
      print(cat("((t1:",p,",t2:",p,"):",q,",t3:",q,",t4:",q,")", sep = ""))
      cat("((t1:",p,",t2:",p,"):",q,",t3:",q,",t4:",q,");", sep = "", file = file)
    }else{
      print("Este arbol no posee una zona de felsenstein")
      print("Modifique los valores de p y q")
    }
  }
}
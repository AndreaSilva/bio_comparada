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
gen.felsen.tree <- function(p=0.8,q=0.3, file= "felsenstein.tree"){
  if(p== 0 || q==0){
    print("no es posible realizar el arbol")
  }
  if( q != is.null(NA)){
    p1 <- (-q^2 + (q^4 +4*q*(1-q))^(1/2))/(2*(1-q))
    if(p >= p1){
      print("Este arbol posee una zona de felsenstein")
      print(cat("((t1:",p,",t2:",q,"):",q,",t3:",p,",t4:",q,")", sep = ""))
      cat("((t1:",p,",t2:",q,"):",q,",t3:",p,",t4:",q,")", sep = "", file = file)
    }else{
      print("Este arbol no posee una zona de felsenstein")
      print("Modifique los valores de p y q")
    }
  }
}
gen.felsen.tree()
gen.felsen.tree(p,q)

# Returnerar TRUE om punktens avstånd till mittpunkten är mindre än radien
# Om punkten ligger i cirkeln
distance<-function(pCoor, cCoor){
  ret=FALSE
  if(cCoor[3]>(sqrt((pCoor[1]-cCoor[1])^2+(pCoor[2]-cCoor[2])^2))){
    ret=TRUE  
  }
  ret
}
cDistance<-function(cCoor1, cCoor2){
  ret=FALSE
  if(cCoor1[3]>(sqrt((cCoor1[1]-cCoor2[1])^2+(cCoor1[2]-cCoor2[2])^2)++cCoor2[3])){
    ret=TRUE  
  }
  ret
}
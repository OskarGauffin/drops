  # Returnerar TRUE om punktens avstånd till mittpunkten är mindre än radien
  # Om punkten ligger i cirkeln allts�.
  distance<-function(pCoor, cCoor){
    ret=FALSE
    if(cCoor[3]>sqrt((pCoor[1]-cCoor[1])^2+(pCoor[2]-cCoor[2])^2)){
      ret=TRUE  
    }
    ret
  }
dropPlot<-function(numDrops=10, doPlot=TRUE){
      par(mfrow=c(1,2))
  
  dropM<-matrix(runif(3*numDrops),nrow=numDrops)
  dropM[,3]<-dropM[,3]/5
  
  # Kolla om någon av cirklarna ligger inuti någon annan
  distV<-rep(0,numDrops+1)
  for (i in 1:numDrops)
    for (j in 1:numDrops)
      if (cDistance(dropM[j,],dropM[i,])){
        distV[i+1]=-1
      }
  distV
  
  #Monte Carlo
  N=10^4
  pointM<-matrix(runif(2*N),nrow=N)
  
  pCol<-rep("black",N)
  
  for(d in 1:numDrops){
    # Kolla bara de som inte redan är grå
    logBlack<-pCol=="black"
    nBlack<-sum(logBlack)
    indV<-(1:N)[logBlack]
    
    for (p in 1:nBlack){
    
      # Om droppen ligger helt i någon annan, hoppa framåt i loopen
      if (distV[d+1]==-1){
          break
      }
      else {
        if(distance(pointM[indV[p],],dropM[d,])){
          pCol[indV[p]]="grey"
        }
      }
    }
    distV[d+1]<-sum(pCol=="grey")/N  
  }
  #Grått är inuti

  if (doPlot==TRUE){
   plot(1,1,col="white",xlim=c(0,1),ylim=c(0,1),xlab="",ylab="",main="Dropparna ritade med monte carlo")
   points(pointM[,1],pointM[,2],col=pCol,pch=20)
   #symbols(dropM[,1],dropM[,2],circles=dropM[,3])
   plot(0:(numDrops),distV,"l",ylim=c(0,1), main="Andel täckt yta", xlab="Droppe",ylab="")
  }
  distV[length(distV)]
}
#Returnerar true om punkten ligger i cirkeln
distance<-function(pCoor, cCoor){
  ret=FALSE
  if(cCoor[3]>(sqrt((pCoor[1]-cCoor[1])^2+(pCoor[2]-cCoor[2])^2))){
    ret=TRUE  
  }
  ret
}

#Returnerar true om cCoor2 ligger i cCoor1
cDistance<-function(cCoor1, cCoor2){
  ret=FALSE
  if(cCoor1[3]>(sqrt((cCoor1[1]-cCoor2[1])^2+(cCoor1[2]-cCoor2[2])^2)++cCoor2[3])){
    ret=TRUE  
  }
ret
}

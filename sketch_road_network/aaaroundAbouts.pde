void updateRoundabouts(){
  for(int i=0;i<verticalRoads-1;i++){
    for(int j=0;j<horizontalRoads-1;j++){
      float r = random(0,1);
      if(roundAbouts[i][j]!=0){

        if(r<0.25){
          /*Goes left*/
          if(leftRoads[i][j].trafficList[horizontalRoadSize-1]==0){
            leftRoads[i][j].trafficList[horizontalRoadSize-1]=1;
            roundAbouts[i][j]--;
          }
        }
        if(r>=0.25&&r<0.5){
          /*Goes Up*/
          if(upRoads[i][j].trafficList[verticalRoadSize-1]==0){
            upRoads[i][j].trafficList[verticalRoadSize-1]=1;
            roundAbouts[i][j]--;
          }

        }
        if(r>=0.5&&r<0.75){
          /*Goes Right*/
          if(rightRoads[i][j+1].trafficList[0]==0){
            rightRoads[i][j+1].trafficList[0]=1;
            roundAbouts[i][j]--;
          }

        }
        if(r>=0.75&&r<0.95){
          /*Goes Down*/
          if(downRoads[i+1][j].trafficList[0]==0){
            downRoads[i+1][j].trafficList[0]=1;
            roundAbouts[i][j]--;
          }
        }
      }
    }
  }
}

void displayRoundabouts(){
  fill(255,255,255);
  for(int i=0;i<verticalRoads;i++){
    for(int j=0;j<horizontalRoads-1;j++){
      int roundAboutCars=roundAbouts[i][j];
      for(int x=0;i<2;i++){
        for(int y=0;j<2;j++){
          if(roundAboutCars>0){
            fill(0,0,0);
            rect(((j+1)*horizontalLength)+(carSize*x),((i+1)*verticalLength)+(carSize*y),carSize,carSize);
            roundAboutCars--;
          }
          if(roundAboutCars==0){
            fill(255,255,255);
            rect(((j+1)*horizontalLength)+(carSize*x),((i+1)*verticalLength)+(carSize*y),carSize,carSize);
          }
        }
      }
    }
  }
}

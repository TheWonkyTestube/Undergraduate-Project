class rightRoad{

  int roadSize;
  int [] trafficList;
  int Yloc;
  int Xloc;
  float drawY;
  float drawX;

  rightRoad(int tempLength, int x, int y){
    roadSize=tempLength;
    trafficList = new int[roadSize];
    Yloc = y;
    Xloc = x;

    drawX=Xloc*horizontalLength;
    drawY=(Yloc+1)*verticalLength;
    }

  void display(){
    strokeWeight(strokeWidth);
    stroke(strokeColour,strokeColour,strokeColour);
    for(int i=0; i<roadSize; i++){
      float fillColour=(1-trafficList[i])*255;
      fill(fillColour,fillColour,fillColour);
      rect((i*carSize)+drawX,drawY,carSize,carSize);
    }
  }

  void update(){
    int [] current = trafficList;
    int [] newState = new int[roadSize];
    float r = random(0,1);
    for(int i=0;i<roadSize;i++){
      /*first box section*/
      if(r<carProbability){
        if(i==0 && Xloc==0){
          newState[i]=1;
        }
      }

      /*final box section*/
      if(i==roadSize-1 && Xloc==horizontalRoads-1){
        newState[i]=0;
      }
      if(i==roadSize-1 && Xloc!=horizontalRoads-1){
        newState[i]=0;
      }
      if(i==roadSize-1 && Xloc!=horizontalRoads-1 && current[i-1]==1 && roundAbouts[Yloc][Xloc]<4){
        newState[i]=0;
        roundAbouts[Yloc][Xloc]++;
      }
      if(i==roadSize-1 && Xloc!=horizontalRoads-1 && current[i-1]==1 && roundAbouts[Yloc][Xloc]==4){
        newState[i]=0;
        newState[i-1]=1;
      }



      /*middle box section*/
      if(i>0 && i<roadSize-1){
        if(current[i-1]==0 && current[i]==0 && current[i+1]==0){
          newState[i]=0;
        }
        if(current[i-1]==1 && current[i]==0 && current[i+1]==0){
          newState[i]=1;
        }
        if(current[i-1]==0 && current[i]==1 && current[i+1]==0){
          newState[i]=0;
        }
        if(current[i-1]==0 && current[i]==0 && current[i+1]==1){
          newState[i]=0;
        }
        if(current[i-1]==1 && current[i]==1 && current[i+1]==0){
          newState[i]=0;
        }
        if(current[i-1]==1 && current[i]==0 && current[i+1]==1){
          newState[i]=1;
        }
        if(current[i-1]==0 && current[i]==1 && current[i+1]==1){
          newState[i]=1;
        }
        if(current[i-1]==1 && current[i]==1 && current[i+1]==1){
          newState[i]=1;
        }
      }
    }
    trafficList=newState;
  }
}

class upRoad{

  int roadSize;
  int [] trafficList;
  int Yloc;
  int Xloc;
  float drawY;
  float drawX;

  upRoad(int tempLength, int x, int y){
    roadSize=tempLength;
    trafficList = new int[roadSize];
    Yloc = y;
    Xloc = x;

    drawX=((Xloc+1)*horizontalLength)-(carSize*2);
    drawY=(Yloc*verticalLength)+(carSize*2);
    }

  void display(){
    strokeWeight(strokeWidth);
    stroke(strokeColour,strokeColour,strokeColour);
    for(int i=0; i<roadSize; i++){
      float fillColour=(1-trafficList[i])*255;
      fill(fillColour,fillColour,fillColour);
      rect(drawX,(i*carSize)+drawY,carSize,carSize);
    }
  }

  void update(){
    int [] current = trafficList;
    int [] newState = new int[roadSize];
    float r = random(0,1);
    for(int i=roadSize-1;i>-1;i--){
      if(r<carProbability){
        /*bottom box section*/
        if(i==verticalRoadSize-1 && Yloc==verticalRoads-1){
          newState[i]=1;
        }
      }


      /*top box section*/
      if(Yloc==0){
        if(i==0){
        newState[i]=0;
        }
      }
      if(Yloc!=0){
        if(i==0 && current[i+1]!=1 && Yloc!=0){
          newState[i]=0;
        }
        if(i==0 && current[i+1]==1 && roundAbouts[Yloc][Xloc]<4&& Yloc!=0){
          newState[i]=0;
          roundAbouts[Yloc-1][Xloc]++;
        }
        if(i==0 && current[i+1]==1 && roundAbouts[Yloc-1][Xloc]>=4&& Yloc!=0){
          newState[i+1]=1;
        }
      }

      /*middle box section*/
      if(i>0 && i<roadSize-1){
        if(current[i-1]==0 && current[i]==0 && current[i+1]==0){
          newState[i]=0;
        }
        if(current[i-1]==1 && current[i]==0 && current[i+1]==0){
          newState[i]=0;
        }
        if(current[i-1]==0 && current[i]==1 && current[i+1]==0){
          newState[i]=0;
        }
        if(current[i-1]==0 && current[i]==0 && current[i+1]==1){
          newState[i]=1;
        }
        if(current[i-1]==1 && current[i]==1 && current[i+1]==0){
          newState[i]=1;
        }
        if(current[i-1]==1 && current[i]==0 && current[i+1]==1){
          newState[i]=1;
        }
        if(current[i-1]==0 && current[i]==1 && current[i+1]==1){
          newState[i]=0;
        }
        if(current[i-1]==1 && current[i]==1 && current[i+1]==1){
          newState[i]=1;
        }
      }
    }
    trafficList=newState;
  }
}

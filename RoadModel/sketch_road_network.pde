int strokeColour=0;
int strokeWidth=1;
float carSize=6;
float carProbability = 0.1;
int horizontalRoads =10;
int verticalRoads = 10;

int horizontalLength=1200/horizontalRoads;
int verticalLength=1080/verticalRoads;
int horizontalRoadSize=floor((horizontalLength-1)/carSize);
int verticalRoadSize=floor((verticalLength-1)/carSize);
float count=-150;

int [][] roundAbouts = new int[verticalRoads][horizontalRoads-1];

rightRoad right1;
leftRoad left1;
upRoad tempUp;
downRoad tempDown;


rightRoad [][] rightRoads = new rightRoad[verticalRoads][horizontalRoads];
leftRoad [][] leftRoads = new leftRoad[verticalRoads][horizontalRoads];
upRoad [][] upRoads = new upRoad[verticalRoads][horizontalRoads-1];
downRoad [][] downRoads = new downRoad[verticalRoads][horizontalRoads-1];



void setup() {
  size(1200,1200);
  frameRate(45);
  for(int t=0;t<verticalRoads;t++){
    for(int p=0;p<horizontalRoads;p++){
      right1=new rightRoad(horizontalRoadSize,p,t);
      rightRoads[t][p]=right1;
    }
  }
  for(int t=0;t<verticalRoads;t++){
    for(int p=0;p<horizontalRoads;p++){
      left1=new leftRoad(horizontalRoadSize,p,t);
      leftRoads[t][p]=left1;
    }
  }
  for(int t=0;t<verticalRoads;t++){
    for(int p=0;p<horizontalRoads-1;p++){
      tempUp=new upRoad(verticalRoadSize,p,t);
      upRoads[t][p]=tempUp;
    }
  }
  for(int t=0;t<verticalRoads;t++){
    for(int p=0;p<horizontalRoads-1;p++){
      tempDown=new downRoad(verticalRoadSize,p,t);
      downRoads[t][p]=tempDown;
    }
  }
}

void draw() {
  /*
  count= count+0.1;
  if(count==150){
    count=-150;
  }
  print("    ");
  float y=(pow(2.71828,-1*pow((count/100),2)))/4;
  carProbability=y;
  print(y);
  */
  for(int t=0;t<verticalRoads;t++){
    for(int p=0;p<horizontalRoads;p++){
      leftRoads[t][p].update();
      leftRoads[t][p].display();

    }
  }
  for(int t=0;t<verticalRoads;t++){
    for(int p=0;p<horizontalRoads;p++){
      rightRoads[t][p].update();
      rightRoads[t][p].display();

    }
  }
  for(int t=0;t<verticalRoads;t++){
    for(int p=0;p<horizontalRoads-1;p++){
      upRoads[t][p].update();
      upRoads[t][p].display();
    }
  }
  for(int t=0;t<verticalRoads;t++){
    for(int p=0;p<horizontalRoads-1;p++){
      downRoads[t][p].update();
      downRoads[t][p].display();
    }
  }
  updateRoundabouts();
  displayRoundabouts();
  saveFrame("output/traffic_####.png");
  if(frameCount>8100){
    exit();
  }
}

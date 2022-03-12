int cellNumber = 200;
int windowSize=1200;
int cellsize=floor(windowSize/cellNumber);
int daysToRecover=21;
int[][][] country = new int[cellNumber][cellNumber][2];
int day=1;
int count=1;
PFont f;
PFont g;

void setup() {
  size(980,980);
  background(0,0,0);
  frameRate(60);
  f= createFont("Arial",30,true);
  g= createFont("Arial",11,true);
  textFont(f,36);
  fill(0);
}

void draw() {
  //initialise
  int [] dayStats = new int[4];
  background(0);

  //Draw the days cases
  display(cellNumber,country);

  //write the day
  textFont(f);
  fill(255);
  text("Day: "+str(day),0,30);

  //write the stats
  dayStats = count(country);
  write(dayStats);
  if(dayStats[1]==0&&day>100){
    noLoop();
  }

  //update the country
  country=update(cellNumber, country);

  //add new cases
  float r=random(0,1);
  if(pow(r,count)<0.00000001&&day<150){
    int x=floor(random(0,cellNumber));
    int y=floor(random(0,cellNumber));
    country[x][y][0]=1;
    count=0;
  }

  //go to the next day
  day++;
  count++;
}

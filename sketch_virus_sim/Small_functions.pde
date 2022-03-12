int[] chooseFill(int value){
  int[] colourList = new int[3];
  if(value==0){
    colourList[0]=0;
    colourList[1]=0;
    colourList[2]=0;

  }else if(value==1){
    colourList[0]=230;
    colourList[1]=76;
    colourList[2]=0;

  }else if(value==9){
    colourList[0]=0;
    colourList[1]=204;
    colourList[2]=102;
  }else if(value==73){
    colourList[0]=179;
    colourList[1]=0;
    colourList[2]=179;

  }
  return colourList;
}

void display(int dim, int[][][] array) {
  for (int i=0; i<dim; i++) {
    for (int j=0; j<dim; j++) {
      int[] fillColour=chooseFill(array[i][j][0]);
      fill(fillColour[0],fillColour[1],fillColour[2]);
      stroke(fillColour[0],fillColour[1],fillColour[2]);
      rect(i*cellsize, j*cellsize, cellsize, cellsize);
    }
  }
}

void write(int[] list){
  textFont(g);
  fill(255);
  text("Uninfected: "+str(list[0]),0,40);
  text("Infected: "+str(list[1]),0,51);
  text("Recovered: "+str(list[2]),0,62);
  text("Dies: "+str(list[3]),0,73);

}

int [] countDays(float total){
  int [] tally=new int[daysToRecover];
  for(int x=1;x<daysToRecover;x++){
    for(int y=1;y<9;y++){
      float a=total%pow((pow(x,2)+x+17),y);
      if(a==0){
        tally[x]=tally[x]+1;
      }
      if(a!=0){
        //print("!!!");
        break;
      }
    }
  }
  return tally;
}

int makePrime(int n){
  int a=int(pow(n,2)+n+17);
  return a;
}

float makeNormal(float x){
  float sd=1.8;
  float m=7;
  float xMD=x-m;
  float exponent=((-1*xMD*xMD))/(2*sd*sd);
  float y=pow(2.7182818,exponent);
  return y;
}

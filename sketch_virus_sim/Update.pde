int[][][] update(int dim, int[][][] array) {

  int[][][] newArray=new int[dim][dim][2];

  for (int i=0; i<dim; i++) {
    for (int j=0; j<dim; j++) {

      //Edges//
      if (i==0||j==0||i==dim-1||j==dim-1){
        newArray[i][j][0]=0;
      }

      //Main region//
      else{

        //Uninfected//
        if(array[i][j][0]==0){
          int[] neighbourDays={makePrime(array[i-1][j-1][1]),makePrime(array[i-1][j][1]),makePrime(array[i-1][j+1][1]),makePrime(array[i][j-1][1]),makePrime(array[i][j+1][1]),makePrime(array[i+1][j-1][1]),makePrime(array[i+1][j][1]),makePrime(array[i+1][j+1][1])};
          long totalSurroundingDaysTEST=neighbourDays[0]*neighbourDays[1]*neighbourDays[2]*neighbourDays[3]*neighbourDays[4]*neighbourDays[5]*neighbourDays[6]*neighbourDays[7];
          long totalSurroundingDays=0;
          totalSurroundingDays=makePrime(array[i-1][j-1][1]);
          totalSurroundingDays=totalSurroundingDays*makePrime(array[i-1][j][1]);
          totalSurroundingDays=totalSurroundingDays*makePrime(array[i-1][j+1][1]);
          totalSurroundingDays=totalSurroundingDays*makePrime(array[i][j-1][1]);
          totalSurroundingDays=totalSurroundingDays*makePrime(array[i][j+1][1]);
          totalSurroundingDays=totalSurroundingDays*makePrime(array[i+1][j-1][1]);
          totalSurroundingDays=totalSurroundingDays*makePrime(array[i+1][j][1]);
          totalSurroundingDays=totalSurroundingDays*makePrime(array[i+1][j+1][1]);

          print(totalSurroundingDaysTEST+"="+totalSurroundingDays+"    " );
          int [] daysSurrounding=countDays(totalSurroundingDays);
          float total=0;
          for(int x=0;x<daysToRecover;x++){
            total = total+((x+1)*daysSurrounding[x]);
          }
          float averageDays=total/8;
          float normalValueOfDays=makeNormal(averageDays);
          //print(normalValueOfDays+"    ");
          float r=(random(0,1))*normalValueOfDays;
          if(r>0.01){
          }
          if(r>0.001){
            newArray[i][j][0]=1;
          }else{
            newArray[i][j][0]=0;
          }
        }
        //infected//
        if(array[i][j][0]==1){
          //test if recovered in time//
          if(array[i][j][1]<daysToRecover){
            float r = random(1,2);
            if(pow(r,array[i][j][1])>600){
              newArray[i][j][0]=9;
            }else{
              newArray[i][j][0]=array[i][j][0];
              newArray[i][j][1]=array[i][j][1]+1;
            }
          }

          //Die//
          if(array[i][j][1]>=daysToRecover){
            newArray[i][j][0]=73;
          }
        }

        //recovbered or died//
        if(array[i][j][0]!=1&&array[i][j][0]!=0){
          newArray[i][j][0]=array[i][j][0];
        }
      }
    }
  }
  return(newArray);
}

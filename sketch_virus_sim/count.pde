int [] count(int[][][] array){
  int [] statstics=new int[4];
  for(int i=0;i<cellNumber;i++){
    for(int j=0;j<cellNumber;j++){

      if(array[i][j][0]==0){
        statstics[0]++;
      }
      if(array[i][j][0]==1){
        statstics[1]++;
      }
      if(array[i][j][0]==9){
        statstics[2]++;
      }
      if(array[i][j][0]==73){
        statstics[3]++;
      }
    }
  }
  return statstics;
}

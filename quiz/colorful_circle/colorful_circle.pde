int[][] cc=new int[6][8];

void setup(){
  size(800,600);
  for(int i=0;i<6;i++){
    for(int j=0;j<8;j++){
      cc[i][j]=color(random(255),random(255),random(255));
    }
  }
}

void draw(){
  for(int r=0;r<6;r++){
    for(int c=0;c<8;c++){
      fill(cc[r][c]);
      int x=c*100+50;
      int y=r*100+50;
      ellipse(x,y,100,100);
    }
  }
}

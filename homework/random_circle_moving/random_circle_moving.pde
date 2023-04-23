// cc為顏色 x為x座標 y為y座標
// 按下滑鼠左鍵x座標為mouseX
// 按下滑鼠右鍵y座標為mouseY
// 按下滑鼠滾輪x座標為mouseX且y座標為mouseY

int[][] cc=new int[15][10];
int[][] x=new int[15][10];
int[][] y=new int[15][10];
void setup(){
  size(800,600);
  for(int i=0;i<15;i++){
    for(int j=0;j<10;j++){
      cc[i][j]=color(random(255),random(255),random(255));
      x[i][j]=int(random(800));
      y[i][j]=int(random(600));
    }
  }
}

void draw(){
  background(0);
  for(int a=0;a<15;a++){
    for(int b=0;b<10;b++){
      fill(cc[a][b]);             
      x[a][b]-=random(10);
      y[a][b]+=random(10);
      if(x[a][b]<0){
        x[a][b]=int(random(800));
      }
      if(y[a][b]>600){
        y[a][b]=int(random(600));
      }
      ellipse(x[a][b],y[a][b],10,10);
    }
  }
}

void mousePressed(){
  if(mouseButton==LEFT){
    for(int c=0;c<15;c++){
      for(int d=0;d<10;d++){
        x[c][d]=mouseX;
        y[c][d]=int(random(600));
      }
    }
  }
  
  
  if(mouseButton==RIGHT){
    for(int e=0;e<15;e++){
      for(int f=0;f<10;f++){
        x[e][f]=int(random(800));
        y[e][f]=mouseY;
      }
    }
  }
  
  
  if(mouseButton==CENTER){
    for(int e=0;e<15;e++){
      for(int f=0;f<10;f++){
        x[e][f]=mouseX;
        y[e][f]=mouseY;
      }
    }
  }
}

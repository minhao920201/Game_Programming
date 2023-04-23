PImage bird;
PImage[] birds=new PImage[8];
int px=100;
void setup(){
  size(800,600);
  bird=loadImage("bird.png");
  for(int i=0;i<2;i++){
    for(int j=0;j<4;j++){
      int x = 498 * j;
      int y = 335 * i;
      int idx1d = i*4 + j;
      birds[idx1d] = bird.get( x, y, 498, 335 );
    }
  }
}

void draw(){
  background(0);
  int timems=millis();
  int msToNext=100;
  int imgCnt=timems/msToNext;
  int imgid=imgCnt%birds.length;
  image(birds[imgid],px,400,128,64);
  px=px+5;
  if(px>width){
    px=0;
  }
}

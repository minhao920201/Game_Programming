PImage star;
PImage[] stars=new PImage[12];
int px=0;
void setup(){
  size(800,600);
  star=loadImage("12.jpg");
  for(int i=0;i<3;i++){
    for(int j=0;j<4;j++){
      int x = 209 * j;
      int y = 209 * i;
      int idx1d = i*4 + j;
      stars[idx1d]=star.get(x,y,209,209);
    }
  }
}

void draw(){
  background(0);
  int timems=millis();
  int msToNext=1000;
  int imgCnt=timems/msToNext;
  int imgid=imgCnt%stars.length;
  image(stars[imgid],px,0,800,600);
  image(stars[imgid],px+width,0,800,600);
  px=px-1;
  px=px%width;
  if(px>width){
    px=0;
  }
}

void setup(){
  size(800,600);
  strokeWeight(10);
}

void draw(){
  background(128);
  int red=255;
  for(int y=height-50;mouseY<y;y=y-50){  //mouseY跑到y上面時，會印出一條紅線
    stroke(red,0,0);
    red-=15;
    line(0,y,width,y);
  }
  stroke(0);
  
  for(int cx=350;cx<=450;cx+=100){
    for(int cy=100;cy<=550;cy+=100){
      ellipse(cx,cy,100,100);
    }
  }
}

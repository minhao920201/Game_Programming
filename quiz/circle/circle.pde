int rx;
int ry;

void setup() {
  size(800, 600);
  rx=width/2;
  ry=height/2;
}

void draw() {
  background(128);
  line(0,200,800,200);
  line(0,400,800,400);
  fill(255, 255, 0);
  rectMode(CENTER);
  rect(rx, ry, 100, 100);
  fill(255, 0, 255);
  if (mouseY<=200) {
    ellipse(mouseX, mouseY, 100, 100);
  } else if (mouseY>200 && mouseY<=400) {
    ellipse(mouseX, mouseY, 200, 200);
  } else {
    ellipse(mouseX, mouseY, 300, 300);
  }
}

void keyPressed(){
  if(keyCode==UP){
    ry-=10;
  }
  if(keyCode==DOWN){
    ry+=10;
  }
}

void mousePressed(){
  if(mouseButton==LEFT){
    rx-=10;
  }
  if(mouseButton==RIGHT){
    rx+=10;
  }
}

PImage pacman;
int imgx;
int pacAngle;

void setup()
{
  size(300,200);
  pacman=loadImage("pacman.png");
  imgx=0;
  pacAngle=0;
  fill(255,255,0);
}

void draw()
{
  image(pacman,imgx,0,300,200);
  image(pacman,imgx+width,0,300,200);
  imgx=imgx-1;
  imgx=imgx%width;
  arc(50,100,50,50,radians(0+pacAngle),radians(0+(360-pacAngle)));
  pacAngle=pacAngle+1;
  pacAngle=pacAngle%40;
}

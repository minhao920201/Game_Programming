int x,y,num,alpha;
void setup()
{
  size(600,300);
  background(0);
  num=0;
  alpha=255;
}

void draw()
{
  fill(255,255,255,alpha);
  if(num<40)
  {
  x=int(random(600));
  y=int(random(300));
  ellipse(x,y,5,5);
  num++;
  alpha=alpha-5;
  }
}

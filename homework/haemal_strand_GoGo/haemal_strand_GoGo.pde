int rectx,r,g;
void setup()
{
  size(600,100);
  background(255);
  rectx=0;
  noStroke();
}

void draw()
{
}

void mousePressed()
{
  if(mouseButton==LEFT)
    {
      r=255;
      g=0;
      fill(r,g,0);
      rect(rectx,20,80,60);
      if(rectx>520)               /* 起始點的x軸座標大於520時，血條就必會超出畫布(因為每個血條的寬度定為80)，因此要從原點再畫出所超出的部分 */
      {
        rectx=80-(600-rectx);      /* eg. 當此時rectx來到了550，因為每個血條的寬度定為80，就必須再從原點多畫寬度為30的血條 */
        rect(0,20,rectx,60);
      }
    }
    if(mouseButton==RIGHT)
    {
      r=0;
      g=255;
      fill(r,g,0);
      rect(rectx,20,80,60);
      if(rectx>520)
      {
        rectx=80-(600-rectx);
        rect(0,20,rectx,60);
      }
    }
    rectx=rectx+80;
}

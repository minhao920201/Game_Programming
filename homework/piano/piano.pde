size(800,350);
background(133,142,255);
line(0,50,800,50);
int i;
for(i=0;i<=800;i=i+80)
{
  fill(255);
  rect(i,50,80,300);
}

fill(0);
rect(0,50,30,180);

fill(0);
rect(130,50,60,180);

fill(0);
rect(210,50,60,180);

fill(0);
rect(370,50,60,180);

fill(0);
rect(450,50,60,180);

fill(0);
rect(530,50,60,180);

fill(0);
rect(690,50,60,180);

fill(0);
rect(770,50,30,180);

for(i=650;i<800;i=i+50)
{
  fill(238,242,78);
  ellipse(i,25,30,30);
}

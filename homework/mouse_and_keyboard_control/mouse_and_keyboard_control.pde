/* 按滑鼠左，中，右鍵會變顏色 */
/* 按鍵盤上，下，左，又會移動 */
/* x軸大於500或小於100圖形會消失 */
/* y軸大於400或小於200圖形會改變 */

int a,b,c,ex,ey;

void setup(){
  size(600,600);
  ex=300;ey=300;
  a=10;b=120;c=200;
}

void draw(){
  background(100,200,50);
  line(100,0,100,600);
  line(0,200,600,200);
  line(500,0,500,600);
  line(0,400,600,400);
  fill(a,b,c);
  if(ey>400){
    ellipse(ex,ey,100,100);
  }else if(ey<=400 && ey>=200){
    rectMode(CENTER);
    rect(ex,ey,100,100);
  }else{
    ellipse(ex,ey,50,100);
  }
  if(ex>500 || ex<100){
    background(100,200,50);
    line(100,0,100,600);
    line(0,200,600,200);
    line(500,0,500,600);
    line(0,400,600,400);
  }
  
}

void keyPressed(){
  if(keyCode==UP){
    ey=ey-10;
  }
  if(keyCode==DOWN){
    ey=ey+10;
  }
  if(keyCode==LEFT){
    ex=ex-10;
  }
  if(keyCode==RIGHT){
    ex=ex+10;
  }
}

void mousePressed(){
  if(mouseButton==LEFT){
    a=200;b=60;c=130;
  }else if(mouseButton==CENTER){
    a=10;b=120;c=200;
  }else{
    a=0;b=0;c=0;
  }
}

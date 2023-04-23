class Ship{
  float shipX ;
  int shipY ;
  Ship(float x,int y )
  {
    shipX =x;
    shipY=y;
  }
  void move(){
    fill(125,200,50);
  ellipse(shipX,shipY,20,20);
  shipY = shipY +5 ;
  
  if(600 == shipY)
  {
    shipY = 0 ;
    shipX = random(800);
  }
  
  if(shipX > mouseX-5 && shipX < mouseX+5 && shipY == 570 )
  {
    shipY = 0 ;
    life--;
    shipX = random(800);
  }
  }
}

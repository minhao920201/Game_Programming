class Player{
  PImage playerImg;
  
  float playerX;
  float playerY;
  
  Player(){
    playerImg=loadImage("player.png");
    
    playerX=random(800);
    playerY=random(600);
    
    frameRate(25);
    imageMode(CENTER);
  }
  
  void display(){
    image(playerImg,playerX,playerY,100,100);
    if(playerX>800){
      playerX=800;
    }
    if(playerY>600){
      playerY=600;
    }
    if(playerX<0){
      playerX=0;
    }
    if(playerY<0){
      playerY=0;
    }
  }
    
  
  float getX(){
    return playerX;
  }
  
  float getY(){
    return playerY;
  }
  
}

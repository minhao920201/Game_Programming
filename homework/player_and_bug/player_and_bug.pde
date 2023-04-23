Bug[] bugs=new Bug[5];
Player player;

void setup(){
  size(800,600);
  
  for(int i=0;i<bugs.length;i++){
    bugs[i]=new Bug();
  }
  
  player=new Player();
}

void draw(){
  background(255);
  
  player.display();
  
  for(int i=0;i<bugs.length;i++){
      bugs[i].display();
      bugs[i].move();
      if(player.getX()>=bugs[i].getTopLeftX() && player.getX()<=bugs[i].getTopLeftX()+bugs[i].getWidth() && player.getY()>=bugs[i].getTopLeftY() && player.getY()<=bugs[i].getTopLeftY()+bugs[i].getHeight()){
        println("touch");
      }
  }
  
}

void keyPressed(){
    if(keyCode==RIGHT){
      player.playerX=player.playerX+5;
    }
    if(keyCode==LEFT){
      player.playerX=player.playerX-5;
    }
    if(keyCode==DOWN){
      player.playerY=player.playerY+5;
    }
    if(keyCode==UP){
      player.playerY=player.playerY-5;
    }
  }

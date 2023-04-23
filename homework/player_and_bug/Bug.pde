class Bug{
  PImage bugImg;
  
  float bugX;
  float bugY;
  float bugDX;
  float bugDY;
  
  Bug(){
    bugImg=loadImage("bug.png");
    
    bugX=random(800);
    bugY=random(600);
    bugDX=random(-10,10);
    bugDY=random(-10,10);
    
    frameRate(25);
    
  }
  
  void display(){
    image(bugImg,bugX,bugY,30,30);
  }
  
  void move(){
    bugX+=bugDX;
    bugY+=bugDY;
    if(bugX<0 || bugX>width){
      bugDX*=-1;
    }
    if(bugY<0 || bugY>height){
      bugDY*=-1;
    }
   }
  
  float getTopLeftX(){
    return bugX;
  }
  
  float getTopLeftY(){
    return bugY;
  }
  
  int getWidth(){
    return bugImg.width;
  }
  
  int getHeight(){
    return bugImg.height;
  }
  
}

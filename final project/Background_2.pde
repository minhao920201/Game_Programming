class Background_2{
  int starX;
  int starY;
  int alpha;
  
  Background_2(){
    starX=int(random(1000));
    starY=int(random(1000));
    alpha=255;
  }
  void display(){
    fill(255,255,255,alpha);
    ellipse(starX,starY,5,5);
    alpha=alpha-int(random(5));
    if(alpha<0){
      alpha=255;
    }
  }
  
  
}

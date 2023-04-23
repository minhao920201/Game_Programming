class Background_1{
  int lineX;
  int lineY_1;
  int lineY_2;
  
  Background_1(){
    lineX=int(random(1000));
    lineY_1=int(random(1000));
    lineY_2=int(random(1000));
  }
  
  void display(){
    stroke(255);
    strokeWeight(int(random(5)));
    line(lineX,lineY_1,lineX,lineY_2);
  }
  
  void move(){
    lineY_1=lineY_1+int(random(10));
    lineY_2=lineY_2+int(random(10));
    if(lineY_2>1000){
      lineY_1=0;
      lineY_2=int(random(50));
      lineX=int(random(1000));
    }
  }
}

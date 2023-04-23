final int EGG_W = 35;
final int EGG_H = 45;
final int EGG_RANGE = 200;
final int EGG_MIN_X = 25;
final int BASKET_W = 100;
final int BASKET_H = 100;
final int BASKET_Y = 310;
final int BASKET_BOUND = 10;
final int BREAKEGG_W = 70;
final int BREAKEGG_H = 70;
final int GROUND_Y = 430;

PImage bgImg ,basket ,egg1,egg2, breakEgg,front;

int eggX1, eggY1,eggSpeed1, eggX2, eggY2, eggSpeed2;
int  basketX;
boolean hasBrokenEgg1, hasBrokenEgg2, isPlaying;


void setup(){
  size(350, 500);
  bgImg = loadImage("img/bgImg.png");
  basket = loadImage("img/basket.png");
  egg1 = loadImage("img/egg.png");
  egg2 = loadImage("img/egg.png");
  breakEgg = loadImage("img/breakEgg.png");
  front = loadImage("img/front.png");
  
  eggX1 = floor(random(EGG_RANGE))+EGG_MIN_X;
  eggX2 = floor(random(EGG_RANGE))+EGG_MIN_X;
  eggY1 = 0;
  eggY2 = -100;
  eggSpeed1 = floor(random(2)+2);
  eggSpeed2 = floor(random(2)+2);
  hasBrokenEgg1 = false;
  hasBrokenEgg2 = false;
  isPlaying = true;
}



void draw() {
  
  if(isPlaying){
      image(bgImg, 0, 0,width, height);
            
      //Control Basket Movementf
      basketX = mouseX - BASKET_W/2;
      if( mouseX > width-(BASKET_W/2)){
         basketX = width-BASKET_W;
      }else if(mouseX < BASKET_W/2){
         basketX = 0;
      }    
      image(basket, basketX, BASKET_Y, BASKET_W, BASKET_H);   
      
      //Eggs Drop
      eggY1 += eggSpeed1;
      eggY2 += eggSpeed2;
      image(egg1, eggX1, eggY1, EGG_W , EGG_H);
      image(egg2, eggX2, eggY2, EGG_W , EGG_H);
      
      
      //Front basket
      image(front, basketX, BASKET_Y, BASKET_W, BASKET_H);
      
      
      //Condition: Egg1 is Catched or Not
      if(eggY1 >= BASKET_Y+EGG_H) {
         if(eggX1 > basketX+BASKET_BOUND && eggX1 < basketX+BASKET_W-BASKET_BOUND ) {
          eggY1 = 0;
          eggX1 = floor(random(EGG_RANGE))+EGG_MIN_X;
          eggSpeed1 = floor(random(2)+2);
         } else{
          eggY1 = 600;
          eggSpeed1 = 0;
          hasBrokenEgg1 = true;
          image(breakEgg, eggX1, GROUND_Y, BREAKEGG_W, BREAKEGG_H);
         }
      }
      
      //Condition: Egg2 is Catched or Not
      if(eggY2 >= BASKET_Y+EGG_H) {
         if(eggX2 > basketX+BASKET_BOUND && eggX2 < basketX+BASKET_W-BASKET_BOUND ) {
          eggY2 = -100;
          eggX2 = floor(random(EGG_RANGE))+EGG_MIN_X;
          eggSpeed2 = floor(random(2)+2);
         } else{
          eggY2 = 600;
          eggSpeed2 = 0;
          hasBrokenEgg2 = true;
          image(breakEgg, eggX2, GROUND_Y, BREAKEGG_W, BREAKEGG_H);
         }
      }
      
      
       //Game Over
      if(hasBrokenEgg1 && hasBrokenEgg2 ){
      isPlaying = false;   
      }
    }
}


void mouseClicked(){
  if(isPlaying == false){
      eggX1 = floor(random(EGG_RANGE))+EGG_MIN_X;
      eggX2 = floor(random(EGG_RANGE))+EGG_MIN_X;
      eggY1 = 0;
      eggY2 = -100;
      eggSpeed1 = floor(random(2)+2);
      eggSpeed2 = floor(random(2)+2);
      hasBrokenEgg1 = false;
      hasBrokenEgg2 = false;
      isPlaying = true;
  }
}


  

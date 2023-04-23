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

PImage bgImg ,basket ,egg, breakEgg,front;

int eggX, eggY,eggSpeed;
int  basketX;
boolean hasBrokenEgg, isPlaying;


void setup(){
  size(350, 500);
  bgImg = loadImage("img/bgImg.png");
  basket = loadImage("img/basket.png");
  egg = loadImage("img/egg.png");
  breakEgg = loadImage("img/breakEgg.png");
  front = loadImage("img/front.png");
  
  eggX = floor(random(EGG_RANGE))+EGG_MIN_X;
  eggY = 0;
  eggSpeed = floor(random(2)+2);
  hasBrokenEgg = false;
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
      eggY += eggSpeed;
      image(egg, eggX, eggY, EGG_W , EGG_H);
      
      
      //Front basket
      image(front, basketX, BASKET_Y, BASKET_W, BASKET_H);
      
      
      //Condition: Egg is Catched or Not
      if(eggY >= BASKET_Y+EGG_H) {
         if(eggX > basketX+BASKET_BOUND && eggX < basketX+BASKET_W-BASKET_BOUND ) {
          eggY = 0;
          eggX = floor(random(EGG_RANGE))+EGG_MIN_X;
          eggSpeed = floor(random(2)+2);
         } else{
          eggY = 600;
          eggSpeed = 0;
          hasBrokenEgg = true;
          image(breakEgg, eggX, GROUND_Y, BREAKEGG_W, BREAKEGG_H);
         }
      }
      
       //Game Over
      if(hasBrokenEgg ){
      isPlaying = false;                
      }
    }
}


void mouseClicked(){
  if(isPlaying == false){
    eggX = floor(random(EGG_RANGE))+EGG_MIN_X;
    eggY = 0;
    eggSpeed = floor(random(2)+2);
    hasBrokenEgg = false;
    isPlaying = true;
  }
}


  

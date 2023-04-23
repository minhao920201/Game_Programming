final int EGG_W = 35;
final int EGG_H = 45;
final int EGG_RANGE = 290;
final int EGG_MIN_X = 30;
final int BASKET_W = 100;
final int BASKET_H = 100;
final int BASKET_Y = 310;
final int BASKET_BOUND = 10;

int  basketX;
int eggX, eggY,eggSpeed;

PImage bgImg ,basket ,egg;

void setup(){
  size(350, 500);
  bgImg = loadImage("img/bgImg.png");
  basket = loadImage("img/basket.png");
  egg = loadImage("img/egg.png");
  
  eggX = floor(random(EGG_RANGE))+EGG_MIN_X;
  eggY = 0;
  eggSpeed = floor(random(2)+2);

}



void draw() {
    image(bgImg, 0, 0,width, height);
    
    //Eggs Drop
    eggY += eggSpeed;
    image(egg, eggX, eggY, EGG_W , EGG_H);
    
    //Control Basket Movement
    basketX = mouseX - BASKET_W/2;
    if( mouseX > width-(BASKET_W/2)){
       basketX = width-BASKET_W;
    }else if(mouseX < BASKET_W/2){
       basketX = 0;
    }    
    image(basket, basketX, BASKET_Y, BASKET_W, BASKET_H);   
    
    //Condition: Egg is Catched or Not
    if(eggY >= BASKET_Y+EGG_H) {
      if(eggX > basketX+BASKET_BOUND && eggX < basketX+BASKET_W-BASKET_BOUND ) {
        eggY = 0;
        eggX = floor(random(EGG_RANGE))+EGG_MIN_X;        
        eggSpeed = floor(random(2)+2);
      } 
    }
    
    
    
    
    
}




  

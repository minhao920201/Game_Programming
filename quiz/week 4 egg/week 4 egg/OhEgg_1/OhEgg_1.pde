final int BASKET_W = 100;
final int BASKET_H = 100;
final int BASKET_Y = 310;

int  basketX;

PImage bgImg,basket;

void setup(){
  size(350, 500);
  bgImg = loadImage("img/bgImg.png");
  basket = loadImage("img/basket.png");
}



void draw() {
    image(bgImg, 0, 0, width, height);
    
    //Control Basket Movement
    basketX = mouseX - BASKET_W/2;
    if( mouseX > width-(BASKET_W/2)){
       basketX = width-BASKET_W;
    }else if(mouseX < BASKET_W/2){
       basketX = 0;
    }
    
    image(basket, basketX, BASKET_Y, BASKET_W, BASKET_H);   
}

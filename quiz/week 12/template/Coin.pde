class Coin{
  //PImage: coin images
  PImage coinImg;
  
  //variable to store the coin's x, y and speed of x, y
  float coinX;
  float coinY;
  float coinDX;
  float coinDY;
  
  Coin(){
    //load and cut coin sprite image
    coinImg = loadImage("coin.jpeg");
  
    //initialize the locaion, spped and status of the coin
    coinX = random(width);
    coinY = random(height);
    coinDX = random(-10,10);
    coinDY = random(-10,10);
    
    //set the framerate and the image mode
    frameRate(25);
    imageMode(CENTER);
  }
  
  //show the coin or explosion on the screen
void display()
{
  image( coinImg, coinX, coinY, 50, 50 );
}

  //move the coin
  void move()
  {
    coinX += coinDX;
    coinY += coinDY;
    
    if( coinX < 0 || coinX > width ){
      coinDX *= -1;
    }
    
    if( coinY < 0 || coinY > height ){
      coinDY *= -1;
    }
  }
  
  //detect the cursor is on the coin or not
  //mx and my is the cursor location
  boolean mouseCoinDetection(int mx, int my){
    if( dist(mx, my, coinX, coinY) < 25){
      coinX = random(width);
      coinY = random(height);
      coinDX = random(-10,10);
      coinDY = random(-10,10);
      return true;
    }else{
      return false;
    }
  }
}

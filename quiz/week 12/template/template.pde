//current score
int score = 0;
Coin[] coins=new Coin[20];

void setup(){
  size(800,600);
  for(int i=0;i<coins.length;i++){
    coins[i]=new Coin();
  }
}

void draw(){
  background(50);
  
  for(int i=0;i<coins.length;i++){
    coins[i].move(); //move the coin
    coins[i].display();  //display the coin
    //detect the mouse is in the coin region or not
    //if yes, retuen true to hit
    boolean hit = coins[i].mouseCoinDetection( mouseX, mouseY);
    
    //the mouse is in the coin region (hit is true), add 1 to score, and reset coin
    if(hit == true){
      score ++;
    }
  }
  
  //show the score 
  fill(255, 0 ,0);
  textSize(40);
  text(score, 50, 50);
}

//life<=0 時，lose字樣出現
class Lose {
  PImage lose;
  int loseX;
  Lose() {
    lose=loadImage("lose.png");
    loseX=800;
  }
  void display() {
    background(0);
    image(lose, loseX, 300, 600, 400);

    if (loseX != -100)
    {
      loseX = loseX - 6;
    }
    if (loseX == -100 )
    {
      loseX = -100;
      condition = 0;
      if (condition==0) {
        life=3;
        score=0;
        loseX=800;
      }
    }
  }
}

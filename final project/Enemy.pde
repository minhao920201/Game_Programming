//level 1 和 level 2 出現的enemy
class Enemy {
  PImage enemy;
  float enemyX = random(800) ;
  int enemyY = 0 ;
  int speed;

  Enemy(int s)
  {
    enemy=loadImage("enemy.png");
    imageMode(CENTER);

    speed=s;
  }
  void move() {

    image(enemy, enemyX, enemyY, 100, 80);
    enemyY = enemyY +speed ;

    if (600 == enemyY)
    {
      enemyY = 0 ;
      enemyX = random(800);
    }


    //判斷條件為敵艦碰到我方戰艦的左右X座標及上方Y座標
    if (enemyX > mouseX-40 && enemyX < mouseX+40 && enemyY >= 500 )
    {
      enemyY = 0 ;
      life--;
      enemyX = random(800);
    }

    if (bulletX > enemyX - 50 && bulletX < enemyX + 50 && bulletY < enemyY + 50)
    {
      enemyY = 0 ;
      enemyX = random(800);
      score++;
      bulletX=-500;
      bulletY=-500;
    }
  }
}

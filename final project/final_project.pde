//主頁面宣告
PImage bg;
PImage start;
PImage title;
int titleX = -00;

//滑鼠操控的船隻宣告
PImage mainship;
int bulletX;
int bulletY;
int life;
int score = 0 ;

//boss宣告
PImage boss;
int bossX = 1000;
int bossSide= 1 ;
float bossBulletX = 1000;
float bossBulletY = 150;
int bossLife = 10;

//sprite image宣告
PImage sprite_image;
PImage[] spriteImg = new PImage[12];
int sx=100;

//根據不同condition觸發不同的事
int condition = 0;

//紀錄時間
int time ;
int savedTime;
int totalTime = 1000;

int secondCount = 1;
int [] secondList ;
int temp;

//宣告使用class
Background[] stars=new Background[30];
Enemy[] enemies_1=new Enemy[4];
Enemy[] enemies_2=new Enemy[8];
Lose lose;
Win win;

//音樂宣告
import processing.sound.*;
SoundFile shoot;
SoundFile bgm;

void setup() {

  size(800, 600);
  mainship = loadImage("mainship.png");
  boss=loadImage("boss.png");
  sprite_image=loadImage("sprite_image.jpg");
  for ( int i=0; i<3; i++) {
    for ( int j=0; j<4; j++ ) {
      int x = 112 * j;
      int y = 110 * i;
      int idx1d = i*4 + j;
      spriteImg[idx1d] = sprite_image.get( x, y, 112, 110 );
    }
  }

  secondList = new int[70];
  for (int i = 0; i < secondList.length; i++)
  {
    secondList[i] = 100000 ;
  }

  bulletX=-500;
  bulletY=-500;
  life = 3;
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Background(int(random(10))+1);
  }
  for (int i=0; i<enemies_1.length; i++) {
    enemies_1[i] = new Enemy(int(random(4))+1);
  }
  for (int i=0; i<enemies_2.length; i++) {
    enemies_2[i] = new Enemy(int(random(6))+1);
  }
  lose=new Lose();
  win=new Win();

  shoot=new SoundFile(this, "shoot.mp3");
  bgm=new SoundFile(this, "bgm.mp3");
  bgm.play();
  savedTime = millis();
}

void draw() {
  imageMode(CENTER);
  //condition=0時，主頁面顯示
  if (condition == 0)
  {
    bg = loadImage("background.png");
    start = loadImage("start_icon.png");
    title = loadImage("title.png");
    time = 0 ;


    image(bg, 400, 300, width, height);

    image(title, titleX, 100, 540, 180);
    titleX += 15;

    if (titleX == 1200)
    {
      titleX = -300 ;
    }


    if (mouseX>530 && mouseX<770 && mouseY>425 && mouseY<575)
    {
      image(start, 650, 500, 288, 180);
    } else
    {
      image(start, 650, 500, 240, 150);
    }

    //sprite image往右移動
    int timems=millis();
    int msToNext=100;
    int imgCnt=timems/msToNext;
    int imgid=imgCnt%spriteImg.length;
    image(spriteImg[imgid], sx, 560, 128, 64);
    sx=sx+5;
    if (sx>width) {
      sx=0;
    }

    for (int i=0; i<stars.length; i++) {
      stars[i].display();
    }

    //按到start位置時會改變condition
    if (mouseX>530 && mouseX<770 && mouseY>425 && mouseY<575 && mousePressed)
    {
      condition = 1;
    }
  }
  //condition=1時，遊玩時會有不同的情況產生
  if (condition == 1)
  {
    int passedTime = millis() - savedTime;

    if (passedTime > totalTime) {
      time++;
      savedTime = millis(); // Save the current time to restart the timer!
    }
    //life<=0時，lose出現
    if (life<=0) {
      lose.display();
      time = 0 ;
      bossLife = 10 ;
      bgm.cue(0.0);
      bgm.play();
    } else {
      //分數<10時，較少的enemy
      if (score<10) {
        background(0);
        for (int i=0; i<stars.length; i++) {
          stars[i].display();
        }
        textSize(20);
        text("score:"+score, 20, 20);

        textSize(20);
        text("life:"+life, 700, 20);

        textSize(20);
        text("Level I", 360, 20);

        imageMode(CENTER);
        image(mainship, mouseX, 560, 100, 100);


        ellipse(bulletX, bulletY, 10, 10);
        bulletY=bulletY-3;

        for (int i=0; i<enemies_1.length; i++) {
          enemies_1[i].move();
        }
        if (mousePressed) {
          bulletX=mouseX;
          bulletY=580;
          shoot.play();
        }
      }

      //分數>=10且<20時，更多的enemy
      if (score>=10 && score<20) {
        background(0);
        for (int i=0; i<stars.length; i++) {
          stars[i].display();
        }
        textSize(20);
        text("score:"+score, 20, 20);

        textSize(20);
        text("life:"+life, 700, 20);

        textSize(20);
        text("Level II", 360, 20);

        imageMode(CENTER);
        image(mainship, mouseX, 560, 100, 100);


        ellipse(bulletX, bulletY, 10, 10);
        bulletY=bulletY-3;

        for (int i=0; i<enemies_2.length; i++) {
          enemies_2[i].move();
        }
        if (mousePressed) {
          bulletX=mouseX;
          bulletY=580;
          shoot.play();
        }
      }
      //分數>=20時，boss出現
      if (score>=20)
      {
        background(0);
        for (int i=0; i<stars.length; i++) {
          stars[i].display();
        }
        textSize(20);
        text("score:"+score, 20, 20);

        textSize(20);
        text("Life:"+life, 700, 20);

        textSize(20);
        text("Level III", 360, 20);

        textSize(20);
        text("Boss Life :"+bossLife, 360, 550);

        imageMode(CENTER);
        image(mainship, mouseX, 560, 100, 100);

        ellipse(bulletX, bulletY, 10, 10);
        bulletY=bulletY-3;

        if (mousePressed) {
          bulletX=mouseX;
          bulletY=580;
          shoot.play();
        }

        image(boss, bossX, 100, 200, 150);
        if (bossSide==1)
        {
          bossX-=4;
        }
        if (bossX<=-100)
        {
          bossSide=0;
        }
        if (bossSide==0)
        {
          bossX+=4;
        }

        if (bossX>=900)
        {
          bossSide = 1;
        }
        if (bulletX>bossX-85 && bulletX<bossX+85 && bulletY<190)
        {
          bossLife--;
          bulletX=-500;
          bulletY=-500;
        }
        bossBulletX = bossX ;
        ellipse(bossBulletX, bossBulletY, 30, 30);
        bossBulletY+=5;

        if (bossBulletY>=600)
        {
          bossBulletY = 150;
        }
        if (bossBulletX>mouseX-55 && bossBulletX<mouseX+55 && bossBulletY > 485)
        {
          life--;
          bossBulletY = 150;
        }
      }
      //boss死掉時，把遊戲重設回初始值
      if (bossLife == 0)
      {
        condition =2;
        secondList[secondCount-1]=time;
        secondCount++;
      }
    }
  }
  //condition=2 時，顯示win，根據通關速度的排名也出現
  if (condition == 2)
  {
    win.display();

    fill(255);

    for (int i = 0; i<secondList.length; i++)
    {
      int minNumber = i;
      for (int j = i; j < secondList.length; j++)
      {
        if (secondList[j] < secondList[minNumber])
        {
          minNumber = j;
        }
        temp = secondList[minNumber];
        secondList[minNumber] = secondList[i];
        secondList[i] = temp;
      }
    }

    for (int i = 0; i<secondList.length; i++)
    {
      if (secondList[i] != 100000)
      {
        fill(120);
        text(secondList[i]+" seconds", 250, 125+i*75);
      }
    }
    if (mouseX>450 && mouseX<750 && mouseY>250 && mouseY<450 && mousePressed)
    {
      condition =0;
      score = 0;
      life = 3 ;
      bossLife = 10;
      bgm.cue(0.0);
      bgm.play();
    }
  }
}

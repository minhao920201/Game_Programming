//打贏boss 時，一隻會飛的鳥出現，win字樣出現，可按home鍵返回主頁面
class Win {
  PImage home ;
  PImage win;
  PImage bird;
  PImage[] birds=new PImage[8];
  int px;
  Win() {
    home = loadImage("home.png");
    win = loadImage("win.png");
    bird=loadImage("bird.png");
    px=100;
    for (int i=0; i<2; i++) {
      for (int j=0; j<4; j++) {
        int x = 498 * j;
        int y = 335 * i;
        int idx1d = i*4 + j;
        birds[idx1d] = bird.get( x, y, 498, 335 );
      }
    }
  }
  void display() {
    image(win, 400, 300, 800, 600);
    int timems=millis();
    int msToNext=100;
    int imgCnt=timems/msToNext;
    int imgid=imgCnt%birds.length;
    image(birds[imgid], px, 530, 128, 64);
    px=px+5;
    if (px>width) {
      px=0;
    }
    if (mouseX>450 && mouseX<750 && mouseY>250 && mouseY<450)
    {
      image(home, 600, 400, 400, 400);
    } else
    {
      image(home, 600, 400, 300, 300);
    }
  }
}

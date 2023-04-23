//背景:星星閃爍
class Background {
  int starX;
  int starY;
  int alpha;
  int fadeSpeed;

  Background(int fs) {
    starX=int(random(800));
    starY=int(random(600));
    alpha=255;
    fadeSpeed=fs;
  }
  void display() {
    fill(255, 255, 255, alpha);
    ellipse(starX, starY, 5, 5);
    alpha=alpha-fadeSpeed;
    if (alpha<0) {
      alpha=255;
    }
  }
}

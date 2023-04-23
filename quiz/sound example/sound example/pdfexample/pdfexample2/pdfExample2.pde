import processing.sound.*;
SoundFile song;
String action = "";
void setup() {
  size(800, 600);

  song = new SoundFile(this, "epicsaxguy.mp3");
  
}      

void draw() {
  textSize(48);
  background(127);
  text(action, width/2, height/2);
  
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (song.isPlaying() == false) {
      song.play();
      action = "Play"+"\nClickMouseLeft";
    } else {
      song.pause();
      action = "Pause"+"\nClickMouseLeft";
    }
  }
}

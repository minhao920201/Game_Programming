import processing.sound.*;
SoundFile song;
String action = "";
Amplitude volumeAnalyzer;

void setup() {
  size(800, 600);
  song = new SoundFile(this, "epicsaxguy.mp3");
  volumeAnalyzer = new Amplitude(this);
  volumeAnalyzer.input(song);
}      

void draw() {
  textSize(48);
  background(127);
  fill(255);
  text(action, width/2, height/2);
  text(song.position(), width/3, height/3);
  fill(255, 0, 0);
  text(volumeAnalyzer.analyze(), width/5, height/5);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      song.jump(song.position()-5);
    }
    if (keyCode == RIGHT) {
      song.jump(song.position()+5);
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (song.isPlaying() == false) {
      song.play();
      action = "Play" + "\nClickMouseLeft";
    } else {
      song.pause();
      action = "Pause" + "\nClickMouseLeft";
    }
  }
  if (mouseButton == RIGHT) {
    song.cue(0.0);
    song.stop();
    action = "Stop" + "\nClickMouseRight";
  }
}

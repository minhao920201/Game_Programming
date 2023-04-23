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
  background(127);
  ellipse(width/2, height/2, volumeAnalyzer.analyze()*400
  , volumeAnalyzer.analyze()*400);
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
      song.loop();
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

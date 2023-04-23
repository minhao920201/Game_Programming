import processing.sound.*;
SoundFile song;

void setup() {
  size(800, 600);
  background(127);
  song = new SoundFile(this, "epicsaxguy.mp3");
  song.play();
}      

void draw() { 

}

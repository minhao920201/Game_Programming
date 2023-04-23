//TODO: declare a PImage variable here 
//to store the background image
PImage background;

//PImage variable and array 
//to store the spriteImg
PImage img;
PImage[] spriteImg = new PImage[8];

//the x-location to draw the sprite image 
int px = 100;

void setup()
{
  size( 800, 600 );
  
  //TODO: load the background image here
  background=loadImage("background.jpg");
  //Load the sprite image and subdivide them
  //into PImage array
  //I have finished this for you, 
  //you do not have to modify this
  img = loadImage("runningcat.png");
  for( int i=0; i<4; i++){
    for( int j=0; j<2; j++ ){
      int x = 512 * j;
      int y = 256 * i;
      int idx1d = i*2 + j;
      spriteImg[idx1d] = img.get( x, y, 512, 256 );
    }
  }
}

void draw()
{
  //TODO: show the backgroung image here
  //this background should cover the whole window exactly
  //I do not mind the background image is squished or not
  image(background,0,0,800,600);
  
  //TODO: show the running cat animation here
  //show the animation as this size (128x64)
  //I do not mind how fast the animation is
  int timems=millis();
  int msToNext=100;
  int imgCnt=timems/msToNext;
  int imgid=imgCnt%spriteImg.length;
  image(spriteImg[imgid],px,400,128,64);
  px=px+5;
  if(px>width){
    px=0;
  }
}

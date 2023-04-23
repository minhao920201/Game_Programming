//x, y and color of diamond0
int x0 = 100;
int y0 = 100;
color clr0 = color( 255,0, 0);

//x, y and color of diamond1
int x1 = 300;
int y1 = 300;
color clr1 = color( 0,255, 0);

//x, y and color of diamond2
int x2 = 500;
int y2 = 500;
color clr2 = color( 0, 0, 255);

void setup()
{
  size( 800, 600 );
  strokeWeight(10);
}

void draw()
{
  background(128);
  
  //TODO: comment or remove this code segment (Line 29 ~ Line 51)
  //This is an example without using self-defined function
  //display and move diamond0
  /*
  stroke(clr0);
  line( x0-25, y0   , x0   , y0-50);
  line( x0   , y0-50, x0+25, y0 );
  line( x0+25, y0   , x0   , y0+50 );
  line( x0   , y0+50, x0-25, y0 );
  x0 += 3;
  x0 %= width;  
  //display and move diamond1
  stroke(clr1);
  line( x1-25, y1   , x1   , y1-50);
  line( x1   , y1-50, x1+25, y1 );
  line( x1+25, y1   , x1   , y1+50 );
  line( x1   , y1+50, x1-25, y1 );
  x1 += 3;
  x1 %= width;  
  //display and move diamond2
  stroke(clr2);
  line( x2-25, y2   , x2   , y2-50);
  line( x2   , y2-50, x2+25, y2 );
  line( x2+25, y2   , x2   , y2+50 );
  line( x2   , y2+50, x2-25, y2 );
  x2 += 3;
  x2 %= width; 
  */
  
  //TODO: only uncomment this code segment,
  //but do NOT change this code segment.
  
  //using self-defined function to display and move diamond0
  display( x0, y0, clr0);
  x0 = move(x0);
  //using self-defined function to display and move diamond1
  display( x1, y1, clr1);
  x1 = move(x1);
  //using self-defined function to display and move diamond2
  display( x2, y2, clr2);
  x2 = move(x2);
  
}

//A function display the a diamond 
//This function takes three input arguments, x, y and color of the diamond
//TODO: complete this function
void display(int x,int y,color clr){
  stroke(clr);
  line(x-25,y,x,y-50);
  line(x,y-50,x+25,y);
  line(x+25,y,x,y+50);
  line(x,y+50,x-25,y);
}

//A function moves a diamond by the input x location and return the updated x location
//This function takes one argument, x location of the diamond
//and return the updated x location
//TODO: complete this function
int move(int x){
  x+=3;
  x%=width;
  return x;
}

float xtrans = 0;
float ytrans = 0;
float scl = 1;
float rot = 0;
PImage img;
boolean showAxis = true;

void setup(){
  size(800,600);
  
  img = loadImage("hero.jpg");
}

void draw(){
  background(128);
  
  pushMatrix();
  translate(mouseX, mouseY);
  rotate( radians(rot) );
  scale( scl );
  if( showAxis ){                             //畫drawing座標軸
      stroke(0, 0, 0);
      strokeWeight(2);
      line(0 ,0 , width, 0);
      line(0 ,0 , 0, height);
      fill(0,0,0);
      text("X-axis", 55, -5);                 //在X座標上顯示X-axis
      for( int x=0; x<width; x+= 100 ){        //每間隔100劃出圓並顯示目前的位置
        fill(255,255,255);
        ellipse( x, 0, 25, 25);
        fill(0,0,0);
        text(str(x), x-10, 0+5);
      }
      fill(0,0,0);
      text("Y-axis", -35, 50);                 //在Y座標上顯示Y-axis
      for( int y=0; y<height; y+= 100 ){        //每間隔100劃出圓並顯示目前的位置
        fill(255,255,255);
        ellipse( 0, y, 25, 25);
        fill(0,0,0);
        text(str(y), -10, y+5);
      }
      fill(255,255,255);
      strokeWeight(1);
  }
  imageMode(CENTER);
  image( img, 0, 0, img.width, img.height );
  
  ellipse(img.width/2,img.height/2,20,20);
  ellipse(img.width/2,-img.height/2,20,20);
  ellipse(-img.width/2,img.height/2,20,20);
  ellipse(-img.width/2,-img.height/2,20,20);
  
  popMatrix();
}

void mousePressed(){
  if( mouseButton == LEFT ){               //按左鍵，做標軸會順時針旋轉
    rot += 10;
  }else if( mouseButton == RIGHT ){         //按右鍵，做標軸會逆時針旋轉
    rot -= 10;
  }
  rot = rot % 360;
}

void keyPressed(){
  if( key == 'l' ){              //按'l'，放大
    scl += 0.1;
  }else if( key == 's' ){        //按's'，縮小
    scl -= 0.1;
  }
  
  if( key == ' ' ){             //按空白鍵，你可以切換是否顯示座標
    showAxis = !showAxis;
  }
}

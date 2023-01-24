PImage david;


float accelerate = 100.0;


void setup(){
  size(1280,720,P3D);
  //frameRate(10.0);
  //fullScreen(P3D);

  david = loadImage("david_0.png");
  david.resize(height,height);
  
  image(david,0,0);
  loadPixels();
  background(0);
  
  noStroke();
}

void draw(){
  //println(frameCount);
  background(0);
  translate(width/2,height/2);
  //rotateY(radians(millis())/100.0);
  //sphere(20);
  push();
  translate(-width/4,-height/2.5,-300);
    drawDavid();
  pop();

}

void drawDavid(){
  accelerate += 0.02;
  float move = noise(accelerate)*50.0;
  //println(move);
  int pixelSize = 10;
  for(int gridX=0;gridX<width/2;gridX+=pixelSize){
      for(int gridY=0;gridY<width/2;gridY+=pixelSize){
        int kolor = pixels[gridY*width+gridX];
        fill(kolor);
        push();
          translate(gridX,gridY,brightness(kolor));
          //square(0,0,pixelSize);
          square(0,move,pixelSize);
          square(move,0,pixelSize);
          square(0,-move,pixelSize);
          square(-move,0,pixelSize);
        pop();
      }
  }
}


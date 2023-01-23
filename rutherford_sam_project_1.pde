PImage david;

void setup(){
  size(1280,720);
  david = loadImage("david_1.png");
  david.resize(height,height);
  image(david,0,0);
  loadPixels();
  background(0);
}

void draw(){
  background(0);
  drawDavid();
  

}

void drawDavid(){
  for(int gridX=0;gridX<width/2;gridX+=5){
      for(int gridY=0;gridY<width/2;gridY+=5){
        int kolor = pixels[gridY*width+gridX];
        fill(kolor);
        push();
        translate(0,0,brightness(kolor));
        circle(gridX,gridY,3);
        pop();
        
      }
  }
}

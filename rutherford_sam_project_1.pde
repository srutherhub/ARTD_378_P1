PImage david,buddha,liberty,head,thinker;



float accelerate = 100.0;
int count = 0;
int clickCount = 1;


void setup(){
  size(1280,720,P3D);
  //fullScreen(P3D);
  background(0);
  noStroke();
  if(clickCount == 1){
    println(clickCount);
    david = loadImage("david_0.png");
    david.resize(height,height);
    image(david,0,0);
    loadPixels();
    updatePixels();
  }if(clickCount ==2){
    background(0);
    println(clickCount);
    buddha = loadImage("buddha.png");
    buddha.resize(height,height);
    image(buddha,0,0);
    loadPixels();
    updatePixels();
  }if(clickCount ==3){
    background(0);
    println(clickCount);
    liberty = loadImage("liberty.png");
    liberty.resize(height,height);
    image(liberty,0,0);
    loadPixels();
    updatePixels();
  }if(clickCount == 4){
    background(0);
    println(clickCount);
    head = loadImage("head.png");
    head.resize(height,height);
    image(head,0,0);
    loadPixels();
    updatePixels();
  }if(clickCount == 5){
    background(0);
    println(clickCount);
    thinker = loadImage("thinker.png");
    thinker.resize(height,height);
    image(thinker,0,0);
    loadPixels();
    updatePixels();
  }
  
  
  background(0);
}

void draw(){
  count+=1;
  float rotSpeed = (sin(count/500.0)*30);
  background(0);
  push();
  translate(width/2,height/2,-300);
  rotateY(radians(rotSpeed));
  //sphere(20);
  push();
  translate(-width/3,-height/2.5);
    drawDavid();
  pop();
  pop();

}

void drawDavid(){
  accelerate += 0.002;
  float move = noise(accelerate)*50.0;
  //println(move);
  int pixelSize = 3;
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

void mouseClicked(){
  //println(clickCount);
  clickCount+=1;
  
  if(clickCount > 5){
    clickCount = 1;
  }
  
  setup();
}
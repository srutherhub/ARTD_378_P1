ParticleSystem ps;

PImage david;

void setup(){
  size(1280,720,P3D);
  ps = new ParticleSystem(new PVector(0, 0));
  david = loadImage("david_0.png");
  david.resize(height,height);
  image(david,0,0);
  loadPixels();
  background(0,0,0,0);
  noStroke();


}

void draw(){
  background(0);
  
  
  //fill(255,0,0);
  translate(width/2,height/2);
  rotateY(radians(millis())/100.0);
  //sphere(20);
  push();
  translate(-width/4,-height/2.5,-300);

  drawDavid();
  pop();
  

}

void drawDavid(){
  int pixelSize = 3;
  for(int gridX=0;gridX<width/2;gridX+=pixelSize){
      for(int gridY=0;gridY<width/2;gridY+=pixelSize){
        int kolor = pixels[gridY*width+gridX];
        fill(kolor);
        push();
        translate(gridX,gridY,brightness(kolor));
        box(pixelSize);
        //translate(0,0,modelZ(10,10,10));
         ps.addParticle();
         ps.run();
        pop();
        
      }
  }
}

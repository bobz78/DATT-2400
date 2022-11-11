PVector a;
int offset = -50;

float x,y;
float ran;
float xs;


void setup(){
  size(800,800);
  rectMode(CENTER);
  
  ran = random(radians(360));
  noStroke();
  background(0);
  
  x = 100;
  y = 100;
  
  a = new PVector(100,100);
  
}

void draw(){
  //background(220);
  
  fill(255,165,0,random(100,200));
  translate(width/2,height/2);
  
  if(a.x>100){
    pushMatrix();
    rotate(0.3*frameCount);
    rect(a.x,a.y, 10,50);
    popMatrix();
    
    pushMatrix();
    fill(0);
    rotate(0.34*frameCount);
    rect(a.x,a.y, 10,50);
    popMatrix();
  }
  
  pushMatrix();
  rotate(0.34*frameCount);
  fill(255,165,0,200);
  rect(x,y,50,10);
  fill(0);
  rect(x-50,y,80,50);
  popMatrix();
  x++;
  
  if(x>600){
    x=200;
  }
  
  ++a.x;
  ++a.y;
  if(a.x>150){ 
    a.x = 100;
    a.y = 100;
    //noLoop();
  }
  
  
  println(a.x);
  
  
}

int iteration = 0;
PVector randomPos;
PVector randomColor;
int rectWH = 80;


void setup(){
  rectMode(CENTER);
  background(0);
  noFill();
  size(500,500);
}

void draw(){
  
  int chanceRotate = int(random(1,10));
  
  
  randomPos = new PVector(random(width),random(height));
  randomColor = new PVector(random(255),random(255),random(255));
  strokeWeight(random(0.5,4));
  pushMatrix();
  stroke(randomColor.x,randomColor.y,randomColor.z,random(10,255));
  translate(randomPos.x,randomPos.y);
  if((chanceRotate)==1||chanceRotate==2){
    rotate(radians(45));
  }
  rect(0,0,rectWH,rectWH);
  popMatrix();
  
  
  int chanceRepeat = int(random(1,10)); 
  if((chanceRepeat)==1||chanceRepeat==2){
    for(int i=0;i<int(random(1,100));i=i+int(random(1,10))){
      pushMatrix();
      int chanceRotate2 = int(random(1,10));
      translate(randomPos.x,randomPos.y);
      if((chanceRotate2)==1||chanceRotate2==2){
        rotate(radians(45));
      }
      else if((chanceRotate2)==4||chanceRotate2==5){
        rotate(radians(25));
      }
      else if((chanceRotate2)==7||chanceRotate2==8){
        rotate(radians(-25));
      }
      else
      rotate(radians(90));
      
      rect(0,0,rectWH-i,rectWH-i);
      popMatrix();
    }
  }
  
  if(iteration>=200){
    noLoop();
  }
  
  ++iteration;
}

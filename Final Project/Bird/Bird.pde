PImage world;
PImage clouds;
PImage clouds2;
PImage sun;
int savedTime;
float gravity = 0.4;
String s;
float c = 50;
int difficulty = 1;

birdObj bird;
pipeObj[] pipeArray;
pipeObj p;

void setup(){
  size(500, 500);
  world = loadImage("sky.png");
  clouds = loadImage("clouds.png");
  clouds2 = loadImage("clouds.png");
  sun = loadImage("sun.png");
  savedTime = millis();
  bird = new birdObj(60,height/2,60);
  pipeArray = new pipeObj[1];
  
  
  
  //p = new pipeObj();
}

void draw(){
  image(world, 0, 0);
  sun.resize(50,50);
  image(sun, width/2, 50);
  
  
  //pipe objects
  if(frameCount%120/difficulty==0){
    pipeObj p = new pipeObj();
    pipeArray = (pipeObj[])append(pipeArray,p);
  }
  
  for(int i=1;i<pipeArray.length;++i){
    pipeArray[i].show();
    pipeArray[i].move(difficulty);
    bird.Collide(new PVector(pipeArray[i].pipe1X,pipeArray[i].pipe1Y), pipeArray[i].pipe2Y);
  }
  
  
  ///////////////////////////////////collision test/////////////////////////////////////////////////////////////////////
  /*p.show();
  if(p.pipe1X != 200){
    p.move(1);
  }
  
  if((mouseX > p.pipe1X+51 && mouseY < p.pipe1Y+290 || mouseX > p.pipe1X+51 && mouseY > p.pipe2Y)&&mouseX<p.pipe1X+100){
    fill(255,0,0);
    println(p.pipe2Y);
  }
  else fill(255);
  ellipse(mouseX,mouseY,25,25);*/
  ///////////////////////////////////collision test/////////////////////////////////////////////////////////////////////
  c -= 0.3;
  
  //cloud objects
  clouds.resize(200,150);
  image(clouds, c, 10);
  clouds2.resize(200,150);
  image(clouds2, c+200, -40);
  
  if(c<-400){
    c = 500;
  }
  
  
  
  bird.playAnimation(true);
  bird.gravity();
  bird.fly();
  score();
  //increaseDifficulty();
  GameOver(bird);
}










class birdObj{
  
  int animCounter = 0;
  PImage[] birdAnim = new PImage[9];
  float xpos,ypos;
  int size;
  int timeBetweenFrames = 50;
  float forceCarry = 0;
  float externalForce = 5;
  boolean isBirdDead = false;
  
  birdObj(float xpos, float ypos, int size){
    this.xpos = xpos;
    this.ypos = ypos;
    this.size = size;
    
    
    for(int i=0;i<birdAnim.length;++i){
    birdAnim[i] = loadImage("000"+str(i+1)+".png");
   }
  }
  
  void playAnimation(boolean play){
    if(play){
      int passedTime = millis() - savedTime;
      
      if (passedTime > timeBetweenFrames) {
      savedTime = millis();
      ++animCounter;
      }
     if(animCounter==9){
     animCounter=0;
     }
  
     birdAnim[animCounter].resize(this.size,this.size);
     image(birdAnim[animCounter],this.xpos,this.ypos);
    }
  }
  
  void gravity(){
    forceCarry += gravity;
    this.ypos += forceCarry;
  }
  
  void fly(){
    die();
    if(keyPressed){
      if(key == ' '){
        forceCarry = -externalForce;
      }
    }
  }
  
  void Collide(PVector collisionObj, int Y2){
    if((this.xpos > collisionObj.x+15 && this.ypos < collisionObj.y+235 || this.xpos > collisionObj.x+51 && this.ypos > Y2-30)&&this.xpos<collisionObj.x+90){
      //println("hit");
      isBirdDead = true;
    }
  }
  
  void die(){
    if(this.ypos >= height){
      isBirdDead = true;
    }
  }

}







class pipeObj{
  
  PImage pipe1;
  PImage pipe2;
  int pipe1X,pipe1Y,pipe2X,pipe2Y;
  
  pipeObj(){
      pipe1 = loadImage("pipe.png");
      pipe2 = loadImage("pipe.png");
      pipe1X = width-20;
      pipe1Y = int(random(-200,0));
      pipe2X = pipe1X;
      pipe2Y = pipe1Y+int(random(400,500));
  }
  
  void show(){
    pipe1.resize(150,280);
    image(pipe1, pipe1X, pipe1Y);
    pipe2.resize(150,280);
    image(pipe2, pipe2X, pipe2Y);
  }
  
  void move(int speed){
    pipe1X -= speed;
    pipe2X = pipe1X;
  }
}








void GameOver(birdObj player){
  if(!player.isBirdDead){
    s = str(int(frameCount*0.2));
  }
  if(player.isBirdDead){
    fill(0);
    rect(0,0,width,height);
    textAlign(CENTER);
    textSize(50);
    fill(255);
    text("GAME OVER",width/2,height/2);
    text("SCORE: "+s,width/2,height/2+60);
  }
}






void score(){
  textAlign(CENTER);
  textSize(20);
  fill(0);
  text("SCORE: "+int(frameCount*0.2),width-70,50);
}




//working progress////////////////////
void increaseDifficulty(){
  if(frameCount>1000){
    difficulty = 2;
  }
  if(frameCount>2500){
    difficulty = 4;
  }

  if(frameCount>5000){
    difficulty = 8;
  }
}
//working progress////////////////////

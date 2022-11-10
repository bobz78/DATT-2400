
PVector point = new PVector(100,0);
PVector point2 = new PVector(150,0);
float lineX, lineY, lineX2, lineY2;

float rotationes;

float lo = 0;

void setup(){
  size(500,500);
  strokeWeight(10);
}

void draw(){
  background(220);
  translate(width/2,height/2);
  stroke(0,0,0);
  strokeWeight(10);
  point(0,0);
  
  rotationes = 80;
  
  PVector newPoint = rot(point.x,point.y,frameCount*0.01);
  PVector newPoint2 = rot(point2.x,point2.y,frameCount*0.01);
  //point(newPoint.x,newPoint.y);
  //point(newPoint2.x,newPoint2.y);
 
  
  if(frameCount*0.01<radians(rotationes)){
    lineX = newPoint.x;
    lineY = newPoint.y;
    lineX2 = newPoint2.x; 
    lineY2 = newPoint2.y;
    println(newPoint2.x,newPoint2.y);
  }
  
  
  line(lineX,lineY,lineX2,lineY2);
  lineX += (90-rotationes)/100;
  lineX2 += (90-rotationes)/100;
  lineY += rotationes/100;
  lineY2 += rotationes/100;
}



PVector rot(float x, float y, float degree){
  return new PVector(x*cos(degree)-y*sin(degree),x*sin(degree)-y*cos(degree));
}

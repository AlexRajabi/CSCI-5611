


//Root
Vec2 root = new Vec2(200,200);

//b0 root joint
float b0 = 50; 
float ab0 = 1.57; //Shoulder joint
//float old_a0 = a0;
//b1 root joint
float b1 = 50; 
float ab1 = 0; //Elbow joint
//float old_a1 = a1;

//l0 left arm 
float l0 = 50; 
float al0 = 0.5; //Shoulder joint
//float old_a0 = a0;
//l1 left arm 
float l1 = 50; 
float al1 = 0.5; //Elbow joint
//float old_a1 = a1;

//r0 right arm 
float r0 = 50; 
float ar0 = -1; //Shoulder joint
//float old_a0 = a0;
//r1 right arm 
float r1 = 50; 
float ar1 = -0.5; //Elbow joint
//float old_a1 = a1;




Vec2 start_b1,shared_root,start_l1,endPoint_l,start_r1,endPoint_r;


void setup(){
  size(640,480);
  surface.setTitle("Inverse Kinematics [CSCI 5611 Example]");
}



void solve(){
  Vec2 goal = new Vec2(mouseX, mouseY);
  //Vec2 goal = new Vec2(500, 50);
  
  Vec2 startToGoal, startToEndEffector;
  float dotProd, angleDiff;
  
  
  
     
  
  //Update elbow joint
  startToGoal = goal.minus(shared_root);
  startToEndEffector = endPoint_l.minus(shared_root);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  
  float old_al0 = al0;
  
  al0 = old_al0;
  if (cross(startToGoal,startToEndEffector) < 0){
    al0 += angleDiff;
  }
  else{
    al0 -= angleDiff;
  }
  
  if(al0 <= 0.5){
    al0 = 0.5;
  }
   
  fk();
      
  //angleDiff *= 0.5;
    
  
  
  
  
  //Update wrist joint
  startToGoal = goal.minus(start_l1);
  startToEndEffector = endPoint_l.minus(start_l1);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  
  //a2 = old_a2;
  float old_al1 = al1;
   
  al1 = old_al1;
  if (cross(startToGoal,startToEndEffector) < 0){
    al1 += angleDiff;
  }
  else{
    al1 -= angleDiff;
  }
  
  if(al1 <= 0.2){
    al1 = 0.2;
  }
      
  fk();
     
  //angleDiff *= 0.5;
      
  
  
   //Update elbow joint
  startToGoal = goal.minus(shared_root);
  startToEndEffector = endPoint_r.minus(shared_root);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  
  float old_ar0 = ar0;
  
  ar0 = old_ar0;
  if (cross(startToGoal,startToEndEffector) < 0){
    ar0 += angleDiff;
  }
  else{
    ar0 -= angleDiff;
  }
  
  if(ar0 <= -1){
    ar0 = -1;
  }
  
  fk();
      
  //angleDiff *= 0.5;
    
  
  
  //Update wrist joint
  startToGoal = goal.minus(start_r1);
  startToEndEffector = endPoint_r.minus(start_r1);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  
  //a2 = old_a2;
  float old_ar1 = ar1;
   
  ar1 = old_ar1;
  if (cross(startToGoal,startToEndEffector) < 0){
    ar1 += angleDiff;
  }
  else{
    ar1 -= angleDiff;
  }
  
  if(ar1 <= -0.5){
    ar1 = -0.5;
  }
      
  fk();
     
  //angleDiff *= 0.5;
      
//Update elbow joint
  startToGoal = goal.minus(root);
  if (startToGoal.length() < .0001) return;
  startToEndEffector = shared_root.minus(root);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  
  float old_ab0 = ab0;
  
  ab0 = old_ab0;
  if (cross(startToGoal,startToEndEffector) < 0){
    ab0 += angleDiff;
  }
  else{
    ab0 -= angleDiff;
  }
      
  fk();
      
  //angleDiff *= 0.5;
     
  
     //Update wrist joint
  startToGoal = goal.minus(start_b1);
  startToEndEffector = shared_root.minus(start_b1);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  
  //a2 = old_a2;
  float old_ab1 = ab1;
   
  ab1 = old_ab1;
  if (cross(startToGoal,startToEndEffector) < 0){
    ab1 += angleDiff;
  }
  else{
    ab1 -= angleDiff;
  }
      
  fk();
     
  //angleDiff *= 0.5;
     
  
 
  
}

void fk(){
  start_b1 = new Vec2(cos(ab0)*b0,sin(ab0)*b0).plus(root);
  shared_root = new Vec2(cos(ab0+ab1)*b1,sin(ab0+ab1)*b1).plus(start_b1);
  start_l1 = new Vec2(cos(ab0+ab1+al0)*l0,sin(ab0+ab1+al0)*l0).plus(shared_root);
  endPoint_l = new Vec2(cos(ab0+ab1+al0+al1)*l1,sin(ab0+ab1+al0+al1)*l1).plus(start_l1);
  start_r1 = new Vec2(cos(ab0+ab1+ar0)*r0,sin(ab0+ab1+ar0)*r0).plus(shared_root);
  endPoint_r = new Vec2(cos(ab0+ab1+ar0+ar1)*r1,sin(ab0+ab1+ar0+ar1)*r1).plus(start_r1);
}


boolean up_pressed = false;
boolean down_pressed = false;
boolean right_pressed = false;
boolean left_pressed = false;

void keyPressed(){
  
  if(keyCode == UP){
    up_pressed = true;
    //Circle_Center.y -= 10;
  }
  
  
  if(keyCode == DOWN){
    down_pressed = true;
    //Circle_Center.y += 10;
  }
  
  if(keyCode == RIGHT){
    right_pressed = true;
    //Circle_Center.x += 10;
  }
  
  if(keyCode == LEFT){
    left_pressed = true;
    //Circle_Center.x -= 10;
  }
  
  
  
}


void keyReleased(){
  
  if(keyCode == UP){
    up_pressed = false;
    //Circle_Center.y -= 10;
  }
  
  
  if(keyCode == DOWN){
    down_pressed = false;
    //Circle_Center.y += 10;
  }
  
  if(keyCode == RIGHT){
    right_pressed = false;
    //Circle_Center.x += 10;
  }
  
  if(keyCode == LEFT){
    left_pressed = false;
    //Circle_Center.x -= 10;
  }
  
  
  
}





float armW = 1;
void draw(){
  fk();
  solve();
  
  background(250,250,250);
  

  
  fill(255, 220, 185);
  //fill(200,0,180);
  pushMatrix();
  translate(root.x,root.y);
  rotate(ab0);
  rect(0, -armW/2, b0, armW);
  //quad(0, -armW/2 , l0 , -armW/5 , l0 , armW/5, 0, armW/2);
  popMatrix();
  
  pushMatrix();
  translate(start_b1.x,start_b1.y);
  rotate(ab0+ab1);
  rect(0, -armW/2, b1, armW);
  //quad(0, -armW/5 , l1 , -armW/8 , l1 , armW/8, 0, armW/5);
  popMatrix();
  
  pushMatrix();
  translate(shared_root.x,shared_root.y);
  rotate(ab0+ab1+al0);
  rect(0, -armW/2, l0, armW);
  //quad(0, -armW/2 , l0 , -armW/5 , l0 , armW/5, 0, armW/2);
  popMatrix();
  
  pushMatrix();
  translate(start_l1.x,start_l1.y);
  rotate(ab0+ab1+al0+al1);
  rect(0, -armW/2, l1, armW);
  //quad(0, -armW/5 , l1 , -armW/8 , l1 , armW/8, 0, armW/5);
  popMatrix();
  
  pushMatrix();
  translate(shared_root.x,shared_root.y);
  rotate(ab0+ab1+ar0);
  rect(0, -armW/2, r0, armW);
  //quad(0, -armW/2 , l0 , -armW/5 , l0 , armW/5, 0, armW/2);
  popMatrix();
  
  pushMatrix();
  translate(start_r1.x,start_r1.y);
  rotate(ab0+ab1+ar0+ar1);
  rect(0, -armW/2, r1, armW);
  //quad(0, -armW/5 , l1 , -armW/8 , l1 , armW/8, 0, armW/5);
  popMatrix();
  
  
 
  
  pushMatrix();
  //translate(250,250);
  translate(mouseX, mouseY);
  circle(0, 0, 5);
  //quad(0, -armW/8 , l2 , -armW/10 , l2 , armW/10, 0, armW/8);
  popMatrix();
  
  
  
}



//-----------------
// Vector Library
//-----------------

//Vector Library
//CSCI 5611 Vector 2 Library [Example]
// Stephen J. Guy <sjguy@umn.edu>

public class Vec2 {
  public float x, y;
  
  public Vec2(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  public String toString(){
    return "(" + x+ "," + y +")";
  }
  
  public float length(){
    return sqrt(x*x+y*y);
  }
  
  public float lengthSqr(){
    return x*x+y*y;
  }
  
  public Vec2 plus(Vec2 rhs){
    return new Vec2(x+rhs.x, y+rhs.y);
  }
  
  public void add(Vec2 rhs){
    x += rhs.x;
    y += rhs.y;
  }
  
  public Vec2 minus(Vec2 rhs){
    return new Vec2(x-rhs.x, y-rhs.y);
  }
  
  public void subtract(Vec2 rhs){
    x -= rhs.x;
    y -= rhs.y;
  }
  
  public Vec2 times(float rhs){
    return new Vec2(x*rhs, y*rhs);
  }
  
  public void mul(float rhs){
    x *= rhs;
    y *= rhs;
  }
  
  public void clampToLength(float maxL){
    float magnitude = sqrt(x*x + y*y);
    if (magnitude > maxL){
      x *= maxL/magnitude;
      y *= maxL/magnitude;
    }
  }
  
  public void setToLength(float newL){
    float magnitude = sqrt(x*x + y*y);
    x *= newL/magnitude;
    y *= newL/magnitude;
  }
  
  public void normalize(){
    float magnitude = sqrt(x*x + y*y);
    x /= magnitude;
    y /= magnitude;
  }
  
  public Vec2 normalized(){
    float magnitude = sqrt(x*x + y*y);
    return new Vec2(x/magnitude, y/magnitude);
  }
  
  public float distanceTo(Vec2 rhs){
    float dx = rhs.x - x;
    float dy = rhs.y - y;
    return sqrt(dx*dx + dy*dy);
  }
}

Vec2 interpolate(Vec2 a, Vec2 b, float t){
  return a.plus((b.minus(a)).times(t));
}

float interpolate(float a, float b, float t){
  return a + ((b-a)*t);
}

float dot(Vec2 a, Vec2 b){
  return a.x*b.x + a.y*b.y;
}

float cross(Vec2 a, Vec2 b){
  return a.x*b.y - a.y*b.x;
}


Vec2 projAB(Vec2 a, Vec2 b){
  return b.times(a.x*b.x + a.y*b.y);
}

float clamp(float f, float min, float max){
  if (f < min) return min;
  if (f > max) return max;
  return f;
}

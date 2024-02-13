


//Root
Vec2 root = new Vec2(50,50);

//Upper Arm
float l0 = 100; 
float a0 = 0.3; //Shoulder joint
//float old_a0 = a0;
//Lower Arm
float l1 = 100; 
float a1 = 0.3; //Elbow joint
//float old_a1 = a1;
//Hand
float l2 = 100;
float a2 = 0.3; //Wrist joint
//float old_a2 = a2;



Vec2 start_l1,start_l2,endPoint;

// Circle Obstacle
Vec2 Circle_Center = new Vec2(175,375);
float Circle_Radius = 20;

// Box Obstacle
float box_center_x = 100; 
float box_center_y = 120;
float box_height = 50;
float box_width = 80;


// joints
float wrist_speed_coef = 0.1;
float elbow_speed_coef = 0.1;
float shoulder_speed_coef = 0.1;

float wrist_angle_coef = 2;
float elbow_angle_coef = 1;
float shoulder_angle_coef = 1;



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



class hitInfo{
  public boolean hit = false;
  public float t = 9999999;
}

hitInfo SameSideTest(float line_x_start , float line_y_start , float line_x_end , float line_y_end , float first_point_x_start , float first_point_y_start , float second_point_x_end , float second_point_y_end){
  
  hitInfo hit = new hitInfo();
  
  Vec2 line_start = new Vec2(line_x_start , line_y_start);
  Vec2 line_end = new Vec2(line_x_end , line_y_end);
  
  Vec2 first_point = new Vec2(first_point_x_start , first_point_y_start);
  Vec2 second_point = new Vec2(second_point_x_end , second_point_y_end);
  
  
  Vec2 line_dir = line_end.minus(line_start);
  
  Vec2 first_vector = first_point.minus(line_start);
  Vec2 second_vector = second_point.minus(line_start);
  
  float cp1 = cross(line_dir , first_vector);
  float cp2 = cross(line_dir , second_vector);
  
  if((cp1 * cp2) <= 0){
    //side.SameSide = false;
    //print("Same Side!");
    hit.hit = false;
  }
  
  else{
    //side.SameSide = true;
    //print("Different Sides!");
    hit.hit = true;
  }
  
  return hit;
  
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


hitInfo LineLineCollision(float first_line_x_start , float first_line_y_start , float first_line_x_end , float first_line_y_end , float second_line_x_start , float second_line_y_start , float second_line_x_end , float second_line_y_end){
  
//  //sideInfo Colliding = new sideInfo();
  hitInfo hit = new hitInfo();
  
  if(SameSideTest(first_line_x_start , first_line_y_start , first_line_x_end , first_line_y_end , second_line_x_start , second_line_y_start , second_line_x_end , second_line_y_end).hit == false && SameSideTest(second_line_x_start , second_line_y_start , second_line_x_end , second_line_y_end , first_line_x_start , first_line_y_start , first_line_x_end , first_line_y_end).hit == false){
     
    hit.hit = true;
    //  //  //Colliding.SameSide
    //  //print("No Collision!");
    //  return true;
  }
  
  else{
    hit.hit = false;
  }
    
  return hit;
  
}



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




hitInfo LineBoxCollision(float first_line_x_start , float first_line_y_start , float first_line_x_end , float first_line_y_end , float box_center_x , float box_center_y , float box_width , float box_height){
  
  hitInfo hit = new hitInfo();
  
  float up_left_corner_x = box_center_x - (box_width)/2;
  float up_left_corner_y = box_center_y - (box_height)/2;
  
  float down_right_corner_x = box_center_x + (box_width)/2;
  float down_right_corner_y = box_center_y + (box_height)/2;
  
  if(first_line_x_start >= up_left_corner_x && first_line_x_start <= down_right_corner_x && first_line_x_end >= up_left_corner_x && first_line_x_end <= down_right_corner_x && first_line_y_start >= up_left_corner_y && first_line_y_start <= down_right_corner_y && first_line_y_end >= up_left_corner_y && first_line_y_end <= down_right_corner_y){
    hit.hit = true; 
  }
  
  else if(LineLineCollision(first_line_x_start , first_line_y_start , first_line_x_end , first_line_y_end , up_left_corner_x , up_left_corner_y , up_left_corner_x , down_right_corner_y).hit == true){
   hit.hit = true; 
  }
  
  else if(LineLineCollision(first_line_x_start , first_line_y_start , first_line_x_end , first_line_y_end , up_left_corner_x , up_left_corner_y , down_right_corner_x , up_left_corner_y).hit == true){
   hit.hit = true; 
  }
  
  else if(LineLineCollision(first_line_x_start , first_line_y_start , first_line_x_end , first_line_y_end , up_left_corner_x , down_right_corner_y , down_right_corner_x , down_right_corner_y).hit == true){
   hit.hit = true; 
  }
  
  else if(LineLineCollision(first_line_x_start , first_line_y_start , first_line_x_end , first_line_y_end , down_right_corner_x , up_left_corner_y , down_right_corner_x , down_right_corner_y).hit == true){
   hit.hit = true; 
  }
  
  else{
    hit.hit = false;
  }
  
  return hit;
  
}
  

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


hitInfo BoxBoxCollision(float first_box_center_x , float first_box_center_y , float first_box_width , float first_box_height , float second_box_center_x , float second_box_center_y , float second_box_width , float second_box_height){
  
  hitInfo hit = new hitInfo();
  
  if(abs(first_box_center_y - second_box_center_y) <= ((first_box_height + second_box_height)/2) && abs(first_box_center_x - second_box_center_x) <= ((first_box_width + second_box_width)/2)){
    hit.hit = true;
    //print("Collision Detected");
  }
  
  else{
    hit.hit = false;
    //print("NO Collision!");
  }
  
  
  return hit;
  
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////









boolean SingleCollisionFunction(){
  // Vector representing the wrist joint
  Vec2 dir_wrist = endPoint.minus(start_l2);
  Vec2 dir_wrist_norm = dir_wrist.normalized();
  float proj_wrist = dot(Circle_Center.minus(start_l2), dir_wrist_norm);
  Vec2 closest_wrist;
  if (proj_wrist < 0) {
    closest_wrist = start_l2;
  } else if (proj_wrist > dir_wrist.length()) {
    closest_wrist = endPoint;
  } else {
    closest_wrist = start_l2.plus(dir_wrist_norm.times(proj_wrist));
  }
  // Check if the ball is close enough to the line segment
  dir_wrist = Circle_Center.minus(closest_wrist);
  float dist_wrist = dir_wrist.length();
  //if (dist_wrist > Circle_Radius + 0.1) {
  //  return false;
  //}
  
  //else{
  //  return true;
  //}
    
    
    
  // Vector representing the wrist joint
  Vec2 dir_elbow = start_l2.minus(start_l1);
  Vec2 dir_elbow_norm = dir_elbow.normalized();
  float proj_elbow = dot(Circle_Center.minus(start_l1), dir_elbow_norm);
  Vec2 closest_elbow;
  if (proj_elbow < 0) {
    closest_elbow = start_l1;
  } else if (proj_elbow > dir_elbow.length()) {
    closest_elbow = start_l2;
  } else {
    closest_elbow = start_l1.plus(dir_elbow_norm.times(proj_elbow));
  }
  // Check if the ball is close enough to the line segment
  dir_elbow = Circle_Center.minus(closest_elbow);
  float dist_elbow = dir_elbow.length();
  
  
  
  Vec2 dir_shoulder = start_l1.minus(root);
  Vec2 dir_shoulder_norm = dir_shoulder.normalized();
  float proj_shoulder = dot(Circle_Center.minus(root), dir_shoulder_norm);
  Vec2 closest_shoulder;
  if (proj_shoulder < 0) {
    closest_shoulder = root;
  } else if (proj_shoulder > dir_shoulder.length()) {
    closest_shoulder = start_l1;
  } else {
    closest_shoulder = root.plus(dir_shoulder_norm.times(proj_shoulder));
  }
  // Check if the ball is close enough to the line segment
  dir_shoulder = Circle_Center.minus(closest_shoulder);
  float dist_shoulder = dir_shoulder.length();
  
  
  
  if (dist_wrist <= Circle_Radius || dist_elbow <= Circle_Radius || dist_shoulder <= Circle_Radius || LineBoxCollision(start_l2.x , start_l2.y , endPoint.x , endPoint.y , box_center_x , box_center_y , box_width , box_height).hit == true || LineBoxCollision(start_l1.x , start_l1.y , start_l2.x , start_l2.y , box_center_x , box_center_y , box_width , box_height).hit == true || LineBoxCollision(root.x , root.y , start_l1.x , start_l1.y , box_center_x , box_center_y , box_width , box_height).hit == true) {
    //println("TRUE");
    //closest_wrist = start_l2.plus(dir_wrist.normalized().times(1.01*dist_wrist));
    //closest_elbow = start_l1.plus(dir_elbow.normalized().times(1.01*dist_elbow));
    //closest_shoulder = root.plus(dir_shoulder.normalized().times(1.01*dist_shoulder));
    return true;
  }
  
  //if (dist_elbow < Circle_Radius) {
  //  return true;
  //}
  
  //if (dist_shoulder < Circle_Radius) {
  //  return true;
  //}
    
  else{
    //println("FALSE");
    return false;
  }
        
}






void setup(){
  size(640,480);
  surface.setTitle("Inverse Kinematics [CSCI 5611 Example]");
}



void solve(){
  Vec2 goal = new Vec2(mouseX, mouseY);
  //Vec2 goal = new Vec2(250, 250);
  
  Vec2 startToGoal, startToEndEffector;
  float dotProd, angleDiff;
  
  //Update wrist joint
  startToGoal = goal.minus(start_l2);
  startToEndEffector = endPoint.minus(start_l2);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  
  //a2 = old_a2;
   float old_a2 = a2;
   do{
     a2 = old_a2;
     if (cross(startToGoal,startToEndEffector) < 0){
        a2 += wrist_speed_coef*angleDiff;
      }
      else{
        a2 -= wrist_speed_coef*angleDiff;
      }
      
      
      if(a2 > wrist_angle_coef){
        a2 = wrist_angle_coef;
      }
      
      if(a2 < -wrist_angle_coef){
        a2 = -wrist_angle_coef;
      }
      
      
      fk();
      
     
      
      angleDiff *= 0.5;
      
   
      //println(SingleCollisionFunction());
    } while(SingleCollisionFunction() == true);
  
  //println(SingleCollisionFunction());
 
  
  //Update elbow joint
  startToGoal = goal.minus(start_l1);
  startToEndEffector = endPoint.minus(start_l1);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  
  float old_a1 = a1;
  do{
     a1 = old_a1;
     if (cross(startToGoal,startToEndEffector) < 0){
        a1 += elbow_speed_coef*angleDiff;
      }
      else{
        a1 -= elbow_speed_coef*angleDiff;
      }
      
      if(a1 > elbow_angle_coef){
        a1 = elbow_angle_coef;
      }
      
      if(a1 < -elbow_angle_coef){
        a1 = -elbow_angle_coef;
      }
      
      fk();
      
      angleDiff *= 0.5;
    
    } while(SingleCollisionFunction() == true);
  
  
  
  //Update shoulder joint
  startToGoal = goal.minus(root);
  if (startToGoal.length() < .0001) return;
  startToEndEffector = endPoint.minus(root);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  
  float old_a0 = a0;
  do{
     a0 = old_a0;
     if (cross(startToGoal,startToEndEffector) < 0){
        a0 += shoulder_speed_coef*angleDiff;
      }
      else{
        a0 -= shoulder_speed_coef*angleDiff;
      }
      
      if(a0 > shoulder_angle_coef){
        a0 = shoulder_angle_coef;
      }
      
      if(a0 < -shoulder_angle_coef){
        a0 = -shoulder_angle_coef;
      }
      
      fk();
      
      angleDiff *= 0.5;
    
    } while(SingleCollisionFunction() == true);
  
  //println(SingleCollisionFunction());
  
  //if (cross(startToGoal,startToEndEffector) < 0)
  //  a0 += coef_arm*angleDiff;
  //else
  //  a0 -= coef_arm*angleDiff;
    
  ///*TODO: Shoulder joint limits here*/
  
  //if(a0 >= 1.5708){
  //  a0 = 1.5708;
  //}
  
  //if(a0 <= 0){
  //  a0 = 0;
  //}
  
  
  
  
  //fk(); //Update link positions with fk (e.g. end effector changed)
 
  //ball_arm_joint_collision();
 
 
  //println("Angle 0:",a0,"Angle 1:",a1,"Angle 2:",a2);
}

void fk(){
  start_l1 = new Vec2(cos(a0)*l0,sin(a0)*l0).plus(root);
  start_l2 = new Vec2(cos(a0+a1)*l1,sin(a0+a1)*l1).plus(start_l1);
  endPoint = new Vec2(cos(a0+a1+a2)*l2,sin(a0+a1+a2)*l2).plus(start_l2);
}


boolean up_pressed = false;
boolean down_pressed = false;
boolean right_pressed = false;
boolean left_pressed = false;
boolean box_key = false;
boolean circle_key = false;

void keyPressed(){
  
  if(key == 'b'){
    box_key = true;
  }
  
  if(key == 'c'){
    circle_key = true;
  }
  
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
  
  if(key == 'c'){
    box_key = false;
  }
  
  if(key == 'b'){
    circle_key = false;
  }
  
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





float armW = 0.1;
void draw(){
  fk();
  solve();
  
  background(250,250,250);
  

  
  fill(255, 220, 185);
  //fill(200,0,180);
  pushMatrix();
  translate(root.x,root.y);
  rotate(a0);
  rect(0, -armW/2, l0, armW);
  //quad(0, -armW/2 , l0 , -armW/5 , l0 , armW/5, 0, armW/2);
  popMatrix();
  
  pushMatrix();
  translate(start_l1.x,start_l1.y);
  rotate(a0+a1);
  rect(0, -armW/2, l1, armW);
  //quad(0, -armW/5 , l1 , -armW/8 , l1 , armW/8, 0, armW/5);
  popMatrix();
  
  pushMatrix();
  translate(start_l2.x,start_l2.y);
  rotate(a0+a1+a2);
  rect(0, -armW/2, l2, armW);
  //quad(0, -armW/8 , l2 , -armW/10 , l2 , armW/10, 0, armW/8);
  popMatrix();
  if(circle_key){
    if(up_pressed){
      Circle_Center.y -= 1;
    }
    
    if(down_pressed){
      Circle_Center.y += 1;
    }
    
    if(right_pressed){
      Circle_Center.x += 1;
    }
    
    if(left_pressed){
      Circle_Center.x -= 1;
    }
  }
  
  if(box_key){
    if(up_pressed){
      box_center_y -= 1;
    }
    
    if(down_pressed){
      box_center_y += 1;
    }
    
    if(right_pressed){
      box_center_x += 1;
    }
    
    if(left_pressed){
      box_center_x -= 1;
    }
  }
  
  
  pushMatrix();
  translate(Circle_Center.x,Circle_Center.y);
  //if(SingleCollisionFunction() == true){
  //  fill(255,0,0);
  //  if(up_pressed){
  //  Circle_Center.y -= 5;
  //  }
    
  //  if(down_pressed){
  //    Circle_Center.y += 5;
  //  }
    
  //  if(right_pressed){
  //    Circle_Center.x += 5;
  //  }
    
  //  if(left_pressed){
  //    Circle_Center.x -= 5;
      
  //  }
  //}
  circle(0, 0, Circle_Radius*2); 
  //quad(0, -armW/8 , l2 , -armW/10 , l2 , armW/10, 0, armW/8);
  popMatrix();
  
  pushMatrix();
  translate(box_center_x - box_width/2 , box_center_y - box_height/2);
  //if(SingleCollisionFunction() == true){
  //  fill(255,0,0);
  //  if(up_pressed){
  //  Circle_Center.y -= 5;
  //  }
    
  //  if(down_pressed){
  //    Circle_Center.y += 5;
  //  }
    
  //  if(right_pressed){
  //    Circle_Center.x += 5;
  //  }
    
  //  if(left_pressed){
  //    Circle_Center.x -= 5;
      
  //  }
  //}
  //circle(0, 0, Circle_Radius*2);
  rect(0 , 0 , box_width , box_height);
  //quad(0, -armW/8 , l2 , -armW/10 , l2 , armW/10, 0, armW/8);
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

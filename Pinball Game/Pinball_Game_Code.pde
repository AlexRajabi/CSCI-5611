import processing.sound.*;



// MODIFICATION STARTS //

int numBalls = 1;
Vec2 pos[] = new Vec2[numBalls];
Vec2 vel[] = new Vec2[numBalls];
float radius[] = new float[numBalls];
float mass[] = new float[numBalls];
boolean isFlippingLeft = false;
boolean isFlippingRight = false;
boolean isFlippingLeftBackwards = false;
boolean isFlippingRightBackwards = false;

Vec2 first_line_start = new Vec2(277 , 420);
Vec2 first_line_end = new Vec2(277 , 447);
Vec2 second_line_start = new Vec2(277 , 447);
Vec2 second_line_end = new Vec2(389 , 447);
Vec2 third_line_start = new Vec2(389 , 447);
Vec2 third_line_end = new Vec2(389 , 420);
Vec2 forth_line_start = new Vec2(389 , 420);
Vec2 forth_line_end = new Vec2(277 , 420);

Vec2 fifth_line_start = new Vec2(110,0);
Vec2 fifth_line_end = new Vec2(110,700);

Vec2 sixth_line_start = new Vec2(110,700);
Vec2 sixth_line_end = new Vec2(290,815);


Vec2 seventh_line_start = new Vec2(375,815);
Vec2 seventh_line_end = new Vec2(554,700);


Vec2 eighth_line_start = new Vec2(554,771);
Vec2 eighth_line_end = new Vec2(554,350);


Vec2 ninth_line_start = new Vec2(554,771);
Vec2 ninth_line_end = new Vec2(601,771);

Vec2 tenth_line_start = new Vec2(601,771);
Vec2 tenth_line_end = new Vec2(601,0);


Vec2 eleventh_line_start = new Vec2(452,493);
Vec2 eleventh_line_end = new Vec2(525,450);



Vec2 twelveth_line_start = new Vec2(525,450);
Vec2 twelveth_line_end = new Vec2(520,345);


Vec2 thirteenth_line_start = new Vec2(452,493);
Vec2 thirteenth_line_end = new Vec2(520,345);


Vec2 fourteenth_line_start = new Vec2(153,700);
Vec2 fourteenth_line_end = new Vec2(223,743);


Vec2 fifteenth_line_start = new Vec2(153,700);
Vec2 fifteenth_line_end = new Vec2(169,675);


Vec2 sixteenth_line_start = new Vec2(169,675);
Vec2 sixteenth_line_end = new Vec2(243,718);


Vec2 seventeenth_line_start = new Vec2(218,738);
Vec2 seventeenth_line_end = new Vec2(233,715);


Vec2 eighteenth_line_start = new Vec2(445,742);
Vec2 eighteenth_line_end = new Vec2(515,700);

Vec2 ninteenth_line_start = new Vec2(515,700);
Vec2 ninteenth_line_end = new Vec2(498,675);

Vec2 twentyth_line_start = new Vec2(498,675);
Vec2 twentyth_line_end = new Vec2(430,718);

Vec2 twentyfirst_line_start = new Vec2(435,713);
Vec2 twentyfirst_line_end = new Vec2(450,737);





// Ball Objects //

Vec2 first_ball_object_pos = new Vec2(331,570);
float first_ball_object_radius = 24;
Vec2 first_ball_object_vel = new Vec2(0,0);


//Vec2 second_ball_object_pos = new Vec2(246,583);
//float second_ball_object_radius = 24;
//Vec2 second_ball_object_vel = new Vec2(0,0);


Vec2 third_ball_object_pos = new Vec2(172,626);
float third_ball_object_radius = 24;
Vec2 third_ball_object_vel = new Vec2(0,0);


//Vec2 forth_ball_object_pos = new Vec2(416,583);
//float forth_ball_object_radius = 24;
//Vec2 forth_ball_object_vel = new Vec2(0,0);


Vec2 fifth_ball_object_pos = new Vec2(490.5,626);
float fifth_ball_object_radius = 24;
Vec2 fifth_ball_object_vel = new Vec2(0,0);


Vec2 sixth_ball_object_pos = new Vec2(331,339);
float sixth_ball_object_radius = 45;
Vec2 sixth_ball_object_vel = new Vec2(0,0);


Vec2 seventh_ball_object_pos = new Vec2(218,268);
float seventh_ball_object_radius = 45;
Vec2 seventh_ball_object_vel = new Vec2(0,0);


Vec2 eighth_ball_object_pos = new Vec2(445,268);
float eighth_ball_object_radius = 45;
Vec2 eighth_ball_object_vel = new Vec2(0,0);

Vec2 ninth_ball_object_pos = new Vec2(331.5,253);
float ninth_ball_object_radius = 20;
Vec2 ninth_ball_object_vel = new Vec2(0,0);

Vec2 tenth_ball_object_pos = new Vec2(332,92);
float tenth_ball_object_radius = 20;
Vec2 tenth_ball_object_vel = new Vec2(0,0);

Vec2 eleventh_ball_object_pos = new Vec2(249,123);
float eleventh_ball_object_radius = 20;
Vec2 eleventh_ball_object_vel = new Vec2(0,0);


Vec2 twelveth_ball_object_pos = new Vec2(415,123);
float twelveth_ball_object_radius = 20;
Vec2 twelveth_ball_object_vel = new Vec2(0,0);





// MODIFICATION ENDS //




Vec2 gravity = new Vec2(0,200);

// Ball
float ball_radius = 10;
Vec2 first_ball_pos = new Vec2(575,670);
Vec2 first_ball_vel = new Vec2(50,-50);

Vec2 second_ball_pos = new Vec2(575,630);
Vec2 second_ball_vel = new Vec2(50,-50);

Vec2 third_ball_pos = new Vec2(575,590);
Vec2 third_ball_vel = new Vec2(50,-50);

// Line segment
Vec2 Left_flipper_base = new Vec2(233,732);
Vec2 Right_flipper_base = new Vec2(435,732);

float min_angle = -0.6;
float max_angle = 0.55;
float angle_left = max_angle;
float angle_right = max_angle;
float line_length = 80;
//float angular_velocity = -2.0;
//float angular_velocity_left = -2.0;
//float angular_velocity_right = 2.0;
float angular_velocity_left = 0;
float angular_velocity_right = 0;
float magnitude_angular_velocity = 8;
float angular_velocity_line_object = 0;

float score = 0;


class hitInfo{
  public boolean hit = false;
  public float t = 9999999;
  public Vec2 Collision_Point = new Vec2(0,0);
}




hitInfo CircleCircleCollision(float first_circle_x_pos , float first_circle_y_pos , float first_circle_radius , float second_circle_x_pos , float second_circle_y_pos , float second_circle_radius){
  
  hitInfo hit = new hitInfo();
  
  Vec2 FirstCircleCenter = new Vec2(0.0 , 0.0);
  
  FirstCircleCenter.x = first_circle_x_pos;
  
  FirstCircleCenter.y = first_circle_y_pos;
  
  Vec2 SecondCircleCenter = new Vec2(0.0 , 0.0);
  
  SecondCircleCenter.x = second_circle_x_pos;
  
  SecondCircleCenter.y = second_circle_y_pos;
  
  Vec2 dist = FirstCircleCenter.minus(SecondCircleCenter);
  
  if(dist.length() <= first_circle_radius + second_circle_radius){
    hit.hit = true;
    //print("Collision Detected!");
  }
  
  else{
    hit.hit = false;
    //print("NO Collision!");
  }
  
  return hit;
  
}






Vec2 getTip_Left(){
  // Compute tip as a function of angle and line_length
  Vec2 tip = new Vec2(0,0);
  tip.x = Left_flipper_base.x + line_length*cos(angle_left);
  tip.y = Left_flipper_base.y + line_length*sin(angle_left);
  return tip;
}

Vec2 getTip_Right(){
  // Compute tip as a function of angle and line_length
  Vec2 tip = new Vec2(0,0);
  tip.x = Right_flipper_base.x - line_length*cos(angle_right);
  tip.y = Right_flipper_base.y + line_length*sin(angle_right);
  return tip;
}

//Vec2 getTip_Line_object(){
//  // Compute tip as a function of angle and line_length
//  Vec2 tip = new Vec2(0,0);
//  tip.x = Left_flipper_base.x + line_length*cos(angle_left);
//  tip.y = Left_flipper_base.y + line_length*sin(angle_left);
//  return tip;
//}

void resetBalls(){
  
  
  if(first_ball_pos.y < ninth_line_start.y && first_ball_pos.y > 350 && first_ball_pos.x >= ninth_line_start.x && first_ball_pos.x <= ninth_line_end.x){
    
    first_ball_pos = new Vec2(575,670);
    first_ball_vel = new Vec2(300,-500);

    second_ball_pos = new Vec2(575,630);
    second_ball_vel = new Vec2(300,-500);

    third_ball_pos = new Vec2(575,590);
    third_ball_vel = new Vec2(300,-500);
    
    score = 0;

    
  }
  
  if(second_ball_pos.y < ninth_line_start.y && second_ball_pos.y > 350 && second_ball_pos.x >= ninth_line_start.x && second_ball_pos.x <= ninth_line_end.x){
    
    first_ball_pos = new Vec2(575,670);
    first_ball_vel = new Vec2(300,-500);

    second_ball_pos = new Vec2(575,630);
    second_ball_vel = new Vec2(300,-500);

    third_ball_pos = new Vec2(575,590);
    third_ball_vel = new Vec2(300,-500);
    
    score = 0;
    
  }
  
  if(third_ball_pos.y < ninth_line_start.y && third_ball_pos.y > 350 && third_ball_pos.x >= ninth_line_start.x && third_ball_pos.x <= ninth_line_end.x){
    
    first_ball_pos = new Vec2(575,670);
    first_ball_vel = new Vec2(300,-500);

    second_ball_pos = new Vec2(575,630);
    second_ball_vel = new Vec2(300,-500);

    third_ball_pos = new Vec2(575,590);
    third_ball_vel = new Vec2(300,-500);
    
    score = 0;
    
  }




  if(first_ball_pos.y > height + ball_radius && second_ball_pos.y > height + ball_radius && third_ball_pos.y > height + ball_radius){
    
    first_ball_pos = new Vec2(575,670);
    first_ball_vel = new Vec2(300,-500);

    second_ball_pos = new Vec2(575,630);
    second_ball_vel = new Vec2(300,-500);

    third_ball_pos = new Vec2(575,590);
    third_ball_vel = new Vec2(300,-500);
    
    score = 0;
    
  }
  
}



///////// CIRCLE - CIRCLE COLLISION AND BOUNCING OFF /////////


void circles_collisions(Vec2 first_circle_pos , Vec2 first_circle_vel , Vec2 second_circle_pos , Vec2 second_circle_vel){
  
  float cor = 0.8;
  Vec2 delta = first_circle_pos.minus(second_circle_pos);
  float dist = delta.length();
  if (dist < ball_radius + ball_radius){
    // Move balls out of collision
    float overlap = 0.5f * (dist - ball_radius - ball_radius);
    first_circle_pos.subtract(delta.normalized().times(overlap));
    second_circle_pos.add(delta.normalized().times(overlap));


    // Collision
    Vec2 dir = delta.normalized();
    float v1 = dot(first_circle_vel , dir);
    float v2 = dot(second_circle_vel , dir);
    float m1 = 1;
    float m2 = 1;
    // Pseudo-code for collision response
    // new_v1 = (m1 * v1 + m2 * v2 - m2 * (v1 - v2) * cor) / (m1 + m2)
    // new_v2 = (m1 * v1 + m2 * v2 - m1 * (v2 - v1) * cor) / (m1 + m2)
    // ball1.vel += dir * (new_v1 - v1) # Add the change in velocity along the collision axis
    // ball2.vel += dir * (new_v2 - v2) #  ... collisions only affect velocity along this axis!
    // TODO: Implement the above pseudo-code
    // vel[i] = new Vec2(0,0); // Replace with correct collisions response velocity
    // vel[j] = new Vec2(0,0); // Replace with correct collisions response velocity
    float new_v1 = ((m1 * v1) + (m2 * v2) - (m2 * (v1 - v2) * cor))/(m1 + m2);
    first_circle_vel.add(dir.times(new_v1 - v1));
        
    float new_v2 = ((m1 * v1) + (m2 * v2) - (m1 * (v2 - v1) * cor))/(m1 + m2);
    second_circle_vel.add(dir.times(new_v2 - v2));
  }  
  
  
}



void circles_objects_collisions(Vec2 first_circle_pos , Vec2 first_circle_vel , float first_circle_radius , Vec2 second_circle_pos , Vec2 second_circle_vel , float second_circle_radius){
  
  float cor = 0.8;
  Vec2 delta = first_circle_pos.minus(second_circle_pos);
  float dist = delta.length();
  if (dist < first_circle_radius + second_circle_radius){
    // Move balls out of collision
    float overlap = 0.5f * (dist - first_circle_radius - second_circle_radius);
    first_circle_pos.subtract(delta.normalized().times(overlap));
    second_circle_pos.add(delta.normalized().times(overlap));


    // Collision
    Vec2 dir = delta.normalized();
    float v1 = dot(first_circle_vel , dir);
    float v2 = dot(second_circle_vel , dir);
    float m1 = 1;
    //float m2 = 100000000;
    // Pseudo-code for collision response
    // new_v1 = (m1 * v1 + m2 * v2 - m2 * (v1 - v2) * cor) / (m1 + m2)
    // new_v2 = (m1 * v1 + m2 * v2 - m1 * (v2 - v1) * cor) / (m1 + m2)
    // ball1.vel += dir * (new_v1 - v1) # Add the change in velocity along the collision axis
    // ball2.vel += dir * (new_v2 - v2) #  ... collisions only affect velocity along this axis!
    // TODO: Implement the above pseudo-code
    // vel[i] = new Vec2(0,0); // Replace with correct collisions response velocity
    // vel[j] = new Vec2(0,0); // Replace with correct collisions response velocity
    //float new_v1 = ((m1 * v1) + (m2 * v2) - (m2 * (v1 - v2) * cor))/(m1 + m2);
    float new_v1 = v2 - ((v1 - v2) * cor);
    first_circle_vel.add(dir.times(new_v1 - v1));
        
     
    //float new_v2 = ((m1 * v1) + (m2 * v2) - (m1 * (v2 - v1) * cor))/(m1 + m2);
    //float new_v2 = v2;
    //second_circle_vel.add(dir.times(new_v2 - v2));
  }  
  
  
}












//// Balls - First Line Object Collision ////




void first_ball_first_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = first_line_end.minus(first_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(first_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = first_line_start;
    } else if (proj > dir.length()) {
      closest = first_line_end;
    } else {
      closest = first_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(first_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_first_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = first_line_end.minus(first_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(first_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = first_line_start;
    } else if (proj > dir.length()) {
      closest = first_line_end;
    } else {
      closest = first_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(first_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_first_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = first_line_end.minus(first_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(first_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = first_line_start;
    } else if (proj > dir.length()) {
      closest = first_line_end;
    } else {
      closest = first_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(first_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}




//// Balls - Second Line Object Collision ////




void first_ball_second_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = second_line_end.minus(second_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(second_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = second_line_start;
    } else if (proj > dir.length()) {
      closest = second_line_end;
    } else {
      closest = second_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(second_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_second_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = second_line_end.minus(second_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(second_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = second_line_start;
    } else if (proj > dir.length()) {
      closest = second_line_end;
    } else {
      closest = second_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(second_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_second_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = second_line_end.minus(second_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(second_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = second_line_start;
    } else if (proj > dir.length()) {
      closest = second_line_end;
    } else {
      closest = second_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(second_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}




//// Balls - Third Line Object Collision ////




void first_ball_third_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = third_line_end.minus(third_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(third_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = third_line_start;
    } else if (proj > dir.length()) {
      closest = third_line_end;
    } else {
      closest = third_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(third_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_third_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = third_line_end.minus(third_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(third_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = third_line_start;
    } else if (proj > dir.length()) {
      closest = third_line_end;
    } else {
      closest = third_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(third_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_third_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = third_line_end.minus(third_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(third_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = third_line_start;
    } else if (proj > dir.length()) {
      closest = third_line_end;
    } else {
      closest = third_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(third_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}



//// Balls - Forth Line Object Collision ////




void first_ball_forth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = forth_line_end.minus(forth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(forth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = forth_line_start;
    } else if (proj > dir.length()) {
      closest = forth_line_end;
    } else {
      closest = forth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(forth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_forth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = forth_line_end.minus(forth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(forth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = forth_line_start;
    } else if (proj > dir.length()) {
      closest = forth_line_end;
    } else {
      closest = forth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(forth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_forth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = forth_line_end.minus(forth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(forth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = forth_line_start;
    } else if (proj > dir.length()) {
      closest = forth_line_end;
    } else {
      closest = forth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(forth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}



//// Balls - Fifth Line Object Collision ////




void first_ball_fifth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = fifth_line_end.minus(fifth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(fifth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = fifth_line_start;
    } else if (proj > dir.length()) {
      closest = fifth_line_end;
    } else {
      closest = fifth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(fifth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_fifth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = fifth_line_end.minus(fifth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(fifth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = fifth_line_start;
    } else if (proj > dir.length()) {
      closest = fifth_line_end;
    } else {
      closest = fifth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(fifth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_fifth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = fifth_line_end.minus(fifth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(fifth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = fifth_line_start;
    } else if (proj > dir.length()) {
      closest = fifth_line_end;
    } else {
      closest = fifth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(fifth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}




//// Balls - Sixth Line Object Collision ////




void first_ball_sixth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = sixth_line_end.minus(sixth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(sixth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = sixth_line_start;
    } else if (proj > dir.length()) {
      closest = sixth_line_end;
    } else {
      closest = sixth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(sixth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_sixth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = sixth_line_end.minus(sixth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(sixth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = sixth_line_start;
    } else if (proj > dir.length()) {
      closest = sixth_line_end;
    } else {
      closest = sixth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(sixth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_sixth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = sixth_line_end.minus(sixth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(sixth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = sixth_line_start;
    } else if (proj > dir.length()) {
      closest = sixth_line_end;
    } else {
      closest = sixth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(sixth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}




//// Balls - Seventh Line Object Collision ////




void first_ball_seventh_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = seventh_line_end.minus(seventh_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(seventh_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = seventh_line_start;
    } else if (proj > dir.length()) {
      closest = seventh_line_end;
    } else {
      closest = seventh_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(seventh_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_seventh_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = seventh_line_end.minus(seventh_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(seventh_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = seventh_line_start;
    } else if (proj > dir.length()) {
      closest = seventh_line_end;
    } else {
      closest = seventh_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(seventh_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_seventh_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = seventh_line_end.minus(seventh_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(seventh_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = seventh_line_start;
    } else if (proj > dir.length()) {
      closest = seventh_line_end;
    } else {
      closest = seventh_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(seventh_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}




//// Balls - Eight Line Object Collision ////




void first_ball_eighth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = eighth_line_end.minus(eighth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(eighth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = eighth_line_start;
    } else if (proj > dir.length()) {
      closest = eighth_line_end;
    } else {
      closest = eighth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(eighth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_eighth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = eighth_line_end.minus(eighth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(eighth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = eighth_line_start;
    } else if (proj > dir.length()) {
      closest = eighth_line_end;
    } else {
      closest = eighth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(eighth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_eighth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = eighth_line_end.minus(eighth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(eighth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = eighth_line_start;
    } else if (proj > dir.length()) {
      closest = eighth_line_end;
    } else {
      closest = eighth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(eighth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}




//// Balls - Nine Line Object Collision ////




void first_ball_ninth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = ninth_line_end.minus(ninth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(ninth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = ninth_line_start;
    } else if (proj > dir.length()) {
      closest = ninth_line_end;
    } else {
      closest = ninth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(ninth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_ninth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = ninth_line_end.minus(ninth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(ninth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = ninth_line_start;
    } else if (proj > dir.length()) {
      closest = ninth_line_end;
    } else {
      closest = ninth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(ninth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_ninth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = ninth_line_end.minus(ninth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(ninth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = ninth_line_start;
    } else if (proj > dir.length()) {
      closest = ninth_line_end;
    } else {
      closest = ninth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(ninth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}




//// Balls - Ten Line Object Collision ////




void first_ball_tenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = tenth_line_end.minus(tenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(tenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = tenth_line_start;
    } else if (proj > dir.length()) {
      closest = tenth_line_end;
    } else {
      closest = tenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(tenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_tenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = tenth_line_end.minus(tenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(tenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = tenth_line_start;
    } else if (proj > dir.length()) {
      closest = tenth_line_end;
    } else {
      closest = tenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(tenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_tenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = tenth_line_end.minus(tenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(tenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = tenth_line_start;
    } else if (proj > dir.length()) {
      closest = tenth_line_end;
    } else {
      closest = tenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(tenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}




//// Balls - Eleven Line Object Collision ////




void first_ball_eleventh_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = eleventh_line_end.minus(eleventh_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(eleventh_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = eleventh_line_start;
    } else if (proj > dir.length()) {
      closest = eleventh_line_end;
    } else {
      closest = eleventh_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(eleventh_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_eleventh_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = eleventh_line_end.minus(eleventh_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(eleventh_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = eleventh_line_start;
    } else if (proj > dir.length()) {
      closest = eleventh_line_end;
    } else {
      closest = eleventh_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(eleventh_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_eleventh_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = eleventh_line_end.minus(eleventh_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(eleventh_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = eleventh_line_start;
    } else if (proj > dir.length()) {
      closest = eleventh_line_end;
    } else {
      closest = eleventh_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(eleventh_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}




//// Balls - Twelve Line Object Collision ////




void first_ball_twelveth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = twelveth_line_end.minus(twelveth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(twelveth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = twelveth_line_start;
    } else if (proj > dir.length()) {
      closest = twelveth_line_end;
    } else {
      closest = twelveth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(twelveth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_twelveth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = twelveth_line_end.minus(twelveth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(twelveth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = twelveth_line_start;
    } else if (proj > dir.length()) {
      closest = twelveth_line_end;
    } else {
      closest = twelveth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(twelveth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_twelveth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = twelveth_line_end.minus(twelveth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(twelveth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = twelveth_line_start;
    } else if (proj > dir.length()) {
      closest = twelveth_line_end;
    } else {
      closest = twelveth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(twelveth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}



//// Balls - Thirteen Line Object Collision ////




void first_ball_thirteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = thirteenth_line_end.minus(thirteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(thirteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = thirteenth_line_start;
    } else if (proj > dir.length()) {
      closest = thirteenth_line_end;
    } else {
      closest = thirteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(thirteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_thirteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = thirteenth_line_end.minus(thirteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(thirteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = thirteenth_line_start;
    } else if (proj > dir.length()) {
      closest = thirteenth_line_end;
    } else {
      closest = thirteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(thirteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_thirteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = thirteenth_line_end.minus(thirteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(thirteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = thirteenth_line_start;
    } else if (proj > dir.length()) {
      closest = thirteenth_line_end;
    } else {
      closest = thirteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(thirteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}




//// Balls - Fourteen Line Object Collision ////


void first_ball_fourteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = fourteenth_line_end.minus(fourteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(fourteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = fourteenth_line_start;
    } else if (proj > dir.length()) {
      closest = fourteenth_line_end;
    } else {
      closest = fourteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(fourteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_fourteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = fourteenth_line_end.minus(fourteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(fourteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = fourteenth_line_start;
    } else if (proj > dir.length()) {
      closest = fourteenth_line_end;
    } else {
      closest = fourteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(fourteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_fourteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = fourteenth_line_end.minus(fourteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(fourteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = fourteenth_line_start;
    } else if (proj > dir.length()) {
      closest = fourteenth_line_end;
    } else {
      closest = fourteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(fourteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}



//// Balls - Fifteen Line Object Collision ////


void first_ball_fifteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = fifteenth_line_end.minus(fifteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(fifteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = fifteenth_line_start;
    } else if (proj > dir.length()) {
      closest = fifteenth_line_end;
    } else {
      closest = fifteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(fifteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_fifteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = fifteenth_line_end.minus(fifteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(fifteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = fifteenth_line_start;
    } else if (proj > dir.length()) {
      closest = fifteenth_line_end;
    } else {
      closest = fifteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(fifteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_fifteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = fifteenth_line_end.minus(fifteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(fifteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = fifteenth_line_start;
    } else if (proj > dir.length()) {
      closest = fifteenth_line_end;
    } else {
      closest = fifteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(fifteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}






//// Balls - Sixteen Line Object Collision ////


void first_ball_sixteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = sixteenth_line_end.minus(sixteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(sixteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = sixteenth_line_start;
    } else if (proj > dir.length()) {
      closest = sixteenth_line_end;
    } else {
      closest = sixteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(sixteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_sixteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = sixteenth_line_end.minus(sixteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(sixteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = sixteenth_line_start;
    } else if (proj > dir.length()) {
      closest = sixteenth_line_end;
    } else {
      closest = sixteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(sixteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_sixteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = sixteenth_line_end.minus(sixteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(sixteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = sixteenth_line_start;
    } else if (proj > dir.length()) {
      closest = sixteenth_line_end;
    } else {
      closest = sixteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(sixteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}



//// Balls - Seventeen Line Object Collision ////


void first_ball_seventeenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = seventeenth_line_end.minus(seventeenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(seventeenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = seventeenth_line_start;
    } else if (proj > dir.length()) {
      closest = seventeenth_line_end;
    } else {
      closest = seventeenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(seventeenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_seventeenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = seventeenth_line_end.minus(seventeenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(seventeenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = seventeenth_line_start;
    } else if (proj > dir.length()) {
      closest = seventeenth_line_end;
    } else {
      closest = seventeenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(seventeenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_seventeenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = seventeenth_line_end.minus(seventeenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(seventeenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = seventeenth_line_start;
    } else if (proj > dir.length()) {
      closest = seventeenth_line_end;
    } else {
      closest = seventeenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(seventeenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}



//// Balls - Eighteen Line Object Collision ////


void first_ball_eighteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = eighteenth_line_end.minus(eighteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(eighteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = eighteenth_line_start;
    } else if (proj > dir.length()) {
      closest = eighteenth_line_end;
    } else {
      closest = eighteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(eighteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_eighteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = eighteenth_line_end.minus(eighteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(eighteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = eighteenth_line_start;
    } else if (proj > dir.length()) {
      closest = eighteenth_line_end;
    } else {
      closest = eighteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(eighteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_eighteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = eighteenth_line_end.minus(eighteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(eighteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = eighteenth_line_start;
    } else if (proj > dir.length()) {
      closest = eighteenth_line_end;
    } else {
      closest = eighteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(eighteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}







//// Balls - Ninteen Line Object Collision ////


void first_ball_ninteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = ninteenth_line_end.minus(ninteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(ninteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = ninteenth_line_start;
    } else if (proj > dir.length()) {
      closest = ninteenth_line_end;
    } else {
      closest = ninteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(ninteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_ninteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = ninteenth_line_end.minus(ninteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(ninteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = ninteenth_line_start;
    } else if (proj > dir.length()) {
      closest = ninteenth_line_end;
    } else {
      closest = ninteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(ninteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_ninteenth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = ninteenth_line_end.minus(ninteenth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(ninteenth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = ninteenth_line_start;
    } else if (proj > dir.length()) {
      closest = ninteenth_line_end;
    } else {
      closest = ninteenth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(ninteenth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}





//// Balls - Twenty Line Object Collision ////


void first_ball_twentyth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = twentyth_line_end.minus(twentyth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(twentyth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = twentyth_line_start;
    } else if (proj > dir.length()) {
      closest = twentyth_line_end;
    } else {
      closest = twentyth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(twentyth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_twentyth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = twentyth_line_end.minus(twentyth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(twentyth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = twentyth_line_start;
    } else if (proj > dir.length()) {
      closest = twentyth_line_end;
    } else {
      closest = twentyth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(twentyth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_twentyth_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = twentyth_line_end.minus(twentyth_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(twentyth_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = twentyth_line_start;
    } else if (proj > dir.length()) {
      closest = twentyth_line_end;
    } else {
      closest = twentyth_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(twentyth_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}






//// Balls - Twenty First Line Object Collision ////


void first_ball_twentyfirst_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = twentyfirst_line_end.minus(twentyfirst_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(twentyfirst_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = twentyfirst_line_start;
    } else if (proj > dir.length()) {
      closest = twentyfirst_line_end;
    } else {
      closest = twentyfirst_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(twentyfirst_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
}


void second_ball_twentyfirst_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = twentyfirst_line_end.minus(twentyfirst_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(twentyfirst_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = twentyfirst_line_start;
    } else if (proj > dir.length()) {
      closest = twentyfirst_line_end;
    } else {
      closest = twentyfirst_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(twentyfirst_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}


void third_ball_twentyfirst_line_object_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    //Vec2 tip = line_end;
    Vec2 dir = twentyfirst_line_end.minus(twentyfirst_line_start);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(twentyfirst_line_start), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = twentyfirst_line_start;
    } else if (proj > dir.length()) {
      closest = twentyfirst_line_end;
    } else {
      closest = twentyfirst_line_start.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));
    
    //Vec2 B = dir.times(dot(circle_vel , dir));
    //circle_vel.subtract(B.times(1 + restitution));

     //Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(twentyfirst_line_start);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_line_object) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
}
















PImage backgroundImage;
PImage img;

SoundFile sound;

void setup(){
  // Title pinball
  
  size(709,833);
  
    sound = new SoundFile(this, "pinball_sound.mp3"); // Replace "soundfile.mp3" with your sound file path

  backgroundImage= loadImage ("BG-5.png");
  img = loadImage("pinball.png");
  surface.setTitle("Flipper Demo [S.J. Guy]");
  smooth();
  noStroke();
  
  
  resetBalls();
  
  println("Your current score is : " , score);
  
}


void first_ball_line_left_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    Vec2 tip_left = getTip_Left();
    Vec2 dir = tip_left.minus(Left_flipper_base);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(Left_flipper_base), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = Left_flipper_base;
    } else if (proj > dir.length()) {
      closest = tip_left;
    } else {
      closest = Left_flipper_base.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir
    score += 1;
    println("Your current score is : " , score);

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));

    // Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(Left_flipper_base);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_left) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
    
  
}





void first_ball_line_right_collision() { 
  
    float restitution = 0.8;

    // Find the closest point on the line segment
    Vec2 tip_right = getTip_Right();
    Vec2 dir = tip_right.minus(Right_flipper_base);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(first_ball_pos.minus(Right_flipper_base), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = Right_flipper_base;
    } else if (proj > dir.length()) {
      closest = tip_right;
    } else {
      closest = Right_flipper_base.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = first_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir
    
    score += 1;
    println("Your current score is : " , score);

    // Move the ball outside the line segment
    first_ball_pos = closest.plus(dir.times(ball_radius));

    // Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(Right_flipper_base);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times(angular_velocity_right * radius.length());
    }
    //println("Here is the surf vel" + surfaceVel);

    // Calculate the new ball velocity
    float v_ball = dot(first_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    first_ball_vel.add(dir.times(new_v - v_ball));
  
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// END OF FIRST


void second_ball_line_left_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    Vec2 tip_left = getTip_Left();
    Vec2 dir = tip_left.minus(Left_flipper_base);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(Left_flipper_base), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = Left_flipper_base;
    } else if (proj > dir.length()) {
      closest = tip_left;
    } else {
      closest = Left_flipper_base.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir
    
    score += 1;
    println("Your current score is : " , score);

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));

    // Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(Left_flipper_base);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_left) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
    
  
}





void second_ball_line_right_collision() { 
  
    float restitution = 0.8;

    // Find the closest point on the line segment
    Vec2 tip_right = getTip_Right();
    Vec2 dir = tip_right.minus(Right_flipper_base);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(second_ball_pos.minus(Right_flipper_base), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = Right_flipper_base;
    } else if (proj > dir.length()) {
      closest = tip_right;
    } else {
      closest = Right_flipper_base.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = second_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir
    
    score += 1;
    println("Your current score is : " , score);

    // Move the ball outside the line segment
    second_ball_pos = closest.plus(dir.times(ball_radius));

    // Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(Right_flipper_base);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times(angular_velocity_right * radius.length());
    }
    //println("Here is the surf vel" + surfaceVel);

    // Calculate the new ball velocity
    float v_ball = dot(second_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    second_ball_vel.add(dir.times(new_v - v_ball));
  
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// END OF SECOND


void third_ball_line_left_collision() {  
  
    float restitution = 0.8;
  
  
    // Find the closest point on the line segment
    Vec2 tip_left = getTip_Left();
    Vec2 dir = tip_left.minus(Left_flipper_base);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(Left_flipper_base), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = Left_flipper_base;
    } else if (proj > dir.length()) {
      closest = tip_left;
    } else {
      closest = Left_flipper_base.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir
    
    score += 1;
    println("Your current score is : " , score);

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));

    // Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(Left_flipper_base);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times((angular_velocity_left) * radius.length());
    }

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
    
  
}





void third_ball_line_right_collision() { 
  
    float restitution = 0.8;

    // Find the closest point on the line segment
    Vec2 tip_right = getTip_Right();
    Vec2 dir = tip_right.minus(Right_flipper_base);
    Vec2 dir_norm = dir.normalized();
    float proj = dot(third_ball_pos.minus(Right_flipper_base), dir_norm);
    Vec2 closest;
    if (proj < 0) {
      closest = Right_flipper_base;
    } else if (proj > dir.length()) {
      closest = tip_right;
    } else {
      closest = Right_flipper_base.plus(dir_norm.times(proj));
    }

    // Check if the ball is close enough to the line segment
    dir = third_ball_pos.minus(closest);
    float dist = dir.length();
    if (dist > ball_radius) {
      return;
    }
    dir.mul(1.0/dist); // Normalize dir
    
    score += 1;
    println("Your current score is : " , score);

    // Move the ball outside the line segment
    third_ball_pos = closest.plus(dir.times(ball_radius));

    // Velocity of the flipper at the point of contact
    Vec2 radius = closest.minus(Right_flipper_base);
    Vec2 surfaceVel = new Vec2(0,0);
    if (radius.length() > 0) {
      surfaceVel = (new Vec2(-radius.y, radius.x)).normalized().times(angular_velocity_right * radius.length());
    }
    //println("Here is the surf vel" + surfaceVel);

    // Calculate the new ball velocity
    float v_ball = dot(third_ball_vel,dir);
    float v_flip = dot(surfaceVel,dir);
    float m1 = 1;
    float m2 = 10; // Give the flipper a big mass compared to the ball [TODO: Should be infinite ... you should update it!]

    // Conservation of momentum
    float new_v = (m1 * v_ball + m2 * v_flip - m2 * (v_ball - v_flip) * restitution) / (m1 + m2);

    third_ball_vel.add(dir.times(new_v - v_ball));
  
}












void update_physics(float dt){
  
  // Update line segment
      
   // Kind of Correct//
  angle_left += angular_velocity_left*dt;
  
  if(isFlippingLeft == true){
    angular_velocity_left = -magnitude_angular_velocity; 
    
    if (angle_left < min_angle){
      angle_left = min_angle;
      angular_velocity_left = 0;
      if(isFlippingLeftBackwards == true){
        //angular_velocity_left *= -1;
        isFlippingLeft = false;
        angular_velocity_left = magnitude_angular_velocity;
        //angle_left -= angular_velocity_left*dt;
        if (angle_left > max_angle){
          angle_left = max_angle;
          angular_velocity_left = 0;
          //if(isFlippingLeft == true) isFlippingLeft=true;
          //angular_velocity_left *= -1;
        }
      }
      //angular_velocity_left *= -1;
    }
    
  }    
    
    
   if(isFlippingLeft == false && isFlippingLeftBackwards == true){
    //angle_left -= angular_velocity_left*dt;
    angular_velocity_left = magnitude_angular_velocity;
    if (angle_left > max_angle){
    angle_left = max_angle;
    angular_velocity_left = 0;
    isFlippingLeftBackwards = false;
    //isFlippingLeft = true;
      //angular_velocity_left *= -1;
    }
    
   
      
    
    
  }
  
  
  

  // Check for collision
  
  
  
  
  angle_right -= angular_velocity_right*dt;
  
  if(isFlippingRight == true){
    angular_velocity_right = magnitude_angular_velocity;
     
    if (angle_right < min_angle){
      angle_right = min_angle;
      angular_velocity_right = 0;
      //isFlippingRight = false;
      if(isFlippingRightBackwards == true){
        //angular_velocity_left *= -1;
        isFlippingRight = false;
        angular_velocity_right = -magnitude_angular_velocity;
        //angle_right += angular_velocity_right*dt;
        if (angle_right > max_angle){
          angle_right = max_angle;
          angular_velocity_right = 0;
          isFlippingRightBackwards = false;
          //if(isFlippingLeft == true) isFlippingLeft=true;
          //angular_velocity_left *= -1;
        }
      }
      //angular_velocity_left *= -1;
    }
    
  }
 

    
   if(isFlippingRight == false && isFlippingRightBackwards == true){
    //angle_right += angular_velocity_right*dt;
    angular_velocity_right = -magnitude_angular_velocity;
    if (angle_right > max_angle){
    angle_right = max_angle;
    angular_velocity_right = 0;
    isFlippingRightBackwards = false;
    //isFlippingLeft = true;
      //angular_velocity_left *= -1;
    }
    
    
  }
  
  //for(int temp=0; temp<numBalls; temp++){
    
  
    //Vec2[] Balls_Positions = resetBalls();
    //Vec2 single_ball_pos = Balls_Positions[k];
    // Update ball
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////
    
    circles_collisions(first_ball_pos , first_ball_vel , second_ball_pos , second_ball_vel);
    circles_collisions(first_ball_pos , first_ball_vel , third_ball_pos , third_ball_vel);
    circles_collisions(second_ball_pos , second_ball_vel , third_ball_pos , third_ball_vel);
    
    
    //////////////////////////////////////////////////////////////////////////////////////
    
    //Ball - Box Collision and Bouncing off
    
    first_ball_first_line_object_collision();
    second_ball_first_line_object_collision();
    third_ball_first_line_object_collision();
    
    first_ball_second_line_object_collision();
    second_ball_second_line_object_collision();
    third_ball_second_line_object_collision();
    
    first_ball_third_line_object_collision();
    second_ball_third_line_object_collision();
    third_ball_third_line_object_collision();
    
    first_ball_forth_line_object_collision();
    second_ball_forth_line_object_collision();
    third_ball_forth_line_object_collision();
    
    first_ball_fifth_line_object_collision();
    second_ball_fifth_line_object_collision();
    third_ball_fifth_line_object_collision();
  
    first_ball_sixth_line_object_collision();
    second_ball_sixth_line_object_collision();
    third_ball_sixth_line_object_collision();
    
    first_ball_seventh_line_object_collision();
    second_ball_seventh_line_object_collision();
    third_ball_seventh_line_object_collision();
    
    first_ball_eighth_line_object_collision();
    second_ball_eighth_line_object_collision();
    third_ball_eighth_line_object_collision();
    
    first_ball_ninth_line_object_collision();
    second_ball_ninth_line_object_collision();
    third_ball_ninth_line_object_collision();
    
    first_ball_tenth_line_object_collision();
    second_ball_tenth_line_object_collision();
    third_ball_tenth_line_object_collision();
    
    first_ball_eleventh_line_object_collision();
    second_ball_eleventh_line_object_collision();
    third_ball_eleventh_line_object_collision();
    
    first_ball_twelveth_line_object_collision();
    second_ball_twelveth_line_object_collision();
    third_ball_twelveth_line_object_collision();
    
    first_ball_thirteenth_line_object_collision();
    second_ball_thirteenth_line_object_collision();
    third_ball_thirteenth_line_object_collision();
    
    first_ball_fourteenth_line_object_collision();
    second_ball_fourteenth_line_object_collision();
    third_ball_fourteenth_line_object_collision();
    
    first_ball_fifteenth_line_object_collision();
    second_ball_fifteenth_line_object_collision();
    third_ball_fifteenth_line_object_collision();
    
    first_ball_sixteenth_line_object_collision();
    second_ball_sixteenth_line_object_collision();
    third_ball_sixteenth_line_object_collision();
    
    first_ball_seventeenth_line_object_collision();
    second_ball_seventeenth_line_object_collision();
    third_ball_seventeenth_line_object_collision();
    
    first_ball_eighteenth_line_object_collision();
    second_ball_eighteenth_line_object_collision();
    third_ball_eighteenth_line_object_collision();
    
    first_ball_ninteenth_line_object_collision();
    second_ball_ninteenth_line_object_collision();
    third_ball_ninteenth_line_object_collision();
    
    first_ball_twentyth_line_object_collision();
    second_ball_twentyth_line_object_collision();
    third_ball_twentyth_line_object_collision();
    
    first_ball_twentyfirst_line_object_collision();
    second_ball_twentyfirst_line_object_collision();
    third_ball_twentyfirst_line_object_collision();
    
    
    
    ///////////////////////////////////////////////////////////////////////////////////////
    
    
    first_ball_vel.add(gravity.times(dt));
    first_ball_pos.add(first_ball_vel.times(dt));
    
    first_ball_line_left_collision();
    first_ball_line_right_collision();
    
    //////////////////////////////////////////////////////
    
    second_ball_vel.add(gravity.times(dt));
    second_ball_pos.add(second_ball_vel.times(dt));
    
    second_ball_line_left_collision();
    second_ball_line_right_collision();
    
    //////////////////////////////////////////////////////


    third_ball_vel.add(gravity.times(dt));
    third_ball_pos.add(third_ball_vel.times(dt));
    
    third_ball_line_left_collision();
    third_ball_line_right_collision();
    
    
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////


    // circle object 1
    circles_objects_collisions(first_ball_pos , first_ball_vel , ball_radius , first_ball_object_pos , first_ball_object_vel , first_ball_object_radius);
    circles_objects_collisions(second_ball_pos , second_ball_vel , ball_radius , first_ball_object_pos , first_ball_object_vel , first_ball_object_radius);
    circles_objects_collisions(third_ball_pos , third_ball_vel , ball_radius , first_ball_object_pos , first_ball_object_vel , first_ball_object_radius);
    
    // circle object 2
    //circles_objects_collisions(first_ball_pos , first_ball_vel , ball_radius , second_ball_object_pos , second_ball_object_vel , second_ball_object_radius);
    //circles_objects_collisions(second_ball_pos , second_ball_vel , ball_radius , second_ball_object_pos , second_ball_object_vel , second_ball_object_radius);
    //circles_objects_collisions(third_ball_pos , third_ball_vel , ball_radius , second_ball_object_pos , second_ball_object_vel , second_ball_object_radius);
    
    
    // circle object 3
    circles_objects_collisions(first_ball_pos , first_ball_vel , ball_radius , third_ball_object_pos , third_ball_object_vel , third_ball_object_radius);
    circles_objects_collisions(second_ball_pos , second_ball_vel , ball_radius , third_ball_object_pos , third_ball_object_vel , third_ball_object_radius);
    circles_objects_collisions(third_ball_pos , third_ball_vel , ball_radius , third_ball_object_pos , third_ball_object_vel , third_ball_object_radius);
    
    // circle object 4
    //circles_objects_collisions(first_ball_pos , first_ball_vel , ball_radius , forth_ball_object_pos , forth_ball_object_vel , forth_ball_object_radius);
    //circles_objects_collisions(second_ball_pos , second_ball_vel , ball_radius , forth_ball_object_pos , forth_ball_object_vel , forth_ball_object_radius);
    //circles_objects_collisions(third_ball_pos , third_ball_vel , ball_radius , forth_ball_object_pos , forth_ball_object_vel , forth_ball_object_radius);
    
    // circle object 5
    circles_objects_collisions(first_ball_pos , first_ball_vel , ball_radius , fifth_ball_object_pos , fifth_ball_object_vel , fifth_ball_object_radius);
    circles_objects_collisions(second_ball_pos , second_ball_vel , ball_radius , fifth_ball_object_pos , fifth_ball_object_vel , fifth_ball_object_radius);
    circles_objects_collisions(third_ball_pos , third_ball_vel , ball_radius , fifth_ball_object_pos , fifth_ball_object_vel , fifth_ball_object_radius);
    
    // circle object 6
    circles_objects_collisions(first_ball_pos , first_ball_vel , ball_radius , sixth_ball_object_pos , sixth_ball_object_vel , sixth_ball_object_radius);
    circles_objects_collisions(second_ball_pos , second_ball_vel , ball_radius , sixth_ball_object_pos , sixth_ball_object_vel , sixth_ball_object_radius);
    circles_objects_collisions(third_ball_pos , third_ball_vel , ball_radius , sixth_ball_object_pos , sixth_ball_object_vel , sixth_ball_object_radius);
    
    
    // circle object 7
    circles_objects_collisions(first_ball_pos , first_ball_vel , ball_radius , seventh_ball_object_pos , seventh_ball_object_vel , seventh_ball_object_radius);
    circles_objects_collisions(second_ball_pos , second_ball_vel , ball_radius , seventh_ball_object_pos , seventh_ball_object_vel , seventh_ball_object_radius);
    circles_objects_collisions(third_ball_pos , third_ball_vel , ball_radius , seventh_ball_object_pos , seventh_ball_object_vel , seventh_ball_object_radius);
    
    
    
    // circle object 8
    circles_objects_collisions(first_ball_pos , first_ball_vel , ball_radius , eighth_ball_object_pos , eighth_ball_object_vel , eighth_ball_object_radius);
    circles_objects_collisions(second_ball_pos , second_ball_vel , ball_radius , eighth_ball_object_pos , eighth_ball_object_vel , eighth_ball_object_radius);
    circles_objects_collisions(third_ball_pos , third_ball_vel , ball_radius , eighth_ball_object_pos , eighth_ball_object_vel , eighth_ball_object_radius);
    
    
    // circle object 9
    circles_objects_collisions(first_ball_pos , first_ball_vel , ball_radius , ninth_ball_object_pos , ninth_ball_object_vel , ninth_ball_object_radius);
    circles_objects_collisions(second_ball_pos , second_ball_vel , ball_radius , ninth_ball_object_pos , ninth_ball_object_vel , ninth_ball_object_radius);
    circles_objects_collisions(third_ball_pos , third_ball_vel , ball_radius , ninth_ball_object_pos , ninth_ball_object_vel , ninth_ball_object_radius);
    
    // circle object 10
    circles_objects_collisions(first_ball_pos , first_ball_vel , ball_radius , tenth_ball_object_pos , tenth_ball_object_vel , tenth_ball_object_radius);
    circles_objects_collisions(second_ball_pos , second_ball_vel , ball_radius , tenth_ball_object_pos , tenth_ball_object_vel , tenth_ball_object_radius);
    circles_objects_collisions(third_ball_pos , third_ball_vel , ball_radius , tenth_ball_object_pos , tenth_ball_object_vel , tenth_ball_object_radius);
   
    
    // circle object 11
    circles_objects_collisions(first_ball_pos , first_ball_vel , ball_radius , eleventh_ball_object_pos , eleventh_ball_object_vel , eleventh_ball_object_radius);
    circles_objects_collisions(second_ball_pos , second_ball_vel , ball_radius , eleventh_ball_object_pos , eleventh_ball_object_vel , eleventh_ball_object_radius);
    circles_objects_collisions(third_ball_pos , third_ball_vel , ball_radius , eleventh_ball_object_pos , eleventh_ball_object_vel , eleventh_ball_object_radius);
    
    
    //print("Your current score is : " , score);
   




    
    
    
    
  // Check for collision
  
  //}
 
  
 
}

boolean paused = false;
boolean leftPressed, rightPressed, upPressed, downPressed, shiftPressed, RkeyPressed, isPlaying;

void keyPressed(){
  if (key == ' '){
    paused = !paused;
  }
  
  if (keyCode == LEFT) leftPressed = true;
  if (keyCode == RIGHT) rightPressed = true;
  if (keyCode == UP) upPressed = true; 
  if (keyCode == DOWN) downPressed = true;
  if (keyCode == SHIFT) shiftPressed = true;
  if (key == 'a') isFlippingLeft = true;
  if (key == 'd') isFlippingRight = true;
  if (key == 's' || key == 'S') isPlaying = true;{
    //sound.play();
  }
  
  //if (key == 'r') RkeyPressed = true;
  //if (key == 'r'){
  //  resetBalls();
  //}
  //if (key == 'd' && key == 'a') isFlippingRight = true; isFlippingLeft = true;
  
}

//void keyPressed() {
//  if (key == 's' || key == 'S') {
//    player.pause(); // Pause the sound
//  }
//}

//void keyReleased() {
//  if (key == 's' || key == 'S') {
//    player.play(); // Resume playing the sound
//  }
//}

void keyReleased(){
  // reset if 'r' if pressed
  if (key == 'r'){
    resetBalls();
  }
  if (keyCode == LEFT) leftPressed = false;
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == UP) upPressed = false; 
  if (keyCode == DOWN) downPressed = false;
  if (keyCode == SHIFT) shiftPressed = false;
  if (key == 'a') isFlippingLeft = false;
  if (key == 'a') isFlippingLeftBackwards = true;
  if (key == 'd') isFlippingRightBackwards = true;
  if (key == 'd') isFlippingRight = false;
    if (key == 's' || key == 'S') isPlaying = false; {
      //sound.stop();
  }
  //if (key == 'd' && key == 'a') isFlippingRightBackwards = true; isFlippingLeftBackwards = true;
}







void draw(){
  float dt = 1/frameRate;
  if (!paused)
    update_physics(dt);
    
  if (!sound.isPlaying()) {
    sound.play();
  }

  background(backgroundImage);

    
  stroke(0);
  
  
  
  //TEXT SCORE
  stroke (255);
  strokeWeight(2);
    textSize(32);  // Set the text size

  // Define the rectangle's properties
  float rectX = 20; // X-coordinate of the top-left corner of the rectangle
  float rectY = 50; // Y-coordinate of the top-left corner of the rectangle
  float rectWidth = 80; // Width of the rectangle
  float rectHeight = 50; // Height of the rectangle

  // Draw the score rectangle
  rect(rectX, rectY, rectWidth, rectHeight);

  // Define the text properties
  float message = score; // Your text message
  float textX = rectX ; // X-coordinate to start the text inside the rectangle
  float textY = rectY + rectHeight / 2 + textAscent() / 2; // Y-coordinate to center the text vertically

  // Display the score inside the rectangle
  fill(255); // Set text color to white
  text(message, textX, textY);


 strokeWeight(10);

  // Draw Line Left
  Vec2 tip_left = getTip_Left();
  line(Left_flipper_base.x,Left_flipper_base.y,tip_left.x,tip_left.y);
  
  stroke(255);
  strokeWeight(10);
  
   // Draw Line Right
  Vec2 tip_right = getTip_Right();
  line(Right_flipper_base.x,Right_flipper_base.y,tip_right.x,tip_right.y);
  
  
  
  // Box object in the center //
  
  stroke(0);
  strokeWeight(2);
 
  
  
  line(first_line_start.x,first_line_start.y,first_line_end.x,first_line_end.y);
  
  
  line(second_line_start.x,second_line_start.y,second_line_end.x,second_line_end.y);
  
  
  line(third_line_start.x,third_line_start.y,third_line_end.x,third_line_end.y);
  
  
  line(forth_line_start.x,forth_line_start.y,forth_line_end.x,forth_line_end.y);
  
  stroke(255);
  
  line(fifth_line_start.x,fifth_line_start.y,fifth_line_end.x,fifth_line_end.y);
  
  stroke(0);
  line(sixth_line_start.x,sixth_line_start.y,sixth_line_end.x,sixth_line_end.y);
  
  
  line(seventh_line_start.x,seventh_line_start.y,seventh_line_end.x,seventh_line_end.y);
  
  stroke(255);
  line(eighth_line_start.x,eighth_line_start.y,eighth_line_end.x,eighth_line_end.y);
  
  stroke(255);
  line(ninth_line_start.x,ninth_line_start.y,ninth_line_end.x,ninth_line_end.y);
  
  stroke(255);
  line(tenth_line_start.x,tenth_line_start.y,tenth_line_end.x,tenth_line_end.y);
  
  stroke(0);
  line(fourteenth_line_start.x,fourteenth_line_start.y,fourteenth_line_end.x,fourteenth_line_end.y);
  
  stroke(0);
  line(fifteenth_line_start.x,fifteenth_line_start.y,fifteenth_line_end.x,fifteenth_line_end.y);
  
  stroke(0);
  line(sixteenth_line_start.x,sixteenth_line_start.y,sixteenth_line_end.x,sixteenth_line_end.y);
  
  stroke(255);
  line(seventeenth_line_start.x,seventeenth_line_start.y,seventeenth_line_end.x,seventeenth_line_end.y);
  
  stroke(255);
  line(eighteenth_line_start.x,eighteenth_line_start.y,eighteenth_line_end.x,eighteenth_line_end.y);
  
  stroke(255);
  line(ninteenth_line_start.x,ninteenth_line_start.y,ninteenth_line_end.x,ninteenth_line_end.y);
  
  stroke(255);
  line(twentyth_line_start.x,twentyth_line_start.y,twentyth_line_end.x,twentyth_line_end.y);
  
  stroke(255);
  line(twentyfirst_line_start.x,twentyfirst_line_start.y,twentyfirst_line_end.x,twentyfirst_line_end.y);
  
  
  
  //stroke(0);
  //strokeWeight(5);
  //line(eleventh_line_start.x,eleventh_line_start.y,eleventh_line_end.x,eleventh_line_end.y);
  
  
  //stroke(0);
  //strokeWeight(5);
  //line(twelveth_line_start.x,twelveth_line_start.y,twelveth_line_end.x,twelveth_line_end.y);
  
  //stroke(0);
  //strokeWeight(7);
  //line(thirteenth_line_start.x,thirteenth_line_start.y,thirteenth_line_end.x,thirteenth_line_end.y);
  
   //circle object 1
  
  //fill(0,0,0);
  //circle(first_ball_object_pos.x,first_ball_object_pos.y,first_ball_object_radius*2);
  if(CircleCircleCollision(first_ball_pos.x , first_ball_pos.y , ball_radius , first_ball_object_pos.x , first_ball_object_pos.y , first_ball_object_radius).hit == true){
    fill(255,0,0);
    circle(first_ball_object_pos.x,first_ball_object_pos.y,first_ball_object_radius*2);
  }
  if(CircleCircleCollision(second_ball_pos.x , second_ball_pos.y , ball_radius , first_ball_object_pos.x , first_ball_object_pos.y , first_ball_object_radius).hit == true){
    fill(255,255,0);
    circle(first_ball_object_pos.x,first_ball_object_pos.y,first_ball_object_radius*2);
  }
  if(CircleCircleCollision(third_ball_pos.x , third_ball_pos.y , ball_radius , first_ball_object_pos.x , first_ball_object_pos.y , first_ball_object_radius).hit == true){
    fill(0,0,255);
    circle(first_ball_object_pos.x,first_ball_object_pos.y,first_ball_object_radius*2);
  }
  
  
  // circle object 2
  
  //fill(0,0,0);
  //circle(second_ball_object_pos.x,second_ball_object_pos.y,second_ball_object_radius*2);
  
  //if(CircleCircleCollision(first_ball_pos.x , first_ball_pos.y , ball_radius , second_ball_object_pos.x , second_ball_object_pos.y , second_ball_object_radius).hit == true){
  //  fill(255,0,0);
  //  circle(second_ball_object_pos.x , second_ball_object_pos.y , second_ball_object_radius*2);
  //}
  //if(CircleCircleCollision(second_ball_pos.x , second_ball_pos.y , ball_radius , second_ball_object_pos.x , second_ball_object_pos.y , second_ball_object_radius).hit == true){
  //  fill(255,255,0);
  //  circle(second_ball_object_pos.x , second_ball_object_pos.y , second_ball_object_radius*2);
  //}
  //if(CircleCircleCollision(third_ball_pos.x , third_ball_pos.y , ball_radius , second_ball_object_pos.x , second_ball_object_pos.y , second_ball_object_radius).hit == true){
  //  fill(0,0,255);
  //  circle(second_ball_object_pos.x , second_ball_object_pos.y , second_ball_object_radius*2);
  //}
  
  // circle object 3
  
  //fill(0,0,0);
  //circle(third_ball_object_pos.x,third_ball_object_pos.y,third_ball_object_radius*2);
  
  if(CircleCircleCollision(first_ball_pos.x , first_ball_pos.y , ball_radius , third_ball_object_pos.x,third_ball_object_pos.y,third_ball_object_radius).hit == true){
    fill(255,0,0);
    circle(third_ball_object_pos.x,third_ball_object_pos.y,third_ball_object_radius*2);
  }
  if(CircleCircleCollision(second_ball_pos.x , second_ball_pos.y , ball_radius , third_ball_object_pos.x,third_ball_object_pos.y,third_ball_object_radius).hit == true){
    fill(255,255,0);
    circle(third_ball_object_pos.x,third_ball_object_pos.y,third_ball_object_radius*2);
  }
  if(CircleCircleCollision(third_ball_pos.x , third_ball_pos.y , ball_radius , third_ball_object_pos.x,third_ball_object_pos.y,third_ball_object_radius).hit == true){
    fill(0,0,255);
    circle(third_ball_object_pos.x,third_ball_object_pos.y,third_ball_object_radius*2);
  }
  
  
  
  //// circle object 4
  
  //fill(0,0,0);
  //circle(forth_ball_object_pos.x,forth_ball_object_pos.y,forth_ball_object_radius*2);
  
  //if(CircleCircleCollision(first_ball_pos.x , first_ball_pos.y , ball_radius , forth_ball_object_pos.x,forth_ball_object_pos.y,forth_ball_object_radius).hit == true){
  //  fill(255,0,0);
  //  circle(forth_ball_object_pos.x,forth_ball_object_pos.y,forth_ball_object_radius*2);
  //}
  //if(CircleCircleCollision(second_ball_pos.x , second_ball_pos.y , ball_radius , forth_ball_object_pos.x,forth_ball_object_pos.y,forth_ball_object_radius).hit == true){
  //  fill(255,255,0);
  //  circle(forth_ball_object_pos.x,forth_ball_object_pos.y,forth_ball_object_radius*2);
  //}
  //if(CircleCircleCollision(third_ball_pos.x , third_ball_pos.y , ball_radius , forth_ball_object_pos.x,forth_ball_object_pos.y,forth_ball_object_radius).hit == true){
  //  fill(0,0,255);
  //  circle(forth_ball_object_pos.x,forth_ball_object_pos.y,forth_ball_object_radius*2);
  //}
  
  
  //// circle object 5
  
  //fill(0,0,0);
  //circle(fifth_ball_object_pos.x,fifth_ball_object_pos.y,fifth_ball_object_radius*2);
  
  if(CircleCircleCollision(first_ball_pos.x , first_ball_pos.y , ball_radius , fifth_ball_object_pos.x,fifth_ball_object_pos.y,fifth_ball_object_radius).hit == true){
    fill(255,0,0);
    circle(fifth_ball_object_pos.x,fifth_ball_object_pos.y,fifth_ball_object_radius*2);
  }
  if(CircleCircleCollision(second_ball_pos.x , second_ball_pos.y , ball_radius , fifth_ball_object_pos.x,fifth_ball_object_pos.y,fifth_ball_object_radius).hit == true){
    fill(255,255,0);
    circle(fifth_ball_object_pos.x,fifth_ball_object_pos.y,fifth_ball_object_radius*2);
  }
  if(CircleCircleCollision(third_ball_pos.x , third_ball_pos.y , ball_radius , fifth_ball_object_pos.x,fifth_ball_object_pos.y,fifth_ball_object_radius).hit == true){
    fill(0,0,255);
    circle(fifth_ball_object_pos.x,fifth_ball_object_pos.y,fifth_ball_object_radius*2);
  }
  
  
  //// circle object 6

  //fill(0,0,0);
  //circle(sixth_ball_object_pos.x,sixth_ball_object_pos.y,sixth_ball_object_radius*2);
  if(CircleCircleCollision(first_ball_pos.x , first_ball_pos.y , ball_radius , sixth_ball_object_pos.x , sixth_ball_object_pos.y , sixth_ball_object_radius).hit == true){
    fill(255,0,255);
    circle(sixth_ball_object_pos.x,sixth_ball_object_pos.y,sixth_ball_object_radius*2);
  }
  if(CircleCircleCollision(second_ball_pos.x , second_ball_pos.y , ball_radius , sixth_ball_object_pos.x , sixth_ball_object_pos.y , sixth_ball_object_radius).hit == true){
    fill(255,0,255);
    circle(sixth_ball_object_pos.x , sixth_ball_object_pos.y , sixth_ball_object_radius*2);
  }
  if(CircleCircleCollision(third_ball_pos.x , third_ball_pos.y , ball_radius , sixth_ball_object_pos.x , sixth_ball_object_pos.y , sixth_ball_object_radius).hit == true){
    fill(255,0,255);
    circle(sixth_ball_object_pos.x , sixth_ball_object_pos.y , sixth_ball_object_radius*2);
  }
  
  
  //// circle object 7

  //fill(0,0,0);
  //circle(seventh_ball_object_pos.x,seventh_ball_object_pos.y,seventh_ball_object_radius*2);
  if(CircleCircleCollision(first_ball_pos.x , first_ball_pos.y , ball_radius , seventh_ball_object_pos.x,seventh_ball_object_pos.y,seventh_ball_object_radius).hit == true){
    fill(0,0,255);
    circle(seventh_ball_object_pos.x,seventh_ball_object_pos.y,seventh_ball_object_radius*2);
  }
  if(CircleCircleCollision(second_ball_pos.x , second_ball_pos.y , ball_radius , seventh_ball_object_pos.x,seventh_ball_object_pos.y,seventh_ball_object_radius).hit == true){
    fill(0,0,255);
    circle(seventh_ball_object_pos.x,seventh_ball_object_pos.y,seventh_ball_object_radius*2);
  }
  if(CircleCircleCollision(third_ball_pos.x , third_ball_pos.y , ball_radius , seventh_ball_object_pos.x,seventh_ball_object_pos.y,seventh_ball_object_radius).hit == true){
    fill(0,0,255);
    circle(seventh_ball_object_pos.x,seventh_ball_object_pos.y,seventh_ball_object_radius*2);
  }
  
  //// circle object 8

  //fill(0,0,0);
  //circle(eighth_ball_object_pos.x,eighth_ball_object_pos.y,eighth_ball_object_radius*2);
  if(CircleCircleCollision(first_ball_pos.x , first_ball_pos.y , ball_radius , eighth_ball_object_pos.x,eighth_ball_object_pos.y,eighth_ball_object_radius).hit == true){
    fill(255,255,0);
    circle(eighth_ball_object_pos.x,eighth_ball_object_pos.y,eighth_ball_object_radius*2);
  }
  if(CircleCircleCollision(second_ball_pos.x , second_ball_pos.y , ball_radius , eighth_ball_object_pos.x,eighth_ball_object_pos.y,eighth_ball_object_radius).hit == true){
    fill(255,255,0);
    circle(eighth_ball_object_pos.x,eighth_ball_object_pos.y,eighth_ball_object_radius*2);
  }
  if(CircleCircleCollision(third_ball_pos.x , third_ball_pos.y , ball_radius , eighth_ball_object_pos.x,eighth_ball_object_pos.y,eighth_ball_object_radius).hit == true){
    fill(255,255,0);
    circle(eighth_ball_object_pos.x,eighth_ball_object_pos.y,eighth_ball_object_radius*2);
  }
  
  
  
  //// circle object 9

  //fill(0,0,0);
  //circle(ninth_ball_object_pos.x,ninth_ball_object_pos.y,ninth_ball_object_radius*2);
  
  
  //// circle object 10

  fill(255,255,0);
  circle(tenth_ball_object_pos.x,tenth_ball_object_pos.y,tenth_ball_object_radius*2);
  if(CircleCircleCollision(first_ball_pos.x , first_ball_pos.y , ball_radius , tenth_ball_object_pos.x , tenth_ball_object_pos.y , tenth_ball_object_radius).hit == true){
    fill(255,255,0);
    circle(tenth_ball_object_pos.x,tenth_ball_object_pos.y,tenth_ball_object_radius*2);
  }
  
  
  //// circle object 11

  fill(255,0,255);
  circle(eleventh_ball_object_pos.x,eleventh_ball_object_pos.y,eleventh_ball_object_radius*2);
  
  
  //// circle object 12

  fill(0,0,255);
  circle(twelveth_ball_object_pos.x,twelveth_ball_object_pos.y,twelveth_ball_object_radius*2);
  
  







  // Draw Ball
  
  //for(int i=0; i<numBalls; i++){
    fill(255,0,0);
    //ellipse(first_ball_pos.x,first_ball_pos.y,ball_radius*2,ball_radius*2);
      image(img, first_ball_pos.x - ball_radius / 2, first_ball_pos.y - ball_radius / 2, ball_radius*2, ball_radius*2);

    
    
    //if (first_ball_pos.y > height + ball_radius){
      
    //  //if(RkeyPressed == true){
        
    //  //}
      
      
      
    ////first_ball_pos = new Vec2(50 + random(-5,line_length),200);
    ////first_ball_vel = new Vec2(0,0);
    //}

    // Bounce off walls
    if (first_ball_pos.x < ball_radius){
      first_ball_pos.x = ball_radius;
      first_ball_vel.x *= -0.8;
    }
    if (first_ball_pos.x > width - ball_radius){
      first_ball_pos.x = width - ball_radius;
      first_ball_vel.x *= -0.8;
    }
    if (first_ball_pos.y < ball_radius){
      first_ball_pos.y = ball_radius;
      first_ball_vel.y *= -0.8;
    }
    
    
    //////////////////////////////////////////////////////////////////////////
    
    
    fill(255,255,0);
    //ellipse(second_ball_pos.x,second_ball_pos.y,ball_radius*2,ball_radius*2);
          image(img, second_ball_pos.x - ball_radius / 2, second_ball_pos.y - ball_radius / 2, ball_radius*2, ball_radius*2);

    //if (second_ball_pos.y > height + ball_radius){
    //second_ball_pos = new Vec2(50 + random(-5,line_length),200);
    //second_ball_vel = new Vec2(0,0);
    //}

    // Bounce off walls
    if (second_ball_pos.x < ball_radius){
      second_ball_pos.x = ball_radius;
      second_ball_vel.x *= -0.8;
    }
    if (second_ball_pos.x > width - ball_radius){
      second_ball_pos.x = width - ball_radius;
      second_ball_vel.x *= -0.8;
    }
    if (second_ball_pos.y < ball_radius){
      second_ball_pos.y = ball_radius;
      second_ball_vel.y *= -0.8;
    }
    
    
    
    ///////////////////////////////////////////////////////////////////////////////////
    
    
    
    fill(0,0,255);
    //ellipse(third_ball_pos.x,third_ball_pos.y,ball_radius*2,ball_radius*2);
    image(img, third_ball_pos.x - ball_radius / 2, third_ball_pos.y - ball_radius / 2, ball_radius*2, ball_radius*2);
    //if (third_ball_pos.y > height + ball_radius){
    //third_ball_pos = new Vec2(50 + random(-5,line_length),200);
    //third_ball_vel = new Vec2(0,0);
    //}

    // Bounce off walls
    if (third_ball_pos.x < ball_radius){
      third_ball_pos.x = ball_radius;
      third_ball_vel.x *= -0.8;
    }
    if (third_ball_pos.x > width - ball_radius){
      third_ball_pos.x = width - ball_radius;
      third_ball_vel.x *= -0.8;
    }
    if (third_ball_pos.y < ball_radius){
      third_ball_pos.y = ball_radius;
      third_ball_vel.y *= -0.8;
    }
    
    
    
    ///////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
    
    
    
  //}
  
  //fill(255,0,0);
  //ellipse(ball_pos.x,ball_pos.y,ball_radius*2,ball_radius*2);

  // If ball is out of bounds, reset it
  //if (ball_pos.y > height + ball_radius){
  //  ball_pos = new Vec2(50 + random(-5,line_length),200);
  //  ball_vel = new Vec2(0,0);
  //}

  //// Bounce off walls
  //if (ball_pos.x < ball_radius){
  //  ball_pos.x = ball_radius;
  //  ball_vel.x *= -0.8;
  //}
  //if (ball_pos.x > width - ball_radius){
  //  ball_pos.x = width - ball_radius;
  //  ball_vel.x *= -0.8;
  //}
  //if (ball_pos.y < ball_radius){
  //  ball_pos.y = ball_radius;
  //  ball_vel.y *= -0.8;
  //}
  
}



//---------------
//Vec 2 Library
//---------------

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

//2D cross product is a funny concept
// ...its the 3D cross product but with z = 0
// ... (only the resulting z compontent is not zero so we just store is as a scalar)
float cross(Vec2 a, Vec2 b){
  return a.x*b.y - a.y*b.x;
}

Vec2 projAB(Vec2 a, Vec2 b){
  return b.times(a.x*b.x + a.y*b.y);
}

Vec2 perpendicular(Vec2 a){
  return new Vec2(-a.y,a.x);
}




//if(isFlippingLeft == true){
   //  angle_left += angular_velocity_left*dt;
   //  if (angle_left < min_angle){
   //    angle_left = min_angle;
   //    isFlippingLeft = false;
   //    angular_velocity_left *= -1;
   //    //isFlippingLeft = false;
       
   //  }
   
   //  if (angle_left > max_angle){
   //    angle_left = max_angle;
   //    angular_velocity_left *= -1;
   //   }
      
   //}
   
  
   
   
   
   
   
   
   
   
   
  //if(isFlippingLeft == true){
  //  angle_left += angular_velocity_left*dt;
    
  //  if (angle_left < min_angle){
  //    angle_left = min_angle;
      
  //    if(isFlippingLeftBackwards == true){
        
  //      angle_left += angular_velocity_left*dt;
  //      if (angle_left > max_angle){
  //        angle_left = max_angle;
  //        //isFlippingLeftBackwards = false;
  //      }
        
  //    }
  //    //angular_velocity_left = 0;
  //    //isFlippingLeftBackwards = true;
  //  }
  // }
  //      //isFlippingLeft = false;
  // if(isFlippingLeftBackwards == true){     
  //   angle_left -= angular_velocity_left*dt;
  //   if (angle_left > max_angle){
  //    angle_left = max_angle;
      
  //        //if(isFlippingLeft == true) isFlippingLeft=true;
  //      //}
  //  }
  //    //angular_velocity_left *= -1;
    
    
  //} 
   
   
   //if(isFlippingLeft == true && isFlippingLeftBackwards == false){
      
    //  angle_left += angular_velocity_left*dt;
      
    //  if (angle_left < min_angle){
    //  angle_left = min_angle;
    //  isFlippingLeft = false;
    //  //angular_velocity_left *= -1;
    //  }
    //}
      
    

    
   
    
    //if(isFlippingLeft == true && isFlippingLeftBackwards == false){
      
    //  angle_left += angular_velocity_left*dt;
      
    //  if (angle_left < min_angle){
    //  angle_left = min_angle;
    //  isFlippingLeft = false;
    //  //angular_velocity_left *= -1;
    //  }
    //}
      
    
    
  //}


 
  //angle_right -= angular_velocity_right*dt;
  //if (angle_right < min_angle){
  //  angle_right = min_angle;
  //  angular_velocity_right *= -1;
  //}
  //if (angle_right > max_angle){
  //  angle_right = max_angle;
  //  angular_velocity_right *= -1;
  //}


   //println("ALI12" + isFlippingRight , isFlippingRightBackwards);
   //if (isFlippingRight && isFlippingRightBackwards) exit(); 
    
    
    
//boolean isFlippingLeft = false;
//boolean isFlippingRight = false;
//boolean isFlippingLeftBackwards = false;
//boolean isFlippingRightBackwards = false;


//void keyPressed(){
//  if(key == 'a'){
//    isFlippingLeft=true;
//  }
//}


//void keyReleased(){
//  if(key == 'a'){
//    isFlippingLeft=false;
//  }
//}

//if(isFlippingLeft == false && isFlippingLeftBackwards == false){
  //  angle_left = max_angle;
  //  ball_line_left_collision();
    
  //}
  
  
  
  // Kind of Correct//
  


   //Update ball
  //ball_vel.add(gravity.times(dt));
  //ball_pos.add(ball_vel.times(dt));
  
   //if(isFlippingLeft == true && isFlippingLeftBackwards == false){
      
    //  angle_left += angular_velocity_left*dt;
      
    //  if (angle_left < min_angle){
    //  angle_left = min_angle;
    //  isFlippingLeft = false;
    //  //angular_velocity_left *= -1;
    //  }
    //}
  
  

/////////////   CIRCLE - LINE COLLISION AND BOUNCING OFF //////////////



//class hitInfo{
//  public boolean hit = false;
//  public float t = 9999999;
//  public Vec2 Collision_Point = new Vec2(0,0);
//}


//hitInfo CircleLineCollision(float circle_x_pos , float circle_y_pos , float circle_radius , Vec2 circle_vel , float line_x_start , float line_y_start , float line_x_end , float line_y_end){
  
//  hitInfo hit = new hitInfo();
  
//  float cor = 0.8;
//  Vec2 circle_center = new Vec2(circle_x_pos,circle_y_pos);
//  Vec2 line_start = new Vec2(line_x_start,line_y_start);
//  Vec2 line_end = new Vec2(line_x_end,line_y_end);
//  Vec2 Collision_Point = new Vec2(0,0);
//  Vec2 line_dir = line_end.minus(line_start);
//  float line_len = line_dir.length();
//  line_dir.normalize();
  
//  if (circle_center.x >= min(line_x_start, line_x_end) - circle_radius &&
//      circle_center.x <= max(line_x_start, line_x_end) + circle_radius &&
//      circle_center.y >= min(line_y_start, line_y_end) - circle_radius &&
//      circle_center.y <= max(line_y_start, line_y_end) + circle_radius) {


////Compute W - a displacement vector pointing from the start of the line segment to the center of the circle
//    Vec2 StartLineToCircle = circle_center.minus(line_start);
//    float StartLineToCircle_len = StartLineToCircle.length();
  
////Solve quadratic equation for intersection point (in terms of l_dir and toCircle)
//    float a = 1; //Lenght of l_dir (we noramlized it)
//    float b = -2*dot(line_dir , StartLineToCircle);  //-2*dot(l_dir,toCircle)
//    float c = (StartLineToCircle.lengthSqr()) - (circle_radius)*(circle_radius);  //difference of squared distances
  
//    float d = b*b - 4*a*c;  //discriminant
  
//  //Vec2 CircleCenterToLineStartPoint = circle_center.minus(line_start);
//    Vec2 CircleCenterToLineEndPoint = circle_center.minus(line_end);
//    float CircleCenterToLineEndPoint_len = CircleCenterToLineEndPoint.length();
  
//  //if(StartLineToCircle_len <= circle_radius && CircleCenterToLineEndPoint_len <= circle_radius){
//  //  hit.hit = true;
//  //  print("Collision Detected!");
//  //}
  
//    if(d >= 0){
//    //If d is positive we know the line is colliding, but we need to check if the collision line is within the line segment
//      //  ... this means t will be between 0 and the lenth of the line segment
      
    
//      float t1 = (-b) / (2*a);  //Optimization: we only take the first collision [is this safe?]
      
//      if(t1 >= 0 && t1 <= line_len && t1 <= hit.t){
//        hit.hit = true;
//        hit.t = t1;
//        hit.Collision_Point = line_start.plus(line_dir.times(t1));
//        //print("Collision Detected!");
//        Vec2 PrticleToCollisionPointLowerLine = (circle_center.minus(hit.Collision_Point)).normalized();
//        circle_center = hit.Collision_Point.plus(PrticleToCollisionPointLowerLine.times(circle_radius));
      
//        Vec2 NormalToLowerLine = PrticleToCollisionPointLowerLine;
//        Vec2 B_NormalToLowerLine = NormalToLowerLine.times(dot(circle_vel , NormalToLowerLine));
//        circle_vel.subtract(B_NormalToLowerLine.times(1 + cor));
//      }
    
    
    
//  }
  
//  //else{
//  //  print("NO Collision!");
//  //}
  
  
  
  
//  }
  
  
//  return hit;
 
//}



//// Handle corner collisions
//void handleCornerCollision(int ballIndex, Vec2 corner) {
//  Vec2 dirToCorner = pos[ballIndex].minus(corner);
//  float distanceToCorner = dirToCorner.length();

//  if (distanceToCorner < radius[ballIndex]) {
//    // Ball has collided with the corner
//    Vec2 normal = dirToCorner.normalized();
    
//    // Reverse both X and Y velocity components
//    vel[ballIndex] = vel[ballIndex].minus(normal.times(2 * dot(vel[ballIndex], normal)));
    
//    // Adjust the ball's position to be outside the corner
//    pos[ballIndex] = corner.plus(normal.times(radius[ballIndex] + 1));
//  }
//}

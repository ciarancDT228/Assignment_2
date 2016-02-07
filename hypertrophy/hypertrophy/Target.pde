class Target extends GameObject
{
  
  Target()
  {
    theta = random(0, TWO_PI);
    forward.x = sin(theta);
    forward.y = - cos(theta);
    pos.x = width*0.5f;
    pos.y = height*0.5f;
    forward.mult(100);
    pos.add(forward);
    d = 3;
    c = color(255);
    forward.normalize();
    speed = 0.5f;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    stroke(c);
    ellipse(0, 0, d, d);
    popMatrix();
    println("Target");
  }
  
  void update()
  {
    forward.mult(speed);
    pos.sub(forward);
    forward.normalize();
  }
  
}//end class
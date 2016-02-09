class Target extends GameObject
{
  float shine;
  
  Target()
  {
    theta = random(0, TWO_PI);
    forward.x = sin(theta);
    forward.y = - cos(theta);
    pos.x = width*0.5f;
    pos.y = height*0.5f;
    forward.mult(width*0.6f);
    pos.add(forward);
    d = 5;
    c = color(0,random(30,200),255);
    forward.normalize();
    speed = random(0.4f,0.6f);
    shine = d/5*2;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    stroke(c);
    fill(c);
    ellipse(0, 0, d, d);
    popMatrix();
    
    pushMatrix();
    translate(pos.x,pos.y);
    stroke(255);
    fill(255);
    line(-shine, 0, 0, -shine);
    stroke(70,70,70);
    fill(70,70,70);
    line(shine, 0, 0, shine);
    popMatrix();
  }
  
  void update()
  {
    forward.mult(speed);
    pos.sub(forward);
    forward.normalize();
  }
  
}//end class
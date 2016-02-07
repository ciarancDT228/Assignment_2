class Bullet extends GameObject
{
  
  Bullet()
  {
    super(width * 0.5f, height * 0.5f, 5);
    speed = 1.0f;
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    pos.add(forward);
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    stroke(255);
    line(0, 0, 0, -7);
    point(1, -1);
    point(-1, -1);
    stroke(255,0,0);
    line(0, -7, 0, -5);
    popMatrix();
  }
  
  
  
}//end class
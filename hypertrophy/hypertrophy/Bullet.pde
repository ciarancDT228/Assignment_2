class Bullet extends GameObject
{
  Bullet()
  {
    super(width * 0.5f, height * 0.5f, 5);
    speed = 5.0f;
    theta = getTheta();
    //Adjusting start position of each bullet based on radius of player (which can increase)
    for(int i=gameObjects.size()-1; i>=0; i--)
    {
      GameObject go = gameObjects.get(i);
      if(go instanceof Player)
      {
        forward.x = sin(theta);
        forward.y = - cos(theta);
        forward.mult(go.r);
        pos.add(forward);
      }
    }//end for
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);
    pos.add(forward);
    //Garbage collection
    if(pos.x<0 || pos.y<0 || pos.x>width || pos.y>height)
    {
      gameObjects.remove(this);
    }
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
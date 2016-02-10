class Player extends GameObject
{
  float tempD;
  
  Player()
  {
    super(width * 0.5f, height * 0.5f, 10);
    c = color(255);
    tempD = d;
  }
  
  void update()
  {
    theta = getTheta();
    r=d*0.5f;
    if(d<tempD)
    {
      d+=2.0f;
      if(d>tempD)
      {
        d = tempD;
      }
    }
  }//end update
  
  void render()
  {
    fill(0);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    stroke(c);
    ellipse(0, 0, d, d);
    line(0, 0-halfR, 0, 0-halfR-r);
    popMatrix();
  }//end render
  
  void explode()
  {
    Explode explode = new Explode(pos.x, pos.y, d);
    gameObjects.add(explode);
  }

}
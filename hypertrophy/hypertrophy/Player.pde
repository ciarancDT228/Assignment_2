class Player extends GameObject
{
  float tempD;
  
  Player()
  {
    super(width * 0.5f, height * 0.5f, 10);
    c = color(255);
    tempD = d;
  }
  
  Player(float x, float y, float d)
  {
    super(x,y,d);
  }

  void update()
  {
    theta = getTheta();
    r=d*0.5f;
    if(d<tempD)
    {
      d+=1.0f;
    }
  }//end update
  
  void render()
  {
    noFill();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    stroke(c);
    ellipse(0, 0, d, d);
    line(0, 0-halfR, 0, 0-halfR-r);
    popMatrix();
  }//end render

}
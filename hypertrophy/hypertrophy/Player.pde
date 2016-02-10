class Player extends GameObject
{
  float tempD;
  float red, green, blue;
  float levels;
  float greenInc;
  float dDec;
  float weight;
  
  Player()
  {
    super(width * 0.5f, height * 0.5f, 10);
    red = 237;//237,28,36
    green = 28;
    blue = 36;
    c = color(red,green,blue);
    tempD = d;
    levels = 10;
    greenInc = 145/levels;
    dDec = d/levels;
    weight = d/30;
  }
  
  void update()
  {
    //Get the angle based on mouse position
    theta = getTheta();
    r=d*0.5f;
    //When the player expands, tempD is the size to expand to
    //So, if it's less than tempD, increase d
    if(d<tempD)
    {
      d+=2.0f;
      //In case we increase beyond d, correct this mistake
      if(d>tempD)
      {
        d = tempD;
      }
    }
  }//end update
  
  void render()
  {
    float tG = green;
    float tD = d;
    //recalculate weight and dDec because d can change
    dDec = d/levels;
    weight = d/30;
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    //This loop is what gives the player the red->orange gradient
    for(int i=0; i<levels; i++)
    {
      c = color(red,tG,blue);
      stroke(c);
      fill(c);
      ellipse(0, 0, tD, tD);
      //Increase green and decrease the diameter
      tG+=greenInc;
      tD-=dDec;
    }
    //This is the "gun" sticking out of the player
    strokeWeight(weight);
    rect(0-(weight*0.5f), 0-r-halfR, weight, r);
    strokeWeight(1);
    popMatrix();
  }//end render
  
  void explode()
  {
    Explode explode = new Explode(pos.x, pos.y, d);
    gameObjects.add(explode);
  }

}

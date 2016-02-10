class Explode extends GameObject
{
  float finalD;
  float red,green,blue;
  float inc;//Speed at which the diameter expands
  float dInc;//The gaps between each elipse being drawn (gradient of shading)
  float levels;//the level of detail on the shading (number of elipses drawn per frame)
  float colourDec;//Amount to decrement color in shading
  
  Explode(float x, float y, float r, float g, float b, float d)
  {
    pos.x = x;
    pos.y = y;
    red = r;
    green = g;
    blue = b;
    this.d = d;
    finalD = d*10;
    c = color(red,green,blue);
    levels = 6;
    inc = 2.0f;
    dInc = d/levels;
    colourDec = blue/levels;
  }
  
  Explode(float x, float y, float d)
  {
    pos.x = x;
    pos.y = y;
    this.d = d;
    red = 0;
    green = 255;
    blue = 255;
    finalD = width * 1.5f;
    c = color(red,green,blue);
    levels = 5;
    inc = 40.0f;
    dInc = 50.0f;
    colourDec = blue/levels;
  }

  void update()
  {
    r = d * 0.8f;
    if(d<finalD)
    {
      d+=inc;
    }
    else
    {
      gameObjects.remove(this);
    }
  }
  
  void render()
  {
    float tempD = d;
    if(finalD != width * 1.5f)
    {
      dInc = d/levels;
    }
    float tempG = green;
    float tempB = blue;
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    for(int i=0; i<levels; i++)
    {
      c = color(red,tempG,tempB);
      stroke(c);
      if(finalD != width*1.5f)
      {
        fill(c);
      }
      else
      {
        noFill();
      }
      tempG-=colourDec;
      tempB-=colourDec;
      ellipse(0, 0, tempD, tempD);
      tempD-=dInc;
    }
    tempG = green;
    tempB = blue;
    popMatrix();
  }
  
}
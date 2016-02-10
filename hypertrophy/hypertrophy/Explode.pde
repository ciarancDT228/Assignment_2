class Explode extends GameObject
{
  float finalD;
  float red,green,blue;
  float inc;
  
  Explode(float x, float y, float r, float g, float b, float d)
  {
    pos.x = x;
    pos.y = y;
    this.red = r;
    this.green = g;
    this.blue = b;
    this.d = d;
    finalD = d*10;
    c = color(red,green,blue);
    inc = 2.0f;
  }
  
  Explode(float x, float y, float d)
  {
    pos.x = x;
    pos.y = y;
    this.d = d;
    red = 0;
    green = 0;
    blue = 50;
    finalD = width;
    c = color(red,green,blue);
    inc = 70.0f;
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
    float dInc = d/5.0f;
    float tempG = green;
    float tempB = blue;
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    for(int i=0; i<5; i++)
    {
      c = color(red,tempG,tempB);
      stroke(c);
      fill(c);
      tempG-=50;
      tempB-=50;
      ellipse(0, 0, tempD, tempD);
      tempD-=dInc;
    }
    tempG = green;
    tempB = blue;
    popMatrix();
  }
  
}
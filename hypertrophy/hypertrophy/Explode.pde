class Explode extends GameObject
{
  float finalD;
  
  Explode(float x, float y, color c, float d)
  {
    pos.x = x;
    pos.y = y;
    this.c = c;
    this.d = d;
    finalD = 20;
  }
  
  void update()
  {
    if(d<finalD)
    {
      d+=2.0f;
    }
    else
    {
      gameObjects.remove(this);
    }
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
  }
  
}
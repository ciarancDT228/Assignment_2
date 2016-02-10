class TargetTrail extends GameObject
{
  float cInc;
  float shade;
  
  TargetTrail(float x, float y, float d)
  {
    pos.x = x;
    pos.y = y;
    this.d = d;
    shade = 100;
    cInc = shade/60;
    c = color(shade);
  }
  
  void update()
  {
    d-=0.05f;
    shade -= cInc;
    if(shade<0)
    {
      gameEffects.remove(this);
    }
    c = color(shade);
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    stroke(c);
    fill(c);
    ellipse(0, 0, d, d);
    popMatrix();
  }
  
}
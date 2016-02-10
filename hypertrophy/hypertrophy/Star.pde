class Star extends GameObject
{
  
  Star()
  {
    theta = random(0, TWO_PI);
    forward.x = sin(theta);
    forward.y = - cos(theta);
    pos.x = width*0.5f;
    pos.y = height*0.5f;
    c = color(random(10,100));
    speed = 0.01f;
    d = 0.01f;
  }
  
  void render()
  {
    stroke(c);
    fill(c);
    ellipse(pos.x, pos.y, d, d);
  }
  
  void update()
  {
    forward.mult(speed);
    pos.add(forward);
    forward.normalize();
    speed*=1.03;
    if(pos.x > width || pos.x < 0 || pos.y > height || pos.y < 0)
    {
      gameEffects.remove(this);
    }
    d*=1.025f;
  }
  
}

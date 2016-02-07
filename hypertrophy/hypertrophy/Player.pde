class Player extends GameObject
{
  Player()
  {
    super(width * 0.5f, height * 0.5f, 20);
  }
  
  Player(float x, float y, float d)
  {
    super(x,y,d);
  }

  
  
  void update()
  {
  }
  
  void render()
  {
    ellipse(pos.x, pos.y, d, d);
    line(pos.x, pos.y-halfR, pos.x, pos.y-halfR-r);
  }
  
}
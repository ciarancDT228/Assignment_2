abstract class GameObject
{
  //Fields
  PVector pos;
  PVector forward;
  float theta = 0.0f;
  float d;//diameter
  float r;//radius
  float halfR;
  float speed;
  color c;
  
  GameObject()
  {
    this(width * 0.5f, height * 0.5f, 20);
  }
  
  GameObject(float x, float y, float d)
  {
    pos = new PVector(x,y);
    forward = new PVector(0,-1);
    this.d = d;
    r = d * 0.5f;
    halfR = r * 0.5f;
    theta = 0.0f;
  }//end constructor
  
  abstract void update();
  abstract void render();
  
  float getTheta()
  {
    //Check the mouse is on the screen
    if(mouseX>0 && mouseY>0)
    {
      float o,a;
      //Calculate opposite and adjacent sides
      o = mouseX-pos.x;
      a = mouseY-pos.y;
      //Find the angle from the cursor to the centre of the screen (pos)
      theta = atan2(a, o) + HALF_PI;//Have to add half pi because the angle is off by 90 degrees for some reason
    }//end if on screen
    return (float)theta;
  }
  
}//end class
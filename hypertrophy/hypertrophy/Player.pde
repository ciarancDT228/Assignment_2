class Player extends GameObject
{
  float o,a;
  
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
    //Fields used to store the opposite and adjacent lengths to calculate theta
    
    //Check the mouse is on the screen
    if(mouseX>0 && mouseY>0)
    {
      o = Math.abs(mouseX-pos.x);
      a = Math.abs(mouseY-pos.y);
      //theta = atan(o/a);
      theta = atan2(o, a); 

    }//end if on screen
  }//end update
  
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    ellipse(0, 0, d, d);
    line(0, 0-halfR, 0, 0-halfR-r);
    popMatrix();
    println(o);
  }
  
}
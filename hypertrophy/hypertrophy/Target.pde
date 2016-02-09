class Target extends GameObject
{
  AudioPlayer audio;
  
  Target()
  {
    theta = random(0, TWO_PI);
    forward.x = sin(theta);
    forward.y = - cos(theta);
    pos.x = width*0.5f;
    pos.y = height*0.5f;
    forward.mult(width*0.6f);
    pos.add(forward);
    d = 3;
    c = color(0,random(0,150),243);
    forward.normalize();
    speed = 0.5f;
    audio = minim.loadFile("impact.wav");
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    stroke(c);
    ellipse(0, 0, d, d);
    popMatrix();
  }
  
  void update()
  {
    forward.mult(speed);
    pos.sub(forward);
    forward.normalize();
    checkTargetDist();
  }
  
  //This method checks if the target has hit the outside of the player circle
  //If it does hit, the circle grows and the target is deleted
  void checkTargetDist()
  {
    //Loop through array of gameObjects to find target objects
    for(int i=gameObjects.size()-1; i>=0; i--)
    {
      GameObject go = gameObjects.get(i);
      if(go instanceof Target)
      {
        //Loop through array of gameObjects to find Player object
        for(int j=gameObjects.size()-1; j>=0; j--)
        {
          GameObject go2 = gameObjects.get(j);
          if(go2 instanceof Player)
          {
            if(go.pos.dist(go2.pos) < go2.r)
            {
              audio.rewind();
              audio.play();
              gameObjects.remove(this);
              ((Player)go2).tempD+=10;
            }//end if
          }//end if
        }//end for
      }//end if
    }//end for
  }//end checkTargetDist
  
}//end class
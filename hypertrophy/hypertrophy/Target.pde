class Target extends GameObject
{
  AudioPlayer audio;
  float shine;
  
  Target()
  {
    theta = random(0, TWO_PI);
    forward.x = sin(theta);
    forward.y = - cos(theta);
    pos.x = width*0.5f;
    pos.y = height*0.5f;
    forward.mult(width*0.6f);
    pos.add(forward);
    d = 5;
    c = color(0,random(30,200),255);
    forward.normalize();
    speed = random(0.4f,0.6f);
    audio = minim.loadFile("impact.wav");
    shine = d/5*2;
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
    
    pushMatrix();
    translate(pos.x,pos.y);
    stroke(255);
    fill(255);
    line(-shine, 0, 0, -shine);
    stroke(70,70,70);
    fill(70,70,70);
    line(shine, 0, 0, shine);
    popMatrix();
  }
  
  void update()
  {
    forward.mult(speed);
    pos.sub(forward);
    forward.normalize();
    //checkTargetDist();
  }
  
  //This method checks if the target has hit the outside of the player circle
  //If it does hit, the circle grows and the target is deleted
  /*void checkTargetDist()
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
              break;
            }//end if
          }//end if
        }//end for
      }//end if
    }//end for
  }//end checkTargetDist*/
  
}//end class
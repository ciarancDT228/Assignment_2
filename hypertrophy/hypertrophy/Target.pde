class Target extends GameObject
{
  float shine;
  float red,green,blue;
  int counter = -1;
  
  Target()
  {
    theta = random(0, TWO_PI);
    forward.x = sin(theta);
    forward.y = - cos(theta);
    pos.x = width*0.5f;
    pos.y = height*0.5f;
    forward.mult(width*0.6f);
    pos.add(forward);
    d = random(5,10);
    red = 0;
    green = random(30,200);
    blue = 255;
    c = color(red,green,blue);
    forward.normalize();
    speed = random(0.4f,1.2f);
    //speed = 10;
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
    counter++;
    if(counter==10)
    {
      TargetTrail t = new TargetTrail(pos.x, pos.y, d);
      gameEffects.add(t);
      counter=0;
    }
  }
  
  void explode()
  {
    Explode explode = new Explode(pos.x, pos.y, red, green, blue, d);
    gameObjects.add(explode);
  }
  
}//end class
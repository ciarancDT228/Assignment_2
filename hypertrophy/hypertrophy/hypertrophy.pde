import ddf.minim.*;
Minim minim;
AudioPlayer shoot;
AudioPlayer pop;

void setup()
{
  minim = new Minim(this);
  size(500,500);
  background(0);
  stroke(255);
  fill(0);
  Player player = new Player();
  gameObjects.add(player);
  shoot = minim.loadFile("shoot.wav");
  pop = minim.loadFile("pop.wav");
}

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
int timer = 0;
/*boolean[] keys = new boolean[512];

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}*/

void draw()
{
  background(0);
  for(int i=gameObjects.size()-1; i>=0; i--)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
  }
  if(timer > 30)
  {
    Target target = new Target();
    gameObjects.add(target);
    timer = 0;
  }
  timer++;
  checkCollisions();
  println(gameObjects.size());
}//end for loop

void mousePressed()
{
  Bullet bullet = new Bullet();
  gameObjects.add(bullet);
  shoot.rewind();
  shoot.play();
}

void checkCollisions()
{
  for(int i=gameObjects.size()-1;i>=0;i--)
  {
    GameObject go = gameObjects.get(i);
    if(go instanceof Target)
    {
      for(int j=gameObjects.size()-1;j>=0;j--)
      {
        GameObject go2 = gameObjects.get(j);
        if(go2 instanceof Bullet)
        {
          if(go.pos.dist(go2.pos)<5)
          {
            gameObjects.remove(go);
            gameObjects.remove(go2);
            pop.rewind();
            pop.play();
            break;
          }//end if collision
        }//end if bullet
      }//end for j
    }//end if target
  }//end for i
}//end checkCollisions
import ddf.minim.*;
Minim minim;
AudioPlayer shoot;
AudioPlayer pop;
AudioPlayer audio;

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
  audio = minim.loadFile("impact.wav");
}

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
int timer = 0;
boolean removeBullet = false;
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
  
  if(timer > 30)
  {
    Target target = new Target();
    gameObjects.add(target);
    timer = 0;
  }
  timer++;
  checkCollisions();
  
  for(int i=gameObjects.size()-1; i>=0; i--)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
  }
  
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
  GameObject bullet = gameObjects.get(0);
  for(int i=gameObjects.size()-1;i>=0;i--)
  {
    GameObject go1 = gameObjects.get(i);
    if(go1 instanceof Target)
    {
      for(int j=gameObjects.size()-1;j>=0;j--)
      {
        GameObject go2 = gameObjects.get(j);
        if(go2 instanceof Bullet)
        {
          if(go1.pos.dist(go2.pos)<go1.r)
          {
            gameObjects.remove(go1);
            removeBullet = true;
            bullet = go2;
            pop.rewind();
            pop.play();
          }//end if collision
        }//end if bullet
        if(go2 instanceof Player)
        {
          if(go1.pos.dist(go2.pos) < go2.r)
          {
            audio.rewind();
            audio.play();
            gameObjects.remove(go1);
            ((Player)go2).tempD+=10;
          }//end if
        }//end if Player
      }//end for j
    }//end if target
  }//end for i
  if(removeBullet == true)
  {
    gameObjects.remove(bullet);
    removeBullet = false;
  }
}//end checkCollisions
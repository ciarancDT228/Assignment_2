void setup()
{
  size(500,500);
  background(0);
  stroke(255);
  fill(0);
  Player player = new Player();
  gameObjects.add(player);
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
  if(timer > 60)
  {
    Target target = new Target();
    gameObjects.add(target);
    timer = 0;
  }
  timer++;
}//end for loop

void mousePressed()
{
  Bullet bullet = new Bullet();
  bullet.theta = bullet.getTheta();
  gameObjects.add(bullet);
}
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

void draw()
{
  for(int i=gameObjects.size()-1; i>=0; i--)
  {
    GameObject go = gameObjects.get(i);
    go.render();
  }
}//end for loop
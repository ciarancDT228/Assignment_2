//Ciarán Carroll D15124233
//Computer Science DT228/2

//Music from http://ericskiff.com/music/
//Sounds from https://www.freesound.org/
import ddf.minim.*;
Minim minim;
AudioPlayer shoot;
AudioPlayer pop;
AudioPlayer audio;
AudioPlayer soundTrack;

void setup()
{
  minim = new Minim(this);
  //fullScreen();
  size(500,500);
  background(0);
  //Adding player object
  Player player = new Player();
  gameObjects.add(player);
  //Instantiating audio files
  shoot = minim.loadFile("shoot.wav");
  pop = minim.loadFile("pop.wav");
  audio = minim.loadFile("impact.wav");
  audio.setGain(10);
  soundTrack = minim.loadFile("tune2.mp3");
  soundTrack.setGain(-6);
  soundTrack.loop();
}

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
//Seperate arraylist for effects/particles, to make object loops more efficient
ArrayList<GameObject> gameEffects = new ArrayList<GameObject>();
//Timer to control rate of target spawning
int timer = 0;
//Keeps track of game time
int gameTimer = 0;
//Timer used to control weapon fire rate
int elapsed = 0;
//Counts the number of targets destroyed (by a bullet or by another target exploding)
int destroyed = 0;
//Boolean needed for removing a bullet object when a bullet hits a target
//For some reason removing two objects at once inside a nested loop results in an outOfBounds sometimes...
boolean removeBullet = false;
//Flag to indicate whether game is over
boolean gameOver = false;
//Boolean used to count targets being destroyed. Have to use boolean to prevent same target getting counted twice
boolean hit = false;
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
  for(int i=gameEffects.size()-1; i>=0; i--)
  {
    GameObject go = gameEffects.get(i);
    go.render();
    go.update();
  }
  if(gameOver == false)
  {
    if(timer > 20)
    {
      Target target = new Target();
      gameObjects.add(target);
      timer = 0;
    }
    for(int i=gameObjects.size()-1; i>=0; i--)
    {
      GameObject go = gameObjects.get(i);
      go.update();
      go.render();
    }
    gameTimer++;
    fill(255);
    text("Targets Destroyed : " + destroyed, width-130, height-10);
    text("Time Elapsed : " + gameTimer/60, 10, height-10); 
  }
  else
  {
    gameOver();
  }
  timer++;
  elapsed++;
  checkCollisions();
  GameObject star = new Star();
  gameEffects.add(star);
}//end for loop

void mousePressed()
{
  if(elapsed > 12 && gameOver==false)
  {
    Bullet bullet = new Bullet();
    gameObjects.add(bullet);
    shoot.rewind();
    shoot.play();
    elapsed = 0;
  }
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
            ((Target)go1).explode();
            gameObjects.remove(go1);
            hit=true;
            removeBullet = true;
            bullet = go2;
            pop.rewind();
            pop.play();
          }//end if collision
        }//end if bullet
        if(go2 instanceof Player)
        {
          if(go2.d>width || go2.d>height)
          {
            gameOver=true;
            soundTrack.pause();
          }
          if(go1.pos.dist(go2.pos) < go2.r)
          {
            audio.rewind();
            audio.play();
            gameObjects.remove(go1);
            ((Player)go2).tempD+=(height/8);
            ((Player)go2).explode();
          }//end if
        }//end if Player
        if(go2 instanceof Explode)
        {
          if(go1.pos.dist(go2.pos) < go2.r)
          {
            ((Target)go1).explode();
            gameObjects.remove(go1);
            //Check what kind of explosion it is (there are 2 kinds, target exploding or player exploding)
            //If the player is exploding then don't count the targets being destroyed
            if(((Explode)go2).finalD != width * 1.5)
            {
              hit=true;
            }
            pop.rewind();
            pop.play();
          }
        }//end if explode
      }//end for j
    }//end if target
  }//end for i
  if(removeBullet == true)
  {
    gameObjects.remove(bullet);
    removeBullet = false;
  }
  if(hit == true)
  {
    destroyed++;
    hit=false;
  }
}//end checkCollisions

void gameOver()
{
  textSize(32);
  textAlign(CENTER,CENTER);
  fill(237,28,36);
  text("GAME OVER!", width*0.5f, height*0.5f - 50);
  textSize(14);
  fill(255);
  text("Targets Destroyed : " + destroyed, (width*0.5f)+80, (height*0.5f)+50);
  text("Time Elapsed : " + gameTimer/60, (width*0.5f)-80, (height*0.5f)+50);
}
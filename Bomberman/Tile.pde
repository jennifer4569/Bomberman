public class Tile {
  int[][] moves = {{-1, 0}, {1, 0}, {0, 1}, {0, -1}};
  //0: UP
  //1: DOWN
  //2: RIGHT
  //3: LEFT
  
  int row;
  int col;
  float x;
  float y;
  float sideL;
  Obstacle obs;
  
  boolean isRed;

  public Tile(int row, int col, float x, float y, float sideL) { //randomly generates obs
    this.row = row;
    this.col = col;
    this.x = x;
    this.y = y;
    this.sideL = sideL;
    /*if((int)(Math.random() * 1000) % 100 < 50){ //50% chance for obstacle
     obs = new Obstacle((int)(Math.random() * 1000) % 100 < 50); //50% chance outta those to have breakable
     }*/
  }
  /*public Tile(float x, float y, float sideL, boolean hasObs, boolean isBreakable){ //randomly generates obs
   this.x = x;
   this.y = y;
   this.sideL = sideL;
   if(hasObs){
   obs = new Obstacle(isBreakable, this); 
   }
   }*/

  public void place(Obstacle obs) {
    this.obs=obs;
  }

  public void display() {
    if (obs != null) {
      if (obs.isBreakable) {
        if (obs.type == 0) {
          image(loadImage("BreakableObstacle.png"), x, y, sideL, sideL);
        } else if (obs.type == 2) {
          image(loadImage("Player.png"), x, y, sideL, sideL);
        } else {
          image(loadImage("Bomb.png"), x, y, sideL, sideL);
        }
      } else {
        image(loadImage("UnbreakableObstacle.png"), x, y, sideL, sideL);
      }
    } else {
      if(!isRed){
        fill(225, 225, 225); 
      }
      else{
         fill(255,0,0); 
      }
      rect(x, y, sideL, sideL);
    }

    //rect(x, y, sideL, sideL);
  }
void explodedOn(){
  isRed = true;
  if(obs != null && obs.isBreakable){
     obs = null; 
  }
}

  boolean hasObstacle() {
    return obs != null;
  }
}
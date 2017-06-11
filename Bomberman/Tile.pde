public class Tile {
  int[][] moves = {{-1, 0}, {1, 0}, {0, 1}, {0, -1}};
  //0: UP
  //1: DOWN
  //2: RIGHT
  //3: LEFT
  int danger;

  int row;
  int col;
  float x;
  float y;
  float sideL;
  Obstacle obs;
  Obstacle player;
  Obstacle enemy;
  int isRed;

  public Tile(int row, int col, float x, float y, float sideL) { //randomly generates obs
    this.row = row;
    this.col = col;
    this.x = x;
    this.y = y;
    this.sideL = sideL;
    danger=0;
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
    if (obs.type == 2) {
      player = obs;
    } else if (obs.type ==4) {
      enemy = obs;
    } else {
      this.obs=obs;
    }
  }

  public void display() {
    if (obs != null) {
      obs.display();
    } else if (player!=null) {
      player.display();
    } else if (enemy != null) {
      enemy.display();
    } else {
      if (isRed<=0) {
        fill(225, 225, 225);
      } else {
        fill(255, 0, 0); 
        isRed--;
      }
      rect(x, y, sideL, sideL);
    }
  }
  void explodedOn() {
    isRed = 17;
    danger--;
    if (obs != null && obs.isBreakable) {
      obs = null;
    }
  }

  boolean hasObstacle() {
    return obs != null;
  }

  int getRow() {
    return row;
  }
  int getCol() {
    return col;
  }

  Obstacle getThingHere() {
    return obs;
  }
  
  char toChar() {
    if (obs==null || obs.isBreakable) {
      return ' ';
    } else {
      return '#';
    }
  }
}
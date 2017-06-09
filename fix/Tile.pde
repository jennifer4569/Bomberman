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
  Obstacle player;
  
  int isRed;

  public Tile(int row, int col, float x, float y, float sideL) {
    this.row = row;
    this.col = col;
    this.x = x;
    this.y = y;
    this.sideL = sideL;
  }
  public void place(Obstacle obs) {
    if(obs.type == 2){
     player = obs; 
    }
    else{
      this.obs=obs;
    }
  }
  public void display() {
    if (obs != null) {
      if (obs.isBreakable) {
        if (obs.type == 0) {
          image(loadImage("BreakableObstacle.png"), x, y, sideL, sideL);
        } else if (obs.type == 3){
          image(loadImage("Bomb.png"), x, y, sideL, sideL);
        }
      } else {
        image(loadImage("UnbreakableObstacle.png"), x, y, sideL, sideL);
      }
    } else if(player != null){
      image(loadImage("Player.png"), x, y, sideL, sideL);
    }
    else{
      if(isRed<=0){
        fill(225, 225, 225); 
      }
      else{
         fill(255,0,0);
         isRed--;
      }
      rect(x, y, sideL, sideL);
    }

    //rect(x, y, sideL, sideL);
  }
void explodedOn(){
  isRed = 17;
  if(obs != null && obs.isBreakable){
     obs = null; 
  }
}

  boolean hasObstacle() {
    return obs != null;
  }
}
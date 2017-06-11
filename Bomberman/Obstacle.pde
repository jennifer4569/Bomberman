public class Obstacle {
  boolean isBreakable;
  Tile location;
  int type; //type: 0 = breakable obstacle, 1 = unbreakable obstacle, 2 = player, 3 = bomb    
  public Obstacle(boolean isBreak, Tile location) { //assume that its an obstacle
    isBreakable = isBreak; 
    this.location=location;
    if (isBreakable) {
      type = 0;
    } else {
      type = 1;
    }
  }
  public Obstacle(int type, Tile location) {
    this.type = type;
    this.location = location;
    if (type == 0 || type == 2 || type == 3) {
      isBreakable = true;
    } else {
      isBreakable = false;
    }
  }
  public Tile where() {
    return location;
  }
  public void setLocation(Tile location) {
    this.location = location;
  }
  int getType() {
    return type;
  }
  char toChar() {
    if (isBreakable) {
      return ' ';
    } else {
      return '#';
    }
  }

  void display() {
    if (isBreakable) {
      image(loadImage("BreakableObstacle.png"), where().x, where().y, where().sideL, where().sideL);
    } else {

      image(loadImage("UnbreakableObstacle.png"), where().x, where().y, where().sideL, where().sideL);
    }
  }
}
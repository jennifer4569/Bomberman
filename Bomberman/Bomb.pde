public class Bomb extends Obstacle {
  float timer;
  public Bomb(Tile location) {
    super(3, location);
  }

  boolean go() { //returns true if it exploded
    timer++;
    if (timer >= 10000) {
      explode();
      return true;
    }
    return false;
  }
  void explode(){
    getLocation().obs = null;
  }

}
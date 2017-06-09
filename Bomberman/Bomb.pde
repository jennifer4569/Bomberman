public class Bomb extends Obstacle {
  float timer;
  public Bomb(Tile location) {
    super(3, location);
  }

  boolean go() { //returns true if it exploded
    timer++;
    if (timer >= 100) {
      //explode();
      return true;
    }
    return false;
  }/*
  void explode(){
    getLocation().obs = null;
    for(Tile t : ){
     t.turnRed(); 
    }
    getLocation().display();
  }
*/
void display(){
          image(loadImage("Bomb.png"), where().x, where().y, where().sideL, where().sideL); 
}

}
public class Bomb extends Obstacle {
  float timer;
  int animateNum;
  public Bomb(Tile location) {
    super(3, location);
  }

  boolean go() { //returns true if it exploded
    timer++;
    if (timer >= 50) {
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
  if(animateNum / 10 > 2){
    animateNum = 0;
  }
  image(loadImage("./Sprites/Bomb/Bomb" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL); 
  animateNum++;
}

}
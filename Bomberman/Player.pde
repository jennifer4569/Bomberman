public class Player extends Obstacle {
  int animateNum;

  public Player(Tile location) {
    super(2, location);
    animateNum = 10;
  }
  
  void display(){
   image(loadImage("/Sprites/Player/Still" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL); 
   animateNum++;
   if(animateNum / 10 > 12){
    animateNum = 10; 
   }
  }
}
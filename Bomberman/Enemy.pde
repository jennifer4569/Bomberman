class Enemy extends Obstacle {
  Pathfinder p;
  public Enemy(Tile location, Board b) {
    super(4, location);
    p = new Pathfinder(b);
  }
  void go(){
     setLocation(p.findNextMove(this)); 
  }
  void display(){
    image(loadImage("Player.png"), where().x, where().y, where().sideL, where().sideL);
  }
  /*
  
  void display() {
    if (animateType == 0) {
      if (animateNum / 10 > 7) {
        animateNum = 0;
      }
      image(loadImage("./Sprites/Player/Up" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL);
    }
    if (animateType == 1) {
      if (animateNum / 10 > 7) {
        animateNum = 0;
      }
      image(loadImage("./Sprites/Player/Down" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL);
    }
    if (animateType == 2) {
      if (animateNum / 10 > 7) {
        animateNum = 0;
      }
      image(loadImage("./Sprites/Player/Right" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL);
    }

    if (animateType == 3) {
      if (animateNum / 10 > 7) {
        animateNum = 0;
      }
      image(loadImage("./Sprites/Player/Left" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL);
    }

    if (animateType == 4) {  
      if (animateNum / 10 > 11) {
        animateNum = 0;
      }
      image(loadImage("./Sprites/Player/Still" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL);
    }
    animateNum++;
  }
  */
}
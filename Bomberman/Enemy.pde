class Enemy extends Obstacle {
  int animateNum;
  int animateType;
  public Enemy(Tile location) {
    super(4, location);
    animateType = 4;
  }
  /*void display(){
   image(loadImage("Player.png"), where().x, where().y, where().sideL, where().sideL);
   }*/

  public void setLocation(Tile location) {
    this.location.enemy=null;
    this.location = location;
    this.location.place(this);
  }
  void display() {
    if (animateType == 0) {
      if (animateNum / 10 > 7) {
        animateNum = 0;
      }
      image(loadImage("./Sprites/EnemyRed/Up" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL);
    }
    if (animateType == 1) {
      if (animateNum / 10 > 7) {
        animateNum = 0;
      }
      image(loadImage("./Sprites/EnemyRed/Down" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL);
    }
    if (animateType == 2) {
      if (animateNum / 10 > 7) {
        animateNum = 0;
      }
      image(loadImage("./Sprites/EnemyRed/Right" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL);
    }

    if (animateType == 3) {
      if (animateNum / 10 > 7) {
        animateNum = 0;
      }
      image(loadImage("./Sprites/EnemyRed/Left" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL);
    }

    if (animateType == 4) {  
      if (animateNum / 10 > 11) {
        animateNum = 0;
      }
      image(loadImage("./Sprites/EnemyRed/Still" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL);
    }
    animateNum++;
  }
  void die() {
    for (int i = 0; i <= 4; i++) {
      image(loadImage("./Sprites/EnemyRed/Die" + i + ".png"), where().x, where().y, where().sideL, where().sideL);
      //delay(100);
    }
    where().enemy = null;
  }
}
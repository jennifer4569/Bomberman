public class Player extends Obstacle {
  int animateNum;
  int animateType;
  int waitTimer; //timer for how long the player stood still
  //0: Up
  //1: Down
  //2: Right
  //3: Left
  //4: Still
  public Player(Tile location) {
    super(2, location);
    animateType = 4;
  }
  
  void display(){
    if(animateType == 0){
       if(animateNum / 10 > 7){
        animateNum = 0; 
        }
      image(loadImage("./Sprites/Player/Up" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL); 
    }
    if(animateType == 1){
       if(animateNum / 10 > 7){
        animateNum = 0; 
        }
      image(loadImage("./Sprites/Player/Down" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL); 
    }
    if(animateType == 2){
       if(animateNum / 10 > 7){
        animateNum = 0; 
        }
      image(loadImage("./Sprites/Player/Right" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL); 
    }
    
    if(animateType == 3){
       if(animateNum / 10 > 7){
        animateNum = 0; 
        }
      image(loadImage("./Sprites/Player/Left" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL); 
    }
    
    if(animateType == 4){  
       if(animateNum / 10 > 11){
        animateNum = 0; 
        }
     image(loadImage("./Sprites/Player/Still" + animateNum / 10 + ".png"), where().x, where().y, where().sideL, where().sideL); 
    }
    
   animateNum++;
  }
  
  void setAnimate(int type){
    if(animateType != type){
      animateType = type;  
      animateNum = 0;
    }
    waitTimer = 100;
  }
  void go(){
    if(waitTimer <= 0 && animateType != 4){
      animateType = 4;
      animateNum = 0;
    }
   waitTimer--;
  }
}
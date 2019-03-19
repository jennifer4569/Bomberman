import controlP5.*;

Main m;
int stage; 
boolean finishedSetup;

//due to an unknown bug with different boards, we have disabled the create level button
boolean create_level = false;
//boolean create_level = true;


//0: Main Menu
//1: Create Levels
//2: Load Levels
ControlP5 cp5;
void setup() {
  size(600, 600);
  cp5 = new ControlP5(this);
  //menuSetup: start, create level, options, quit
  if(!create_level){
    cp5.addButton("begin").setValue(10).setPosition(100, 100).setSize(100, 100);
  }
  else{
    cp5.addButton("createLevel").setValue(10).setPosition(400, 100).setSize(100, 100);
  }
  cp5.addButton("quitGame").setValue(20).setPosition(100, 400).setSize(100, 100);
  finishedSetup = true;
}

void begin() {
  if (finishedSetup && stage == 0) {
    removeButtons();
    stage = 2;
    m = new Main(true);
  }
}
void createLevel() {
  if (finishedSetup && stage == 0) {
    removeButtons();
    stage = 1;
    m = new Main(false);
  }
}
void removeButtons() {
  if(!create_level){
    cp5.getController("begin").remove();
  }
  else{
    cp5.getController("createLevel").remove();
  }
  cp5.getController("quitGame").remove();
  background(100);
}
void quitGame() {
  if (finishedSetup && stage == 0) {
    System.exit(0);
  }
}

void draw() {
  if (stage == 1) {
    m.go();
    m.display();
  }

  if (stage == 2) {
    if (m.b.player != null) {
      m.go();
      m.display();
    } else {
      playAgain();
    }
  }
}
void playAgain() {
  m = new Main(true);
  stage = 2;
}
void keyPressed() {
  if (stage == 1) {//type: 0 = breakable obstacle, 1 = unbreakable obstacle, 2 = player
    if (key == '#' || key == '1') {
      m.b.deleteObs(mouseX, mouseY); 
      m.b.addObs(mouseX, mouseY, 1);
    }
    if (key == '-' || key == '2') {
      m.b.deleteObs(mouseX, mouseY); 
      m.b.addObs(mouseX, mouseY, 0);
    }
    if (key == 'P' || key == '3' || key == 'p') {
      m.b.deleteObs(mouseX, mouseY); 
      m.b.addObs(mouseX, mouseY, 2);
    }
    if (key == 'E' || key == '4' || key == 'e') {
      m.b.deleteObs(mouseX, mouseY); 
      m.b.addObs(mouseX, mouseY, 4);
    }
    if (key == BACKSPACE) {
      m.b.deleteObs(mouseX, mouseY);
    }
    if (key == ENTER) {
      System.out.println("SAVED!");
      m.b.save();
    }
  }
  if (stage == 2) {
    if (m.b.player != null) {
      if (key == CODED) {
        if (keyCode == UP) {
          m.b.movePlayer(0);
        }
        if (keyCode == DOWN) {
          m.b.movePlayer(1);
        }
        if (keyCode == RIGHT) {
          m.b.movePlayer(2);
        }
        if (keyCode == LEFT) {
          m.b.movePlayer(3);
        }
      }
      if (key == ' ') {
        m.b.dropBomb();
      }
      if (key == 'r') {
        playAgain();
      }
    }
  }
}

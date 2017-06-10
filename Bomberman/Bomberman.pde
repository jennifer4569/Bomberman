Main m;

void setup() {
  size(600, 600);
  m = new Main();
}
void draw() {
  m.go();
  m.display();
}

void keyPressed() {
  if(m.b.player != null){
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
  }}
}
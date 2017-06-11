public class Main {
  Board b;
  boolean play;
  public Main() {
    b = new Board("board1.txt", 20, 10);
  }
  public Main(boolean play) {
    this.play = play;
    b = new Board("board1.txt", 20, 10);
    
    
    
  }
  void go() {
    b.go();
  }
  void display() {
    b.display();
  }
}
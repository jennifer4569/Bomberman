public class Main {
  Board b;
  public Main() {
    b = new Board("board1.txt", 20, 10);
  }
  void go() {
    b.go();
  }
  void display() {
    b.display();
  }
}
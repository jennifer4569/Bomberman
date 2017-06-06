public class Main {
  Board b;
  public Main() {
    //b = new Board(17, 15, 20, 10); 
    b = new Board("board1.txt", 20, 10);
  }
  void go() {
  }
  void display() {
    b.display();
  }
}
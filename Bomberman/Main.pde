public class Main {
  Board b;
  boolean play; 
  //true: play level
  //false: create level

  /*public Main() {
   b = new Board("board1.txt", 20, 10);
   }*/
  public Main(boolean play) {
    this.play = play;
    if(play){
      b = new Board("board1.txt", 20, 10);
    }
    else{
     b = new Board(10,10,20,10); 
    }
  }
  void go() {
    b.go(play);
  }
  void display() {
    b.display();
  }
}
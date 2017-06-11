public class Main {
  Board b;
  boolean play; 
  Pathfinder p;
  int ticks;
  //true: play level
  //false: create level

  /*public Main() {
   b = new Board("board1.txt", 20, 10);
   }*/
  public Main(boolean play) {
    this.play = play;
    if(play){
      b = new Board("board1.txt", 20, 10);
      p = new Pathfinder(b);
    }
    else{
     b = new Board(10,10,20,10); 
    }
  }
  void go() {
    ticks++;
    b.go(play);
    if(play &&b.enemy!=null&& ticks%7==0){
      Tile L=p.findNextMove(b.enemy);
      if(L.player==null && L.obs==null){
        b.enemy.setLocation(L);
      }else{
        b.enemyBomb();
      }
    }
  }
  void display() {
    b.display();
  }
}
public class Board{
  Tile[][] board;
  int startX;
  int startY;
  float increment;
  
  public Board(int row, int col, int startX, int startY){
    this.startX = startX;
    this.startY = startY;
    board = new Tile[row][col];
    float increment = width / board[0].length;
    if(increment > height / board.length){
       increment = height / board.length; 
    }
    increment *= 0.8;
    
    this.increment = increment;
    
    float x = startX;
    float y = startY;
    
    for(int r = 0; r < board.length; r++){
      for(int c = 0; c < board[0].length; c++){
          board[r][c] = new Tile(x, y, increment); 
          x += increment;
       }
       x = startX;
       y += increment; 
    }
    board[0][0].obs = null;
    board[0][0].display();
    
  }
  
  public void display(){
    float increment = width / board[0].length;
    if(increment > height / board.length){
       increment = height / board.length; 
    }
    
    for(int r = 0; r < board.length; r++){
      for(int c = 0; c < board[0].length; c++){
        board[r][c].display();
      }
    }
    
    
    image(loadImage("Player.png"), startX * 33 / 26, startY, 14 * this.increment / 26, this.increment);
    
    
    
  
}
}
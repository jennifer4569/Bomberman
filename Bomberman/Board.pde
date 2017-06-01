import java.util.Scanner;
import java.io.FileNotFoundException;
public class Board{
  Tile[][] board;
  int startX;
  int startY;
  float increment;
  public Board(String fileName, int startX, int startY){
    this.startX = startX;
    this.startY = startY;
    initBoard(fileName);
    
  }
  void initBoard(String fileName){
    int numRows = 0;
    int numCols = 0;
    ArrayList<String> values = new ArrayList<String>();
    try{
      Scanner scan = new Scanner(new File(fileName)); //ERROR IS HERE
      String currentLine;
      while(scan.hasNext()){
        currentLine = scan.nextLine();
        for(int i = 0; i < currentLine.length(); i++){
          values.add(currentLine.substring(i, i + 1));
          numRows++;
        }
        numCols++;
      }
    }
    catch(FileNotFoundException e){
      System.out.println("File not found!");
      System.exit(0);
    }
    board = new Tile[numRows][numCols];
    
    float increment = width / board[0].length;
    if(increment > height / board.length){
       increment = height / board.length; 
    }
    increment *= 0.8;
    this.increment = increment;
    
    float x = startX;
    float y = startY;
    for(int r = 0; r < numRows; r++){
      for(int c = 0; c < numCols; c++){
        String current = values.remove(0);
        if(current.equals("#")){
          board[r][c] = new Tile(x, y, increment, true, false);
        }
        else if(current.equals("-")){
          board[r][c] = new Tile(x, y, increment, true, true);
        }
        else if(current.equals(" ")){
          board[r][c] = new Tile(x, y, increment,false, false);
        }
        else{
          System.out.println("Board should only have '#', '-', or ' '!");
         System.exit(0); 
        }
        x += increment;
      }
      x = startX;
      y += increment;
    }
    
  }
  
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
import java.util.Scanner;
import java.io.FileNotFoundException;
public class Board{
  Tile[][] board;
  Player player;
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
    //try{
      //System.out.println(new File(fileName).getAbsolutePath());
      //Scanner scan = new Scanner(new File(fileName));
      //Scanner scan = new Scanner(new File(fileName)); //ERROR IS HERE
      /*String currentLine;
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
    }*/
    String[] lines = loadStrings(fileName);
    numRows = lines.length;
    numCols = lines[0].length();
    for(int r = 0; r < lines.length; r++){
     for(int c = 0; c < lines[r].length(); c++){
      values.add(lines[r].substring(c, c+1));
     }
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
    int numPlayers = 0;
    for(int r = 0; r < numRows; r++){
      for(int c = 0; c < numCols; c++){
        String current = values.remove(0);
        board[r][c] = new Tile(x, y, increment);
        if(current.equals("#")){
          board[r][c].place(new Obstacle(false,board[r][c]));
        }
        else if(current.equals("-")){
          board[r][c].place(new Obstacle(true,board[r][c]));
        } else if(current.equals("P")){
          if (numPlayers==0){
            player=new Player(board[r][c]);
            board[r][c].place(player);
            numPlayers++;
          } else{
            System.out.println("Board should have exactly one player!");
            System.exit(0); 
          }
        } else if (!current.equals(" ")){
          System.out.println("Board should only have '#', '-', 'P', or ' '!");
         System.exit(0); 
        }
        x += increment;
      }
      x = startX;
      y += increment;
    }
    if (player==null){
      System.out.println("Board should have exactly one player!");
      System.exit(0);
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
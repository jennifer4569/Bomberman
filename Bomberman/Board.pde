public class Board {
  int[][] moves = {{-1, 0}, {1, 0}, {0, 1}, {0, -1}};
  //0: UP
  //1: DOWN
  //2: RIGHT
  //3: LEFT

  Tile[][] board;
  Player player;
  ArrayList<Bomb> bombs;
  //ArrayList<Enemy> enemies;
  Enemy enemy;
  int startX;
  int startY;
  float increment;
  public Board(String fileName, int startX, int startY) {
    this.startX = startX;
    this.startY = startY;
    initBoard(fileName);
    bombs = new ArrayList<Bomb>();
    //enemies = new ArrayList<Enemy>();
  }
  void initBoard(String fileName) {
    int numRows = 0;
    int numCols = 0;
    ArrayList<String> values = new ArrayList<String>();
    if (loadStrings(fileName) == null) {
      System.out.println("File not found!");
      System.exit(0);
    }
    String[] lines = loadStrings(fileName);
    numRows = lines.length;
    numCols = lines[0].length();
    for (int r = 0; r < lines.length; r++) {
      for (int c = 0; c < lines[r].length(); c++) {
        values.add(lines[r].substring(c, c+1));
      }
    }
    board = new Tile[numRows][numCols];

    float increment = width / board[0].length;
    if (increment > height / board.length) {
      increment = height / board.length;
    }
    increment *= 0.8;
    this.increment = increment;

    float x = startX;
    float y = startY;
    int numPlayers = 0;
    for (int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        String current = values.remove(0);
        board[r][c] = new Tile(r, c, x, y, increment);
        if (current.equals("#")) {
          board[r][c].place(new Obstacle(false, board[r][c]));
        } else if (current.equals("-")) {
          board[r][c].place(new Obstacle(true, board[r][c]));
        } else if (current.equals("P")) {
          if (numPlayers==0) {
            player=new Player(board[r][c]);
            board[r][c].place(player);
            numPlayers++;
          } else {
            System.out.println("Board should have exactly one player!");
            System.exit(0);
          }
        } else if (current.equals("E")) {
          enemy = new Enemy(board[r][c]);
          //enemies.add(enemy);
          //enemies.add(new Enemy(board[r][c], this));
          board[r][c].place(enemy);
        } else if (!current.equals(" ")) {
          System.out.println("Board should only have '#', '-', 'P', or ' '!");
          System.exit(0);
        }
        x += increment;
      }
      x = startX;
      y += increment;
    }
    if (player==null) {
      System.out.println("Board should have exactly one player!");
      System.exit(0);
    }
  }


  public Board(int row, int col, int startX, int startY) {
    this.startX = startX;
    this.startY = startY;
    board = new Tile[row][col];
    float increment = width / board[0].length;
    if (increment > height / board.length) {
      increment = height / board.length;
    }
    increment *= 0.8;

    this.increment = increment;

    float x = startX;
    float y = startY;

    for (int r = 0; r < board.length; r++) {
      for (int c = 0; c < board[0].length; c++) {
        board[r][c] = new Tile(r, c, x, y, increment); 
        x += increment;
      }
      x = startX;
      y += increment;
    }
  }

  public void display() {/*
    float increment = width / board[0].length;
   if(increment > height / board.length){
   increment = height / board.length; 
   }*/
    for (int r = 0; r < board.length; r++) {
      for (int c = 0; c < board[0].length; c++) {
        board[r][c].display();
      }
    }
  } 
  void movePlayer(int move) {
    int newRow = player.where().row + moves[move][0];
    int newCol = player.where().col + moves[move][1];

    player.setAnimate(move);
    if (!board[newRow][newCol].hasObstacle()) {
      player.setAnimate(move);
      board[newRow][newCol].player = player;
      board[player.where().row][player.where().col].player = null;
      player.location = board[newRow][newCol];
    }
  }

  void danger(int row, int col) {
    board[row][col].danger++;
    if (row<board.length-1) {
      board[row+1][col].danger++;
    }
    if (row>0) {
      board[row-1][col].danger++;
    }
    if (col<board[0].length-1) {
      board[row][col+1].danger++;
    }
    if (col>0) {
      board[row][col-1].danger++;
    }
  }
  void dropBomb() {
    Bomb toAdd = new Bomb(player.where());
    bombs.add(toAdd);
    board[player.where().row][player.where().col].obs = toAdd;
    danger(player.where().row, player.where().col);
  }
  void enemyBomb() {
    Bomb toAdd = new Bomb(enemy.where());
    bombs.add(toAdd);
    board[enemy.where().row][enemy.where().col].obs = toAdd;
    danger(enemy.where().row, enemy.where().col);
  }
  void go(boolean play) {
    if (play) {
      if (player!= null) {
        if (player.location.isRed > 0) {
          player.die();
          player = null;
        } else if (enemy != null && enemy.location.isRed > 0) {
          enemy.die();
          enemy = null;
        } else {
          player.go();
          Bomb current;
          for (int i = 0; i < bombs.size(); i++) {
            current = bombs.get(i);
            if (current.go()) { 

              current.where().obs = null;

              for (int move = 0; move < moves.length; move++) {
                board[current.where().row + moves[move][0]][current.where().col + moves[move][1]].explodedOn();
              }
              current.where().explodedOn();

              bombs.get(i).where().display();
              bombs.remove(i);
              i--;
            }
          }
        }
      }
    }
  }

  Player getPlayer() {
    return player;
  }

  int numRows() {
    return board.length;
  }
  int numCols() {
    return board[0].length;
  }
  Tile get(int row, int col) {
    return board[row][col];
  }
  void addObs(float x, float y, int type) {
    for (int r = 0; r < board.length; r++) {
      for (int c = 0; c < board[0].length; c++) {
        if (board[r][c].x <= x && x <= board[r][c].x + board[r][c].sideL &&
          board[r][c].y <= y && y <= board[r][c].y + board[r][c].sideL) {
          if (type == 0 || type == 1) {
            board[r][c].place(new Obstacle(type, board[r][c]));
          }
          if (type == 2) {
            board[r][c].place(new Player(board[r][c]));
          }
          if (type == 4) {
            board[r][c].place(new Enemy(board[r][c]));
          }
        }
      }
    }
  }
  void deleteObs(float x, float y) {
    for (int r = 0; r < board.length; r++) {
      for (int c = 0; c < board[0].length; c++) {
        if (board[r][c].x <= x && x <= board[r][c].x + board[r][c].sideL &&
          board[r][c].y <= y && y <= board[r][c].y + board[r][c].sideL) {
          board[r][c].obs = null;
          board[r][c].player = null;
          board[r][c].enemy = null;
        }
      }
    }
  }
  void save(){
   PrintWriter file = createWriter("board4.txt");
    char current;
    for(int r = 0; r < board.length; r++){
     for( int c = 0; c < board[0].length; c++){
       if(board[r][c].obs != null){
         if(board[r][c].obs.type == 0){
           current = '-'; 
         }
         else{
          current = '#'; 
         }
       }
       else if(board[r][c].player != null){
        current = 'P'; 
       }
       else if(board[r][c].enemy != null){
        current = 'E'; 
       }
       else{
        current = ' '; 
       }
       file.print(current);
     }
     file.println();
    }
    file.close();
  }
}
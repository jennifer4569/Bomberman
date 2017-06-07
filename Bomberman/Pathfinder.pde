import java.util.NoSuchElementException;

public class Pathfinder {
  private Board board;
  
  public Pathfinder(Board b){
    board=b;
  }
  
  private class Node{
    public Tile L;
    public int distToPlayer, traveled;
    public Node previous;
    
    public Node(Tile L, int traveled, Node previous){
      this.L=L;
      this.traveled=traveled;
      this.previous=previous;
      distToPlayer=(board.getPlayer().where().getRow()-L.getRow())+(board.getPlayer().where().getCol()-L.getCol());
    }
    
    public int getWeight(){
      if (L.getThingHere()==null){
        return traveled+1;
      } else if(L.getThingHere().getType()==0){
        return traveled+5;
      } else {
        return traveled+10000;
      }
    }
    
    public int compareTo(Node other){
      return (this.getWeight()+this.distToPlayer)-(other.getWeight()+other.distToPlayer);
    }
  }

  private class MyHeap {
    private int minMax;
    private int size;
    private Node[] heap;
    
    public MyHeap(){
      size=0;
      minMax=-1;
      heap=new Node[2];
    }
    
    public MyHeap(boolean isMax){
      if (isMax){
        minMax=-1;
      } else {
        minMax=1;
      }
      size=0;
      heap=new Node[2];
    }
    
    private int indexOfMaxChild(int i){
      if (i*2>size){
        return 0;
      } else if (i*2+1>size){
        return i*2;
      } else if (heap[i*2].compareTo(heap[i*2+1])*minMax > 0){
        return i*2+1;
      } else {
        return i*2;
      }
    }
    
    private int pushDown(int i){
      int index=indexOfMaxChild(i);
      if (index==0){
        return 0;
      } else if (heap[index].compareTo(heap[i])*minMax < 0) {
        Node temp=heap[i];
        heap[i]=heap[index];
        heap[index]=temp;
        return index;
      } else {
        return 0;
      }
    }
    
    private int pushUp(int i){
      if (i/2==0){
        return 0;
      } else if (heap[i/2].compareTo(heap[i])*minMax > 0){
        Node temp=heap[i];
        heap[i]=heap[i/2];
        heap[i/2]=temp;
        return i/2;
      } else {
        return 0;
      }
    }
    
    private void resize(){
      Node[] temp=heap;
      heap=new Node[heap.length*2];
      for (int i = 0; i<temp.length; i++){
        heap[i]=temp[i];
      }
    }
    
    public void add(Node value){
      size++;
      if(size>=heap.length){
        resize();
      }
      heap[size]=value;
      int i = size;
      while (i>0){
        i=pushUp(i);
      }
    }
    
    public Node remove() throws NoSuchElementException {
      if (size<=0){
        throw new NoSuchElementException();
      } else {
        Node toReturn=heap[1];
        heap[1]=heap[size];
        size--;
        int i=1;
        while(i>0){
          i=pushDown(i);
        }
        return toReturn;
      }
    }
    
    public boolean hasNext(){
      if(size==0){
        return false;
      } else {
        return true;
      }
    }
    
    public Node peek() throws NoSuchElementException {
      if (size<=0){
        throw new NoSuchElementException();
      } else {
        return heap[1];
      }
    }
  }
  
  public Tile findNextMove(Enemy e){
    //if(e.where().getDanger()>0){
      return runAway(e);
    //} else {
    //  return pathfind(e);
    //}
  }
  
  private Tile pathfind(Enemy e){
    char[][] b=new char[board.numRows()][board.numCols()];
    for (int i=0;i<board.numRows();i++){
      for (int i2=0;i2<board.numCols();i2++){
        b[i][i2]=board.get(i,i2).getThingHere().toChar();
      }
    }
    
    MyHeap frontier = new MyHeap(false);
    frontier.add(new Node(e.where(),0,null));
    boolean solved = false;
    Node current = null;
    while(frontier.hasNext() && !solved){
      current=frontier.remove();
      if (current.L==board.getPlayer().where()){
        solved=true;
      } else {
        b[current.L.getRow()][current.L.getCol()]='.';
        if (b[current.L.getRow()+1][current.L.getCol()]==' '){
          frontier.add(new Node(board.get(current.L.getRow()+1,current.L.getCol()), current.traveled,current));
          b[current.L.getRow()+1][current.L.getCol()]='?';
        }
        if (b[current.L.getRow()-1][current.L.getCol()]==' '){
          frontier.add(new Node(board.get(current.L.getRow()-1,current.L.getCol()), current.traveled,current));
          b[current.L.getRow()-1][current.L.getCol()]='?';
        }
        if (b[current.L.getRow()][current.L.getCol()+1]==' '){
          frontier.add(new Node(board.get(current.L.getRow(),current.L.getCol()+1), current.traveled,current));
          b[current.L.getRow()][current.L.getCol()+1]='?';
        }
        if (b[current.L.getRow()][current.L.getCol()-1]==' '){
          frontier.add(new Node(board.get(current.L.getRow(),current.L.getCol()-1), current.traveled,current));
          b[current.L.getRow()][current.L.getCol()-1]='?';
        }
      }
    }
    if(solved){
      while(current.previous.L!=e.where()){
        current=current.previous;
      }
      return current.L;
    }
    return e.where();
  }
  
  private Tile runAway(Enemy e){
    return e.where();
  }
}
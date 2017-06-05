public class Tile{
  int row;
  int col;
   float x;
   float y;
   float sideL;
   Obstacle obs;
     
     public Tile(int row, int col, float x, float y, float sideL){ //randomly generates obs
       this.row = row;
       this.col = col;
       this.x = x;
       this.y = y;
       this.sideL = sideL;
       /*if((int)(Math.random() * 1000) % 100 < 50){ //50% chance for obstacle
         obs = new Obstacle((int)(Math.random() * 1000) % 100 < 50); //50% chance outta those to have breakable
       }*/
     }
     /*public Tile(float x, float y, float sideL, boolean hasObs, boolean isBreakable){ //randomly generates obs
       this.x = x;
       this.y = y;
       this.sideL = sideL;
       if(hasObs){
        obs = new Obstacle(isBreakable, this); 
       }
     }*/
     
     public void place(Obstacle obs){
       this.obs=obs;
     }
     
    public void display(){
      if(obs != null){
        if(obs.isBreakable){
          if(obs.type == 0){
              image(loadImage("BreakableObstacle.png"), x, y, sideL, sideL);
          }
          else{
              image(loadImage("Player.png"), x, y, sideL, sideL);
          }
        }
        else{
         //fill(0, 0, 0); 
         image(loadImage("UnbreakableObstacle.png"), x, y, sideL, sideL);
        }
      }
      else{
          fill(225, 225, 225); 
             rect(x, y, sideL, sideL);

      }
      
      //rect(x, y, sideL, sideL);
    }
    
    boolean hasObstacle(){
     return obs != null; 
    }
  }
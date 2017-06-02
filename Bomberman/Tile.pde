public class Tile{
   float x;
   float y;
   float sideL;
   Obstacle obs;
     
     public Tile(float x, float y, float sideL){ //randomly generates obs
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
          //fill(255, 0, 0);
              //rect(x, y, sideL, sideL);
              image(loadImage("BreakableObstacle.png"), x, y, sideL, sideL);

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
  }
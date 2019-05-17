import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*; 
import shiffman.box2d.*;

ArrayList<Box> boxes = new ArrayList<Box>();
Box2DProcessing box2d;

void setup(){
  size(700,700);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-90.8);
  
  for (int i = 0; i<10; i++){
  boxes.add(new Box(0,random(0,width),random(0,10),0));
  }
}

void draw(){
  background(255);
  box2d.step();
  fill(0);
  ellipse(width/2,height/2,30,30);
  for (Box b:boxes){
   b.display(); 
  }
  if (keyPressed){
    for(Box b : boxes){
       b.attract();
       box2d.setGravity(0,0);
    }
  }
  
  
}

// Imports
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// Define ArrayList for all the squares and boundaries
ArrayList<Pair> pairs;
ArrayList<Boundary> boundaries;

// Define box2d world
Box2DProcessing box2d;

int frameNum = 0;
void setup(){
  size(640, 640);
  
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting custom gravity
  box2d.setGravity(0, -10);
  
  // Create ArrayLists
  pairs = new ArrayList<Pair>();
  boundaries = new ArrayList<Boundary>();
  
  // Add a bunch of boundaries
  boundaries.add(new Boundary(width/4,height-50,width/2-50,10));
  boundaries.add(new Boundary(width/3,height-500,width/3-50,10));
  boundaries.add(new Boundary(2*width,height-500,width/3-50,10));
  boundaries.add(new Boundary(2*width/3 + 100,height-350,width/3-50,10));
  boundaries.add(new Boundary(width/5,height-300,width/3-50,10));
  boundaries.add(new Boundary(3*width/4,height-200,width/2-50,10));
}


void draw(){
  background(255);
  
  // We must always step through time
  box2d.step();
  
  // Display al boundaries
  for (Boundary b: boundaries){
    b.display();
  }
  
  // Add new boxes when muose is pressed
  if(mousePressed && frameNum > 10){
    Pair p = new Pair(mouseX, mouseY);
    pairs.add(p);
    frameNum = 0;
  }
  
  // Display all boxes
  for (Pair p : pairs){
    p.display();
  }
  
  // We iterate statring from the end so that deletion will no interefere
  for (int i = pairs.size()-1; i >= 0; i--){
    Pair p = pairs.get(i);
    if (p.b1.done() && p.b2.done()){
      pairs.remove(i);
    }
  }
  frameNum++;
}
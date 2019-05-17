import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


ArrayList<Box> boxes = new ArrayList<Box>();
ArrayList<Joint> joints = new ArrayList<Joint>();
Box boxI,boxY;
Box2DProcessing box2d;

Platform platLeft, ceiling1,ceiling2, floor, platRight;

PJoint pJoint1,pJoint2;

void setup(){
 size(640,400);
 
 box2d = new Box2DProcessing(this);
 box2d.createWorld();
 box2d.setGravity(0, -150);
 
 ceiling1 = new Platform(0, -15, 18, 350,20);
 ceiling2 = new Platform(0, 15, 18, 350,20);

 floor = new Platform(0, 0, -20, 700,10);
 platLeft = new Platform(0, 32, 0, 10,700);
 platRight = new Platform(0, -32, 0, 10,700);
 
 Box boxI = new Box(0, 170,300,0);
 Box boxX = new Box(0, 540,300,0);
 
 boxes.add(boxI);
 boxes.add(boxX);

 pJoint1 = new PJoint(boxI, ceiling1);
 pJoint2 = new PJoint(boxX, ceiling2);
 
 Joint spring = new Joint(boxI,boxX);
 joints.add(spring);


 
}

void mousePressed(){
   //Box boxNew = new Box(0,mouseX,mouseY,0);
   //joints.add(new Joint(boxes.get(boxes.size()-1), boxNew));
   //boxes.add(boxNew);
}


void draw(){
 background(255); 
 box2d.step();
 
 ceiling1.display();
 ceiling2.display();
 floor.display();
 platLeft.display();
 platRight.display();
 
 pJoint1.display();
 pJoint2.display();

 for(Box b: boxes){
   b.display(); 
   //b.spring(2);
 }
 for(Joint j: joints){
   j.display(); 
 }
 
}
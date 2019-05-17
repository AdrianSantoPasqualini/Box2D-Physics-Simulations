class Joint{
 
  Box box1;
  Box box2;

  float len;
  DistanceJoint dj;
  
  Joint(Box b1, Box b2){
    box1 = b1;
    box2 = b2;
    
    len = 305;
    
    DistanceJointDef djd = new DistanceJointDef(); 

    djd.bodyA = box1.body;
    djd.bodyB = box2.body;
    djd.length = box2d.scalarPixelsToWorld(len);
    djd.frequencyHz = 0.2;  
    djd.dampingRatio = 0; 
    dj = (DistanceJoint) box2d.world.createJoint(djd);

  }
  
  
  
  
  
  void display() {
    Vec2 pos1 = box2d.getBodyPixelCoord(box1.body);
    Vec2 pos2 = box2d.getBodyPixelCoord(box2.body);
    stroke(0);
    line(pos1.x,pos1.y,pos2.x,pos2.y);
  }
  
  
  
}
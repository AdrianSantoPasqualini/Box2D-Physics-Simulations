class PJoint{
 
  Box box1;
  Platform box2;

  float len;
  DistanceJoint dj;
  
  PJoint(Box b1, Platform b2){
    box1 = b1;
    box2 = b2;
    
    len = 250;
    
    DistanceJointDef djd = new DistanceJointDef(); 

    djd.bodyA = box1.body;
    djd.bodyB = box2.body;
    djd.length = box2d.scalarPixelsToWorld(len);
    djd.frequencyHz = 200;  
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
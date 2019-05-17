class Pair {
  
  Box b1, b2;
  float len = 50;
  DistanceJoint dj;
  
  Pair(float x, float y) {
    // Step 1: Prepare bodies
    b1 = new Box(x, y);
    b2 = new Box(x+random(-1, 1), y+random(-1, 1));
    // Step 2: Define the joint
    DistanceJointDef djd = new DistanceJointDef();

    // Step 3: Configure the joint's properties (bodies, anchors, rest length, restitution)
    djd.bodyA = b1.body;
    djd.bodyB = b2.body;
    djd.length = box2d.scalarPixelsToWorld(len);
    djd.frequencyHz = 2;
    djd.dampingRatio = 0.1;

    // Step 4: Create Joint
    dj = (DistanceJoint) box2d.world.createJoint(djd);
  }
  
  boolean done(){
    if (b1.done() && b2.done()){
      b1.killBody();
      b2.killBody();
      box2d.world.destroyJoint(dj);
      return true;
    }
    return false;
  }
  void display() {
    Vec2 pos1 = box2d.getBodyPixelCoord(b1.body);
    Vec2 pos2 = box2d.getBodyPixelCoord(b2.body);
    stroke(0);
    line(pos1.x, pos1.y, pos2.x, pos2.y);
    b1.display();
    b2.display();
  }
}
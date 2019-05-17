class Box{
  float x;
  float y;
  float c; 
  float w;
  float h;
  float d;
  Body body;
  
  Box(float colour, float x1, float y1, float d1){
    c = colour;
    x = x1;
    y = y1;
    w = 30;
    h = 30;
    d = d1;
    
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);

    ps.setAsBox(box2Dw,box2Dh);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    fd.density = 1;
    fd.friction = 0;
    fd.restitution = 0;
    
    body.createFixture(fd);
  }
  /*
  void spring(float natural){
     Vec2 loc = body.getWorldCenter();
     Vec2 posI = body.getWorldCenter();
     Vec2 posF = new Vec2(width/2, height/2);
     //b.body.getWorldCenter();
     Vec2 force = posI.subLocal(posF);
     float distance = force.length();
     constrain(distance,3,5);
     force.normalize();
     float strength = -2*(distance-natural);
     force.mulLocal(strength);
     body.applyForce(force, loc);
  }
  */
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    fill (205, 133, 63);
    rectMode(CENTER);
    translate(pos.x,pos.y);
    rotate(-a);
    stroke(0);
    rect(0,0,w,h);
    popMatrix();
   
  }
  

  
}

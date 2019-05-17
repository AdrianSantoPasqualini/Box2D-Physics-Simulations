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
    w = random(5,50);
    h = random(5,50);
    d = d1;
    
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    //box2d.coordPixelToWorld(x,y);
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);

    ps.setAsBox(box2Dw,box2Dh);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    fd.density = 100;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    body.createFixture(fd);
  }
  
  void attract(){
   Vec2 pos = body.getWorldCenter();
   Vec2 cent = new Vec2(0,0);
   Vec2 force = cent.subLocal(pos);
   float distance = force.length();
   constrain(distance,3,5);
   force.normalize();
   float strength = 900000*(w*h)/(distance*distance+10000);
   force.mulLocal(strength);
   body.applyForce(force,pos);
   box2d.setGravity(0,0);
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    noFill();
    rectMode(CENTER);
    translate(pos.x,pos.y);
    rotate(-a);
    stroke(0);
    rect(0,0,w,h);
    popMatrix();
   
  }
  

  
}
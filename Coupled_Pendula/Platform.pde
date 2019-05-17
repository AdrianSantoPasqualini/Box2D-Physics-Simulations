class Platform{
  float x;
  float y;
  float c1;
  float w;
  float h;
  Body body;
  
  Platform(float colour, float x1, float y1, float w1, float h1){
    c1 = colour;
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(x,y);
    //box2d.coordPixelToWorld(x,y);
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
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    pushMatrix();
    fill(0);
    rectMode(CENTER);
    translate(pos.x,pos.y);
    stroke(0);
    rect(0,0,w,h);
    popMatrix();
   
  }
  

  
}
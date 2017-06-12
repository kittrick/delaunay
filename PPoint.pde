class PPoint {
  int idx;
  int d;
  color c;
  PVector pos;
  PVector noiseSeed;
  float speed;
  
  PPoint(PVector pos, int idx){
    c = color(random(255),random(255),random(255), 128);
    this.idx = idx;
    this.pos = pos;
    d = 20;
    noiseSeed = new PVector(
      idx*random(1000),
      idx*random(1000)
    );
    speed = 0.0002;
  }
  
  PPoint update(){
    float nX = map(noise(millis()*speed+noiseSeed.x),0,1,0,width);
    float nY = map(noise(millis()*speed+noiseSeed.y),0,1,0,height);
    pos.x = nX;
    pos.y = nY;
    return this;
  }
  
  PPoint render(){
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, d, d);
    return this;
  }
  
  PPoint c(color c){
    this.c = c;
    return this;
  }
  
  PPoint d(int d){
    this.d = d;
    return this;
  }
}
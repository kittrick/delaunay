class Point {
  int idx;
  int d;
  color c;
  PVector pos;
  ArrayList<Point> family;
  float[] distances;
  PVector noiseSeed;
  float speed;
  Tri t;
  
  Point(PVector pos, int idx, ArrayList<Point> family){
    c = color(random(255),random(255),random(255), 128);
    this.idx = idx;
    this.pos = pos;
    this.family = family;
    d = 20;
    distances = new float[pointCount];
    noiseSeed = new PVector(
      idx*random(1000),
      idx*random(1000)
    );
    speed = 0.0002;
    t = new Tri(new PVector(0,0), new PVector(0,0), new PVector(0,0));
  }
  
  Point update(){
    float nX = map(noise(millis()*speed+noiseSeed.x),0,1,0,width);
    float nY = map(noise(millis()*speed+noiseSeed.y),0,1,0,height);
    pos.x = nX;
    pos.y = nY;
    return this;
  }
  
  Point render(){
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, d, d);
    PVector a = new PVector(pos.x, pos.y);
    PVector b = new PVector(pos.x, pos.y);
    PVector cc = new PVector(pos.x, pos.y);
    for(int i = 0; i < family.size(); i++){
      float dist = dist(pos.x, pos.y, family.get(i).pos.x, family.get(i).pos.y);
      distances[i] = dist;
      float[] sorted = sort(distances);
      sorted = subset(sorted, 1, 2);
      if(dist == sorted[0]) {
        stroke(c);
        line(pos.x, pos.y, family.get(i).pos.x, family.get(i).pos.y);
        noStroke();
        b = new PVector(family.get(i).pos.x, family.get(i).pos.y);
      } else if( dist == sorted[1]){
        stroke(c);
        line(pos.x, pos.y, family.get(i).pos.x, family.get(i).pos.y);
        noStroke();
        cc = new PVector(family.get(i).pos.x, family.get(i).pos.y);
      }
    }
    t.update(a,b,cc).render();
    return this;
  }
}
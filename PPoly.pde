class PPoly{
  ArrayList<PPoint> points;
  
  PPoly(ArrayList<PPoint> points){
    this.points = points;
  }
  PPoly update(ArrayList<PPoint> points){
    this.points = points;
    return this;
  }
  PPoly render(){
    stroke(0);
    fill(0,30);
    strokeJoin(ROUND);
    beginShape();
    for(PPoint p: points){
      vertex(p.pos.x, p.pos.y);
    }
    endShape(CLOSE);
    return this;
  }
  boolean isTri(){
    if(this.points.size() == 3){
      return true;
    } else {
      return false;
    }
  }
  boolean isQuad(){
    if(this.points.size() == 4){
      return true;
    } else {
      return false;
    }
  }
  PVector getCircumcenter() {
    // determine midpoints (average of x & y coordinates)
    PLine a = new PLine(points.get(0),points.get(1));
    PLine b = new PLine(points.get(1),points.get(2));
    
    PVector midA = a.midpoint();
    PVector midB = b.midpoint();

    // determine slope
    // we need the negative reciprocal of the slope to get the slope of the perpendicular bisector
    float slopeA = -1 / a.slope();
    float slopeB = -1 / b.slope();
    
    println(slopeA);
    println(slopeB);

    // y = mx + b
    // solve for b
    float bA = midA.y - slopeA * midA.x;
    float bB = midB.y - slopeB * midB.x;

    // solve for x & y
    // x = (b1 - b2) / (m2 - m1)
    float x = (bA - bB) / (slopeB - slopeA);
    PVector circumcenter = new PVector(
      x,
      (slopeA * x) + bA
    );
    stroke(0);
    float rad = circumcenter.dist(points.get(0).pos);
    ellipse(circumcenter.x, circumcenter.y,rad*2,rad*2);
    println(circumcenter);

    return circumcenter;
  }
}
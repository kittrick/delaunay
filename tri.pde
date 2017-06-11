class Tri{
  PVector a;
  PVector b;
  PVector c;
  Tri(PVector a, PVector b, PVector c){
    this.a = a;
    this.b = b;
    this.c = c;
  }
  Tri update(PVector a, PVector b, PVector c){
    this.a = a;
    this.b = b;
    this.c = c;
    return this;
  }
  Tri render(){
    stroke(0);
    fill(0,30);
    strokeJoin(ROUND);
    beginShape();
      vertex(a.x, a.y);
      vertex(b.x, b.y);
      vertex(c.x, c.y);
    endShape(CLOSE);
    return this;
  }
}
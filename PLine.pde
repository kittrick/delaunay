class PLine {
  PVector start;
  PVector end;
  PLine(PPoint start, PPoint end){
    this.start = start.pos;
    this.end = end.pos;
  }
  PLine update(PVector start, PVector end) {
    this.start = start;
    this.end = end;
    return this;
  }
  PLine render() {
    line(start.x, start.y, end.x, end.y);
    return this;
  }
  PVector midpoint(){
    return new PVector(
      (start.x + end.x) / 2,
      (start.y + end.y) / 2
    );
  }
  float slope() {
    return (end.y - start.y) / (end.x - start.x);
  }
}
ArrayList<Point> points;
int pointCount = 10;

void setup(){
  size(600, 600, FX2D);
  points = new ArrayList<Point>();
  for(int i = 0; i < pointCount; i++){
    int x = floor(random(width));
    int y = floor(random(height));
    PVector loc = new PVector(x, y);
    points.add(new Point(loc, i, points));
  }
}

void draw(){
  background(255);
  for(int i = 0; i < points.size(); i++){
    points.get(i).update().render();
  }
}
ArrayList<PPoint> points;
int pointCount = 3;
PPoly tri;

void setup(){
  size(600, 600, FX2D);
  points = new ArrayList<PPoint>();
  for(int i = 0; i < pointCount; i++){
    int x = floor(random(width));
    int y = floor(random(height));
    PVector loc = new PVector(x, y);
    points.add(new PPoint(loc, i));
  }
  tri = new PPoly(points);
}

void draw(){
  background(255);
  tri.update(points).render();
  tri.getCircumcenter();
  for(int i = 0; i < points.size(); i++){
    points.get(i).update().render();
  }
}
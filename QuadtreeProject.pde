Quadtree<Point> quadtree;
Boundary boundary;
ArrayList<Point> points = new ArrayList<>();

void setup() {
  fullScreen();
  
  for (int i = 0; i < 500; i++) {
    float x = random(0, width);
    float y = random(0, height);
    points.add(new Point(x, y));
  }
  
  boundary = new Boundary(0, 0, width, height);
  quadtree = new Quadtree<Point>(boundary, 15);
  for (Point p : points) {
    quadtree.insert(p);
  }
}

void draw() {
  background(0);
  Range range = new Range(mouseX - 100, mouseY - 100, 200, 200);
  ArrayList<Point> found = new ArrayList<>();
  quadtree.query(range, found);
  println(found.size());
  
  strokeWeight(2);
  quadtree.show();
  rect(range.x, range.y, range.w, range.h);
  
  noFill();
  strokeWeight(20);

  stroke(255);  
  for (Point p : points) {
    point(p.x, p.y);
  }
  stroke(255, 50, 130);  
  for (Point p : found) {
    point(p.x, p.y);
  }
}

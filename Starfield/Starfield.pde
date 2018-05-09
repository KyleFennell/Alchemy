final int noOfPoints = 100;
final int threshold = 50;
ArrayList<Dot> points = new ArrayList<Dot>();

void setup() {
  size(800,600);
  //fullScreen();
  for (int i = 0; i < noOfPoints; i++) {
    points.add(new Dot((int)random(width), (int)random(height)));
  }
  strokeWeight(4);
  frameRate(60);
}

void draw() {
  if (frameCount % 60 == 0) println(frameRate);
  background(0, 0, 0);
  for (int i = 0; i < noOfPoints; i++) {
    for (int j = 0; j < i; j++) {
      float distance = dist(points.get(i).x(), points.get(i).y(), points.get(j).x(), points.get(j).y());
      if (distance < threshold) {
        int c = round(255/threshold*(threshold-distance));
        color lineColour = color(255, 255, 255, c);
        stroke(lineColour);
        line(points.get(i).x(), points.get(i).y(), points.get(j).x(), points.get(j).y());
      }
    }
  }
  stroke(255);
  for (Dot d : points) {
    d.update();
    point(d.x(), d.y());
  }
}

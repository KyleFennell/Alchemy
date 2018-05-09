final int noOfPoints = 200;
final int threshold = 50;
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(800, 600, P2D);
  //fullScreen();
  for (int i = 0; i < noOfPoints; i++) {
    particles.add(new Particle(random(width), random(height)));
  }
  strokeWeight(2);
  frameRate(60);
}

void draw() {
  if (frameCount % 60 == 0) println(frameRate);
  background(0, 0, 0);
  for (int i = 0; i < noOfPoints; i++) {
    for (int j = 0; j < i; j++) {
      float distance = dist(particles.get(i).x(), particles.get(i).y(), particles.get(j).x(), particles.get(j).y());
      if (distance < threshold) {
        int c = round(255/threshold*(threshold-distance));
        color lineColour = color(255, 255, 255, c);
        stroke(lineColour);
        line(particles.get(i).x(), particles.get(i).y(), particles.get(j).x(), particles.get(j).y());
      }
    }
  }
  stroke(255);
  for (Particle p : particles) {
    p.update();
    if (!p.isDead()) {
      point(p.x(), p.y());
    }
  }
}

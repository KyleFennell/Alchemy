final int noOfParticles = 2500;
ArrayList<Particle> particles = new ArrayList<Particle>();
PImage sprite;


void setup() {
  sprite = loadImage("sprite.png");
  size(800, 600, P2D);
  //fullScreen();
  PImage sprite = loadImage("sprite.png");
  strokeWeight(4);
  stroke(255, 0, 0);
  frameRate(60);
}

void draw() {
  background(0, 0, 0);
  blendMode(ADD);
  if (particles.size() < noOfParticles) {
    particles.add(new Particle(1, 0.05, sprite));
    particles.add(new Particle(1, 0.05, sprite));
    particles.add(new Particle(1, 0.05, sprite));
    particles.add(new Particle(1, 0.05, sprite));
    particles.add(new Particle(1, 0.05, sprite));
  }
  if (frameCount % 60 == 0) {
    println(particles.size()+" "+frameRate);
  }
  for (Particle p : particles) {
    p.update();
    p.render();
  }
}

class Field_Star implements Field {

  ArrayList<Particle> particles = new ArrayList<Particle>();
  int noOfParticles;
  float acceleration;
  float velocity;
  PImage sprite;
  float threshold = 30;
  Shape shape;

  Field_Star(int noOfParticles, float acceleration, float velocity, Shape shape, PImage sprite) {
    this.noOfParticles = noOfParticles;
    this.acceleration = acceleration;
    this.velocity = velocity;
    this.shape = shape;
    this.sprite = sprite;
  }

  void update() {
    if (particles.size() < noOfParticles) {
      for (int i = 0; i < noOfParticles/frameRate/3 && particles.size() < noOfParticles; i++) {
        particles.add(new Particle_Star(shape, velocity, acceleration, sprite));
      }
    }
    for (Particle p : particles) {
      p.update();
    }
  }

  void render() {
    shape.render();
    for (int i = 0; i < particles.size(); i++) {
      Particle p1 = particles.get(i);
      p1.render();
      for (int j = 0; j < i; j++) {
        Particle p2 = particles.get(j);
        float distance = dist(p1.pos().x, p1.pos().y, p2.pos().x, p2.pos().y);
        if (distance < threshold) {
          int alpha = round(255/threshold*(threshold-distance));
          stroke(255, alpha);
          line(p1.pos().x, p1.pos().y, p2.pos().x, p2.pos().y);
        }
      }
    }
  }
}

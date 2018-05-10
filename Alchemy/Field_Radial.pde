class Field_Radial implements Field {

  ArrayList<Particle> particles = new ArrayList<Particle>();
  int noOfParticles;
  float acceleration;
  float velocity;
  PImage sprite;
  Shape shape;

  Field_Radial(int noOfParticles, float acceleration, float velocity, Shape shape, PImage sprite) {
    this.noOfParticles = noOfParticles;
    this.acceleration = acceleration;
    this.velocity = velocity;
    this.shape = shape;
    this.sprite = sprite;
  }

  void update() {
    noStroke();
    if (particles.size() < noOfParticles) {
      for (int i = 0; i < noOfParticles/frameRate/5 && particles.size() < noOfParticles; i++) {
        particles.add(new Particle_Radial(shape, velocity, acceleration, sprite));
      }
    }
    for (Particle p : particles) {
      p.update();
    }
  }

  void render() {
    shape.render();
    for (Particle p : particles) {
      p.render();
    }
  }
}

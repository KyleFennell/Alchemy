class Field_Fire implements Field {

  ArrayList<Particle> particles = new ArrayList<Particle>();
  int noOfParticles;
  PImage sprite;
  Shape shape;

  Field_Fire(int noOfParticles, Shape shape, PImage sprite) {
    this.shape = shape;
    this.noOfParticles = noOfParticles;
    this.sprite = sprite;
  }

  void update() {
    noStroke();
    if (particles.size() < noOfParticles) {
      for (int i = 0; i < noOfParticles/frameRate/3 && particles.size() < noOfParticles; i++) {
        particles.add(new Particle_Fire(shape, 1, 0.05, sprite));
      }
    }
    for (Particle p : particles) {
      p.update();
    }
  }

  void render() {
    for (Particle p : particles) {
      p.render();
    }
  }
}

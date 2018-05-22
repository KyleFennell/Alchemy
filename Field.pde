class Field<P extends Particle> {

  ArrayList<Particle> particles = new ArrayList<Particle>();
  float initialSpawnSeconds = 20;
  int noOfParticles;
  P blueprint;

  Field(int noOfParticles, P blueprint) {
    this.noOfParticles = noOfParticles;
    this.blueprint = blueprint;
  }

  void update() {
    if (particles.size() < noOfParticles) {
      for (int i = 0; i < noOfParticles/frameRate/initialSpawnSeconds && particles.size() < noOfParticles; i++) {
        particles.add(blueprint.clone());
      }
    }
    for (Particle p : particles) {
      p.update();
    }
  }

  void render() {
    blueprint.bubble.render();
    for (Particle p : particles) {
      p.render();
    }
  }
}

class Field_Star<P extends Particle> extends Field<P> {

  int threshold = 50;

  Field_Star(int noOfParticles, P blueprint, int threshold) {
    super(noOfParticles, blueprint);
    this.threshold = threshold;
  }

  void render() {
    blueprint.bubble.render();
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

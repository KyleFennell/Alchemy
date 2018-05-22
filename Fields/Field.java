package Fields;
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
    blueprint.shape.render();
    for (Particle p : particles) {
      p.render();
    }
  }
}
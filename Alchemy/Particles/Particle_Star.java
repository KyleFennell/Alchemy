package Particles;
class Particle_Star extends Particle {

  Particle_Star(Shape shape, float velocity, float acceleration, PImage sprite) {
    super(shape, velocity, acceleration, sprite);
    col = 255;
    rebirth();
  }

  @Override
    Particle clone() {
    return new Particle_Star(shape, velocity, acceleration, sprite);
  }
  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    super.pos.add(super.vel);
  }

  @Override
    void rebirth() {
    super.pos = shape.getSpawn();
    super.vel = new PVector(random(-1, 1), random(-1, 1)).mult(super.velocity);
  }
}
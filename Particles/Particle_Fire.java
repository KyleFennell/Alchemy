package Particles;
class Particle_Fire extends Particle {
  // physics vectors

  Particle_Fire(Shape shape, float velocity, float acceleration, PImage sprite) {
    super(shape, velocity, acceleration, sprite);
    maxVelocity = 30;
    rebirth();
  }

  @Override
  void update() {
    if (isDead()) {
      rebirth();
    }
    acc = new PVector((random(1)*2-1)*5*acceleration, -acceleration);
    vel.add(acc);
    capVelocity();
    pos.add(vel);
  }
  
  @Override
  Particle clone(){
    return new Particle_Fire(shape, velocity, acceleration, sprite);
  }

  @Override
  void rebirth() {
    pos = shape.getSpawn();
    vel = new PVector((random(1)*2-1)*velocity, -random(1)*velocity);
    acc = new PVector(0, 0);
    int r = floor(random(150, 255));
    int g = floor(random(0, 100));
    col = color(r, g, 0);
  }
}
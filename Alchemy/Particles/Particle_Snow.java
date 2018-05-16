package Particles;
class Particle_Snow extends Particle {

  Particle_Snow(Shape shape, float velocity, float acceleration, PImage sprite) {
    super(shape, velocity, acceleration, sprite);
    maxVelocity = 2;
    rebirth();
  }

  @Override
    Particle clone() {
    return new Particle_Snow(shape, velocity, acceleration, sprite);
  }
  
  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    acc = new PVector(random(-1, 1)*5, 1).mult(acceleration);
    vel.add(acc);
    capVelocity();
    pos.add(vel);
  }

  @Override
    void rebirth() {
    pos = shape.getSpawn();
    vel = new PVector((random(1)*2-1)*velocity, random(1)*velocity);
    acc = new PVector(0, 0);
    int rgval = floor(random(200, 255));
    int r = rgval;
    int g = rgval;
    int b = 255;
    col = color(r, g, b);
  }
}
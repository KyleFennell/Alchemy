package Particles;
class Particle_Water extends Particle {

  Particle_Water(Shape shape, float velocity, float acceleration, PImage sprite) {
    super(shape, velocity, acceleration, sprite);
    rebirth();
  }

  @Override
    Particle clone() {
    return new Particle_Water(shape, velocity, acceleration, sprite);
  }
  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    vel.add(acc);
    capVelocity();
    pos.add(vel);
  }

  @Override
    void rebirth() {
    pos = shape.getSpawn();
    vel = new PVector(random(-1,1), random(-1, 1)).mult(velocity*shape.radius()/25);
    acc = new PVector(vel.x+random(-1, 1), vel.y+random(-1, 1)).normalize().mult(vel.mag()/7*(-acceleration));
    int base = (int)random(50, 100);
    int r = floor(base+random(-10, 10));
    int g = floor(base+random(-10, 10));
    int b = floor(random(200, 255));
    col = color(r, g, b);
  }
}
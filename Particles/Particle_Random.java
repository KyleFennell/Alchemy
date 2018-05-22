package Particles;
class Particle_Random extends Particle {

  int interval = 50 ;
  int nextChange = interval;

  Particle_Random(Shape shape, float velocity, float acceleration, int interval, PImage sprite) {
    super(shape, velocity, acceleration, sprite);
    this.interval = interval;
    rebirth();
  }

  @Override
    Particle clone() {
    return new Particle_Random(shape, velocity, acceleration, interval, sprite);
  }

  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    if (nextChange == 0) {
      nextChange = (int)random(interval/5, interval);
      vel = new PVector(random(-1, 1), random(-1, 1)).mult(velocity);
      acc = new PVector(vel.x, vel.y).mult(acceleration);
    }
    vel.add(acc);
    capVelocity();
    pos.add(vel);
    nextChange--;
  }

  @Override
    void rebirth() {
    pos = shape.getSpawn();
    nextChange = (int)random(0, interval);
    vel = new PVector(random(-1, 1), random(-1, 1)).mult(velocity);
    acc = new PVector(vel.x, vel.y).mult(acceleration);
    int r = (int)random(50, 255);
    int g = (int)random(50, 255);
    int b = (int)random(50, 255);
    col = color(r, g, b);
  }
}
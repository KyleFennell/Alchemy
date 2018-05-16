package Particles;
class Particle_Sine extends Particle {

  int offset = 0;
  float speed;
  PVector aPos;

  Particle_Sine(Shape shape, float velocity, float acceleration, float speed, PImage sprite) {
    super(shape, velocity, acceleration, sprite);
    this.speed = speed;
    maxVelocity = 30;
    rebirth();
  }

  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    vel.add(acc);
    capVelocity();
    aPos.add(vel);
    pos = new PVector(aPos.x, aPos.y).add(new PVector(vel.x, vel.y).rotate(PI/2).normalize().mult(sin(frameCount*speed+offset)*20));
  }

  @Override
    Particle clone() {
    return new Particle_Sine(shape, velocity, acceleration, speed, sprite);
  }

  @Override
    void rebirth() {
    offset = (int)random(0,TWO_PI);
    aPos = shape.getSpawn();
    pos = new PVector(aPos.x, aPos.y);
    vel = new PVector(random(-0.3, 0.3), -1).mult(velocity);
    acc = new PVector(0, random(-1, 0)).mult(acceleration);
    int base = (int)random(50, 100);
    int r = floor(base+random(-10, 10));
    int b = floor(base+random(-10, 10));
    int g = floor(random(200, 255));
    col = color(r, g, b);
  }
}
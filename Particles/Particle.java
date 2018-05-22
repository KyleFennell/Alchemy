package Particles;
abstract class Particle {
  // physics vectors
  PVector pos;
  PVector vel;
  PVector acc;
  // rebirth multipliers
  float velocity;
  float acceleration;
  // other
  float maxVelocity = 10;
  float minVelocity = 0.3;
  PImage sprite;
  Shape shape;
  color col;

  Particle(Shape shape, float velocity, float acceleration, PImage sprite) {
    this.shape = shape;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.sprite = sprite;
    rebirth();
  }
  
  abstract Particle clone();

  void update() {
    if (isDead()) {
      rebirth();
    }
    vel.add(acc);
    capVelocity();
    pos.add(vel);
  }

  void render() {
    imageMode(CENTER);
    tint(col);
    image(sprite, pos.x, pos.y, 32, 32);
  }

  abstract void rebirth();

  boolean isDead() {
    if (shape.isInside(pos.x, pos.y)) {
      return false;
    }
    return true;
  }

  void capVelocity() {
    if (vel.mag() > maxVelocity) {
      vel.setMag(maxVelocity);
    }
    if (vel.mag() < minVelocity) {
      vel.setMag(minVelocity);
    }
  }

  PVector pos() {
    return pos;
  }
}
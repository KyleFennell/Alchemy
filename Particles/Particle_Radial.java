package Particles;
class Particle_Radial extends Particle {
  
  PVector goal;

  Particle_Radial(Shape shape, float velocity, float acceleration, PImage sprite) {
    super(shape, velocity, acceleration, sprite);

    rebirth();
  }

  @Override
    Particle clone() {
    return new Particle_Radial(shape, velocity, acceleration, sprite);
  }

  @Override
    void update() {
    if (isDead()) {
      rebirth();
    }
    acc = new PVector(vel.x*acceleration, vel.y*acceleration);
    vel.add(acc);
    pos.add(vel);
    capVelocity();
  }

  @Override
    void rebirth() {
    if (velocity < 0) {
      pos = new PVector(shape.origin().x, shape.origin().y);
      goal = shape.getSpawn();
    } else {
      pos = shape.getSpawn();
      goal = new PVector(shape.origin().x, shape.origin().y);
    }
    vel = new PVector(pos.x - goal.x, pos.y - goal.y);
    vel.normalize();
    if (velocity >= 0) {
      vel.mult(-1);
    }
    vel.mult(random(velocity));
    int r = floor(random(150, 255));
    int g = 0;
    int b = floor(random(150, 255));
    col = color(r, g, b);
  }
  
  @Override 
    boolean isDead() {
    if (velocity < 0) {
      if (!shape.isInside(pos.x, pos.y)) {
        return true;
      }
    } else {
      if (pos.x > shape.origin().x -10 && pos.x < shape.origin().x +10 && pos.y > shape.origin().y -10 && pos.y < shape.origin().y +10) {
        return true;
      }
    }
    return false;
  }
}
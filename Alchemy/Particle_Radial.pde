class Particle_Radial extends Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector goal;

  float velocity;
  float acceleration;
  float maxVelocity = 5;
  float minVelocity = 0.5;

  PImage sprite;
  Shape shape;
  color col;

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
    super.acc = new PVector(vel.x*acceleration, vel.y*acceleration);
    super.vel.add(acc);
    super.pos.add(vel);
    super.capVelocity();
  }

  @Override
    void rebirth() {
    if (velocity < 0) {
      super.pos = new PVector(super.shape.origin().x, super.shape.origin().y);
      goal = shape.getSpawn();
    } else {
      super.pos = shape.getSpawn();
      goal = new PVector(super.shape.origin().x, super.shape.origin().y);
    }
    super.vel = new PVector(super.pos.x - goal.x, super.pos.y - goal.y);
    super.vel.normalize();
    if (super.velocity >= 0) {
      super.vel.mult(-1);
    }
    super.vel.mult(random(super.velocity));
    int r = floor(random(150, 255));
    int g = 0;
    int b = floor(random(150, 255));
    super.col = color(r, g, b);
  }
  @Override 
    boolean isDead() {
    if (super.velocity < 0) {
      if (!super.shape.isInside(super.pos.x, super.pos.y)) {
        return true;
      }
    } else {
      if (super.pos.x > super.shape.origin().x -10 && super.pos.x < super.shape.origin().x +10 && super.pos.y > super.shape.origin().y -10 && super.pos.y < super.shape.origin().y +10) {
        return true;
      }
    }
    return false;
  }

}

class Particle_Radial implements Particle {
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
    this.shape = shape;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.sprite = sprite;
    rebirth();
  }

  void update() {
    if (isDead()) {
      rebirth();
    }
    acc = new PVector(vel.x*acceleration, vel.y*acceleration);
    vel.add(acc);
    pos.add(vel);
    capVelocity();
  }

  void render() {
    imageMode(CENTER);
    tint(col);
    image(sprite, pos.x, pos.y, 32, 32);
  }

  void rebirth() {
    if (velocity < 0) {
      pos = new PVector(shape.origin().x, shape.origin().y);
      goal = shape.getSpawn();
    } else {
      pos = shape.getSpawn();
      goal = new PVector(shape.origin().x, shape.origin().y);
    }
    vel = new PVector();
    vel.x = (pos.x - goal.x);
    vel.y = (pos.y - goal.y);
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

  void capVelocity() {
    if (vel.mag() > maxVelocity) {
      vel.setMag(maxVelocity);
    } else if (vel.mag() < minVelocity) {
      vel.setMag(minVelocity);
    }
  }

  PVector pos() {
    return pos;
  }
}

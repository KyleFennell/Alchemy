class Particle_Star implements Particle {
  PVector pos;
  PVector vel;
  float velocity;
  float acceleration;
  float maxVelocity = 3;
  PImage sprite;
  Shape shape;
  color col;

  Particle_Star(Shape shape, float velocity, float acceleration, PImage sprite) {
    this.shape = shape;
    pos = new PVector();
    rebirth();
    this.velocity = velocity;
    this.acceleration = acceleration;
    vel = new PVector((random(1)*2-1)*velocity, (random(1)*2-1)*velocity);
    this.sprite = sprite;
  }

  void update() {
    if (isDead()) {
      rebirth();
    }
    pos.add(vel);
  }

  void render() {
    point(pos.x, pos.y);
  }

  void rebirth() {
    pos = shape.getSpawn();
    vel = new PVector((random(1)*2-1)*velocity, (random(1)*2-1)*velocity);
  }

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
  }

  PVector pos() {
    return pos;
  }
}

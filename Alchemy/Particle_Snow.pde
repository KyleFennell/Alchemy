class Particle_Snow implements Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float velocity;
  float acceleration;
  float maxVelocity = 2;
  PImage sprite;
  Shape shape;
  color col;

  Particle_Snow(Shape shape, float velocity, float acceleration, PImage sprite) {
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
    acc = new PVector((random(1)*2-1)*5*acceleration, acceleration);
    vel.add(acc);
    capVelocity();
    pos.add(vel);
  }

  void render() {
    imageMode(CENTER);
    tint(col);
    image(sprite, pos.x, pos.y, 32, 32);
  }

  void rebirth() {
    pos = shape.getSpawn();
    vel = new PVector((random(1)*2-1)*velocity, -random(1)*velocity);
    acc = new PVector(0, 0);
    int rgval = floor(random(200, 255));
    int r = rgval;
    int g = rgval;
    int b = 255;
    col = color(r, g, b);
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

class Particle_Water implements Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float velocity;
  float acceleration;
  float maxVelocity = 30;
  PImage sprite;
  Shape shape;
  color col;

  Particle_Water(Shape shape, float velocity, float acceleration, PImage sprite) {
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
    vel = new PVector((random(1)*2-1)*velocity, (random(1)*2-1)*velocity);
    acc = new PVector(vel.x+random(-velocity/10, velocity/10), vel.y+random(-velocity/10, velocity/10)).mult(-acceleration);
    int base = (int)random(50, 150);
    int r = floor(base+random(-10, 10));
    int g = floor(base+random(-10, 10));
    int b = floor(random(200, 255));
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

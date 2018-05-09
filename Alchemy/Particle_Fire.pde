class Particle_Fire implements Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float velocity;
  float acceleration;
  float maxVelocity = 3;
  PImage sprite;
  Shape shape;
  color col;

  Particle_Fire(Shape shape, float velocity, float acceleration, PImage sprite) {
    this.shape = shape;
    pos = new PVector();
    rebirth();
    this.velocity = velocity;
    this.acceleration = acceleration;
    vel = new PVector((random(1)*2-1)*velocity, -random(1)*velocity);
    this.sprite = sprite;
  }

  void update() {
    if (!shape.isInside(pos.x, pos.y)) {
      rebirth();
    }
    acc = new PVector((random(1)*2-1)*20*acceleration, -acceleration);
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
    int r = floor(random(150, 255));
    int g = floor(random(0, 100));
    col = color(r, g, 0);
  }

  boolean isDead() {
    if (shape.isInside(pos.x, pos.y)){
      return true;
    }
    return false;
  }

  void capVelocity() {
    if (vel.x > maxVelocity) {
      vel.x = maxVelocity;
    } else if (vel.x < -maxVelocity) {
      vel.x = -maxVelocity;
    }
    //if (vel.y > maxVelocity*3) {
    //  vel.y = maxVelocity*3;
    //} else if (vel.y < -maxVelocity*3) {
    //  vel.y = -maxVelocity*3;
    //}
  }

  PVector pos() {
    return pos;
  }
}

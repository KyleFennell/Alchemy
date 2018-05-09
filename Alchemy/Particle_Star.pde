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
    imageMode(CENTER);
    tint(col);
    image(sprite, pos.x, pos.y, 32, 32);
  }

  void rebirth() {
    pos = shape.getSpawn();
    vel = new PVector((random(1)*2-1)*velocity, (random(1)*2-1)*velocity);
  }

  boolean isDead() {
    if (dist(pos.x, pos.y, shape.origin().x, shape.origin().y) < shape.radius()) {
      return false;
    }
    return true;
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

class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float velocity;
  float acceleration;
  float maxVelocity = 5;
  PImage tex;
  color col;

  Particle(float velocity, float acceleration, PImage tex) {
    pos = new PVector();
    rebirth();
    this.velocity = velocity;
    this.acceleration = acceleration;
    vel = new PVector((random(1)*2-1)*velocity, -random(1)*velocity);
    this.tex = tex;
  }

  void update() {
    if (isDead()) {
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
    image(tex, pos.x, pos.y, 32, 32);
  }

  void rebirth() {
    pos.x = random(width);
    pos.y = height;
    vel = new PVector((random(1)*2-1)*velocity, -random(1)*velocity);
    acc = new PVector(0, 0);
    int r = floor(random(150, 255));
    int g = floor(random(0, 100));
    col = color(r, g, 0);
  }

  boolean isDead() {
    if (pos.x < 0) {
      pos.x = width;
      return true;
    }
    if (pos.y < 0) {
      pos.y = height;
      return true;
    }
    if (pos.x > width) {
      pos.x = 0;
      return true;
    }
    if (pos.y > height) {
      pos.y = 0;
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

  float x() {
    return pos.x;
  }

  float y() {
    return pos.y;
  }
}
